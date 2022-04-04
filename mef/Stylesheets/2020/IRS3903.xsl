<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 06/25/2020 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS3903Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS3903"/>
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
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 3903"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS3903Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form3903">
					<!--xsl:value-of select='$PageWatermark'/-->
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
					<!-- Extra data line -->
						<div class="styFNBox" style="width:31mm;height:20mm;">
							Form<span class="styFormNumber"><span style="width=2mm"/> 3903</span><br/>
							<div style="height:5mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Military Move Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/MilitaryMoveCd"/>
							</xsl:call-template>
						</div><br/>
							<div class="styAgency" style="height:6mm;padding-top:0mm">
							  Department of the Treasury<br/>Internal Revenue Service (99)</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:20mm;">
							<div class="styMainTitle" style="height:8mm;padding-top:2mm;">Moving Expenses</div><br/>
							<div class="styFST" style="height:5mm;font-size:7pt;padding-top:5mm;">
							    <img src="{$ImagePath}/3903_Bullet.gif" width="9" height="9" alt="Bullet"/>
							     Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form3903" title="Link to IRS.gov">
							     <i>www.irs.gov/Form3903</i></a> for instructions and the latest information.<br/>
								<img src="{$ImagePath}/3903_Bullet.gif" width="9" height="9" alt="bullet image"/><span style= "width:1mm;"/>Attach to Form
								 1040, Form 1040-SR, or Form 1040-NR.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;">
							<div class="styOMB" style="height:4mm;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:7mm;font-size:22pt;">2020</div>
							<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;
								padding-top:2mm">Attachment<br/>Sequence No. <span class="styBoldText">170</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:145mm;height:8mm;font-size:7pt;">
							<div>Name(s) shown on return</div><br/>
							<span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:41mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							<div>Your social security number</div>
							<span style="width:27mm;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:13mm;font-size:8pt">
						<div style="height:8mm;width:30mm;float:left;font-weight:bold;padding top:1mm"><i>Before you begin:</i></div>
						<div style="height:6mm;width:156mm;padding-top:.0mm;padding-bottom:0mm;padding-left:2mm">
							You can deduct moving expenses only if you are a <b> Member of the Armed Forces</b> on active duty, and due to a military order,  
                            you, your spouse, or your dependents move because of a permanent change of station.  Check here
                        <span style="padding-top:1mm;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/EligibilityRequirementMetInd"/>
						</xsl:call-template>
						<input type="checkbox" alt="Checkbox" name="Checkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/EligibilityRequirementMetInd"/>
							</xsl:call-template>
						</input>
						</span> 
						        to certify that you meet these requirements.  See the instructions.
						</div>
					</div>
					<!-- Begin the amount boxes -->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="width:5mm;height:4.5mm"/>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;width:5mm;height:4.5mm">1 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
								Transportation and storage of household goods and personal effects (see instructions)
								<span class="styDotLn" style="float:right;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">
								<span style="padding-left:.5mm">1</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TransportHouseholdGoodsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:6mm">2</div>
							<div class="styLNDesc" style="width:141mm;height:6mm;font-size:7.5pt">
							Travel (including lodging) from your old home to your new home (see instructions). <span style="font-weight:bold">
							Do not</span> include the cost of meals<span class="styDotLn" style="float:right;">..............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;">
								<span style="padding-left:.5mm;padding-top:1.5mm">2</span>
							</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:1.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TravelAndLodgingExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="width:5mm;height:4.5mm"/>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:4.5mm">3</div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
								Add lines 1 and 2<span class="styDotLn" style="float:right;">............................</span></div>
							<div class="styLNRightNumBox" style="height:4.5mm;position:relative">
								<span style="padding-left:1.5mm">3</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalMovingExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="width:5mm;height:4.5mm"/>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:9mm;padding-left:1mm;width:5mm;">4</div>
							<div class="styLNDesc" style="width:141mm;height:9mm;font-size:7.5pt">
								Enter the total amount the government paid you for the expenses listed on lines 1 and 2 that is
								<span style="font-weight:bold">not</span><br/> included in box 1 of your Form W-2 (wages). This amount 
									should be shown in box 12 of your Form W-2 <br/>with code <span style="font-weight:bold">P</span>
							    <span class="styDotLn" style="float:right;">..............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0"/>
							<div class="styLNRightNumBox" style="height:4mm;text-align:center;padding-left:1.66mm;">
								4
							</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalEmployerExpensesPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="width:5mm;height:4.5mm"/>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:27.2mm">5</div>
							<div class="styLNDesc" style="width:141mm;height:24mm;font-size:7.5pt">
								Is line 3 <span style="font-weight:bold;">more than</span> line 4?
							<p style="padding-left:3mm;">
							<span style="float:left;">
								<input type="checkbox" alt="Moving Expenses Deductible Ind No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MovingExpensesDeductibleInd"/>
									</xsl:call-template>
								</input>
							</span>
							<span style="height:7mm;float:left;font-weight:bold;">
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/MovingExpensesDeductibleInd"/>
									</xsl:call-template>
									No.
								</label>
							</span> 
							<span style= "width:3mm;"/>You <span style="font-weight:bold;">cannot</span>
							 deduct your moving expenses. If line 3 is less than line 4, subtract line 3 from<br/><span style= "width:2.8mm;"/> line 4 and include
							 the result on Form 1040 or Form 1040-SR, line 1; or Form 1040-NR, line <span style= "width:4mm;"/>8.</p>
							<p style="padding-left:3mm;padding-top:2mm;">
							<span style="float:left;">
								<input type="checkbox" alt="Moving Expenses Deductible Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MovingExpensesDeductibleInd"/>
									</xsl:call-template>
								</input>
							</span>
							<span style="height:7mm;float:left;font-weight:bold;">
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/MovingExpensesDeductibleInd"/>
									</xsl:call-template>
									Yes.
								</label>
							</span> 
							
							<span style= "width:2mm;"/>Subtract line 4 from line 3. Enter the result here and on Schedule 1 (Form 1040 or  <br/>
								<span style= "width:1.5mm;"/> 1040-SR), line 13; or Form 1040-NR, line 26. This is your
							   <b>moving expense deduction</b><span class="styDotLn" style="float:right;">.</span></p>
							</div>
							<div class="styLNRightNumBox" style="height:22mm;border-bottom:none;background-color:lightgrey;text-align:left;"/>
							<div class="styLNAmountBox" style="height:22mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="height:6mm;padding-left:1.66mm;text-align:center;border-bottom:none">5</div>
							<div class="styLNAmountBox" style="height:6mm;border-bottom:none">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MovingDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End the amount boxes -->
					<!-- capturing the page bottom info -->
					<div style="width:187mm; font-size:7pt; border-top:1 solid black; padding-top:0.5mm">
						<div style="float:left; font-size:8pt">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
						</div>
						<div style="float:right">
						Cat. No. 12490K
						<span style="width:15mm"/>
						Form <b style="font-size:9pt">3903</b> (2020)
						</div>
					</div>
					<br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Military Move Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/MilitaryMoveCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
