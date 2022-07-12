<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2008 rel. 2 (http://www.altova.com) by Mary Crawford (IRS) -->
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8880Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8880Data" select="$RtnDoc/IRS8880"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8880Data)"/>
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
				<meta name="Description" content="IRS Form 8880"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8880Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8880">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form title and Form number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;font-size:7pt;height:18mm;">
							<div style="height:8mm">
            Form<span class="styFormNumber"> 8880</span>
								<div class="styAgency" style="font-size:7.5pt;margin-top:2mm;">
								Department of the Treasury</div>
								<div class="styAgency" style="font-size:7.5pt;margin-top:0mm;"> Internal Revenue Service</div>
							</div>
						</div>
						<!-- Begin Form title -->
						<div class="styFTBox" style="width:123mm;height:14mm;">
							<div class="styMainTitle" style="font-size: 12pt">Credit for Qualified Retirement Savings Contributions
                            </div>
							<div class="styFBT" style="height:4mm;margin-top:5.5mm;">
								<img src="{$ImagePath}/8880_Bullet_Title.gif" alt="Arrow Bullet"/> Attach to Form 1040, Form 1040A, or Form 1040NR.
				   </div>
							<div class="styFBT" style="height:3mm;margin-top:0mm;">
								<img src="{$ImagePath}/8880_Bullet_Title.gif" alt="Arrow Bullet"/> See instructions on back.
                            </div>
						</div>
						<!-- Begin Form Tax Year -->
						<div class="styTYBox" style="width:33.9mm;height:18mm;">
							<div class="styOMB" style="line-height:10px;font-size:6pt;">OMB No. 1545-0074
							</div>
							<div class="styTY" style="font-size: 20pt; margin-top:0mm;">20<span class="styTYColor">10</span>
								<div class="stySequence" style="margin-top:0mm;height: 2mm;font-weight:normal;
	font-size: 7.5pt;">Attachment 
								<br/>Sequence No. <b>54</b>
                    </div>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!--Name Shown on return-->
					<div class="styBB" style="width:187mm;font-size:7pt;">
						<div class="styFNBox" style="width:140mm; height:8mm;">
                        Name(s) shown on return<br/>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
							</xsl:call-template>
							<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
						</div>
						<b>Your social security number</b>
						<br/>
						<br/>
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
						</xsl:call-template>
					</div>
					<!--Instructions-->
					<div class="styBB" style="width:187mm;padding-top:0mm;padding-bottom:0mm;border-bottom-width:0px;font-size:8pt;font-family:Arial;">
						<div class="styBB" style="width:15mm;height: 17mm;padding-top:4.3mm;padding-bottom:0mm;border-bottom-width:0px;">
							<img src="{$ImagePath}/8880_Caution2.gif" alt="Bullet"/>
						</div>
						<div class="styLNDesc" style="padding-left:3mm;padding-bottom:0mm;width:170mm;">
							<div style="font-size:9pt;font-family:Arial;">You<b> cannot </b> take this credit if
                        <b>  either</b> of the following applies.<br/>
							</div>
							<div class="styLNDesc" style="padding-left:0mm;padding-top:1mm;padding-bottom:0mm;width:165mm;">
								<img src="{$ImagePath}/8880_Bullet_Round.gif" alt="Arrow Bullet"/> 
							
                          The amount on Form 1040, line 38; Form 1040A, line 22; or Form 1040NR, line 37 is more than $27,750 ($41,625  if head of <br/>
                         household; $55,500 if married filing jointly).<br/>
								<br/>
								<img src="{$ImagePath}/8880_Bullet_Round.gif" alt="Arrow Bullet"/> 
						
                          The person(s) who made the qualified contribution or elective deferral 
                          <b>(a)</b> 
                          was born after January 1, 1993,  
                          <b>(b)</b> is claimed as a<br/> 
                           dependent on someone else's 2010 tax return, or
                           <b>(c)</b> was a  <b>student</b> (see instructions).<br/>
							</div>
						</div>
					</div>
					<!-- MAIN SECTION -->
					<!--Title You and Your Spouse-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;"/>
						<div class="styLNDesc" style="width:101mm;height:4mm;padding-top:0mm"/>
						<div class="styLNRightNumBox" style="width:6.5mm;height:4mm;padding-top:0mm;padding-bottom:0mm;border-left-width:1px;border-bottom-width:0px;border-top-width:2px;"/>
						<div class="styLNAmountBox" style="text-align:center;height:4mm;width:32.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom-width:0px;font-size:8pt;border-top-width:2px;border-right-width:1px;">
							<span class="styBoldText">(a) You</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:0mm;padding-bottom:0mm;border-left-width:0px;border-bottom-width:0px;border-top-width:2px;"/>
						<div class="styLNAmountBox" style="text-align:left;padding-top:0mm;padding-bottom:0mm;border-left-width:0px;height:4mm;border-bottom-width:0px;font-size:8pt;border-top-width:2px;width:30mm;">
							<span class="styBoldText"> (b) Your Spouse </span>
						</div>
					</div>
					<!--Line 1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;height:4mm;">1
                            </div>
						<div class="styLNDesc" style="width:101mm;height:4mm;padding-top:0mm;padding-bottom:0mm;font-size:8.5pt;font-family:Arial;">Traditional and Roth IRA contributions for 2010. 
                            <span class="styBoldText">Do not</span>  include rollover<br/>contributions
        			<!--Dotted Line-->
        			<span class="styDottedLine" style="padding-left:0mm;">................... </span>
							<!--<span class="styBoldText">
								<span style="width:4.5mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                      <span style="width:3.3mm"/>.   
                                     <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.         
                                     <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.                          
                                  </span>-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:1px;border-top-width:1px;padding-top:3.5mm;width:7mm;">1
                            </div>
						<div class="styLNAmountBox" style="height:8mm;width:32mm;border-left-width:0px;border-top-width:1px;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/PrimaryRothIRAForCurrentYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;border-left-width:1px;border-right-width:0px;border-top-width:1px;background:#B8B8B8;padding-top:3mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:8mm;width:32mm;border-left-width:1px;border-top-width:1px;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/SpouseRothIRAForCurrentYrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 2-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">2
                            </div>
						<div class="styLNDesc" style="width:101mm;height:4mm;padding-top:0mm;padding-bottom:0mm;font-size:8.5pt;font-family:Arial;">Elective deferrals to a 401(k) or other qualified employer plan, voluntary<br/>employee contributions, and 501(c)(18)(D) plan contributions for 2010<br/>(see instructions)
       			 <!--Dotted Line-->
       			 <span class="styDottedLine" style="padding-left:1.9mm;">................. </span>
       			 
							<!--<span class="styBoldText">
								<span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                      <span style="width:3.3mm"/>.   
                                     <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
								</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:1mm;border-right-width:1px;padding-top:6mm;width:7mm;">2
                            </div>
						<div class="styLNAmountBox" style="height:11mm;width:32mm;border-left-width:0px;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/PrimaryContributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;border-right-width:0px;border-left-	width:1px;border-left-width:1px;background:#B8B8B8;padding-top:6mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:11mm;width:32mm;border-left-width:1px;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/SpouseContributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 3-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">3
                            </div>
						<div class="styLNDesc" style="width:101mm;height:4mm;font-size:8.5pt;font-family:Arial;">Add lines 1 and 2
        			<!--Dotted Line-->
        			<span class="styDottedLine" style="padding-left:2.1mm;padding-right:.5mm;">................. </span>
						<!--<span class="styBoldText">
								<span style="width:3.5mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                      <span style="width:3.3mm"/>.   
                                     <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.

                                  </span>-->
						</div>
						<div class="styLNRightNumBox" style="height:5mm;mm;border-right-width:1px;padding-top:1mm;width:7mm;">3
                            </div>
						<div class="styLNAmountBox" style="height:5mm;width:32mm;border-left-width:0px;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/AddPrimRothIRAToCYContriAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;border-right-width:0px;border-left-width:1px;border-left-width:1px;background:#B8B8B8;padding-top:1mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:5mm;width:32mm;border-left-width:1px;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/AddSpRothIRAToCYContriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 4-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">4
                            </div>
						<div class="styLNDesc" style="width:101mm;height:4mm;padding-top:0mm;padding-bottom:0mm;font-size:8.5pt;font-family:Arial;">
                            Certain distributions received <span class="styBoldText">after</span> 2007 and 
                            <span class="styBoldText">before</span> the due date<br/>
                            (including extensions) of your 2010 tax return (see instructions). If<br/>
                             married filing jointly, include  <span class="styBoldText">both</span> spouses' amounts in 
                             <span class="styBoldText">both</span> columns.<br/>
                             See instructions for an exception
        		    <!--Dotted Line-->
        		    <span class="styDottedLine" style="padding-left:1.5mm;">.............</span>
        		    
							<!--<span class="styBoldText">
								<span style="width:2.5mm"/>.
                                    <span style="width:3.3mm"/>.
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                      <span style="width:3.3mm"/>.    
                                      <span style="width:3.3mm"/>.
                                   
                                   </span>-->
						</div>
						<div class="styLNRightNumBox" style="height:16mm;mm;border-right-width:1px;padding-top:11mm;width:7mm;">4
                            </div>
						<div class="styLNAmountBox" style="height:16mm;width:32mm;border-left-width:0px;padding-top:11mm;
						width:">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/PrimTaxableDistributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:16mm;border-left-width:1px;border-right-width:0px;border-left-width:1px;background:#B8B8B8;padding-top:11mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:16mm;width:32mm;border-left-width:1px;padding-top:11mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/SpsTaxableDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 5-->
					<div style="width:187mm;float:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">5
                            </div>
						<div class="styLNDesc" style="width:101mm;height:4mm;font-size:8.5pt;font-family:Arial;">Subtract line 4 from line 3. If zero or less, enter -0-
                   <!--Dotted Line-->
                   <span class="styDottedLine" style="padding-left:3.5mm;">...... </span>
                   
							<!--<span class="styBoldText">
								<span style="width:1.9mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                </span>-->
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;mm;border-right-width:1px;padding-top:1mm;width:7mm;">5
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;width:32mm;border-left-width:0px;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CalculatePrimDistribFromTotAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5.5mm;border-right-width:0px;border-left-width:1px;background:#B8B8B8;padding-top:1mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:5.5mm;width:32mm;border-left-width:1px;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CalculateSpsDistribFromTotAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 6-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">6
                            </div>
						<div class="styLNDesc" style="width:101mm;height:4mm;font-size:8.5pt;font-family:Arial;">In each column, enter the  
                            <span class="styBoldText">smaller</span>  of line 5 or $2,000
                      <!--Dotted Line-->
                      <span class="styDottedLine" style="padding-left:3.8mm;">..... </span>
                      
							<!--<span class="styBoldText">
								<span style="width:4.7mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                </span>-->
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;mm;border-right-width:1px;padding-top:1mm;width:7mm;">6
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;width:32mm;border-left-width:0px;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/PrimSmallerOfCalculationAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5.5mm;border-right-width:0px;border-left-width:1px;background:#B8B8B8;padding-top:1mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:5.5mm;width:32mm;border-left-width:1px;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/SpsSmallerOfCalculationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 7-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">7
                            </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;font-size:8.5pt;font-family:Arial;">Add the amounts on line 6. If zero, 
                            <span class="styBoldText">stop</span>; you cannot take this credit
       		 <!--Dotted Line-->
       		 <span class="styDottedLine" style="padding-left:1mm;">........... </span>
       		 
       		 						<!--<span class="styBoldText">
								<span style="width:4.2mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                      <span style="width:3.3mm"/>.   
                                     <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                </span>-->
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;mm;border-right-width:0px;padding-top:1mm;width:7mm;">7
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;width:32mm;border-left-width:1px;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/TotalCalculatedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 8-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">8
                            </div>
						<div class="styLNDesc" style="width:101mm;height:4mm;padding-top:0mm;padding-bottom:0mm;font-size:8.5pt;font-family:Arial;">Enter the amount from Form 1040, line 38*; Form 1040A, line 22; or
                            <br/> Form 1040NR, line 37 
                      <!--Dotted Line-->
                      <span class="styDottedLine" style="padding-left:.4mm;">................ </span>
                      
							<!--<span class="styBoldText">
								<span style="width:2.1mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                      <span style="width:3.3mm"/>.   
                                     <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.                                     
                                </span>-->
						</div>
						<div style="float:left;width:39mm;">
							<!-- Container -->
							<div class="styLNRightNumBoxNBB" style="height:2mm;mm;padding-top:0mm;width:7mm; border-left-width:0px;">
                            </div>
							<div class="styLNAmountBoxNB" style="height:2mm;width:32mm;border-left-width:0px;padding-top:0mm;clear:right;"/>
							<div class="styLNRightNumBox" style="height:2mm;border-right-width:1px;padding-top:0mm;width:7mm;float:left;">8
                            </div>
							<div class="styLNAmountBox" style="height:2mm;width:32mm;border-left-width:0px;padding-top:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8880Data/AGIFromTaxReturnAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--End of container -->
						<div class="styLNRightNumBoxNBB" style="height:8mm;border-right-width:0px;border-left-width:1px;background:#B8B8B8;padding-top:2mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;padding-top:2mm;border-bottom-width:0px;"/>
					</div>
					<!--Line 9-->
					<div style="width:187mm;padding-bottom:0mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0px;padding-bottom:0mm;height:4mm;">9
                            </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;padding-bottom:0mm;font-size:8.5pt;font-family:Arial;padding-top:0px;">Enter the applicable decimal amount shown below:
                           </div>
						<!--<div class="styLNRightNumBoxNBB" style="height:4mm;border-left-width:0px;padding-top:1mm;padding-bottom:0mm;"/>
						<div class="styLNAmountBoxNB" style="height:4mm;padding-top:1mm;padding-bottom:0mm;border:1px solid red;"/>-->
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;border-left-width:1px;background:#B8B8B8;padding-top:0px;padding-bottom:0px;width:7mm;"/>
						<div class="styLNAmountBox" style="height:4mm;width:32mm;border-left-width:1px;border-bottom-width:0px;padding-top:0px;padding-bottom:0px;"/>
					</div>
					<div style="height:57mm;width:187mm;">
						<!--Start Table Header top line-->
						<div style="width:142.6mm;padding-left:8mm;float:left;clear:none;">
							<table class="styTable" id="IRS8880Table" summary="Decimal Table" cellspacing="0" cellpadding="0" style="width:135mm;font-size:7pt;border-style:solid;border-color:black;border-right-width:1px;border-bottom-width:1px;border-left-width:1px;border-top-width:1px;">
								<thead>
									<tr>
										<th class="styIRS8880TheadCellPt0" colspan="2" style="text-align:center;font-size:8pt;border-bottom:1px solid black;border-right:1px solid black;" scope="col">
											<b>If line 8 is&#151;</b>
										</th>
										<th class="styIRS8880TheadCellPt1" scope="col" colspan="3" style="font-size:8pt;border-bottom:1px solid black;">
											<b>And your filing status is&#151;</b>
										</th>
									</tr>
									<!--Start Table Header second line-->
									<tr valign="middle" style="height:9mm;">
										<th class="styLimitationHeading" rowspan="2" scope="col" style="border-bottom:1px solid black;border-right:1px solid black;">
							
                           Over&#151;  
								 </th>
										<th class="styLimitationHeading" scope="col" rowspan="2" style="border-bottom:1px solid black;border-right:1px solid black; ">
							   But not <br/>
								over&#151;
                            </th>
										<th class="styFSHeading" style="border-right:1px solid black;" scope="col">									Married 
								<br/> filing jointly                           
                           </th>
										<th class="styFSHeading" scope="col">									Head of    
								<br/> household                           
                           </th>
										<th class="styFSHeading" rowspan="2" scope="col" style="border-left:1px solid black; border-bottom:1px solid black;">
 	                  Single, Married filing    
								<br/> separately, or   <br/> Qualifying widow(er)                          
                           </th>
										
									</tr>
									<tr valign="middle" style="height:3mm;padding-bottom:.5mm;">
									
										<th scope="col" colspan="2" style=" border-bottom:1px solid black; text-align:center;height:2mm; ">
						
											<b>Enter on line 9&#151;</b>
										
										</th>
					
									</tr>
								</thead>
								<!--END Table Header-->
								<!--Start table Data-->
								<tr class="styDataCell">
									<td style="border-right:1px solid black;">  --- </td>
									<td style="border-right:1px solid black;"> $16,750</td>
									<td>.5</td>
									<td>.5 </td>
									<td>.5 </td>
			
								</tr>
								<tr class="styDataCell">
									<td style="border-right:1px solid black;">$16,750 </td>
									<td style="border-right:1px solid black;"> $18,000</td>
									<td> .5</td>
									<td>.5</td>
									<td>.2</td>
								
								</tr>
								<tr class="styDataCell">
									<td style="border-right:1px solid black;">$18,000</td>
									<td style="border-right:1px solid black;">$25,125</td>
									<td> .5</td>
									<td>.5</td>
									<td>.1</td>
								
								</tr>
								<tr class="styDataCell">
									<td style="border-right:1px solid black;"> $25,125	</td>
									<td style="border-right:1px solid black;">$27,000</td>
									<td> .5</td>
									<td>.2</td>
									<td> .1</td>
							
								</tr>
								<tr class="styDataCell">
									<td style="border-right:1px solid black;">  $27,000 </td>
									<td style="border-right:1px solid black;">$27,750</td>
									<td>.5</td>
									<td> .1</td>
									<td>.1</td>
	
								</tr>
								<tr class="styDataCell">
									<td style="border-right:1px solid black;">$27,750 </td>
									<td style="border-right:1px solid black;">$33,500</td>
									<td>.5</td>
									<td> .1</td>
									<td> .0 </td>
			
								</tr>
								<tr class="styDataCell">
									<td style="border-right:1px solid black;">$33,500 </td>
									<td style="border-right:1px solid black;">$36,000</td>
									<td>.2</td>
									<td> .1 </td>
									<td> .0 </td>
	
								</tr>
								<tr class="styDataCell">
									<td style="border-right:1px solid black;">$36,000 </td>
									<td style="border-right:1px solid black;">$41,625</td>
									<td>.1</td>
									<td>.1</td>
									<td> .0</td>
	
								</tr>
								<tr class="styDataCell">
									<td style="border-right:1px solid black;">$41,625	</td>
									<td style="border-right:1px solid black;">$55,500</td>
									<td> .1</td>
									<td> .0 </td>
									<td> .0 </td>
	
								</tr>
								<tr class="styDataCell">
									<td style="border-right:1px solid black;">$55,500	</td>
									<td style="border-right:1px solid black;"> ---</td>
									<td>.0</td>
									<td>.0</td>
									<td> .0 </td>

								</tr>
							</table>
						</div>
						<!-- End of table -->
						<!-- gray shading cell and line 9 amount line -->
						<div style="height:57mm;width:43mm;padding-left:5mm;float:left;">
							<div class="styLNRightNumBoxNBB" style="height:28mm;border-right-width:0px;border-left-
                         width:1px;background:#B8B8B8;width:7mm;"/>
							<div class="styLNAmountBox" style="height:28mm;border-left-width:1px;border-bottom-width:0px;width:30mm;"/>
							<div class="styLNRightNumBox" style="height:6mm;border-right-width:0px;padding-top:1mm;width:6.9mm;float:left;clear:left;">9
                            </div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:1px;padding-top:1mm;width:30mm;">
								<span class="styBoldText" style="font-size:10pt.">X.</span>
								<span style="width:1mm"/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8880Data/QlfdRetirementSavDecimalAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:26mm;border-right-width:0px;border-left-
                         width:1px;background:#B8B8B8;width:7mm;"/>
							<div class="styLNAmountBox" style="height:26mm;width:30mm;border-left-width:1px;border-bottom-width:0px;"/>
						</div>
					</div>
					<!--Note at bottom of table-->
					<div style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="height:2mm;font-size:8pt;"/>
						<div class="styLNDesc" style="width:101mm;height:2mm;font-size:7pt;padding-top:0mm;padding-left:2mm;">
							<span style="width:25mm"/>
							<b>Note:</b>
							<i> If line 9 is zero, <b>stop</b>; you cannot take this credit. </i>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:2mm;mm;border-left-width:0px;padding-top:0mm;width:7mm;"/>
						<div class="styLNAmountBoxNB" style="height:2mm; width:32mm;padding-top:0mm;"/>
						<div class="styLNRightNumBoxNBB" style="height:5mm;border-right-width:0px;border-left-width:1px;background:#B8B8B8;padding-top:0mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:5mm;width:32mm;border-left-width:1px;border-bottom-width:0px;"/>
					</div>
					<!--line 10-->
					<div style="width:187mm; height:4mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">10
                            </div>
						<div class="styLNDesc" style="width:140mm;height:5mm;font-size:8.5pt;font-family:Arial;">
                 Multiply line 7 by line 9
       		 <!--Dotted Line-->
       		 <span class="styDottedLine" style="padding-left:3.5mm;">......................... </span>
       		 
							<!--<span class="styBoldText">
								<span style="width:2mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                      <span style="width:3.3mm"/>.   
                                     <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                </span>-->
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;padding-top:1mm;width:6.8mm;">10
                            </div>
						<div class="styLNAmountBox" style="height:5mm;width:32mm;border-left-width:1px;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CalculatedAmtByDecimalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 11-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;padding-top:0mm;">11
                            </div>
						<div class="styLNDesc" style="width:101mm;height:4mm;font-size:8.5pt;font-family:Arial;padding-bottom:0mm;padding-top:0mm;">Enter the amount from Form 1040, line 46; Form 1040A, line 28; or<br/>
                            Form 1040NR, line 44 
        			<!--Dotted Line-->
        			<span class="styDottedLine" style="padding-left:.6mm;">................ </span>
        			
							<!--<span class="styBoldText">
								<span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                      <span style="width:3.3mm"/>.   
                                     <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.  
                                      <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                  </span>-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;border-right-width:0px;padding-top:3mm;width:7mm;">11
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:32mm;width:32.3mm;border-right-width:1px;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/TaxFromTaxReturnAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;border-left-width:0px;background:#B8B8B8;padding-top:3mm;width:6.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;border-left-width:1px;padding-top:3mm;border-bottom-width:0px;width:32mm;"/>
					</div>
					<!--Line 12-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:6mm;padding-left:2mm;padding-bottom:1.5px;padding-top:0px;">12
              </div>
						<div class="styLNDesc" style="width:95mm;font-size:8.5pt;font-family:Arial;color:black;">
							<span class="styBoldText" style="width:21mm">1040 filers:</span>
							Enter the total of your credits from lines 47 through 49;<br/>
							<span style="width:21.5mm"/> and Schedule R, line 22.<br/>
							
							<span class="styBoldText" style="width:21mm">1040A filers:</span>
							Enter the total of your credits from lines 29 through 31.<br/>
							
							<span class="styBoldText" style="width:21mm">1040NR filers:</span>
							Enter the total of your credits from lines 45 and 46.	<br/>
							
						</div>
						<div class="styLNDesc" style="width:6mm;height:4mm;padding-top:.5mm;">
							<span style="text-align:left;">
								<img src="{$ImagePath}/8880_Bracket_X_Lg2.gif" align="top" alt=""/>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:16mm;border-right-width:0px;padding-top:12mm;width:7mm;">12
             </div>
						<div class="styLNAmountBox" style="height:16mm;width:32mm;border-right-width:0px;padding-top:12mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CreditsFromTaxReturnAmt"/>
							</xsl:call-template>
						</div>

						
						<div class="styLNRightNumBoxNBB" style="height:17mm;border-right-width:0px;border-left-width:1px;background:#B8B8B8;padding-top:6mm;width:6.9mm;"/>
						<div class="styLNAmountBox" style="height:17mm;width:32mm;border-left-width:1px;border-bottom-width:0px;padding-top:6mm;"/>
						
					</div>
					<!--Line 13-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:2mm;">13
                            </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;font-size:8.5pt;font-family:Arial;">
                 Subtract line 12 from line 11. If zero, <span class="styBoldText">stop; </span> you cannot take this credit
       		 <!--Dotted Line-->
       		 <span class="styDottedLine" style="padding-left:1.9mm;">.......... </span>
							
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-right-width:0px;padding-top:.5mm;width:6.9mm;">13
                            </div>
						<div class="styLNAmountBox" style="height:4mm;width:32mm;border-left-width:1px;padding-top:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CalculatedCreditsFromTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 14-->
					<div class="styBB" style="width:187mm;padding-bottom:0mm;height:7mm;float:left;clear:none;border-bottom-width:0px;">
						<div class="styLNLeftNumBox" style="height:6mm;padding-bottom:0mm;padding-left:2mm;">14
                            </div>
						<div class="styLNDesc" style="width:140mm;height:6mm;padding-bottom:0mm;font-size:8.5pt;font-family:Arial;">
							<span class="styBoldText">Credit for qualified retirement savings contributions.  </span> Enter the 
                 <span class="styBoldText">smaller </span>of line 10 or line 13<br/> here and on Form 1040, line 50; Form 1040A, line 32; or Form 1040NR, line 47
       		 <!--Dotted Line-->
       		  <span class="styDottedLine" style="padding-left:3.9mm;">...... </span>
       		  
							<!--<span class="styBoldText">
								<span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                     <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                    <span style="width:3.3mm"/>.
                                </span>-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:0px;padding-top:4mm;width:6.9mm;padding-bottom:0mm;">14
                            </div>
						<div class="styLNAmountBox" style="height:8mm;width:32mm;border-left-width:1px;padding-top:4mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CrQualifiedRetirementSavAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Instructions See pub-->
					<div style="width:187mm;padding-top:0mm;height:3mm;">
						<div class="styLNLeftNumBox" style="height:3mm;padding-top:0mm;">
                            </div>
						<div class="styLNDesc" style="width:176mm;height:4mm;padding-bottom:0mm;font-size:7.5pt;font-family:Arial;">      
    * See Pub. 590 for the amount to enter if you are filing Form 2555, 2555-EZ, or 
      4563 or you are excluding income from Puerto Rico.
    </div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm;border-top:1px solid black;font-size:7.5pt;">
						<div style="float:left;">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions. </b>
							<span style="width:20mm;"/>
							<span style="font-size:6pt;">     
         Cat. No. 33394D</span>
          <span style="width:20mm;"/><span style="font-size:6pt;" >
          Form </span> <span class="styBoldText">8880</span> <span style="font-size:6pt;" >(2010)</span>
        </div>
					</div>
					<!--<br class="pageEnd"/>-->
					<!--END Page Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8880Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
