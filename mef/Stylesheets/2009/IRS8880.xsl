<?xml version="1.0" encoding="UTF-8"?>
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
	<div class="styFNBox" style="width:30mm;font-size:7pt;height:16mm;">
	<div style="height:8mm">
            Form<span class="styFormNumber"> 8880</span>
<div class="styAgency" style="font-size:6pt;margin-top:0mm;">
								Department of the Treasury</div>
    <div class="styAgency" style="font-size:6pt;margin-top:0mm;"> Internal Revenue Service</div>  </div>
						</div>
						<!-- Begin Form title -->
						<div class="styFTBox" style="width:123mm;height:14mm;">
							<div class="styMainTitle" style="font-size: 12pt">Credit for Qualified Retirement Savings Contributions
                            </div>
							<div class="styFBT" style="height:4mm;margin-top:1mm;">
								<img src="{$ImagePath}/8880_Bullet_Title.gif" alt="Arrow Bullet"/> Attach to Form 1040, Form 1040A, or Form 1040NR.
				   </div>
							<div class="styFBT" style="height:3mm;margin-top:0mm;">
								<img src="{$ImagePath}/8880_Bullet_Title.gif" alt="Arrow Bullet"/> See instructions on back.
                            </div>
						</div>
						<!-- Begin Form Tax Year -->
						<div class="styTYBox" style="width:30mm;height:16mm;">
							<div class="styOMB" style="line-height:10px;font-size:6pt;">OMB No. 1545-0074
                    </div>
							<div class="styTY" style="font-size: 20pt; margin-top:0mm;">20<span class="styTYColor">09</span>
								<div class="stySequence" style="margin-top:0mm;height: 2mm;
	font-size: 6pt;">Attachment <br/>Sequence No. 54
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
                        <b>Your social security number</b><br/>
						<br/>
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
						</xsl:call-template>
					</div>
					<!--Instructions-->
					<div class="styBB" style="width:187mm;padding-top:1mm;font-size:7pt;">
						<div class="styBB" style="width:15mm; border-bottom-width: 0px;height: 17mm;padding-top:1mm;font-size:7pt;">
							<img src="{$ImagePath}/8880_Caution.gif" alt="Bullet"/>
						</div>                       
                        You<span class="styBoldText"> cannot </span> take this credit if
                        <span class="styBoldText">  either</span> of the following applies.<br/>
						<img src="{$ImagePath}/8880_Bullet_Round.gif" alt="Arrow Bullet"/> 
                          The amount on Form 1040, line 38; 
                          Form 1040A, line 22; or Form 1040NR, line 36 is more than $27,750 ($41,625 <br/>
                          if head of household; $55,500 if married filing jointly).<br/>
						<img src="{$ImagePath}/8880_Bullet_Round.gif" alt="Arrow Bullet"/> 
                          The person(s) who made the qualified contribution or elective deferral 
                          <span class="styBoldText">(a)</span> 
                          was born after January 1, 1992,  
                          <span class="styBoldText">(b)</span> is<br/> 
                          claimed as a dependent on someone else's 2009 tax return, or
                           <span class="styBoldText">(c)</span> was a  <span class="styBoldText">student</span> (see instructions).<br/>
					</div>
					<!-- MAIN SECTION -->
					<div style="width:187mm;">
					<div class="styLNDesc" style="width:187mm;height:4mm;"><i><b>Before you begin: </b></i>Figure the amount of any credit for the elderly or the disabled you are claiming on Form 1040, line 53.
							</div>
					</div>
					
					<!--Title You and Your Spouse-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:97.5mm;height:4mm;padding-top:1mm;">
							<span style="width:16px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:1mm;border-left-width:0px;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="text-align:center;width:32mm;height:4mm;padding-top:1mm;border-bottom-width:0px;font-size:8pt;border-top-width:1px;">
							<span class="styBoldText">(a) You</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:1mm;border-left-width:0px;border-bottom-width:0px;border-top-width:1px;"/>
						<div class="styLNAmountBox" style="text-align:center;padding-top:1mm;border-left-width: 0px;width:32mm;height:4mm;border-bottom-width:0px;font-size:8pt;border-top-width:1px;">
							<span class="styBoldText"> (b) Your Spouse </span>
						</div>
					</div>
					<!--Line 1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">1
                            </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;font-size:7pt;">Traditional and Roth IRA contributions for 2009. 
                            <span class="styBoldText">Do not</span>  include rollover<br/>contributions
        			<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:10px"/>.
                                  </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:1px;border-top-width:1px;padding-top:3mm;width:7mm;">1
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:0px;border-top-width:1px;width:33mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/PrimaryRothIRAForCurrentYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;border-right-width:0px;border-top-width:1px;background:lightgrey;padding-top:3mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;border-top-width:1px;width:33mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/SpouseRothIRAForCurrentYrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 2-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">2
                            </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;font-size:7pt;">Elective deferrals to a 401(k) or other qualified employer plan, voluntary<br/>employee contributions, and 501(c)(18)(D) plan contributions for 2009<br/>(see instructions)
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                      <span style="width:16px"/>.   
                                     <span style="width:16px"/>.  
                                      <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                      <span style="width:12px"/>.
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:1mm;border-right-width:1px;padding-top:6mm;width:7mm;">2
                            </div>
						<div class="styLNAmountBox" style="height:11mm;border-left-width:0px;width:33mm;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/PrimaryContributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;border-right-width:0px;border-left-	width:1px;background:lightgrey;padding-top:6mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:11mm;border-left-width:1px;width:33mm;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/SpouseContributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 3-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">3
                            </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;font-size:7pt;">Add lines 1 and 2
        			<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                     <span style="width:14px"/>.

                                  </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;mm;border-right-width:1px;padding-top:1mm;width:7mm;">3
                            </div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:0px;width:33mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/AddPrimRothIRAToCYContriAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;border-right-width:0px;border-left-width:1px;background:lightgrey;padding-top:1mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:33mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/AddSpRothIRAToCYContriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 4-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">4
                            </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;font-size:7pt;">
                            Certain distributions received <span class="styBoldText">after</span> 2006 and 
                            <span class="styBoldText">before</span> the due date<br/>
                            (including extensions) of your 2009 tax return (see instructions). If<br/>
                             married filing jointly, include  <span class="styBoldText">both</span> spouses' amounts in 
                             <span class="styBoldText">both</span> columns.<br/>
                             See instructions for an exception
        		    <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                      <span style="width:16px"/>.
                                       <span style="width:4px"/>.
                                   </span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;mm;border-right-width:1px;padding-top:9mm;width:7mm;">4
                            </div>
						<div class="styLNAmountBox" style="height:14mm;border-left-width:0px;width:33mm;padding-top:9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/PrimTaxableDistributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;border-right-width:0px;border-left-width:1px;background:lightgrey;padding-top:9mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:14mm;border-left-width:1px;width:33mm;padding-top:9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/SpsTaxableDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 5-->
					<div style="width:187mm;float:">
						<div class="styLNLeftNumBox" style="height:4mm;">5
                            </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;font-size:7pt;">Subtract line 4 from line 3. If zero or less, enter -0-
                   <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:17px"/>. 
                                    <span style="width:17px"/>.           
                                </span>
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;mm;border-right-width:1px;padding-top:1mm;width:7mm;">5
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;border-left-width:0px;width:33mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CalculatePrimDistribFromTotAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5.5mm;border-right-width:0px;border-left-width:1px;background:lightgrey;padding-top:1mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:5.5mm;border-left-width:1px;width:33mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CalculateSpsDistribFromTotAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 6-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">6
                            </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;font-size:7pt;">In each column, enter the  
                            <span class="styBoldText">smaller</span>  of line 5 or $2,000
                      <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.  
                                      <span style="width:15px"/>.              
                                </span>
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;mm;border-right-width:1px;padding-top:1mm;width:7mm;">6
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;border-left-width:0px;width:33mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/PrimSmallerOfCalculationAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5.5mm;border-right-width:0px;border-left-width:1px;background:lightgrey;padding-top:1mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:5.5mm;border-left-width:1px;width:33mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/SpsSmallerOfCalculationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 7-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">7
                            </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;font-size:7pt;">Add the amounts on line 6. If zero, 
                            <span class="styBoldText">stop</span>; you cannot take this credit
       		 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
					   <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
					   <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
                                      <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    

                                </span>
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;mm;border-right-width:0px;padding-top:1mm;width:7mm;">7
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;border-left-width:1px;width:33mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/TotalCalculatedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 8-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">8
                            </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;font-size:7pt;">Enter the amount from Form 1040, line 38*; Form 1040A, line 22; or
                            <br/> Form 1040NR, line 36 
                      <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.    
                                      <span style="width:16px"/>.
                                    <span style="width:16px"/>.  
                                      <span style="width:16px"/>.
                                    <span style="width:16px"/>.  
                                      <span style="width:16px"/>.  
                                      <span style="width:16px"/>.
                                    <span style="width:16px"/>.  
                                    <span style="width:12px"/>.                                          
                                </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;mm;border-right-width:1px;padding-top:2mm;width:7mm;">8
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:0px;width:33mm;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/AGIFromTaxReturnAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;border-right-width:0px;border-left-width:1px;background:lightgrey;padding-top:2mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;width:33mm;padding-top:2mm;border-bottom-width:0px;"/>
					</div>
					<!--Line 9-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">9
                            </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;font-size:7pt;">Enter the applicable decimal amount shown below:
                           </div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;mm;border-left-width:0px;padding-top:1mm;"/>
						<div class="styLNAmountBoxNB" style="height:5mm; width:32mm;padding-top:1mm;"/>
						<div class="styLNRightNumBoxNBB" style="height:6mm;border-right-width:0px;border-left-width:1px;background:lightgrey;padding-top:1mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:6mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
					</div>
					<!--Start Table Header top line-->
					<table class="styTable" id="IRS8880Table" summary="Decimal Table" cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr valign="middle" style="height:7mm;">
					<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;" scope="col"/>
							<th class="styIRS8880TheadCellPt0" style=" border-right-width:0px;border-bottom-width:0px;" scope="col">
								<span class="styBoldText">If line 8 is&#151;
                           </span>
							</th>
							<th class="styIRS8880TheadCellPt1" scope="col">
								<span class="styBoldText">And your filing status is&#151;
                           </span>
							</th>
							<th class="styIRS8880TheadCell" scope="col">
								<span style="width:4.7mm"/>
							</th>
							<th class="styIRS8880grayCell" scope="col">
								<div class="styLNRightNumBoxNBB" style="height:8mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;padding-top:1mm;width:7mm;"/>
								<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
					</table>
					<!--Start Table Header second line-->
					<table class="styTable" id="IRS8880Table" summary="Decimal Table" cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr valign="middle" style="height:9mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880TheadCellPt0" style=" border-right-width:0px;border-bottom-width:0px;" scope="col">
                           Over&#151;  
                           <span style="width:6mm;"/>But not <br/>
								<span style="width:15mm;"/>over&#151;
                            </th>
							<th class="styIRS8880TheadCellPt3" style=" border-bottom-width:0px;" scope="col">Married     <span class="styBoldText"/>
								<br/> filing jointly                           
                           </th>
							<th class="styIRS8880TheadCellPt3" style=" border-bottom-width:0px; " scope="col">Head of    <span class="styBoldText"/>
								<br/> household                           
                           </th>
							<th class="styIRS8880TheadCellPt0" style=" width:35mm;border-bottom-width:0px;" scope="col">
 	                  Single, Married filing    <span class="styBoldText"/>
								<br/> separately, or   <br/> Qualifying widow(er)                          
                           </th>
							<th class="styIRS8880TheadCell" scope="col">
								<span style="width:4.7mm"/>
							</th>
							<th class="styIRS8880grayCell" scope="col">
								<div class="styLNRightNumBoxNBB" style="height:9.8mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;padding-top:1mm;width:7mm;"/>
								<div class="styLNAmountBox" style="height:9.88mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
					</table>
					<table class="styTable" id="IRS8880Table" summary="Decimal Table" cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr valign="middle" style="height:2mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:7pt;"/>
							<th class="styIRS8880TheadCellPt0" style=" border-right-width:1px;border-bottom-width:1px;border-top-width: 0px;height:2mm ">
								<span style="width:16px"/>
								<span style="width:32px"/>
							</th>
							<th class="styIRS8880LargeCell" style=" border-bottom-width:1px; height:2mm">
								<span style="width:23mm"/>
								<span class="styBoldText">Enter on line 9&#151;</span>
								<span style="width:32px"/>
							</th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.7mm"/>
							</th>
							<th class="styIRS8880grayCell">
								<div class="styLNRightNumBoxNBB" style="height:2mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;width:7mm;"/>
								<div class="styLNAmountBox" style="height:3mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
					</table>
					<!--END Table Header-->
					<!--Start table Data-->
					<table class="styTable" id="IRS8880Table" summary="Decimal Table" cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr valign="middle" style="height:3mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880NumberCellPt0">
								<span style="width:8mm"/> 
                             ---
                         <span style="width:8mm"/>
                         $16,500
                        </th>
							<th class="styIRS8880NumberCellPt1">
								<span style="width:15mm"/> .5
                       <span style="width:29mm"/> .5
 			    <span style="width:27mm"/> .5

                       </th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.4mm"/>
							</th>
							<th class="styIRS8880grayCell" style=" border-top-width:0px;">
								<div class="styLNRightNumBoxNBB" style="height:2mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;width:7mm;"/>
								<div class="styLNAmountBox" style="height:2mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
						<tr valign="middle" style="height:3mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880NumberCellPt0">
								<span style="width:3mm"/> 
                             $16,500 
                         <span style="width:5mm"/>
                         $18,000
                        </th>
							<th class="styIRS8880NumberCellPt1">
								<span style="width:15mm"/> .5
                              <span style="width:29mm"/> .5
 			          <span style="width:27mm"/> .2

                       </th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.7mm"/>
							</th>
							<th class="styIRS8880grayCell" style=" border-top-width:0px;">
								<div class="styLNRightNumBoxNBB" style="height:2mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;width:7mm;"/>
								<div class="styLNAmountBox" style="height:2mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
						<tr valign="middle" style="height:3mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880NumberCellPt0">
								<span style="width:3mm"/> 
                             $18,000 
                         <span style="width:5mm"/>
                         $24,750
                        </th>
							<th class="styIRS8880NumberCellPt1">
								<span style="width:15mm"/> .5
                              <span style="width:29mm"/> .5
 			          <span style="width:27mm"/> .1
                       </th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.4mm"/>
							</th>
							<th class="styIRS8880grayCell" style=" border-top-width:0px;">
								<div class="styLNRightNumBox" style="height:5.5mm;border-right-width:0px;padding-top:1mm;width:7mm;">9
                            </div>
								<div class="styLNAmountBox" style="height:5.5mm;border-left-width:1px;width:33mm;padding-top:1mm;">
								<span class="styBoldText" style="font-size:10pt.">X</span>	<span style="width:1mm"/> 
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8880Data/QlfdRetirementSavDecimalAmt"/>
									</xsl:call-template>
								</div>
							</th>
						</tr>
						<tr valign="middle" style="height:3mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880NumberCellPt0">
								<span style="width:3mm"/> 
                                 $24,750
                         <span style="width:5mm"/>
                         $27,000
              </th>
							<th class="styIRS8880NumberCellPt1">
								<span style="width:15mm"/> .5
                              <span style="width:29mm"/> .2
 			          <span style="width:27mm"/> .1

                       </th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.4mm"/>
							</th>
							<th class="styIRS8880grayCell" style=" border-top-width:0px;">
								<div class="styLNRightNumBoxNBB" style="height:2mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;width:7mm;"/>
								<div class="styLNAmountBox" style="height:2mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
						<tr valign="middle" style="height:3mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880NumberCellPt0">
								<span style="width:3mm"/> 
                                $27,000
                         <span style="width:5mm"/>
                         $27,750
                        </th>
							<th class="styIRS8880NumberCellPt1">
								<span style="width:15mm"/> .5
                              <span style="width:29mm"/> .1
 			          <span style="width:27mm"/> .1

                       </th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.4mm"/>
							</th>
							<th class="styIRS8880grayCell" style=" border-top-width:0px;">
								<div class="styLNRightNumBoxNBB" style="height:2mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;width:7mm;"/>
								<div class="styLNAmountBox" style="height:2mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
						<tr valign="middle" style="height:3mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880NumberCellPt0">
								<span style="width:3mm"/> 
                           $27,750
                         <span style="width:5mm"/>
                         $33,000
                        </th>
							<th class="styIRS8880NumberCellPt1">
								<span style="width:15mm"/> .5
                              <span style="width:29mm"/> .1
 			          <span style="width:27mm"/> .0

                       </th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.4mm"/>
							</th>
							<th class="styIRS8880grayCell" style=" border-top-width:0px;">
								<div class="styLNRightNumBoxNBB" style="height:2mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;width:7mm;"/>
								<div class="styLNAmountBox" style="height:2mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
						<tr valign="middle" style="height:3mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880NumberCellPt0">
								<span style="width:3mm"/> 
                                    $33,000
                         <span style="width:5mm"/>
                         $36,000
                        </th>
							<th class="styIRS8880NumberCellPt1">
								<span style="width:15mm"/> .2
                              <span style="width:29mm"/> .1
 			          <span style="width:27mm"/> .0

                       </th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.4mm"/>
							</th>
							<th class="styIRS8880grayCell" style=" border-top-width:0px;">
								<div class="styLNRightNumBoxNBB" style="height:2mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;width:7mm;"/>
								<div class="styLNAmountBox" style="height:2mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
						<tr valign="middle" style="height:3mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880NumberCellPt0">
								<span style="width:3mm"/> 
                              $36,000
                         <span style="width:5mm"/>
                         $41,625
                        </th>
							<th class="styIRS8880NumberCellPt1">
								<span style="width:15mm"/> .1
                              <span style="width:29mm"/> .1
 			          <span style="width:27mm"/> .0

                       </th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.4mm"/>
							</th>
							<th class="styIRS8880grayCell" style=" border-top-width:0px;">
								<div class="styLNRightNumBoxNBB" style="height:2mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;width:7mm;"/>
								<div class="styLNAmountBox" style="height:2mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
						<tr valign="middle" style="height:3mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880NumberCellPt0">
								<span style="width:3mm"/> 
                           $41,625
                         <span style="width:5mm"/>
                         $55,500
                        </th>
							<th class="styIRS8880NumberCellPt1">
								<span style="width:15mm"/> .1
                              <span style="width:29mm"/> .0
 			          <span style="width:27mm"/> .0

            </th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.4mm"/>
							</th>
							<th class="styIRS8880grayCell" style=" border-top-width:0px;">
								<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;width:7mm;"/>
								<div class="styLNAmountBox" style="height:4mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
						<tr valign="middle" style="height:3mm;">
							<td class="styNormalText" style="border-bottom:solid black 0px;border-right:solid black 0px; width:8mm;text-align:center;font-size:8pt;"/>
							<th class="styIRS8880NumberCellPt0" style="height:2mm;border-bottom-width:1px;">
								<span style="width:3mm"/> 
                           $55,500
                         <span style="width:9mm"/>
                         ---
                            <br/>
							</th>
							<th class="styIRS8880NumberCellPt1" style="height:3mm;border-bottom-width:1px;">
								<span style="width:15mm"/> .0
                              <span style="width:29mm"/> .0
 			          <span style="width:27mm"/> .0
                       <br/>
							</th>
							<th class="styIRS8880TheadCell">
								<span style="width:4.4mm;"/>
							</th>
							<th class="styIRS8880grayCell" style=" border-top-width:0px;">
								<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;border-left-
                         width:1px;background:lightgrey;width:7mm;"/>
								<div class="styLNAmountBox" style="height:4mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
							</th>
						</tr>
					</table>
					<!--Note at bottom of table-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;font-size:7pt;"/>
						<div class="styLNDesc" style="width:99mm;height:4mm;font-size:7pt;">
							<span style="width:25mm"/>
							<span class="styBoldText">Note:</span><i> If line 9 is zero, <span class="styBoldText">stop</span>; you cannot take this credit. </i>     
                           </div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;mm;border-left-width:0px;padding-top:0mm;width:7mm;"/>
						<div class="styLNAmountBoxNB" style="height:5mm; width:33mm;padding-top:0mm;"/>
						<div class="styLNRightNumBoxNBB" style="height:5mm;border-right-width:0px;border-left-width:1px;background:lightgrey;padding-top:0mm;width:7mm;"/>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:33mm;border-bottom-width:0px;"/>
					</div>
					<!--line 10-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">10
                            </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;font-size:7pt;">
                 Multiply line 7 by line 9
       		 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
					   <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
					   <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
                                      <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
					   <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
					   <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
 					   <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
					   <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
					   <span style="width:16px"/>.   
                                     <span style="width:16px"/>.    
                                
                                </span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5.5mm;border-right-width:0px;padding-top:1mm;width:7mm;">10
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;border-left-width:1px;width:33mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CalculatedAmtByDecimalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 11-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">11
                            </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;font-size:7pt;">Enter the amount from Form 1040, line 46; Form 1040A, line 28; or<br/>
                            Form 1040NR, line 43 
        			<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                  </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;border-right-width:0px;padding-top:3mm;width:7mm;">11
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;border-right-width:1px;width:33.4mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/TaxFromTaxReturnAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;border-left-width:0px;background:lightgrey;padding-top:3mm;width:6.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;border-left-width:1px;width:33mm;padding-top:3mm;border-bottom-width:0px;"/>
					</div>
					
					<!--Line 12-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:6mm;">12
              </div>
						<div class="styLNDesc" style="width:93mm;font-size:7pt;">
							<span class="styBoldText">1040 filers:</span>
							<span style="width:4mm"/>Enter the total of your credits from lines 47 through 49,<br/>	 
							<span style="width:19.5mm;"></span>and Schedule R, line 24<br/>									
							<span class="styBoldText">1040A filers:</span>
							<span style="width:2mm"/>Enter the total of your credits from lines 29 through 31.<br/>
							<span class="styBoldText">1040NR filers:</span>
							<span style="width:.5mm"/>Enter the total of your credits from lines 44 and 45.							
	          </div>
						<div class="styLNDesc" style="width:6mm;height:6mm;">
							<span style="text-align:right;">
								<img src="{$ImagePath}/8880_Bracket_Md.gif" align="top" alt=""/>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:15mm;border-right-width:0px;padding-top:6mm;width:7mm;">12
             </div>
						<div class="styLNAmountBox" style="height:15mm;border-right-width:1px;width:33.3mm;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CreditsFromTaxReturnAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:15mm;border-right-width:0px;border-left-width:0px;background:lightgrey;padding-top:6mm;width:6.5mm;"/>
						<div class="styLNAmountBox" style="height:15mm;border-left-width:1px;width:30mm;border-bottom-width:0px;padding-top:6mm;"/>
					</div>
					<!--Line 13-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:0mm;">13
                            </div>
						<div class="styLNDesc" style="width:139mm;height:5mm;font-size:7pt;">
                 Subtract line 12 from line 11. If zero, <span class="styBoldText">stop; </span> you cannot take this credit
       		 <!--Dotted Line-->
							<span class="styBoldText">
						    <span style="width:16px"/>.   
                            <span style="width:16px"/>.    
					        <span style="width:16px"/>.   
                            <span style="width:16px"/>.    
					        <span style="width:16px"/>.   
                             <span style="width:16px"/>.  
                            <span style="width:16px"/>. 
                                </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;padding-top:1mm;width:7mm;">13
                            </div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:33mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CalculatedCreditsFromTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 14-->
					<div class="styBB" style="width:187mm;padding-bottom:0mm;height:7mm;float:left;clear:none;border-bottom-width:0px;">
						<div class="styLNLeftNumBox" style="height:6mm;padding-bottom:0mm;">14
                            </div>
						<div class="styLNDesc" style="width:139mm;height:6mm;padding-bottom:0mm;">
							<span class="styBoldText">Credit for qualified retirement savings contributions.  </span> Enter the 
                 <span class="styBoldText">smaller </span>of line 10 or line<br/> 13 here and on Form 1040, line 50; Form 1040A, line 32; or Form 1040NR, line 46.
       		 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.   
                                     <span style="width:16px"/>. 
                                        <span style="width:16px"/>.   
                                     <span style="width:16px"/>. 
                                     <span style="width:8px"/>. 
                                </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:0px;padding-top:3mm;width:7mm;padding-bottom:0mm;">14
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;width:33mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8880Data/CrQualifiedRetirementSavAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Instructions See pub-->
					<div style="width:187mm;padding-top:0mm;height:3mm;">
					<div class="styLNLeftNumBox" style="height:3mm;padding-top:0mm;">
                            </div>
						<div class="styLNDesc" style="width:176mm;height:3mm;padding-top:0mm;">      
    * See Pub. 590 for the amount to enter if you are filing Form 2555, 2555-EZ, or 
      4563 or you are excluding income from Puerto Rico.
    </div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
						<div style="float:left;">
       <b>For Paperwork Reduction Act Notice, see back of form. </b> 
         <span style="width:60px;"/>     
         Cat. No. 33394D
          <span style="width:180px;"/>  
          Form <span class="styBoldText">8880</span> (2009)
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
