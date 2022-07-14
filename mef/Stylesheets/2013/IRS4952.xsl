<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4952Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form4952Data" select="$RtnDoc/IRS4952"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="StaticText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;
				<xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:1.6mm;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
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
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:1.0mm 0mm 0mm 0mm;
				border-right-width:0px;font-size:8pt;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
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
						<xsl:with-param name="RootElement" select="local-name($Form4952Data)"/>
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
				<meta name="Description" content="IRS Form 4952"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4952Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS4952" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<div style="width:187mm;">				
						<xsl:call-template name="DocumentHeader"/>
						<div class="styBB" style="width:187mm;border-bottom-width:2px;">
							<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
								<div style="padding-top:1mm;">
									Form<span class="styFormNumber">  4952</span>
								</div>
								<!--General Dependency Push Pin-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form4952Data"/>
								</xsl:call-template>
								<br/>
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service (99)</span>
							</div>
							<div class="styFTBox" style="width:125mm;">
								<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
								<div class="styMainTitle" style="height:8mm;">
									Investment Interest Expense Deduction
								</div>
								<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
									<span style="text-align:center;font-weight:bold;">
										<div style="width:100%;height:5mm;padding-left:5px;">
											<div style="width:100%;height:5mm;">
												<br/>
												<img src="{$ImagePath}/4952_Bullet_Sm.gif" alt="SmallBullet"/> 
												Information about Form 4952 and its instructions is at <i>www.irs.gov/form4952</i>.
												<br/>
												<img src="{$ImagePath}/4952_Bullet_Sm.gif" alt="SmallBullet"/> 
												Attach to your tax return.
											</div>
										</div>
									</span>
								</div>
							</div>
							<div class="styTYBox" style="width:30mm;border-left-width:2px;height:22mm;">
								<div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-0191</div>
								<div class="styTY">20<span class="styTYColor">13</span>
								</div>
								<div style="margin-left:3mm;text-align:left;font-size:7pt;">
									Attachment<br/>Sequence No. 
									<span class="styBoldText" style="font-size:9pt;">51</span>
								</div>
							</div>
						</div>
						<!--  End Header section 1 -->
						<!-- Begin Names and Identifying number section -->
						<div class="styBB" style="width:187mm;">
							<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
								Name(s) shown on return<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<xsl:if test="$RtnHdrData/Filer//BusinessNameLine2"><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template></xsl:if>
							</div>
							<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
								Identifying number
								<br/>
								<span style="font-weight:normal;text-align:center;width:100%">
									<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
								</span>
							</div>
						</div>
						<!-- End Names and Identifying number section -->
						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
						<!-- Begin Part I																								 -->
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
						<!-- Header -->
						<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
							<!-- Content -->
							<div class="styPartName" style="width:15mm;height:auto;">Part I</div>
							<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;height:auto;">
								Total Investment Interest Expense
							</div>
						</div>
						<!-- Body -->
						<div class="styBB" style="width:187mm;height:auto;">
							<!-- (1) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem" style="height:auto;">
								<div class="styIRS4952LNLeftNumBox">1</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Investment interest expense paid or accrued in 2012 (see instructions)
										</span>									
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>								
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:auto;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:100%;height:auto;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">1</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentInterestExpenseAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (2) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem"  style="height:auto;">
								<div class="styIRS4952LNLeftNumBox">2</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Disallowed investment interest expense from 2011 Form 4952, line 7
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>	
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:100%;height:100%;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">2</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/PriorYrDisallowInvsmtIntExpAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (3) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem" style="height:auto;">
								<div class="styIRS4952LNLeftNumBox">3</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											<b>Total investment interest expense.</b> Add lines 1 and 2
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>	
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:auto;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:100%;height:auto;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">3</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-bottom-width:0mm;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-bottom-width:0mm;</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/TotalInvestmentInterestExpAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
						<!-- Begin Part II																								 -->
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
						<!-- Header -->
						<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
							<!-- Content -->
							<div class="styPartName" style="width:15mm;height:auto;">Part II</div>
							<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;height:auto;">
								Net Investment Income
							</div>
						</div>
						<!-- Body -->
						<div class="styBB" style="width:187mm;">
							<!-- (4a) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem" style="height:auto;">
								<div class="styIRS4952LNLeftNumBox" style="padding-right:0px;">4a</div>
								<div class="styIRS4952CleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<div class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Gross income from property held for investment (excluding any net<br/>
											<span style="float:left;">gain from the disposition of property held for investment)</span>
											<!--Dotted Line-->
											<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
										</div>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:37mm;height:4mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS4952CleanDiv" style="width:37mm;height:4mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS4952CleanDiv" style="width:37mm;height:5mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS4952CleanDiv" style="width:37mm;height:auto;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">4a</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentPropGrossIncomeAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (4b) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem" style="height:auto;">
								<div class="styIRS4952LNLeftNumBox" style="padding-right:0px;">b</div>
								<div class="styIRS4952CleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Qualified dividends included on line 4a
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:37mm;height:5mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS4952CleanDiv" style="width:37mm;height:auto;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">4b</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentPropQualDividendsAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (4c) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem" style="height:auto;">
								<div class="styIRS4952LNLeftNumBox" style="padding-right:0px;">c</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Subtract line 4b from line 4a
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:100%;height:100%;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">4c</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentPropNetGrossIncAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (4d) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem" style="height:auto;">
								<div class="styIRS4952LNLeftNumBox" style="padding-right:0px;">d</div>
								<div class="styIRS4952CleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Net gain from the disposition of property held for investment
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:37mm;height:5mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS4952CleanDiv" style="width:37mm;height:auto;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">4d</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentPropNetDispGainAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (4e) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem"  style="height:auto;">
								<div class="styIRS4952LNLeftNumBox" style="padding-right:0px;">e</div>
								<div class="styIRS4952CleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<div class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Enter the <b>smaller</b> of line 4d or your net capital gain from the<br/>
											disposition of property held for investment (see instructions)
											<xsl:if test="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedCd">
												<span style="width:4px;"/>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Investment Property Gain Elected Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedAmt">
												<span style="width:4px;"/>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Investment Property Gain Elected Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedAmt"/>
												</xsl:call-template>
											</xsl:if>
											<!--Dotted Line-->
											<span class="styBoldText">
												<span style="width:6px"/>.
												<xsl:if test="not($Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedAmt)">
													<span style="width:11px"/>.
												</xsl:if>
												<span style="width:11px"/>.
												<xsl:if test="not($Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedCd)">
													<span style="width:11px"/>.
												</xsl:if>
												<span style="width:11px"/>.
											</span>
										</div>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:37mm;height:4mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS4952CleanDiv" style="width:37mm;height:4mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS4952CleanDiv" style="width:37mm;height:5mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS4952CleanDiv" style="width:37mm;height:auto;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">4e</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/PropertyDspstnCapGainInvIncAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (4f) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem"  style="height:auto;">
								<div class="styIRS4952LNLeftNumBox" style="padding-right:0px;">f</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Subtract line 4e from line 4d
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:100%;height:100%;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">4f</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentNetGainLessSmallAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (4g) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem"  style="height:auto;">
								<div class="styIRS4952LNLeftNumBox" style="padding-right:0px;">g</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<div class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Enter the amount from lines 4b and 4e that you elect to include in investment income (see<br/>
											<span style="float:left;">instructions)</span>
											<!--Dotted Line-->
											<span class="styDotLn" style="float:right;padding-right:1mm;">...............................</span>
										</div>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:37mm;height:4mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS4952CleanDiv" style="width:100%;height:auto;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">4g</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentIncomeElectionAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (4h) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem"  style="height:auto;">
								<div class="styIRS4952LNLeftNumBox" style="padding-right:0px;">h</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Investment income. Add lines 4c, 4f, and 4g
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:100%;height:100%;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">4h</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentIncomeAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (5) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem"  style="height:auto;">
								<div class="styIRS4952LNLeftNumBox">5</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Investment expenses (see instructions)
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:100%;height:100%;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">5</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentExpenseAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (6) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem"  style="height:auto;">
								<div class="styIRS4952LNLeftNumBox">6</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											<b>Net investment income.</b> Subtract line 5 from line 4h. If zero or less, enter -0-
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:100%;height:100%;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">6</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/NetInvestmentIncomeAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
						<!-- Begin Part III																								 -->
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
						<!-- Header -->
						<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
							<!-- Content -->
							<div class="styPartName" style="width:15mm;height:auto;">Part III</div>
							<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;height:auto;">
								Investment Interest Expense Deduction
							</div>
						</div>
						<!-- Body -->
						<div class="styTBB" style="width:187mm;">
							<!-- (7) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem" style="height:auto;">
								<div class="styIRS4952LNLeftNumBox">7</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<div class="styIRS4952LNDesc" style="width:auto;height:100%;">
											Disallowed investment interest expense to be carried forward to 2013. Subtract line 6 from<br/>
											<span style="float:left;">line 3. If zero or less, enter -0-</span>
											<!--Dotted Line-->
											<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
										</div>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:37mm;height:4mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS4952CleanDiv" style="width:100%;height:auto;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">7</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/DisallowedCarryForwardExpAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (8) ////////////////////////////////////////////////////-->
							<div class="styIRS4952LineItem"  style="height:auto;">
								<div class="styIRS4952LNLeftNumBox">8</div>
								<div class="styIRS4952CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS4952LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<span class="styIRS4952LNDesc" style="width:auto;height:100%;">
											<b>Investment interest expense deduction.</b> Enter the <b>smaller</b> of line 3 or 6. See instructions
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</div>
								</div>
								<div class="styIRS4952CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS4952CleanDiv" style="width:100%;height:100%;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">8</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentInterestExpDeductAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>					
						<!-- Footer -->
						<div style="width:187mm;font-size:7pt">
							<div class="styGenericDiv" style="text-align:left;font-weight:bold">For Paperwork Reduction Act Notice, see back of form.</div>
							
							<div class="styGenericDiv" style="margin-left:35mm;text-align:center">Cat. No. 13177Y</div>
							<div class="styGenericDiv" style="float:right;text-align:right">Form <b>4952</b> (2013)</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="pageEnd" style="page-break-after:always;display:block;"/>
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
							<xsl:with-param name="TargetNode" select="$Form4952Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:if test="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part II - Line 4(e) - Investment Property Gain Elected Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedCd"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedAmt">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part II - Line 4(e) - Investment Property Gain Elected Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedAmt"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
