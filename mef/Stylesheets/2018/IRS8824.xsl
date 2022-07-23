<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8824Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form8824Data" select="$RtnDoc/IRS8824"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8824Data)"/>
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
				<meta name="Description" content="Form IRS8824"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- PRINT PRINT STATEMENT -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8824Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8824">
					<!-- BEGIN WARNING LINE -->
					<div class="styGenericDiv" style=" width:187mm;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<!-- END WARNING LINE -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:29mm;height:21mm; border-right-width:2px;">
						  Form <span class="styFormNumber">8824</span>
							<br/>
							<!-- Push Pin -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8824Data"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverBooleanDataTableInline">
								<xsl:with-param name="Desc">Form 8824, Top Left Margin - Gain in Multiple Asset Exchange Statement</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8824Data/@gainInMultiAssetExchStmtInd"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<br/>
							<span class="styAgency" style="padding-top:3mm;">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:128mm;padding-top:2mm">
							<div class="styMainTitle">
								Like-Kind Exchanges 
							</div>
							<div class="styFST" style="width:128mm;font-size:9pt;">
								(and section 1043 conflict-of-interest sales)
							</div>
							<!--	<br/>-->
							<div class="styFST" style="font-size:7pt;padding-top:3mm;">
								<img src="{$ImagePath}/8824_Bullet_Title.gif" alt="bullet image"/>
								Attach to your tax return.
							</div>
							<div class="styFST" style="width:125mm;float:left;clear:none;">
								<img src="{$ImagePath}/8824_Bullet_Title.gif" alt="Bullet Image"/>
								Go to  			
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form8824" title="Link to IRS.gov Form 8824">
									<i>www.irs.gov/Form8824</i>
								</a> for instructions and the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:29mm;height:21mm;border-left-width:2px;">
							<div class="styOMB" style="height:4mm;">
							 OMB No. 1545-1190
						    </div>
							<div class="styTaxYear">
							  20<span class="styTYColor">18</span>
							</div>
							<div class="styOMB" style="border-bottom-width:0px;text-align:left;padding-left:3mm;">Attachment Sequence No. 
							  <span class="styBoldText">109</span>
							</div>
						</div>
					</div>
					<!-- Names and ID's -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:144mm;height:9mm;">
						Name(s) shown on tax return<br/>
							<!-- Choice between 1120, 1065, 1041 and 1040 Return Header Filer info -->
							<xsl:call-template name="Populate8824FilerName">
								<xsl:with-param name="TargetNode" select="$Form8824Data"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:42mm;height:5mm;padding-left:4mm;">
							Identifying number<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="Populate8824FilerTIN">
									<xsl:with-param name="TargetNode" select="$Form8824Data"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End of Names and ID's -->
					<!-- Like Kind Exchange information -->
					<!-- Part I-->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;">Part I</div>
						<div class="styPartDesc">
							<span style="width:8px;"/>Information on the Like-Kind Exchange
						</div>
					</div>
					<!-- Note Line-->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;">
							<br/>
							<div class="styLNLeftNumBox"/>
							<div class="styGenericDiv" style="width:178mm;">
								<span class="styItalicText">
									<span class="styBoldText" style="font-style:normal;">Note:</span> Generally, only real property should be described on line 1 or 2. However, you may describe personal and/or real property on line 1 or 2 if you are filing this form to report the disposition of property exchanged in a previously reported related party like-kind exchange. If the property described on line 1 or line 2 is real or personal property located outside the United States, indicate the country.
								</span>
							</div>
						</div>
						<!-- Line 1-->
						<div style="width:187mm;height:8mm;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">1</div>
							<div class="styGenericDiv">
								Description of like-kind property given up:
								<span style="width:4px;"/>
							</div>
							<span class="styFixedUnderline" style="float:right;clear:none;width:124mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8824Data/LikeKindPropertyGivenUpDsc"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 2-->
						<div style="width:187mm;height:9.5mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;padding-top:3mm">2</div>
							<div class="styGenericDiv" style="padding-top:3.5mm;">
								Description of like-kind property received:
								<span style="width:4px;"/>
							</div>
							<span class="styFixedUnderline" style="padding-top:3mm;float:right;clear:none;width:124mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8824Data/LikeKindPropertyReceivedDsc"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="width:187mm;"/>
						<!-- Line 3-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2.5mm;">3</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">Date like-kind property given up was originally acquired (month, day, year) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8824Data/PropertyGivenUpAcquiredDt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">4</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">Date you actually transferred your property to the other party (month, day, year) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8824Data/PropertyTransferredDt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">5</div>
							<div class="styLNDesc" style="width:137.9mm;">
								Date like-kind property you received was identified by written notice to another party (month, day, year). 
								<span style="float:left;">See instructions for 45-day written identification requirement </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5</div>
							<div class="styLNAmountBox" style="height:8mm;text-align:center;padding-top:4mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8824Data/WrittenNoticeOfPropertyRcvdDt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">6</div>
							<div class="styLNDesc" style="width:137.9mm;">
								Date you actually received the like-kind property from other party (month, day, year). See instructions.
								<!--Dotted Line-->
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8824Data/PropertyActuallyReceivedDt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 7-->
						<div style="width:187mm;height:9mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;padding-top:1mm;">7</div>
							<div class="styLNDesc" style="width:153mm;padding-top:1mm;">
							 Was the exchange of the property given up or received made with a related party, either directly or indirectly (such as through an intermediary)? See instructions. If "Yes," complete Part II. If "No," go to Part III 
							 <span class="styDotLn" style="float:right;padding-right:1mm;">........
							 </span>
							</div>
							<div class="styGenericDiv" style="width:25mm;float:right;clear:none;height:3.5mm;padding-top:4mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedPrtyInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Exchange Made With Related Party Yes Box" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedPrtyInd"/>
											<xsl:with-param name="BackupName">Exchange Made With Related Party Yes Box</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedPrtyInd"/>
										<xsl:with-param name="BackupName">Exchange Made With Related Party Yes Box</xsl:with-param>
									</xsl:call-template>
									<b>Yes</b>
								</label>
								<span style="width:2mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedPrtyInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Exchange Made With Related Party No Box" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedPrtyInd"/>
											<xsl:with-param name="BackupName">Exchange Made With Related Party No Box</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedPrtyInd"/>
										<xsl:with-param name="BackupName">Exchange Made With Related Party No Box</xsl:with-param>
									</xsl:call-template>
									<b>No</b>
								</label>
							</div>
						</div>
						<!-- Note Line-->
						<div style="width:187mm;">
							<br/>
							<div class="styLNLeftNumBox"/>
							<div class="styGenericDiv" style="width:178mm;">
								<span class="styItalicText">
									<span class="styBoldText" style="font-style:normal;">Note:</span> Do not file this form if a related party sold property into the exchange, directly or indirectly (such as through an intermediary); that
property became your replacement property; and none of the exceptions in line 11 applies to the exchange. Instead, report the
disposition of the property as if the exchange had been a sale. If one of the exceptions on line 11 applies to the exchange, complete
Part II.
								</span>
								<br/>
								<br/>
							</div>
						</div>
					</div>
					<!-- belong to which div?-->
					<!-- End of like kind exchange information -->
					<!-- Start of Exchange information -->
					<!-- Part II -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="height:4mm;">Part II</div>
							<div class="styPartDesc">
								<span style="width:8px;"/>Related Party Exchange Information
						</div>
						</div>
						<!-- Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="border-bottom-width:0px;padding-left: 2.5mm">8</div>
							<div class="styIRS8824RelatedNameBox" style="width:105mm;height:10mm;padding-top:0.5mm;">
						  Name of related party<br/>
								<xsl:choose>
									<xsl:when test="$Form8824Data/BusinessName/BusinessNameLine1Txt">
										<div style="font-family:verdana;font-size:7pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8824Data/BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="$Form8824Data/BusinessName/BusinessNameLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8824Data/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8824Data/PersonNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="styIRS8824RelatedNameBox" style="height:10mm;width:30mm;font-size:7pt;font-weight:normal;padding-left:1mm;">
							  Relationship to you<br/>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8824Data/RelationshipDescriptionTxt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8824RelatedEINBox" style="height:10mm;width:44mm;font-size:7pt;font-weight:normal;padding-left:1mm;">
							  Related party's identifying number<br/>
								<br/>
								<xsl:if test="$Form8824Data/EIN != ' ' ">
									<span style="padding-left:.1mm;">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form8824Data/EIN"/>
										</xsl:call-template>
									</span>
								</xsl:if>
								<xsl:if test="$Form8824Data/SSN !=' '">
									<span style="font-weight:normal;padding-left:.1mm;">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form8824Data/SSN"/>
										</xsl:call-template>
									</span>
								</xsl:if>
								<xsl:if test="$Form8824Data/MissingEINReasonCd !=' '">
									<span style="font-weight:normal;padding-left:.1mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8824Data/MissingEINReasonCd"/>
										</xsl:call-template>
									</span>
								</xsl:if>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="width:8mm;"/>
							<div class="styIRS8824RelatedNameBox" style="width:179mm;font-size:7pt;border-right-width:0px;">
						  Address (no., street, and apt., room, or suite no., city or town, state, and ZIP code)<br/>
								<xsl:if test="$Form8824Data/USAddress != ' ' ">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form8824Data/USAddress"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8824Data/ForeignAddress != ' ' ">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form8824Data/ForeignAddress"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
						<div style="width:187mm;"/>
						<div class="styBB" style="width:187mm;">
							<!-- Line 9 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">9</div>
								<div class="styLNDesc" style="width:153mm;">
								During this tax year (and before the date that is 2 years after the last transfer of property that was part of
the exchange), did the related party sell or dispose of any part of the like-kind property received from you
(or an intermediary) in the exchange?
							  <span class="styDotLn" style="float:right;">...............................</span>
								</div>
								<div class="styGenericDiv" style="padding-top:6mm;width:25mm;float:right;clear:none;height:3.5mm;">
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropRcvdInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Related Party Sold Prop Received Yes Box" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropRcvdInd"/>
												<xsl:with-param name="BackupName">Related Party Sold Prop Received Yes Box</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropRcvdInd"/>
											<xsl:with-param name="BackupName">Related Party Sold Prop Received Yes Box</xsl:with-param>
										</xsl:call-template>
										<b>Yes</b>
									</label>
									<span style="width:1mm;"/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropRcvdInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Related Party Sold Prop Received No Box" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropRcvdInd"/>
												<xsl:with-param name="BackupName">Related Party Sold Prop Received No Box</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropRcvdInd"/>
											<xsl:with-param name="BackupName">Related Party Sold Prop Received No Box</xsl:with-param>
										</xsl:call-template>
										<b>No</b>
									</label>
								</div>
							</div>
							<div style="width:187mm;"/>
							
							<!-- Line 10 -->
							
							<div style="width:187mm;padding-top:4mm;">
								<div class="styLNLeftNumBox">10</div>
								<div class="styLNDesc" style="width:153mm;">
								During this tax year (and before the date that is 2 years after the last transfer of property that was part of the
                  exchange), did you sell or dispose of any part of the like-kind property you received?
                  <span class="styDotLn" style="float:right;">...............</span>
								</div>
								
								<div class="styGenericDiv" style="padding-top:3mm;width:25mm;float:right;clear:none;height:3.5mm;">
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceivedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="You Sold Property Received Yes Box" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceivedInd"/>
												<xsl:with-param name="BackupName">You Sold Property Received Yes Box</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceivedInd"/>
											<xsl:with-param name="BackupName">You Sold Property Received Yes Box</xsl:with-param>
										</xsl:call-template>
										<b>Yes</b>
									</label>
									<span style="width:1mm;"/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceivedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="You Sold Property Received No Box" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceivedInd"/>
												<xsl:with-param name="BackupName">You Sold Property Received No Box</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceivedInd"/>
											<xsl:with-param name="BackupName">You Sold Property Received No Box</xsl:with-param>
										</xsl:call-template>
										<b>No</b>
									</label>
								</div>
							</div>
							<div style="width:187mm;"/>
							<!-- Italics text section -->
							<div style="width:187mm;padding-top:2mm;">
								<div class="styLNLeftNumBox" style="padding-top:2mm;"/>
								<div class="styLNDesc" style="width:178mm;padding-top:2mm;">
									<span class="styItalicText">
				  If both lines 9 and 10 are "No" and this is the year of the exchange, go to Part III. If both lines 9 and 10 are "No" and  this is 
				  <span class="styBoldText">not</span> the year of the exchange, stop here. If either line 9 or line 10 is "Yes," complete Part III and report on this year’s tax return the deferred gain or (loss) from line 24 <span class="styBoldText">unless</span> one of the exceptions on line 11 applies. 
				</span>
								</div>
							</div>
							<div style="width:187mm;"/>
							<!-- Line 11 -->
							<div style="width:187mm;"/>
							<div style="width:187mm;padding-top:4mm;">
								<div class="styLNLeftNumBox">11</div>
								<div class="styLNDesc" style="width:175mm;">
			    If one of the exceptions below applies to the disposition, check the applicable box.
			  </div>
							</div>
							<!-- Line 11a-->
							<div style="width:187mm;">
								<div class="styLNLeftLtrBoxDD" style="padding-top:3.4mm;">a</div>
								<div class="styLNDesc" style="width:165mm;padding-top:3mm">
									<input type="checkbox" alt="The disposition was after the death of either of the related parties" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8824Data/DisposWasAftrDthRltdPartysInd"/>
											<xsl:with-param name="BackupName">The disposition was after the death of either of the related parties checkbox.</xsl:with-param>
										</xsl:call-template>
									</input>
								The disposition was after the death of either of the related parties.
								<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8824Data/DisposWasAftrDthRltdPartysInd"/>
											<xsl:with-param name="BackupName">The disposition was after the death of either of the related parties checkbox.</xsl:with-param>
										</xsl:call-template>
										<span style="width:1mm;"/>
									</label>
								</div>
							</div>
							<!-- Line 11b-->
							<div style="width:187mm;">
								<div class="styLNLeftLtrBoxDD" style="padding-top:3.4mm">b</div>
								<div class="styLNDesc" style="width:165mm;padding-top:3mm">
									<input type="checkbox" alt="DispositionWasInvlntryCnvrtInd" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8824Data/DispositionWasInvlntryCnvrtInd"/>
											<xsl:with-param name="BackupName">The disposition was an involuntary conversion,
             and the threat of conversion occurred after the exchange checkbox.</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8824Data/DispositionWasInvlntryCnvrtInd"/>
											<xsl:with-param name="BackupName">The disposition was an involuntary conversion,
             and the threat of conversion occurred after the exchange checkbox.</xsl:with-param>
										</xsl:call-template>
										<span style="width:1mm;"/>
          The disposition was an involuntary conversion, and the threat of conversion occurred after the exchange.
        </label>
								</div>
							</div>
							<!-- Line 11c-->
							<div class="styBB" style="width:187mm;height:14mm;">
								<div class="styLNLeftLtrBoxDD" style="padding-top:3.4mm; ">c</div>
								<div class="styLNDesc" style="width:179mm;padding-top:3mm;">
									<span style="width:5mm;">
										<input type="checkbox" alt="Exchange Dispos Not Tax Avoidance" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8824Data/ExchDisposNotTaxAvoidanceInd"/>
												<xsl:with-param name="BackupName">Exchange Dispos Not Tax Avoidance checkbox.</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8824Data/ExchDisposNotTaxAvoidanceInd"/>
												<xsl:with-param name="BackupName">Exchange Dispos Not Tax Avoidance checkbox.</xsl:with-param>
											</xsl:call-template>
										</label>
									</span>
									<span style="width:1mm;"/>
                    You can establish to the satisfaction of the IRS that neither the exchange nor the disposition had tax avoidance as one of its
                    principal <br/>
									<span style="width:6mm;"/>
 purposes. If this box is checked, attach an explanation. See instructions.
     
								<!-- set the push pin image -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8824Data/ExchDisposNotTaxAvoidanceInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- End of Exchange Information -->
						<!--footer -->
						<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
							<div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see the instructions.</div>
							<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12311A</div>
							<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8824</span> (2018)</div>
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- header -->
					<div class="styBB" style="width:187mm;clear:both;padding-bottom:.5mm;">
						<div style="width:90mm;" class="styGenericDiv">Form 8824 (2018 )</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</div>
					</div>
					<!-- Begin Second page Name and ID section -->
					<!--UNIQUE Line instruction where data on this line is not to be repeat from the return header 
						yet schema does not define this data as an input field if information is different from the return header information -->
					<div class="styBB" style="width:187mm;clear:both; border-top-width:1px;">
						<div class="styNameBox" style="width:144mm;height:9.5mm;font-size:7pt;">
							Name(s) shown on tax return. Do not enter name and social security number if shown on other side.<br/>
						</div>
						<div class="styEINBox" style="width:42mm;height:9.5mm;padding-left:2mm;font-size:7pt;">
							 Your social security number<br/>
							<br/>
						</div>
					</div>
					<!-- End Second page Name and ID section -->
					<!-- Start of Part III -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;">Part III</div>
						<div class="styPartDesc">
							<span style="width:8px;"/>
				Realized Gain or (Loss), Recognized Gain, and Basis of Like-Kind Property Received
			</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<!-- Caution line -->
						<div style="width:187mm;height:10mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:178mm;padding-top:1mm;">
								<b>Caution: </b>
								<i> If you transferred  <b> and </b> received <b> (a) </b> more than one group of like-kind properties or 
							<b> (b) </b> cash or other (not like-kind) property, see </i>
								<b> Reporting of multi-asset exchanges </b>
								<i> in the instructions.</i>
								<br/>
								<b>Note: </b>
								<i>	Complete lines 12 through 14 <b> only </b> if you gave up property that was not like-kind.  Otherwise, go to line 15. </i>
							</div>
						</div>
						<!-- Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
							<div class="styLNDesc" style="width:97.8mm;height:4.5mm;">
								<span style="float:left;">Fair market value (FMV) of other property given up </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/FMVOfOtherPropertyGivenUpAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.2mm;background-color:lightgrey;height:4.5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<!-- Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">13</div>
							<div class="styLNDesc" style="width:97.8mm;height:4.5mm;">
								<span style="float:left;">Adjusted basis of other property given up </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/AdjustedBasisOfOthPropGvnUpAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.2mm;background-color:lightgrey;height:4.7mm;"/>
							<div class="styLNAmountBox" style="height:4.7mm; border-bottom-width:0px"/>
						</div>
						<div class="styBB" style="width:187mm;">
							<!-- Line 14 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">14</div>
								<div class="styLNDesc" style="width:137.9mm;">
				Gain or (loss) recognized on other property given up. Subtract line 13 from line 12. Report the
				gain or <span style="float:left;">(loss) in the same manner as if the exchange had been a sale </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
								</div>
								<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">14</div>
								<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/GainLossOnOtherPropGvnUpAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 14 Caution -->
							<div style="width:187mm;">
								<div class="styGenericDiv" style="width:145.9mm;padding-left:8mm;padding-bottom:0mm;height:7mm;">
									<b>Caution: </b>
									<i>If the property given up was used previously or partly as a home, see </i>
									<b>Property used
				as home </b>
									<i>in the instructions.</i>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:7mm;"/>
								<div class="styLNAmountBoxNBB" style="height:7mm;"/>
							</div>
							<!-- Line 15 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">15</div>
								<div class="styLNDesc" style="width:137.9mm;">
				Cash received, FMV of other property received, plus net liabilities assumed by other party, reduced
				(but <span style="float:left;">not below zero) by any exchange expenses you incurred. See instructions. </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
								</div>
								<div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;">15</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/CashFMVNetLiabRedByExpnssAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 16 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">16</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">FMV of like-kind property you received </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
								</div>
								<div class="styLNRightNumBox">16</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/FMVOfLikeKindPropertyRcvdAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 17 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">17</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">Add lines 15 and 16 </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
								</div>
								<div class="styLNRightNumBox">17</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/RealizedAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 18 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">18</div>
								<div class="styLNDesc" style="width:137.9mm;">
				Adjusted basis of like-kind property you gave up, net amounts paid to other party, plus any
				exchange <span style="float:left">expenses <span class="styBoldText">not</span> used on line 15. See instructions.</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
								</div>
								<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">18</div>
								<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/AdjBssOfLikeKindPropGvnUpAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 19 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">19</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">
										<span class="styBoldText">Realized gain or (loss).</span> Subtract line 18 from line 17 </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
								</div>
								<div class="styLNRightNumBox">19</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/RealizedGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 20 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">20</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">Enter the smaller of line 15 or line 19, but not less than zero </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
								</div>
								<div class="styLNRightNumBox">20</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/SmallerGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 21 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">21</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">Ordinary income under recapture rules. Enter here and on Form 4797, line 16. See instructions. </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
								</div>
								<div class="styLNRightNumBox">21</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/OrdinaryIncmUndRecaptureRlsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 22 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">22</div>
								<div class="styLNDesc" style="width:137.9mm;">
				Subtract line 21 from line 20. If zero or less, enter -0-. If more than zero, enter here and on Schedule D
				<span style="float:left;">or Form 4797, unless the installment method applies. See instructions. </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
								</div>
								<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">22</div>
								<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/SmllrGainLossLessOrdnryIncmAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 23 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">23</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">
										<span class="styBoldText">Recognized gain.</span> Add lines 21 and 22 </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
								</div>
								<div class="styLNRightNumBox">23</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/RecognizedGainAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 24 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">24</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">Deferred gain or (loss). Subtract line 23 from line 19. If a related party exchange, see instructions </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
								</div>
								<div class="styLNRightNumBox">24</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DeferredGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 25 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">25</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">
										<span class="styBoldText">Basis of like-kind property received.</span>
				Subtract line 15 from the sum of lines 18 and 23 </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
								</div>
								<div class="styLNRightNumBoxNBB">25</div>
								<div class="styLNAmountBoxNBB">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/BasisOfLikeKindPropertyRcvdAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- End of Part III -->
					</div>
					
					<!-- Begin Section IV -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<div class="styBB" style="width:187mm;clear:both;">
							<div class="styPartName" style="height:4mm;">Part IV</div>
							<div class="styPartDesc">
								<span style="width:8px;"/>
				Deferral of Gain From Section 1043 Conflict-of-Interest Sales    
			</div>
						</div>
						<!-- Section IV Note Line -->
						<div style="width:187mm;height:12mm;padding-top:1mm;clear:both;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:178mm;">
								<b>Note: </b>
								<i> This part is to be used <b> only </b> by officers or employees of the executive branch of the Federal Government or judicial
				  officers of the Federal Government (including certain spouses, minor or dependent children, and trustees as described in section 1043)
				  for reporting nonrecognition of gain under section 1043 on the sale of property to comply with the conflict-of-interest 
				  requirements. This part can be used <b> only </b> if the cost of the replacement property is more than the basis of the divested property. 
						</i>
							</div>
						</div>
						<!-- Line 26 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-top:3mm;">26</div>
							<div class="styLNDesc" style="width:118mm;padding-top:3mm;">
			  Enter the number from the upper right corner of your certificate of divestiture. (<span class="styBoldText">Do not</span>
								<span style="float:left;"> attach a copy of your certificate. Keep the certificate with your records.) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">.....<img src="{$ImagePath}/8824_Bullet_Line.gif" alt="bullet image"/>
								</div>
							</div>
							<br/>
							<xsl:choose>
								<xsl:when test="normalize-space($Form8824Data/DeferralOfGainCertOfDvsttrNum)!=''">
									<span class="styFixedUnderline" style="float:right;clear:none;width:58mm;padding-top:3mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainCertOfDvsttrNum"/>
										</xsl:call-template>
									</span>
								</xsl:when>
								<xsl:otherwise>
									<span style="width: 20mm"/> - 
								<span class="styFixedUnderline" style="float:right;clear:none;width:58mm;"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!-- Line 27 -->
						<div style="width:187mm;height:auto;padding-top:3mm;">
							<div class="styLNLeftNumBox">27</div>
							<div class="styGenericDiv" style="padding-top:.5mm;">
			  Description of divested property
			  <img src="{$ImagePath}/8824_Bullet_Line.gif" alt="bullet image"/>
								<span style="width:4px;"/>
							</div>
							<span class="styFixedUnderline" style="float:right;clear:none;width:133mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainDvstdProperty"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 28 -->
						<div style="width:187mm;height:auto;padding-top:3mm;">
							<div class="styLNLeftNumBox">28</div>
							<div class="styGenericDiv" style="padding-top:.5mm;">
			  Description of replacement property
			  <img src="{$ImagePath}/8824_Bullet_Line.gif" alt="bullet image"/>
								<span style="width:4px;"/>
							</div>
							<span class="styFixedUnderline" style="float:right;clear:none;width:129mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainDescOfRplcProp"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styBB" style="width:187mm;clear:both;padding-top:3mm;border-bottom-width:2px;">
							<!-- Line 29 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">29</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">Date divested property was sold (month, day, year) </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
								</div>
								<div class="styLNRightNumBox">29</div>
								<div class="styLNAmountBox" style="text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainDvstdPropSoldDt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 30 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="padding-top:3mm;height:7mm;">30</div>
								<div class="styLNDesc" style="width:97.9mm;padding-top:3mm;height:7mm;">
									<span style="float:left;">Sales price of divested property. See instructions. </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
								</div>
								<div class="styLNRightNumBox" style="padding-top:3mm;height:7mm;">30</div>
								<div class="styLNAmountBox" style="padding-top:3mm;height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainDvstdPropSaleAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;padding-top:3mm;"/>
								<div class="styLNAmountBoxNBB" style="height:7mm;border-bottom-width:0px;padding-top:3mm;"/>
							</div>
							<!-- Line 31 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="padding-top:3mm;height:7mm;">31</div>
								<div class="styLNDesc" style="width:97.9mm;padding-top:3mm;height:7mm;">
									<span style="float:left;">Basis of divested property  </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
								</div>
								<div class="styLNRightNumBox" style="padding-top:3mm;height:7mm;">31</div>
								<div class="styLNAmountBox" style="padding-top:3mm;height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainDvstdPropBssAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top:3mm;height:7mm;"/>
								<div class="styLNAmountBoxNBB" style="padding-top:3mm;height:7mm;"/>
							</div>
							<!-- Line 32 -->
							
							<div style="width:187mm;">
								<div class="styLNLeftNumBox"/>
								<div class="styLNDesc" style="width:137.9mm;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="padding-top:3mm;"/>
							</div>
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">32</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">
										<span class="styBoldText">Realized gain.</span> Subtract line 31 from line 30  </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
								</div>
								<div class="styLNRightNumBox">32</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainRealizedGainAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 33 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="padding-top:3mm;height:7mm;">33</div>
								<div class="styLNDesc" style="width:97.9mm;padding-top:3mm;height:7mm;">
				Cost of replacement property purchased within 60 days after date of sale
			    <!--Dotted Line
			    <div class="styDotLn" style="float:right;padding-right:1mm;"></div>-->
								</div>
								<div class="styLNRightNumBox" style="padding-top:3mm;height:7mm;">33</div>
								<div class="styLNAmountBox" style="padding-top:3mm;height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainRplcCostAftrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top:3mm;height:7mm;"/>
								<div class="styLNAmountBox" style="border-bottom-width:0px;padding-top:3mm;height:7mm;"/>
							</div>
							<!-- Line 34 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox"/>
								<div class="styLNDesc" style="width:137.9mm;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="padding-top:3mm;"/>
							</div>
							<div style="width:187mm;">
								<div class="styLNLeftNumBox">34</div>
								<div class="styLNDesc" style="width:137.9mm;">
									<span style="float:left;">Subtract line 33 from line 30. If zero or less, enter -0- </span>
									<!--Dotted Line -->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
								</div>
								<div class="styLNRightNumBox">34</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainRcgnzGainAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 35 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="padding-top:3mm;height:7mm;">35</div>
								<div class="styLNDesc" style="width:137.9mm;padding-top:3mm;height:7mm;">
									<span style="float:left;">Ordinary income under recapture rules. Enter here and on Form 4797, line 10. See instructions. </span>
									<!--Dotted Line -->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
								</div>
								<div class="styLNRightNumBox" style="padding-top:3mm;height:7mm;">35</div>
								<div class="styLNAmountBox" style="padding-top:3mm;height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/GainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 36 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;">36</div>
								<div class="styLNDesc" style="width:137.9mm;height:6mm;padding-top:2mm;">
				Subtract line 35 from line 34. If zero or less, enter -0-. If more than zero, enter here and on Schedule D 
				<span style="float:left;">or Form 4797. See instructions. </span>
									<!--Dotted Line -->
									<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
								</div>
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">36</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainRcgnzLessLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 37 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:7mm;padding-top:3mm;">37</div>
								<div class="styLNDesc" style="height:7mm;width:137.9mm;padding-top:3mm;">
									<span style="float:left;">
										<span class="styBoldText">Deferred gain.</span> Subtract the sum of lines 35 and 36 from line 32 </span>
									<!--Dotted Line -->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">37</div>
								<div class="styLNAmountBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 38 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:7mm;padding-top:3mm;">38</div>
								<div class="styLNDesc" style="width:137.9mm;height:7mm;padding-top:3mm;">
									<span style="float:left;">
										<span class="styBoldText">Basis of replacement property.</span>
				  Subtract line 37 from line 33 </span>
									<!--Dotted Line -->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:7mm;padding-top:3mm;">38</div>
								<div class="styLNAmountBox" style="height:7mm;padding-top:3mm;border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainBssOfRplcPropAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Footer -->
						<div style="width:187mm;padding-top:1mm;">
							<div style="float:left;"/>
							<div style="float:right;">
								<span style="width:80px;"/>  
			  Form <span class="styBoldText">8824</span> (2018 )
			</div>
						</div>
					</div>
					<!-- Introducing page end -->
					<p style="page-break-before: always"/>
					<!-- Begininning of write-in data -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<div class="styLeftOverTitleLine" id="LeftoverData">
							<div class="styLeftOverTitle">
				Additional Data        
			</div>
							<div class="styLeftOverButtonContainer">
								<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
							</div>
						</div>
						<xsl:variable name="MultiAssetExchStmtInd">
							<xsl:choose>
								<xsl:when test="$Form8824Data/@gainInMultiAssetExchStmtInd = '1'">
									Yes
								</xsl:when>
								<xsl:when test="$Form8824Data/@gainInMultiAssetExchStmtInd = '0'">
									No
								</xsl:when>
								<xsl:otherwise>
									<span style="width:1mm"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<table class="styLeftOverTbl">
							<xsl:call-template name="PopulateCommonLeftover">
								<xsl:with-param name="TargetNode" select="$Form8824Data"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="Populate8824LeftoverRow">
								<xsl:with-param name="Desc">Form 8824, Top Left Margin - Gain in Multiple Asset Exchange Statement</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$MultiAssetExchStmtInd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</table>
					</div>
				</form>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="Populate8824LeftoverRow">
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="DescWidth">100</xsl:param>
		<xsl:param name="AmountWidth" select="187 - $DescWidth"/>
		<xsl:if test="$TargetNode">
			<tr>
				<td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">
					<xsl:value-of select="$Desc"/>:</td>
				<td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
					<xsl:value-of select="$TargetNode"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template name="Populate8824FilerName">
		<xsl:param name="TargetNode"/>
		<xsl:choose>
			<!-- Business Name from Parent return header -->
			<xsl:when test="$Location='PAR'">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp/BusinessName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$ParRtnHdrData/ParentCorpGrp/BusinessName/BusinessNameLine2Txt">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp/BusinessName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<!-- Business Name from Subsidiary Return Header -->
			<xsl:when test="$Location='SUB'">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine2Txt">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<!-- Name from 1120/990/1065 Return Header -->
			<xsl:when test="$RtnHdrData/Filer/BusinessName">
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
				</xsl:call-template>
				<xsl:if test="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt">
					<br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<!-- Name from 1040 Return Header -->
			<xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
				<br/>
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<!-- Name from 1041 Return Header -->
			<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
				<br/>
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">NationalMortgageAssocCd</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
				</xsl:call-template>
				<xsl:if test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt">
					<br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="Populate8824FilerTIN">
		<xsl:param name="TargetNode"/>
		<!-- Pull Data from Return Header-->
		<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">EIN</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">SSN</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
</xsl:stylesheet>
