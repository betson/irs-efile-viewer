<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="W2CMStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormW2CMData" select="$RtnDoc/W2CM"/>
	<!-- Create Form Header -->
	<!-- ////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="CreateFormHeader">
		<div class="styW2CMCleanDiv" style="float:none;clear:both;width:187mm;border-width:0px 0px 0px 0px;height:auto;">
			<!-- Left (Top) -->
			<div class="styW2CMCleanDiv" style="width:60%;height:13mm;border-left-width:0px;">
				<div class="styW2CMCleanDiv" style="width:30%;height:100%;border-left-width:0px;">
					<span style="width:100%;padding-top:1.5mm;">Form<span style="width:auto;font-family:arial;font-size:20pt;padding-left:3mm;font-weight:bold">W-2CM</span>
					</span>
				</div>
				<div class="styW2CMCleanDiv" style="width:25%;height:100%;border-left-width:0px;">
					<span style="font-family:arial;font-size:10pt;width:100%;text-align:left;padding-top:1.5mm;padding-left:1.5mm">
            Wage and Tax<br/> Statement
          </span>
				</div>
				<div class="styW2CMCleanDiv" style="width:45%;height:100%;border-left-width:0px;">
					<div class="styTY" style="float:left;clear:none;height:100%;font-size:25pt;padding-top:1mm;padding-left:3mm;">
            20<span class="stytycolor">13</span>
					</div>
				</div>
			</div>
			<!-- Right -->
			<div class="styW2CMCleanDiv" style="width:40%;height:24mm;float:right;border-left-width:0px;">
				<span class="styAgency" style="font-weight:bold;font-size:8pt;font-family:Arial;width:100%;text-align:right;float:right;padding-top:1.5mm;">
          Department of Finance<br/>
          Division of Revenue and Taxation<br/>
          Commonwealth of the Northern Mariana Islands
        </span>
			</div>
			<!-- Left (Bottom) -->
			<div class="styW2CMCleanDiv" style="font-weight:bold;font-size:8pt;font-family:Arial;width:60%;height:11mm;border-left-width:0px;">
        Copy 1 For Division of Revenue and Taxation
			</div>
		</div>
	</xsl:template>
	
	<!-- Create Line 12 Blank Rows -->
	<xsl:template name="CreateLine12BlankTableRows">
		<xsl:param name="AddAdditionalMessage"/>
		<xsl:param name="Letter"/>
		<tr style="">
			<td style="height:12.3mm">
				<div class="styGenericDiv" style="height:7.5mm;border-bottom:1px solid black;width:100%">
					<span style="font-weight:bold;font-size:7.5pt;font-weight:bold;padding-top:0mm;">
						<xsl:value-of select="concat('12', $Letter)"/>
					</span>
					<span style="font-size:5pt;padding-top:0mm;padding-left:3px;">Code</span>
					<xsl:if test="$Letter='a'">
						<span style="font-size:7pt;font-family:arial;padding-left:3mm">Amount (see instructions) </span>
					</xsl:if>
					<div class="styGenericDiv" style="height:7.5mm;border-right:1px solid black;width:26%;">
					</div>
					<div class="styGenericDiv" style="height:7.5mm;width:74%;padding-left:3px;"><br/>
						<xsl:if test="$AddAdditionalMessage">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormW2CMData/NonUSEmployersUseGrp"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
			
			</td>
		</tr>
	</xsl:template>
	<!-- Create Line 12 Table Rows -->
	<!-- ////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="CreateLine12TableRows">
		<xsl:param name="AddAdditionalMessage"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="Letter"/>
		<!-- IsLast -->
		<xsl:variable name="IsLast">
			<xsl:if test="((position() = last()) and $TargetNode) or (not($TargetNode) and ($Letter = 'd'))">
        border-bottom-width:0px;
      </xsl:if>
		</xsl:variable>
		<tr>
			<xsl:attribute name="style">
        width:100%;height:auto;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
			<td class="styW2CMTableCell">
				<xsl:attribute name="style">
        width:100%;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="(position() != 1) or ($Letter != 'a')">
					<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
						<div class="styW2CMLNLeftNumBox" style="width:auto;padding-left:1.2mm;">
							<xsl:value-of select="concat('12', $Letter)"/>
						</div>
					</div>
				</xsl:if>
				<div class="styW2CMLNDesc" style="width:100%;text-align:center;height:32px">
					<div class="styW2CMCleanDiv" style="width:4%;border-left-width:0px;height:100%;padding:0px 0px 0px 0px;">
						<div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;border-right-width:0px;padding-bottom:.1mm">c o d e</div>
					</div>
					<div class="styW2CMCleanDiv" style="width:20%;height:100%;padding-top:1mm;border-left-width:0px;">
						<div class="styW2CMLNDesc" style="width:auto;text-align:center;padding-left:3mm;">
							<xsl:if test="$TargetNode">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div class="styW2CMCleanDiv">
						<xsl:attribute name="style">
              width:auto;height:100%;padding-top:1mm;float:right;padding-right:3mm;
              <xsl:if test="$AddAdditionalMessage">
                padding-top:0mm;
              </xsl:if></xsl:attribute>
						<div class="styW2CMLNDesc" style="width:26mm;">
							<xsl:if test="$TargetNode">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseAmt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$AddAdditionalMessage">
								<xsl:if test="((count($FormW2CMData/EmployersUseAmt) &gt;4) and ($Print = $Separated))">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployersUseAmt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="CreateLine12TableRowsColored">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Letter"/>
		<!-- IsLast -->
		<xsl:variable name="IsLast">
			<xsl:if test="position() = last()">
        border-bottom-width:0px;
      </xsl:if>
		</xsl:variable>
		<tr>
			<xsl:attribute name="style">
        width:100%;height:5mm;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
			<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
			<td class="styW2CMTableCell" style="width:40%;text-align:center;height:5mm;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseCd"/>
				</xsl:call-template>
			</td>
			<td class="styW2CMTableCell" style="width:60%;text-align:right;border-left-width:1px;height:5mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseAmt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Populate Left Over Checkbox-->
	<!-- ////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="PopulateLeftOverCheckbox">
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="BackupName"/>
		<xsl:param name="DescWidth">100</xsl:param>
		<xsl:param name="AmountWidth" select="187 - $DescWidth"/>
		<xsl:if test="$TargetNode">
			<tr>
				<td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
							<xsl:with-param name="BackupName">
								<xsl:value-of select="$BackupName"/>
							</xsl:with-param>
						</xsl:call-template>
						<xsl:value-of select="$Desc"/>:
          </label>
				</td>
				<td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
					<input class="styCkbox" type="checkbox" style="width:4mm;">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
							<xsl:with-param name="BackupName">
								<xsl:value-of select="$BackupName"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormW2CMData)"/>
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
				<meta name="Description" content="IRS Form W2CM"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="W2CMStyle"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="W2CM">
					<xsl:call-template name="DocumentHeader"/>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="styGenericDiv" style="border:1px black solid;width:187mm;height:auto;">
						<!-- Header -->
						<div class="styW2CMLineItemBB">
							<!-- Void Checkbox -->
							<div class="styW2CMCleanDiv" style="width:22.1%;height:100%;text-align:center;border-right-width:1px;">
								<span style="width:100%;padding-top:3mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/VoidInd"/>
											<xsl:with-param name="BackupName">FormW2CMDataVoidInd</xsl:with-param>
										</xsl:call-template>
                    VOID
                  </label>
									<span style="width:4px;"/>
									<input class="styCkbox" type="checkbox" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/VoidInd"/>
											<xsl:with-param name="BackupName">FormW2CMDataVoidInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<!-- (a) ////////////////////////////////////////////////////-->
							<div class="styW2CMCleanDiv" style="width:28%;height:100%;border-width:2px 2px 2px 2px;">
								<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">a</div>
									<div class="styW2CMLNDesc" style="width:auto;">Employee's social security number</div>
								</div>
								<span style="text-align:center;width:100%;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployeeSSN"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- For Revenue and Taxation Use Only -->
							<div class="styW2CMCleanDiv" style="width:28%;height:100%;">
								<div class="styW2CMLNDesc" style="width:100%;font-size:8pt;padding-left:5px;">
									<div class="styW2CMCleanDiv" style="width:auto;border-left-width:0px;">
										<span class="styBoldText">For Revenue and <br/>Taxation Use Only</span>
									</div>
									<div class="styW2CMCleanDiv" style="padding-top:1mm;width:auto;border-left-width:0px;padding-left:5px;">
										<img src="{$ImagePath}/W2VI_Bullet.gif" alt="Bullet"/>
									</div>
								</div>
							</div>
						</div>
						<!-- (b)(1)(2) ////////////////////////////////////////////////////-->
						<div class="styW2CMLineItemBB">
							<!-- (b) Employer identification number (EIN)-->
							<div class="styW2CMCleanDiv" style="width:50%;height:100%;border-left-width:0px;">
								<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">b</div>
									<div class="styW2CMLNDesc" style="width:auto;">Employer identification number (EIN)</div>
								</div>
								<div class="styW2CMLNDesc" style="width:100%;padding-left:7.5mm;padding-right:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployerEIN"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- (1) Wages, tips, other compensation-->
							<div class="styW2CMCleanDiv" style="width:24.8%;height:100%;">
								<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">1</div>
									<div class="styW2CMLNDesc" style="width:auto;">Wages, tips, other compensation</div>
								</div>
								<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:1mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormW2CMData/WagesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- (2) Samoa income tax withheld-->
							<div class="styW2CMCleanDiv" style="width:24.9%;height:100%;">
								<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">2</div>
									<div class="styW2CMLNDesc" style="width:auto;">Income tax withheld (NMTIT chapter 7)</div>
								</div>
								<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormW2CMData/CNMIWithholdingAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (c)(3)(4)(5)(6)(7)(8) /////////////////////////////////////-->
						<div class="styW2CMLineItemBB">
							<!-- (c) Employer's name, address, and ZIP code-->
							<div class="styW2CMCleanDiv" style="width:50%;height:100%;border-left-width:0px;">
								<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">c</div>
									<div class="styW2CMLNDesc" style="width:auto;">Employer's name, address, and ZIP code</div>
								</div>
								<div class="styW2CMLNDesc" style="width:100%;padding-left:7.5mm;padding-right:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployerName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormW2CMData/EmployerName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployerName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<br/>
									<xsl:choose>
										<xsl:when test="$FormW2CMData/EmployerUSAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployerUSAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployerOtherForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Employer Name Control</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployerNameControlTxt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styW2CMCleanDiv" style="width:49.9%;height:100%;border-left-width:0px;">
								<!-- (3)(4) -->
								<div class="styW2CMLineItemBB">
									<!-- (3) Social security wages-->
									<div class="styW2CMCleanDiv" style="width:49.8%;height:100%;">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">3</div>
											<div class="styW2CMLNDesc" style="width:auto;">Social security wages</div>
										</div>
										<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:1mm;padding-top:2mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2CMData/SocialSecurityWagesAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- (4) Social security tax withheld-->
									<div class="styW2CMCleanDiv" style="width:49%;height:100%;">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">4</div>
											<div class="styW2CMLNDesc" style="width:auto;">Social security tax withheld</div>
										</div>
										<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-top:2mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2CMData/SocialSecurityTaxAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- (5)(6) -->
								<div class="styW2CMLineItemBB">
									<!-- (5) Medicare wages and tips-->
									<div class="styW2CMCleanDiv" style="width:49.8%;height:100%;">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">5</div>
											<div class="styW2CMLNDesc" style="width:auto;">Medicare wages and tips</div>
										</div>
										<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:1mm;padding-top:2mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2CMData/MedicareWagesAndTipsAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- (6) Medicare tax withheld-->
									<div class="styW2CMCleanDiv" style="width:49%;height:100%;">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">6</div>
											<div class="styW2CMLNDesc" style="width:auto;">Medicare tax withheld</div>
										</div>
										<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-top:2mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2CMData/MedicareTaxWithheldAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- (7)(8) -->
								<div class="styW2CMLineItemBB" style="border-bottom-width:0px;">
									<!-- (7) Social security tips-->
									<div class="styW2CMCleanDiv" style="width:49.8%;height:100%;">
										<div class="styW2CMCleanDiv" style="width:100%;height:8.5mm;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">7</div>
											<div class="styW2CMLNDesc" style="width:auto;">Social security tips</div>
										</div>
										<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:1mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2CMData/SocialSecurityTipsAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- (8) -->
									<div class="styW2CMCleanDiv" style="width:49.9%;height:100%;">
										<div class="styW2CMCleanDiv" style="width:100%;height:8.5mm;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">8</div>
											<div class="styW2CMLNDesc" style="width:auto;">Allocated tips</div>
											<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:1mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormW2CMData/AllocatedTipsAmt"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- (d)(9)(10) ////////////////////////////////////////////////////-->
						<div class="styW2CMLineItemBB">
							<!-- (d) Control number-->
							<div class="styW2CMCleanDiv" style="width:50%;height:100%;border-left-width:0px;">
								<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">d</div>
									<div class="styW2CMLNDesc" style="width:auto;">Control number (Serial number)</div>
								</div>
								<div class="styW2CMLNDesc" style="width:100%;padding-left:7.5mm;padding-right:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormW2CMData/ControlNum"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- (9) -->
							<div class="styW2CMCleanDiv" style="width:24.8%;height:100%;background-color:lightgrey">
								<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styW2CMLNLeftNumBox" style="padding-right:9px;background-color:white;">9</div>
								</div>
							</div>
							<!-- (10)-->
							<div class="styW2CMCleanDiv" style="width:25%;height:100%;">
								<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">10</div>
									<div class="styW2CMLNDesc" style="width:auto;">Dependent care benefits</div>
									<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:1mm;padding-top:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/DependentCareBenefitsAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						
						<!-- NEW SECTION TEST -->
						
						<div class="styW2CMLineItemBB" style="border-bottom:1px solid black;">
					<div class="styW2CMCleanDiv" style="width:50%;height:100%;border-left-width:0px;float:left;">
						<!-- (e) Employee's first name and initial // Last Name // Suff.-->
						<div class="styGenericDiv" style="border-bottom:1px black dashed;height:13mm;width:100%;">
							<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">e</div>
							<div class="styGenericDiv" style="height:100%;width:44mm;padding-top:.6mm;">
								Employee's first name and initial
								<br/>
								<span style="font-size:4pt;"><br/></span>
								<div class="styW2CMLNDesc" style="width:100%;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployeeNm"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styGenericDiv" style="height:100%;width:34mm;padding-top:.6mm;padding-left:2mm;border-left:1px solid black">
								Last name
							</div>
							<div class="styGenericDiv" style="height:100%; width:7mm;padding-top:.6mm;padding-left:2mm;border-left:1px solid black">
								Suff.
							</div>
						</div>
						<!-- (f) Employee's address and ZIP code-->
						<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-left-width:0px;">
							<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
								<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">f</div>
								<div class="styW2CMLNDesc" style="width:auto;">Employee's address and ZIP code</div>
							</div>
							<div class="styW2CMLNDesc" style="width:100%;padding-left:7mm;padding-top:1mm;word-wrap:break-word;height:40%;">
								<xsl:if test="$FormW2CMData/EmployeeUSAddress">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployeeUSAddress"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormW2CMData/EmployeeOtherForeignAddress">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployeeOtherForeignAddress"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<div class="styW2CMCleanDiv" style="width:24.95%;height:100%;float:left;border-right:1px solid black;">
						<!-- (11) Nonqualified plans-->
						<div class="styW2CMCleanDiv" style="width:100%;height:13mm;border-bottom-width:1px;border-left-width:0px;border-right:0px solid black">
							<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
								<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">11</div>
								<div class="styW2CMLNDesc" style="width:auto;">Nonqualified plans</div>
							</div>
							<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:1mm;padding-top:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormW2CMData/NonqualifiedPlansAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (13) Statutory Employee / Retirement Plan / Third-party Sick Pay-->
						<div class="styW2CMCleanDiv" style="width:100%;height:48px;border-bottom-width:1px;border-left-width:0px;border-right:0px solid black">
							<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
								<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">13</div>
								<div class="styW2CMLNDesc" style="width:auto;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/StatutoryEmployeeInd"/>
											<xsl:with-param name="BackupName">FormW2CMDataStatutoryEmployeeInd</xsl:with-param>
										</xsl:call-template>
										<span style="font-size:6pt">Statutory<br/>employee<br/>
										</span>
									</label>
									<input class="styCkbox" type="checkbox" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/StatutoryEmployeeInd"/>
											<xsl:with-param name="BackupName">FormW2CMDataStatutoryEmployeeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<span style="width:3mm;float:left;"/>
								<div class="styW2CMLNDesc" style="width:auto;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/RetirementPlanInd"/>
												<xsl:with-param name="BackupName">FormW2CMDataRetirementPlanInd</xsl:with-param>
										</xsl:call-template>
										<span style="font-size:6pt">Retirement<br/>plan<br/>
										</span>
									</label>
									<input class="styCkbox" type="checkbox" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/RetirementPlanInd"/>
											<xsl:with-param name="BackupName">FormW2CMDataRetirementPlanInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<span style="width:3mm;float:left;"/>
								<div class="styW2CMLNDesc" style="width:auto;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/ThirdPartySickPayInd"/>
											<xsl:with-param name="BackupName">FormW2CMDataThirdPartySickPayInd</xsl:with-param>
										</xsl:call-template>
										<span style="font-size:6pt">Third-party<br/>sick pay<br/>
										</span>
									</label>
									<input class="styCkbox" type="checkbox" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/ThirdPartySickPayInd"/>
											<xsl:with-param name="BackupName">FormW2CMDataThirdPartySickPayInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
						</div>
						<!-- (14) Other-->
						<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-bottom-width:0px;border-left-width:0px;border-right:0px solid black;">
							<!-- (14a) -->
							<div class="styGenericDiv" style="border-right:1px solid black;width:49.9%;height:auto;">
								<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">14a</div>
									<div class="styW2CMLNDesc" style="width:auto;">Other</div>
									<div class="styW2CMLNDesc" style="width:100%;text-align:left;padding-right:1mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/OtherDeductionsBenefitsGrp/Desc"/>
										</xsl:call-template>
									</div>
									<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:0mm;padding-top:6px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/OtherDeductionsBenefitsGrp/Amt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- 14b -->
							<div class="styGenericDiv" style="width:49.9%;height:100%;border-left:0px solid black;">
								<div class="styW2CMCleanDiv" style="width:100%;border-width:0px 0px 0px 0px;">
									<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">14b</div>
									<div class="styW2CMLNDesc" style="width:auto;"/>
									<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:1mm;padding-top:23px">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormW2CMData/CNMIOtherDeductionsBenefitsCd"/>
										</xsl:call-template>
									</div>									
								</div>								
							</div>							
						</div>											
					</div>
					<!-- (12 a...) See the separate instructions-->
					<div class="styW2CMCleanDiv" style="width:25%;height:auto;border-bottom:0px solid black;border-left:0px solid black;">
						<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$FormW2CMData/NonUSEmployersUseGrp"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="containerID" select=" 'NonUSEmployersUseGrpDiv' "/>
							<xsl:with-param name="headerRowCount" select="0"/>
						</xsl:call-template>
						<div class="styTableContainer" id="NonUSEmployersUseGrpDiv" style="border-bottom:0px">
							<xsl:call-template name="SetInitialState"/>
							<xsl:attribute name="style">
								width:100%;padding-bottom:2px;border-bottom:0px;
								<xsl:if test="($Print='inline' or $Print='separated')">
									overflow:visible;
								</xsl:if>
							</xsl:attribute>
							<table class="styTable" style="border-bottom-width:0px;height:auto;width:100%" cellspacing="0">
								<thead/>
								<tfoot/>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($FormW2CMData/NonUSEmployersUseGrp) &lt;=4)">
										<xsl:for-each select="$FormW2CMData/NonUSEmployersUseGrp">
											<tr style="">
												<td style="height:12.3mm">
													<xsl:variable name="Letter">
														<xsl:number format="a"/>
													</xsl:variable>
													<!--<xsl:if test="($Print != $Separated) or (count($FormW2CMData/NonUSEmployersUseGrp) &lt;=4)">-->
													<div class="styGenericDiv" style="height:7.5mm;width:100%;border-bottom:1px solid black">
														<span style="font-weight:bold;font-size:7.5pt;font-weight:bold;padding-top:0mm">
															<xsl:value-of select="concat('12', $Letter)"/>
														</span>
														<span style="font-size:5pt;padding-top:0mm;padding-left:3px;">Code</span>
														<xsl:if test="position()=1">
															<span style="font-size:7pt;font-family:arial;padding-left:3mm">Amount (see instructions) </span>
														</xsl:if>
														<div class="styGenericDiv" style="height:7.5mm;padding-top:5mm;padding-bottom:0mm;border-right:1px solid black;width:26%">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EmployersUseCd"/>
															</xsl:call-template>
														</div>
														<div class="styGenericDiv" style="height:7.5mm;padding-top:5mm;text-align:right;width:74%;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
															</xsl:call-template>
														</div>
													</div>
													<!--</xsl:if>-->
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="count($FormW2CMData/NonUSEmployersUseGrp) &lt; 1 or ((count($FormW2CMData/NonUSEmployersUseGrp) &gt;4) and ($Print = $Separated))">
										<xsl:call-template name="CreateLine12BlankTableRows">
											<xsl:with-param name="Letter">a</xsl:with-param>
											<xsl:with-param name="AddAdditionalMessage">true</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="count($FormW2CMData/NonUSEmployersUseGrp) &lt; 2 or ((count($FormW2CMData/NonUSEmployersUseGrp) &gt;4) and ($Print = $Separated))">
										<xsl:call-template name="CreateLine12BlankTableRows">
											<xsl:with-param name="Letter">b</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="count($FormW2CMData/NonUSEmployersUseGrp) &lt; 3 or ((count($FormW2CMData/NonUSEmployersUseGrp) &gt;4) and ($Print = $Separated))">
										<xsl:call-template name="CreateLine12BlankTableRows">
											<xsl:with-param name="Letter">c</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
										<xsl:if test="count($FormW2CMData/NonUSEmployersUseGrp) &lt; 4 or ((count($FormW2CMData/NonUSEmployersUseGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="CreateLine12BlankTableRows">
												<xsl:with-param name="Letter">d</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
								</tbody>
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormW2CMData/NonUSEmployersUseGrp"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="headerRowCount" select="0"/>
							<xsl:with-param name="containerID" select=" 'NonUSEmployersUseGrpDiv' "/>
						</xsl:call-template>
					</div>				
				</div>
						
						<!--END OF NEW SECTION TEST-->
						
						<!--TABLE TEST-->
						
						
						
						<!-- END OF TABLE TEST-->
						
						<!-- //////(e)(f)(15)(16)(17)(11)(13)(14a)(14b)////////////-->
						<div class="styW2CMLineItemBB" style="border-bottom:0px solid black;">
							<div class="styW2CMCleanDiv" style="width:50%;height:13mm;border-left-width:0px;">
								<!-- (15)(16)(17)-->
								<div class="styGenericDiv" style="border-bottom:1px black solid;border-top:0px solid black;height:13mm;width:100%;">
									<div class="styGenericDiv" style="height:13mm;width:33%;">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">15</div>
											<div class="styW2CMLNDesc" style="width:auto;border-width:0px 0px 0px 0px;">CNMI Tax ID<br/>number
											</div>
										</div>
										<div class="styGenericDiv" style="text-align:center;width:100%;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormW2CMData/CNMITaxIdNum"/>
												</xsl:call-template>
											</div>																			
									</div>
									<div class="styGenericDiv" style="height:13mm;width:33%;border-left:1px solid black">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">16</div>
											<div class="styW2CMLNDesc" style="width:auto;border-width:0px 0px 0px 0px;">
												Wages and salary (CNMI)
											</div>
										</div>
										<div class="styGenericDiv" style="padding-left:6mm;padding-right:1mm;text-align:right;width:100%;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormW2CMData/CNMIWagesSalaryAmt"/>
												</xsl:call-template>
										</div>										
									</div>
									<div class="styGenericDiv" style="height:13mm;width:33%;border-left:1px solid black">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">17</div>
											<div class="styW2CMLNDesc" style="width:auto;border-width:0px 0px 0px 0px;">
												Wage &amp; salary tax withheld (chapter 2)
											</div>
										</div>																					
										<div class="styGenericDiv" style="padding-left:6mm;text-align:right;width:100%;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2CMData/WagesAndSalariesTaxWthldAmt"/>
											</xsl:call-template>
										</div>										
									</div>
								</div>								
							</div>
							<!-- A Location Code and B Days out of the CNMI -->
								<div class="styW2CMCleanDiv" style="width:25%;height:13mm;border-width:0px 0px 1px 0px;">
									<!-- A Location Code -->
									<div class="styGenericDiv" style="border-left:1px solid black;border-right:1px solid black;width:49.9%;height:100%;">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:5px;border-width:0px 0px 0px 0px;width:5mm;">A</div>
											<div class="styW2CMLNDesc" style="width:auto;border-width:0px 0px 0px 0px;">Location Code<br/><br/></div>
											<div class="styW2CMLNDesc" style="width:100%;text-align:center;border-width:0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormW2CMData/LocationCd"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
									<!-- B Days out of the CNMI -->
									<div class="styGenericDiv" style="border-right:1px solid black;width:50%;height:13mm;">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">B</div>
											<div class="styW2CMLNDesc" style="width:auto;">Days out of the CNMI</div>
											<div class="styW2CMLNDesc" style="width:100%;text-align:right;padding-right:1mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormW2CMData/DaysOutOfCNMICnt"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
								
								<!-- C Citizenship code-->
						<div class="styW2CMCleanDiv" style="width:25%;height:13mm;border-width:0px 0px 0px 0px;">
								<div class="styGenericDiv" style="border-left:0px solid black;border-right:1px solid black;border-bottom:1px solid black;width:50%;height:100%;">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:5px;border-width:0px 0px 0px 0px;width:5mm;">C</div>
											<div class="styW2CMLNDesc" style="width:auto;border-width:0px 0px 0px 0px;">Citizenship Code</div>
											<div class="styW2CMLNDesc" style="width:100%;text-align:center;border-width:0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormW2CMData/CitizenCd"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
										<div class="styGenericDiv" style="width:50%;height:13.3mm;background-color:lightgrey;"/>
							</div>
														
							
						</div>													
					
					<div class="styW2CMLineItemBB" style="height:13mm;">
						<div class="styGenericDiv" style="height:100%;width:50%;background-color:lightgrey"/>
						<div class="styW2CMCleanDiv" style="width:25%;height:13mm;border-width:0px 0px 0px 0px;">
									<!-- D NAICS -->
									<div class="styGenericDiv" style="border-left:1px solid black;border-right:1px solid black;width:49.9%;height:13mm;">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="width:5mm;padding-right:5px;">D</div>
											<div class="styW2CMLNDesc" style="width:auto;">NAICS<br/><br/></div>
											<div class="styW2CMLNDesc" style="width:100%;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormW2CMData/PrincipalBusinessActivityCd"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
									<!-- E SOC -->
									<div class="styGenericDiv" style="border-right:1px solid black;width:49.9%;height:13mm;">
										<div class="styW2CMCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styW2CMLNLeftNumBox" style="padding-right:9px;">E</div>
											<div class="styW2CMLNDesc" style="width:auto;">SOC<br/><br/></div>
											<div class="styW2CMLNDesc" style="width:100%;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormW2CMData/StandardOccupationalCodeNum"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
						</div>
						<div class="styW2CMCleanDiv" style="width:25%;height:13mm;border-width:0px 0px 0px 0px;">
							<div class="styGenericDiv" style="width:100%;height:13mm;">
										<div class="styGenericDiv" style="width:50%;height:100%;border-top:0px solid black;border-right:1px solid black;border-left:0px solid black;background-color:lightgrey"/>
										<div class="styGenericDiv" style="width:50%;height:100%;border-width:0px 0px 0px 0px;background-color:lightgrey;"/>
							</div>
						</div>
					</div>
				</div>
						

					
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<xsl:call-template name="CreateFormHeader"/>
					<div class="pageEnd" style="float:none;clear:both;width:187mm;font-size:1pt;"/>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
              Additional Data        
            </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<xsl:variable name="TableWidth">100</xsl:variable>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormW2CMData"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line C - Employer Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormW2CMData/EmployerNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
					<!-- Separated Data for Line 12 -->
					<xsl:if test="($Print = $Separated) and  (count($FormW2CMData/NonUSEmployersUseGrp) &gt; 4)">
						<span class="styRepeatingDataTitle">
              Form W-2CM - Line 12
            </span>
						<table class="styDepTbl" cellspacing="0" style="width:187mm;">
							<thead>
								<tr class="styDepTblHdr">
									<th class="styW2CMTableCell" scope="col" style="width:40%;height:5mm;color:white;">Code</th>
									<th class="styW2CMTableCell" scope="col" style="width:60%;height:5mm;color:white;border-left-width:1px;">Amount</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormW2CMData/NonUSEmployersUseGrp">
									<xsl:variable name="Letter">
										<xsl:number format="a"/>
									</xsl:variable>
									<xsl:call-template name="CreateLine12TableRowsColored">
										<xsl:with-param name="Letter" select="$Letter"/>
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>