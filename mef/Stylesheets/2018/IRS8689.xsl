<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 07/23/2018 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8689Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8689Data" select="$RtnDoc/IRS8689"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="StaticTextBefore"/>
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
					<xsl:otherwise>padding-top:2px;</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$AmountBoxStyle">
					<xsl:value-of select="$AmountBoxStyle"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="$TargetNode">
					<xsl:value-of select="$StaticTextBefore"/>
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
						<xsl:with-param name="RootElement" select="local-name($Form8689Data)"/>
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
				<meta name="Description" content="IRS Form 8689"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8689Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8689">
					<!--  Begin Header section 1 -->
					<div style="clear: left; float: left;">
					 <xsl:call-template name="DocumentHeader"/>
					</div>
					<div class="styBB" style="width: 187mm; height: 22mm; clear: left; border-bottom-width: 2px; float: left;">
						<div class="styFNBox" style="width: 31mm; height: 22mm; padding-top: 0.5mm; border-right-width: 2px;">
							<div style="padding-top:1mm;">
								Form<span style="width:2mm;"/>
								<span class="styFormNumber">  8689</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8689Data"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-top:5mm;padding:bottom:0mm;">
								Department of the Treasury<br/>
								Internal Revenue Service 
							</div>
						</div>
						<div class="styFTBox" style="width: 125mm; height: 22mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:10mm;">
								Allocation of Individual Income Tax<br/>
								to the U.S. Virgin Islands
							</div>
							<div class="styFST" style="width: 125mm; height: 6mm; text-align: center; font-size: 7pt;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width: 125mm; height: 11.5mm; padding-top:2mm;">
											<br/>
											<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040.<br/>
											<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/> 
											Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8689" title="Link to IRS.gov">
											<i>www.irs.gov/Form8689</i></a> for the latest information.
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width: 30.5mm; height: 22mm; border-left-width: 2px;">
							<div class="styOMB" style="height: 4mm; font-size: 7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">18</span>
							</div>
							<div style="margin-left:5mm;text-align:left;font-size:7pt;">
								Attachment Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">85</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styGenericDiv" style="width: 187mm; height: 8mm; clear: left; float: left;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on Form 1040<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
									 <xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
								  </xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:8mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
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
					<!-- Begin Part I																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div class="styGenericDiv" style="width:187mm; height: 4.5mm; clear: left; float: left; border-top:1px solid black; border-bottom:1px solid black;">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:5mm;">
							Income From the U.S. Virgin Islands (USVI)
						</div>
					</div>
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">1</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width: 144mm; height: 4.5mm; padding-top: 1.75mm;">
									Wages, salaries, tips, etc
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........................</span>									
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/WagesSalariesAndTipsAmt"/>
								<xsl:with-param name="Number">1</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">2</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:144mm;height:100%; padding-top: 1.75mm;">
									Taxable interest
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:4mm;">.............................</span>									
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TaxableInterestAmt"/>
								<xsl:with-param name="Number">2</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">3</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:144mm;height:100%; padding-top: 1.75mm;">
									Ordinary dividends
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:4.5mm;">............................</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/OrdinaryDividendsAmt"/>
								<xsl:with-param name="Number">3</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">4</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Taxable refunds, credits, or offsets of local USVI income taxes
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:2.5mm;">...............</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/USVITaxRefCreditsOffsetAmt"/>
								<xsl:with-param name="Number">4</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">5</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Alimony received
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:2.75mm;">.............................</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/AlimonyReceivedAmt"/>
								<xsl:with-param name="Number">5</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">6</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Business income or (loss)
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:4.25mm;">..........................</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/BusinessIncomeLossAmt"/>
								<xsl:with-param name="Number">6</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">7</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Capital gain or (loss)
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:2.25mm;">............................</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/CapitalGainLossAmt"/>
								<xsl:with-param name="Number">7</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">8</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Other gains or (losses)
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:3.5mm;">...........................</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/OtherGainLossAmt"/>
								<xsl:with-param name="Number">8</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">9</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									IRA distributions (taxable amount)
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>	
                  				</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/IRADistributionsAmt"/>
								<xsl:with-param name="Number">9</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">10</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Pensions and annuities (taxable amount)
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:1.25mm;">......................</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TxblPensionAndAnnuitiesAmt"/>
								<xsl:with-param name="Number">10</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">11</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Rental real estate, royalties, partnerships, S corporations, trusts, etc.
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.............</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/RntlRyltsPrtshpSCorpTREtcAmt"/>
								<xsl:with-param name="Number">11</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">12</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Farm income or (loss)
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............................</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/FarmIncomeOrLossAmt"/>
								<xsl:with-param name="Number">12</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">13</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Unemployment compensation
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:3.35mm;">.........................</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/UnemploymentCompAmt"/>
								<xsl:with-param name="Number">13</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">14</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Social security benefits (taxable amount)
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:1.15mm;">......................</span>										
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TaxableSocSecAmt"/>
								<xsl:with-param name="Number">14</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">15</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.75mm;">
									Other income. List type and amount
									<span style="width:5px;"/>
									<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:5px;"/> 
								</div>
								<div class="styIRS8689LNDesc" style="width:85mm;height:100%;text-align:right;padding: 2mm 3mm 0mm 0mm;border-style:dotted;border-bottom-width:1px;border-color:black;"/>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TotalOtherUSVIIncomeAmt"/>
								<xsl:with-param name="Number">15</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.5mm;">16</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height: 4.5mm;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%; padding-top: 1.5mm;">
									Add lines 1 through 15. This is your <b>total USVI income</b>
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:2.75mm;">................</span>										
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding: 1.5mm 1.75mm 0mm 0mm;">
										<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TotalUSVIIncomeAmt"/>
								<xsl:with-param name="Number">16</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div class="styGenericDiv" style="width:187mm;border-top:1px solid black; border-bottom:1px solid black; clear: left; float: left;">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:5mm;">
							Adjusted Gross Income From the USVI
						</div>
					</div>
						<!-- (17) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">17</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Educator expenses
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:1.9mm;">...................</span>												
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/EducatorExpensesAmt"/>
						<xsl:with-param name="AmountBoxStyle"></xsl:with-param>
										<xsl:with-param name="Number">17</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (18) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 7mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">18</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:7mm; padding:1.75mm 0mm 0mm 3mm;">
									Certain business expenses of reservists, performing artists, and<br/>
									fee-basis government officials
                  				  	<span class="styDotLn" style="float:none;clear:none;">................</span>	
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/BusExpnsReservistsAndOthersAmt"/>
										<xsl:with-param name="Number">18</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (19) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">19</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:4.5mm; padding:1.75mm 0mm 0mm 3mm;">
									Health savings account deduction
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:3.5mm;">..............</span>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/HealthSavingsAccountDedAmt"/>
										<xsl:with-param name="Number">19</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (20) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">20</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:4.5mm; padding:1.75mm 0mm 0mm 3mm;">
									Moving expenses
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:4mm;">...................</span>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/MovingExpenseAmt"/>
										<xsl:with-param name="Number">20</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (21) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">21</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Deductible part of self-employment tax
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:4.4mm;">............</span>
								</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/OneHalfSelfEmploymentTaxAmt"/>
										<xsl:with-param name="Number">21</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (22) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">22</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Self-employed SEP, SIMPLE, and qualified plans
                  				  	<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..........</span>
								</div>
								<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/SelfEmpldSepSimpleQlfyPlansAmt"/>
										<xsl:with-param name="Number">22</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (23) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">23</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
								Self-employed health insurance deduction
                  				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span>
								</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/SelfEmpldHealthInsDedAmt"/>
										<xsl:with-param name="Number">23</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (24) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">24</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
								Penalty on early withdrawal of savings
                   				<span class="styDotLn" style="float:none;clear:none;padding-left:1.3mm;">.............</span>
								</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/PnltyOnErlyWthdrwOfSavingsAmt"/>
										<xsl:with-param name="Number">24</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (25) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">25</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									IRA deduction
									<span class="styDotLn" style="float:none;clear:none;padding-left:3.75mm;">....................</span>
								</div>
								<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/IRADeductionAmt"/>
										<xsl:with-param name="Number">25</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (26) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">26</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
								Student loan interest deduction
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...............</span>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/StudentLoanInterestDedAmt"/>
										<xsl:with-param name="Number">26</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (27) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">27</div>
							<div class="styIRS8689LNDesc" style="width:105mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
								Reserved for future use
								<span class="styDotLn" style="float:none;clear:none;padding-left:4.25mm;">................</span>
								</div>
							<div class="styIRS8689LNDesc" style="height:100%; width:75mm; float:right; padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<!--<xsl:with-param name="TargetNode" select="$Form8689Data/TuitionAndFeesDedAmt"/>-->
										<xsl:with-param name="AmountBoxStyle">background-color:lightgrey</xsl:with-param>
										<xsl:with-param name="Number">27</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (28) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">28</div>
							<div class="styIRS8689LNDesc" style="width:144mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Add lines 17 through 27
		  						    <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........................</span>
 								</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TotalDedAttrblToUSVIIncomeAmt"/>
								<xsl:with-param name="Number">28</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (29) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">29</div>
							<div class="styIRS8689LNDesc" style="width:144mm; height:5mm;padding:1.75mm 0mm 0mm 3mm;">
									Subtract line 28 from line 16. This is your <b>USVI adjusted gross income</b>
		  						    <span class="styDotLn" style="float:none;clear:none;padding-left:3.75mm;">..........</span>
		  						    <img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/VirginIslandsAGIAmt"/>
								<xsl:with-param name="Number">29</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part III																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div  class="styGenericDiv" style="width:187mm;border-top:1px solid black; border-bottom:1px solid black; clear: left; float: left;">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:5mm;">
							Allocation of Tax to the USVI
						</div>
					</div>
						<!-- (30) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">30</div>
							<div class="styIRS8689LNDesc" style="width: 144mm; height: 4.5mm;padding:1.75mm 0mm 0mm 3mm;">
								Enter amount from Form 1040, line 63
	  						    <span class="styDotLn" style="float:none;clear:none;padding-left:2.75mm;">......................</span>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/Form1040TotalTaxAmt"/>
								<xsl:with-param name="Number">30</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (31) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 13.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">31</div>
							<div class="styIRS8689LNDesc" style="width: 144mm; height: 13.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Enter the total of the amounts from Form 1040, lines 57, 58, 60a, 66a, 67, 68, 73 (boxes c and d). Include <br/>
									any uncollected social security and Medicare or tier 1 RRTA tax, tax on excess golden parachute payments, <br/>
									or excise tax on insider stock compensation reported on line 62. Also include any amount from Form 5329, <br/>
									Parts III, IV, V, VI, VII, VIII, or IX reported on Form 1040, line 59
	     						    <span class="styDotLn" style="float:none;clear:none;padding-left:.5mm;">..............</span>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">8.6mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/VirginIslandsTaxAdjustmentAmt"/>
								<xsl:with-param name="Number">31</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (32) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">32</div>
							<div class="styIRS8689LNDesc" style="width: 144mm; height: 5mm;padding:1.75mm 0mm 0mm 3mm;">
									Subtract line 31 from line 30
	  						       <span class="styDotLn" style="float:none;clear:none;padding-left:3.5mm;">.........................</span>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/AdjustedTaxAmt"/>
								<xsl:with-param name="Number">32</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (33) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">33</div>
							<div class="styIRS8689LNDesc" style="width: 106mm; height: 4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Enter amount from Form 1040, line 38
	  						       <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.............</span>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/Form1040AdjustedGrossIncomeAmt"/>
										<xsl:with-param name="Number">33</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (34) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="width: 187mm; height: 4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">34</div>
							<div class="styIRS8689LNDesc" style="width: 144mm; height: 4.5mm;padding:1.75mm 0mm 0mm 3mm;font-family:Arial Narrow; font-size:8pt; ">
								Divide line 29 above by line 33. Enter the result as a decimal (rounded to at least 3 places). Do not enter more than 1.000
	  					       <span class="styDotLn" style="float:none;clear:none;font-family:Arial;padding-left:3.75mm;">...</span>
							</div>
							<div class="styLNRightNumBox" style="padding:3px 0px 0px 0px;border-right-width:0px;height:5mm;">
								34
							</div>
							<div style="width:29mm;height:5mm;border-width:0px 0px 1px 1px;border-color:#000000;float:right;border-style:solid;">
								<span style="width:4mm;height:100%;padding-top:2px;float:left;padding-left:10px;">x</span>
								<span style="width:24mm;height:100%;border-left-width:0px;float:right;font-size:6pt;padding-top:6px;padding-right:2px;color:darkblue;text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8689Data/USVIAGIDividedBy1040AGIPct"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- (35) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem" style="page-break-after:always; width: 187mm; height: 5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.5mm;">35</div>
							<div class="styIRS8689LNDesc" style="width: 144mm; height: 5mm;padding:1.75mm 0mm 0mm 3mm;">
								Multiply line 32 by line 34. This is your <b>tax allocated to the USVI</b>
	  					       <span class="styDotLn" style="float:none;clear:none;padding-left:.5mm;">..............</span>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/VirginIslandsTaxAllocatedAmt"/>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="Number">35</xsl:with-param>
							</xsl:call-template>
						</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part IV																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div class="styGenericDiv" style="width:187mm;border-top:1px solid black; border-bottom: 1px solid black; clear: left; float: left;">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part IV</div>
						<div class="styPartDesc" style="padding-left:5mm;">
							Payments of Income Tax to the USVI
						</div>
					</div>
						<!-- (36) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm; height:4.5; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">36</div>
							<div class="styIRS8689LNDesc" style="width: 105mm; height: 4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Income tax withheld by the USVI
	  					          <span class="styDotLn" style="float:none;clear:none;padding-left:4mm;">..............</span>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<!---<xsl:with-param name="Height">100%</xsl:with-param> -->
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/USVIWithholdingTaxAmt"/>
										<xsl:with-param name="Number">36</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (37) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm; height:4.5; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">37</div>
							<div class="styIRS8689LNDesc" style="width: 105mm; height: 4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									2018 estimated tax payments and amount applied from 2017 return
	  					          <span class="styDotLn" style="float:none;clear:none;padding-left:3.9mm;">...</span>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/EstTaxAndCreditElectPymtAmt"/>
										<xsl:with-param name="Number">37</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (38) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm; height:4.5; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">38</div>
							<div class="styIRS8689LNDesc" style="width: 105mm; height: 4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Amount paid with Form 4868 (extension request)
	  					          <span class="styDotLn" style="float:none;clear:none;padding-left:3.5mm;">.........</span>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/PymtMadeWithExtensionAmt"/>
										<xsl:with-param name="Number">38</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (39) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm; height:4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">39</div>
							<div class="styIRS8689LNDesc" style="width: 144mm; height: 4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Add lines 36 through 38. These are your <b>total payments to the USVI</b>
	  					          <span class="styDotLn" style="float:none;clear:none;padding-left:4.15mm;">............</span>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TotalPaymentsAmt"/>
								<xsl:with-param name="Number">39</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (40) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm; height:7mm; clear: left; float: left; border-bottom:1px solid black;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 0.5mm;">40</div>
							<div class="styIRS8689LNDesc" style="width: 144mm; height: 7mm;padding:.5mm 0mm 0mm 3mm;">
									Enter the smaller of line 35 or line 39. Include this amount in the total on Form 1040, line 74. On the<br/>dotted line next to line 74, enter "Form 8689" and show this amount
	  					          <span class="styDotLn" style="float:none;clear:none;padding-left:2.75mm;">.............</span>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/SmallerAllocTaxOrTotPaymentAmt"/>
										<xsl:with-param name="Number">40</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (41) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm; height:4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top:1.75mm;">41</div>
							<div class="styIRS8689LNDesc" style="padding: 0px; width: 144mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									<b>Overpayment</b> to the USVI. If line 39 is more than line 35, subtract line 35 from line 39
	  					           <span class="styDotLn" style="float:none;clear:none;padding-left:2.25mm;">.......</span>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/OverpaidToUSVIAmt"/>
								<xsl:with-param name="Number">41</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:1px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:1px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (42) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm; height:4.5mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">42</div>
							<div class="styIRS8689LNDesc" style="width: 144mm; height:4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Amount of line 41 you want <b>refunded to you</b>
	  					           <span class="styDotLn" style="float:none;clear:none;padding-left:3.5mm;">....................</span>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/RefundAmt"/>
								<xsl:with-param name="Number">42</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (43) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm; height:4.5; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">43</div>
							<div class="styIRS8689LNDesc" style="width: 106mm; height: 4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									Amount of line 41 you want <b>applied to your 2019 estimated tax</b>
	  					           <span class="styDotLn" style="float:none;clear:none;padding-left:2.75mm;">....</span>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:1px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:1px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/AppliedToEsTaxAmt"/>
										<xsl:with-param name="Number">43</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (44) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm; height:4.5; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">44</div>
							<div class="styIRS8689LNDesc" style="width: 144mm; height: 4.5mm;padding:1.75mm 0mm 0mm 3mm;">
									<b>Amount you owe</b> to the USVI. If line 39 is less than line 35, subtract line 39 from line 35
	  					           <span class="styDotLn" style="float:none;clear:none;padding-left:3mm;">......</span>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/AmountOwedToUSVIAmt"/>
										<xsl:with-param name="Number">44</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:1px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:1px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (45) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm; height:11mm; clear: left; float: left;">
							<div class="styIRS8689LNLeftNumBox" style="padding-top: 1.75mm;">45</div>
							<div class="styIRS8689LNDesc" style="width: 144mm; height: 11mm;padding:1.75mm 0mm 0mm 3mm;">
									Enter the amount from line 44 that you will pay when you file your income tax return. Include this amount<br/>
									in the total of Form 1040, line 74. On the dotted line next to line 74, enter "Form 8689" and show this<br/>
									amount
	  					           <span class="styDotLn" style="float:none;clear:none;padding-left:2.5mm;">................................</span>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">6mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/USVIPaymentAmt"/>
								<xsl:with-param name="Number">45</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					<!--</div>-->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm; height: 8mm; border-top:1px solid black;padding-top:1mm; clear: left; float: left;">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see Form 1040 instructions.
							</span>
						</div>
						<div style="text-align:left;;font-size:7pt;">
							<span style="width:100px"/>
							Cat. No. 64603D
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>
							Form <span class="styBoldText" style="width:7.5mm; font-size:7pt;"> 8689 </span>(2018)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="width:187mm; height: auto; clear: left; float: left;">
					<p style="page-break-before: always;"></p>
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer" style="float: right;">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl" style="width:187mm; clear: left; float: left;">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8689Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line A, Child's Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8689Data/ChildNameControl"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>