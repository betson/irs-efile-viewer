<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 07/16/2019 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8814Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8814Data" select="$RtnDoc/IRS8814"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="StaticText"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				padding:3px 0px 0px 0px;
				border-right-width:0px;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;text-align:right;padding-right:2px;font-size:6pt;
				<xsl:choose>
					<xsl:when test="$TargetNode">
						<xsl:choose>
							<xsl:when test="$TargetNode/@referenceDocumentId">padding-top:3px;</xsl:when>
							<xsl:otherwise>padding-top:6px;</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>padding-top:6px;</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$AmountBoxStyle">
					<xsl:value-of select="$AmountBoxStyle"/>
				</xsl:if>
			</xsl:attribute>
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
				<xsl:when test="$StaticText"><xsl:value-of select="$StaticText"/></xsl:when>
			</xsl:choose>
		</div>

	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8814Data)"/>
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
				<meta name="Description" content="IRS Form 8814"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8814Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8814">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:28mm;height:21.5mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form
								<span style="width:.75mm;"/>
								<span class="styFormNumber">8814</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8814Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency" style="padding-top:5mm;padding:bottom:0mm;">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:128mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;padding-top:3mm;">
								Parents' Election To Report<br/>
								Child's Interest and Dividends
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;padding-top:4mm;height:5mm;padding-left:35px;">
										<div style="width:100%;height:5mm;">
											<br/>
											<img src="{$ImagePath}/8814_Bullet_Sm.gif" alt="SmallBullet"/> Go to 
											 <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8814" title="Link to IRS.gov">
														<i>www.irs.gov/Form8814</i> for the latest information.
											</a><br/>
											<img src="{$ImagePath}/8814_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to parents' Form 1040 or Form 1040NR.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:21.5mm;border-left-width:2px;">
							<div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">18</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">40</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on your return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
									<xsl:with-param name="BackupName">RtnHdrDataFilerPrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Top Section																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="styBB" style="width:187mm;">
						<b>Caution:</b> The federal income tax on your child's income, including qualified dividends and capital 
						      gain distributions, may be less if you<br/>file a separate tax return for the child instead of making this election. 
						      This is because you cannot take certain tax benefits that your<br/>child could take on his or her own return.
						      For details, see <i>Tax benefits you cannot take</i> in the instructions.
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							<span class="styBoldText" style="width:2mm;padding-left:1.5mm;padding-right:2.5mm;">A</span>
							<span style="width:.75mm"/>Child's name (first, initial, and last)<br/>
							<span style="width:22px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8814Data/ChildNm"/>
							</xsl:call-template>
							<span style="width:15px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line A - Child's Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8814Data/ChildNameControlTxt"/>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 0mm;font-size:7pt;" class="styEINBox">
							<span class="styBoldText" style="width:2mm;padding-left:1.5mm;padding-right:2mm;">B</span>
							<span style="width:.75mm"/><b>Child's social security number</b><br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form8814Data/ChildSSN"/>
									<xsl:with-param name="BackupName">Form8814DataChildSSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<span style="width:100%;">
							<span class="styBoldText" style="width:2mm;padding-left:1.5mm;padding-top:3mm;">C</span>
							<span>
								<span style="width:.75mm"/>
								<span style="padding-left:2mm;padding-top:2mm;">If more than one Form 8814 is attached, check here</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-left:1mm;padding-top:2mm;">.........................</span>
							</span>
						    <img src="{$ImagePath}/8814_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:6px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8814Data/MultipleForm8814Ind"/>
									<xsl:with-param name="BackupName">Form8814DataMultipleForm8814Ind</xsl:with-param>
								</xsl:call-template>
							</label>
							<input class="styCkbox" alt="Multiple 8814's attached" type="checkbox" style="height: 5mm; width: 5mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8814Data/MultipleForm8814Ind"/>
									<xsl:with-param name="BackupName">Form8814DataMultipleForm8814Ind</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<span style="width:100%;height:auto;padding:7px 0px 7px 0px;">
							<!-- Content -->
							<div class="styPartName" style="width:15mm;">Part I</div>
							<div class="styPartDesc" style="padding-left:3mm;">
								Child's Interest and Dividends To Report on Your Return
							</div>
						</span>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (1a) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:7mm; ">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:2mm;">1a</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Enter your child's <b>taxable</b> interest. If this amount is different from the amounts shown on the<br/>
									<span style="float:left;">child's Forms 1099-INT and 1099-OID, see the instructions</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-left:3.1mm;">...............</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:7mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:2.5mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildTaxableInterestAmt"/>
										<xsl:with-param name="Number">1a</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (1b) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:9mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-top:12px">b</div>
							<div class="styIRS8814LNDesc" style="width:105mm;height:100%;padding:10px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Enter your child's <b>tax-exempt</b> interest. <b>Do not</b> include this amount<br/>
									<span style="float:left;">on line 1a</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-left:3.1mm;">.....................</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:9mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;
										  padding:0px 0px 0px 0px;background-color:lightgrey;
										</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:9mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:5.5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:6mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildTaxExemptInterestAmt"/>
										<xsl:with-param name="Number">1b</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (2a) ////////////////////////////////////////////////////-->
						<!--<div class="styIRS8814LineItem" style="height:7mm">-->
							<div class="styIRS8814LNLeftNumBox" style="padding-left:2mm;padding-top:7px">2a</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:5px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Enter your child's ordinary dividends, including any Alaska Permanent Fund dividends. If your<br/>
									<span style="float:left;">child received any ordinary dividends as a nominee, see the instructions
										<xsl:if test="$Form8814Data/ChildOrdinaryDividendAmt">
											<xsl:if test="$Form8814Data/ChildOrdinaryDividendAmt/@nomineeDistributionCd">
												<span style="width:3px;"/>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 2a - Nominee Distribution Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$Form8814Data/ChildOrdinaryDividendAmt/@nomineeDistributionCd"/>
												</xsl:call-template>
												<span style="width:3px;"/>
											</xsl:if>
											<xsl:if test="$Form8814Data/ChildOrdinaryDividendAmt/@nomineeDistributionAmt">
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 2a - Nominee Distribution Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$Form8814Data/ChildOrdinaryDividendAmt/@nomineeDistributionAmt"/>
												</xsl:call-template>
												<span style="width:5px;"/>
											</xsl:if>
										</xsl:if>
									</span>
									<!--Dotted Line-->
                                    <span class="styDotLn" style="float:right;padding-left:3.1mm">.........</span>
									<span class="styBoldText">
										<xsl:choose>										
											<xsl:when test="$Form8814Data/ChildOrdinaryDividendAmt">
												<xsl:if test="not($Form8814Data/ChildOrdinaryDividendAmt/@nomineeDistributionCd)">
													<span style="width:11px"/>.
												</xsl:if>
												<xsl:if test="not($Form8814Data/ChildOrdinaryDividendAmt/@nomineeDistributionAmt)">
													<span style="width:11px"/>.
												</xsl:if>
											</xsl:when>
											<xsl:when test="not($Form8814Data/ChildOrdinaryDividendAmt)">
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</xsl:when>
										</xsl:choose>
									</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:9mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:5.5mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildOrdinaryDividendAmt"/>
										<xsl:with-param name="Number">2a</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						<!--</div>-->
						<!-- (2b) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:7mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-top:7px">b</div>
							<div class="styIRS8814LNDesc" style="width:105mm;height:100%;padding:5px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Enter your child's qualified dividends included on line 2a. See the<br/>
									<span style="float:left;">instructions</span>
									<!--Dotted Line-->
                                    <span class="styDotLn" style="float:right;padding-left:3.1mm;">.....................</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;
										  padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										  background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3.5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:4mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildQualifiedDividendAmt"/>
										<xsl:with-param name="Number">2b</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										  </xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:7mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:9px">3</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:7px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Enter your child's capital gain distributions. If your child received any capital gain distributions
									as a nominee,
									<span style="float:left;">see the instructions
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part I, Line 3 - Nominee Distribution Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form8814Data/ChildCapitalGainDistriAmt/@nomineeDistributionCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part I, Line 3 - Nominee Distribution Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form8814Data/ChildCapitalGainDistriAmt/@nomineeDistributionAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
                                    <span class="styDotLn" style="float:left;padding-left:3.1mm;">..........................</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:9.3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:5.5mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildCapitalGainDistriAmt"/>
										<xsl:with-param name="Number">3</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:11mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:7px">4</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:5px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Add lines 1a, 2a, and 3. If the total is $2,100 or less, skip lines 5 through 12 and go to line 13. If<br/>
									the total is $10,500 or more, <b>do not</b> file this form. Your child <b>must</b> file his or her own return to<br/>
									<span style="float:left;">report the income</span>
									<!--Dotted Line-->
                                    <span class="styDotLn" style="float:right;padding-left:3.1mm;">............................</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:11mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:7.5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:7.5mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildInvestmentIncomeAmt"/>
										<xsl:with-param name="Number">4</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:5mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:7px">5</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:5px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;float:left;">
									Base amount
								</div>
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;text-align:right;padding:0px 0mm 0px 0px;float:right;">
									<span class="styDotLn" style="float:left;padding-left:3.1mm">.............................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="StaticText">2,100.00</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">text-align:right;</xsl:with-param>
								<xsl:with-param name="Number">5</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:5mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:7px">6</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:5px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;float:left;">
									Subtract line 5 from line 4
								</div>
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;text-align:right;float:right;
								  padding:0px 0mm 0px 0px;">
	                                 <span class="styDotLn" style="float:right;padding-left:3.1mm">..........................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8814Data/ChildNetInvestmentIncomeAmt"/>
								<xsl:with-param name="Number">6</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8814LineItem" style="height:7mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:7px"/>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:5px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									<span class="styBoldText">
										If both lines 2b and 3 are zero or blank, skip lines 7 through 10, enter -0- on line 11, and go<br/>
										to line 12. Otherwise, go to line 7.
									</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">7.5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										  background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:7mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:10px">7</div>
							<div class="styIRS8814LNDesc" style="width:105mm;height:100%;padding:8px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Divide line 2b by line 4. Enter the result as a decimal (rounded to at<br/>
									<span style="float:left;">least three places)</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-left:3.1mm">...................</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:9mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										  background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3.5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:4mm;color:darkblue;</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildQualifiedDividendPct"/>
										<xsl:with-param name="PopulateAsText" select="true()"/>
										<xsl:with-param name="AmountStyle">color:darkblue</xsl:with-param>
										<xsl:with-param name="Number">7</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:7mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:10px">8</div>
							<div class="styIRS8814LNDesc" style="width:105mm;height:100%;padding:8px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Divide line 3 by line 4. Enter the result as a decimal (rounded to at<br/>
									<span style="float:left;">least three places)</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-left:3.1mm">...................</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										  background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3.5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:4mm;color:darkblue</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildCapitalGainDistriPct"/>
										<xsl:with-param name="PopulateAsText" select="true()"/>
										<xsl:with-param name="AmountStyle">color:darkblue</xsl:with-param>
										<xsl:with-param name="Number">8</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:7mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:10px">9</div>
							<div class="styIRS8814LNDesc" style="width:105mm;height:100%;padding:8px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Multiply line 6 by line 7. Enter the result here. See the instructions<br/>
									<span style="float:left;">for where to report this amount on your return</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-left:3.1mm">..........</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										  background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3.5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:4mm;color:darkblue</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildQualifiedDividendAdjAmt"/>
										<xsl:with-param name="Number">9</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:9mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:10px">10</div>
							<div class="styIRS8814LNDesc" style="width:105mm;height:100%;padding:8px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Multiply line 6 by line 8. Enter the result here. See the instructions<br/>
									<span style="float:left;">for where to report this amount on your return</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-left:3.1mm">..........</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										  background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3.5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:4mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildCapitalGainDistriAdjAmt"/>
										<xsl:with-param name="Number">10</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8814LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;
										</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:5mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:10px">11</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:8px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;float:left;">
									Add lines 9 and 10
								</div>
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;text-align:right;float:right;
								  padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">............................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8814Data/ChildTaxBasisAdjustmentSumAmt"/>
								<xsl:with-param name="Number">11</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:11mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:7px">12</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:5px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									Subtract line 11 from line 6. Include this amount in the total on Form 1040, line 21, or Form<br/>
									1040NR, line 21. In the space next to line 21, enter &#8220;Form 8814&#8221; and show the amount. If you<br/>
									<span style="float:left;">checked the box on line C above, see the instructions. Go to line 13 below</span>
									<!--Dotted Line-->
									<span class="styDotLn"  style="float:right;padding-left:3.1mm;">...........</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:11mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:7mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:7.5mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildNetAdjustedIncomeAmt"/>
										<xsl:with-param name="Number">12</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<span style="width:100%;height:auto;padding:7px 0px 7px 0px;">
							<!-- Content -->
							<div class="styPartName" style="width:15mm;">Part II</div>
							<div class="styPartDesc" style="padding-left:3mm;">
								Tax on the First $2,100 of Child's Interest and Dividends
							</div>
						</span>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:5mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:7px">13</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:5px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;float:left;">
									Amount not taxed
								</div>
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;text-align:right;float:right;
								  padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn" >............................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="StaticText">1,050.00</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">text-align:right;</xsl:with-param>
								<xsl:with-param name="Number">13</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:5mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:7px">14</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:5px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;float:left;">
									Subtract line 13 from line 4. If the result is zero or less, enter -0-
								</div>
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;text-align:right;float:right;
								  padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn" >..............</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8814Data/ChildInterestAndDivTaxBasisAmt"/>
								<xsl:with-param name="Number">14</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS8814LineItem" style="height:15mm">
							<div class="styIRS8814LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:7px">15</div>
							<div class="styIRS8814LNDesc" style="width:144mm;height:100%;padding:5px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;">
									<b>Tax.</b> Is the amount on line 14 less than $1,050?<br/>
									<div class="styIRS8814LNDesc" style="width:auto;height:auto;padding:0px 0px 0px 0px;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8814Data/ChildTaxBasisUnderSpcfdAmtInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="No" class="styCkbox">
												<xsl:if test="$Form8814Data/ChildTaxBasisUnderSpcfdAmtInd">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8814Data/ChildTaxBasisUnderSpcfdAmtInd"/>
														<xsl:with-param name="BackupName">IRS8814ChildTaxBasisUnderSpcfdAmtInd</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</input>
										</span>
										<span style="width:2mm;"/>
										<label>
											<xsl:if test="$Form8814Data/ChildTaxBasisUnderSpcfdAmtInd">
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="$Form8814Data/ChildTaxBasisUnderSpcfdAmtInd"/>
														<xsl:with-param name="BackupName">IRS8814ChildTaxBasisUnderSpcfdAmtInd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<span class="styBoldText">No.</span> Enter $105 here and see the <b>Note</b> below.
										</label>
										<br/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8814Data/ChildTaxBasisUnderSpcfdAmtInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="Yes" class="styCkbox">
												<xsl:if test="$Form8814Data/ChildTaxBasisUnderSpcfdAmtInd">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8814Data/ChildTaxBasisUnderSpcfdAmtInd"/>
														<xsl:with-param name="BackupName">IRS8814ChildTaxBasisUnderSpcfdAmtInd</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</input>
										</span>
										<span style="width:2mm;"/>
										<label>
											<xsl:if test="$Form8814Data/ChildTaxBasisUnderSpcfdAmtInd">
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="$Form8814Data/ChildTaxBasisUnderSpcfdAmtInd"/>
														<xsl:with-param name="BackupName">IRS8814ChildTaxBasisUnderSpcfdAmtInd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<span class="styBoldText">Yes.</span> Multiply line 14 by 10% (0.10). Enter the result here 
											  and see the <b>Note</b> below.
										</label>
									</div>
								</div>
								<div class="styIRS8814LNDesc" style="width:auto;height:auto;padding:0px 0px 0px 7mm;">
									<img src="{$ImagePath}/8814_Bracket_Sm.gif" alt="SmallBracket"/> 
								</div>
								<div class="styIRS8814LNDesc" style="width:auto;height:100%;text-align:right;float:right;
								  padding:3mm 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;">....</span>
								</div>
							</div>
							<div class="styIRS8814LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8814LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:4.5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:4.5mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8814Data/ChildInterestAndDividendTaxAmt"/>
										<xsl:with-param name="Number">15</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styIRS8814LineItem" style="height:7mm">
							<span style="height:100%;padding-bottom:3px;">
								<b>Note:</b> If you checked the box on line C above, see the instructions. Otherwise, include the 
								  amount from line 15 in the tax you enter on Form 1040, line 11, or Form 1040NR, line 42. Be sure 
								  to check box <b>1</b> on Form 1040, line 11, or check box <b>a</b> on Form 1040NR, line 42.
							</span>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see your tax return instructions.
							</span>
						</div>
						<div style="text-align:center;width:60mm;font-size:7pt;">
							Cat. No. 10750J
						</div>
						<div style="float:right;">
							<span style="width:20px;"/>
							Form <span class="styBoldText" style="font-size:7pt;"> 8814 </span> (2018)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8814Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line A - Child's Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8814Data/ChildNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part I, Line 2a - Nominee Distribution Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8814Data/ChildOrdinaryDividendAmt/@nomineeDistributionCd"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Part I, Line 2a - Nominee Distribution Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8814Data/ChildOrdinaryDividendAmt/@nomineeDistributionAmt"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Nominee Distribution Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8814Data/ChildCapitalGainDistriAmt/@nomineeDistributionCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Nominee Distribution Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8814Data/ChildCapitalGainDistriAmt/@nomineeDistributionAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>