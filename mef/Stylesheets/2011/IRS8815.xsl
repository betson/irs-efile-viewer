<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8815Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS8815"/>
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
				<meta name="Description" content="IRS Form 8815"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8815Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8815">
					<!--xsl:value-of select='$PageWatermark'/-->
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:25mm;">
							Form<span class="styFormNumber"> 8815</span>
							<div class="styAgency" style="padding-top:5mm;">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:25mm;">
							<div class="styMainTitle" style="height:8mm;padding-top:2mm;">
								Exclusion of Interest From Series EE and I<br/>
								U.S. Savings Bonds Issued After 1989<br/>
								(For Filers With Qualified Higher Education Expenses)
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;padding-top:4mm;">
								<img src="{$ImagePath}/8815_Bullet.gif" width="9" height="9" alt="bullet image"/>
								Attach to Form 1040 or Form 1040A.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:25mm;">
							<div class="styOMB" style="height:1mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTY" style="height:7mm;font-size:22pt;">20<span class="styTYColor">11</span></div>
							<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;">
								Attachment<br/>
								Sequence No. <span class="styBoldText">167</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;">
							<div>
								Name(s) shown on return
							</div>
							<span>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							<div>
								Your social security number
							</div>
							<span style="width:27mm;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styGenericDiv" style="width:187mm;height:4mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select="'tblctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" id="tblctn">
						<xsl:call-template name="SetInitialState"/>
						<table style="width:182mm;border-collapse:collapse;font-size:7pt;">
							<thead>
								<th style="width:91mm;font-weight:normal;border:1px solid black;border-left:none;border-top:none;">
									<div style="font-weight:bold;float:left;padding-left:2mm;">1</div><b>(a)</b><br/>Name of person (you, your spouse, or your dependent) who was enrolled at or attended an eligible educational institution
								</th>
								<th style="width:91mm;font-weight:normal;border:1px solid black;border-right:none;border-top:none;">
									<b>(b)</b><br/>Name and address of eligible educational institution
								</th>
							</thead>
							<tbody>
								<tr>
									<td style="border:1px solid black;border-left:none;">
										<xsl:choose>
											<xsl:when test="$Print = $Separated and count($FormData/EligibleEducationInstnGrp) &gt; 3">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[1]/EligibilePersonName"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td style="border:1px solid black;border-right:none;height:4.5mm;">
										<div style="border-bottom:1px dashed black;width:94mm;">
											<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/EligibleEducationInstnGrp) &lt; 4)">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[1]/EligibileInstitutionName"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Qualified Tuition Program Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[1]/EligibileInstitutionName/@qualifiedTuitionProgramCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Covered IIE Savings Account Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[1]/EligibileInstitutionName/@coverdellEdSavingsAcctCd"/>
												</xsl:call-template>
											</xsl:if>
										</div>
										<div style="height:4.5mm;">
											<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/EligibleEducationInstnGrp) &lt; 4)">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[1]/EligibleInstitutionUSAddress"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</td>
								</tr>
								<tr>
									<td style="border:1px solid black;border-left:none;">
										<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/EligibleEducationInstnGrp) &lt; 4)">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[2]/EligibilePersonName"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td style="border:1px solid black;border-right:none;">
										<div style="border-bottom:1px dashed black;width:94mm;height:4.5mm;">
											<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/EligibleEducationInstnGrp) &lt; 4)">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[2]/EligibileInstitutionName"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Qualified Tuition Program Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[2]/EligibileInstitutionName/@qualifiedTuitionProgramCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Covered IIE Savings Account Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[2]/EligibileInstitutionName/@coverdellEdSavingsAcctCd"/>
												</xsl:call-template>
											</xsl:if>
										</div>
										<div style="height:4.5mm;">
											<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/EligibleEducationInstnGrp) &lt; 4)">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[2]/EligibleInstitutionUSAddress"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</td>
								</tr>
								<tr>
									<td style="border:1px solid black;border-left:none;">
										<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/EligibleEducationInstnGrp) &lt; 4)">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[3]/EligibilePersonName"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td style="border:1px solid black;border-right:none;">
										<div style="border-bottom:1px dashed black;width:94mm;height:4.5mm;">
											<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/EligibleEducationInstnGrp) &lt; 4)">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[3]/EligibileInstitutionName"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Qualified Tuition Program Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[3]/EligibileInstitutionName/@qualifiedTuitionProgramCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Covered IIE Savings Account Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[3]/EligibileInstitutionName/@coverdellEdSavingsAcctCd"/>
												</xsl:call-template>
											</xsl:if>
										</div>
										<div style="height:4.5mm;">
											<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/EligibleEducationInstnGrp) &lt; 4)">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp[3]/EligibleInstitutionUSAddress"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</td>
								</tr>
								<xsl:if test="$Print != $Separated">
									<xsl:for-each select="$FormData/EligibleEducationInstnGrp[position() &gt; 3]">
										<tr>
											<td style="border:1px solid black;border-left:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EligibilePersonName"/>
												</xsl:call-template>
											</td>
											<td style="border:1px solid black;border-right:none;height:4.5mm;">
												<div style="border-bottom:1px dashed black;width:94mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EligibileInstitutionName"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Qualified Tuition Program Code</xsl:with-param>
														<xsl:with-param name="TargetNode" select="EligibileInstitutionName/@qualifiedTuitionProgramCd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Covered IIE Savings Account Code</xsl:with-param>
														<xsl:with-param name="TargetNode" select="EligibileInstitutionName/@coverdellEdSavingsAcctCd"/>
													</xsl:call-template>
												</div>
												<div style="height:4.5mm;">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="EligibleInstitutionUSAddress"/>
													</xsl:call-template>
												</div>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/EligibleEducationInstnGrp"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select="'tblctn'"/>
					</xsl:call-template>
					<div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;clear:left;">
						<div class="styPartDesc" style="font-weight:normal;">If you need more space, attach a statement.</div>
					</div>
					<!-- Begin the amount boxes -->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:8mm">2 </div>
							<div class="styLNDesc" style="width:141mm;height:8mm;">
							2 Enter the total qualified higher education expenses you paid in 2011 for the person(s) listed in
column (a) of line 1. See the instructions to find out which expenses qualify<span style="letter-spacing:3mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-left:4px">
								<br />2
							</div>
							<div class="styLNAmountBox" style="height:8mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntTotQlfyEducExpnsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:8mm">3</div>
							<div class="styLNDesc" style="width:141mm;height:8mm;">Enter the total of any nontaxable educational benefits (such as nontaxable scholarship or fellowship grants) received for 2011 for the person(s) listed in column (a) of line 1 (see instructions)<span style="letter-spacing:3mm;">.....</span></div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="position:absolute;bottom:0">3</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntTotNonTxEducBnftAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">4</div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Subtract line 3 from line 2. If zero or less, <b>stop</b>. You <b>cannot</b> take the exclusion<span style="letter-spacing:3mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">4</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntTxblEducBenefitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:8mm">5</div>
							<div class="styLNDesc" style="width:141mm;height:8mm;">Enter the total proceeds (principal and interest) from all series EE and I U.S. savings bonds <span style="font-weight:bold;">issued
after 1989</span> that you <span style="font-weight:bold">cashed during 2011</span><span style="letter-spacing:3mm;">..........................</span></div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="position:absolute;bottom:0">5</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondTotPYBondProcAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">6</div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Enter the interest included on line 5 (see instructions) <span style="letter-spacing:3mm;"> ...................</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">6</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntTotPYBondIntAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:8mm">7</div>
							<div class="styLNDesc" style="width:141mm;height:8mm;">If line 4 is equal to or more than line 5, enter “1.000.” If line 4 is less than line 5, divide line 4 by line
5. Enter the result as a decimal (rounded to at least three places)<span style="letter-spacing:3mm;">...............</span></div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="position:absolute;bottom:0">7</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;color:darkblue;"><br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntTxblExpnsBondProcRt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">8</div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Multiply line 6 by line 7<span style="letter-spacing:3mm;">.............................</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">8</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntTentativeBondIntAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:146mm;height:4.5mm;"/>
							<div class="styShadingCell" style="height:4.5mm;width:8mm;"/>
							<div style="border-left:1px black solid;height:4.5mm;float:left;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">9</div>
							<div class="styLNDesc" style="width:101mm;height:4.5mm;">Enter your modified adjusted gross income (see instructions)<span style="letter-spacing:3mm;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">9</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntModifiedAGIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:4.5mm;width:8mm;"/>
							<div style="border-left:1px black solid;height:4.5mm;float:left;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:12mm;padding-left:1mm;width:5mm;"/>
							<div class="styLNDesc" style="width:101mm;height:12mm;padding-right:4px;overflow:hidden;"><span style="font-weight:bold;">Note: </span> <i> If line 9 is $86,100 or more if single or head of household, or $136,650 or more if married filing jointly or qualifying widow(er) with dependent child, <b>stop</b>. You <b>cannot</b> take the exclusion.</i></div>
							<div class="styShadingCell" style="width:8mm;position:relative;height:12mm;"/>
							<div class="styLNAmountBox" style="height:12mm;border-bottom:none;"/>
							<div class="styShadingCell" style="height:12mm;width:8mm;"/>
							<div style="border-left:1px black solid;height:12mm;float:left;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;">10</div>
							<div class="styLNDesc" style="width:101mm;height:8mm;">Enter: $71,100 if single or head of household; $106,650 if married filing
jointly or qualifying widow(er) with dependent child<span style="letter-spacing:3mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="padding-left:2px;height:8mm;">
								<br />10
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-right:2px;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntFilingStatusLmtAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:8mm;width:8mm;"/>
							<div style="border-left:1px black solid;height:8mm;float:left;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;">11</div>
							<div class="styLNDesc" style="width:101mm;height:8mm;">Subtract line 10 from line 9. If zero or less, skip line 12, enter -0- on line
13, and go to line 14<span style="letter-spacing:3mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-left:2px">
								<br />11
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-right:2px;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntExcessAGIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:8mm;width:8mm;"/>
							<div style="border-left:1px black solid;height:8mm;float:left;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:12mm;padding-left:0mm;width:5mm;">12</div>
							<div class="styLNDesc" style="width:141mm;height:12mm;">Divide line 11 by: $15,000 if single or head of household; $30,000 if married filing jointly or qualifying widow(er) with dependent child. Enter the result as a decimal (rounded to at least three
places)<span style="letter-spacing:3mm;">...................................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-left:2px;height:12mm;">
								<br /><br />12
							</div>
							<div class="styLNAmountBox" style="height:12mm;color:darkblue;"><br /><br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntExcessAGIRt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">13</div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Multiply line 8 by line 12<span style="letter-spacing:3mm;">.............................</span></div>
							<div class="styLNRightNumBox" style="padding-left:2px;height:4.5mm;">
								13
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExclBondIntOffsetAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;">14</div>
							<div class="styLNDesc" style="width:141mm;height:8mm;"><span style="font-weight:bold;">Excludable savings bond interest.</span> Subtract line 13 from line 8. Enter the result here and on Schedule B (Form 1040A or Form 1040), line 3<span style="letter-spacing:3mm;">.........................</span></div>
							<div class="styLNRightNumBox" style="padding-left:2px;height:8mm;border-bottom:none;">
								<br />14
							</div>
							<div class="styLNAmountBox" style="height:8mm;border-bottom:none;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExcludableSavingBondIntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End the amount boxes -->
					<!-- capturing the page bottom info -->
					<div class="pageEnd" style="width:187mm; font-size:7pt; border-top:1 solid black; padding-top:0.5mm">
						<div style="float:left; font-size:8pt">
							<b>For Paperwork Reduction Act Notice, your tax return instructions.</b>
						</div>
						<div style="float:right">
						Cat. No. 10822S
						<span style="width:15mm"/>
						Form <b style="font-size:9pt">8815</b> (2011)
						</div>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/EligibleEducationInstnGrp/EligibileInstitutionName">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Qualified Tuition Program Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="@qualifiedTuitionProgramCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Covered IIE Savings Account Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="@coverdellEdSavingsAcctCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</xsl:for-each>
					</table>
					<xsl:if test="$Print = $Separated and  count($FormData/EligibleEducationInstnGrp) &gt; 3">
					  <br/>
					  <span class="styRepeatingDataTitle">Form 8815 - Eligible Education Institutions</span>
					  <table class="styDepTbl" style="font-size:7pt;border-collapse:collapse;">
						<thead class="styTableThead">
						  <tr class="styDepTblHdr">
								<th style="width:93mm;font-weight:normal;border:1px solid black;border-left:none;border-top:none;">
									<div style="font-weight:bold;float:left;padding-left:2mm;">1</div><b>(a)</b><br/>Name of person (you, your spouse, or your dependent) who was enrolled at or attended an eligible educational institution
								</th>
								<th style="width:94mm;font-weight:normal;border:1px solid black;border-right:none;border-top:none;">
									<b>(b)</b><br/>Name and address of eligible educational institution
								</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <xsl:for-each select="$FormData/EligibleEducationInstnGrp">
							<tr style="border-color:black;">
							  <xsl:attribute name="class">
								<xsl:choose>
								  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							  </xsl:attribute>
								<td style="border:1px solid black;border-left:none;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="EligibilePersonName"/>
									</xsl:call-template>
								</td>
								<td style="border:1px solid black;border-right:none;height:4.5mm;text-align:left">
									<div style="border-bottom:1px dashed black;width:94mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="EligibileInstitutionName"/>
										</xsl:call-template>
									</div>
									<div style="height:4.5mm;">
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="EligibleInstitutionUSAddress"/>
										</xsl:call-template>
									</div>
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