<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8606Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8606Data" select="$RtnDoc/IRS8606"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="IncludeBefore"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6.5pt;
				<xsl:choose>
					<xsl:when test="$TargetNode">
						<xsl:choose>
							<xsl:when test="$TargetNode/@referenceDocumentId">padding-top:3px;</xsl:when>
							<xsl:otherwise>padding-top:4px;</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>padding-top:4px;</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$AmountBoxStyle">
					<xsl:value-of select="$AmountBoxStyle"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:if test="$TargetNode">
				<xsl:if test="$IncludeBefore">
					<xsl:value-of select="$IncludeBefore"/>
				</xsl:if>
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
			</xsl:if>
		</div>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:3px 0px 0px 0px;
				border-right-width:0px;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8606Data)"/>
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
				<meta name="Description" content="IRS Form 8606"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8606Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8606" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  8606</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8606Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								Nondeductible IRAs<br/>
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:0px;">
										<div style="width:80mm;height:5mm;">
											<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="SmallBullet"/> 
											See separate instructions.<br/>
											<br/>
											<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040, Form 1040A, or Form 1040NR.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">13</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">48</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name. If married, file a separate form for each spouse required to file Form 8606. See instructions.<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8606Data/Form8606IRANameline"/>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATxpyrWithIRASSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- Begin Top Section -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8606LineItem" style="height:27mm;">
							<!-- Left Panel -->
							<div class="styIRS8606LineItem" style="width:25%;float:left;height:28mm;">
								<!-- Text -->
								<div class="styIRS8606LineItem" style="width:83%;float:left;font-size:8pt;padding:20px, 0px 7px 0px;">
									<span class="styBoldText">
										Fill in Your Address Only<br/>
										If You Are Filing This<br/>
										Form by Itself and Not<br/>
										With Your Tax Return<br/>
									</span>
								</div>
								<!-- Image -->
								<div class="styIRS8606LineItem" style="width:17%;float:left;padding:26px 0px 7px 8px;border-right-width:1px;border-color:black;height:100%">
									<img src="{$ImagePath}/8606_Bullet_Lg.gif" alt="SmallBullet"/>
								</div>
							</div>
							<!-- Right Panel -->
							<div class="styIRS8606LineItem" style="width:75%;float:left;height:28mm;">
								<div class="styIRS8606LineItem" style="width:100%;border-bottom-width:1px;border-color:black;height:34%;">
									<div class="styIRS8606LineItem" style="width:118mm;height:100%;float:left;padding-left:4px;">
										Home address (number and street, or P.O. box if mail is not delivered to your home)
										<br/>
										<xsl:if test="$RtnHdrData/Filer/USAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
									<div class="styIRS8606LineItem" style="width:15mm;height:100%;float:right;border-left-width:1px;border-color:black;padding-left:5px;">
										Apt. no.
									</div>
								</div>
								<div class="styIRS8606LineItem" style="width:100%;border-bottom-width:1px;border-color:black;height:32%;">
									<div class="styIRS8606LineItem" style="width:100%;height:100%;float:left;padding-left:4px;">
										City, town or post office, state, and ZIP code. <span style="font-family:Arial Narrow;">If you have a foreign address, also complete the spaces below (see instructions).</span><br/>
										<xsl:choose>
											<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">City</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS8606LineItem" style="width:100%;height:34%;">
									<div class="styIRS8606LineItem" style="width:100%;height:100%;float:left;">
										<div class="styGenericDiv" style="width:55mm;border-right:1px solid black;height:100%;padding-left:4px;">
											Foreign country name<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="MainForm" select="true()"/>
											</xsl:call-template>
										</div>
										<div class="styGenericDiv" style="width:56mm;border-right:1px solid black;height:100%;padding-left:4px;">
											Foreign province/state/county<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styGenericDiv" style="width:27.8mm;height:100%;padding-left:4px;">
											Foreign postal code<br/>
											<span style="text-align:center;width:100%">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End Top Section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;padding-bottom:3px;">
							Nondeductible Contributions to Traditional IRAs and Distributions From Traditional, SEP, and SIMPLE IRAs<br/></div>							
							<div class="styPartDesc" style="border-bottom:1px solid black;width:187mm;">
							<div class="styNormalText" style="font-size:6.5pt;">
							<span style="width:15mm" />
								Complete this part only if one or more of the following apply.
								</div>
								</div>						
						<div class="styPartDesc" style="padding-left:18mm;padding-bottom:3px;">
								<span class="styNormalText" style="font-size:6.5pt;">
								<img src="{$ImagePath}/8606_Bullet_Round.gif" alt="RoundBullet"/>
								<span style="width:6px;"/>You made nondeductible contributions to a traditional IRA for 2013.<br/>
								<img src="{$ImagePath}/8606_Bullet_Round.gif" alt="RoundBullet"/>
								<span style="width:6px;"/>You took distributions from a traditional, SEP, or SIMPLE IRA in 2013 <b>and</b> you made nondeductible contributions to a<br/>
								<span style="width:3mm;"/>traditional IRA in 2013 or an earlier year. For this purpose, a distribution does not include a rollover, <br/> 
								<span style="width:3mm;"/>qualified charitable distribution, one-time distribution to fund an HSA, conversion, recharacterization, or return of certain contributions.<br/>
								<img src="{$ImagePath}/8606_Bullet_Round.gif" alt="RoundBullet"/>
								<span style="width:6px;"/>You converted part, but not all, of your traditional, SEP, and SIMPLE IRAs to Roth IRAs in 2013 (excluding any portion<br/>
								<span style="width:3mm;"/>you recharacterized) <b>and</b> you made nondeductible contributions to a traditional IRA in 2013 or an earlier year.<br/>
							</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">1</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Enter your nondeductible contributions to traditional IRAs for 2013, including those made for 2013
									from January 1, 2014, through April 15, 2014 (see instructions)
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:10px"/>.
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
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRACurrTYNondedContriAmt"/>
										<xsl:with-param name="Number">1</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">2</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Enter your total basis in traditional IRAs (see instructions)
								</div>
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
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
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRABasisForPYAmt"/>
								<xsl:with-param name="Number">2</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">3</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Add lines 1 and 2
								</div>
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
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
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATotalIRAValueAmt"/>
								<xsl:with-param name="Number">3</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:9mm;height:13mm;"/>
							<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:55mm;height:13mm;border-width:2px 2px 2px 2px;border-color:black;">
								<span class="styBoldText" style="width:100%;height:100%;padding-left:4mm;padding-top:1.5mm;">
									In 2013, did you take a distribution<br/>
									from traditional, SEP, or SIMPLE IRAs,<br/>
									or make a Roth IRA conversion?
								</span>
							</div>
							<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:38mm;height:13mm;">
								<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:34%;float:none;">
									<img src="{$ImagePath}/8606_Line.gif" alt="Line"/>
									<span class="styBoldText" style="width:7mm;text-align:center;">No</span>
									<img src="{$ImagePath}/8606_Line.gif" alt="Line"/>
									<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="SmallBullet"/>
								</div>
								<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:26%;float:none;">
								</div>
								<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:40%;">
									<img src="{$ImagePath}/8606_Line.gif" alt="Line"/>
									<span class="styBoldText" style="width:7mm;text-align:center;">Yes</span>
									<img src="{$ImagePath}/8606_Line.gif" alt="Line"/>
									<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="SmallBullet"/>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:46mm;height:13mm;">
								<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:60%;float:none;font-size:7pt">
									Enter the amount from line 3 on line<br/>
									14. Do not complete the rest of Part I.
								</div>
								<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:40%;float:none;">
									Go to line 4.
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">13.2mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">4</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:2px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Enter those contributions included on line 1 that were made from January 1, 2014, through April 15, 2014
								</div>
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRAPostTaxYrContriAmt"/>
								<xsl:with-param name="Number">4</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">5</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Subtract line 4 from line 3
								</div>
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
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
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATaxYearNetBasisAmt"/>
								<xsl:with-param name="Number">5</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">6</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Enter the value of <b>all</b> your traditional, SEP, and SIMPLE IRAs as of 
									December 31, 2013, plus any outstanding rollovers (see instructions)
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:10px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRACurrTYIRAPlusRllvrAmt"/>
										<xsl:with-param name="Number">6</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="padding-bottom:0mm;">
							<div class="styIRS8606LNLeftNumBox">7</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;font-size:7pt;">
									Enter your distributions from traditional, SEP, and SIMPLE IRAs in 2013.
									<b>Do</b> not include rollovers, qualified charitable distributions, a one-time distribution to fund an HSA, conversions to a Roth IRA, certain returned contributions, or recharacterizations of traditional IRA contributions (see instructions)
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:8px"/>.
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
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:6.1mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">6.1mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRAWthdrwLessRllvrAmt"/>
										<xsl:with-param name="Number">7</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="padding-top:0mm;">
							<div class="styIRS8606LNLeftNumBox">8</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;font-size:7pt;">
									Enter the net amount you converted from traditional, SEP, and SIMPLE
									IRAs to Roth IRAs in 2013. <b>Do not</b> include amounts converted that you
									later recharacterized (see instructions). Also enter this amount on line 16
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:7px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATYCombinedIRAValueAmt"/>
										<xsl:with-param name="Number">8</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">9</div>
							<div class="styIRS8606LNDesc" style="width:68mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Add lines 6, 7, and 8
								</div>
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styBoldText">
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
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATotRllvrWthdrwVlAmt"/>
								<xsl:with-param name="Number">9</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="height:4mm">
							<div class="styIRS8606LNLeftNumBox">10</div>
							<div class="styIRS8606LNDesc" style="width:107.2mm;padding-left:3mm;border-right:1px solid black">
								<!--<div class="styIRS8606LNDesc" style="width:auto;height:100%;">-->
									Divide line 5 by line 9. Enter the result as a decimal rounded to at least
									3 places. If the result is 1.000 or more, enter “1.000”
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:6px"/>.
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
									<div class="styLNLeftNumBox" style="width:7.7mm;height:7.5mm;text-align:center;padding-right:1mm;padding-top:4mm;padding-bottom:0;border-bottom:1px solid black">10</div>
										<div class="styLNAmountBox" style="width:29.5mm;padding-top:4mm;padding-bottom:0;height:7.5mm;border-right:1px solid black;text-align:left;padding-left:9mm;">
										x
											<span style="width:8mm"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATaxYearBasisRt"/>
											</xsl:call-template>
										</div>
									<div class="styLNLeftNumBox" style="width:7.7mm;background-color:lightgrey;height:7.5mm"></div>
									<div class="styLNAmountBox" style="width:28mm;height:7.5mm;border-bottom-width:0px">
									</div>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">11</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Multiply line 8 by line 10. This is the nontaxable portion of the amount
									you converted to Roth IRAs. Also enter this amount on line 17
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:6px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRANontxCnvrtAmt"/>
										<xsl:with-param name="Number">11</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">12</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Multiply line 7 by line 10. This is the nontaxable portion of your
									distributions that you did not convert to a Roth IRA
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:15px"/>.
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
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRANontxWthdrwUncnvrtAmt"/>
										<xsl:with-param name="Number">12</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">13</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Add lines 11 and 12. This is the nontaxable portion of all your distributions
								</div>
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
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
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRANontxOfWthdrwAmt"/>
								<xsl:with-param name="Number">13</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">14</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Subtract line 13 from line 3. This is <b>your total basis in traditional IRAs for 2013 and earlier years</b>
								</div>
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATotalIRABasisAmt"/>
								<xsl:with-param name="Number">14</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">15</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									<b>Taxable amount.</b> Subtract line 12 from line 7. If more than zero, also include this amount on Form
									1040, line 15b; Form 1040A, line 11b; or Form 1040NR, line 16b
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:15px"/>.
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
									<!--<b>Note:</b> You may be subject to an additional 10% tax on the amount on line 15 if you were under
									age 59½ at the time of the distribution (see instructions).-->
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;font-size:7pt;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATaxableAmt"/>
										<xsl:with-param name="Number">15</xsl:with-param>
									</xsl:call-template>
								</div>
								<!--<div class="styIRS8606LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>-->
							</div>
						</div>
					<!-- (15 - NOTE) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem">
						<div class="styIRS8606LNLeftNumBox" style="padding-left:2.2mm;"></div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
								<b>Note:</b> You may be subject to an additional 10% tax on the amount on line 15 if you were under
									age 59½ at the time of the distribution (see instructions).
							</div>
						</div>
						<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						</div>
					</div>
					
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8606</span> (2013)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 63966F
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Form 8606 (2013)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;padding-bottom:3px;">
							2013 Conversions From Traditional, SEP, or SIMPLE IRAs to Roth IRAs<br/>
							<span class="styNormalText" style="font-size:6.5pt;">
								Complete this part if you converted part or all of your traditional, SEP, and SIMPLE IRAs to a Roth IRA in 2013 (excluding
								any portion you recharacterized).
							</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;border-bottom-width:1px;">
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">16</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;font-size:7pt;">
									If you completed Part I, enter the amount from line 8. Otherwise, enter the net amount you
									converted from traditional, SEP, and SIMPLE IRAs to Roth IRAs in 2013. <b>Do not</b> include amounts
									you later recharacterized back to traditional, SEP, or SIMPLE IRAs in 2013 or 2014 (see instructions)
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:15px"/>.
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
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8606Data/TotalIRAConvertedToRothAmt"/>
										<xsl:with-param name="Number">16</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (17) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem">
							<div class="styIRS8606LNLeftNumBox">17</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									If you completed Part I, enter the amount from line 11. Otherwise, enter your basis in the amount
									on line 16 (see instructions)
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:15px"/>.
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
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8606Data/TraditionalIRABasisAmt"/>
										<xsl:with-param name="Number">17</xsl:with-param>
										<!--<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>-->
									</xsl:call-template>
								</div>
							</div>
						</div>
					
						<!-- (18) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="border-bottom-width:0px;border-color:red;">
							<div class="styIRS8606LNLeftNumBox">18</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									<b>Taxable amount.</b>  Subtract line 17 from line 16.  Also include the amount on
									Form1040, line 15b; Form1040A, line 11b; or Form1040NR, line 16b
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:15px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:15px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:15px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8606Data/TaxableIRAConversionAmt"/>
										<xsl:with-param name="Number">18</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Part III																											 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;border-top-width:0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							Distributions From Roth IRAs.<br/>
							<span class="styNormalText">
								Complete this part only if you took a distribution from a Roth IRA in 2013. For this purpose, a distribution does not
								include a rollover, qualified charitable distribution, a one-time distribution to fund an HSA, recharacterization, or
								return of certain contributions (see instructions).
							</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;">
					<!-- (19) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem">
						<div class="styIRS8606LNLeftNumBox" style="padding-left:2.2mm;">19</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
								Enter your total nonqualified distributions from Roth IRAs in 2013, including any
								qualified first-time homebuyer distrubtions (see
								instructions)
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:6px"/>.
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
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
						<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8606Data/TotNonQlfyDistriFromRothIRAAmt"/>
									<xsl:with-param name="Number">19</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!-- (20) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem">
						<div class="styIRS8606LNLeftNumBox">20</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
								Qualified first-time homebuyer expenses (see instructions). <b>Do not</b> enter more than
								$10,000
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:15px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>

							<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8606Data/QlfyFirstTimeHmByrExpensesAmt"/>
									<xsl:with-param name="Number">20</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					
					<!-- (21) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem">
						<div class="styIRS8606LNLeftNumBox">21</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
								Subtract line 20 from line 19. If zero or less, enter -0- and skip lines 22 through 25
								<!--Dotted Line-->
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
								</span>
							</div>
						</div>

							<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8606Data/NetQlfyFirstTimeHmByrExpnssAmt"/>
									<xsl:with-param name="Number">21</xsl:with-param>
								</xsl:call-template>
							</div>
					</div>
					
					<!-- (22) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem" style="height:5mm">
						<div class="styIRS8606LNLeftNumBox">22</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
								Enter your basis in Roth IRA contributions (see instructions)
							</div>
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;padding:0px 3mm 0px 0px;">
								<!--Dotted Line-->
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
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
						<xsl:call-template name="CreateBox">
							<xsl:with-param name="Height">6mm</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8606Data/ROTHIRAContributionBasisAmt"/>
							<xsl:with-param name="Number">22</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- (23) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem">
						<div class="styIRS8606LNLeftNumBox" style="padding-left:2.2mm;">23</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
								Subtract line 22 from line 21. If zero or less, enter -0- and skip lines 24 and 25.
								 If more than zero, you may be subject to an additional tax (see instructions)
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:6px"/>.
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
						</div>
						<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8606Data/NetBasisInRothIRAContriAmt"/>
									<xsl:with-param name="Number">23</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- (24) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem">
						<div class="styIRS8606LNLeftNumBox">24</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
								Enter your basis in conversions from traditional, SEP, and SIMPLE IRAs and 
								rollovers from qualified retirement plans to a Roth IRA (see instructions)
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:15px"/>.
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
						</div>
						<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">6mm</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form8606Data/BasisInCnvtQlfyRtrPlanAmt"/>
									<xsl:with-param name="Number">24</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--(25)  ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem">
						<div class="styIRS8606LNLeftNumBox">25</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
								<b>Taxable amount.</b> Subtract line 24 from line 23. If more than zero, also include this amount on 
								Form 1040, line 15b; Form 1040A, line 11b; or Form 1040NR, line 16b
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:15px"/>.
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
						</div>
						<xsl:call-template name="CreateBox">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">padding-top:4mm</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding-top:4mm</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8606Data/TaxableIRADistributionAmt"/>
							<xsl:with-param name="Number">25</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
					
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Signature																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div style="width:187mm;">
						<div style="border-bottom:1px solid black;width:187mm">
							<div class="styIRS8606LNDesc" style="width:40mm;height:23mm;padding:0px 0px 0px 0px;border-right-width:1px;border-color:black;">
								<span class="styBoldText" style="font-size:9pt;padding:8px 0px 8px 0px;height:100%">
									Sign Here Only If You<br/>
									Are Filing This Form by<br/>
									Itself and Not With Your<br/>
									Tax Return
								</span>
							</div>
							<div style="width:144mm;height:23mm;padding:0px 0px 0px 5px;">
								Under penalties of perjury, I declare that I have examined this form, including accompanying attachments, and to the best of my knowledge and
								belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
								<br/><br/>
								<div class="styIRS8606LNDesc" style="width:5mm;padding:0px 0px 0px 5px;">
									<img src="{$ImagePath}/8606_Bullet_Md.gif" alt="MediumBullet"/>
								</div>
								<div class="styIRS8606LNDesc" style="width:55mm;padding:0px 0px 0px 5px;">
									<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;height:4mm;border-bottom-width:1px;border-color:black;width:55mm"/>
									<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;height:4mm;font-size:6pt;width:55mm">
										Your signature
									</div>
								</div>
								<div class="styIRS8606LNDesc" style="width:5mm;padding:0px 0px 0px 45px;">
									<img src="{$ImagePath}/8606_Bullet_Md.gif" alt="MediumBullet"/>
								</div>
								<div class="styIRS8606LNDesc" style="width:55mm;padding:0px 0px 0px 10px;">
									<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;"/>
									<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
										Date
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Paid Preparer Section																					 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div style="border-bottom: 2px solid black;width:187mm;font-size:6pt;">
						<div class="styGenericDiv" style="width:20mm;padding-top:4mm;float:left;clear:none;height:22mm;border-right:1px solid black">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;padding-left:3px;">
								Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:6mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									Check<label> 
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
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
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;">
									<span class="styGenericDiv" style="padding-left:3px;">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
								<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
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
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;">
									<div class="styGenericDiv" style="padding-right:.5mm;padding-left:3px;">Firm's address 
									<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">State</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCode</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
					</div>
					<!-- /////////////Footer///////////////////////////////////// -->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;text-align:right">
						Form 		
						<span class="styBoldText" style="font-size:8pt;">8606</span> (2013)
					</div>




					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
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
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8606Data"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:if test="$Form8606Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtAmt">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part VIII, Line 52 - Waive Tax On Ex Accum QRP Statement Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8606Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtAmt"/>
								<xsl:with-param name="DescWidth" select="130"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$Form8606Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part VIII, Line 52 - Waive Tax On Ex Accum QRP Statement Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8606Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtCd"/>
								<xsl:with-param name="DescWidth" select="130"/>
							</xsl:call-template>
						</xsl:if>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
