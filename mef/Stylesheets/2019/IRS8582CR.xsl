<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8582CRStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8582CRData" select="$RtnDoc/IRS8582CR"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">32mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6.5pt;
				<xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:3px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$TargetNode">
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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8582CRData)"/>
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
				<meta name="Description" content="IRS Form 8582CR"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<!--	<xsl:if test="not($Print) or $Print=''">-->
						<xsl:call-template name="IRS8582CRStyle"/>
						<xsl:call-template name="AddOnStyle"/>
			<!--		</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS8582CR" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:19mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber" style="font-size:15pt;">  8582-CR</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8582CRData"/>
							</xsl:call-template>
							<span class="styAgency">(Rev. December 2019)</span>
							<br/><br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:3mm;">
								Passive Activity Credit Limitations
							</div><br/><br/>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:0px;">
										<div style="width:90mm;height:5mm;padding-top:1mm;">
											<img src="{$ImagePath}/8582CR_Bullet_Sm.gif" alt="Small Bullet"/> 
											See separate instructions.<br/>
											<img src="{$ImagePath}/8582CR_Bullet_Sm.gif" alt="Small Bullet"/> 
											Attach to Form 1040, 1040-SR, or 1041.<br/>
												<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="Small Bullet"/>
											Go to <i>www.irs.gov/Form8582CR</i> for the latest information.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:19mm;border-left-width:2px;">
							<div class="styOMB" style="height:8mm;font-size:7pt;padding-top:2mm;">OMB No. 1545-1034</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;height:11mm;padding-top:4mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">89</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return<br/>
							
							             <xsl:choose>
                                                                                        <!-- Name from Form level -->
                                             <!--<xsl:when test="normalize-space($Form4797Data/BusinessName/BusinessNameLine1Txt) != ''">
                                                     <xsl:call-template name="PopulateText">
                                                     <xsl:with-param name="TargetNode" select="$Form4797Data/BusinessName/BusinessNameLine1Txt"/>
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
                                                                                     <!-- Name from 1041 Return Header-->
                                          <xsl:when test="$RtnHdrData/Filer/BusinessNameLine1Txt">
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
							
							
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Identifying number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
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
 
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;padding-bottom:3px;font-size:8.5pt;height:auto;">
							Passive Activity Credits<br/>
							<div style="height:auto;">							
								<span>Caution:</span>						
								<span class="styItalicText">
										<span style="font-weight:normal;">If you have credits from a publicly traded partnership, see</span> <b>Publicly Traded Partnerships (PTPs)</b>
										<span style="font-weight:normal;"> in the instructions.</span>
								</span>
							</div>
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- ///////////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;font-size:8.5pt;">
								<b>Credits From Rental Real Estate Activities With Active Participation (Other Than Rehabilitation</b><br/>
								<b>Credits and Low-Income Housing Credits)</b> (See <b>Lines 1a through 1c</b> in the instructions.)
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">9mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (1a) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">1a</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
								Credits from Worksheet 1, column (a)
								</div> 
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
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
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/RentalCreditGrp/CurrentYearCreditAmt"/>
										<xsl:with-param name="Number">1a</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styIRS8582CRLineItem" style="">
							<div class="styIRS8582CRLNDesc" style="height:5mm;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (1b) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">b</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:3mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:auto;">
									Prior year unallowed credits from Worksheet 1, column (b)
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/RentalCreditGrp/PriorUnallowedCreditAmt"/>
										<xsl:with-param name="Number">1b</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styIRS8582CRLineItem" style="height:1mm !important;">
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">100% !important</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (1c) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">c</div>
							<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Add lines 1a and 1b
								</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
								<xsl:with-param name="TargetNode" select="$Form8582CRData/RentalCreditGrp/TotalCreditAmt"/>
								<xsl:with-param name="Number">1c</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- ///////////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;font-size:8.5pt;">
								<b>Rehabilitation Credits From Rental Real Estate Activities and Low-Income Housing Credits for</b><br/>
								<b>Property Placed in Service Before 1990 (or From Pass-Through Interests Acquired Before 1990)</b><br/>
								(See <b>Lines 2a through 2c</b> in the instructions.)
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">11mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (2a) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">2a</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Credits from Worksheet 2, column (a)
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
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
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/RehabilitationCreditGrp/CurrentYearCreditAmt"/>
										<xsl:with-param name="Number">2a</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styIRS8582CRLineItem">
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:3mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:3mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (2b) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">b</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Prior year unallowed credits from Worksheet 2, column (b)
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/RehabilitationCreditGrp/PriorUnallowedCreditAmt"/>
										<xsl:with-param name="Number">2b</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						
						<!-- (2c) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">c</div>
							<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Add lines 2a and 2b
								</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
								<xsl:with-param name="TargetNode" select="$Form8582CRData/RehabilitationCreditGrp/TotalCreditAmt"/>
								<xsl:with-param name="Number">2c</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- ///////////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;font-size:8.5pt;">
								<b>Low-Income Housing Credits for Property Placed in Service After 1989</b> (See <b>Lines 3a through 3c</b><br/>
								in the instructions.)
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">7.5mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (3a) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">3a</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Credits from Worksheet 3, column (a)
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
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
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/LowIncomeCreditGrp/CurrentYearCreditAmt"/>
										<xsl:with-param name="Number">3a</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (3b) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"  style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">b</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Prior year unallowed credits from Worksheet 3, column (b)
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/LowIncomeCreditGrp/PriorUnallowedCreditAmt"/>
										<xsl:with-param name="Number">3b</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (3c) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"  style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">c</div>
							<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Add lines 3a and 3b
								</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
								<xsl:with-param name="TargetNode" select="$Form8582CRData/LowIncomeCreditGrp/TotalCreditAmt"/>
								<xsl:with-param name="Number">3c</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- ///////////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNDesc" style="width:144mm;padding:0px 0px 0px 0px;font-size:8.5pt;">
								<b>All Other Passive Activity Credits</b> (See <b>Lines 4a through 4c</b> in the instructions.)
							</div>
							<xsl:call-template name="CreateBox">
							<xsl:with-param name="Height">4.2mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (4a) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"  style="height:auto;" >
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">4a</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Credits from Worksheet 4, column (a)
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
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
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/AllPassiveCreditGrp/OtherCurrentYearAmt"/>
										<xsl:with-param name="Number">4a</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (4b) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"  style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">b</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Prior year unallowed credits from Worksheet 4, column (b)
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/AllPassiveCreditGrp/OtherPriorUnallowedAmt"/>
										<xsl:with-param name="Number">4b</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (4c) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"   style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">c</div>
							<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Add lines 4a and 4b
								</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
								<xsl:with-param name="TargetNode" select="$Form8582CRData/AllPassiveCreditGrp/TotalOtherCreditsAmt"/>
								<xsl:with-param name="Number">4c</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">5</div>
							<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Add lines 1c, 2c, 3c, and 4c
								</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582CRData/TotalCreditAmt"/>
								<xsl:with-param name="Number">5</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"    style="height:5mm;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">6</div>
							<div class="styIRS8582CRLNDesc" style="width:141mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Enter the tax attributable to net passive income (see instructions)
								</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:auto;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
								<xsl:with-param name="TargetNode" select="$Form8582CRData/NetPassiveIncomeTaxAmt"/>
								<xsl:with-param name="Number">6</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"  style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">7</div>
							<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Subtract line 6 from line 5. If line 6 is more than or equal to line 5, enter -0- and see instructions
								</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582CRData/TotalCreditMinusTaxAmt"/>
								<xsl:with-param name="Number">7</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNDesc" style="width:auto;height:auto;padding:0px 0px 0px 0px;">
								<span style="float:left;"><b>Note:</b></span>
								<span style="float:right;">					
									<span class="styItalicText"> If your filing status is married filing separately and you lived with your spouse at any time during<br/>
									the year, <b>do not</b> complete Part II, III, or IV. Instead, go to line 37.</span>
								</span>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">8mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;height:auto;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;padding-bottom:3px;font-size:8.5pt;height:auto;">
							Special Allowance for Rental Real Estate Activities With Active Participation<br/>
							Note:
							<span class="styNormalText" style="height:auto;">
								<span class="styItalicText">
									Complete this part only if you have an amount on line 1c. Otherwise, go to Part IIl.
								</span>
							</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;">
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">8</div>
							<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Enter the smaller of line 1c or line 7
								</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/SmallerAmt"/>
								<xsl:with-param name="Number">8</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">9</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Enter $150,000. If married filing separately, see instructions
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/TotalArcherMSADistributionAmt"/>
										<xsl:with-param name="Number">9</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">10</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Enter modified adjusted gross income, but not less than zero (see<br/>
									instructions). If line 10 is equal to or more than line 9, skip lines 11<br/>
									through 15 and enter -0- on line 16
									 <!--Dotted Line-->
									<span class="styBoldText">.
										<span style="width:14px"/>.
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
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:7.5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:7.5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/ModifiedAGIAmt"/>
										<xsl:with-param name="Number">10</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">11</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Subtract line 10 from line 9
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
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
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/NetAGIAmt"/>
										<xsl:with-param name="Number">11</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem" style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">12</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Multiply line 11 by 50% (.50). <b>Do not</b> enter more than $25,000. If<br/>
									married filing separately, see instructions
									 <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:22px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/PercentNetAGIAmt"/>
										<xsl:with-param name="Number">12</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (13a) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"  style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">13a</div>
							<div class="styIRS8582CRLNDesc" style="width:60mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Enter the amount, if any, from line 10<br/>
									of Form 8582
									 <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:21px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8582CRLNDesc" style="height:100%;width:120mm;float:right;padding:0px 0px 0px 0px;">
								<div style="width:100%;height:auto;padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;float:right;">
									<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:100%;height:auto;padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;float:right;">
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/AllowedRentalRealtyLossAmt"/>
											<xsl:with-param name="Number">13a</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- (13b) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"  style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">b</div>
							<div class="styIRS8582CRLNDesc" style="width:60mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Enter the amount, if any, from line 14<br/>
									of Form 8582
									 <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:21px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8582CRLNDesc" style="height:100%;width:120mm;float:right;padding:0px 0px 0px 0px;">
								<div style="width:100%;height:auto;padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;float:right;">
									<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:100%;height:auto;padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;float:right;">
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/FinalRevitalizationAmt"/>
											<xsl:with-param name="Number">13b</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- (13c) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"  style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">c</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Add lines 13a and 13b.
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
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
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/NetLossLimitAmt"/>
										<xsl:with-param name="Number">13c</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styIRS8582CRLineItem"  style="height:auto;">
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:3mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:3mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"   style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">14</div>
							<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Subtract line 13c from line 12
								</div>
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
									<!--Dotted Line-->
									<span class="styBoldText">.
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
							<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/TaxableAmt"/>
										<xsl:with-param name="Number">14</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"   style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">15</div>
							<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Enter the tax attributable to the amount on line 14 (see instructions)
								</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/AttributableTaxAmt"/>
								<xsl:with-param name="Number">15</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8582CRLineItem">
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="Height">100%</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS8582CRLineItem"   style="height:auto;">
							<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">16</div>
							<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
									Enter the <b>smaller</b> of line 8 or line 15
								</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowActiveGrp/SmallestTaxAmt"/>
								<xsl:with-param name="Number">16</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see instructions.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8582-CR</span> (Rev. 12-2019)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 64641R
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<div>	
						<!-- BEGIN Page Header -->
						<div class="styTBB" style="width:187mm;padding-top:.5mm;">
							<div style="float:left;">
								Form 8582-CR (Rev. 12-2019)<span style="width:138mm;"/>
							</div>
							<div style="float:right;">
								Page <span style="font-weight:bold;font-size:8pt;">2</span>
							</div>
						</div>
						<!-- END Page Header -->
						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
						<!-- Begin Part III																								 -->
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
						<!-- Header -->							
						<div style="width:187mm;height:auto;" class="styBB">
							<!-- Content -->
							<div class="styPartName" style="width:15mm;">Part III</div>
							<div class="styPartDesc" style="padding-left:3mm;padding-bottom:3px;font-size:8.5pt;height:auto;">
								Special Allowance for Rehabilitation Credits From Rental Real Estate Activities and Low-Income Housing<br/>
								Credits for Property Placed in Service Before 1990 (or From Pass-Through Interests Acquired Before 1990)<br/>
								Note:<span style="width:3px;"/>
								<span class="styNormalText">
									<span class="styItalicText">
										Complete this part only if you have an amount on line 2c. Otherwise, go to Part IV.
									</span>
								</span>
							</div>
						</div>
						<!-- Body -->
						<div class="styBB" style="width:187mm;">
							<div class="styIRS8582CRLineItem">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="Height">4mm</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (17) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">17</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the amount from line 7
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
										</span>
									</div>
								</div>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/TotalCreditMinusTaxAmt"/>
									<xsl:with-param name="Number">17</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (18) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">18</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the amount from line 16
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
										</span>
									</div>
								</div>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/SmallestTaxAmt"/>
									<xsl:with-param name="Number">18</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (19) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">19</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Subtract line 18 from line 17. If zero, enter -0- here and on lines 30 and 36, and then go to<br/>
										Part V
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:7px"/>.
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
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="Height">4mm</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/NetTaxAmt"/>
									<xsl:with-param name="Number">19</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (20) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">20</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the <b>smaller</b> of line 2c or line 19
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.4mm 0px 0px;">
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
										</span>
									</div>
								</div>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/CreditOrNetTaxAmt"/>
									<xsl:with-param name="Number">20</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (21) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">21</div>
								<div class="styIRS8582CRLNDesc" style="width:100mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter $250,000. If married filing separately, see instructions to find out if you can skip lines 21 through 26
										 <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:19px"/>.
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
								<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/TotalArcherMSADistributionAmt"/>
											<xsl:with-param name="Number">21</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (22) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">22</div>
								<div class="styIRS8582CRLNDesc" style="width:100mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter modified adjusted gross income, but not less than zero. (See<br/>
										instructions for line 10.) If line 22 is equal to or more<br/>
										than line 21, skip lines 23 through 29 and enter -0- on line 30
										 <!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="height:7.5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:7.5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/ModifiedAGIAmt"/>
											<xsl:with-param name="Number">22</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (23) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">23</div>
								<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Subtract line 22 from line 21
									</div>
									<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:12px"/>.
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
								<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/NetAGIAmt"/>
											<xsl:with-param name="Number">23</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (24) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">24</div>
								<div class="styIRS8582CRLNDesc" style="width:100mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Multiply line 23 by 50% (.50). Do not enter more than $25,000. If<br/>
										married filing separately, see instructions
										 <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:23px"/>.
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
								<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/PercentNetAGIAmt"/>
											<xsl:with-param name="Number">24</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (25a) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">25a</div>
								<div class="styIRS8582CRLNDesc" style="width:60mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the amount, if any, from line 10<br/>
										of Form 8582
										 <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:21px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:100%;width:120mm;float:right;padding:0px 0px 0px 0px;">
									<div style="width:100%;height:auto;padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;float:right;">
										<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Height">100%</xsl:with-param>
												<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
												<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Height">100%</xsl:with-param>
												<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
												<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Height">100%</xsl:with-param>
												<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
												<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
									<div style="width:100%;height:auto;padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;float:right;">
										<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Height">100%</xsl:with-param>
												<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
												<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Height">100%</xsl:with-param>
												<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
												<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/AllowedRentalRealtyLossAmt"/>
												<xsl:with-param name="Number">25a</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
							<!-- (25b) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">b</div>
								<div class="styIRS8582CRLNDesc" style="width:60mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the amount, if any, from line 14<br/>
										of Form 8582
										 <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:21px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:100%;width:120mm;float:right;padding:0px 0px 0px 0px;">
									<div style="width:100%;height:auto;padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;float:right;">
										<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Height">100%</xsl:with-param>
												<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
												<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Height">100%</xsl:with-param>
												<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
												<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styIRS8582CRLNDesc" style="height:4mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Height">100%</xsl:with-param>
												<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
												<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
									<div style="width:100%;height:auto;padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;float:right;">
										<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Height">100%</xsl:with-param>
												<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
												<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="Height">100%</xsl:with-param>
												<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
												<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
											<xsl:call-template name="CreateBox">
												<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/FinalRevitalizationAmt"/>
												<xsl:with-param name="Number">25b</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
							<!-- (25c) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:2px;text-align:right;">c</div>
								<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Add lines 25a and 25b
									</div>
									<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/SumOfSpecialAllwncREActyAmt"/>
											<xsl:with-param name="Number">25c</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (26) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">26</div>
								<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Subtract line 25c from line 24
									</div>
									<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/TaxableAmt"/>
											<xsl:with-param name="Number">26</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (27) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">27</div>
								<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the tax attributable to the amount on line 26 (see instructions)
									</div>
									<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/AttributableTaxAmt"/>
											<xsl:with-param name="Number">27</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (28) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">28</div>
								<div class="styIRS8582CRLNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the amount, if any, from line 18
									</div>
									<div class="styIRS8582LNDesc" style="width:auto;height:100%;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								<div class="styIRS8582CRLNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">100%</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styIRS8582CRLNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/RepeatedTaxAmt"/>
											<xsl:with-param name="Number">28</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (29) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">29</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Subtract line 28 from line 27
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 6mm 0px 0px;">
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
										</span>
									</div>
								</div>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/AdjustedTaxAmt"/>
									<xsl:with-param name="Number">29</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS8582CRLineItem">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="Height">4mm</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (30) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">30</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the <b>smaller</b> of line 20 or line 29
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
										</span>
									</div>
								</div>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowRehabGrp/SmallestRehabTaxAmt"/>
									<xsl:with-param name="Number">30</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
						<!-- Begin Part IV																								 -->
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
						<!-- Header -->
						<div style="width:187mm;" class="styBB">
							<!-- Content -->
							<div class="styPartName" style="width:15mm;">Part IV</div>
							<div class="styPartDesc" style="padding-left:3mm;padding-bottom:3px;font-size:8.5pt;height:auto;">
								Special Allowance for Low-Income Housing Credits for Property Placed in Service After 1989<br/>
								Note:<span style="width:3px;"/>
								<span class="styNormalText">
									<span class="styItalicText">
										Complete this part only if you have an amount on line 3c. Otherwise, go to Part V.
									</span>
								</span>
							</div>
						</div>
						<!-- Body -->
						<div class="styBB" style="width:187mm;">
							<div class="styIRS8582CRLineItem">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="Height">4mm</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (31) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"    style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">31</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										If you completed Part III, enter the amount from line 19. Otherwise, subtract line 16 from line 7
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowLowIncomeGrp/NetTaxAmt"/>
									<xsl:with-param name="Number">31</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (32) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem" style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">32</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the amount from line 30
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
										</span>
									</div>
								</div>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowLowIncomeGrp/SmallestTaxAmt"/>
									<xsl:with-param name="Number">32</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (33) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"  style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">33</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Subtract line 32 from line 31. If zero, enter -0- here and on line 36
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
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
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowLowIncomeGrp/AdjustedTaxAmt"/>
									<xsl:with-param name="Number">33</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (34) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"  style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">34</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the <b>smaller</b> of line 3c or line 33
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowLowIncomeGrp/CreditOrNetTaxAmt"/>
									<xsl:with-param name="Number">34</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (35) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"  style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">35</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Tax attributable to the remaining special allowance (see instructions)
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowLowIncomeGrp/AttributableTaxAmt"/>
									<xsl:with-param name="Number">35</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- (36) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"  style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">36</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										Enter the <b>smaller</b> of line 34 or line 35
									</div>
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.6mm 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
									<xsl:with-param name="TargetNode" select="$Form8582CRData/SpecialAllowLowIncomeGrp/TaxAmt"/>
									<xsl:with-param name="Number">36</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
						<!-- Begin Part V																								 -->
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
						<!-- Header -->
						<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
							<!-- Content -->
							<div style="padding:1.5mm 0px 1.5mm 0px; border-width:0px 0px 0px 0px;width:100%;height:auto;">
								<div class="styPartName" style="width:15mm;">Part V</div>
								<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
									Passive Activity Credit Allowed
								</div>
							</div>
						</div>
						<!-- Body -->
						<div class="styBB" style="width:187mm;">
							<!-- (37) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem" style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">37</div>
								<div class="styIRS8582CRLNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										<b>Passive Activity Credit Allowed.</b> Add lines 6, 16, 30, and 36. See instructions to find out how to<br/>
										report the allowed credit on your tax return and how to allocate allowed and unallowed credits if<br/>
										you have more than one credit or credits from more than one activity. If you have any credits<br/>
										from a publicly traded partnership, see <b>Publicly Traded Partnerships (PTPs)</b> in the instructions
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:5px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">11.5mm</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="TargetNode" select="$Form8582CRData/AllowedCreditsAmt"/>
									<xsl:with-param name="Number">37</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
						<!-- Begin Part VI																								 -->
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
						<!-- Header -->
						<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
							<!-- Content -->
							<div style="padding:1.5mm 0px 1.5mm 0px; border-width:0px 0px 0px 0px;width:100%;height:auto;">
								<div class="styPartName" style="width:15mm;">Part VI</div>
								<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
									Election To Increase Basis of Credit Property
								</div>
							</div>
						</div>
						<!-- Body -->
						<div class="styBB" style="width:187mm;">
							<!-- (38) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem" style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">38</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;">
										If you disposed of your entire interest in a passive activity or former passive activity in a fully taxable transaction, and you<br/>
										elect to increase your basis in credit property used in that activity by the unallowed credit that reduced your basis in the<br/>
										property, check this box. See instructions
										<!--Dotted Line-->
										<span class="styBoldText">.
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
										<img src="{$ImagePath}/8582CR_Bullet_Sm.gif" alt="Small Bullet"/> 
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8582CRData/ElectToIncreaseBasisInd"/>
												<xsl:with-param name="BackupName">Form8582CRDataElectToIncreaseBasisInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<span>
											<xsl:call-template name="PopulateSpan">
												 <xsl:with-param name="TargetNode" select="$Form8582CRData/ElectToIncreaseBasisInd"/>
											  </xsl:call-template>
											  <input type="checkbox" class="styCkbox" alt="Checkbox" name="Checkbox" style="width:4mm"> 
												 <xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8582CRData/ElectToIncreaseBasisInd"/>
												 </xsl:call-template>
											  </input> 
										</span>
									</div>
								</div>
							</div>
							<!-- (39) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"  style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">39</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:57mm;height:100%;">
										Name of passive activity disposed of
										<span style="width:4px;"/>
										<img src="{$ImagePath}/8582CR_Bullet_Sm.gif" alt="Small Bullet"/> 
									</div>
									<div class="styGenericDiv" style="width:123mm;height:100%;border-bottom: 1px dashed black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/DisposedPassiveActivityNm"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- (40) ////////////////////////////////////////////////////-->
							<div class="styIRS8582CRLineItem"  style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">40</div>
								<div class="styIRS8582CRLNDesc" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:100mm;height:50%;">
										Description of the credit property for which the election is being made
										<span style="width:4px;"/>
										<img src="{$ImagePath}/8582CR_Bullet_Sm.gif" alt="Small Bullet"/> 
									</div>
									<div  style="width:81mm;border-bottom:1px dashed black;">
									<!--	<div class="styIRS8582CRLNDesc" style="width:100%;height:100%;border-bottom:1px dashed black;">-->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8582CRData/PropertyDesc"/>
											</xsl:call-template>
									<!--	</div>-->
									</div>
								</div>
							</div>
							<!-- (41) ////////////////////////////////////////////////////-->						
							<div class="styIRS8582CRLineItem"  style="height:auto;">
								<div class="styIRS8582CRLNLeftNumBox" style="padding-right:7px;">41</div>
								<div class="styIRS8582CRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8582CRLNDesc" style="width:125mm;height:100%;">
										Amount of unallowed credit that reduced your basis in the property
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:8px"/>
										</span>
										<img src="{$ImagePath}/8582CR_Bullet_Sm.gif" alt="Small Bullet"/> 
									</div>
									<div class="styIRS8582CRLNDesc" style="width:55mm;height:100%;border-style:">
										$<span style="width:4px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8582CRData/UnallowedCreditReductionAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
						<!-- Page Break and Footer-->
						<div class="pageEnd" style="width:187mm;padding-top:1mm;">
							<div style="float:right;">
								<span style="width:50px;"/>  
									Form 
								<span class="styBoldText" style="font-size:8pt;">8582-CR</span> (Rev. 12-2019)
							</div>
						</div>
					</div>
					<p  class="pageEnd" />
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
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
							<xsl:with-param name="TargetNode" select="$Form8582CRData"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>