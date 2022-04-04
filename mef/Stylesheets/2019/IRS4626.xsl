<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:import href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4626Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS4626"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching   -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 4626"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4626Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<!-- Standard Warning Line -->
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="styBB" style="width:187mm;">
					<!-- Form Name -->
					<div class="styFNBox" style="width:28mm;height:16mm;">
					  Form <span class="styFormNumber">4626</span>
						<br/>
						<span style="height:3.5mm;"/>				
                        <!--General Dependency Push Pin
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template> -->
						<span class="styAgency">Department of the Treasury</span>
						<span style="height:2.5mm;"/>
						<span class="styAgency">Internal Revenue Service</span>
					</div>
					<!-- Form Title Box -->
					<div class="styFTBox" style="width:126mm;height:16mm;padding-top:2mm;">
						<!-- Form Title -->
						<span class="styMainTitle">Alternative Minimum Tax—Corporations</span>
						<!-- Form Subtitle -->
						<div class="styFST" style="padding-top:2mm;">
							<img src="{$ImagePath}/4626_Bullet.gif" width="4" height="7" alt="Right arrow"/>
								  Attach to the corporation's tax return.
								 <br/>
							<img src="{$ImagePath}/4626_Bullet.gif" width="4" height="7" alt="Right arrow"/>
							<span style="font-size:7pt;padding-left:1mm;">
								Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form4626" title="Link to IRS.gov">
									<i>www.irs.gov/Form4626</i>								
								</a> for instructions and the latest information.
							</span> 
						  </div>
					</div>
					<!-- Tax Year Box -->
					<div class="styTYBox" style="width:32mm;height:16mm;">
						<!-- OMB No. -->
						<div class="styOMB" style="width:32mm;">OMB No. 1545-0123</div>
						<!-- Tax Year -->
						<div class="styTY" style="text-align:center;padding-top:1mm;">
							<span>20<span class="styTYColor">19</span>
							</span>
						</div>
					</div>
				</div>
				<!-- Name and Address -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:130mm;font-size:7pt;">
							  Name
							  <br/>
							<!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
							 <xsl:call-template name="PopulateFilerName">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							 </xsl:call-template> 
						</div>
					<div class="styEINBox" style="width:50mm;padding-left:2mm;text-align:left;font-size:7pt;">
						<span style="font-weight:bold;">Employer identification number
							<br/>
						</span>
						<span style="float:left;font-weight:normal;padding-top:3mm;">
							<!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
							 <xsl:call-template name="PopulateFilerTIN">
							   <xsl:with-param name="TargetNode" select="$FormData"/>
							 </xsl:call-template>
						</span>
					</div>
				</div>
				<!-- Form body -->
				<!-- Part I - Header -->
				<div class="styBB" style="width:187mm;">
				<!--	<span class="styPartName" style="width:16mm;">Part I</span>
					<span class="styPartDesc" style="width:150mm;">
              Alternative Minimum Tax Computation
         </span>-->
				</div>
				<!-- notes line -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD"/>
					<div class="styLNDesc" style="width:139mm;">
						<span style="width:9mm;font-weight:bold;">Note:</span>
						<span style="font-style:italic;">See the instructions to find out if the corporation is a small corporation exempt from the alternative</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD"/>
					<div class="styLNDesc" style="width:139mm;">
						<!--span style="width:9mm;"></span-->
						<span style="font-style:italic;"> minimum tax (AMT) under section 55(e).</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<!-- actual line -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Taxable income or (loss) before net operating loss deduction</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
					</div>
					<div class="styLNRightNumBox">1</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeLossBfrNOLDedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 -->
				<!-- actual line -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="width:139mm;font-weight:bold;">Adjustments and preferences:</div>
					<div class="styLNRightNumBoxNBB"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<!-- line 2 sub a -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Depreciation of post-1986 property</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">......................</span>
					</div>
					<div class="styLNRightNumBox">2a</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DepreciationOfPost1986PropAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub b -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Amortization of certified pollution control facilities</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">.................</span>
					</div>
					<div class="styLNRightNumBox">2b</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AmortzCertPlltnContolFcltsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub c -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Amortization of mining exploration and development costs</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
					</div>
					<div class="styLNRightNumBox">2c</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AmortzMineExplrtnDevCostAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub d -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Amortization of circulation expenditures (personal holding companies only)</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
					</div>
					<div class="styLNRightNumBox">2d</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AmortzOfCirculationExpendAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub e -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Adjusted gain or loss</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">..........................</span>
					</div>
					<div class="styLNRightNumBox">2e</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustedGainOrLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub f -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">f</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Long-term contracts</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">..........................</span>
					</div>
					<div class="styLNRightNumBox">2f</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LongTermContractAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub g -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">g</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Merchant marine capital construction funds</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
					</div>
					<div class="styLNRightNumBox">2g</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MerchantMarineCapConstFundsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub h -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">h</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Section 833(b) deduction (Blue Cross, Blue Shield, and similar type organizations only)</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
					</div>
					<div class="styLNRightNumBox">2h</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section833bDeductionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub i -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">i</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Tax shelter farm activities (personal service corporations only)</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
					</div>
					<div class="styLNRightNumBox">2i</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxShelterFarmActivitiesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub j -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">j</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Passive activities (closely held corporations and personal service corporations only)</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
					</div>
					<div class="styLNRightNumBox">2j</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PassiveActivityAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub k -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">k</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Loss limitations</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">............................</span>
					</div>
					<div class="styLNRightNumBox">2k</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LossLimitationAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub l -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">l</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Depletion</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">..............................</span>
					</div>
					<div class="styLNRightNumBox">2l</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DepletionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub m -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">m</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Tax-exempt interest income from specified private activity bonds</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
					</div>
					<div class="styLNRightNumBox">2m</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TxExmptIntIncmSpcfdActyBondAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub n -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">n</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Intangible drilling costs</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">.........................</span>
					</div>
					<div class="styLNRightNumBox">2n</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IntangibleDrillingCostAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 sub o -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">o</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Other adjustments and preferences</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">......................</span>
					</div>
					<div class="styLNRightNumBox">2o</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentAndPrefAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 3 -->
				<!-- actual line -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Pre-adjustment alternative minimum taxable income (AMTI). Combine lines 1 through 2o</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
					</div>
					<div class="styLNRightNumBox">3</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PreadjustmentAMTIAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 4 -->
				<!-- line 4 sub a -->
				<!-- actual line -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc" style="width:139mm;font-weight:bold">
						<span style="float:left;"/>Adjusted current earnings (ACE) adjustment:</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB" style=""/>
				</div>
				<!-- line 4 sub a -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:99mm;">
						<span style="float:left;">ACE from line 10 of the ACE worksheet in the instructions</span>
						<span class="styDotLn" style="float:right;">.....</span>
					</div>
					<div class="styLNRightNumBox" style="">4a</div>
					<div class="styLNAmountBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustedCurrentEarningsAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB" style=""/>
				</div>
				<!-- line 4 sub b -->
				<!-- triple lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:99mm;">Subtract line 3 from line 4a. If line 3 exceeds line 4a, enter the difference</div>       
					<div class="styLNRightNumBoxNBB"/>
					<div class="styLNAmountBoxNBB"/>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox"/>
					<div class="styLNDesc" style="width:99mm;">
						<span style="float:left;">as a negative amount. See instructions</span>
						<span class="styDotLn" style="float:right;">...........</span>
					</div>
					<div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
					<div class="styLNAmountBox" style="height:4.5mm;" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ACELessPreadjustmentAMTIAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
				</div>
				<!-- line 4 sub c -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">c</div>
					<div class="styLNDesc" style="width:99mm;">
						<span style="float:left;">Multiply line 4b by 75% (0.75). Enter the result as a positive amount</span>
						<span class="styDotLn" style="float:right;">..</span>
					</div>
					<div class="styLNRightNumBox" style="height:4.5mm;">4c</div>
					<div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RedACELessPreadjustmentAMTIAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
				</div>
				<!-- line 4 sub d -->
				<!-- five lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
					<div class="styLNDesc" style="width:99mm;">Enter the excess, if any, of the corporation's total increases in AMTI from</div>    
					<div class="styLNRightNumBoxNBB"/>
					<div class="styLNAmountBoxNBB"/>
					<div class="styLNRightNumBoxNBB" style="height:4mm;border-left-width:1px;background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB" style="height:4mm;"/>
				</div>
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox"/>
					<div class="styLNDesc" style="width:99mm;">prior year ACE adjustments over its total reductions in AMTI from prior
				</div>
					<div class="styLNRightNumBoxNBB"/>
					<div class="styLNAmountBoxNBB"/>
					<div class="styLNRightNumBoxNBB" style="height:4mm;border-left-width:1px;background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<div class="IRS4626_LineContainer" style="height:4mm;">
					<div class="styLNLeftLtrBox"/>
					<div class="styLNDesc" style="width:99mm;">year ACE adjustments. See instructions.
						 <span style="font-weight:bold;padding-right:1mm;"> Note:</span>
						<span style="font-style:italic;padding-right:1mm;">You</span>
						<span style="font-weight:bold;padding-right:1mm;font-style:italic">must </span> 
						<span style="font-style:italic;padding-right:1mm;">enter an amount</span>
											</div>
					<div class="styLNRightNumBoxNBB"/>
					<div class="styLNAmountBoxNBB"/>
					<div class="styLNRightNumBoxNBB" style="height:4mm;border-left-width:1px;background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<div class="IRS4626_LineContainer" style="height:4mm;">
					<div class="styLNLeftLtrBox"/>
					<div class="styLNDesc" style="width:99mm;">
						<span style="font-style:italic; float:left;"> on line 4d (even if line 4b is positive)</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
					</div>
					<div class="styLNRightNumBox">4d</div>
					<div class="styLNAmountBox" style="border-right-width:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ExcessAMTIAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:5mm;border-left-width:1px;background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB" style="height:5mm;"/>
				</div>
				<!-- line 4 sub e -->
				<!-- five lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
					<div class="styLNDesc" style="width:139mm;">ACE adjustment.</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
				</div>
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox"/>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">
							<span style="float:left;width:118mm;">
								<img src="{$ImagePath}\4626_Bullet_Round.gif" alt="Arrow to right" border="0"/>
							If line 4b is zero or more, enter the amount from line 4c 
							<br/>
								<img src="{$ImagePath}\4626_Bullet_Round.gif" alt="Arrow to right" border="0"/>
								If line 4b is less than zero, enter the <b>smaller </b>of line 4c or line 4d as a negative amount</span>
							<span style="width:4mm;height:4mm;">
								<img src="{$ImagePath}\4626_SMBracket.gif" alt="Bracket"/>
							</span>
						</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;padding-top:3mm;">...</span>
					</div>
					<div class="styLNRightNumBox" style="height:10mm;padding-top:5.5mm;">4e</div>   
					<div class="styLNAmountBox" style="height:10mm;padding-top:5.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ACEAdjustmentAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 5 -->
				<!-- single lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Combine lines 3 and 4e. If zero or less, stop here; the corporation does not owe any AMT</span>        
						<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
					</div>
					<div class="styLNRightNumBox">5</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PreadjustmentAMTIPlusACEAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
					<!-- line 6 -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer" >
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Alternative tax net operating loss deduction. See instructions</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
					</div>
					<div class="styLNRightNumBox">6</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AltTaxNetOperatingLossDedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 7 -->
				<!-- triple lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="font-weight:bold">Alternative minimum taxable income. </span>         
						Subtract line 6 from line 5. If the corporation held a residual</div>     
					<div class="styLNRightNumBoxNBB"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD"/>
					<div class="styLNDesc" style="width:139mm;">
					  <span style="float:left;">
						<span style="float:left;width:50mm;">interest in a REMIC, see instructions            
						  <xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="TargetNode" select="$FormData/ResidualInterestAmt/@residualInterestInREMICCd"/>
							<xsl:with-param name="Desc">Line 7 - Note on Residual Interests</xsl:with-param>
						  </xsl:call-template>
					    </span>
					  </span>
					  <span style="float:right;">						
						<span class="styDotLn" style="padding-left:3mm;width:89mm;">.....................</span>
					  </span>						
					</div>
					<div class="styLNRightNumBox">7</div>
					<div class="styLNAmountBox">
						<xsl:if test="$FormData/ResidualInterestAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ResidualInterestAmt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$FormData/AlternativeMinTaxableIncomeAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncomeAmt"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
				<!-- line 8 -->
				<!-- triple lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="font-weight:bold">Exemption phase-out </span>
						(if line 7 is $310,000 or more, skip lines 8a and 8b and enter -0- on line 8c):
					 </div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<!-- line 8 sub a -->
				<!-- triple lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:99mm;">Subtract $150,000 from line 7 (if completing this line for a member of a
				   </div>
					<div class="styLNRightNumBoxNBB"/>
					<div class="styLNAmountBoxNBB"/>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox"/>
					<div class="styLNDesc" style="width:99mm;">
						<span style="float:left;">controlled group, see instructions). If zero or less, enter -0-</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
					</div>
					<div class="styLNRightNumBox" style="">8a</div>
					<div class="styLNAmountBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedAMTIExemptionAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB" style=""/>
				</div>
				<!-- line 8 sub b -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:99mm;">
						<span style="float:left;">Multiply line 8a by 25% (0.25)</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
					</div>
					<div class="styLNRightNumBox">8b</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ReducedAMTIExemptionAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
				</div>
				<!-- line 8 sub c -->
				<!-- triple lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:139mm;">
					Exemption. Subtract line 8b from $40,000 (if completing this line for a member of a controlled group, see 
					 </div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftLtrBox"/>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">instructions). If zero or less, enter -0-</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">....................</span>
					</div>
					<div class="styLNRightNumBox">8c</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ExemptionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 9 -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Subtract line 8c from line 7. If zero or less, enter -0-</span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
					</div>
					<div class="styLNRightNumBox">9</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AMTIMinusExemptionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 10 -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBox">10</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Multiply line 9 by 20% (0.20)</span>	  
						<span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>
					</div>
					<div class="styLNRightNumBox">10</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjAlternativeMinTaxableIncAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 11 -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBox">11</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Alternative minimum tax foreign tax credit (AMTFTC). See instructions</span>       
						<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
					</div>
					<div class="styLNRightNumBox">11</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AMTForeignTaxCreditAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 12 -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBox">12</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Tentative minimum tax.  Subtract line 11 from line 10</span>  
						<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
					</div>
					<div class="styLNRightNumBox">12</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TentativeAlternativeMinTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 13 -->
				<!-- double lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBox">13</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="float:left;">Regular tax liability before applying all credits except the foreign tax credit</span>    
						<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">13</div>
					<div class="styLNAmountBox" style="height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RegularTaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 14 -->
				<!-- quadruple lines -->
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBox">14</div>
					<div class="styLNDesc" style="width:139mm;">
						<span style="font-weight:bold">Alternative minimum tax. </span>
        Subtract line 13 from line 12. If zero or less, enter -0-. Enter here and on
     </div>
					<div class="styLNRightNumBoxNBB"/>
					<div class="styLNAmountBoxNBB"/>
				</div>
				<div class="IRS4626_LineContainer">
					<div class="styLNLeftNumBox" style="border-bottom-width:1px"/>
					<div class="styLNDesc" style="width:139mm;border-bottom-width:1px;">
						<span style="float:left;">Form 1120, Schedule J, line 3, or the appropriate line of the corporation's income tax return</span>      
						<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
					</div>
					<div class="styLNRightNumBoxNBB">14</div>
					<div class="styLNAmountBoxNBB">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Page 1 Break and Footer-->
				<div class="pageEnd" style="width:187mm;solid black;border-style:solid;border-width:.25mm;border-left-width:0px;border-right-width:0px;border-bottom-width:0px;">
					<div style="float:left;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
						<span style="width:20mm;"/>Cat. No. 12955I </div>                      
					<div style="float:right;">
						<span style="width:70px;"/>  
				  Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2019)
				</div>
				</div>
				<!-- END Page 1 Break and Footer-->
				<!--Begin ADDITIONAL DATA SECTION -->
				<div style="width:187mm;clear:both;">
				<div class="styLeftOverTitleLine" id="LeftoverData"><br>
					</br><div class="styLeftOverTitle">
						Additional Data        
					</div>
					<div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
					</div>
					</div>
				</div>
				<table class="styLeftOverTbl">
					<xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 7 - Note on Residual Interests</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ResidualInterestAmt/@residualInterestInREMICCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
