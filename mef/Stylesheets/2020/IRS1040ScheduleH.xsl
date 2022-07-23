<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleHStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1040ScheduleHData" select="$RtnDoc/IRS1040ScheduleH"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040ScheduleHData)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				   <!--Remove this latrer-->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1040ScheduleH"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				    <xsl:if test="not($Print) or $Print=''">
					    <xsl:call-template name="IRS1040ScheduleHStyle"/>
						<xsl:call-template name="AddOnStyle"/>
			        </xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS1040ScheduleH">
					<!--  Begin Header section 1 -->
					<div style="width:187mm;">					
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:26mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								<span class="styFormNumber" style="font-size:12pt;">SCHEDULE H<br/>(Form 1040)</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:auto;">
                                     Household Employment Taxes<br/>
								<span class="styNormalText" style="font-size:8pt;">
                                     (For Social Security, Medicare, Withheld Income, and Federal Unemployment (FUTA) Taxes)<br/>
								</span>
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;">
										<div style="width:100mm;height:5mm;">
											<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/> 
                                             Attach to Form 1040, 1040-SR, 1040-NR, 1040-SS, or 1041.<br/>
											<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/> 
											Go to <i>www.irs.gov/ScheduleH </i>for instructions and the latest information.
                                            
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:26mm;">
							<div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-1971</div>
							<div class="styTY">20<span class="styTYColor">20</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
                                 Attachment<br/>Sequence No. 
                                 <span class="styBoldText" style="font-size:9pt;">44</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:138mm;height:16mm;font-weight:normal;font-size:7pt;">
                            Name of employer<br/><br/>
                            
                            <xsl:choose>
                                                                                        <!-- Name from Form level -->
                                                                                        
                                       <xsl:when test="$Form1040ScheduleHData/HouseholdEmployerNm != '' ">
                                          <span style="text-align:right">
                                                     <xsl:call-template name="PopulateText">
                                                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HouseholdEmployerNm"/>
                                                     </xsl:call-template>
                                                     </span>
                                          </xsl:when>                                                  
                                                                                     <!-- Name from 1040 Return Header-->
                                          <xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
                                                   <xsl:call-template name="PopulateReturnHeaderFiler">
                                                 <xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
                                                 </xsl:call-template>
                                          </xsl:when>
                                                                                     <!-- Name from 1041 Return Header-->
                                          <xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
                                                      <xsl:call-template name="PopulateReturnHeaderFiler">
                                                      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                                                      </xsl:call-template>
                                               <br/>
                                                      <xsl:call-template name="PopulateReturnHeaderFiler">
                                                      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                                                      </xsl:call-template>                                                                                                       
                                          </xsl:when>
                                          <xsl:otherwise> 
                                                  <xsl:call-template name="PopulateReturnHeaderFiler"> 
                                                  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param> 
                                                  </xsl:call-template>
                                             <br/>
                                                   <xsl:call-template name="PopulateReturnHeaderFiler">
                                                   <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                                                   </xsl:call-template>
                                            </xsl:otherwise>                                                                                                
                                       </xsl:choose>
                 <span style="width:3px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Employer Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/EmployerNameControlTxt"/>
							</xsl:call-template>
                 
                                                      
						</div>
						<div class="styEINBox" style="border-style: solid; border-color: black;border-width:0px 0px 1px 0px;width:49mm;height:8mm;font-size:7pt;float:right;padding:1px 0px 0px 0px;">
							<span style="padding-left:5px">Social security number<br/>
							</span>
							<span style="font-weight:normal;width:100%;text-align:center;">
                                 			 <xsl:choose>
                                 			                                     <!-- Name from Form level -->
                                          <xsl:when test="$Form1040ScheduleHData/SSN != ''">
                                                     <xsl:call-template name="PopulateSSN">
                                                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/SSN"/>
                                                     </xsl:call-template>
                                          </xsl:when>
                                                                           <xsl:when test="$RtnHdrData/Filer/PrimarySSN"> 
                                                                                   <xsl:call-template name="PopulateReturnHeaderFiler">
                                                                                   <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                                                                                   </xsl:call-template>
                                                                           </xsl:when>				
							                                                <xsl:otherwise>
																					<xsl:call-template name="PopulateSSN">
									                                                 <xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/SSN"/>
								                                                    </xsl:call-template>																																			
																			</xsl:otherwise>
												</xsl:choose>							
								<!--<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/SSN"/>
								</xsl:call-template>-->
							</span>
						</div>
						<div class="styEINBox" style="width:49mm;height:8mm;font-size:7pt;padding-top:1px;">
							<span style="padding-left:5px">Employer identification number<br/></span>
							<span style="font-weight:normal;padding-left:5px;width:100%;text-align:center;">
							
							
			                                      				<xsl:choose>
                                                                               <xsl:when test="$RtnHdrData/Filer/EIN">
                                                                                  <xsl:call-template name="PopulateReturnHeaderFiler"> 
                                                                                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                                                                                  </xsl:call-template>
                                                                           </xsl:when>
                                                                          <xsl:otherwise>
																		<xsl:choose>
									<xsl:when test="$Form1040ScheduleHData/EmployerEIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/EmployerEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/AppliedForEINReasonCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
																		
									                                   </xsl:otherwise>	
                                                                    
                                                              </xsl:choose>

                             
                             <!--<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/EIN">
										<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
										<xsl:with-param name="BackupName">$RtnHdrDataFilerEIN</xsl:with-param>
									</xsl:call-template>
									</xsl:when>
								   <xsl:otherwise>
										 <xsl:call-template name="PopulateText">
											    <xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/AppliedForEINReasonCd"/>
										       </xsl:call-template>
									</xsl:otherwise>
					</xsl:choose> 	-->						
							
                           <!-- <xsl:choose>
								 <xsl:when test="$RtnHdrData/ReturnTypeCd='1041'">
									   <xsl:call-template name="PopulateEIN">
								       <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
								       <xsl:with-param name="BackupName">$RtnHdrDataFilerEIN</xsl:with-param>
							           </xsl:call-template>																					
							     </xsl:when>
							     <xsl:otherwise>
										<xsl:choose>
	                                       <xsl:when test="$Form1040ScheduleHData/EmployerEIN">
										          <xsl:call-template name="PopulateEIN">
											      <xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/EmployerEIN"/>
										          </xsl:call-template>
									       </xsl:when>
									      <xsl:otherwise>
										        <xsl:call-template name="PopulateText">
											    <xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/AppliedForEINReasonCd"/>
										       </xsl:call-template>
									      </xsl:otherwise>
								</xsl:choose>			
								 </xsl:otherwise>
							</xsl:choose>-->
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;height:69mm;">
						<div style="width:187mm;height:auto;padding-top:4mm;">Calendar year taxpayers having no household employees in 2020 don't have to complete this form for 2020.</div>
						<!-- Spacer -->
						<span style="width:2px;height:4mm;"/>
						<!-- A ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem" style="height:20mm;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">A</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:175mm;height:auto;">
								<!-- Description -->
                                Did you pay <span class="styBoldText">any one</span> household employee cash wages of $2,200 or more in 2020? (If any household employee was your<br/>
                               spouse, your child under age 21, your parent, or anyone under age 18, see the line A instructions before you<br/>
                answer this question.)

								<!-- Checkboxes -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:170mm;padding-left:0px;float:none;height:4mm;">
									<!-- Yes -->
                                    <div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;height:4mm;">
										<div style="height:4mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="HouseholdEmployeePaidCashWageOverLimit Yes" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOverLmtCYInd</xsl:with-param>
												</xsl:call-template>
											</input>
									    </div>
									    <label style="height:4mm;">			
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOverLmtCYInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">Yes.</span> Skip lines B and C and go to line 1. 
										</label>											
									</div>
									<!-- No -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;height:4mm;">
										<div style="height:4mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="HouseholdEmployeePaidCashWageOverLimit No" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOverLmtCYInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>						
										<label  style="height:4mm;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOverLmtCYInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">No.</span> Go to line B.
                                        </label>
									</div>
								</div>
							</div>
						</div>
						<!-- B ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem"  style="height:16mm;padding-top:1mm;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">B</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:175mm;height:auto;">
								<!-- Description -->
                                Did you withhold federal income tax during 2020 for any household employee?
                              
								<!-- Checkboxes -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:170mm;padding-left:0px;float:none;height:4mm;">
									<!-- Yes -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;height:4mm;">
										<span style="padding-bottom:0mm;height:4mm;" >
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="HouseholdEmployeeFederalIncomeTaxWithheld Yes" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplFedIncmTaxWithheldInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label style="height:4mm;">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplFedIncmTaxWithheldInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">Yes.</span> Skip line C and go to line 7.
                                        </label>
									</div>
									<!-- No -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;height:auto;">
										<span style="padding-bottom:0mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="HouseholdEmployeeFederalIncomeTaxWithheld No" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplFedIncmTaxWithheldInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label  style="height:4mm;padding-bottom:0.8mm;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplFedIncmTaxWithheldInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">No.</span> Go to line C.
                                        </label>
									</div>
								</div>
							</div>
						</div>
						<!-- C ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem"  style="height:16mm;padding-top:1mm;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">C</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:175mm;height:auto;">
								<!-- Description -->
                               Did you pay <span class="styBoldText">total</span> cash wages of $1,000 or more in <span class="styBoldText">any</span> calendar <span class="styBoldText">quarter</span> of 2019 or 2020 to <span class="styBoldText">all</span> household employees?<br/>
                (<span class="styBoldText">Don't</span> count cash wages paid in 2019 or 2020 to your spouse, your child under age 21, or your parent.)
                            
								<!-- Checkboxes -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:170mm;padding-left:0px;float:none;">
									<!-- No -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;">
										<span  style="height:4mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="HouseholdEmployeePaidCashWagesOverLimit No" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOvrLmtQtrInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label style="height:4mm;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOvrLmtQtrInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">No. Stop.</span> Don't file this schedule.
                                        </label>
									</div>
									<!-- Yes -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;">
										<span  style="padding-bottom:0mm;height:4mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="HouseholdEmployeePaidCashWagesOverLimit Yes" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOvrLmtQtrInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label style="height:4mm;padding-bottom:0.8mm;">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOvrLmtQtrInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">Yes.</span> Skip lines 1-9 and go to line 10.
										</label>
									</div>
								</div>
								<br/>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART I -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<div       style="width:187mm;height:4.5mm;border-bottom-width:2px;border-color:black" class="styBB">
						<!-- Top Spacer -->
						
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4.5mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;">
                           Social Security, Medicare, and Federal Income Taxes
                        </div>
						<!-- Bottom Spacer -->
						<span style="width:100%;height:1mm;"/>
					</div>
					<!-- Body -->
					<div style="width:187mm;" class="styTBB">
						<!-- (1a) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">1a</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:98mm;">
                               <span style="float:left;">Total cash wages subject to social security tax</span>
                               <!--Dotted Line-->
                               <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
							<!-- Box with content -->
                             <div class="styLNRightNumBox" style="height:auto;">1a</div>
							<div class="styLNAmountBox" style="height:auto;width:33mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/SocialSecurityTaxCashWagesAmt"/>
								</xsl:call-template>
							</div>
							<!-- Grey Box -->
							<span>							
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
							</span>
						</div>
						<!-- (1b) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">b</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:98mm;">
                               <span style="float:left;">Qualified sick and family wages included on line 1a</span>
                               <!--Dotted Line-->
                               <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
							<!-- Box with content -->
                             <div class="styLNRightNumBox" style="height:auto;">1b</div>
							<div class="styLNAmountBox" style="height:auto;width:33mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/QlfySickFMLWagesSubjSSTAmt"/>
								</xsl:call-template>
							</div>
							<!-- Grey Box -->
							<span>							
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
							</span>
						</div>
						<!-- (2a) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">2a</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm;">
                                <span style="float:left;">Social security tax. Multiply line 1a by 12.4% (0.124)</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
                            <div class="styLNRightNumBox" style="height:4.5mm;">2a</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/SocialSecurityTaxAmt"/>
								</xsl:call-template>
							</div>							
						</div>
						<!-- (2b) ////////////////////////////////////////////////////////////-->

						<div class="styIRS1040ScheduleHLineItem" style="height:8mm;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">b</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm; height:8mm; padding-top:1mmF8c">
                                <span style="float:none; display:inline;">Employer share of social security tax on qualified sick and family leave wages Multiply line 1b by 6.2% <br/>(0.062))</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right; display:inline;">...............</span>
							</div>
                            <div class="styLNRightNumBox" style="height:8mm; padding-top:4mm;">2b</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:8mm;padding-right:3px; padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/CalcEmplrSSTQlfySickFMLWgsAmt"/>
								</xsl:call-template>
							</div>							
						</div>
						<!-- (2c) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">c</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm;">
                                <span style="float:left;">Total social security tax. Subtract line 2b from line 2a</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
                            <div class="styLNRightNumBox" style="height:4.5mm;">2c</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TotalSocialSecurityTaxAmt"/>
								</xsl:call-template>
							</div>							
						</div>
						<!-- (3) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">3</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:98mm;">
                                 <span style="float:left;">Total cash wages subject to Medicare tax</span>
                                 <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>

							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
                            <!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/MedicareTaxCashWagesAmt"/>
								</xsl:call-template>
							</div>
							<!-- Grey Box -->
							<span>						
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
							</span>
						</div>
						<!-- (4) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">4</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm;">
                                <span style="float:left;">Medicare tax. Multiply line 3 by 2.9% (0.029)</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/MedicareTaxWithheldAmt"/>
								</xsl:call-template>
							</div>							
						</div>		
						<!-- (5) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:4mm;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">5</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:98mm;">
                                <span style="float:left;">Total cash wages subject to Additional Medicare Tax withholding</span>
                                <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
                            </div>
							<div class="styLNRightNumBox" style="height:4mm;">5</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4mm;width:33mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TotMedcrTaxCashWagesAddnlWhAmt"/>
								</xsl:call-template>
							</div>
							<!-- Grey Box -->
							<span>					
								<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;float:right;"/>
								<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
							</span>
						</div>
						<!-- (6) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">6</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm;">
                                <span style="float:left;">Additional Medicare Tax withholding. Multiply line 5 by 0.9% (0.009)</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/AddnlMedicareTaxWithholdingAmt"/>
								</xsl:call-template>
							</div>							
						</div>
						<!-- (7) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">7</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm;">
                                <span style="float:left;">Federal income tax withheld, if any</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/FederalIncomeTaxWithheldAmt"/>
								</xsl:call-template>
							</div>							
						</div>
						<!-- (8a) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">8a</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:122mm;">
								<span class="styBoldText">Total social security, Medicare, and federal income taxes.</span> Add lines 2c, 4, 6, and 7
                                <xsl:if test="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtAmt">
									<span style="width:3px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Household Employee State Disability Payment Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtCd">
									<span style="width:3px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Household Employee State Disability Payment Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtCd"/>
									</xsl:call-template>
								</xsl:if>
							</div>
							 <!--Dotted Line-->
                            <span class="styDotLn" style="width:17mm;padding-right:1mm;">...</span>
							<div class="styLNRightNumBox" style="height:4.5mm;">8a</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TotSocSecMedcrAndFedIncmTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (8b) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">b</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:122mm;">
								Nonrefundable portion of credit for qualified sick and family leave wages from Worksheet 3
							</div>
							 <!--Dotted Line-->
                            <span class="styDotLn" style="width:17mm;padding-right:1mm;">...</span>
							<div class="styLNRightNumBox" style="height:4.5mm;">8b</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/NrfdblCrQlfySLFMLWagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (8c) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem" style="height:auto; height:8mm">
							<div class="styIRS1040ScheduleHLNLeftNumBox">c</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm;">
								Total social security, Medicare, and federal income taxes after nonrefundable credit. Subtract line 8b from line 8a
								<span class="styDotLn" style="padding-left:2mm; display:inline; float:none">..............................</span>
							</div>
							 <!--Dotted Line-->
                            
							<div class="styLNRightNumBox" style="height:8mm; padding-top:4mm">8c</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:8mm;padding-right:3px; padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TotSSMedcrFedITAftrNrfdblCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (8d) ////////////////////////////////////////////////////////////-->

						<div class="styIRS1040ScheduleHLineItem" style="height:8mm;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">d</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm;">
								Maximum amount of the employer share of social security tax that can be deferred. Subtract line 2b from 50% of line 2a. If you enter an amount here, see the instructions for line 12e of Schedule 3 (Form 1040).
							
							</div>
							 <!--Dotted Line-->
                            
							<div class="styLNRightNumBox" style="height:8mm; padding-top:4mm">8d</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:8mm;padding-right:3px; padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/MaxEmplrShareSSTDeferredAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (8e) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">e</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:122mm;">
								Refundable portion of credit for qualified sick and family leave wages from Worksheet 3
							</div>
							 <!--Dotted Line-->
                            <span class="styDotLn" style="width:17mm; padding-right:1mm;">...</span>
							<div class="styLNRightNumBox" style="height:4.5mm;">8e</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RfdblCrQlfySLFMLWagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (8f) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">f</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm; ">
								Qualified sick leave wages
							
							 <!--Dotted Line-->
                            <span class="styDotLn" style="display:inline; float:none; padding-left:2mm">........................</span></div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8f</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/SocialSecurityQlfyPdSLWageAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (8g) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">g</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm;">
								Qualified health plan expenses allocable to qualified sick leave wages
							
							 <!--Dotted Line-->
                            <span class="styDotLn" style="display:inline; float:none; padding-left:2mm">..........</span></div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8g</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/QHPExpnssSSQlfyPdSLWageAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (8h) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">h</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm;">
								Qualified family leave wages
							
							 <!--Dotted Line-->
                            <span class="styDotLn" style="display:inline; float:none; padding-left:2mm">.......................</span></div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8h</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/SocialSecurityQlfyPdFMLWageAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (8i) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">i</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:139mm;">
								Qualified health plan expenses allocable to qualified family leave wages
							
							 <!--Dotted Line-->
                            <span class="styDotLn" style="display:inline; float:none; padding-left:2mm">..........</span></div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8i</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/QHPExpnssSSQlfyPdFMLWageAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem" style="height:30mm;padding-top:4.5mm;">
							<div class="styIRS1040ScheduleHLNLeftNumBox">9</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:175mm;height:auto;">
								<!-- Description -->
                                Did you pay <span class="styBoldText">total</span> cash wages of $1,000 or more in <span class="styBoldText">any</span> calendar <span class="styBoldText">quarter</span> of 2019 or 2020 to <span class="styBoldText">all</span> household employees?<br/>
                (<span class="styBoldText">Don't</span> count cash wages paid in 2019 or 2020 to your spouse, your child under age 21, or your parent.)
                                <br/>
								<br/>
								<!-- Checkboxes -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:170mm;padding-left:0px;float:none;">
									<!-- No -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;height:8mm;">
										<div style="height:4mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="HouseholdEmployeePaidTotalCashWagesAnyQuarter No" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdTotCashWageAnyQtrInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<label style="height:4mm;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdTotCashWageAnyQtrInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">No. Stop.</span> Include the amount from line 8c above on Schedule 2 (Form 1040), line 7a. Include the amount, if any, from <br/><span style="padding-left:7mm;">line 8e, on Schedule 3 (Form 1040), line 12b. If you're not required to file Form 1040, see the line 9 instructions.</span>
                                        </label>
									</div>
									<!-- Yes -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;height:4mm;">
										<span style="height:4mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="HouseholdEmployeePaidTotalCashWagesAnyQuarter Yes" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdTotCashWageAnyQtrInd</xsl:with-param>
												</xsl:call-template>
											</input>										
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdTotCashWageAnyQtrInd</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;"/>
												<span class="styBoldText">Yes.</span> Go to line 10.
											</label>
                                        </span>
									</div>
								</div>
								<br/>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->							
					<div  style="width:187mm;padding-top:1mm;clear:both;font-size:6.5pt;page-break-after:always;display:block;">
						<div style="float:left;">
								<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see the instructions.</span>
								<span style="text-align:center;width:30mm;">Cat. No. 12187K</span>
					    </div>
					    <div style="float:right;">
								<span class="styBoldText">Schedule H (Form 1040) 2020</span>
					    </div>
					</div>
					</div>	
                    <p class="pageEnd"    style="page-break-after:always;display:block;"/>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div style="width:187mm">					
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Schedule H (Form 1040) 2020</div>
						<div style="float:right;">
                            Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART II -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;">Federal Unemployment (FUTA) Tax</div>
					</div>
					<!-- Body -->
					<div style="width:187mm;height:auto" class="styBB" >
						<div style="width:187mm;" class="styNBB">
							<!-- Yes/No Headers ////////////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem" style="width:17.0mm;float:right;padding:0px 0px 0px 0px" > 
							    <div class="styLNRightNumBoxNBB" style="height:4.5mm; width:8.0mm;float:left;">Yes</div>
								<div class="styLNRightNumBoxNBB" style="height:4.5mm; width:8.0mm;float:left;">No</div>
							</div>
							<!-- (10) ////////////////////////////////////////////////////////////-->
							<div style="height:auto;">
								<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">10</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:148mm; height:auto;">
                                     Did you pay unemployment contributions to only one state? (If you paid contributions to a credit reduction
                                     <span style="float:left;">state, see instructions and check "<b>No.</b>")</span>
                                     <!--Dotted Line-->
									 <span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:25mm;float:right;padding:0px 0px 0px 0px;">
												<div class="styLNRightNumBox" style="height:100%;float:left; border-width:0px 0px 1px 0px"/>						
												<div class="styLNRightNumBox" style="height:100%;float:left;"/>
									<div class="styLNRightNumBox" style="height:100%;float:left;"/>

								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:25mm;float:right;padding:0px 0px 0px 0px;height:auto;">
									<!-- Number Box -->									
									<div class="styLNRightNumBox" style="height:5mm;float:left;padding-top:1.2mm;">10</div>
									<!-- Yes Checkbox -->
									<div class="styLNRightNumBox" style="height:5mm;float:left;padding-top:0mm;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="UnemploymentPaidOnlyOneState Yes" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplPaidOnlyOneStateInd
												</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
												  <xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplPaidOnlyOneStateInd
												</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
									<!-- No Checkbox -->
									<div class="styLNRightNumBox" style="height:5mm;float:left; padding-top:0mm;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="UnemploymentPaidOnlyOneState No" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplPaidOnlyOneStateInd
													</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplPaidOnlyOneStateInd
											</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
									
								</div>
							</div>
							<!-- (11) ////////////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
								<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;height:5mm;">11</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:153.5mm;height:5mm;">
								  Did you pay all state unemployment contributions for 2020 by April 15, 2021? Fiscal year filers see instructions
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:25mm;float:right;padding:0px 0px 0px 0px;">
								<!-- Number Box -->
									<div class="styLNRightNumBox" style="height:5mm;float:left;padding-top:1.2mm;">11</div>
								<!-- Yes Checkbox -->									
									<div class="styLNRightNumBox" style="height:5mm;float:left;padding-top:0mm;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="PayAllStateUnemploymentContributions Yes" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataPayAllStateUnemplContriInd
												</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataPayAllStateUnemplContriInd
											</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>									
								<!-- No Checkbox -->
									<div class="styLNRightNumBox" style="height:5mm;float:left;padding-top:0mm;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="PayAllStateUnemploymentContributions No" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataPayAllStateUnemplContriInd
												</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataPayAllStateUnemplContriInd
											</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
								</div>
							</div>
							<!-- (12) ////////////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem">
								<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;height:5mm;">12</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:150mm;height:5mm;">
                                    <span style="float:left;">Were all wages that are taxable for FUTA tax also taxable for your state's unemployment tax?</span>
                                     <!--Dotted Line-->
									 <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:25mm;float:right;padding:0px 0px 0px 0px;">
									<!-- Number Box -->
									<div class="styLNRightNumBox" style="height:5mm;float:left;padding-top:1.2mm;">12</div>
									<!-- Yes Checkbox -->
									<div class="styLNRightNumBox" style="height:5mm;float:left;padding-top:0mm;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="TaxableFUTAWagesAlsoTaxableUnemployment Yes" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataTxblFUTAWagesAlsoTxblUnemplInd
												</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataTxblFUTAWagesAlsoTxblUnemplInd
											</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
									<!-- No Checkbox -->
									<div class="styLNRightNumBox" style="height:5mm;float:left;padding-top:0mm;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="TaxableFUTAWagesAlsoTaxableUnemployment No" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataTxblFUTAWagesAlsoTxblUnemplInd
												</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataTxblFUTAWagesAlsoTxblUnemplInd
											</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>

								</div>
							</div>
							<!-- Spacer ///////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem">
								<br/>
								<br/>
							</div>
							<!-- Instructions ////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem" style="height:auto;">
								<span class="styBoldText">Next:</span> If you checked the <span class="styBoldText">"Yes"</span> box on <span class="styBoldText">all</span> the lines above, complete Section A.<br/>
								<span style="width:31px;"/>If you checked the <span class="styBoldText">"No"</span> box on <span class="styBoldText">any</span> of the lines above, skip Section A and complete Section B.
                        </div>
						</div>
					</div>
					<!-- Section A -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<div class="styIRS1040ScheduleHLineItem" style="text-align:center;font-size:8pt;height:auto;">
							<span class="styBoldText">Section A</span>
						</div>
					</div>
					<!-- Body -->
					<div style="width:187mm;" class="styBB">
						<!-- (13) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">13</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:90mm;">
								Name of the state where you paid unemployment contributions
								<span style="width:3px;"/>
								<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/>
							</div>
							<!-- Name of State text field -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:40mm;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/StateCd"/>
								</xsl:call-template>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
							</div>
						</div>
						<!-- Empty Amount Box /////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:4.5mm;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
							</div>
						</div>
				       <!-- Empty Amount Box /////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
						<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:4.5mm;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
							</div>
						</div>
						<!-- (14) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">14</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:97mm;">
                                 Contributions paid to your state unemployment fund
                                 <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4.5mm;padding:0.75mm 0mm 0mm 0pmm;">14</div>
                            <div class="styLNAmountBox" style="height:100%;width:33mm;padding:0px 2px 0px 0px;">
									<xsl:choose>
										<xsl:when test="$Form1040ScheduleHData/UnemplFundSingleStateGroup/ContriPaidToStateUnemplFundAmt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/ContriPaidToStateUnemplFundAmt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$Form1040ScheduleHData/UnemplFundSingleStateGroup/UnemploymentFundZeroRateCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/UnemploymentFundZeroRateCd"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
							</div>
							<span>
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:4.5mm;width:33mm;border-bottom-width:0px;"/>
							</span>
					<!--		--><!-- Amount Box --><!--
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:83mm;float:right;padding:0px 0px 0px 0px;background-color:red;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNAmountBox" style="height:100%;width:33mm;float:right;padding:0px 2px 0px 0px;">
									<xsl:choose>
										<xsl:when test="$Form1040ScheduleHData/UnemplFundSingleStateGroup/ContriPaidToStateUnemplFundAmt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/ContriPaidToStateUnemplFundAmt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$Form1040ScheduleHData/UnemplFundSingleStateGroup/UnemploymentFundZeroRateCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/UnemploymentFundZeroRateCd"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;float:right;padding:0.75mm 0mm 0mm 0pmm;">14</div>
							</div>-->
						</div>
						<!-- (15) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">15</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:138mm;">
                                    <span style="float:left;">Total cash wages subject to FUTA tax</span>
                                    <!--Dotted Line-->
									 <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:100%;padding:0.5mm 0mm 0mm 0mm;">15</div>
							<div class="styLNAmountBox" style="height:100%;width:33mm;padding:0px 0px 0px 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/TotalCashWagesSubjFUTATaxAmt"/>
								</xsl:call-template>
							</div>
<!--							--><!-- Amount Box --><!--
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0mm 0 0 0;">
							
							
							</div>-->
						</div>
						<!-- (16) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem" style="height:4.5mm;">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">16</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:138mm;">
							 <span style="float:left;"><span class="styBoldText">FUTA tax.</span> Multiply line 15 by 0.6% (0.006). Enter the result here, skip Section B, and go to line 25</span>
                               <!--Dotted Line-->
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:100%;">16</div>
							<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/FUTATaxAmt"/>
								</xsl:call-template>
							</div>
<!--							--><!-- Amount Box --><!--
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0mm 0mm 0mm 0mm;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/FUTATaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:100%;float:right;">16</div>
							</div>-->
						</div>
					</div>
					<!-- Section B -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<div class="styIRS1040ScheduleHLineItem" style="text-align:center;font-size:8pt;">
							<span class="styBoldText">Section B</span>
						</div>
					</div>
					<!-- Body -->
					<div style="width:187mm;" class="styBB">		
						<div style="width:187mm;height:auto;" class="styBB">
							<!-- (17) ////////////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem">
								<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">17</div>
								<!-- Description -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:160mm;">
								  Complete all columns below that apply (if you need more space, see instructions):
								</div>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<div class="styGenericDiv" style="width:3.2mm;float:right;">
									<!-- button display logic -->
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup"/>
										<xsl:with-param name="containerHeight" select="2"/>
										<xsl:with-param name="containerID" select=" 'UnemploymentStateTaxGroupDiv' "/>
									</xsl:call-template>
									<!-- end button display logic -->
								</div>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							</div>
						</div>
						<div class="styTableContainerNBB" id="UnemploymentStateTaxGroupDiv" style="width:187mm;height:auto;">
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<!--                          Table Start                                 -->
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<xsl:call-template name="SetInitialState"/>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<table class="styTable" cellspacing="0" style="width:100%;height:100%;">
								<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
								<thead class="styTableThead">
									<tr style="vertical-align:top;">
										<!-- (a) //////////////////////////////////// -->
										<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:25mm;" scope="col">
											<span class="styBoldText">(a)</span>
											<span class="styNormalText">
											     Name of state
											</span>
										</th>
										<!-- (b) //////////////////////////////////// -->
										<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:50mm;" scope="col">
											<span class="styBoldText">(b)</span><br/>
											<span class="styNormalText">
												Taxable wages (as<br/>defined in state act)
											</span>
										</th>
										<!-- (c) //////////////////////////////////// -->
										<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:20%;padding:0px 0px 0px 0px;" scope="col">
											<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:12mm;">
												<span class="styBoldText">(c)</span><br/>
												<span class="styNormalText">
													State experience rate <br/>period
						                        </span>
											</div>
											<br/>
											<span class="styNormalText;">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:auto;margin-bottom:-0.6mm;">
													<div class="styIRS1040ScheduleHLineItem" style="padding:1mm 0mm 0mm 0mm;float:left;width:49.8%;border-width:1px 0px 0px 0px;border-color:black;border-style:solid;height:4.2mm;">
														<span class="styNormalText" style="padding-right:25mm;padding-left:5mm;">From</span>
													</div>
													<div class="styIRS1040ScheduleHLineItem"   style="padding:1mm 0mm 0mm 0mm;float:right;width:50%;border-width:1px 0px 0px 1px;border-color:black;border-style:solid;height:4.2mm;">
														<span class="styNormalText">To</span>
													</div>
												</div>
											</span>
										</th>
										<!-- (d) //////////////////////////////////// -->
										<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:7%;" scope="col">
											<span class="styBoldText">(d)</span>
											<span class="styNormalText">
												State<br/>experience<br/>rate
											</span>
										</th>
										<!-- (e) //////////////////////////////////// -->
										<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
											<span class="styBoldText">(e)</span>
											<span class="styNormalText">
												Multiply col. (b) by 0.054
											</span>
										</th>
										<!-- (f) //////////////////////////////////// -->
										<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
											<span class="styBoldText">(f)</span>
											<span class="styNormalText">
												Multiply col. (b) by col. (d)
											</span>
										</th>
										<!-- (g) //////////////////////////////////// -->
										<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
											<span class="styBoldText">(g)</span>
											<span class="styNormalText">
												Subtract col. (f) from col. (e). If zero or less, enter -0-.
											</span>
										</th>
										<!-- (h) //////////////////////////////////// -->
										<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
											<span class="styBoldText">(h)</span>
											<span class="styNormalText">
												Contributions paid to state unemployment fund
											</span>
										</th>
									</tr>
								</thead>
								<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
								<tfoot/>
								<tbody>
									<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
									<xsl:for-each select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup">
										<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
										<!--container height (4), execute-->
										<xsl:if test="($Print != $Separated) or (count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &lt;=2)">
											<tr style="font-size: 7pt;">
												<!-- (a) //////////////////////////////////// -->
												<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StateCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<!-- (b) //////////////////////////////////// -->
												<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TxblWagesPaidStUnemplFundAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<!-- (c) //////////////////////////////////// -->
												<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:center;padding:0px 0px 0px 0px;">
													<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:3mm;">
														<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:50%;text-align:center;border-width:0px 0px 0px 0px;border-style:solid;border-color:black;height:3.2mm;">
															<xsl:call-template name="PopulateMonthDayYear">
																<xsl:with-param name="TargetNode" select="UnemplStateExprncRateFromDt"/>
															</xsl:call-template>
														</div>
														<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:49%;text-align:center;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;height:3.2mm;">
															<xsl:call-template name="PopulateMonthDayYear">
																<xsl:with-param name="TargetNode" select="UnemplStateExprncRateToDt"/>
															</xsl:call-template>
														</div>
													</div>
												</td>
												<!-- (d) //////////////////////////////////// -->
												<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="UnemploymentStateExperienceRt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<!-- (e) //////////////////////////////////// -->
												<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="UnemploymentTaxCrAt54RateAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<!-- (f) //////////////////////////////////// -->
												<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="UnemploymentTaxCrAtStateRtAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<!-- (g) //////////////////////////////////// -->
												<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="UnemploymentAdditionalTaxCrAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<!-- (h) //////////////////////////////////// -->
												<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ContriPaidToStateUnemplFundAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<!-- Table Filler Rows -->
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &lt; 1 or ((count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &gt;2) and ($Print = $Separated))">
										<tr>
											<!-- (a) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
												<xsl:if test="((count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &gt;2) and ($Print = $Separated))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<!-- (b) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:14%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (c) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:20%;font-size: 6pt; text-align:center;padding:0px 0px 0px 0px;height:100%;">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:100%;margin-top:0px;margin-bottom:0px;">
													<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:50%;text-align:center;border-width:0px 0px 0px 0px;height:8mm;">
														<span style="width:4px"/>
													</div>
													<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:49%;text-align:center;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;height:8mm;">
														<span style="width:4px"/>
													</div>
												</div>
											</td>
											<!-- (d) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (e) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (f) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (g) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (h) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &lt; 2 or ((count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &gt;2) and ($Print = $Separated))">
										<tr>
											<!-- (a) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (b) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:14%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (c) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:20%;font-size: 6pt; text-align:center;padding:0px 0px 0px 0px;height:100%;">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:100%;">
													<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:50%;text-align:center;border-width:0px 0px 0px 0px;border-style:solid;border-color:black;height:4mm;">
														<span style="width:4px"/>
													</div>
													<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:49%;text-align:center;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;height:4mm;">
														<span style="width:4px"/>
													</div>
												</div>
											</td>
											<!-- (d) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (e) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (f) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (g) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
											<!-- (h) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
								</tbody>
							</table>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<!--                          Table End                                     -->
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						</div>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup"/>
							<xsl:with-param name="containerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'UnemploymentStateTaxGroupDiv' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
				    </div>
					<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					<div class="styBB" style="border-bottom:1px;width:187mm;" >
						<!-- Empty Amount Box /////////////////////////////////////-->
						<div style="height:auto;width:187mm;">
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:60mm;height:auto;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:24.5mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNAmountBoxNBB" style="height:100%;width:24.3mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:100%;float:right;padding:0px 0px 0px 0px;"/>
							</div>
						</div>
						<!-- (18) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem" style="width:187mm;height:8mm;margin-top:-3.0mm;">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;padding-top:4mm;">18</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:120mm;padding-top:4mm;">
                                <span style="float:left;">Totals</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:57mm;height:8mm;float:right;padding:0px 0px 0px 0px;">
							    <div class="styLNRightNumBox" style="height:8mm;padding:4mm 0px 0px 0px;">18</div>
								<div class="styLNAmountBox" style="width:24.5mm;height:8mm;padding:4mm 2px 0px 0px;font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/TotalUnemplAdditionalTaxCrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:24mm;height:8mm;padding:4mm 2px 0px 0px;font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/TotalContriStateUnemplFundAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (19) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">19</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:97mm;">
                                <span style="float:left;"> Add columns (g) and (h) of line 18</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:100%;padding:0.8mm 0px 0px 0px;">19</div>
							<div class="styLNAmountBox" style="height:100%;width:33mm;padding:0.8mm 2px 0px 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/TentativeFUTACreditAmt"/>
								</xsl:call-template>
							</div>
							<!-- Amount Box -->
							<!--<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:83mm;float:right;padding:0px 0px 0px 0px;">-->
							<!--<span>		-->						
								<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;padding:0px 0px 0px 0px;"/>
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;padding:0px 0px 0px 0px;"/>
                    <!--        </span>-->
							
						<!--	</div>-->
						</div>
						<!-- (20) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">20</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:137mm;">
                                <span style="float:left;">Total cash wages subject to FUTA tax (see the line 15 instructions)</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:41mm;float:right;padding:0px 0px 0px 0px;">
							   <div class="styLNRightNumBox" style="height:100%;padding:0.6mm 0 0 0;">20</div>
								<div class="styLNAmountBox" style="height:100%;width:33mm;padding: 0px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/TotalCashWagesSubjFUTATaxAmt"/>
									</xsl:call-template>
								</div>								
							</div>
						</div>
						<!-- (21) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">21</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:137mm;">
                                <span style="float:left;">Multiply line 20 by 6.0% (0.060) </span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:41mm;float:right;padding:0px 0px 0px 0px;">
							    <div class="styLNRightNumBox" style="height:100%;padding:0.6mm 0mm 0mm 0mm;">21</div>
								<div class="styLNAmountBox" style="height:100%;width:33mm;padding:0.6mm 0px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/GrossFUTATaxCreditAmt"/>
									</xsl:call-template>
								</div>								
							</div>
						</div>
						<!-- (22) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">22</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:97mm;">
                                <span style="float:left;">Multiply line 20 by 5.4% (0.054)</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:82mm;float:right;padding:0px 0px 0px 0px;">
							   <div class="styLNRightNumBox" style="height:100%;padding:0.6mm 0px 0px 0px;">22</div>
							   	<div class="styLNAmountBox" style="height:100%;width:33mm;padding:0.6mm 2px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/FUTATaxCreditMaxAllowedAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;padding:0px 0px 0px 0px;"/>
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;padding:0px 0px 0px 0px;"/>						
							</div>
						</div>
						<!-- (23) ////////////////////////////////////////////////////////////-->
						<div style="height:auto;width:187mm;">
							  <div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">23</div>
							<!-- Description -->
							  <div class="styIRS1040ScheduleHLNDesc" style="width:138mm;height:4mm;">
								     <span style="float:left;">Enter the <b>smaller</b> of line 19 or line 22</span>
								      <!--Dotted Line-->
								     <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							   </div>
							   <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							     	<div class="styLNAmountBoxNBB" style="height:4.5mm;width:31mm;"/>
							   <div style="width:137mm;padding-left:11.5mm;">
							   <span style="float:left;">(If you paid state unemployment contributions late or you're in a credit reduction state, see  instructions and check here)
								                                             <!--Dotted Line-->
								       <span class="styDotLn" style="float:right;">...................</span> </span>                             
							    </div>
							<input type="checkbox" alt="UnemplFundMultiStateGroupCreditReductionStateWrkshtInd" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/CreditReductionStateWrkshtInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplFundMultiStateGroupCreditReductionStateWrkshtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/CreditReductionStateWrkshtInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplFundMultiStateGroupCreditReductionStateWrkshtInd</xsl:with-param>
									</xsl:call-template>
								</label>
								  <!-- Amount Box -->
								  <div class="styIRS1040ScheduleHLNDesc" style="height:6.5mm;width:41mm;float:right;padding:0px 0px 0px 0px;">
										 <div class="styLNRightNumBox" style="height:6.5mm;padding-top:2mm">23</div>	
										 <div class="styLNAmountBox" style="height:6.5mm;width:33mm;float:right;padding:0.6mm 0px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemplSmallerTaxAdjustmentAmt"/>
									</xsl:call-template>
								</div>
								  </div>                                                                             
						</div>
						<!-- (24) ////////////////////////////////////////////////////////////-->
						<div  class="styIRS1040ScheduleHLineItem" style="border-style: solid black;border-color:black;height:auto;border-bottom-width:1px;">
                               <div class="styIRS1040ScheduleHLineItem">
							        <div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">24</div>
													<!-- Description -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:137mm;height:auto;">
									<span style="float:left;"><span class="styBoldText">FUTA tax.</span> Subtract line 23 from line 21. Enter the result here and go to line 25</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</div>				
								<!-- Amount Box -->
								<div class="styIRS1040ScheduleHLNDesc" style="height:4.5mm;width:41mm;float:right;padding:0px 0px 0px 0px;">
									  <div class="styLNRightNumBoxNBB" style="height:4.5mm;padding:1mm 0 0 0;">24</div>
									  <div class="styLNAmountBoxNBB" style="height:4.5mm;width:33mm;padding:1mm 0px 0px 0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/FUTATaxAmt"/>
										</xsl:call-template>
									</div>	  
								</div>			                                     
					       </div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART III -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:auto;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;height:auto;">
                             Total Household Employment Taxes
                        </div>
					</div>
					<!-- Body -->
					<div style="width:187mm;" class="styBB">
						<!-- (25) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">25</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:137mm;">
                                <span style="float:left;">Enter the amount from line 8c. If you checked the " <b>Yes</b>" box on line C of page 1, enter -0-</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:41mm;float:right;padding:0px;">    
							    <div class="styLNRightNumBox" style="height:100%;padding:1.2mm 0 0 0;">25</div>
								<div class="styLNAmountBox" style="height:100%;width:33mm;padding:1.2mm 0mm 0mm 0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TotalTaxHouseholdEmplCalcAmt"/>
									</xsl:call-template>
								</div>								
							</div>
						</div>
						<!-- (26) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">26</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:137mm;">
                                <span style="float:left;">Add line 16 (or line 24) and line 25</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:41mm;float:right;padding:.0 0 0 0;">
							    <div class="styLNRightNumBox" style="height:100%;padding:1.2mm 0 0 0;">26</div>
								<div class="styLNAmountBox" style="height:100%;width:33mm;padding:1.2mm 0 0 0;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/CombinedFUTATaxPlusNetTaxesAmt"/>
									</xsl:call-template>
								</div>								
							</div>
						</div>
						<!-- (27) ////////////////////////////////////////////////////////////-->
						<div style="height:15.5mm;">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">27</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:175mm;">
								<!-- Description -->
                                Are you required to file Form 1040?
                                <br/>
								<!-- Checkboxes -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:170mm;padding-left:0px;float:none;">
									<!-- Yes -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;">
										<div style="height:4mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
											</xsl:call-template>
											<input type="checkbox" alt="RequiredToFileF1040 Yes" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataRequiredToFileF1040Cd</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<label style="height:7mm;padding-bottom:2mm;">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataRequiredToFileF1040Cd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText" style="">Yes. Stop.</span> Include the amount from line 26 above on Schedule 2 (Form 1040), line 7a. 
											Include the amount, if any, from <br/><span style="padding-left:7mm"/>line 8e, on Schedule 3 (Form 1040), line 12b. <span class="styBoldText">Don't</span> complete Part IV. below.
                                        </label>
									</div>
									<!-- No -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;;padding-top:3mm">
										<div style="height:4mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
											</xsl:call-template>
											<input type="checkbox" alt="RequiredToFileF1040 No" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataRequiredToFileF1040Cd</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<label style="height:4mm;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataRequiredToFileF1040Cd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">No.</span> You may have to complete Part IV. See instructions for details.
                                        </label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART IV -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:auto;">Part IV</div>
						<div class="styPartDesc" style="padding-left:3mm;height:auto;">
              Address and Signature &#45; <span class="styNormalText">Complete this part</span> only <span class="styNormalText">if required. See the line 27 instructions.</span>
						</div>
					</div>
					<!-- Body -->
					<div style="width:187mm;height:auto;" class="styBB">
						<!-- 1st Row ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem" style="border-bottom-width:1px;border-color:black;padding:0px 0px 0px 0px;height:auto;">
							<div class="styIRS1040ScheduleHLNDesc" style="width:75%;padding-left:3px;">
								<!-- Title -->
								<div class="styIRS1040ScheduleHLNDesc" style="height:3mm;width:100%;padding-left:0px;float:none;height:auto;">
                                     Address (number and street) or P.O. box if mail isn't delivered to street address
                                </div>
								<!-- Data -->
								<div class="styIRS1040ScheduleHLNDesc" style="height:6mm;width:100%;padding-left:3px;float:none;">
                                </div>
							</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:25%;padding-left:3px;height:auto;border-left:1px solid black;">
								<!-- Title -->
								<div class="styIRS1040ScheduleHLNDesc" style="height:3mm;width:100%;padding-left:3px;float:none;">
                                     Apt., room, or suite no.
                                </div>
								<!-- Data -->
								<div class="styIRS1040ScheduleHLNDesc" style="height:6mm;width:100%;padding-left:0px;float:none;text-align:center;">
                                </div>
							</div>
						</div>
						<!-- 2nd Row ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem" style="border-bottom-width:1px;border-color:black;padding:0px 0px 0px 0px;height:auto;">
							<!-- Title -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:3mm;width:100%;padding-left:0px;float:none;">
                                City, town or post office, state, and ZIP code
                            </div>
							<!-- Data -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:6mm;width:100%;padding-left:3px;float:none;">
                            </div>
						</div>
						<!-- 3rd Row ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem" style="font-size:6pt;height:auto;">
              Under penalties of perjury, I declare that I have examined this schedule, including accompanying statements, and to the best of my knowledge and belief, it is true,<br/>
              correct, and complete. No part of any payment made to a state unemployment fund claimed as a credit was, or is to be, deducted from the payments to employees.<br/>
              Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.<br/>
							<br/>
							<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:100%;height:auto;">
								<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 2mm;width:3%">
									<img src="{$ImagePath}/1040ScheduleH_Bullet_Lg.gif" alt="LargeBullet"/>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:58%">
									<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;"/>
									<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
                    Employer&#39;s signature
                                    </div>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 5mm;width:5%;height:auto;">
									<img src="{$ImagePath}/1040ScheduleH_Bullet_Lg.gif" alt="LargeBullet"/>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:34%">
									<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;"/>
									<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
                                   Date
                                </div>
								</div>
							</div>
						</div>
					</div>
					<!-- Paid Preparer Section-->
					             <xsl:choose>
								    <xsl:when test="$Form1040ScheduleHData/HouseholdEmployerNm != '' ">
                                             <div class="styTBB" style="width:187mm;font-size:6pt;height:auto;">
							<div style="width:22.65mm;padding-top:4mm;float:left;">
								<span class="styMainTitle" style="font-size:11pt;">
								  Paid
								  Preparer
								  Use Only
								</span>
							</div>
							<div style="width:164mm;float:left;clear:none;border-width:0px 0px 0px 1px; border-color:black;border-style:solid;">
								<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
									<div class="styLNDesc" style="height:10mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;padding-left:3px;">
										Print/Type preparer's name<br/>
									<!--	******NOTE: UWR 228037 REQUESTED PAID PREPARERER SECTION TO BE BLANK TY2020*****-->
<!--										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/parerInformationGrp/PreparerPersonNm"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
										</xsl:call-template>-->
									</div>
									<div class="styLNDesc" style="height:10mm;;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
										 Preparer's signature
									</div>
										<div class="styLNDesc" style="height:10mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
<!--										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
										</xsl:call-template>-->
									</div>
									<div class="styLNDesc" style="height:10mm;width:18mm;border-right:1px solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
										<label>
<!--											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>-->
										   Check 
										<input class="styCkbox" type="checkbox" alt="PaidPreparerInformationSelfEmployed" style="height:3.5mm;width:4mm;">
<!--												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
												</xsl:call-template>-->
										</input>
										<span style="width:4px;"/>if<br/>self-employed
					                    </label>
									</div>
			<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
								 <br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
<!--											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
											</xsl:call-template>-->
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
<!--											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
											</xsl:call-template>-->
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
<!--											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">STIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
											</xsl:call-template>-->
										</xsl:if>
									</div>
								</div>								
								<div style="width:164mm;float:left;clear:none;">
									<div class="styLNDesc" style="width:108mm;border-right:0px solid black;height:11mm;">
			<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
									<div class="styLNDesc" style="height:11mm;width:108.1mm;border-right:1 solid black;">
										<span class="styGenericDiv" style="padding-left:3px;">Firm's name 
										<span style="width:2.2mm;"/>
											<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
											<span style="width:4px;"/>
										</span>
										<div class="styGenericDiv" style="padding-right:.5mm;width:60mm">
<!--											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
											</xsl:call-template>-->
											<br/>
<!--											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
											</xsl:call-template>-->
										</div>
									</div>
									</div>
									</div>
																		<div class="styLNDesc" style="height:11mm;width:32mm;padding-left:1mm;border-left:1px solid black;">Firm's EIN
										<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
<!--											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
											</xsl:call-template>-->
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
<!--											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
											</xsl:call-template>
-->										</xsl:if>
									</div>
								</div>
								<div style="width:164mm;float:left;clear:none;">
									<div class="styLNDesc" style="width:108.2mm;border-right:1px solid black;height:auto;">
										<div class="styGenericDiv" style="padding-right:.5mm;padding-left:3px;height:auto;">Firm's address 
											 <img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										</div>
										<div class="styGenericDiv" style="padding-right:.5mm;height:auto;">
<!--											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
											</xsl:call-template>-->
											<br/>
<!--											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
											</xsl:call-template>-->
											<br/>
											<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
<!--												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
												</xsl:call-template>,-->
											 <span style="width:2px;"/>
<!--												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
												</xsl:call-template>,-->
											 <span style="width:2px;"/>
<!--												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
												</xsl:call-template>-->
											</xsl:if>
											<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
<!--												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
												</xsl:call-template>,-->
											 <span style="width:2px;"/>
<!--												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
												</xsl:call-template>,-->
											<span style="width:2px;"/>
<!--												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
												</xsl:call-template>,-->
											<span style="width:2px;"/>
<!--												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
												</xsl:call-template>-->
											</xsl:if>
										</div>
									</div>
									<div class="styLNDesc" style="width:32mm;padding-left:1mm;height:8mm;"> Phone no. 
<!--										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">Phone</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
										</xsl:call-template>-->
<!--										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
										</xsl:call-template>-->
									</div>
								</div>
							</div>
						</div>

                    </xsl:when>
                    <xsl:otherwise>


		                  <!--    <xsl:when test="$Form1040ScheduleHData/HouseholdEmployerNm != '' ">
                                          <span style="text-align:right">
                                                     <xsl:call-template name="PopulateText">
                                                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HouseholdEmployerNm"/>
                                                     </xsl:call-template>
                                                     </span>
                                          </xsl:when>            -->     
                      <div class="styTBB" style="width:187mm;font-size:6pt;height:auto;">
							<div style="width:22.65mm;padding-top:4mm;float:left;">
								<span class="styMainTitle" style="font-size:11pt;">
								  Paid
								  Preparer
								  Use Only
								</span>
							</div>
							<div style="width:164mm;float:left;clear:none;border-width:0px 0px 0px 1px; border-color:black;border-style:solid;">
								<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
									<div class="styLNDesc" style="height:10mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;padding-left:3px;">
										Print/Type preparer's name<br/>
									<!--	<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
										</xsl:call-template>-->
									</div>
									<div class="styLNDesc" style="height:10mm;;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
										 Preparer's signature
									</div>
										<div class="styLNDesc" style="height:10mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
										<!--<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
										</xsl:call-template>-->
									</div>
									<div class="styLNDesc" style="height:10mm;width:18mm;border-right:1px solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
										<label>
											<!--<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>-->
										   Check 
										<input class="styCkbox" type="checkbox" alt="PaidPreparerInformationSelfEmployed" style="height:3.5mm;width:4mm;">
												<!--<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
												</xsl:call-template>-->
										</input>
										<span style="width:4px;"/>if<br/>self-employed
					                    </label>
									</div>
			<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
								 <br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<!--	<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
											</xsl:call-template>-->
										</xsl:if>
										<!--<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">STIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>-->
									</div>
								</div>								
								<div style="width:164mm;float:left;clear:none;">
									<div class="styLNDesc" style="width:108mm;border-right:0px solid black;height:11mm;">
			<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
									<div class="styLNDesc" style="height:11mm;width:108.1mm;border-right:1 solid black;">
										<span class="styGenericDiv" style="padding-left:3px;">Firm's name 
										<span style="width:2.2mm;"/>
											<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
											<span style="width:4px;"/>
										</span>
										<div class="styGenericDiv" style="padding-right:.5mm;width:60mm">
										<!--	<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
											</xsl:call-template>-->
										</div>
									</div>
									</div>
									</div>
																		<div class="styLNDesc" style="height:11mm;width:32mm;padding-left:1mm;border-left:1px solid black;">Firm's EIN
										<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
										<!--<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
											</xsl:call-template>
										</xsl:if>-->
									</div>
								</div>
								<div style="width:164mm;float:left;clear:none;">
									<div class="styLNDesc" style="width:108.2mm;border-right:1px solid black;height:auto;">
										<div class="styGenericDiv" style="padding-right:.5mm;padding-left:3px;height:7mm;">Firm's address 
											 <img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										</div>
										<div class="styGenericDiv" style="padding-right:.5mm;height:auto;">
										<!--	<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
												</xsl:call-template>,
											 <span style="width:2px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
												</xsl:call-template>,
											 <span style="width:2px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
												</xsl:call-template>,
											 <span style="width:2px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
												</xsl:call-template>,
											<span style="width:2px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
												</xsl:call-template>,
											<span style="width:2px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>-->
										</div>
									</div>
									<div class="styLNDesc" style="width:32mm;padding-left:1mm;height:8mm;"> Phone no. 
									<!--	<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">Phone</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
										</xsl:call-template>-->
									</div>
								</div>
							</div>
						</div>
           </xsl:otherwise>
								</xsl:choose>
					<div>				
					
						<!-- Page Break and Footer-->
						<div   style="width:187mm;">
							<div class="stySmallText" style="width:136mm;text-align:center;padding-top:1mm;">
								<span style="width:156px"/>
							</div>
							<div class="stySmallText" style="width:51mm;text-align:right;">
								<span class="styBoldText" style="font-weight:bold;">Schedule H (Form 1040) 2020</span>
							</div>
						</div>
					</div>
					</div>
					<p class="pageEnd"  style="page-break-after:always;display:block;"/>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Employer Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/EmployerNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 8 - Household Employee State Disability Payment Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtAmt"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 8 - Household Employee State Disability Payment Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtCd"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
					</table>
					<br/>
					<br/>
					<!-- Separated Data for Form 1040 Schedule H, Part II, Section B, Line 17 -->
					<xsl:if test="($Print = $Separated) and  (count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &gt; 2)">
						<span class="styRepeatingDataTitle">
              Form 1040 Schedule H, Part II, Section B, Line 17 - Complete all columns below that apply (if you need more space, see instructions):
            </span>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<!-- (a) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:7%;padding-top:0px;padding-bottom:4.5mm;" scope="col">
										<span class="styBoldText">(a)</span><br/>
										<span class="styNormalText">
											Name of state
                                        </span>
									</th>
									<!-- (b) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:14%;padding-top:0px;padding-bottom:4.5mm;" scope="col">
										<span class="styBoldText">(b)</span><br/>
										<span class="styNormalText">
											Taxable wages (as  defined in state act)
                                        </span>
									</th>
									<!-- (c) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:30mm;height:auto;" scope="col">
										<div class="styIRS1040ScheduleHLineItem" style="width:100%;height:auto;border-bottom:1px solid black;padding-bottom:1.2mm;">
											<span class="styBoldText">(c)</span><br/>
											<span class="styNormalText">
												State experience rate <br></br>period
                                            </span>
										</div>
										<br/>
										<span>
											<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:auto;margin-bottom:-1.3mm;">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 6mm 0px 0px;float:left;width:50%;height:4mm;">
													<span class="styNormalText">From</span>
												</div>
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:right;width:49%;border-width:0px 0px 0px 1px;border-color:black;border-style:solid;height:4mm;">
													<span class="styNormalText">To</span>
												</div>
											</div>
										</span>
									</th>
									<!-- (d) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:7%;padding-bottom:2.5mm;" scope="col">
										<span class="styBoldText">(d)</span><br/>
										<span class="styNormalText">
											State<br/>experience<br/>rate
                                        </span>
									</th>
									<!-- (e) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;padding-bottom:5mm;" scope="col">
										<span class="styBoldText">(e)</span><br/>
										<span class="styNormalText">
											Multiply col. (b)<br/>by .054
                    </span>
									</th>
									<!-- (f) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;padding-bottom:5mm;" scope="col">
										<span class="styBoldText">(f)</span><br/>
										<span class="styNormalText">
											Multiply col. (b)<br/>by col. (d)
                                        </span>
									</th>
									<!-- (g) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
										<span class="styBoldText">(g)</span><br/>
										<span class="styNormalText">
											Subtract col. (f)<br/>from col. (e). If<br/>zero or less,<br/>enter -0-.
                                       </span>
									</th>
									<!-- (h) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
										<span class="styBoldText">(h)</span><br></br>
										<span class="styNormalText">
											Contributions<br/>paid to state<br/>unemployment<br/>fund
                                        </span>
									</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- (a) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StateCd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (b) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:14%;font-size: 6pt; text-align:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TxblWagesPaidStUnemplFundAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (c) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:20%;font-size: 6pt; text-align:center;padding:0px 0px 0px 0px;height:auto;">
											<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:3mm;">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:50%;text-align:center;height:100%;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="UnemplStateExprncRateFromDt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:49%;text-align:center;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;height:3mm;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="UnemplStateExprncRateToDt"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
										<!-- (d) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UnemploymentStateExperienceRt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (e) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnemploymentTaxCrAt54RateAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (f) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnemploymentTaxCrAtStateRtAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (g) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnemploymentAdditionalTaxCrAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (h) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ContriPaidToStateUnemplFundAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
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
