<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS3468Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!--  Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form3468Data" select="$RtnDoc/IRS3468"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form3468Data)"/>
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
				<meta name="Description" content="IRS Form 3468"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS3468Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form3468">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width:187mm;height:19mm;">
						<div class="styFNBox" style="width:34mm;">
							<div style="height:13.5mm;">
            Form <span class="styFormNumber">3468</span>
								<div style="height:0mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="height:9mm;font-family:arial;font-size:7pt; padding-top:2mm;">
								<div class="styAgency">Department of the Treasury</div>
								<span class="styAgency">Internal Revenue Service</span>
								<span class="styAgency" style="padding-left:3mm;">(99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:122mm;height:20mm;padding-top:1mm;">
							<div class="styMainTitle" style="height:5mm;">Investment Credit</div>
							<div class="styFBT" style="padding-top:0mm;">
								<img src="{$ImagePath}/3468_Bullet.gif" alt="bullet image"/> See separate instructions.
							</div>
							<div class="styFBT" style="padding-top:0mm;">
								<img src="{$ImagePath}/3468_Bullet.gif" alt="bullet image"/> Attach to your tax return. 
							</div>
							<div class="styFBT" style="padding-top:0mm;">
								<img src="{$ImagePath}/3468_Bullet.gif" alt="bullet image"/> Information on Form 3468 and its instructions is available at www.irs.gov/form3468. 
							</div>							
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;line-height:110%;padding-top:0mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0155</div>
							<div style="text-align:left;padding-left:3mm;">
								<div class="styTY" style="height:9.5mm;">20<span class="styTYColor">13</span>
								</div>
								<div style="padding-top:0mm;">	
                                   Attachment
                                   Sequence No.<span class="styBoldText">174</span>
								</div>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:146mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name(s) shown on return<br/>
							<span>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styEINBox" style="width:30mm;height:4mm;font-size:7pt;font-weight:bold;padding-left:2mm;">
          Identifying number<br/>
							<br/>
							<span style="width:25mm;text-align:left;font-size:7pt;font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Start of Part one -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:13mm;">Part I</div>
						<span class="styPartDesc" style="font-weight:bold;font-size:7.5pt;">
					      Information Regarding the Election To Treat the Lessee as the Purchaser of Investment Credit Property
					      </span>
					</div>
					<div style="width:187mm;">
					      If you are claiming the investment credit as a lessee based on a section 48(d) (as in effect on November 4, 
					      1990) election, provide the following information. If you acquired more than one property as a lessee, 
					      attach a statement showing the information below.
					 </div>
					<div class="styBB" style="width:187mm;">
						<!-- Line 1 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">1</div>
							<div class="styLNDesc" style="width:25mm;height:4mm;">
                                        Name of lessor
                                      <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form3468Data/LessorNm"/>
								</xsl:call-template>
							</div>
							<span class="styUnderlineAmount" style="float:left; width:154mm;border-bottom-width:1px;           text-align:left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/LessorNm"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">2</div>
							<div class="styLNDesc" style="width:25mm;height:4mm;">
                                        Address of lessor
							</div>
							<span class="styUnderlineAmount" style="float:left; width:154mm;border-bottom-width:1px;            text-align:left;">
								<!-- <xsl:call-template name="PopulateMonthDayYear">  -->
								<xsl:choose>
									<xsl:when test="$Form3468Data/LessorUSAddress/AddressLine1">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorUSAddress/AddressLine1"/>
										</xsl:call-template>
										<span style="width:2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorUSAddress/AddressLine2"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorUSAddress/City"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorUSAddress/State"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorUSAddress/ZIPCode"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorForeignAddress/AddressLine1"/>
										</xsl:call-template>
										<span style="width:2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorForeignAddress/AddressLine2"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorForeignAddress/City"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorForeignAddress/ProvinceOrState"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorForeignAddress/Country"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form3468Data/LessorForeignAddress/PostalCode"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">3</div>
							<div class="styLNDesc" style="width:31mm;height:4mm;">
                                        Description of property
							</div>
							<span class="styUnderlineAmount" style="float:left; width:148mm;border-bottom-width:1px;                text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/PropertyDesc"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">4</div>
							<div class="styLNDesc" style="width:137mm;height:4mm;">
                                        Amount for which you were treated as having acquired the property
                                                           <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px;"/>.
                                                   <span style="width:16px;"/>.
									      <span style="width:16px;"/>.
                                                   <span style="width:16px;"/>.
									      <span style="width:16px;"/>.
                                                   <span style="width:16px;"/>.
									      <span style="width:16px;"/>.
            </span>
								<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
							</div>
							<span class="styUnderlineAmount" style="width:2mm;border-bottom-width:0px;">$</span>
							<span style="float:left; width:32mm;padding-top:.5mm;padding-left:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/TreatedAsAcquiredPropertyAmt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Start of Part II -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;">Part II</div>
						<div class="styPartDesc" style="font-weight:bold;font-size:7.5pt;">
					      Qualifying Advanced Coal Project Credit, Qualifying Gasification Project Credit, and Qualifying Advanced Energy Project Credit 
					      </div>
					</div>
					<!-- Start of Line 5 -->
					<div style="width:187mm; height:2.5mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">5</div>
						<div class="styLNDesc" style="padding-top:2mm;">
                                            Qualifying advanced coal project credit (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!-- Line 5a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:95mm;font-size:7pt;">
                                          Qualified investment in integrated gasification combined cycle
						property placed in service during the tax year for projects described in
                                <span style="float:left;">section 48A(d)(3)(B)(i)</span>
									<span style="float:right;">
										<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:33mm;height:3.5mm;padding-top:0px;padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/InvstIntgrtGasCombCycPropAmt"/>
											</xsl:call-template>
										</span>
										<span style="width:25mm;padding-top:0mm;">x 20% (.20)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">5a</div>
								<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcGasCombCycPropInvstCrAmt"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:11mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 5a -->
					<!-- Line 5b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:98mm;">
                                           Qualified investment in advanced coal-based generation technology
                                            property placed in service during the tax year for projects 
                                <span style="float:left;">described in section 48A(d)(3)(B)(ii)</span>
									<span style="float:left">
										<span style="width:2mm;border-bottom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/AdvancedCoalBaseTechnologyAmt"/>
											</xsl:call-template>
										</span>
										<span style="width:16mm;padding-top:0mm;font-size:6.3pt;">x 15% (.15)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">5b</div>
								<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcAdvancedCoalBaseTechAmt"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:11mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 5b -->
					<!-- Line 5c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:98mm;">
                                                      Qualified investment in advanced coal-based generation technology
                                                     property placed in service during the tax year for projects                  
              <span style="float:left;">described in section 48A(d)(3)(B)(iii)</span>
									<span style="float:left;">
										<span style="width:2mm;border-bottom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyAdvCoalBasedTechAmt"/>
											</xsl:call-template>
										</span>
										<span style="width:16mm;padding-top:0mm;font-size:6.3pt;">x 30% (.30)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">5c</div>
								<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcAdvCoalBasedTechAmt"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:11mm"/>
								</div>
							</div>
						</div>
					</div>
					<!--  End of line 5c -->
					<!-- Line 5d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
				                          Total. Add lines 5a, 5b, and 5c
                                       <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 						   		  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox">5d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotalQlfyAdvncCoalProjCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 5d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">6</div>
						<div class="styLNDesc" style="padding-top:1mm;width:138mm;">
                                            Qualifying gasification project credit (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 5.5mm"/>
					</div>
					<!-- Line 6a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:95mm;font-size:7pt;">
                                          Qualified investment in qualified gasification property placed
                                           in service during the tax year for which credits were allocated or
                                           reallocated after October 3, 2008, and that include equipment that
                                          separates and sequesters at least 75% of the project’s carbon dioxide
                               <span style="float:left;"> emissions
  <!--                               <span style="width:2mm"/>  -->
									</span>
									<span style="float:left;">
										<span class="styBoldText">
											<span style="width:16px;"/>.
       			                            <span style="width:16px;"/>.
    										<span style="width:16px;"/>.
          			                        <span style="width:16px;"/>.
          			                        <span style="width:16px;"/>.
    									</span>
										<span style="width:2mm;">$</span>
										<span class="styUnderlineAmount" style="float:none;width:30mm;height:3.5mm;padding-top:0px;padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyGasificationPropBssAmt"/>
											</xsl:call-template>
										</span>
										<span style="width:19mm;padding-top:0mm;padding-left:1mm;">x 30% (.30)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40mm;padding-top:13mm;">
								<div class="styLNRightNumBox" style="height:3mm;padding-top:1.5mm;">6a</div>
								<div class="styLNAmountBox" style="height:3mm;padding-top:1.5mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyGasificationPropBssAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:18.5mm"/>
						<!--<div class="styLNAmountBoxNBB" style="height: 2mm;background-color:yellow;width:2mm;float:left;"/>    -->
					</div>
					<!-- End of 6a -->
					<!-- Line 6b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:94mm;font-size:7pt;">
                                          Qualified investment in property other than in <b>a</b> above placed
                                  <span style="float:left;">in service during the tax year</span>
									<span style="float:left;">
										<span style="width:2mm;float:left;padding-left:2mm;">$</span>
										<span class="styUnderlineAmount" style="width:30mm;padding-top:0px;                                            padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/OtherQlfyInvstPropertyBasisAmt"/>
											</xsl:call-template>
										</span>
										<span style="width:17mm;padding-top:0mm;">x 20% (.20)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">6b</div>
								<div class="styLNAmountBox" style="width:32mm;height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcOtherQlfyInvstPropCrAmt"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:8mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of line 6b -->
					<!-- Line 6c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:138mm;">
				                          Total. Add lines 6a and 6b
                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                              
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">6c</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotalQlfyGasificationProjCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 6c -->
					<!--Line 7 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;">7</div>
								<div class="styLNDesc" style="width:138mm;font-size:7pt;">
			        	         Qualifying advanced energy project credit (see instructions):
	                           <span style="float:left;">Qualified investment in advanced energy project property placed  in
                                  <span style="float:left;">service during the tax year</span>
										      <span style="float:left;">
							<span class="styBoldText">
							<span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
 					             <span style="width:16px;"/>.
 						      <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
 						      <span style="width:16px;"/>.
   	 	     							</span>
									</span>
										<span style="float:left;">
											<span style="width:2mm;border-bottom-width:0px;float:left;padding-left:2mm;">$</span>
											<span class="styUnderlineAmount" style="width:30mm;padding-top:0px;padding-bottom:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form3468Data/BssQlfyInvstAdvncEnergyAmt"/>
												</xsl:call-template>
											</span>
											<span style="width:19mm;padding-top:0mm;padding-left:1mm;">x 30% (.30)</span>
										</span>
<!--										<span style="float:left;">
											<span class="styBoldText">
												<span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
 					             <span style="width:16px;"/>.
 						      <span style="width:16px;"/>.
                                               <span style="width:16px;"/>.
 					             <span style="width:16px;"/>.
 						      <span style="width:16px;"/>.
							</span>
										</span> -->
									</span>
								</div>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">7</div>
						<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBssQlfyInvstAdvncEnergyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 7 -->
					<!--Line 8 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;">8</div>
								<div class="styLNDesc" style="width:138mm;font-size:7pt;">
								Reserved for future use
<!--                                          Qualifying therapeutic discovery project credit (see instructions):
                                  <span style="float:left;">Qualified investment in a qualifying therapeutic discovery project</span>
									<span style="float:left;">
										<span style="width:2mm;float:left;padding-left:2mm;">$</span>
										<span class="styUnderlineAmount" style="width:28mm;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/TotalQlfyInvestmentCrAmt"/>
											</xsl:call-template>
										</span>
										<span style="width:19mm;padding-top:0mm;padding-left:1mm;">x 50% (.50)</span>
									</span>  -->
								</div>
							</div>
						</div>
<!--						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CalcTotalQlfyInvestmentCrAmt"/>
							</xsl:call-template>
						</div>
					</div>  -->
					<div class="styLNRightNumBox" style="height:4mm;">8</div>
				<div class="styLNAmountBox" style="height:4mm;background-color:lightgrey;"/>
				</div>	
					<!-- End of 8 -->
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm;">9</div>
						<div class="styLNDesc" style="width:138mm;">
				                          Enter the applicable unused investment credit from cooperatives (see instructions)
                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                               <span style="width:16px;"/>.
 						  	<span style="width:16px;"/>.
 						  	<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">9</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/UnusedCreditFromCoopAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 9 -->
					<!-- Line 10 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
				                          Add lines 5d, 6c, 7, and 9.  Report this amount on Form 3800, line 1a
				                           <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>. 
                                <span style="width:16px;"/>.
                                <span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.						
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;border-bottom-width:0px;">10</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotAdvncCoalGasAndEnergyCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 10 -->
					<!-- Part III  -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;">Part III</div>
						<div class="styPartDesc" style="font-weight:bold;font-size:7.5pt;">
					      Rehabilitation Credit and Energy Credit</div>
					</div>
					<!-- Line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:139mm;padding-top:2mm;">
                                            Rehabilitation credit (see instructions for requirements that must be met):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!-- End of line 11 -->
					<!-- Line 11a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:139mm;">
                                            Check this box if you are electing under section 47(d)(5) to take your qualified rehabilitation
                                            expenditures into account for the tax year in which paid (or, for self-rehabilitated property,
                                            when capitalized). See instructions. <b>Note.</b> This election applies to the current tax year 
                                            and to all later tax years. You may not revoke this election without IRS consent
        							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                         	<span style="width:16px;"/>.
	     							<span style="width:4px;"/>
								<img src="{$ImagePath}/3468_Bullet.gif" style="float" alt="right arrow"/>
								<span style="width:2mm;"/>
								<input type="checkbox" alt="alt" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form3468Data/RehabilitationExpendElectInd"/>
										<xsl:with-param name="BackupName">
										IRS3468RehabilitationExpendituresUsed</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:15mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 15mm"/>
					</div>
					<!-- End of line 11a -->
					<!-- Line 11b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;padding-top:0mm;">b</div>
						<div style="float:left;clear:none;">
							<div style="width:139mm;">
								<div class="styLNDesc" style="width:95mm;font-size:7pt;padding-top:0mm;">
                                          Enter the date on which the 24- or 60-month measuring period begins
                   <!--               <span style="float:left;"></span>
									<span style="float:left;">
										<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:32mm;height:3.5mm;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form3468Data/QualifiedFuelCellPropertyBasis"/>
											</xsl:call-template>
										</span>
										<span style="width:17mm;padding-top:0mm;">x 20% (.20)</span>
									</span>    -->
								</div>
								<span class="styUnderlineAmount" style="float:none:;width:30mm;padding-top:0px;                                            padding-bottom:0px;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form3468Data/RehabilitationPeriodBeginDt"/>
									</xsl:call-template>
								</span>
							</div>
							<span class="styLNDesc" style="width:13mm;padding-top:0mm;;">and ends</span>
							<span class="styUnderlineAmount" style="float:none:;width:30mm;padding-top:0px;                                            padding-bottom:0px;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form3468Data/RehabilitationPeriodEndDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="float:left;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:8.5mm"/>
						</div>
					</div>
					<!-- End of line 11b -->
					<!-- Line 11c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:139mm;padding-top:0mm;">
                                        Enter the adjusted basis of the building as of the beginning date above
                                        (or the first day of your holding period, if later)
                                        <span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
  								  	<span style="width:16px;"/>.
								  	
							</span>
							<span style="width:2mm;">$</span>
							<span style="border-style: solid; border-color:black;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;width:29mm;height:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/AdjustedBasisOfBuildingAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:8mm"/>
					</div>
					<!-- End of line 11c -->
					<!-- Line 11d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:139mm;padding-top:0mm;">
                                       Enter the amount of the qualified rehabilitation expenditures incurred, or
treated as incurred, during the period on line 11b above
                                        <span class="styBoldText">
								<span style="width:2px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:14px;"/>.
 								  	
							</span>
							<span style="width:2mm;">$</span>
							<span style="border-style: solid; border-color:black;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;width:29mm;height:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltExpendIncurredAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:8mm"/>
					</div>
					<!-- End of line 11d -->
					<div style="width:187mm; ">
						<div class="styLNLeftNumBox" style=""/>
						<div class="styLNDesc" style="width:139mm;">
                                       Enter the amount of qualified rehabilitation expenditures and multiply by the percentage shown:</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6mm"/>
					</div>
					<!-- Line 11e -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.8mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
								<div class="styLNDesc" style="width:90mm;">
        Pre-1936 buildings located in the Gulf Opportunity Zone
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyPre1936BldgGOZAmt"/>
									</xsl:call-template>
								</div>
								<span style="float:left;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;                                            padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/QualifiedPre1936BldgGOZAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:17mm;padding-top:0mm;">x 13% (.13)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40mm;">
								<div class="styLNRightNumBox" style="width:8mm;height:3mm;padding-top:.5mm;">11e</div>
								<div class="styLNAmountBox" style="width:31mm;height:3mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyPre1936BldgGOZAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 11e -->
					<!-- Line 11f -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.8mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">f</div>
								<div class="styLNDesc" style="width:90mm;font-size:7pt;">
                                          Pre-1936 buildings affected by a Midwestern disaster
 								<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltPre1936BldgMWDACrAmt"/>
									</xsl:call-template>
								</div>
								<span style="float:left;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;                                            padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltPre1936BldgMWDAAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:17mm;padding-top:0mm;">x 13% (.13)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40mm;">
								<div class="styLNRightNumBox" style="width:8mm;height:3mm;padding-top:.5mm;">11f</div>
								<div class="styLNAmountBox" style="width:31mm;height:3mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltPre1936BldgMWDACrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Line 11f -->
					<!-- Line 11g -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.8mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">g</div>
								<div class="styLNDesc" style="width:90mm;font-size:7pt;">
                                          Other pre-1936 buildings
  									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcRehbltOtherPre1936BldgAmt"/>
									</xsl:call-template>
								</div>
								<span style="float:left;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;                                            padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltOtherPre1936BldgAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:17mm;padding-top:0mm;">x 10% (.10)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40mm;">
								<div class="styLNRightNumBox" style="width:8mm;height:3mm;padding-top:.5mm;">11g</div>
								<div class="styLNAmountBox" style="width:31mm;height:3mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcRehbltOtherPre1936BldgAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Line 11g -->
					<!-- Page Break and Footer-->
					<div style="width:187mm;clear:both;padding-top:0.4mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2013)</div>
					</div>
					<div style="width:187mm;padding-top:1mm;">
               Form 3468 (2013)
                          <span style="width:150mm;"/>
						<span style="width:10mm;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;">Part III</div>
						<div class="styPartDesc" style="font-weight:bold;font-size:7.5pt;">
                            Rehabilitation Credit and Energy Credit<span style="font-weight:normal">(continued)</span>
						</div>
					</div>
					<!-- Line 11h -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">h</div>
								<div class="styLNDesc" style="width:90mm;font-size:7pt;">
                                          Certified historic structures located in the Gulf Opportunity Zone
                                      <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistStrctrGOZCrAmt"/>
									</xsl:call-template>
								</div>
								<span style="float:left;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistStrctrGOZAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:16mm;padding-top:0mm;font-size:6.3pt;">x 26% (.26)</span>
								</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:3mm;padding-top:.5mm;">11h</div>
						<div class="styLNAmountBox" style="height:3mm;padding-top:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistStrctrGOZCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 11h -->
					<!-- Line 11i -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">i</div>
								<div class="styLNDesc" style="width:90mm;font-size:7pt;">
                                          Certified historic structures affected by a Midwestern disaster
 									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcCertHistStrctrAffctMWDAAmt"/>
									</xsl:call-template>
								</div>
								<span style="float:left;">
									<span style="width:1mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/CertHistStrctrAffctMWDAAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:16mm;padding-top:0mm;font-size:6.3pt;">x 26% (.26)</span>
								</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:3mm;padding-top:.5mm;">11i</div>
						<div class="styLNAmountBox" style="height:3mm;padding-top:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CalcCertHistStrctrAffctMWDAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 11i -->
					<!-- Line 11j -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">j</div>
								<div class="styLNDesc" style="width:90mm;font-size:7pt;">
                                          Other certified historic structures
  								<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcOthCertifiedHistStrctrAmt"/>
									</xsl:call-template>
									<!-- dotted line -->
									<span class="styBoldText">
										<span style="width:4px;"/>
										<span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                         <span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
							            </span>
								</div>
								<span style="float:left;">
									<span style="width:1mm;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;                                            padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/OtherCertifiedHistStrctrAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:16mm;padding-top:0mm;font-size:6.3pt;">x 20% (.20)</span>
								</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:3mm;padding-top:.5mm;">11j</div>
						<div class="styLNAmountBox" style="height:3mm;padding-top:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CalcOthCertifiedHistStrctrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 11j -->
					<!-- header -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;"/>
						<div class="styLNDesc" style="width:138mm;padding-top:0mm;">
                                            For properties identified on lines 11h, 11i, or 11j, complete lines 11k and 11l.</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 3.5mm"/>
					</div>
					<!-- End of header -->
					<!-- Line 11k -->
					<!-- Line 11k -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">k</div>
								<div class="styLNDesc" style="width:138mm;font-size:7pt;">
                                          Enter the assigned NPS project number or the pass-through entity’s
                                <span style="float:left;">employer identification number (see instructions)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data/NPSProjectNum"/>
									</xsl:call-template>
                                                  <!-- dotted line -->
										<span class="styBoldText">
											<span style="width:4px;"/>
											<span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                         <span style="width:16px;"/>.
                                                         <span style="width:16px;"/>.
										</span>
									</span>
									<span style="float:right;padding-right:4mm;">
										<span class="styUnderlineAmount" style="width:32mm;text-align:left;padding-top:0px;                                            padding-bottom:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form3468Data/NPSProjectNum"/>
											</xsl:call-template>
										</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;"/>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:8mm"/>
					</div>
					<!--End of  Line 11k -->
					<!-- Line 11l -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">l</div>
								<div class="styLNDesc" style="width:138mm;font-size:7pt;">
                                          Enter the date that the NPS approved the Request for Certification
                                <span style="float:left;">of Completed Work (see instructions) 
                                                  <!-- dotted line -->
										<span class="styBoldText">
											<span style="width:4px;"/>
											<span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
										</span>
									</span>
									<span style="float:right;padding-right:4mm;">
										<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;                                            padding-bottom:0px;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form3468Data/NPSApprovalDt"/>
											</xsl:call-template>
										</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;"/>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:8mm"/>
					</div>
					<!--End of Line 11l -->
					<!-- Line 11m -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:3.2mm;">m</div>
						<div class="styLNDesc" style="width:138mm;">
				                          Rehabilitation credit from an electing large partnership (Schedule K-1 (Form 1065-B), box 9)
				                          <!--Dotted Line-->
							<!--	<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
   		                                        </span>     -->
						</div>
						<div class="styLNRightNumBox" style="width:8mm;">11m</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/RehbltCrElectLargePartnerAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 11m -->
					<!-- Start of Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm; ">12</div>
						<div class="styLNDesc" style="width:138mm;">
                                                   Energy credit: </div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm"/>
					</div>
					<!-- Line 12a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:138mm;font-size:7pt;">
                                         Basis of property using geothermal energy or solar energy (acquired before January 1, 2006, and the basis attributable to constuction,
                                         reconstruction, or erection by the taxpayer before January 1, 2006)
                                         <span style="float:left;">placed in service during the tax year (see instructions)</span>
									<span class="styBoldText">
										<span style="width:16px;"/>.
                                        <span style="width:8px;"/>.
                                        </span>
									<span style="width:2mm;border-botom-width:0px;">$</span>
									<span class="styUnderlineAmount" style="float:none;width:32mm;height:3.5mm;padding-top:0px;padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/GthrmlAndSolarEgyPropBssAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:19mm;padding-top:0mm;padding-left:1mm;">x 10% (.10)</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="float:left;">
								<div class="styLNRightNumBox" style="height:10mm;padding-top:6.75mm;">12a</div>
								<div class="styLNAmountBox" style="height:10mm;padding-top:6.75mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcGthrmlAndSolarEgyPropAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 12a -->
					<!-- Line 12b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:138mm;font-size:7pt;">
                                         Basis of property using solar illumination or solar energy placed in service during the tax
                                         year that was acquired after December 31, 2005, and the basis attributable to construction,
                                         reconstruction, or erection by the taxpayer after December 31, 2005 (see instructions)  
                                        <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:4px;"/>
										<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
 						<span style="width:16px;"/>.
 						</span>
									<span class="styBoldText">
										<span style="width:4px;"/>
										<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                         <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                          <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
             		        		</span>
									<span style="width:2mm;">$</span>
									<span class="styUnderlineAmount" style="float:none;width:30mm;padding-top:0px;padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/PropSolarIllmntnOrEgyBssAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:19mm;padding-top:0mm;padding-left:1mm;">x 30% (.30)</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="float:left;">
								<div class="styLNRightNumBox" style="height:12mm;padding-top:10mm;">12b</div>
								<div class="styLNAmountBox" style="height:12mm;padding-top:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcPropSolarIllmntnOrEgyAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 12b -->
					<!-- Line 12c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:1mm; "/>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
                                                   Qualified fuel cell property (see instructions): </div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm"/>
					</div>
					<!--  Line 12c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">c</div>
						<div style="width:138mm;float:left;">
                                  Basis of property placed in service during the tax year that was acquired after December 31, 2005,
                                  and before October 4, 2008, and the basis attributable to construction, reconstruction, or erection by
                                  the taxpayer after December 31, 2005, and before October 4, 2008
                                         <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
										<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.   
                                        <span style="width:16px;"/>.                                                     
    						<span style="width:16px;"/>.
 						</span>
							<span style="width:2mm;padding-left:1.5mm;">$</span>
							<span class="styUnderlineAmount" style="float:none;width:29mm;padding-top:0px;                                            padding-bottom:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/QualifiedFuelCellPropBssAmt"/>
								</xsl:call-template>
							</span>
							<span style="width:19mm;padding-top:0mm;padding-left:1mm;">x 30% (.30)</span>
						</div>
						<div class="styLNRightNumBox" style="float:left;height:11mm;padding-top:9mm;">12c</div>
						<div class="styLNAmountBox" style="height:11mm;padding-top:9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyFuelCellPropBssAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12c -->
					<!--  Line 12d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:mm;float:left;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:138mm;">
							<span style="float:left;">
                                  Applicable kilowatt capacity of property on line 12c (see instructions)</span>
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                         <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                         <span style="width:16px;"/>.
        	                           <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                         <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
 				             </span>
							<img src="{$ImagePath}/3468_Bullet.gif" style="float" alt="right arrow"/>
							<span class="styUnderlineAmount" style="float:none;width:30mm;padding-top:0px;                                            padding-bottom:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/BetweenLmtFuelCellPropKwCapQty"/>
								</xsl:call-template>
							</span>
							<span style="width:17mm;padding-top:0mm;padding-left:1mm;">x  $1,000</span>
						</div>
						<div class="styLNRightNumBox" style="height: 8mm;padding-top:4mm;">12d</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/BetweenLmtFuelCellPropKwCapAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12d -->
					<!-- Line 12e -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;padding-top:1mm;">e</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;padding-top:1mm;">
                                                   Enter the lesser of line 12c or line 12d
                                           <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
            </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:2mm;">12e</div>
						<div class="styLNAmountBox" style="height:4mm;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjustedQlfyFuelCellPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12e -->
					<!-- Line 12f -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">f</div>
						<div style="width:138mm;float:left;">
                                  Basis of property placed in service during the tax year that was acquired after October 3, 2008,
                                  and the basis attributable to construction, reconstruction, or erection by the taxpayer after
                                      <span style="float:left;">October 3, 2008</span>
							<span class="styBoldText">
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
   	                                 <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
						</span>
							<span style="width:2mm;padding-left:0mm;">$</span>
							<span class="styUnderlineAmount" style="float:none;width:29mm;padding-top:1px;                                            padding-bottom:0px;font-size:">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/BasisQlfyFuelCellPropAcqAmt"/>
								</xsl:call-template>
							</span>
							<span style="width:19mm;padding-top:0mm;padding-left:1mm;">x 30% (.30)</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:8mm;">12f</div>
						<div class="styLNAmountBox" style="height:10mm;padding-top:8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBssQlfyFuelCellPropAcqAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12f -->
					<!--  Line 12g -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:mm;float:left;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="width:138mm;">
                                  Applicable kilowatt capacity of property on line 12f (see instuctions)
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                         <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                         <span style="width:16px;"/>.
        	                           <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
 				             </span>
							<img src="{$ImagePath}/3468_Bullet.gif" style="float" alt="right arrow"/>
							<span class="styUnderlineAmount" style="float:none;width:30mm;padding-top:0px;                                            padding-bottom:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/AfterLmtFuelCellPropKwCapQty"/>
								</xsl:call-template>
							</span>
							<span style="width:17mm;padding-top:0mm;padding-left:1mm;">x  $3000</span>
						</div>
						<div class="styLNRightNumBox" style="height: 8mm;padding-top:4mm;">12g</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AfterLmtFuelCellPropKwCapAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12g -->
					<!-- Line 12h -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;padding-top:1mm;">h</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;padding-top:1mm;">
            Enter the lesser of line 12f or line 12g
     						       <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
						     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:2mm;">12h</div>
						<div class="styLNAmountBox" style="height:4mm;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjBssQlfyApplcblFuelCellCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12h -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:138mm;">
                                 Qualified microturbine property (see instructions):	</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height:4mm"/>
					</div>
					<!--  Line 12i -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">i</div>
						<div style="width:138mm;float:left;">
                                  Basis of property placed in service during the tax year that was acquired  after December 31, 2005, and the basis attributable to construction, reconstruction, and erection by the taxpayer after
                                      <span style="float:left;"> December 31, 2005
                                             <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:4px;"/>
									<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
						     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             </span>
								<span style="width:2mm;padding-left:0mm;">$</span>
								<span class="styUnderlineAmount" style="float:none;width:29mm;padding-top:0px;padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyMicroturbinePropBssAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:19mm;padding-top:0mm;padding-left:1mm;">x 10% (.10)</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:6mm;">12i</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyMicroturbinePropBssAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12i -->
					<!--  Line 12j -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;padding-top:1mm;">j</div>
						<div class="styLNDesc" style="width:138mm;padding-top:1mm;">
							<span style="float:left;">
                                  Kilowatt capacity of property on line 12i
                                              <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:4px;"/>
									<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             </span>
								<span style="width:2mm;"/>
							</span>
							<span style="float:right;width:4mm;"/>
							<span style="float:left;">
								<img src="{$ImagePath}/3468_Bullet.gif" style="float" alt="right arrow"/>
							</span>
							<span style="float:right;">
								<span class="styUnderlineAmount" style="width:35mm;padding-top:0px;                                            padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyMicroturbinePropKwCapQty"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:10mm;padding-top:0mm;">x  $200</span>
							</span>
						</div>
						<div style="float:left;clear:none;"/>
						<div class="styLNRightNumBox" style="height: 4mm;padding-top:2mm;">12j</div>
						<div class="styLNAmountBox" style="height:4mm;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyMcrtrbnPropKwCapAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12j -->
					<!-- line 12k -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;padding-top:1mm;">k</div>
						<div class="styLNDesc" style="width:138mm;padding-top:1mm;">
            Enter the lesser of line 12i or line 12j
            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
						     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                     	     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             </span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:2mm;">12k</div>
						<div class="styLNAmountBoxNBB" style=" height: 4mm;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjQlfyMicroturbineKwBssAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12k -->
					<!-- Page Break and Footer-->
					<div style="width:187mm;clear:both;padding-top:0.4mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv"/>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText" style="font-size:8pt;">3468</span> (2013)</div>
					</div>
					<div style="width:187mm;padding-top:1mm;">
               Form 3468 (2013)
                          <span style="width:150mm;"/>
						<span style="width:10mm;">Page <span class="styBoldText" style="font-size:8pt;">3</span>
						</span>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;">Part III</div>
						<div class="styPartDesc" style="font-weight:bold;font-size:7.5pt;">
                            Rehabilitation Credit and Energy Credit<span style="font-weight:normal">(continued)</span>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:138mm;">
                                 Combined heat and power system property (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-weight:normal;padding-left:5mm;width:146mm;">
							<div class="styLNDesc" style="width:138mm;padding-left:3mm;">
								<b>Caution:</b> You cannot claim this credit if the electrical capacity of the property is more
								 than 50 megawatts or 67,000 horsepower.</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 8.5mm"/>
					</div>
					<!-- Line 12l -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">l</div>
						<div style="width:138mm;float:left;">
					 Basis of property placed in service during the tax year that was acquired  after October 3, 2008,
                                  and the basis attributable to construction, reconstruction, or erection by the taxpayer after October 3, 2008
	                                      <span style="float:left;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
						     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
						     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             </span>
							</span>
							<span style="float:right;">
								<span style="width:2mm;border-botom-width:0px;float:left;padding-left:mm;">$</span>
								<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;                                            padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfHeatAndPowerPropAmt"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:17mm;padding-top:0mm;">x 10% (.10)</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:8mm;">12l</div>
						<div class="styLNAmountBox" style="height:10mm;padding-top:8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfHeatAndPowerPropAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12l -->
					<!-- Line 12m -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">m</div>
						<div class="styLNDesc" style="width:138mm;">
                                 If the electrical capacity of the property is measured in:</div>
						<!--						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"/>  -->
						<div class="styLNRightNumBoxNBB" style="height:5.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 5.5mm"/>
					</div>
					<!-- Line 12m -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:mm;float:left;padding-left:4mm;"/>
						<div style="width:138mm;float:left;">
							<li>Megawatts, divide 15 by the megawatt capacity. Enter 1.0 if the capacity is 15
                                        megawatts or less.</li>
							<li>Horsepower, divide 20,000 by the horsepower. Enter 1.0 if the capacity is
                                         20,000 horsepower or less</li>
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
						     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
						     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:6mm;">12m</div>
						<div class="styLNAmountBox" style="height: 8mm;padding-top:6.4mm;font-size:6.3pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/MegaHorsepowerPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  End of 12m -->
					<!-- Line 12n -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">n</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
            Multiply line 12l by line 12m
                       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
					  	    <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:2mm;">12n</div>
						<div class="styLNAmountBox" style="height:4mm;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjHeatAndPowerSysPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12n -->
					<!-- Line 12o-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
                                 Qualified small wind energy property (see instructions):</div>
						<!--						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>  -->
						<div class="styLNRightNumBoxNBB" style="height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- Line 12o -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">o</div>
						<div style="width:138mm;float:left;">
                                  Basis of property placed in service during the tax year that was acquired after October  3, 2008,
                                  and before January 1, 2009, and the basis attributable to construction, reconstruction, or erection
                                  by the taxpayer after October 3, 2008, and before January 1, 2009
    								<span style="width:2mm;padding-left:0mm;">$</span>
							<span class="styUnderlineAmount" style="float:none;width:29mm;padding-top:0px;padding-bottom:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfWindEnergyPropAmt"/>
								</xsl:call-template>
							</span>
							<span style="width:18mm;padding-left:1mm;">x 30% (.30)</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:6mm;">12o</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBasisOfWindEnergyPropAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12o -->
					<!--Line 12p -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;padding-top:1mm;">p</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;padding-top:1mm;">
            Enter the smaller of line 12o or $4,000
                       				 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
					  	     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
  						     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
						     <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                         </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:2mm;">12p</div>
						<div class="styLNAmountBox" style=" height:4mm;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjBasisOfWindEnergyPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12p -->
					<!-- Line 12q-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">q</div>
								<div class="styLNDesc" style="width:138mm;font-size:7pt;float:left;">
					 Basis of property placed in service during the tax year that was acquired  after December 31, 2008,
                                  and <br/>the basis attributable to construction, reconstruction, and erection by the taxpayer after<br/>
									<span style="float:left;"> December 31, 2008</span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:left;">
										<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								  	    <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                      </span>
									<span style="float:left;width:2mm;">$</span>
									<span class="styUnderlineAmount" style="float:none;width:29mm;padding-top:0px;padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/BssOfWindEgyConstrErctnAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:18mm;padding-top:0mm;padding-left:1mm;">x 30% (.30)</span>
								</div>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:8mm;">12q</div>
						<div class="styLNAmountBox" style="height:10mm;padding-top:8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBssOfWindEgyConstrErctnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of line 12q -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
                                 Geothermal heat pump systems (see instructions):</div>
						<!--						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>  -->
						<div class="styLNRightNumBoxNBB" style="height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- Line 12r -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">r</div>
							<div class="styLNDesc" style="width:138mm;font-size:7pt;">
                                         Basis of property placed in service during the tax year that was acquired after October 3, 2008, and the
                                         basis attributable to construction, reconstruction, or erection by the taxpayer after October 3, 2008
 										<!--Dotted Line-->
								<span class="styBoldText" style="float:left">
									<span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
								  	      <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
								  	      <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                   </span>
								<span style="float:left;">
									<span style="width:2mm;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/BssGthrmlPropHtPumpSysAmt"/>
										</xsl:call-template>
									</span>
									<span style="float:left;width:19mm;padding-top:0mm;padding-left:2mm;">x 10% (.10)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;">12r</div>
							<div class="styLNAmountBox" style="height:12mm;padding-top:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBssGthrmlPropHtPumpSysAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End of line 12r -->
					<!-- Line 12s -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
                                 Qualified investment credit facility property (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- Line 12s -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">s</div>
								<div class="styLNDesc" style="width:72mm;float:left;">
                                          Basis of property placed in service during the tax year
                               </div>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:4px;"/>
									<span style="width:16px;"/>.
								<span style="width:16px;"/>.
  	                                       </span>
								<span style="width:2mm;">$</span>
								<span class="styUnderlineAmount" style="float:none;width:29mm;padding-top:0px;padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/BssOfPropPlacedInSrvcAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:19mm;padding-top:0mm;padding-left:1mm;">x 30% (.30)</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;padding-top:0mm;">12s</div>
							<div class="styLNAmountBox" style="height:4.5mm;padding-top:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBssOfPropPlacedInSrvcAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End of 12s -->
					<!-- Line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">13</div>
						<div class="styLNDesc" style="width:138mm;">
				                Enter the applicable unused investment credit from cooperatives (see instructions)
				                                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">13</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/UnusedCrRehbltEgyCrFromCoopAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 13 -->
					<!-- Line 14 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">14</div>
						<div class="styLNDesc" style="width:138mm;">
				                Add lines 11e through 11j, 11m, 12a, 12b, 12e, 12h, 12k, 12n, 12p, 12q, 12r, 12s, and 13.  Report this amount on Form 3800, line 4a
				                                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;width:8mm;padding-top:4mm;border-bottom-width:0px;">14</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotalInvestmentCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 14 -->
					<!-- BEGIN Schedule J Title -->
					<!-- *******************************************************     -->
					<!-- Adding page break -->
					<div style="width:187mm;">
						<div style="float:right;" class="styGenericDiv">Form
					       <span class="styBoldText" style="font-size:8pt;">3468</span> (2013)</div>
					</div>
					<div style="width:187mm;" class="pageend"/>
					<!-- Begininning of write-in data -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
        Additional Data        
      </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form3468Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Added the xsl:if clause here as the <tr> needs to shown only when the attribute exists.  And also added xsl:choose block if not both templates will be called resulting in display problems as both templates insert the span tag for id's.For more information look for defect 9101-->
						<xsl:if test="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:110mm;" scope="row">
            Line 1g - Certified Historic Structure on File:
          </td>
								<td class="styLeftOverTableRowAmount" style="width:100mm;text-align:left;">
									<xsl:choose>
										<xsl:when test="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile = '1'">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures/  @historicStructureCertOnFile"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures/  @historicStructureCertOnFile"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<!--         <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Line 1g - Form 4684 Indicator</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>    -->
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>