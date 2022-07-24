<?xml version="1.0" encoding="UTF-8"?>
<!-- Updated By Iskilu Lawal 04/20/2020 UWR # 231539  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRSW2GUStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormW2GUData" select="$RtnDoc/IRSW2GU"/>
	<!-- Create Form Header -->
	<!-- ////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="CreateFormHeader">
		<div class="styIRSW2GUCleanDiv" style="float:none;clear:both;width:187mm;border-width:0px 0px 0px 0px;height:auto;">
			<!-- Left (Top) -->
			<div class="styIRSW2GUCleanDiv" style="width:60%;height:13mm;border-left-width:0px;">
				<div class="styIRSW2GUCleanDiv" style="width:30%;height:100%;border-left-width:0px;">
					<span class="styBoldText" style="width:100%;padding-top:1.5mm;">Form<span style="width:auto;font-family:arial;font-size:20pt;padding-left:3mm;">W-2GU</span>
					</span>
				</div>
				<div class="styIRSW2GUCleanDiv" style="width:43%;height:100%;border-left-width:0px;">
					<span class="styMainTitle" style="font-size:10pt;width:100%;text-align:left;padding-top:1.5mm;padding-left:1.5mm">
            Guam<br/>
            Wage and Tax Statement
          </span>
				</div>
				<div class="styIRSW2GUCleanDiv" style="width:27%;height:100%;border-left-width:0px;">
					<div class="styTY" style="float:left;clear:none;height:100%;font-size:25pt;padding-top:1mm;padding-left:7mm;">
            20<span class="styTYColor">20</span>
					</div>
				</div>
			</div>
			<!-- Right -->
			<div class="styIRSW2GUCleanDiv" style="width:40%;height:24mm;float:right;border-left-width:0px;">
				<span class="styAgency" style="font-size:7.5pt;font-family:Arial;width:100%;text-align:right;float:right;padding-top:1.5mm;">
          Department of the Treasury<img src="{$ImagePath}/W2GU_Short_Line.gif" alt="Line image"/>Internal Revenue Service
        </span>
				<span class="styBoldText" style="width:100%;text-align:right;">
					<br/>
          For Privacy Act and Paperwork Reduction Act<br/>
          Notice, see the separate instructions.
        </span>
				<span class="styNormalText" style="width:100%;text-align:right;padding-top:1mm;">
					<b>Cat. No.</b> 16026K
        </span>
			</div>
			<!-- Left (Bottom) -->
			<div class="styIRSW2GUCleanDiv" style="width:60%;height:11mm;border-left-width:0px;">
				<b>Copy A For Social Security Administration</b>
				<img src="{$ImagePath}/W2GU_Short_Line.gif" alt="Line image"/>Send this entire page with Copy A of<br/>
        Form W-3SS to the Social Security Administration; photocopies are <b>not</b> acceptable.
      </div>
		</div>
		<div class="pageEnd" style="width:187mm;font-size:7pt;font-family:arial;text-align:center;">
			<span class="styBoldText" style="width:100%;font-size:11pt;">
        Do Not Cut, Fold, or Staple Forms on This Page
        <!--<img src="{$ImagePath}/W2GU_Short_Line.gif" alt="Line image"/>
        Do Not Cut, Fold, or Staple Forms on This Page-->
				<br/>
				<br/>
			</span>
		</div>
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
		<xsl:variable name="IsB">
			<xsl:if test="(($Letter = 'b') and ($Print != $Separated))">
        border-top-width:1px;
        <xsl:if test="EmployersUseCd">
        border-top-width:0px;
        </xsl:if>
			</xsl:if>
		</xsl:variable>
		<tr>
			<xsl:attribute name="style">
        width:100%;height:auto;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
			<td class="styIRSW2GUTableCell">
				<xsl:attribute name="style">
        width:100%;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="(position() != 1) or ($Letter != 'a')">
					<div class="styIRSW2GUCleanDiv">
						<xsl:attribute name="style">width:100%;height:auto;border-width:0px 0px 0px 0px;<xsl:value-of select="$IsB"/></xsl:attribute>
						<div class="styIRSW2GULNLeftNumBox" style="width:auto;padding-left:1.2mm;">
							<xsl:value-of select="concat('12', $Letter)"/>
						</div>
					</div>
				</xsl:if>
				<div class="styIRSW2GULNDesc" style="width:100%;text-align:center;height:10.5mm;">
					<div class="styIRSW2GUCleanDiv" style="width:4%;border-left-width:0px;height:auto;padding:0px 0px 0px 0px;">
						<div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;border-right-width:0px;padding-bottom:.1mm">C o d e</div>
					</div>
					<div class="styIRSW2GUCleanDiv" style="width:auto;height:auto;padding-top:1mm;border-left-width:0px;">
						<div class="styIRSW2GULNDesc" style="width:auto;text-align:center;padding-left:10mm;">
							<xsl:if test="$TargetNode">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div class="styIRSW2GUCleanDiv">
						<xsl:attribute name="style">
              width:auto;height:10mm;padding-top:1mm;float:right;padding-right:3mm;
              <xsl:if test="$AddAdditionalMessage">
                padding-top:0mm;
              </xsl:if></xsl:attribute>
						<div class="styIRSW2GULNDesc" style="text-align:right;width:26mm;">
							<xsl:if test="$TargetNode">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseAmt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$AddAdditionalMessage">
								<xsl:if test="((count($FormW2GUData/NonUSEmployersUseGrp) &gt;4) and ($Print = $Separated))">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$FormW2GUData/NonUSEmployersUseGrp"/>
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
			<td class="styIRSW2GUTableCell" style="width:50%;text-align:right;height:10mm;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseCd"/>
				</xsl:call-template>
			</td>
			<td class="styIRSW2GUTableCell" style="width:50%;text-align:right;border-left-width:1px;height:5mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseAmt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Create Line 14 Table Rows -->
	<!-- ////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="CreateLine14TableRows">
		<xsl:param name="AddAdditionalMessage"/>
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
        height:29.4mm;border-right-width:0px;border-left-width:0px;width:100%;<xsl:value-of select="$IsLast"/></xsl:attribute>
			<td class="styIRSW2GUTableCell">
				<xsl:attribute name="style">
        width:100%;border-left-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$Letter and not($AddAdditionalMessage)">
					<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
						<div class="styIRSW2GULNLeftNumBox" style="width:auto;padding-left:1.2mm;padding-bottom:0.8mm">
							<xsl:value-of select="$Letter"/>
						</div>
					</div>
				</xsl:if>
				<div class="styIRSW2GULNDesc" style="width:100%;text-align:center;padding:0px 0px 0px 0px;height:auto;">
					<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;padding-top:0px;border-left-width:0px;">
						<div class="styIRSW2GULNDesc" style="width:100%;text-align:left;word-wrap:break-word;height:8mm;padding-top:0px;">
							<xsl:if test="$TargetNode">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/Desc"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$AddAdditionalMessage">
								<xsl:if test="((count($FormW2GUData/OtherDeductionsBenefitsGrp) &gt;1) and ($Print = $Separated))">
									<span style="width:100%;text-align:center;">
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$FormW2GUData/OtherDeductionsBenefitsGrp"/>
										</xsl:call-template>
									</span>
								</xsl:if>
							</xsl:if>
						</div>
					</div>
					<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;padding-top:0px;text-align:right;border-left-width:0px;">
						<div class="styIRSW2GULNDesc" style="width:100%;padding-top:0px;height:2.5mm;text-align:right;padding-right:1mm">
							<xsl:if test="$TargetNode">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$TargetNode/Amt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="CreateLine14TableRowsColored">
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
			<td class="styIRSW2GUTableCell" style="width:75%;text-align:left;height:5mm;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode/Desc"/>
				</xsl:call-template>
			</td>
			<td class="styIRSW2GUTableCell" style="width:25%;text-align:right;border-left-width:1px;height:5mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/Amt"/>
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
						<xsl:with-param name="RootElement" select="local-name($FormW2GUData)"/>
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
				<meta name="Description" content="IRS Form W2GU"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRSW2GUStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRSW2GU">
					<xsl:call-template name="DocumentHeader"/>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="styGenericDiv" style="border:1px black solid;width:187mm;height:auto;">
						<!-- Header -->
						<div class="styIRSW2GULineItemBB">
							<!-- 22222 -->
							<div class="styIRSW2GUCleanDiv" style="width:10%;height:100%;border-left-width:0px;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Corrected W2GU Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormW2GUData/CorrectedW2GUInd"/>
								</xsl:call-template>								
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Standard Or Non Standard Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormW2GUData/StandardOrNonStandardCd"/>
								</xsl:call-template>								
								<span class="styBoldText" style="font-size:12pt;width:100%;text-align:center;padding-bottom:2mm;">22222</span>
							</div>
							<!-- Void Checkbox -->
							<div class="styIRSW2GUCleanDiv" style="width:12%;height:100%;text-align:center;border-right-width:1px;">
								<span style="width:100%;padding-top:3mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormW2GUData/VoidInd"/>
											<xsl:with-param name="BackupName">FormW2GUDataVoidInd</xsl:with-param>
										</xsl:call-template>
                    Void
                  </label>
									<span style="width:4px;"/>
									<input class="styCkbox" type="checkbox" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormW2GUData/VoidInd"/>
											<xsl:with-param name="BackupName">FormW2GUDataVoidInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<!-- (a) ////////////////////////////////////////////////////-->
							<div class="styIRSW2GUCleanDiv" style="width:28%;height:100%;border-width:2px 2px 2px 2px;">
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">a</div>
									<div class="styIRSW2GULNDesc" style="width:auto;">Employee's social security number</div>
								</div>
								<span style="text-align:center;width:100%;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployeeSSN"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- For Official Use Only -->
							<div class="styIRSW2GUCleanDiv" style="width:28%;height:100%;">
								<div class="styIRSW2GULNDesc" style="width:100%;font-size:8pt;padding-left:5px;">
									<div class="styIRSW2GUCleanDiv" style="width:auto;border-left-width:0px;">
										<span class="styBoldText">For Official Use Only</span>
									</div>
									<div class="styIRSW2GUCleanDiv" style="width:auto;border-left-width:0px;padding-left:5px;">
										<img src="{$ImagePath}/W2GU_Bullet.gif" alt="Bullet"/>
									</div>
									<div class="styIRSW2GULNDesc" style="width:100%;border-left-width:0px;">
										<span class="styBoldText">OMB No. 1545-0008</span>
									</div>
								</div>
							</div>
						</div>
						<!-- (b)(1)(2) ////////////////////////////////////////////////////-->
						<div class="styIRSW2GULineItemBB">
							<!-- (b) Employer identification number (EIN)-->
							<div class="styIRSW2GUCleanDiv" style="width:50%;height:100%;border-left-width:0px;">
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">b</div>
									<div class="styIRSW2GULNDesc" style="width:auto;">Employer identification number (EIN)</div>
								</div>
								<div class="styIRSW2GULNDesc" style="width:100%;padding-left:7.5mm;padding-right:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployerEIN"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- (1) Wages, tips, other compensation-->
							<div class="styIRSW2GUCleanDiv" style="width:25%;height:100%;">
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">1</div>
									<div class="styIRSW2GULNDesc" style="width:auto;">Wages, tips, other compensation</div>
								</div>
								<div class="styIRSW2GULNDesc" style="width:100%;text-align:right;padding-right:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormW2GUData/WagesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- (2) Guam income tax withheld-->
							<div class="styIRSW2GUCleanDiv" style="width:24.25%;height:100%;">
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">2</div>
									<div class="styIRSW2GULNDesc" style="width:auto;">Guam income tax withheld</div>
								</div>
								<div class="styIRSW2GULNDesc" style="width:100%;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormW2GUData/GuamWithholdingAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (c)(3)(4)(5)(6)(7)(8) /////////////////////////////////////-->
						<div class="styIRSW2GULineItemBB" style="height:31mm;">
							<!-- (c) Employer's name, address, and ZIP code-->
							<div class="styIRSW2GUCleanDiv" style="width:50%;height:100%;border-left-width:0px;">
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">c</div>
									<div class="styIRSW2GULNDesc" style="width:auto;">Employer's name, address, and ZIP code</div>
								</div>
								<div class="styIRSW2GULNDesc" style="width:100%;padding-left:7.5mm;padding-right:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployerName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormW2GUData/EmployerName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployerName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<br/>
									<xsl:choose>
										<xsl:when test="$FormW2GUData/EmployerUSAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployerUSAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployerForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Employer Name Control</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployerNameControlTxt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styIRSW2GUCleanDiv" style="width:49.9%;height:100%;border-left-width:0px;">
								<!-- (3)(4) -->
								<div class="styIRSW2GULineItemBB">
									<!-- (3) Social security wages-->
									<div class="styIRSW2GUCleanDiv" style="width:50%;height:100%;">
										<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">3</div>
											<div class="styIRSW2GULNDesc" style="width:auto;">Social security wages</div>
										</div>
										<div class="styIRSW2GULNDesc" style="width:100%;text-align:right;padding-right:1mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2GUData/SocialSecurityWagesAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- (4) Social security tax withheld-->
									<div class="styIRSW2GUCleanDiv" style="width:49%;height:100%;">
										<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">4</div>
											<div class="styIRSW2GULNDesc" style="width:auto;">Social security tax withheld</div>
										</div>
										<div class="styIRSW2GULNDesc" style="width:100%;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2GUData/SocialSecurityTaxAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- (5)(6) -->
								<div class="styIRSW2GULineItemBB">
									<!-- (5) Medicare wages and tips-->
									<div class="styIRSW2GUCleanDiv" style="width:50%;height:100%;">
										<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">5</div>
											<div class="styIRSW2GULNDesc" style="width:auto;">Medicare wages and tips</div>
										</div>
										<div class="styIRSW2GULNDesc" style="width:100%;text-align:right;padding-right:1mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2GUData/MedicareWagesAndTipsAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- (6) Medicare tax withheld-->
									<div class="styIRSW2GUCleanDiv" style="width:49%;height:100%;">
										<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">6</div>
											<div class="styIRSW2GULNDesc" style="width:auto;">Medicare tax withheld</div>
										</div>
										<div class="styIRSW2GULNDesc" style="width:100%;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2GUData/MedicareTaxWithheldAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- (7)(8) -->
								<div class="styIRSW2GULineItemBB" style="border-bottom-width:0px;height:10.60mm;">
									<!-- (7) Social security tips-->
									<div class="styIRSW2GUCleanDiv" style="width:50%;height:15mm;">
										<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">7</div>
											<div class="styIRSW2GULNDesc" style="width:auto;">Social security tips</div>
										</div>
										<div class="styIRSW2GULNDesc" style="width:100%;text-align:right;padding-right:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormW2GUData/SocialSecurityTipsAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- (8) -->
									<div class="styIRSW2GUCleanDiv" style="width:49.9%;height:100%;background-color:lightgrey;">
										<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
											<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;background-color:white;">8</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- (d)(9)(10) ////////////////////////////////////////////////////-->
						<div class="styIRSW2GULineItemBB">
							<!-- (d) Control number-->
							<div class="styIRSW2GUCleanDiv" style="width:50%;height:100%;border-left-width:0px;">
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">d</div>
									<div class="styIRSW2GULNDesc" style="width:auto;">Control number</div>
								</div>
								<div class="styIRSW2GULNDesc" style="width:100%;padding-left:7.5mm;padding-right:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormW2GUData/ControlNum"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- (9) -->
							<div class="styIRSW2GUCleanDiv" style="width:25%;height:100%;background-color:lightgrey;">
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;background-color:white;">9</div>
								</div>
							</div>
							<!-- (10)-->
							<div class="styIRSW2GUCleanDiv" style="width:24.9%;height:100%;background-color:lightgrey;">
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;background-color:white;">10</div>
								</div>
							</div>
						</div>
						<!-- ////////////////////////////////////////////////////-->
						<div class="styIRSW2GULineItemBB" style="height:100%;display:block;">
							<div class="styIRSW2GUCleanDiv" style="width:50%;height:100%;border-left-width:0px;">
								<!-- (e) Employee's first name and initial // Last Name // Suff.-->
								<div class="styGenericDiv" style="border-bottom:1px black dashed;height:13mm;width:100%;">
									<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">e</div>
									<div class="styGenericDiv" style="border-right:1px solid black;height:100%;width:39mm;padding-top:.6mm;">
                    Employee's first name and initial
                    <br/>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployeeNm"/>
										</xsl:call-template>
									</div>
									<div class="styGenericDiv" style="border-right:1px solid black;height:100%;width:39mm;padding-top:.6mm;padding-left:2mm;">
                    Last name
                  </div>
									<div class="styGenericDiv" style="height:auto; width:7mm;padding-top:.6mm;padding-left:2mm;">
                    Suff.
                  </div>
								</div>
								<!-- (f) Employee's address and ZIP code-->
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:43mm;border-left-width:0px;">
									<div class="styIRSW2GULNDesc" style="width:100%;padding-left:7.5mm;padding-top:2mm;word-wrap:break-word;height:40%;">
										<xsl:if test="$FormW2GUData/EmployeeUSAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployeeUSAddress"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$FormW2GUData/EmployeeForeignAddress">
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployeeForeignAddress"/>
											</xsl:call-template>
										</xsl:if>
									</div>
									<span style="width:100%;height:20.8mm;"/>
									<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
										<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">f</div>
										<div class="styIRSW2GULNDesc" style="width:auto;">Employee's address and ZIP code</div>
									</div>
								</div>
							</div>
							<div class="styIRSW2GUCleanDiv" style="width:25.12%;">
								<!-- (11) Nonqualified plans-->
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:13mm;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
									<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
										<div class="styIRSW2GULNLeftNumBox" style="padding-right:9.5px;">11</div>
										<div class="styIRSW2GULNDesc" style="width:auto;">Nonqualified plans</div>
									</div>
									<div class="styIRSW2GULNDesc" style="width:100%;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormW2GUData/NonqualifiedPlansAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (13) Statutory Employee / Retirement Plan / Third-party Sick Pay-->
								<div class="styIRSW2GUCleanDiv" style="width:100%;height:10mm;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
									<div class="styIRSW2GUCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
										<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">13</div> 
										<div class="styIRSW2GULNDesc" style="width:auto;padding-right:3mm;">
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormW2GUData/StatutoryEmployeeInd"/>
													<xsl:with-param name="BackupName">FormW2GUDataStatutoryEmployeeInd</xsl:with-param>
												</xsl:call-template>
												<span style="font-size:6pt">Statutory<br/>employee<br/>
												</span>
											</label><br/>
											<input class="styCkbox" type="checkbox" style="width:4mm;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormW2GUData/StatutoryEmployeeInd"/>
													<xsl:with-param name="BackupName">FormW2GUDataStatutoryEmployeeInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<!--<span style="width:3mm;float:left;"/>-->
										<div class="styIRSW2GULNDesc" style="width:auto;padding-right:3mm;">
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormW2GUData/RetirementPlanInd"/>
													<xsl:with-param name="BackupName">FormW2GUDataRetirementPlanInd</xsl:with-param>
												</xsl:call-template>
												<span style="font-size:6pt">Retirement<br/>plan<br/>
												</span>
											</label><br/>
											<input class="styCkbox" type="checkbox" style="width:4mm;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormW2GUData/RetirementPlanInd"/>
													<xsl:with-param name="BackupName">FormW2GUDataRetirementPlanInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<!--<span style="width:3mm;float:left;"/>-->
										<div class="styIRSW2GULNDesc" style="width:auto;">
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormW2GUData/ThirdPartySickPayInd"/>
													<xsl:with-param name="BackupName">FormW2GUDataThirdPartySickPayInd</xsl:with-param>
												</xsl:call-template>
												<span style="font-size:6pt;">Third-party<br/>sick pay<br/>
												</span>
											</label><br/>
											<input class="styCkbox" type="checkbox" style="width:4mm;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormW2GUData/ThirdPartySickPayInd"/>
													<xsl:with-param name="BackupName">FormW2GUDataThirdPartySickPayInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
									</div>
								</div>
								<!-- (14) Other-->
								<div style="width:46.6mm;border-left-width:0px;border-right:1px solid black;height:auto;">
									<div class="styIRSW2GUCleanDiv" style="width:46.6mm;height:auto;border-width:0px 0px 0px 0px;">
										<div class="styIRSW2GULNLeftNumBox" style="padding-right:9px;">14</div>
										<div class="styIRSW2GULNDesc" style="width:auto;">Other</div>
										<div class="styIRSW2GUCleanDiv" style="width:auto;float:right;border-left-width:0px;">
											<xsl:call-template name="SetDynamicTableToggleButton">
												<xsl:with-param name="TargetNode" select="$FormW2GUData/OtherDeductionsBenefitsGrp"/>
												<xsl:with-param name="containerHeight" select="1"/>
												<xsl:with-param name="containerID" select=" 'OtherDeductsBenefitsDiv' "/>
												<xsl:with-param name="headerRowCount" select="0"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styTableContainerNBB" id="OtherDeductsBenefitsDiv">
										<xsl:attribute name="style">
                      width:100%;height:auto;border-right-width:0px;padding:0px 0px 0px 0px;
                      <xsl:if test="($Print='inline' or $Print='separated')">
                        overflow:visible;
                      </xsl:if></xsl:attribute>
										<table class="styTable" cellspacing="0" style="width:100%;height:auto;border-right-width:0px;padding:0px 0px 0px 0px;table-layout:fixed;">
											<thead/>
											<tfoot/>
											<tbody>
												<xsl:for-each select="$FormW2GUData/OtherDeductionsBenefitsGrp">
													<xsl:variable name="Letter">
														<xsl:number format="a"/>
													</xsl:variable>
													<xsl:if test="($Print != $Separated) or (count($FormW2GUData/OtherDeductionsBenefitsGrp) &lt;=1)">
														<xsl:call-template name="CreateLine14TableRows">
															<xsl:with-param name="Letter" select="$Letter"/>
															<xsl:with-param name="TargetNode" select="."/>
														</xsl:call-template>
													</xsl:if>
												</xsl:for-each>
											</tbody>
											<xsl:if test="count($FormW2GUData/OtherDeductionsBenefitsGrp) &lt; 1 or ((count($FormW2GUData/OtherDeductionsBenefitsGrp) &gt;1) and ($Print = $Separated))">
												<xsl:call-template name="CreateLine14TableRows">
													<xsl:with-param name="Letter">a</xsl:with-param>
													<xsl:with-param name="AddAdditionalMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</table>
									</div>
									<xsl:call-template name="SetInitialDynamicTableHeight">
										<xsl:with-param name="TargetNode" select="$FormW2GUData/OtherDeductionsBenefitsGrp"/>
										<xsl:with-param name="containerHeight" select="1"/>
										<xsl:with-param name="headerRowCount" select="0"/>
										<xsl:with-param name="containerID" select="'OtherDeductsBenefitsDiv'"/>
									</xsl:call-template>
								</div>
								<!-- end of 14 -->
							</div>
							<!-- (12 a...) See the separate instructions-->
							<div style="width:24.85%;float:right;height:auto;">
								<div class="styIRSW2GUCleanDiv" style="width:auto;height:auto;border-width:0px 0px 0px 0px;">
									<div class="styIRSW2GULNLeftNumBox">12a</div>
									<div class="styIRSW2GULNDesc" style="width:auto;height:auto;">See instructions for box 12</div>
									<div class="styIRSW2GUCleanDiv" style="width:auto;float:right;border-left-width:0px;height:auto;">
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$FormW2GUData/NonUSEmployersUseGrp"/>
											<xsl:with-param name="containerHeight" select="4"/>
											<xsl:with-param name="containerID" select=" 'NonUSEmployersUseGrpDiv' "/>
											<xsl:with-param name="headerRowCount" select="0"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styTableContainerNBB" id="NonUSEmployersUseGrpDiv">
									<xsl:attribute name="style">
                      width:100%;border-right-width:0px;padding:0px 0px 0px 0px;height:auto;
                      <xsl:if test="($Print='inline' or $Print='separated')">
                        overflow:visible;
                      </xsl:if></xsl:attribute>
									<table class="styTable" cellspacing="0" style="width:100mm;height:auto;border-right-width:0px;padding:0px 0px 0px 0px;">
										<thead/>
										<tfoot/>
										<tbody>
											<xsl:for-each select="$FormW2GUData/NonUSEmployersUseGrp">
												<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
												<!--container height (4), execute-->
												<xsl:variable name="Letter">
													<xsl:number format="a"/>
												</xsl:variable>
												<xsl:if test="($Print != $Separated) or (count($FormW2GUData/NonUSEmployersUseGrp) &lt;=4)">
													<xsl:call-template name="CreateLine12TableRows">
														<xsl:with-param name="Letter" select="$Letter"/>
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</xsl:if>
											</xsl:for-each>
											<!-- Table Filler Rows -->
											<!-- JMI: added: or.... -->
											<xsl:if test="count($FormW2GUData/NonUSEmployersUseGrp) &lt; 1 or ((count($FormW2GUData/NonUSEmployersUseGrp) &gt;4) and ($Print = $Separated))">
												<xsl:call-template name="CreateLine12TableRows">
													<xsl:with-param name="Letter">a</xsl:with-param>
													<xsl:with-param name="AddAdditionalMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count($FormW2GUData/NonUSEmployersUseGrp) &lt; 2 or ((count($FormW2GUData/NonUSEmployersUseGrp) &gt;4) and ($Print = $Separated))">
												<xsl:call-template name="CreateLine12TableRows">
													<xsl:with-param name="Letter">b</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count($FormW2GUData/NonUSEmployersUseGrp) &lt; 3 or ((count($FormW2GUData/NonUSEmployersUseGrp) &gt;4) and ($Print = $Separated))">
												<xsl:call-template name="CreateLine12TableRows">
													<xsl:with-param name="Letter">c</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count($FormW2GUData/NonUSEmployersUseGrp) &lt; 4 or ((count($FormW2GUData/NonUSEmployersUseGrp) &gt;4) and ($Print = $Separated))">
												<xsl:call-template name="CreateLine12TableRows">
													<xsl:with-param name="Letter">d</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</tbody>
									</table>
								</div>
								<xsl:call-template name="SetInitialDynamicTableHeight">
                    <xsl:with-param name="TargetNode" select="$FormW2GUData/NonUSEmployersUseGrp"/>
                    <xsl:with-param name="containerHeight" select="4"/>
                    <xsl:with-param name="headerRowCount" select="0"/>
                    <xsl:with-param name="setDynamicHeight" select="4"/> 
                    <xsl:with-param name="containerID" select="'NonUSEmployersUseGrpDiv'"/>
                  </xsl:call-template>
                </div>
							<!-- End of (12 a...) See the separate instructions-->
						</div>
						<div class="styIRSW2GULineItemBB" style="background-color:lightgrey;height:20mm;border-bottom-width:0px;"/>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<xsl:call-template name="CreateFormHeader"/>
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
							<xsl:with-param name="TargetNode" select="$FormW2GUData"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:if test="$FormW2GUData/CorrectedW2GUInd">
							<xsl:call-template name="PopulateLeftOverCheckbox">
								<xsl:with-param name="Desc">Top Left - Corrected W2 Guam Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormW2GUData/CorrectedW2GUInd"/>
								<xsl:with-param name="BackupName">FormW2GUDataCorrectedW2GUInd</xsl:with-param>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left - Standard Or Non Standard Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormW2GUData/StandardOrNonStandardCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>						
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line C - Employer Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormW2GUData/EmployerNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
					<!-- Separated Data for Line 12 -->
					<xsl:if test="($Print = $Separated) and  (count($FormW2GUData/NonUSEmployersUseGrp) &gt; 4)">
						<span class="styRepeatingDataTitle">
              Form W-2GU - Line 12
            </span>
						<table class="styDepTbl" cellspacing="0">
							<thead>
								<tr class="styDepTblHdr">
									<th class="styIRSW2GUTableCell" scope="col" style="width:50mm;height:5mm;color:white;">Code</th>
									<th class="styIRSW2GUTableCell" scope="col" style="width:50mm;height:5mm;color:white;border-left-width:1px;">Amount</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormW2GUData/NonUSEmployersUseGrp">
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
					<!-- Separated Data for Line 14 -->
					<xsl:if test="($Print = $Separated) and  (count($FormW2GUData/OtherDeductionsBenefitsGrp) &gt; 1)">
						<span class="styRepeatingDataTitle">
              Form W-2GU - Line 14 - Other
            </span>
						<table class="styDepTbl" cellspacing="0">
							<thead>
								<tr class="styDepTblHdr">
									<th class="styIRSW2GUTableCell" scope="col" style="width:75mm;height:5mm;color:white;">Description</th>
									<th class="styIRSW2GUTableCell" scope="col" style="width:75mm;height:5mm;color:white;border-left-width:1px;">Amount</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormW2GUData/OtherDeductionsBenefitsGrp">
									<xsl:variable name="Letter">
										<xsl:number format="a"/>
									</xsl:variable>
									<xsl:call-template name="CreateLine14TableRowsColored">
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