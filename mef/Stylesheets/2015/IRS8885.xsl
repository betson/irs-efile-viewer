<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8885Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8885Data" select="$RtnDoc/IRS8885"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	PopulateBulletSpan) -->
	<xsl:template name="PopulateBulletSpan">
		<xsl:attribute name="style">width:100%;height:auto;padding-top:0.8mm;</xsl:attribute>
		<img src="{$ImagePath}/8885_Round_Bullet.gif" alt="Round Bullet"/>
		<span style="width:4px;"/>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	PopulateMonthCheckbox) -->
	<xsl:template name="PopulateMonthCheckbox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="BackupName"/>
		<xsl:param name="Label"/>
		<span style="width:25mm;height:auto;">
			<input type="checkbox" class="styCkbox">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName">
						<xsl:value-of select="$BackupName"/>
					</xsl:with-param>
				</xsl:call-template>
			</input>
			<span style="width:1.5mm;"/>
			<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName">
						<xsl:value-of select="$BackupName"/>
					</xsl:with-param>
				</xsl:call-template>
				<xsl:value-of select="$Label"/>
			</label>
		</span>
	</xsl:template>
    
    <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8885Data)"/>
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
				<meta name="Description" content="IRS Form 8885"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8885Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8885">
	                     <!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>			
				
				<div class="styBB" style="width:187mm;border-bottom-width:2px;height:21mm;">
				    <div class="styFNBox" style="width:31mm;height:100%;border-right-width:2px;">
				         <div style="height:13mm;">
				         Form<span class="styFormNumber">  8885</span>
				         <!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8885Data"/>
							</xsl:call-template><br/><br/><br/>
				         <span class="styAgency">Department of the Treasury</span>
				         <br/>
							<span class="styAgency">Internal Revenue Service</span>
				         </div>
				    </div>
				       <div class="styFTBox" style="width:125mm;height:13mm;">
                                                  <!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="width:75mm;height:10mm;padding-top:1mm;text-align:center;">Health Coverage Tax Credit</div> <br/>								
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
							      <span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:100%;height:5mm;">
											
											<img src="{$ImagePath}/8885_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040, Form 1040NR, Form 1040-SS, or Form 1040-PR.
											<br/><br/>
											<img src="{$ImagePath}/8885_Bullet_Sm.gif" alt="SmallBullet"/> 
											Information about Form 8885 and its instructions is at <i>www.irs.gov/form8885.</i>
										</div>
									</div>
								</span>
							</div>	
							    		       
				       </div>
				       <div class="styTYBox" style="width:31mm;border-left-width:2px;height:20mm;">
				       <div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor" style="font-size:21pt">15</span></div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">134</b></div>
				       </div>
				</div>
				<div class="styTBB" style="width:187mm;">
				<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name of recipient (if both spouses are recipients, complete a separate form for each spouse)<br/>
							<xsl:choose>
								<xsl:when test="$Form8885Data/PersonNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8885Data/PersonNm"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>	
                          <div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Recipient's social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form8885Data/RecipientSSN"/>
								</xsl:call-template>
							</span>
						</div>						
				
				</div>
				<div class="styTBB" style="width:187mm">
				<div class="styIRS8885LNDesc" style="width:100%;padding-left:0px;font-size:9pt;">
								<span class="styItalicText" style="font-weight:bold;">Before you begin: </span>
								See <b>Definitions and Special Rules</b> in the instructions.
			    </div>
			    </div>
					<div class="styBB" style="width:187mm">
					<div class="styIRS8885LineItem" style="padding-top:2.5mm;padding-bottom:1mm;height:20mm;">
                       <div class="styIRS8885CleanDiv" style="height:10mm;width:15mm;">
						   <img src="{$ImagePath}/8885_Caution.gif" alt="Caution"/>
					   </div>
                        <div class="styIRS8885LNDesc" style="width:130mm;height:20mm;padding-top:6.5mm;">
								<b>Do not </b>complete this form if you can be claimed as a dependent on someone else's 2015 tax return.
							</div>     
							                
					</div>
				
				   </div>	
				 		
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
                     		<!-- Header -->
				<div style="width:187mm;padding:0px 0px 20px 0px;height:5mm;" class="styBB">
				                      <!-- Content -->
						<div class="styPartName" style="width:12mm;height:5mm;">Part I</div>
								
                       <div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Election To Take the Health Coverage Tax Credit
		              </div>
		         </div>
		         <!-- Body -->
					<div class="styBB" style="width:187mm;height:90mm;">
                      	<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS8885LineItem">
						<div class="styIRS8885LNLeftNumBox">1</div>
							<div class="styIRS8885LNDesc" style="width:181mm;height:auto;back">
								Check the box below for the first month in your tax year that you elect to take the Health Coverage Tax Credit.   <b>All</b> of the following statements must be<b> true</b> on the <b>first day</b> of that month.  You must also check the box for each month after your election month that <b>all</b> of the following statements were <b>true</b> on the<b> first day</b> of that month. <br/>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You were an eligible trade adjustment assistance (TAA) recipient, alternative TAA (ATAA) recipient, reemployment TAA (RTAA) <br/>
									recipient, or Pension Benefit Guaranty Corporation (PBGC) pension payee; or you were a qualified family member of an <br/>
									individual who fell under one of the categories listed above when he or she passed away or with whom you finalized<br/>
									a divorce.
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You and/or your family member(s) were covered by a qualified health insurance plan, including a qualified health plan purchased through a Health Insurance Marketplace (also known as an Exchange), for which the premiums were paid by you or through advance payment of the premium tax credit.
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You were <b>not</b> enrolled in Medicare Part A, B, or C, or you were enrolled in Medicare but your family member(s) qualified for <br/>
									the HCTC.
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You were <b>not</b> enrolled in Medicaid or the Children's Health Insurance Program (CHIP).
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You were <b>not</b> enrolled in the Federal Employees Health Benefits Program (FEHBP) or eligible to receive benefits under the <br/>
									U.S. military health system (TRICARE).
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You were <b>not</b> imprisoned under federal, state, or local authority.
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									Your employer <b>did not</b> pay 50% or more of the cost of coverage.
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You <b>did not</b> receive a 65% COBRA premium reduction from your former employer or COBRA administrator.
								</span>
								<div style="width:187mm;">
								</div>
								<div class="styGenericDiv" style="width:175mm;"> <b>Note.</b> You <b>cannot</b> take the premium tax credit for any month you check a box below.  Consider whether the health coverage tax credit you elect will be more than any premium tax credit that you could take without the election.  You<b> cannot</b> change the election once it is made.  See <b>Participants in a Health Insurance Marketplace</b> in the instructions.
								</div>
								<div style="width:187mm;">
								</div>
								<span style="width:auto;height:auto;"/>
								<span style="width:2mm;"/>
								<!-- January -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrJanuaryInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrJanuaryInd</xsl:with-param>
									<xsl:with-param name="Label">January</xsl:with-param>
								</xsl:call-template>
								<!-- February -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrFebruaryInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrFebruaryInd</xsl:with-param>
									<xsl:with-param name="Label">February</xsl:with-param>
								</xsl:call-template>
								<!-- March -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrMarchInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrMarchInd</xsl:with-param>
									<xsl:with-param name="Label">March</xsl:with-param>
								</xsl:call-template>
								<!-- April -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrAprilInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrAprilInd</xsl:with-param>
									<xsl:with-param name="Label">April</xsl:with-param>
								</xsl:call-template>
								<!-- May -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrMayInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrMayInd</xsl:with-param>
									<xsl:with-param name="Label">May</xsl:with-param>
								</xsl:call-template>
								<!-- June -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrJuneInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrJuneInd</xsl:with-param>
									<xsl:with-param name="Label">June</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="width:100%;"/>
								<span style="width:2mm;"/>
								<!-- July -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrJulyInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrJulyInd</xsl:with-param>
									<xsl:with-param name="Label">July</xsl:with-param>
								</xsl:call-template>
								<!-- August -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrAugustInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrAugustInd</xsl:with-param>
									<xsl:with-param name="Label">August</xsl:with-param>
								</xsl:call-template>
								<!-- September -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrSeptemberInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrSeptemberInd</xsl:with-param>
									<xsl:with-param name="Label">September</xsl:with-param>
								</xsl:call-template>
								<!-- October -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrOctoberInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrOctoberInd</xsl:with-param>
									<xsl:with-param name="Label">October</xsl:with-param>
								</xsl:call-template>
								<!-- November -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrNovemberInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrNovemberInd</xsl:with-param>
									<xsl:with-param name="Label">November</xsl:with-param>
								</xsl:call-template>
								<!-- December -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrDecemberInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrDecemberInd</xsl:with-param>
									<xsl:with-param name="Label">December</xsl:with-param>
								</xsl:call-template>
								<span style="width:100%;height:2mm;"/>
							</div>
						</div>
					</div>
                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->		         
		             <div style="width:187mm;height:5mm;padding:0px 0px 0px 0px;" class="styBB">
		                                                 <!-- Content -->
		             <div class="styPartName" style="width:15mm;height:5mm;padding-top:1mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;padding-top:.5mm;">
							Health Coverage Tax Credit
						</div>
		           
		             </div>      
		                                                      <!-- Body -->
		              <!-- (Column Headers) ////////////////////////////////////////////////////-->
				      <!-- (2) //////////////////////////////////////////////////-->                                   
				      <div class="styGenericDiv" style="height:14mm;width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:100%;width:6mm">2</div>
							<div class="styGenericDiv" style="padding-left:2mm;padding-right:1mm;width:138.5mm;padding-top:0.5mm;">
								Enter the total amount paid directly to your health plan for qualified health insurance coverage for 
								the months checked on line 1.  Treat advance payments of the premium tax credit paid to the Health Insurance Marketplace as paid by you.  See the instructions before you complete line 2. <b> Do not</b> include on line 2 any insurance premiums on coverage that was actually paid for with a National Emergency Grant.
								           <!--Dotted Line-->
								<span class="styBoldText" style="float:right;letter-spacing:12px;padding-right:1mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:16.5mm;padding-top:12mm;">2</div>
							<div class="styLNAmountBox" style="height:16.5mm;width:34mm;padding-top:12mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthPlanPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
		                            <!-- (Caution) ////////////////////////////////////////////////////-->
                        <div  style="width:187mm;height:16mm;padding-top:2mm;">
		                <div class="styLNLeftNumBoxSD" style="width:6mm"/>
							<div class="styGenericDiv" style="padding-left:2mm;width:19.9mm;">
								<img src="{$ImagePath}/8885_Caution.gif" alt="Caution" width="50" height="50"/>
							</div>       
		                  <div class="styGenericDiv" style="padding-left:0mm;padding-top:2mm;width:118.5mm;">
								<span class="styItalicText">
									You <b>must</b> attach the required documents listed in the instructions for any
									amounts included on line 2. If you do not attach the required documents,
									your credit will be disallowed.
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:14mm;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:14mm;width:34mm;padding-bottom:0;border-bottom-width:0">
							</div>
		               </div>                                         
		               <!--(3) /////////////////////////////////////////////////// -->
		               <div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:100%;width:6mm">3</div>
							<div class="styGenericDiv" style="padding-left:2mm;padding-right:1mm;width:138.4mm;padding-top:0.5mm;">
								Enter the total amount of any Archer MSA or health savings accounts distributions used to pay for <br/>
								<span style="float:left;">qualified health insurance coverage for the months checked on line 1</span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;letter-spacing:12px;padding-right:3mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:6.5mm;padding-top:.5mm;width:8.1mm;">3</div>
							<div class="styLNAmountBox" style="width:34mm;height:6.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthPlanPaidWithMSAOrHSAAmt"/>
								</xsl:call-template>
							</div>
						</div>   
		                <!-- (4) //////////////////////////////////////////////////// --> 
		                <div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="width:6mm">4</div>
							<div class="styGenericDiv" style="padding-left:2mm;padding-right:1mm;width:138.4mm;padding-top:0.5mm;">
								<span style="float:left;">Subtract line 3 from line 2. If zero or less, <b>stop</b>; you cannot take the credit</span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;letter-spacing:12px;padding-right:3mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="">4</div>
							<div class="styLNAmountBox" style="width:34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthPlanPaidLessMSAAndNEGAmt"/>
								</xsl:call-template>
							</div>
						</div>  
		                <!-- (5) ///////////////////////////////////////////////////-->  
		                <div class="styGenericDiv" style="width:187mm;border-bottom:1px solid black;height:13mm;">
		                <div class="styLNLeftNumBoxSD" style="width:6mm;">5</div>
		                <div class="styGenericDiv" style="padding-left:2mm;padding-right:1mm;width:138.4mm;padding-top:0.5mm;">
                          <b>Health Coverage Tax Credit.</b> Multiply the amount on line 4 by 72.5% (0.725). Enter the result here and on Form 1040, line 73 (check box <b>
							c</b>); Form 1040NR, line 69 (check box <b>c</b>); Form1040-SS, line 10; or Form 1040-PR, line 10.
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;letter-spacing:12px;padding-right:2mm;">...........................</span>		                
		                </div>
		                <div class="styLNRightNumBox" style="border-bottom-width:0;height:12.5mm;padding-top:8.5mm;">5</div>
							<div class="styLNAmountBox" style="width:34mm;border-bottom-width:0;height:12.5mm;padding-top:8.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCoverageTaxCreditAmt"/>
								</xsl:call-template>
							</div>
		              </div> 
                     <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					 <!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see your tax return instructions.
							</span>
						</div>
						<div style="text-align:left;font-size:7pt;">
							<span style="width:64px"/>
							Cat. No. 34641D
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8885</span> (2015)
						</div>
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
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8885Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>                                                
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>			
				
				
				
				
				  