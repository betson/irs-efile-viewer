<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Iskilu Lawal 09/30/2015 -->
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8941Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8941Data" select="$RtnDoc/IRS8941"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8941Data)"/>
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
				<meta name="Description" content="IRS Form 1065"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8941Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
			 </style>
				<xsl:call-template name="GlobalStylesForm"/>
			 </head>
			 <body class="styBodyClass" style="width:187mm;">
			  <form name="Form8941">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="padding-top:2mm;width:27mm;font-size:7pt;height:21.3mm;">
							<div>
            Form<span class="styFormNumber">8941</span>
								<div class="styAgency" style="padding-top:4mm;">
              Department of the Treasury<br/>Internal Revenue Service 
                                </div>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;text-align:center;">
							<div class="styMainTitle" style="padding-top:4mm;text-align:center;">Credit for Small Employer Health Insurance Premiums</div>
							<div class="styFBT" style="margin-top:0mm;padding-center:45mm;width:125mm;font-size:6.0pt;padding-top:4mm;
">
								<img src="{$ImagePath}/8941_Bullet.gif" alt="Bullet Image"/>Attach to your tax return.
							</div>
							<div class="styFBT" style="margin-top:0mm;padding-left:0.5mm;font-size:6.0pt;padding-top:3mm;">
								<img src="{$ImagePath}/8941_Bullet.gif" alt="Bullet Image"/>Information about Form 8941 and its separate instructions is at <a href="http://www.irs.gov/form8941" title="Link to IRS.gov"><i>www.irs.gov/form8941.</i></a>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm; height:21.3mm;">
							<div class="styOMB" style="height:5mm;font-size:8pt">OMB No. 1545-2198</div>
							<div class="styTaxYear"> 
          20<span class="styTYColor">15</span>
							</div>
							<div style="padding-left:2.5mm; text-align:left; margin-top:0mm; padding-bottom:0mm;">Attachment<br/>Sequence No.<b>65</b>
							</div>
						</div>
					</div>
					<!-- Begin Names and Identifying number section -->
					<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
						<div class="styNameBox" style="width:144.2mm;height:15mm;font-size:8pt;">
        Name(s) shown on return<br/>
							<div style="width:144mm;padding-left:5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8941Data/PersonNm"/>
								</xsl:call-template>
							</div>
							<div style="width:144mm;padding-left:5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8941Data/BusinessName/BusinessNameLine1Txt"/>
								</xsl:call-template>
							</div>
							<div style="width:144mm;padding-left:5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8941Data/BusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</div>
						</div>
						<div  style="padding-left:2mm;font-size:8pt;">
							<span style="font-weight:bold;">Identifying number</span>
							<br/>
							<xsl:choose>
								<xsl:when test="$Form8941Data/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form8941Data/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form8941Data/SSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- Start Line A -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;padding-left:4mm;">A
                            </div>
						<div class="styLNDesc" style="width:170mm;height:20mm;font size:7pt;">Did you pay premiums during your tax year for employee health insurance coverage you provided through a Small Business<br/>
						 Health Options Program
(SHOP) Marketplace (or do you qualify for an exception to this requirement)?  (see instructions)<br/>
							<!-- CheckboxYesStart -->
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnDoc/IRS8941/SHOPInd"/>
									<xsl:with-param name="BackupName">IRS8941SHOPInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$RtnDoc/IRS8941/SHOPInd"/>
									<xsl:with-param name="BackupName">IRS8941SHOPInd</xsl:with-param>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:0mm;padding-right:0mm;">Yes.</span>
							</label>
							<!-- CheckboxYesEnd -->	
                    						
  Enter Marketplace Identifier (if any): 
    							<span class="styFixedUnderline" style="width:35mm;float:none;padding-bottom:0mm;padding-top:0mm;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$Form8941Data/SHOPIdentificationNum"/>
								</xsl:call-template>
							</span>
							<br/>
							<!-- CheckboxNoStart -->
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnDoc/IRS8941/SHOPInd"/>
									<xsl:with-param name="BackupName">IRS8941SHOPInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$RtnDoc/IRS8941/SHOPInd"/>
									<xsl:with-param name="BackupName">IRS8941SHOPInd</xsl:with-param>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:0mm;padding-right:0mm;">No.</span>
							</label>
							<!-- CheckboxNoEnd -->
							                    							Stop.  Do not file Form 8941 (see instructions for an exception that may apply to a partnership,S corporation, <br/><div class="styLNDesc" style="width:80mm;font size:7pt;padding-bottom:0mm;position:relative;padding:0px 4px 4px 28px"> cooperative, estate, or trust).</div>
						</div>
						<div class="styRightNumBox" style="height:15mm;width:6.3mm;border-right-width:1px;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;">
                            </div>
					</div>
					<!-- End Line A -->
					<!-- Start Line B -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-bottom:0mm;padding-top:1mm;">B
                            </div>
						<div class="styLNDesc" style="width:160mm;font size:7pt;padding-bottom:0mm;padding-top:1mm;height:8mm">Enter the employer identification number (EIN) used to report employment taxes for individuals included on line 1 below if different from the identifying number listed above
							<span class="styFixedUnderline" style="width:73mm;float:none;padding-bottom:0mm;padding-top:0mm;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$Form8941Data/EmplmnTaxesReportEmployerEIN"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styRightNumBox" style="height:8mm;width:6.3mm;border-right-width:0px;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;">
                            </div>
					</div>
					<!-- End Line 1b -->
					<!-- Start Caution Line-->
					<div style="width:187mm;">
						<div class="styLNDesc" style="width:144mm;height:4mm;font size:7pt;padding-bottom:0mm;">
							<b>Caution.</b> See the instructions and complete Worksheets 1 through 7 as needed.
        <!--Dotted Line-->
							<span class="styBoldText">							
							</span>
						</div>
						<div class="styLNRightNumBox" style="width:6.3mm;border-right-width:1px;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;">
                            </div>
					</div>
					<!-- End Caution Line -->
					<!-- Start Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;padding-top:0mm;">1
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;padding-top:0mm;font size:7pt">Enter the number of individuals you employed during the tax year who are considered employees for purposes of this credit (total from Worksheet 1, column (a))
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.  
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.    
                                  <span style="width:8px"/>.                                                               
                                                                                                                                        </span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;width:6mm;border-right-width:0px;padding-top:3mm;">1
                            </div>
						<div class="styLNAmountBox" style="height:7mm;width:36.5mm;border-left-width:1px;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPIndivEmpldForCrCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 1 -->
					<!-- Start Line 2 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">2
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;font size:7pt">Enter the number of full-time equivalent employees (FTEs) you had for the tax year (from Worksheet 2, line 3). If you entered 25 or more, skip lines 3 through 11 and enter -0- on line 12
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                                                                                       
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:4mm;">2
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:36.5mm;border-left-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPFTEEmplForTaxYrCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 2 -->
					<!-- Start Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">3
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;font size:7pt">Average annual wages you paid for the tax year (from Worksheet 3, line 3).This amount must be a multiple of a $1,000. If you entered $52,000 or more, skip lines 4 through 11 and enter -0- on line 12
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
								<span style="width:8px"/>.
								<span style="width:8px"/>.
								<span style="width:8px"/>.
								<span style="width:8px"/>.
                                    
                                                                   </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:4mm;">3
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:36.5mm;border-left-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/AvgAnnualWagesPdForTxYrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 3 -->
					<!-- Start Line 4-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">4
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;font size:7pt">Premiums you paid during the tax year for employees included on line 1 for health insurance coverage under a qualifying arrangement (total from Worksheet 4, column (b))
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:4mm;">4
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:36.5mm;border-left-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/HIPPaidForEmplEmployedForCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 4 -->
					<!-- Start Line 5-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">5
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;font size:7pt">Premiums you would have entered on line 4 if the total premium for each employee equaled the average premium for the small group market in which the employee enrolls in health insurance coverage (total from Worksheet 4, column (c))
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                                                  </span>
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;width:6mm;border-right-width;border-bottom-width: 0px;background-color:lightgrey;">
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;width:36.5mm;border-left-width:1px;border-bottom-width:0px;">
                                    </div>
						<div class="styLNRightNumBox" style="height:5.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">5
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;width:36.5mm;border-left-width:1px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPPotentiallyPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 5 -->
					<!-- Start Line 6-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">6
                            </div>
						<div class="styLNDesc" style="width:136mm;height:4mm;font size:7pt">
                            Enter the <b>smaller</b> of line 4 or line 5
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.  
                                    <span style="width:8px"/>. 
                                       
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px;">6
                            </div>
						<div class="styLNAmountBox" style="height:4mm;width:36.5mm;border-left-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrEligibleHIPPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 6 -->
					<!-- Start Line 7-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:2mm;">7
                            </div>
						<div class="styLNDesc" style="width:136mm;height:2mm;font size:7pt">
                            Multiply line 6 by the applicable percentage:
        <!--Dotted Line-->
						</div>
						
						<div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width;border-bottom-width: 0px;background-color:lightgrey;">
                            </div>
						<div class="styLNAmountBox" style="height:4mm;width:36.5mm;border-left-width:1px;border-bottom-width:0px;">
                                    </div>
						<div class="styLNLeftNumBoxSD" style="height:7mm;">
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;">
							<img src="{$ImagePath}/8941_Bullet_Round.gif" alt="RoundBullet"/> Tax-exempt small employers, multiply line 6 by 35% (.35)<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.                            
                               </span><br/>										
							<img src="{$ImagePath}/8941_Bullet_Round.gif" alt="RoundBullet"/> All other small employers, multiply line 6 by 50% (.50)
        <span class="styBoldText">
								   <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width;border-bottom-width: 0px;background-color:lightgrey;">
                            </div>
						<div class="styLNAmountBox" style="height:4mm;width:36.5mm;border-left-width:1px;border-bottom-width:0px;">
                                    </div>
						<div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px;">7
                            </div>
						<div class="styLNAmountBox" style="height:4mm;width:36.5mm;border-left-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrEligHIPTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 7 -->
					<!-- Start Line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">8
                           </div>
						<div class="styLNDesc" style="width:136mm;height:4mm;font size:7pt">If line 2 is 10 or less, enter the amount from line 7. Otherwise, enter the amount from Worksheet  <br/> 5, line 6
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.                
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                                                
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:4mm;">8
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:36.5mm;border-left-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPFTECreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 8 -->
					<!-- Start Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">9
                            </div>
						<div class="styLNDesc" style="width:136mm;height:4mm;font size:7pt">If line 3 is $25,000 or less, enter the amount from line 8. Otherwise, enter the amount from Worksheet 6, line 7
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.                
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.                
                                    <span style="width:8px"/>.
                                  
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:4mm;">9
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:36.5mm;border-left-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/AnnualWgPdLessThanSpecifiedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 9 -->
					<!-- Start Line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">10
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;font size:7pt">Enter the total amount of any state premium subsidies paid and any state tax credits available to you for premiums included on line 4 (see instructions)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:4mm;">10
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:36.5mm;border-left-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/TotStPremSbsdyPdOrCrForHIPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 10 -->
					<!-- Start Line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">11
                            </div>
						<div class="styLNDesc" style="width:136mm;height:4mm;font size:7pt">Subtract line 10 from line 4. If zero or less, enter -0-
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px">11
                            </div>
						<div class="styLNAmountBox" style="height:4mm;width:36.5mm;border-left-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/HIPPdLessTotStPremOrCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 11 -->
					<!-- Start Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">12
                            </div>
						<div class="styLNDesc" style="width:136mm;height:4mm;font size:7pt">Enter the <b>smaller</b> of line 9 or line 11
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                 
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px">12
                            </div>
						<div class="styLNAmountBox" style="height:4mm;width:36.5mm;border-left-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmallerAnnualWgPdOrHIPPdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 12 -->
					<!-- Start Line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:10mm;">13
                            </div>
						<div class="styLNDesc" style="width:136mm;height:10mm;font size:7pt">If line 12 is zero, skip lines 13 and 14 and go to line 15. Otherwise, enter the number of employees included on line 1 for whom you paid premiums during the tax year for health insurance coverage under a qualifying arrangement (total from Worksheet 4, column (a))
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:6.5mm;width:6mm;border-right-width;border-bottom-width: 0px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:6.5mm;width:36.5mm;border-left-width:1px;border-bottom-width: 0px;">
                                  
                             </div>
						<div class="styLNRightNumBox" style="height:3.9mm;width:6mm;border-right-width:0px;padding-top:0mm;">13
                            </div>
						<div class="styLNAmountBox" style="height:3.9mm;width:36.5mm;border-left-width:1px;padding-top:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/PaidHIPForEmplForPrpsOfCrCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 13 -->
					<!-- Start Line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">14
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;font size:7pt">Enter the number of FTEs you would have entered on line 2 if you only included employees included on line 13 (from Worksheet 7, line 3)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:4mm;">14
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:36.5mm;border-left-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/FTEEmplPdHIPForPrpsOfCrCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 14 -->
					<!-- Start Line 15 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">15
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;font size:7pt">Credit for small employer health insurance premiums from partnerships, S corporations, cooperatives, estates, and trusts (see instructions)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                         
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:4mm;">15
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:36.5mm;border-left-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrCreditForHIPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 15 -->
					<!-- Start Line 16 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">16
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;font size:7pt">Add lines 12 and 15. Cooperatives, estates, and trusts, go to line 17. Tax-exempt small
employers, skip lines 17 and 18 and go to line 19. Partnerships and S corporations, stop here
and report this amount on Schedule K. All others, stop here and report this amount on Form
3800, line 4h
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;width:6mm;border-right-width;border-bottom-width: 0px;background-color:lightgrey;">
                            </div>
						<div class="styLNAmountBox" style="height:5mm;width:36.5mm;border-left-width:1px;border-bottom-width:0px;">
                                    </div>
						<div class="styLNRightNumBox" style="height:5mm;width:6mm;border-right-width:0px;padding-top:2mm;">16
                            </div>
						<div class="styLNAmountBox" style="height:5mm;width:36.5mm;border-left-width:1px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SumSmllrAmtAndCreditForHIPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 16 -->
					<!-- Start Line 17 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">17
                            </div>
						<div class="styLNDesc" style="width:136mm;height:4mm;font size:7pt">Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see <br/> instructions)
        <!--Dotted Line-->
							<span class="styBoldText">
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                <span style="width:8px"/>.
                                                                                               </span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPAllocToPatronsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;width:6mm;border-right-width:0px;padding-top:4mm;">17
                            </div>
						<div class="styLNAmountBox" style="height:7mm;width:36.5mm;border-left-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPAllocToPatronsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 17 -->
					<!-- Start Line 18 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">18
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;font size:7pt">Cooperatives, estates, and trusts, subtract line 17 from line 16. Stop here and report this amount on Form 3800, line 4h
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:4mm;">18
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:36.5mm;border-left-width:1px;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPSumLessAllocAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 18 -->
					<!-- Start Line 19 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">19
                            </div>
						<div class="styLNDesc" style="width:136mm;height:7mm;font size:7pt">Enter the amount you paid in 2015 for taxes considered payroll taxes for purposes of this credit <br/> (see instructions) 
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>. 
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                                                        
                                                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;padding-top:4mm;">19
                            </div>
						<div class="styLNAmountBox" style="height:7.5mm;width:36.5mm;border-left-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPPayrollTxsPdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 19 -->
					<!-- Start Line 20 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">20
                            </div>
						<div class="styLNDesc" style="width:136mm;height:8mm;font size:7pt">Tax-exempt small employers, enter the <b>smaller</b> of line 16 or line 19 here and on Form 990-T, <br/>line 44f
        <!--Dotted Line-->
							<span class="styBoldText">
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
							<span style="width:8px"/>. 
																										
													                                            
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;width:6mm;border-right-width:0px;border-bottom-width:0px;padding-top:4mm;">20
                            </div>
						<div class="styLNAmountBox" style="height:8mm;width:36.5mm;border-left-width:1px;border-bottom-width:0px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPTaxExemptCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 20 -->
					<!--  FOOTER-->
					<div style="width:187mm;padding-top:1mm;border-top:1px solid black;">
						<span class="styBoldText" style="width:109.5mm">For Paperwork Reduction Act Notice, see separate instructions. </span>
						<span style="width:28mm;">Cat. No. 37757S</span>
						<span style="width:22.9mm;"/>  
          <span style="width:22.9mm:">
							 Form <b>8941</b> (2015)</span>
					</div>
					<p style="page-break-before: always"/>
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
							<xsl:with-param name="TargetNode" select="$Form8941Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
