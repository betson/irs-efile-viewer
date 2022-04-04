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
				border-right-width:0px;text-align:right;padding-right:2px;font-size:6.5pt;
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
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
					<div style="width:187mm;clear:all;">					
					
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:30mm;height:23mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  8606</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8606Data"/>
							</xsl:call-template>
							<br/><br/>
							<span class="styAgency" style="padding-top:2mm;">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:23mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								Nondeductible IRAs<br/>
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:0px;">
										<div style="width:100%;height:5mm;">
											<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="SmallBullet"/> 
											Go to  <i>www.irs.gov/Form8606</i> for instructions and the latest information.
											<!--Information about Form 8606 and its separate instructions is at <a href="http://www.irs.gov/form8606">www.irs.gov/form8606</a>-->
											<br/><br/>
											<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="SmallBullet"/> 
                                                  Attach to 2021 Form 1040, 1040-SR, or 1040-NR.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:23mm;">
							<div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">21</span>
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
							Name. If married, file a separate form for each spouse required to file 2021 Form 8606. See instructions.<br/>
							<!--<span style="width:10mm;height:3mm;">ffff</span>-->			
							<div style="text-align:left;padding-bottom:1.5mm;padding-right:4mm">
							  <xsl:choose>
                                <!-- Name from Form level -->
                                    <xsl:when test="$Form8606Data/Form8606IRANamelineTxt != '' ">
                                        <span style="padding-top:2mm;">
                                            <xsl:call-template name="PopulateText">
                                                <xsl:with-param name="TargetNode" select="$Form8606Data/Form8606IRANamelineTxt"/>
                                            </xsl:call-template>
                                        </span>
                               </xsl:when>
                                <!-- Name from 1040 Return Header-->
                                    <xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
                                        <xsl:call-template name="PopulateReturnHeaderFiler">
                                            <xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:when>
                               </xsl:choose>
                            </div>
						</div>
						<div style="height:8mm;width:50mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox;">
							Your social security number
							<br/>							
							<span style="font-weight:normal;width:100%;padding-top:2mm;">
                     		  <xsl:choose>
                     		  <!--    Form level -->
							        <xsl:when test="$Form8606Data/NondedIRATxpyrWithIRASSN != '' ">
                                        <xsl:call-template name="PopulateSSN">
                                            <xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATxpyrWithIRASSN"/>
                                        </xsl:call-template>
                                    </xsl:when>                                                              
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
					<!-- Begin Top Section -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8606LineItem" style="height:27mm;">
							<!-- Left Panel -->
							<div class="styIRS8606LineItem" style="width:25%;float:left;height:27.2mm;">
								<!-- Text -->
								<div class="styIRS8606LineItem" style="width:83%;float:left;font-size:8pt;padding:6.5mm 0px 7px 0px;height:27.2mm;">
									<span class="styBoldText">
										Fill in Your Address Only<br/>
										if You Are Filing This<br/>
										Form by Itself and Not<br/>
										With Your Tax Return<br/>
									</span>
								</div>
								<!-- Image -->
								<div class="styIRS8606LineItem" style="width:17%;float:left;padding:26px 0px 7px 8px;border-right-width:1px;border-color:black;height:100%">
									<img src="{$ImagePath}/8606_Bullet_Lg.gif" alt="LargeBullet"/>
								</div>
							</div>
							<!-- Right Panel -->
							<div class="styIRS8606LineItem" style="width:75%;float:left;height:27.2mm;">
								<div class="styIRS8606LineItem" style="width:100%;border-bottom-width:1px;border-color:black;height:30%;">
									<div class="styIRS8606LineItem" style="width:118mm;height:100%;float:left;padding-left:4px">
										Home address (number and street, or P.O. box if mail is not delivered to your home)
                                        <xsl:choose>
										      <xsl:when test="($RtnHdrData/ReturnTypeCd='1040') or($RtnHdrData/ReturnTypeCd='1040A')  or ($RtnHdrData/ReturnTypeCd='1040NR') ">
											  </xsl:when>
											  <xsl:otherwise>
											   	<br/>
         									<xsl:if test="$RtnHdrData/Filer/USAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									    </xsl:otherwise>
										</xsl:choose> 										
									</div>
									<div class="styIRS8606LineItem" style="width:15mm;height:100%;float:right;border-left-width:1px;border-color:black;padding-left:5px;">
										Apt. no.
									</div>
								</div>
								<div class="styBB" style="width:140mm;height:11mm;">
								      <div class="styLNAmountBoxNBB"  style="width:104mm;height:11mm; border-right-width:1px;border-left-width:0px;padding-right:0mm;">
                                       <div class="styLNDesc" style="float:right;padding-top:0mm;padding-right:4.5mm">City, town or post office, state, and ZIP code. If you have a foreign address, also complete </div>	
                                         <div class="styGenericDiv" style="float:left;padding-left:1mm;padding-bottom:.5mm;"> the spaces below (see instructions).</div>
                                         <div class="styGenenicDIV" style="float:left">
                                         <xsl:choose>
										       <xsl:when test="($RtnHdrData/ReturnTypeCd='1040') or ($RtnHdrData/ReturnTypeCd='1040A')  or ($RtnHdrData/ReturnTypeCd='1040NR') ">
                                              </xsl:when> 	
                                                  <xsl:otherwise>
												<xsl:choose>
         										        <xsl:when test="$RtnHdrData/Filer/ForeignAddress">
		    										          <xsl:call-template name="PopulateReturnHeaderFiler">
													          <xsl:with-param name="TargetNode">CityNm</xsl:with-param>
			    									          </xsl:call-template>
											            </xsl:when>
											            <xsl:otherwise>
				    								          <xsl:call-template name="PopulateReturnHeaderFiler">
					    							          <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
						     						          </xsl:call-template>
                                                        </xsl:otherwise>
										        </xsl:choose>
									            </xsl:otherwise>
									    </xsl:choose> 
									    </div>
								      </div>
								 
								</div>
					
								<div class="styIRS8606LineItem" style="width:100%;height:33%;">
									<div class="styIRS8606LineItem" style="width:100%;height:100%;float:left;">
										<div class="styGenericDiv" style="width:55mm;border-right:1px solid black;height:8mm;padding-left:4px;">
											Foreign country name<br/>
                                               	<xsl:choose>
										                <xsl:when test="$RtnHdrData/ReturnTypeCd='8606'">
										                	    <xsl:call-template name="PopulateReturnHeaderFiler">
												                <xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												                <xsl:with-param name="MainForm" select="true()"/>
											                    </xsl:call-template>
											            </xsl:when> 
											            <xsl:otherwise>

											           </xsl:otherwise>
											    </xsl:choose>
										</div>
										<div class="styGenericDiv" style="width:56mm;border-right:1px solid black;height:8mm;padding-left:4px;">
				               				Foreign province/state/county<br/>
								                                                             			
											           <xsl:choose>
										                      <xsl:when test="$RtnHdrData/ReturnTypeCd='8606'">
										                          <xsl:call-template name="PopulateReturnHeaderFiler">
												                  <xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
											                      </xsl:call-template>
                                                              </xsl:when>									               
										                      <xsl:otherwise>
														       
													          </xsl:otherwise>
                                                      </xsl:choose>
										</div>
										<div class="styGenericDiv" style="width:27.8mm;height:100%;padding-left:4px;">
											Foreign postal code<br/>
											<span style="text-align:center;width:100%">
											        <xsl:choose>
										                      <xsl:when test="($RtnHdrData/ReturnTypeCd='1040') or($RtnHdrData/ReturnTypeCd='1040A')  or ($RtnHdrData/ReturnTypeCd='1040NR') ">
										                           
                                                              </xsl:when>									               
										                      <xsl:otherwise>
                                                                       <xsl:call-template name="PopulateReturnHeaderFiler">
                                                                     <xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
                                                                     </xsl:call-template>
											                    </xsl:otherwise>    
											       </xsl:choose>
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
						<div class="styPartName" style="width:15mm;height:auto;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;padding-bottom:3px;height:auto;">
							Nondeductible Contributions to Traditional IRAs and Distributions From Traditional, SEP, and SIMPLE IRAs<br/></div>							
							<div class="styPartDesc" style="border-bottom:1px solid black;width:187mm;height:auto;">
							<span class="styNormalText">
							<span style="width:15mm"/>
								Complete this part only if one or more of the following apply.
								</span>
								</div>	
								<div class="styPartDesc" style="padding-left:18mm;padding-bottom:3px;height:auto;">
     								<span class="styNormalText" style="font-size:7pt;">
							            <img src="{$ImagePath}/8606_Bullet_Round.gif" alt="RoundBullet"/>
							            <div style="padding-left:4mm;">You made nondeductible contributions to a traditional IRA for 2021.</div>
							            <div style="height:2mm;"/>
							    	</span>
							    	<br/>
							    	<span class="styNormalText" style="font-size:7pt;padding-bottom:1.5mm;">
							            <img src="{$ImagePath}/8606_Bullet_Round.gif" alt="RoundBullet"/>
							            <div style="padding-left:4mm;padding-top:1mm;">You took distributions from a traditional, SEP, or SIMPLE IRA in 2021 <b>and</b> you made nondeductible contributions to a </div><br/>
							            <div style="padding-left:6mm">traditional IRA in 2021 or an earlier year. For this purpose, a distribution does not include a rollover (other than a repayment of a qualified disaster distribution (see 2021 Forms 8915-D and 8915-F)), qualified charitable distribution,  one-time  distribution to fund an HSA, conversion, recharacterization, or return of certain contributions.</div> 
							        
							    	</span>
							         <span class="styNormalText" style="font-size:7pt;">
							            <img src="{$ImagePath}/8606_Bullet_Round.gif" alt="RoundBullet"/>
							            <div style="padding-left:4mm;">You converted part, but not all, of your traditional, SEP, and SIMPLE IRAs to Roth IRAs in 2021  </div><br/>
							          
							            <div style="padding-left:6mm;"> <b>and</b> you made nondeductible contributions to a traditional IRA in 2021 or an earlier year.</div>
							            
							            
							    	</span>
								</div>					
						
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">1</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Enter your nondeductible contributions to traditional IRAs for 2021, including those made for 2021 from January 1, 2022,
									<span style="float:left;">through April 18, 2022. See instructions</span>
									<!--Dotted Line-->
								   <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
								</div>
							</div>			
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">8mm</xsl:with-param>
								<xsl:with-param name="Number">1</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRACurrTYNondedContriAmt"/>
								<xsl:with-param name="AmountBoxStyle">padding:4mm 0.5mm 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">padding:4mm 0px 0px 0px;</xsl:with-param>								
							</xsl:call-template>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">2</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:1mm 0 0 0;">
								<span style="float:left;padding-left:3mm;">
									Enter your total basis in traditional IRAs. See instructions
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
							</div>
							<xsl:call-template name="CreateBox">
							    <xsl:with-param name="Height">5mm</xsl:with-param>
							    <xsl:with-param name="Number">2</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRABasisForPYAmt"/>
								<xsl:with-param name="AmountBoxStyle">border-width:0 0 .5mm 1px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0 0 .5mm 1px;</xsl:with-param>								
							</xsl:call-template>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="height:auto;" >
							<div class="styIRS8606LNLeftNumBox">3</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:1mm 0 0 1mm;">
								<span style="float:left;padding-left:2mm;">
									Add lines 1 and 2
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............................</span>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATotalIRAValueAmt"/>
								<xsl:with-param name="Number">3</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8606LineItem" style="height:auto;">
							<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:9mm;height:13mm;"/>
							<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:55mm;height:13mm;border-width:2px 2px 2px 2px;border-color:black;">
								<span class="styBoldText" style="width:100%;height:100%;padding-left:4mm;padding-top:1.5mm;">
									In 2021, did you take a distribution<br/>
									from traditional, SEP, or SIMPLE IRAs,<br/>
									or make a Roth IRA conversion?
								</span>
							</div>
							<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:86mm;height:13mm;">
								<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:34%;float:none;">
									<img src="{$ImagePath}/8606_Line.gif" alt="Line"/>
									<span class="styBoldText" style="width:5mm;text-align:center;">No</span>
									<img src="{$ImagePath}/8606_Line.gif" alt="Line"/>
									<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="padding-left:4mm;"></span>
									Enter the amount from line 3 on line<br/>
									<span  style="padding-left:39mm;">14. Do not complete the rest of Part I.</span>
								</div>
								<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:26%;float:none;">
								</div>
								<div class="styIRS8606LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:40%;">
									<img src="{$ImagePath}/8606_Line.gif" alt="Line"/>
									<span class="styBoldText" style="width:5mm;text-align:center;">Yes</span>
									<img src="{$ImagePath}/8606_Line.gif" alt="Line"/>
									<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="padding-left:4mm;">Go to line 4.</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">13.2mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="height:auto;" >
							<div class="styIRS8606LNLeftNumBox">4</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:2px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Enter those contributions included on line 1 that were made from January 1, 2022, through April 18, 2022
								</div>
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
								</div>
							</div>
							<xsl:call-template name="CreateBox">
							    <xsl:with-param name="Height">6mm</xsl:with-param>
							    <xsl:with-param name="Number">4</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRAPostTaxYrContriAmt"/>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px .5mm 1px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px .5mm 1px;</xsl:with-param>								
							</xsl:call-template>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem"  style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">5</div>
							<div   class="styLNDesc" style="width:144mm;">
								<span style="float:left;padding-left:3mm;">
									Subtract line 4 from line 3
								</span>	
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATaxYearNetBasisAmt"/>
								<xsl:with-param name="Number">5</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem"  style="height:10mm;">
							<div class="styIRS8606LNLeftNumBox">6</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding-left:3mm;">
								Enter the value of <b>all</b> your traditional, SEP, and SIMPLE IRAs as of December 31, 2021, 
								<span style="float:left;">plus any outstanding rollovers. Subtract any repayments of qualified disaster distributions (see 2021 Forms 8915-D and 8915-F)
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
								</span>
	                            <!--Dotted Line-->
								<!--<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>-->
							</div>
							<div class="styIRS8606LNDesc" style="height:5.5mm;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:5.5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:5.5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
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
								<div class="styIRS8606LNDesc" style="height:121mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
									    <xsl:with-param name="Number">6</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRACurrTYIRAPlusRllvrAmt"/>										
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="padding-bottom:0mm; height:auto;">
							<div class="styIRS8606LNLeftNumBox">7</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;font-size:7pt;">
									<span style="float:left;">
									Enter your distributions from traditional, SEP, and SIMPLE IRAs in 2021.
									<b>Do not</b> include rollovers (other than repayments of qualified disaster distributions (see 2021 Forms 8915-D and 8915-F)), qualified charitable distributions, a one-time
									 distribution to fund an HSA, conversions to a Roth IRA, certain returned contributions, or recharacterizations of traditional IRA contributions (see instructions) 
                                        <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
                                        </span>
				<!--					<span style="float:left;">instructions)</span>-->
									<!--Dotted Line-->
									
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
								<div class="styIRS8606LNDesc" style="height:5.5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:5.5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
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
									    <xsl:with-param name="Number">7</xsl:with-param>
										<xsl:with-param name="Height">6.1mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRAWthdrwLessRllvrAmt"/>										
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem"  style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">8</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
											Enter the net amount you converted from traditional, SEP, and SIMPLE IRAs to Roth IRAs  
									<span style="float:left;">in 2021.  Also enter this amount on line 16</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
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
									    <xsl:with-param name="Number">8</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATYCombinedIRAValueAmt"/>										
									</xsl:call-template>
								</div>
							</div>
						</div>
					<!--	<div class="styIRS8606LineItem" style="padding-top:0mm;height:auto;">
							<div class="styIRS8606LNLeftNumBox">8</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;background-color:red;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;font-size:7pt;">
									Enter the net amount you converted from traditional, SEP, and SIMPLE
									IRAs to Roth IRAs  
									<span style="float:left;">in 2020.  Also enter this amount on line 16</span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgreen;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;background-color:lightblue;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:5.2mm;width:37mm;float:right;padding:0px 0px 0px 0px;background-color:yellow;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:5.2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
									    <xsl:with-param name="Height">5.2mm</xsl:with-param>
									    <xsl:with-param name="Number">8</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATYCombinedIRAValueAmt"/>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px .5mm 1px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px .5mm 1px;</xsl:with-param>										
									</xsl:call-template>
								</div>
							</div>
						</div>-->
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem"  style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">9</div>
							<div class="styIRS8606LNDesc" style="width:70mm;height:4.5mm;padding:1mm 0 0 3mm;">
								<span style="float:left;">
									Add lines 6, 7, and 8
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>		
							</div>
							<xsl:call-template name="CreateBox">
							   <xsl:with-param name="Height">4.5mm;</xsl:with-param>
							    <xsl:with-param name="Number">9</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATotRllvrWthdrwVlAmt"/>								
							</xsl:call-template>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">4.5mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">4.5mm;</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>

						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="height:auto;">
						     <div class="styIRS8606LNLeftNumBox">10</div>
						     <div class="styIRS8606LNDesc" style="width:107.2mm;padding-left:3mm;border-right:1px solid black;height:7.5mm;">
						              Divide line 5 by line 9. Enter the result as a decimal rounded to at least 3 places. If the result 
						           <span style="float:left;">is 1.000 or more, enter &#8220;1.000&#8221;</span>      
						                                <!--Dotted Line-->
						            <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						     </div>
						     <div class="styLNLeftNumBox" style="width:7.7mm;height:7.5mm;text-align:center;padding-right:1mm;padding-top:4mm;padding-bottom:0;border-bottom:1px solid black;">10</div>
						     <div class="styLNAmountBox" style="width:29.3mm;padding-top:4mm;padding-bottom:0;height:7.5mm;border-right:1px solid black;text-align:left;padding-left:9mm;">
										x
											<span style="width:8mm"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATaxYearBasisRt"/>
											</xsl:call-template>
								</div>
								<div class="styLNLeftNumBox" style="width:8.1mm;background-color:lightgrey;height:7.5mm;border-right:1px solid black;"/>
								<div class="styLNAmountBox" style="width:28mm;height:7.5mm;border-bottom-width:0px;border-left:0px;"/>
						</div>
						
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem"  style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">11</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Multiply line 8 by line 10. This is the nontaxable portion of the amount you converted to 
									<span style="float:left;">Roth IRAs. Also enter this amount on line 17</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
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
									    <xsl:with-param name="Number">11</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRANontxCnvrtAmt"/>										
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem"  style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">12</div>
							<div class="styIRS8606LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									Multiply line 7 by line 10. This is the nontaxable portion of your distributions that you did not 
									<span style="float:left;">convert to a Roth IRA</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">5.4mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">		
								        <xsl:with-param name="Number">12</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRANontxWthdrwUncnvrtAmt"/>									
								</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem"  style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">13</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:1mm 0 0 0;">
								<span style="float:left;padding-left:3mm;">
									Add lines 11 and 12. This is the nontaxable portion of all your distributions
								</span>
							    <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</div>
							<xsl:call-template name="CreateBox">
							   <xsl:with-param name="Height">6mm</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRANontxOfWthdrwAmt"/>
								<xsl:with-param name="Number">13</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px .5mm 1px;padding-top:2mm;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px .5mm 1px;padding-top:2mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem"   style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">14</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:1mm 0 0 3mm;">
								<span style="float:left;">
									Subtract line 13 from line 3. This is <b>your total basis in traditional IRAs for 2021 and earlier years</b>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
							<xsl:call-template name="CreateBox">
							   <xsl:with-param name="Height">6mm</xsl:with-param>
							   <xsl:with-param name="Number">14</xsl:with-param>
							   <xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATotalIRABasisAmt"/>								
							   <xsl:with-param name="AmountBoxStyle">padding-top:2mm;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">padding-top:2mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						    <!-- (15a - 15c) ////////////////////////////////////////////////////-->
							<div class="styIRS8606LineItem"    style="height:auto;">
							<div class="styIRS8606LNLeftNumBox" style="padding-left:3.5mm;">15a</div>
							<div class="styLNDesc" style="width:144mm;padding-left:3.5mm;height:4mm;float:left">
							Subtract line 12 from line 7
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:1px;font-size:7pt">15a</div>
							<div class="styLNAmountBox" style="width:29mm;border-bottom-width:1px;font-size:6.5pt">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRANotCnvrtLessRllvrAmt"/>
								</xsl:call-template>
                             </div>
                             <div class="styLNLeftNumBoxSD" style="padding-left:6mm;height:4mm;float-left">b</div>
							<div class="styLNDesc" style="float:left;width:142mm;padding-left:2mm;height:5mm;">
							      Enter the amount on line 15a attributable to qualified disaster distributions from 2021 Forms 8915-D, and 8915-F (see instructions). Also, enter this amount on 2021 Form 8915-D, line 23;  <b>or</b> 2021 Form 8915-F, line 18, as applicable
						          <span class="styDotLn" style="float:right;padding-right:1mm;">...............................</span>
						     </div>
							<div class="styLNRightNumBox" style="border-bottom-width:1px;font-size:7pt;height:9mm;padding-top:5.5mm;">15b</div>
							<div class="styLNAmountBox" style="width:29mm;border-bottom-width:1px;height:9mm;padding-top:5.5mm;font-size:6.5pt">
				             <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRAQlfyDisasterDistriAmt"/>
								</xsl:call-template>
                             </div>
                                <div class="styLNLeftNumBoxSD" style="padding-left:6mm;height:4mm;float:left">c</div>
							<div class="styLNDesc" style="width:142mm;padding-left:2mm;height:3mm;text-align:left">
							   <b>Taxable amount. </b>Subtract line 15b from line 15a. If more than zero, also include this 
						         amount on<br/> 2021 Form 1040, 1040-SR, or 1040-NR, line 4b
						          <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						     </div>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;font-size:7pt;height:6.5mm;padding-top:3.5mm;">15c</div>
							<div class="styLNAmountBox" style="width:29mm;border-bottom-width:1px;height:6.5mm;padding-top:3.5mm;font-size:6.5pt">
				                    <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8606Data/NondedIRATaxableAmt"/>
								</xsl:call-template>
                             </div>
							
						</div>
					
					<!-- (15a - NOTE) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem"    style="height:auto;padding-top:0mm;">
						<div class="styIRS8606LNLeftNumBox" style="padding-left:2.2mm;"/>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding-left:1mm ">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;float:left">
								<b>Note:</b> You may be subject to an additional 10% tax on the amount on line 15c if you were under
									age 59½ at the time of the distribution. See instructions.
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
					</div>					
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div style="width:187mm;padding-top:1mm;clear:all;page-break-after:always;display:block;">
						<div style="float:left;">
							<span class="styBoldText">
								For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.
							</span>
						</div>
						<div style="text-align:left;font-size:7pt;">
							<span style="width:120px"/>
							Cat. No. 63966F
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8606</span> (2021)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
				    <div style="width:187mm;clear:auto;">
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Form 8606 (2021)<span style="width:148mm;"/>
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
					<div style="width:187mm;height:auto;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:auto;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;padding-bottom:3px;height:auto;">
							2021 Conversions From Traditional, SEP, or SIMPLE IRAs to Roth IRAs<br/>
							<span class="styNormalText">
								Complete this part if you converted part or all of your traditional, SEP, and SIMPLE IRAs to a Roth IRA in 2021.
							</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;border-bottom-width:1px;height:auto;">
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">16</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;font-size:7pt;">
									If you completed Part I, enter the amount from line 8. Otherwise, enter the net amount you
									converted from traditional, SEP, and SIMPLE IRAs to Roth IRAs in 2021.
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0 0 0 0;">
									<xsl:call-template name="CreateBox">
									   <xsl:with-param name="Height">8mm</xsl:with-param>
									   <xsl:with-param name="Number">16</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8606Data/TotalIRAConvertedToRothAmt"/>
										<xsl:with-param name="AmountBoxStyle">padding-top:4mm;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:4mm;</xsl:with-param>										
									</xsl:call-template>
								</div>
		    				</div>
						<!-- (17) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem"  style="height:auto;">
							<div class="styIRS8606LNLeftNumBox">17</div>							
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									If you completed Part I, enter the amount from line 11. Otherwise, enter your basis in the amount on line 16 (see<br/>
									<span style="float:left;">instructions)</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-left:5mm;">................................</span>
								</div>
							</div>
							<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
									  	<xsl:with-param name="Height">8mm</xsl:with-param>
									  	<xsl:with-param name="Number">17</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8606Data/TraditionalIRABasisAmt"/>										
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:2px;padding-top:3.5mm;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:2px;padding-top:3.5mm;</xsl:with-param>
									</xsl:call-template>
							</div>
						</div>					
						<!-- (18) ////////////////////////////////////////////////////-->
						<div class="styIRS8606LineItem" style="border-bottom-width:0px;height:auto;">
							<div class="styIRS8606LNLeftNumBox">18</div>
							<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
									<b>Taxable amount.</b>  Subtract line 17 from line 16. If more than zero, also include this amount on
									2021 Form 1040, 1040-SR, or 1040-NR, line 4b
									<!--<span style="float:left;">line  or Form 1040NR, line 16b</span>-->
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:3mm;">.........................</span>
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
									    <xsl:with-param name="Number">18</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8606Data/TaxableIRAConversionAmt"/>										
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
					<div style="width:187mm;border-top-width:0.3mm;height:auto;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;height:auto;">
							Distributions From Roth IRAs<br/>
							<span class="styNormalText">
								Complete this part only if you took a distribution from a Roth IRA in 2021. For this purpose, a distribution does not
								include a rollover (other than a repayment of a qualified disaster distribution (see 2021 Forms 8915-D and 8915-F)), qualified charitable distribution,  one-time distribution to fund an HSA, recharacterization, or return of certain contributions (see instructions)).
							</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;height:62mm;">
					<!-- (19) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem" style="height:auto;">
						<div class="styIRS8606LNLeftNumBox" style="padding-left:2.2mm;">19</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:1mm 0 0 3mm;">
								Enter your total nonqualified distributions from Roth IRAs in 2021, including any
								qualified first-time homebuyer distributions, and any qualified disaster distributions (see instructions). Also see 2021 Forms 8915-D and 8915-F
								
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
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
								    <xsl:with-param name="Number">19</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form8606Data/TotNonQlfyDistriFromRothIRAAmt"/>									
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!-- (20) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem"  style="height:7mm;">
						<div class="styIRS8606LNLeftNumBox">20</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:1mm 0 0 3mm;">
								<span style="float:left;">Qualified first-time homebuyer expenses (see instructions). <b>Do not</b> enter more than
								$10,000  reduced by the total of all your prior qualified first-time homebuyer distributions
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;padding-bottom:3mm;">.......................</span></span>
						</div>
						<div class="styIRS8606LNDesc" style="height:7mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
								    <xsl:with-param name="Height">7.5mm</xsl:with-param>
								    <xsl:with-param name="Number">20</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form8606Data/QlfyFirstTimeHmByrExpensesAmt"/>									
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0.5mm;padding-top:3.5mm;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0.5mm;padding-top:3.5mm;</xsl:with-param>
								</xsl:call-template>
						</div>
					</div>					
					<!-- (21) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem"   style="height:auto;">
						<div class="styIRS8606LNLeftNumBox">21</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:1mm 0 0 3mm;">
							<span style="float:left;">Subtract line 20 from line 19. If zero or less, enter -0-</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>

							<div class="styIRS8606LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
								    <xsl:with-param name="Number">21</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form8606Data/NetQlfyFirstTimeHmByrExpnssAmt"/>									
								</xsl:call-template>
							</div>
					</div>					
					<!-- (22) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem" style="height:auto;">
						<div class="styIRS8606LNLeftNumBox">22</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0.5mm 0 0 0;">
							<span style="float:left;padding-left:3mm;">
								Enter your basis in Roth IRA contributions (see instructions). If line 21 is zero, <b>
							stop here</b>
							</span>				
						    <!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>		
						</div>
						<xsl:call-template name="CreateBox">
							<xsl:with-param name="Height">5mm</xsl:with-param>
							<xsl:with-param name="Number">22</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8606Data/ROTHIRAContributionBasisAmt"/>
							<xsl:with-param name="AmountBoxStyle">border-bottom-width:0.5mm;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding-top:1mm;border-bottom-width:0.5mm;</xsl:with-param>							
						</xsl:call-template>
					</div>
					<!-- (23) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem"  style="height:auto;">
						<div class="styIRS8606LNLeftNumBox" style="padding-left:2.2mm;">23</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
								Subtract line 22 from line 21. If zero or less, enter -0- and skip lines 24 and 25. If more than zero, you may be subject to an 
								<span style="float:left;">additional tax (see instructions)</span>
							    <!--Dotted Line-->
							    <div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
							</div>
						</div>
						<div class="styIRS8606LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<xsl:call-template name="CreateBox">
								   	<xsl:with-param name="Height">8mm</xsl:with-param>
								   	<xsl:with-param name="Number">23</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form8606Data/NetBasisInRothIRAContriAmt"/>									
							        <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 1px 1px;padding-top:3.5mm</xsl:with-param>
							       <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 1px 1px;padding-top:3.5mm</xsl:with-param>
								</xsl:call-template>
						</div>
					</div>
					<!-- (24) ////////////////////////////////////////////////////-->
					<div class="styIRS8606LineItem"   style="height:auto;">
						<div class="styIRS8606LNLeftNumBox">24</div>
						<div class="styIRS8606LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS8606LNDesc" style="width:auto;height:100%;">
								Enter your basis in conversions from traditional, SEP, and SIMPLE IRAs and rollovers from qualified retirement plans to a 
								<span style="float:left;">Roth IRA. See instructions</span>
							   <!--Dotted Line-->
							   <div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
							</div>
						</div>
						<xsl:call-template name="CreateBox">
							<xsl:with-param name="Height">8mm</xsl:with-param>
							<xsl:with-param name="Number">24</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8606Data/BasisInCnvrtQlfyRtrPlanAmt"/>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 2px 1px;padding-top:3.0mm</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 2px 1px;padding-top:3.0mm</xsl:with-param>							
						</xsl:call-template>
					</div>
					
					<!--(25a- 25c)  ////////////////////////////////////////////////////-->
					     <div style="width:187mm">
					          <div class="styLNLeftNumBox" style="padding-left:3.5mm;height:4mm;float:left;">25a</div>
					          <div class="styLNDesc" style="width:142mm;padding-left:1mm;height:4mm;">
					          Subtract line 24 from line 23. If zero or less, enter -0- and skip lines 25b and 25c
					          <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
					          </div>
					          <div class="styLNRightNumBox" style="border-bottom-width:1px;font-size:7pt">25a</div>
					          <div class="styLNAmountBox" style="width:29mm;border-bottom-width:1px;font-size:6.5pt">
				                      <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8606Data/DistriRothIRALessBasisCnvrtAmt"/>
								</xsl:call-template>
                             </div>
                            
                             
                                  <div class="styLNLeftNumBoxSD" style="padding-left:6mm;height:4mm;float:left;">b</div>
							<div class="styLNDesc" style="width:142mm;padding-left:2mm;height:6mm;float:left">
							Enter the amount on line 25a attributable to qualified disaster distributions from 2021 Forms 8915-D and 8915-F (see instructions). 
							Also, enter this amount on 2021 Form 8915-D, line 24; <b>or</b> 2021 Form 8915-F, line 19, as applicable
						          <span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
						     </div>
							<div class="styLNRightNumBox" style="border-bottom-width:1px;font-size:7pt;height:8mm;padding-top:4.5mm;">25b</div>
							<div class="styLNAmountBox" style="width:29mm;border-bottom-width:1px;height:8mm;padding-top:4.5mm;font-size:6.5pt">
				                  <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8606Data/RothIRAQlfyDisasterDistriAmt"/>
								</xsl:call-template>
                             </div>
                                <div class="styLNLeftNumBoxSD" style="padding-left:6mm;height:6mm;float:left;">c</div>
							<div class="styLNDesc" style="width:142mm;padding-left:2mm;height:6mm;float:left;padding-top:1mm">
						<b>Taxable amount.</b> Subtract line 25b from line 25a. If more than zero, also include this 
                                  amount on 2021 Form 1040, 1040-SR, or 1040-NR, line 4b.
						          <span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						     </div>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;font-size:7pt;height:8.5mm;padding-top:3.5mm;">25c</div>
							<div class="styLNAmountBox" style="width:29mm;border-bottom-width:0px;height:8.5mm;padding-top:3.5mm;font-size:6.5pt">
				                <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8606Data/TaxableIRADistributionAmt"/>
								</xsl:call-template>
                             </div>
                             
                              </div>
                             
                             
                             
                            <!-- <div class="styLNLeftNumBoxSD" style="padding-left:6mm;height:4mm;float:left;">b</div>
                             <div class="styLNDesc" style="width:142mm;padding-left:2mm;height:4.5mm;float:left;padding-bottom1mm;">
                                Enter the amount on line 25a attributable to qualified disaster distributions from Forms 8915A and 8915B (see instructions).   Also, enter this amount on 2019 Form 8915A, line 23,
                                 or 2019 Form 8915B, line 14, as applicable
                                <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
                                
                             </div>-->
                            <!-- <div class="styLNRightNumBox" style="border-bottom-width:1px;font-size:7pt;height:5.5mm;padding-top:4.5mm;">25b</div>
                             <div class="styLNAmountBox" style="width:29mm;border-bottom-width:1px;height:5.5mm;font-size:6.5pt;padding-bottom:7.5mm;">
				                  <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8606Data/RothIRAQlfyHrrcnDistriAmt"/>
								</xsl:call-template>
	                             </div>
                           -->
						         
						         
					     
					     
                    <!--     <div class="styLNLeftNumBoxSD" style="padding-left:6mm;height:4mm;float:left;">c</div>
                         <div class="styLNDesc" style="width:142mm;padding-left:2mm;height:3mm;float:left;">
                          <b>Taxable amount.</b> Subtract line 25b from line 25a. If more than zero, also include this 
                                  amount on 2019 Form 1040, line <b>15b;</b> 2019 Form 1040A, line <b>11b;</b> or 2019 Form 1040NR, line <b>16b</b>
                         </div>
                         <div class="styLNRightNumBox" style="border-bottom-width:0px;font-size:7pt;height:6.5mm;padding-top:3.5mm;">25c</div>
                         <div class="styLNAmountBox" style="width:29mm;border-bottom-width:0px;height:6.5mm;padding-top:3.5mm;font-size:6.5pt">
				                <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8606Data/TaxableIRADistributionAmt"/>
								</xsl:call-template>
								</div>
                         -->
                         
                        
							
						</div>				
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Signature																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div style="width:187mm;clear:all;">
						<div style="border-bottom:1px solid black;width:187mm">
							<div class="styIRS8606LNDesc" style="width:40mm;height:25mm;padding:0px 0px 0px 0px;border-right-width:1px;border-color:black;">
								<span class="styBoldText" style="font-size:9pt;padding:8px 0px 8px 0px;height:100%">
									Sign Here Only if You<br/>
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
						<div class="styGenericDiv" style="width:20mm;padding-top:4mm;float:left;clear:none;height:29.5mm;border-right:1px solid black">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;height:auto;">
								<!--<div class="styLNDesc" style="solid black;height:6mm;width:46.8mm;padding-top:0mm;border-right-width:1px; padding-left:3px;">-->
								<div class="styIRS8606leftBox" style="solid black;height:8mm;width:46.8mm;padding-top:0mm;border-right-width:1px; padding-left:3px;">
								Print/Type preparer's name<br/>
								                   <xsl:choose>
										                       <xsl:when test="($RtnHdrData/ReturnTypeCd='1040') or($RtnHdrData/ReturnTypeCd='1040A')  or ($RtnHdrData/ReturnTypeCd='1040NR') ">
										                          
       
                                                              </xsl:when>									               
										                      <xsl:otherwise>
										                          <xsl:call-template name="PopulateText">
										                             <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
										                             <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
									                                  </xsl:call-template>
								                              </xsl:otherwise>
								                      </xsl:choose>        
									
								</div>
								<!--<div class="styLNDesc" style="height:6mm;width:46.5mm;padding-top:0mm;border-left:1 solid black;padding-left:1mm;font-size:6pt;">-->
								<div class="styIRS8606leftBox" style="height:8mm;width:46.5mm;padding-top:0mm;border-right-width:1px; padding-left:1mm;font-size:6pt;">
								Preparer's signature
							</div>
								<div class="styIRS8606leftBox" style="height:8mm;width:15mm;border-right-width:1px;padding-top:0mm;padding-left:1mm;">Date <br/>
								
                                                  <xsl:choose>
		                                                 <xsl:when test="($RtnHdrData/ReturnTypeCd='1040') or($RtnHdrData/ReturnTypeCd='1040A')  or ($RtnHdrData/ReturnTypeCd='1040NR') ">
		                                                   
                                                         </xsl:when>									               
										                 <xsl:otherwise>     
										                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										                      <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
										                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
									                           </xsl:call-template>
										                 </xsl:otherwise>
								                  </xsl:choose>
									
								</div>
								
								<div class="styIRS8606leftBox" style="height:8mm;width:18mm;border-right-width:1px;padding-top:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationGrp/SelfEmployedInd</xsl:with-param>
										</xsl:call-template> Check 
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationGrp/SelfEmployedInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
                                        <xsl:choose>
		                                       <xsl:when test="($RtnHdrData/ReturnTypeCd='1040') or($RtnHdrData/ReturnTypeCd='1040A')  or ($RtnHdrData/ReturnTypeCd='1040NR') ">
		                                      				                               
                                             </xsl:when>									               
			                                 <xsl:otherwise>     
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
		                  						
								              
			                                 </xsl:otherwise>
			                            </xsl:choose>                            
                             
									
								</div>
							</div>
							<div  style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:108mm;border-right:1 solid black;">
									<span class="styGenericDiv" style="padding-left:3px;">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
									</span>
                       			    <xsl:choose>
		                                   <xsl:when test="($RtnHdrData/ReturnTypeCd='1040') or($RtnHdrData/ReturnTypeCd='1040A')  or ($RtnHdrData/ReturnTypeCd='1040NR') ">
		                                			
		                                      							
		                                      									                               
                                          </xsl:when>									               
			                              <xsl:otherwise>     
								          <div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
			                             </xsl:otherwise>
			                      </xsl:choose>
								</div>
								<div class="styIRS8606leftBox" style="height:6mm;width:32mm;padding-left:1mm;border-left-width:1px;">Firm's EIN
								<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/>
									         <xsl:choose>
		                                             <xsl:when test="($RtnHdrData/ReturnTypeCd='1040') or($RtnHdrData/ReturnTypeCd='1040A')  or ($RtnHdrData/ReturnTypeCd='1040NR') ">
                                                        
                                                   </xsl:when>									               
			                                       <xsl:otherwise>     
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
			                                       </xsl:otherwise>
			                                </xsl:choose>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styIRS8606leftBox" style="width:108mm;border-right-width:0px ;height:auto;border-left-width:0px;">
									<div class="styGenericDiv" style="padding-right:.5mm;padding-left:3px;">Firm's address 
									<img src="{$ImagePath}/8606_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									</div>
									
									<!--<div class="styGenericDiv" style="padding-right:.5mm;">-->
									          <xsl:choose>
		                                               <xsl:when test="($RtnHdrData/ReturnTypeCd='1040') or($RtnHdrData/ReturnTypeCd='1040A')  or ($RtnHdrData/ReturnTypeCd='1040NR') ">
		                 				               
		                 										                               
                                                      </xsl:when>									               
			                                          <xsl:otherwise>     
								         <div class="wordwrap"  style="padding-left:4mm;">
										
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
										</xsl:call-template>
										
										</div>
										<br/>
										<div class="wordwrap" style="padding-left:4mm">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
										</xsl:call-template>
										
										</div>
										<div class="wordwrap" style="padding-left:18mm;height:auto">
										       
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
										<div style="padding-left:0mm">
										         
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrStateNm</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
											</xsl:call-template>
											</div>
										</xsl:if>
										
									</div>
						                     
			                                          </xsl:otherwise>
			                                  </xsl:choose>
 									
									
									
									
																	</div>
								<div class="styIRS8606leftBox" style="width:52mm;padding-left:1mm;border-left-width:1px;height:15mm;"> Phone no. 
								          <xsl:choose>
		                                           <xsl:when test="($RtnHdrData/ReturnTypeCd='1040') or($RtnHdrData/ReturnTypeCd='1040A')  or ($RtnHdrData/ReturnTypeCd='1040NR') ">
		                                                			                               
                                                  </xsl:when>									               
			                                      <xsl:otherwise>     
								                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										                 <xsl:with-param name="TargetNode">Phone</xsl:with-param>
										                 <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
									                    </xsl:call-template>
									                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										                <xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										                <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
									                     </xsl:call-template>	
			                                     </xsl:otherwise>
			                           </xsl:choose>
                                    								
								
 								
								</div>
							</div>
					</div>
					</div>
					<!-- /////////////Footer///////////////////////////////////// -->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;text-align:right;display:block;page-break-after:always;">
						Form 		
						<span class="styBoldText" style="font-size:8pt;">8606</span> (2021)
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
