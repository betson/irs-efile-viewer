<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4835Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form4835Data" select="$RtnDoc/IRS4835"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:  CreateBox) --><!--(take this   out)-->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="StaticText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">4mm</xsl:param>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
        float:left;
        padding:.75mm 0mm 0mm 0mm;
        border-right-width:0px;font-size:8pt;
        height:4mm;<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>		<div class="styLNAmountBox">
			<xsl:attribute name="style">width:
		<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;
        <xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;
			</xsl:when><xsl:otherwise>padding-top:4px;
			  </xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;
				</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:choose>
				<xsl:when test="$TargetNode">
					<xsl:choose>
						<xsl:when test="$PopulateAsText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$TargetNode/@referenceDocumentId">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$StaticText">
					<xsl:value-of select="$StaticText"/>
				</xsl:when>
			</xsl:choose>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:  GenerateEmptyItems) -->
	<xsl:template name="GenerateEmptyItems">
		<xsl:param name="Number"/>
		<xsl:param name="MaxCount"/>
		<xsl:if test="$Number and ($Number &lt;= $MaxCount)">
			<xsl:choose>
				<xsl:when test="$Number = $MaxCount">
					<xsl:call-template name="CreateOtherExpensesItem">
						<xsl:with-param name="Letter">
							<xsl:number value="$Number" format="a"/>
						</xsl:with-param>
						<xsl:with-param name="Style">border-bottom-width:0px;</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="CreateOtherExpensesItem">
						<xsl:with-param name="Letter">
							<xsl:number value="$Number" format="a"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="GenerateEmptyItems">
				<xsl:with-param name="Number" select="$Number + 1"/>
				<xsl:with-param name="MaxCount" select="$MaxCount"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:  CreateOtherExpensesItem) -->
	<xsl:template name="CreateOtherExpensesItem">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Style"/>
		<xsl:param name="Letter"/>
		<div class="styIRS4835LineItem">
			<div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">
				<xsl:value-of select="$Letter"/>
			</div>
			<div class="styIRS4835LNDesc" style="width:47mm;height:3.8mm;">
				<span style="width:43mm;height:3.8mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
					<xsl:if test="($Letter = 'g') and $Form4835Data/Section263AIndicatorCd">
						<span style="width:4px;"/>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Part II - Line 30 (g) - Section 263A Indicator Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4835Data/Section263AIndicatorCd"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$TargetNode">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$TargetNode/Desc"/>
						</xsl:call-template>
					</xsl:if>
				</span>
			</div>
			<div class="styIRS4835CleanDiv" style="width:37mm;height:3.8mm;padding:1.2px 0px 0px 0px;float:right;">
				<div class="styIRS4835CleanDiv" style="width:100%;height:3.8mm;float:right;">
					<xsl:choose>
						<xsl:when test="$TargetNode">
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Number">
									<xsl:value-of select="concat('30', $Letter)"/>
								</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$TargetNode/Amt"/>
								<xsl:with-param name="AmountBoxStyle">
									<xsl:value-of select="$Style"/>
								</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">
									<xsl:value-of select="$Style"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Number">
									<xsl:value-of select="concat('30', $Letter)"/>
								</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">
									<xsl:value-of select="$Style"/>
								</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">
									<xsl:value-of select="$Style"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
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
						<xsl:with-param name="RootElement" select="local-name($Form4835Data)"/>
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
				<meta name="Description" content="IRS Form 4835"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4835Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS4835" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber" style="padding-left:1mm;">  4835</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form4835Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency" style="padding-top:5mm;">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;padding-top:2mm;">
								Farm Rental Income and Expenses
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:100%;height:auto;">
											<b>(Crop and Livestock Shares (Not Cash) Received by Landowner (or Sub-Lessor))<br/>
												  (Income not subject to self-employment tax)<br/>
												<img src="{$ImagePath}/4835_Bullet_Sm.gif" alt="SmallBullet"/> 
												  Attach to Form 1040 or Form 1040NR.<br/>
												<img src="{$ImagePath}/4835_Bullet_Sm.gif" alt="SmallBullet"/> 
												Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form4835" title="Link to IRS.gov">
													<i>www.irs.gov/Form4835</i></a> for the latest information.
												<!--  Information about Form 4835 and its instructions is at 
												  <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form4835" title="Link to IRS.gov">
													<i>www.irs.gov/form4835.</i>
												</a>-->
											</b>
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm;border-left-width:2px;">
							<div class="styOMB" style="width:30mm;height:4mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">18</span>
							</div>
							<div style="text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">37</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;height:16mm;">
						<div class="styNameBox" style="width:137mm;height:100%;font-weight:normal;font-size:7pt;">
							Name(s) shown on tax return<br/>
							
							
                                        <xsl:choose>
                                                                                        <!-- Name from Form level -->
                                            <!-- <xsl:when test="normalize-space($Form1040ScheduleHData/HouseholdEmployerNm) != ''">
                                                     <xsl:call-template name="PopulateText">
                                                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HouseholdEmployerNm"/>
                                                     </xsl:call-template>
                                                 <br/>
                                                   <xsl:call-template name="PopulateText">
                                                   <xsl:with-param name="TargetNode" select="$Form4797Data/BusinessName/BusinessNameLine2Txt"/>
                                                   </xsl:call-template>
                                          </xsl:when>-->
                                                                                     <!-- Name from 1040 Return Header-->
                                          <xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
                                                   <xsl:call-template name="PopulateReturnHeaderFiler">
                                                 <xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
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
						</div>
						<div style="width:50mm;height:50%;padding:0px 0px 0px 2mm;font-size:7pt;border-width:0px 0px 1px 0px;border-color:black;border-style:solid;" class="styEINBox">
							  Your social security number<br/>
							  									<span style="font-weight:normal;text-align:center;width:100%;padding-top:2mm;">
							  									 <xsl:choose>
                                                                        <xsl:when test="$RtnHdrData/Filer/PrimarySSN"> 
                                                                            <xsl:call-template name="PopulateReturnHeaderFiler">
                                                                            <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </xsl:when>
                                                                        <xsl:when test="$RtnHdrData/Filer/EIN"> 
                                                                               <xsl:call-template name="PopulateReturnHeaderFiler"> 
                                                                               <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                                                                               </xsl:call-template>
                                                                         </xsl:when>
                                                                   </xsl:choose>
								<!--<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
									<xsl:with-param name="BackupName">RtnHdrDataFilerPrimarySSN</xsl:with-param>
								</xsl:call-template>-->
							</span>
								
						</div>
						<div style="width:50mm;height:50%;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							  Employer ID number (EIN), if any<br/>
							  <span style="font-weight:normal;text-align:center;width:100%;padding-top:2mm;">
							          
							          
                                                                 <!--Input EIN versus Missign EIN per schema-->
                                                               
                                                           
                                                                    
                                                                   <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$Form4835Data/EIN"/>
									<xsl:with-param name="BackupName">RtnHdrDataFilerPrimarySSN</xsl:with-param>
								</xsl:call-template>
                                                               
                                               
							        
										
								</span>
							
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<!-- (A) ////////////////////////////////////////////////////-->
						<div class="styIRS4835LineItem">
							<div class="styIRS4835LNLeftNumBox" style="text-align:left;padding-top:.75mm;padding-left:3px;">A</div>
							<div class="styIRS4835CleanDiv" style="width:153mm;height:4mm;padding:0px 0px 0px 0px;">
								<div class="styIRS4835LNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
									<div class="styIRS4835LNDesc" style="width:auto;height:4mm;">
										<span style="float:left;">Did you actively participate in the operation of this farm during 2018 (see instructions)?</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-left:1mm;padding-right:1mm;">........</span>
									</div>
								</div>
							</div>
							<div class="styIRS4835CleanDiv" style="width:28mm;float:right;">
								<span style="width:7px;"/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form4835Data/ActivelyParticipatedInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="MateriallyParticipateYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form4835Data/ActivelyParticipatedInd"/>
											<xsl:with-param name="BackupName">IRS4835MateriallyParticipateIndicator</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form4835Data/ActivelyParticipatedInd"/>
										<xsl:with-param name="BackupName">IRS4835MateriallyParticipateIndicator</xsl:with-param>
									</xsl:call-template>
									  Yes
								</label>
								<span style="width:1mm;"/>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form4835Data/ActivelyParticipatedInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="MateriallyParticipateNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form4835Data/ActivelyParticipatedInd"/>
											<xsl:with-param name="BackupName">IRS4835MateriallyParticipateIndicator</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form4835Data/ActivelyParticipatedInd"/>
										<xsl:with-param name="BackupName">IRS4835MateriallyParticipateIndicator</xsl:with-param>
									</xsl:call-template>
										  No
								</label>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I                                                -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div style="padding:1.5mm 0px 1.5mm 0px; border-width:0px 0px 0px 0px;width:100%;">
							<div class="styPartName" style="width:15mm;font-size:9pt;">Part I</div>
							<div class="styPartDesc" style="padding-left:3mm;font-size:9pt;">
								Gross Farm Rental Income<img src="{$ImagePath}/4835_Short_Line.gif" alt="Short Line"/>Based on Production.
							<span class="styNormalText"> Include amounts converted to cash or the equivalent.</span>
							</div>
						</div>
					</div>
					<!-- Body -->
					<!-- (1) ////////////////////////////////////////////////////-->
					<div style="width:187mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">1</div>
							<div class="styLNDesc" style="width:142mm;padding-left:1mm;">
								<span style="float:left;">Income from production of livestock, produce, grains, and other crops</span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">1</div>
						<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:29mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4835Data/LivestockAndCropIncomeAmt" />
							</xsl:call-template>     
						</div>
					</div>					
					<!-- (2a) ////////////////////////////////////////////////////-->
					<div class="styIRS4835LineItem" style="width:113mm;height:4mm;float:left;">
						<div class="styIRS4835LNLeftNumBox" style="padding-top:.75mm;padding-right:0mm;">2a</div>
						<div class="styIRS4835LNDesc" style="width:auto;height:4mm;padding-bottom:.0mm;">
							Cooperative distributions (Form(s) 1099-PATR)
 					    </div>
						<div class="styIRS4835CleanDiv" style="width:37mm;height:4mm;float:right;">
							<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">2a</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4835Data/CooperativeDistributionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- (2b) ////////////////////////////////////////////////////-->
					<div class="styIRS4835LineItem" style="width:74mm;height:4mm;float:left;">
						<div class="styIRS4835LNLeftNumBox" style="padding-left:4mm;padding-right:0mm;">2b</div>
						<div class="styIRS4835LNDesc" style="width:auto;height:4mm;">
							Taxable amount
					    </div>
						<div class="styIRS4835CleanDiv" style="width:37mm;height:4mm;float:right;">
							<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">2b</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4835Data/CooperativeDistriTxblAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- (3a) ////////////////////////////////////////////////////-->
					<div class="styIRS4835LineItem" style="width:113mm;height:4mm;float:left;">
						<div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">3a</div>
						<div class="styIRS4835LNDesc" style="width:auto;height:4mm;font-family:Arial;">
							Agricultural program payments (see instructions)
					    </div>
						<div class="styIRS4835CleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">3a</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4835Data/AgriculturalProgramPymtAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- (3b) ////////////////////////////////////////////////////-->
					<div class="styIRS4835LineItem" style="width:74mm;height:4mm;float:left;">
						<div class="styIRS4835LNLeftNumBox" style="padding-left:4mm;padding-right:0mm;">3b</div>
						<div class="styIRS4835LNDesc" style="width:auto;height:4mm;">
							Taxable amount
						</div>
						<div class="styIRS4835CleanDiv" style="width:37mm;height:4mm;float:right;">
							<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">3b</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4835Data/AgriculturalProgramPymtTxblAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- (4) ////////////////////////////////////////////////////-->
					<div class="styIRS4835LineItem" style="width:187mm;height:4mm;">
						<div class="styIRS4835LNLeftNumBox">4</div>
						<div class="styIRS4835CleanDiv" style="width:144mm;height:4mm;">
							<div class="styIRS4835LNDesc" style="width:auto;height:4mm;">
								<div class="styIRS4835LNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
									Commodity Credit Corporation (CCC) loans (see instructions):
							    </div>
							</div>
						</div>
						<div class="styIRS4835CleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- (4a) ////////////////////////////////////////////////////-->
					<div style="width:187mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">4a</div>
							<div class="styLNDesc" style="width:142mm;padding-left:1mm;">
								<span style="float:left;">CCC loans reported under election								
								</span>
								<span style="width:.5mm;"/>
								<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form4835Data/CCCLoanReportedElectionAmt"/>
									</xsl:call-template>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">4a</div>
						<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:29mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4835Data/CCCLoanReportedElectionAmt" />
							</xsl:call-template>     
						</div>
					</div>					
					<!-- (4b) and (4c)////////////////////////////////////////////////////-->
					<div style="width:187mm;height:4mm;font-size:8.5pt;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;">4b</div>
						<div class="styLNDesc" style="width:67.2mm;padding-left:1mm;">
							<span style="float:left;">CCC loans forfeited </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;width:8mm;">4b</div>
						<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:29mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4835Data/CCCLoansForfeitedAmt" />
							</xsl:call-template>     
						</div>						
						<div class="styLNLeftNumBoxSD" style="width:8mm;">4c</div>
							<div class="styLNDesc" style="width:29.8mm;">Taxable amount </div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">4c</div>
						<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:29mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4835Data/CCCLoansForfeitedTaxableAmt" />
							</xsl:call-template>     
						</div>
					</div>
					<!-- (5) ////////////////////////////////////////////////////-->
					<div class="styIRS4835LineItem" style="width:187mm;height:4mm;">
						<div class="styIRS4835LNLeftNumBox">5</div>
						<div class="styIRS4835CleanDiv" style="width:144mm;height:4mm;padding:0px 0px 0px 0px;">
							<div class="styIRS4835LNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
								<div class="styIRS4835LNDesc" style="width:auto;height:4mm;padding-top:.75mm;">
									Crop insurance proceeds and federal crop disaster payments (see instructions):
							</div>
							</div>
						</div>
						<div class="styIRS4835CleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- (5a) and (5b)////////////////////////////////////////////////////-->
					<div style="width:187mm;height:4mm;font-size:8.5pt;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:4.5mm;">a</div>
						<div class="styLNDesc" style="width:67.2mm;padding-left:1mm;">
							<span style="float:left;">Amount received in 2018 </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;width:8mm;">5a</div>
						<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:29mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4835Data/CropInsProcAndDsstrPymtAmt" />
							</xsl:call-template>     
						</div>						
						<div class="styLNLeftNumBoxSD" style="width:8mm;">5b</div>
							<div class="styLNDesc" style="width:29.8mm;">Taxable amount </div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">5b</div>
						<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:29mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4835Data/CropInsProcAndDsstrPymtTxblAmt" />
							</xsl:call-template>     
						</div>
					</div>
						<!-- (5c) ////////////////////////////////////////////////////-->
					   <div class="styIRS4835LineItem" style="width:100mm;float:left;">
							<div class="styIRS4835LNLeftNumBox" style="padding-top:1mm;padding-right:0mm">c</div>
							<div class="styIRS4835LNDesc" style="width:94mm;height:auto;padding-top:0mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
									   <!--<xsl:with-param name="TargetNode" select="$Form4835Data/ElectionDeferCropInsProcAmt"/>-->
										<xsl:with-param name="TargetNode" select="$Form4835Data/ElectionDeferCropInsProcInd"/>
										<xsl:with-param name="BackupName">IRS4835ElectionToDeferCropInsProc</xsl:with-param>
									</xsl:call-template>
									If election to defer to 2019 is attached, check here
									<span style="width:1px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form4835Data/ElectionDeferCropInsProcInd"/>
									</xsl:call-template>
									<span style="width:1px;"/>
									<img src="{$ImagePath}/4835_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:1px;"/>
								</label>
								<input class="styCkbox" alt="ElectionToDeferCropsInsProc" type="checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form4835Data/ElectionDeferCropInsProcInd"/>
										<xsl:with-param name="BackupName">IRS4835ElectionToDeferCropInsProc</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<!-- (5d) ////////////////////////////////////////////////////-->
						<div class="styIRS4835LineItem" style="width:87mm;height:4mm;float:right;">
							<div class="styIRS4835LNLeftNumBox" style="padding: .75mm 5mm 0mm 0mm;">5d</div>
							<div class="styIRS4835LNDesc" style="width:auto;height:auto;padding:.75mm 3mm 0mm 0mm;">
								Amount deferred from 2017
							</div>
							<div class="styIRS4835CleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">5d</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form4835Data/CropInsProcDefrdPrevTYAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					<!-- (6) ////////////////////////////////////////////////////-->
					<div class="styIRS4835LineItem" style="width:187mm;height:4mm;">
						<div class="styIRS4835LNLeftNumBox">6</div>
						<div class="styIRS4835CleanDiv" style="width:144mm;height:4mm;padding:0px 0px 0px 0px;">
							<div class="styIRS4835LNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
								<div class="styIRS4835LNDesc" style="width:auto;height:4mm;">
									Other income, including federal and state gasoline or fuel tax credit or refund (see instructions)
							</div>
							</div>
						</div>
						<div class="styIRS4835CleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">6</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4835Data/OthIncmIncludingGasFuelTxCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- (7) ////////////////////////////////////////////////////-->
					<div  class="styBB"  style="width:187mm;height:8mm;">
						<div class="styIRS4835LNLeftNumBox">7</div>
						<div class="styIRS4835CleanDiv" style="width:144mm;height:4mm;padding:0px 0px 0px 0px;">
							<div class="styIRS4835LNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
								<div class="styIRS4835LNDesc" style="width:auto;height:4mm;">
									<b>Gross farm rental income.</b> Add amounts in the right column for lines 1 through 6. Enter the total here<br/>
							<span style="float:left;"> and on Schedule E (Form 1040), line 42. </span>
							</div>
							</div>
						</div>
						<div class="styIRS4835CleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
							<div class="styLNRightNumBox" style="height:4mm; background:lightgrey; border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:29mm;height:4mm; border-bottom-width:0px;"/> 
								<xsl:call-template name="CreateBox">
								
									<xsl:with-param name="Number">7</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4835Data/GrossFarmRentalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--<div class="styBB" style="width:187mm;font-size:8.5pt;">
						<div class="styLNLeftNumBoxSD" style="height:8mm;">7</div>      
						<div class="styLNDesc" style="width:142mm; height:8mm;padding-left:1mm">          
							<b>Gross farm rental income.</b> Add amounts in the right column for lines 1 through 6. Enter the<br/>
							<span style="float:left;">total here and on Schedule E (Form 1040), line 42. </span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:left;padding-left:1mm;padding-right:1mm;">.................</span>
							<span style="padding-left:1.5mm;">
								<img src="{$ImagePath}/4835_Bullet_Sm.gif" alt="SmallBullet"/> 
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm; background:lightgrey; border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:29mm;height:4mm; border-bottom-width:0px;"/> 
						<div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:0px;">7</div>
						<div class="styLNAmountBox" style="height:4mm;width:29mm;border-bottom-width:0px;font-size:8.5px;">        
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4835Data/GrossFarmRentalIncomeAmt"/>
							</xsl:call-template>        
						</div>
					</div>      -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II                                                 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div style="padding:1.5mm 0px 1.5mm 0px; border-width:0px 0px 0px 0px;width:100%;">
							<div class="styPartName" style="width:15mm;font-size:9pt;">Part II</div>
							<div class="styPartDesc" style="padding-left:3mm;font-size:9pt;">
								Expenses<img src="{$ImagePath}/4835_Short_Line.gif" alt="Short Line"/>Farm Rental Property.
						<span class="styNormalText">Do not include personal or living expenses.</span>
							</div>
						</div>
					</div>
					<!-- Body -->
					<div class="styGenericDiv" style="width:93.5mm;height:100%;border-right:1px black solid;">
						<!-- (8) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:10mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">8</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								Car and truck expenses (see<br/>Schedule F (Form 1040)<br/>
								<span style="float:left;"> instructions). Also attach <b>Form 4562</b> </span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:10mm;padding-top:6.5mm">8</div>
							<div class="styLNAmountBox" style="width:28.9mm;height:10mm;font-size:7pt;border-bottom-width:1px;padding-top:6.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/CarAndTruckExpensesAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (9) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">9</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								<span style="float:left;">Chemicals</span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">9</div>
							<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:28.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/ChemicalExpenseAmt" />
								</xsl:call-template>     
							</div>
						</div>					
						<!-- (10) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:8mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">10</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								Conservation expenses (see<br/> <span style="float:left;"> instructions) </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:8mm;padding-top:4.5mm;">10</div>
							<div class="styLNAmountBox" style="width:29.2mm;height:8mm;font-size:7pt;border-bottom-width:1px;padding-right:.5mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/ConservationExpenseAmt" />
								</xsl:call-template>     
							</div>
						</div>					
						<!-- (11) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">11</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								<span style="float:left;">Custom hire (machine work) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">11</div>
							<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:28.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/CustomHireExpenseAmt" />
								</xsl:call-template>     
							</div>
						</div>					
						<!-- (12) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:12mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">12</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								Depreciation and section 179<br/>expense deduction not<br/>
								<span style="float:left;">claimed elsewhere </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:12mm;padding-top:8.5mm;">12</div>
							<div class="styLNAmountBox" style="width:29.2mm;height:12mm;font-size:7pt;border-bottom-width:1px;padding-right:.5mm;padding-top:8.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/DeprecAndSect179ExpnsDedAmt" />
								</xsl:call-template>     
							</div>
						</div>				
						<!-- (13) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:12mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">13</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								Employee benefit programs other<br/>than on line 21 (see Schedule F<br/>
								<span style="float:left;">(Form 1040) instructions) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:12mm;padding-top:8.5mm;">13</div>
							<div class="styLNAmountBox" style="width:29.2mm;height:12mm;font-size:7pt;border-bottom-width:1px;padding-right:.5mm;padding-top:8.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/EmployeeBenefitProgramAmt" />
								</xsl:call-template>     
							</div>
						</div>			
						<!-- (14) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">14</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								<span style="float:left;">Feed </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">14</div>
							<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:28.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/FeedPurchasedExpenseAmt" />
								</xsl:call-template>     
							</div>
						</div>			
						<!-- (15) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">15</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								<span style="float:left;">Fertilizers and lime </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">15</div>
							<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:28.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/FertilizerAndLimeExpenseAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (16) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">16</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								<span style="float:left;">Freight and trucking </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">16</div>
							<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:28.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/FreightAndTruckingExpenseAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (17) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">17</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								<span style="float:left;">Gasoline, fuel, and oil </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">17</div>
							<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:28.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/GasolineFuelAndOilExpenseAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (18) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">18</div>
							<div class="styLNDesc" style="width:48.25mm;padding-left:1mm;">
								<span style="float:left;">Insurance (other than health) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">18</div>
							<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:28.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/InsuranceAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (19) ////////////////////////////////////////////////////-->
						<div class="styIRS4835LineItem">
							<div class="styIRS4835LNLeftNumBox">19</div>
							<div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS4835LNDesc" style="width:auto;height:100%;">
									  Interest (see instructions):
									</div>
								</div>
							</div>
							<div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (19a) ////////////////////////////////////////////////////-->
						<div class="styIRS4835LineItem">
							<div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">a</div>
							<div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS4835LNDesc" style="width:auto;height:100%;">
									  Mortgage (paid to banks, etc.)
									</div>
								</div>
							</div>
							<div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">19a</xsl:with-param>
										<!--<xsl:with-param name="TargetNode" select="$Form4835Data/MortgageInterestExpenseAmt"/>-->
										<xsl:with-param name="TargetNode" select="$Form4835Data/MortgageInterestPaidBanksAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (19b) ////////////////////////////////////////////////////-->
						<div class="styIRS4835LineItem">
							<div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">b</div>
							<div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS4835LNDesc" style="width:auto;height:100%;">
									  Other 
									  <span class="styDotLn" style="float:right;padding-right:4mm;">.......</span>
									  <xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc"> Line 19b - Form1098 Recipients Statement</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4835Data/MortgageInterestPaidOtherAmt/@attachmentIndicatorCd"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							
							<div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">19b</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form4835Data/MortgageInterestPaidOtherAmt"/>
									</xsl:call-template>
									
								</div>
							</div>
						</div>
						
						<!-- (20) ////////////////////////////////////////////////////-->
						<div class="styIRS4835LineItem" style="height:8mm;">
							<div class="styIRS4835LNLeftNumBox">20</div>
							<div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS4835LNDesc" style="width:auto;height:100%;">
										Labor hired (less employment<br/> credits) (see Schedule F (Form<br/>
										<span style="float:left;">1040) instructions) </span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</div>
								</div>
							</div>
							<div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS4835CleanDiv" style="width:100%;height:7.5mm;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">height:7.5mm;border-width:0px 0px 0px 1px;padding-top:2mm</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:7.5mm;border-width:0px 0px 0px 1px;padding-top:2mm</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">20</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form4835Data/LaborHiredExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styIRS4835LineItem">
							<div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS4835CleanDiv">
									<xsl:attribute name="style"> width:100%;float:right;
										<xsl:variable name="cnt" select="count($Form4835Data/OtherExpense)"/>
										<xsl:choose>
											<xsl:when test="($Print != $Separated) and ($cnt &gt;7)">height:<xsl:value-of select="5.25+($cnt - 7)*5"/>mm;border-top-width:1px;</xsl:when>
											<xsl:otherwise>height:4mm;</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="styGenericDiv" style="width:93.5mm;height:100%;">
						<!-- (21) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:8mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">21</div>
							<div class="styLNDesc" style="width:48.5mm;padding-left:1mm;">
								Pension and profitsharing<br/><span style="float:left;"> plans </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:8mm;padding-top:4.5mm;">21</div>
							<div class="styLNAmountBox" style="width:29mm;height:8mm;float:right;font-size:7pt;border-bottom-width:1px;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/PensionProfitSharingPlansAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (22) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">22</div>
							<div class="styLNDesc" style="width:48.5mm;padding-left:1mm;">
								<span style="float:left;"> Rent or lease:</span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:29mm;height:4mm;float:right;font-size:7pt;border-bottom-width:0px;"/>
						</div>		
						<!-- (22a) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:12mm;font-size:8.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:4mm">a</div>
							<div class="styLNDesc" style="width:48.5mm;height:12mm;padding-left:1mm;">
								Vehicles, machinery, and<br/>equipment (see<br/>
								<span style="float:left;">instructions) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="width:8mm;height:8mm;background-color:lightgrey;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:29mm;height:8mm;border-bottom-width:0px;"/>					
							<div class="styLNRightNumBox" style="width:8mm;height:4mm;">22a</div>
							<div class="styLNAmountBox" style="width:29mm;height:4mm;float:right;font-size:7pt;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/MachineryAndEquipmentRentAmt" />
								</xsl:call-template>     
							</div>
						</div>
						<!-- (22b) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-left:4.5mm">b</div>
							<div class="styLNDesc" style="width:48.5mm;padding-left:1mm;">
								<span style="float:left;"> Other (land, animals, etc.) </span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:4mm;">22b</div>
							<div class="styLNAmountBox" style="width:29mm;height:4mm;float:right;font-size:7pt;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/OtherBusinessPropertyRentAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (23) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">23</div>
							<div class="styLNDesc" style="width:48.5mm;padding-left:1mm;">
								<span style="float:left;"> Repairs and maintenance </span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:4mm;">23</div>
							<div class="styLNAmountBox" style="width:29mm;height:4mm;float:right;font-size:7pt;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/RepairsAndMaintenanceAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (24) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">24</div>
							<div class="styLNDesc" style="width:48.5mm;padding-left:1mm;">
								<span style="float:left;"> Seeds and plants </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:4mm;">24</div>
							<div class="styLNAmountBox" style="width:29mm;height:4mm;float:right;font-size:7pt;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/SeedAndPlantExpenseAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (25) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">25</div>
							<div class="styLNDesc" style="width:48.5mm;padding-left:1mm;">
								<span style="float:left;"> Storage and warehousing </span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:4mm;">25</div>
							<div class="styLNAmountBox" style="width:29mm;height:4mm;float:right;font-size:7pt;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/StorageAndWarehousingExpnsAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (26) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">26</div>
							<div class="styLNDesc" style="width:48.5mm;padding-left:1mm;">
								<span style="float:left;"> Supplies </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:4mm;">26</div>
							<div class="styLNAmountBox" style="width:29mm;height:4mm;float:right;font-size:7pt;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/SuppliesAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (27) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">27</div>
							<div class="styLNDesc" style="width:48.5mm;padding-left:1mm;">
								<span style="float:left;"> Taxes </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:4mm;">27</div>
							<div class="styLNAmountBox" style="width:29mm;height:4mm;float:right;font-size:7pt;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/TaxExpenseAmt" />
								</xsl:call-template>     
							</div>
						</div>		
						<!-- (28) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:4mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">28</div>
							<div class="styLNDesc" style="width:48.5mm;padding-left:1mm;">
								<span style="float:left;"> Utilities </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:4mm;">28</div>
							<div class="styLNAmountBox" style="width:29mm;height:4mm;float:right;font-size:7pt;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/UtilitiesAmt" />
								</xsl:call-template>     
							</div>
						</div>	
						<!-- (29) ////////////////////////////////////////////////////-->
						<div style="width:93.5mm;height:8mm;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">29</div>
							<div class="styLNDesc" style="width:48.5mm;padding-left:1mm;">
								Veterinary, breeding,<br/><span style="float:left;">and medicine </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>							
							<div class="styLNRightNumBox" style="width:8mm;height:8mm;padding-top:4.5mm;">29</div>
							<div class="styLNAmountBox" style="width:29mm;height:8mm;float:right;font-size:7pt;border-bottom-width:1px;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/VtrnryBreedingMedicineExpnsAmt" />
								</xsl:call-template>     
							</div>
						</div>
						<!-- (30) ////////////////////////////////////////////////////-->
						<div class="styIRS4835LineItem" style="height:7mm;">
							<div class="styIRS4835LNLeftNumBox">30</div>
							<div class="styIRS4835CleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
								<div class="styIRS4835LNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
									<div class="styIRS4835LNDesc" style="width:auto;height:6mm;">
									  Other expenses<br/>
									  (specify):
									</div>
								</div>
							</div>
							<div class="styIRS4835CleanDiv" style="width:37mm;height:3.5mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS4835CleanDiv" style="width:100%;height:3.5mm;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">height:7.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:7.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (30a-g) ////////////////////////////////////////////////////-->
						<xsl:variable name="NumberOfOtherExpenseGrp" select="count($Form4835Data/OtherExpense)"/>
						<xsl:choose>
							<xsl:when test="($Print != $Separated) or ($NumberOfOtherExpenseGrp &lt;= 7)">
						
								<xsl:for-each select="$Form4835Data/OtherExpenseDetail">
									<xsl:variable name="Letter">
										<xsl:number format="a"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="(position() = last()) and ($NumberOfOtherExpenseGrp &gt;=7)">
											<xsl:call-template name="CreateOtherExpensesItem">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Letter">
													<xsl:value-of select="$Letter"/>
												</xsl:with-param>
												<xsl:with-param name="Style">border-bottom-width:0px;height:4mm;</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="CreateOtherExpensesItem">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Letter">
													<xsl:value-of select="$Letter"/>
												</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							<xsl:if test="($Form4835Data/OtherExpenseDetail &lt;= 7) or ($NumberOfOtherExpenseGrp &lt; 0 ) ">
									<xsl:call-template name="GenerateEmptyItems">
										<xsl:with-param name="Number" select="$NumberOfOtherExpenseGrp + 1"/>
										<xsl:with-param name="MaxCount" select="7"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<div class="styIRS4835LineItem">
									<div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">
										a
									</div>
									<div class="styIRS4835LNDesc" style="width:47mm;height:4mm;">
										<span style="width:43mm;height:4mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form4835Data/OtherExpense"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styIRS4835CleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
										<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Number">
													<xsl:value-of select="concat('30', 'a')"/>
												</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<xsl:call-template name="GenerateEmptyItems">
									<xsl:with-param name="Number">2</xsl:with-param>
									<xsl:with-param name="MaxCount">7</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!-- (31) ////////////////////////////////////////////////////-->
					<div style="width:187mm;height:4mm;border-top:1px solid black;font-size:8.5pt;">
							<div class="styLNLeftNumBox" style="width:8mm;">31</div>
							<div class="styLNDesc" style="width:142mm;padding-left:1mm;">
								<span style="float:left;"><b>Total expenses.</b> Add lines 8 through 30g. See instructions</span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:1mm;padding-right:1mm;">.............</span>
							<img src="{$ImagePath}/4835_Bullet_Sm.gif" alt="SmallBullet" style="10px"/>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;">31</div>
						<div class="styLNAmountBox" style="font-size:7pt;border-bottom-width:1px;height:4mm;width:29mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4835Data/TotalExpensesAmt" />
							</xsl:call-template>     
						</div>
					</div>
					<!-- (32) ////////////////////////////////////////////////////-->
					<div class="styIRS4835LineItem" style="width:187mm;height:12mm;">
						<div class="styIRS4835LNLeftNumBox">32</div>
						<div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
							<div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS4835LNDesc" style="width:auto;height:100%;">
									<b>Net farm rental income or (loss).</b> Subtract line 31 from line 7. If the result is income, enter it<br/>
										  here and on Schedule E (Form 1040), line 40. If the result is a loss, you <b>must</b> go to lines 33 and 34. See instructions
									<xsl:if test="$Form4835Data/NetFarmRentalIncomeOrLossAmt/@passiveActivityLossLiteralCd">
										<span style="width:4px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part II - Line 32 - Passive Activity Loss Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4835Data/NetFarmRentalIncomeOrLossAmt/@passiveActivityLossLiteralCd"/>
										</xsl:call-template>
									</xsl:if>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:5px"/>.
									    <!--<xsl:if test="not($Form4835Data/NetFarmRentalIncomeOrLossAmt/@passiveActivityLossLiteralCd)">-->
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
 
										<!--</xsl:if>-->
									</span>
								</div>
							</div>
						</div>
						<div class="styIRS4835CleanDiv" style="width:37mm;height:12mm;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">32</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4835Data/NetFarmRentalIncomeOrLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
   					
					<!-- Line 33 -->
					<div style="width:187mm;height:4mm;font-size:8.5pt;">
						<div class="styLNLeftNumBox" style="width:8mm;">33</div>
						<div class="styLNDesc" style="width:142mm;padding-left:1mm;">
							<span style="float:left;">Reserved for future use</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:1mm;padding-right:1mm;">..........................</span>
						</div>	
						<div class="styLNRightNumBox" style="width:7mm;height:4mm;padding-left:1mm;font-size:8pt;border-width:0px 0px 0px 0px;">33</div>
						<div class="styIRS4835CleanDiv" style="width:28.5mm;height:100%;float:none;">
							<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
						<!--	<span>
							<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form4835Data/SubsidyReceivedInd"/>
										</xsl:call-template>
								<input type="checkbox" alt="IRS4835SubsidyReceivedIndYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form4835Data/SubsidyReceivedInd"/>
										<xsl:with-param name="BackupName">IRS4835SubsidyReceivedInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>-->
						<!--	<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form4835Data/SubsidyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS4835SubsidyReceivedInd</xsl:with-param>
								</xsl:call-template>
								Yes
							</label>-->
							<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
						<!--	<span style="padding-left:2mm;">
								<input type="checkbox" alt="IRS4835SubsidyIndicatorNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form4835Data/SubsidyReceivedInd"/>
										<xsl:with-param name="BackupName">IRS4835SubsidyIndicator</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form4835Data/SubsidyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS4835SubsidyIndicator</xsl:with-param>
								</xsl:call-template>
								No
							</label>-->
						</div>
					</div>
					<!-- (34a-34b) ////////////////////////////////////////////////////-->
					<div class="styIRS4835LineItem" style="width:187mm;height:9mm;">
						<div class="styIRS4835LNLeftNumBox" style="padding-top:1.5mm;">34</div>
						<div class="styIRS4835CleanDiv" style="width:144mm;height:auto;">
							<div class="styIRS4835LNDesc" style="width:auto;height:100%;padding-top:1.5mm;">
							If line 32 is a loss, check the box that describes your investment in this activity. See instructions 
							<!--<span class="styDotLn" style="float:right;padding-left:1.5mm;padding-right:1mm;">...</span>-->
							<div class="styIRS4835LNDesc" style="width:auto;text-align:right;float:right;padding-left:12mm;">
								<img src="{$ImagePath}/4626_SMBracket.gif" alt="SmallBullet"/>
							</div>
							</div>
							
						</div>		
						<div class="styLNRightNumBox" style="width:6mm;height:4mm;font-size:8pt;padding:1.5mm 0mm 0mm 1.5mm;border-width:0px 0px 0px 0px;">34a</div>     
						<div class="styLNAmountBox" style="width:29mm;height:4mm;font-size:8pt;border-width:0px 0px 0px 0px;text-align:left;">
							<span style="padding-left:1mm;">
								<input type="checkbox" alt="AllInvestmentIsAtRisk" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form4835Data/AllInvestmentIsAtRiskInd"/>
										<xsl:with-param name="BackupName">IRS4835AllInvestmentIsAtRisk</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>  
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form4835Data/AllInvestmentIsAtRiskInd"/>
									<xsl:with-param name="BackupName">IRS4835AllInvestmentIsAtRisk</xsl:with-param>
								</xsl:call-template>
								<span style="font-size:6pt;font-family:arial narrow;display:inline;">All investment is at risk.</span>
							</label>
						</div>
						<div class="styLNRightNumBox" style="width:6mm;height:4mm;font-size:8pt;padding:1.5mm 0mm 0mm 1.5mm;border-width:0px 0px 0px 0px;">34b</div>               
						<div class="styLNAmountBox" style="width:29mm;height:4mm;font-size:8pt;border-width:0px 0px 0px 0px;text-align:left;">
							<span style="padding-left:1mm;">                  
								<input type="checkbox" alt="SomeInvestmentIsNotAtRisk" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form4835Data/SomeInvestmentIsNotAtRiskInd"/>
										<xsl:with-param name="BackupName">IRS4835SomeInvestmentIsNotAtRisk</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>                       
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form4835Data/SomeInvestmentIsNotAtRiskInd"/>
									<xsl:with-param name="BackupName">IRS4835SomeInvestmentIsNotAtRisk</xsl:with-param>
								</xsl:call-template>
							<span style="font-size:5.6pt;font-family:arial narrow;display:inline;">Some investment is not at risk.</span>
							</label>
						</div>
					</div>
					<!-- (34c) ////////////////////////////////////////////////////-->
					<div style="width:187mm;height:16mm;font-size:8.5pt;border-bottom:1.5px solid black">
							<div class="styLNLeftNumBox" style="width:8mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:142mm;height:16mm;padding-left:1mm;">
								You may have to complete <b>Form 8582</b> to determine your deductible loss, regardless of which<br/>
								box you checked.  If you checked box 34b, you <b>must</b> complete <b>Form 6198</b><br/>
								before going to Form 8582. In either case, enter the <b>deductible loss</b> here and on Schedule E<br/>
								<span style="float:left;">(Form 1040), line 40. See instructions </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="width:8mm;height:12mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:1px"/>
							<div class="styLNAmountBox" style="width:29mm;height:12mm;border-bottom-width:0px;border-top-width:1px"/>					
							<div class="styLNRightNumBox" style="width:8mm;height:4mm;">34c</div>
							<div class="styLNAmountBox" style="width:29mm;height:4mm;float:right;font-size:7pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4835Data/FarmRentalDeductibleLossAmt" />
								</xsl:call-template>     
							</div>
						</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:both;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
							<span style="width:13mm;"/>                        
							Cat. No. 13117W
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">4835</span> (2018)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">Additional Data   </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form4835Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						
						<!--<xsl:if test="$Form4835Data/Section263AIndicatorCd">-->
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part II - Line 19b - Form1098 Recipients Statement</xsl:with-param>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
								<xsl:with-param name="TargetNode" select="$Form4835Data/MortgageInterestPaidOtherAmt/@attachmentIndicatorCd"/>
							</xsl:call-template>
						<!--</xsl:if>-->
						<xsl:if test="$Form4835Data/Section263AIndicatorCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part II - Line 30 (g) - Section 263A Indicator Code</xsl:with-param>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
								<xsl:with-param name="TargetNode" select="$Form4835Data/Section263AIndicatorCd"/>
							</xsl:call-template>
						</xsl:if>
						
						<xsl:if test="$Form4835Data/NetFarmRentalIncomeOrLossAmt/@passiveActivityLossLiteralCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part II - Line 32 - Passive Activity Loss Literal Code</xsl:with-param>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
								<xsl:with-param name="TargetNode" select="$Form4835Data/NetFarmRentalIncomeOrLossAmt/@passiveActivityLossLiteralCd"/>
							</xsl:call-template>
						</xsl:if>
					</table>
					<xsl:if test="($Print = $Separated) and (count($Form4835Data/OtherExpense) &gt; 7)">
						<span class="styRepeatingDataTitle" style="">Form 4835, Line 30 -  Other Expense</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:100mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:10%;">
								Letter
							</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:55%;">
								Description
							</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:35%;">
								Amount
							</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form4835Data/OtherExpense">
									<xsl:variable name="Letter">
										<xsl:number format="a"/>
									</xsl:variable>
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellText" style="width:10%;text-align:center;">
											<xsl:value-of select="$Letter"/>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellText" style="width:55%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Description"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellText" style="width:35%;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amount"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
