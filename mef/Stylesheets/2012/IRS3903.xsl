<?xml version="1.0" encoding="UTF-8"?>
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
		<html>
			<head>
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
						<div class="styFNBox" style="width:31mm;height:22mm;">
            Form<span class="styFormNumber"> 3903</span><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Military Move Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/MilitaryMoveCd"/>
							</xsl:call-template>
							<div class="styAgency" style="padding-top:2mm;">Department of the Treasury<br/>Internal Revenue Service (99)</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:22mm;">
							<div class="styMainTitle" style="height:8mm;padding-top:2mm;">Moving Expenses</div>
							<div class="styFST" style="height:5mm;font-size:7pt;padding-top:4mm;">
								<img src="{$ImagePath}/3903_Bullet.gif" width="9" height="9" alt="bullet image"/>Attach to Form 1040 or Form 1040NR.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm;">
							<div class="styOMB" style="height:1mm;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:7mm;font-size:22pt;">2012</div>
							<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;">Attachment<br/>
            Sequence No. <span class="styBoldText">170</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;">
							<div>Name(s) shown on return</div>
							<span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							<div>Your social security number</div>
							<span style="width:27mm;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:12mm;">
						<div style="height:12mm;width:30mm;float:left;font-weight:bold">Before you begin:</div>
						<div style="height:6mm;width:156mm;padding-top:1mm;padding-bottom:2mm;"><img src="{$ImagePath}/3903_checkmark.gif" width="11" height="10" alt="checkmark image"/> See the <b>Distance Test</b> and <b>Time Test</b> in the instructions to find out if you can deduct your moving expenses.</div>
						<div style="height:6mm;width:156mm;"><img src="{$ImagePath}/3903_checkmark.gif" width="11" height="10" alt="checkmark image"/> See <b>Members of the Armed Forces</b> in the instructions, if applicable.</div>
					</div>
					<!-- Begin the amount boxes -->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="width:5mm;height:4.5mm"/>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:4.5mm">1 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">
							Transportation and storage of household goods and personal effects (see instructions)<span style="letter-spacing:3mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;position:relative">
								<span style="position:absolute;bottom:0">1</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TransportHouseholdGoodsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:8mm">2</div>
							<div class="styLNDesc" style="width:141mm;height:8mm;">
							Travel (including lodging) from your old home to your new home (see instructions). <span style="font-weight:bold">Do not</span> include the cost of meals<span style="letter-spacing:3mm;">...............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="position:absolute;bottom:0">2</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
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
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Add lines 1 and 2<span style="letter-spacing:3mm;">...............................</span></div>
							<div class="styLNRightNumBox" style="height:4.5mm;position:relative">
								<span style="position:absolute;bottom:0">3</span>
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
							<div class="styLNLeftNumBox" style="height:12mm;padding-left:1mm;width:5mm;">4</div>
							<div class="styLNDesc" style="width:141mm;height:12mm;">Enter the total amount your employer paid you for the expenses listed on lines 1 and 2 that is <span style="font-weight:bold">not</span> included in box 1 of your Form W-2 (wages). This amount should be shown in box 12 of your Form W-2 with code <span style="font-weight:bold">P</span><span style="letter-spacing:3mm;">....................................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0"/>
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
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:31mm">5</div>
							<div class="styLNDesc" style="width:141mm;height:31mm;">Is line 3 <span style="font-weight:bold;">more than</span> line 4?
							<p style="padding-left:3mm;">
							<span style="float:left;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/MovingExpensesDeductibleInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Checkbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MovingExpensesDeductibleInd"/>
									</xsl:call-template>
								</input>
							</span>
							<span style="height:8mm;float:left;font-weight:bold;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/MovingExpensesDeductibleInd"/>
									</xsl:call-template>
									No.
								</label>
							</span> 
							
							You <span style="font-weight:bold;">cannot</span> deduct your moving expenses. If line 3 is less than line 4, subtract line 3 from line 4 and include the result on Form 1040, line 7, or Form 1040NR, line 8.</p>
							<p style="padding-left:3mm;padding-top:2mm;">
							<span style="float:left;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/MovingExpensesDeductibleInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Checkbox" name="Checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MovingExpensesDeductibleInd"/>
									</xsl:call-template>
								</input>
							</span>
							<span style="height:8mm;float:left;font-weight:bold;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/MovingExpensesDeductibleInd"/>
									</xsl:call-template>
									Yes.
								</label>
							</span> 
							
							Subtract line 4 from line 3. Enter the result here and on Form 1040, line 26, or Form 1040NR, line 26. This is your <b>moving expense deduction</b><span style="letter-spacing:3mm">................</span></p>
							</div>
							<div class="styLNRightNumBox" style="height:27mm;border-bottom:none;background-color:lightgrey;text-align:left;"/>
							<div class="styLNAmountBox" style="height:27mm;border-bottom:none;"/>

							<div class="styLNRightNumBox" style="height:4mm;padding-left:1.66mm;text-align:center;">								5</div>
							<div class="styLNAmountBox" style="height:4mm;">
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
							<b>For Paperwork Reduction Act Notice, see your return instructions.</b>
						</div>
						<div style="float:right">
						Cat. No. 12490K
						<span style="width:15mm"/>
						Form <b style="font-size:9pt">3903</b> (2012)
						</div>
					</div>
					<div class="pageEnd"/>
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
