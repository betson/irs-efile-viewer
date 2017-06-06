<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120SScheduleDStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1120SScheduleD"/>
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
				<!-- No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1120S Schedule D"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120SScheduleDStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<!-- Standard Warning Line -->
				<div class="styGenericDiv" style=" width:187mm;">
					<xsl:call-template name="DocumentHeader"/>
				</div>
				<!-- BEGIN FORM HEADER -->
				<div class="styBB" style="width: 187mm">
					<!-- Form Name -->
					<div class="styFNBox" style="height: 21mm;width:28mm;">
						<span class="styFormNumber" style="font-size:10pt;">SCHEDULE D</span>
						<br/>
						<span class="styFormNumber" style="font-size:10pt;">(Form 1120S)
             <br/>
						<div class="styAgency" style="height:6mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
						</span>
						<div class="styAgency">Department of the Treasury<br/>Internal Revenue Service</div>
					</div>
					<!-- Form Title Box -->
					<div class="styFTBox" style="height: 21mm;width:131mm;">
						<!-- Form Title -->
						<span class="styMainTitle">Capital Gains and Losses and Built-in Gains</span>
						<br/>
						<span style="font-weight:bold;">
							<br/>
							<img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>Attach to Form 1120S.
              <br/>
							<img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>Use Form 8949 to list your transactions for lines 1b, 2, 3, 8b, 9, and 10.
              <br/>
							<img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>Information about Schedule D and its separate instructions is 
              <br/>
              at <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1120s">
								<i>www.irs.gov/form1120s</i>
							</a>.
    </span>
					</div>
					<!-- Tax Year Box -->
					<div class="styTYBox" style="height: 21mm;width:28mm;">
						<!-- OMB No. -->
						<div class="styOMB" style="text-align:center;">OMB No. 1545-0123</div>
						<!-- Tax Year -->
						<div class="styTY" style="text-align: center; padding-top: 2.8mm">
       20<span class="styTYColor">15</span>
						</div>
					</div>
				</div>
				<!-- Name and Address -->
				<div class="styBB" style="width:187mm;border-bottom-width:0px;">
					<div class="styNameBox" style="width:137mm;height:9mm;font-size:7pt;">
      Name<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styEINBox" style="width:50mm;height:9mm;padding-left:2mm;font-weight:bold;font-size:7pt;">
      Employer identification number <br/>
						<br/>
						<span style="width:40mm;text-align:left;font-weight:normal;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
					<!-- part I table header -->
					<!--Part I -->
					<div class="styBB" style="width:187mm;border-top-width:2px;">
						<div class="styPartName" style="width:15mm;height:4mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;"> 
                      Short-Term Capital Gains and Losses&#8212;Assets Held One Year or Less
          </div>
					</div>
					<!-- print logic -->
					<xsl:call-template name="SetInitialState"/>
					<!-- end -->
					<table class="IRS1120SScheduleD_styTable" style="width:187mm;" cellspacing="0" summary="Short-Term Capital Gains and Losses--Assets Held One Year or Less">
						<tr valign="top" style="border:1px solid black;border-top:0;border-left:0;">
							<th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:61mm;text-align:left;valign:top;" scope="col">
           See instructions for how to figure the amounts to enter on the lines below.<br/>
								<br/>
              This form may be easier to complete if you round off the cents to whole dollars.</th>
							<th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:center;" scope="col">
								<br/>
								<b> (d) </b>
								<br/> Proceeds<br/>  (sales price)</th>
							<th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:center;" scope="col">
								<br/>
								<b> (e) </b>
								<br/>Cost<br/> (or other basis)</th>
							<th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:center;" scope="col">
								<br/>
								<b>(g) </b>Adjustments to gain or loss from Form(s) 8949, Part I, line 2, column (g)</th>
							<th class="IRS1120SScheduleD_DescCol" style="border-right:none;font-weight:normal;width:32mm;text-align:center;" scope="col">
								<br/>
								<b>  (h) Gain or (loss)</b>Subtract column (e) from column (d) and combine the result with column (g)</th>
						</tr>
						<!-- part I body -->
						<tr style="border:1px solid black;border-top:0;border-left:0;">
							<td class="IRS1120SScheduleD_DescCol" scope="row">
								<span class="styLNLeftNumBoxSD" style="height:22mm;">1a</span>  
Totals for all short-term  transactions reported on  Form 1099-B for which  basis was reported to 
 the IRS and for which you  have no adjustments  (see instructions). However,  if you choose to report 
 all these transactions on  Form 8949, leave this line   blank and go to line 1b 
          <span class="styDotLn" style="float:right;">.........</span>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
						(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
					</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="background-color:lightgrey;">
								<span style="width:1.5mm;"/>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr style="border:1px solid black;border-top:0;border-left:0;">
							<td class="IRS1120SScheduleD_DescCol" scope="row">
								<span class="styLNLeftNumBoxSD" style="height:6mm;">1b</span>  
							Totals for all transactions reported on Form(s) 8949 with <b> Box A </b> checked	
							 <span class="styDotLn" style="float:right;"></span>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
							(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
					</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr style="border:1px solid black;border-top:0;border-left:0;">
							<td class="IRS1120SScheduleD_DescCol" scope="row">
								<span class="styLNLeftNumBoxSD" style="height:6mm;">2</span>  
						  Totals for all transactions reported on Form(s) 8949 with <b>Box B</b> checked 
							 <span class="styDotLn" style="float:right;"></span>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
					</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr style="border:1px solid black;border-top:0;border-left:0;">
							<td class="IRS1120SScheduleD_DescCol" scope="row">
								<span class="styLNLeftNumBoxSD" style="height:6mm;">3</span>  
                    Totals for all transactions reported on Form(s) 8949 with <b>Box C </b>checked
							 <span class="styDotLn" style="float:right;"></span>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
							(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>) 
                </td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- line 4 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:139mm;">
Shortterm capital gain from installment sales from Form 6252, line 26 or 37
          <span class="styDotLn" style="float:right;">..........</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/STCapGainInstalSlsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 5 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:139mm;">
Short term capital gain or (loss) from likekind exchanges from Form 8824
          <span class="styDotLn" style="float:right;">...........</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/STCapGainLossLikeKindExchAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 6 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:139mm;">
Tax on shortterm capital gain included on line 23 below
          <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnShortTermCapitalGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 7 double lines -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:139mm;height:8mm;">
							<b> Net shortterm capital gain or (loss). </b> Combine lines 1a through 6 in column (h). Enter here and on Form 1120S, Schedule K, line 7 or 10          
<span class="styDotLn" style="float:right;">........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">7</div>
						<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- part II header -->
					<div class="styBB" style="width:187mm;border-top-width:2px">
						<div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;">
                 Long-Term Capital Gains and Losses&#8212;Assets Held More Than One Year
          </div>
					</div>
					<table class="IRS1120SScheduleD_styTable" style="width:187mm;" cellspacing="0" summary="Short-Term Capital Gains and Losses--Assets Held One Year or Less">
						<tr valign="top" style="border:1px solid black;border-top:0;border-left:0;">
							<th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:61mm;text-align:left;" scope="col">
               See instructions for how to figure the amounts to enter on the lines below.<br/>
								<br/>
               This form may be easier to complete if you round off the cents to whole dollars.</th>
							<th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:center;" scope="col">
								<br/>
								<b>(d)</b>
								<br/> Proceeds<br/>(sales price)</th>
							<th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:center;" scope="col">
								<br/>
								<b> (e) </b>
								<br/>Cost<br/> (or other basis)</th>
							<th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:center;" scope="col">
								<br/>
								<b>(g)</b> Adjustments to gain or loss from Form(s) 8949, Part II, line 2, column (g)</th>
							<th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:center;border-right:0;" scope="col">
								<br/>
								<b>(h) Gain or (loss)</b> Subtract column (e) from column (d) and combine the result with column (g)</th>
						</tr>
						<!-- part II  body -->
						<tr style="border:1px solid black;border-top:0;border-left:0;">
							<td class="IRS1120SScheduleD_DescCol" scope="row">
								<span class="styLNLeftNumBoxSD" style="height:24mm;">8a</span>  
Totals for all long-term transactions reported on Form 1099-B for which basis was reported to the IRS and for which
 you have no adjustments (see instructions). However, if you choose to report all these transactions on Form 8949,
  leave this line blank and go to line 8b
          <span class="styDotLn" style="float:right;">.........</span>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
				</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;background-color:lightgrey;">
								<span style="width:1.5mm;"/>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr style="border:1px solid black;border-top:0;border-left:0;">
							<td class="IRS1120SScheduleD_DescCol" scope="row">
								<span class="styLNLeftNumBoxSD" style="height:6mm;">8b</span>  
							Totals for all transactions reported on Form(s) 8949 with <b> Box D </b> checked	
							 <span class="styDotLn" style="float:right;"></span>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
							(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
					</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr style="border:1px solid black;border-top:0;border-left:0;">
							<td class="IRS1120SScheduleD_DescCol" scope="row">
								<span class="styLNLeftNumBoxSD" style="height:6mm;">9</span>  
							Totals for all transactions reported on Form(s) 8949 with <b> Box E </b> checked	
							 <span class="styDotLn" style="float:right;"></span>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
							(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
					</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr style="border:1px solid black;border-top:0;border-left:0;">
							<td class="IRS1120SScheduleD_DescCol" scope="row">
								<span class="styLNLeftNumBox" style="height:6mm;">10</span>  
							Totals for all transactions reported on Form(s) 8949 with <b> Box F </b> checked	
							 <span class="styDotLn" style="float:right;"></span>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
							(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
					</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- line 11-->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Longterm capital gain from installment sales from Form 6252, line 26 or 37</span>
							<span class="styDotLn" style="float:right;">..........</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LTCapGainInstalSlsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 12-->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Longterm capital gain or (loss) from likekind exchanges from Form 8824</span>
							<span class="styDotLn" style="float:right;">..........</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LTCapGainLossLikeKindExchAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 13-->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Capital gain distributions (see instructions)</span>
							<span class="styDotLn" style="float:right;">.....................</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 14 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Tax on longterm capital gain included on line 23 below</span>
							<span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnLongTermCapitalGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 15double lines -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="font-weight:bold;">Net longterm capital gain or (loss). </span> Combine lines 8a through 14 in column (h).  Enter here and on Form 
        </div>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="IRS1120SScheduleD_LineContainer" style="border-bottom:2px solid black;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">1120S, Schedule K, line 8a or 10</span>
							<span class="styDotLn" style="float:right;">........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">15</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div style="width:187mm;">
						<div style="float:left;">
							<span class="styBoldText" style="width:115mm">For Paperwork Reduction Act  Notice, see the Instructions for Form 1120S.</span>
      Cat. No. 11516V
    </div>
						<div style="float:right;">
							<span style="width:9px;"/>  
      Schedule D <span class="styBoldText" style="font-size:6pt;">(Form 1120S)</span> 2015
    </div>
					</div>
					<!-- END Page Break and Footer-->
				</div>
				<!--Begin Page 2 -->
				<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
					<p style="page-break-before: always"/>
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Schedule D (Form 1120S) 2015<span style="width:132mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- part III header-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:4mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;"> 
           BuiltIn Gains Tax
          <span class="styNormalText">(See instructions
         <span class="styBoldText">before</span>
       completing this part.)</span>
						</div>
					</div>
					<!-- line 16 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:139mm;">Excess of recognized builtin gains over recognized builtin losses (attach computation statement)
      <span style="width:3px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsOverLossesAmt"/>
							</xsl:call-template>
							<span class="styDotLn" style="float:right;">..</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsOverLossesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 17 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Taxable income (attach computation statement)
             <span style="width:3px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTaxableIncomeAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 18 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Net recognized builtin gain. Enter the smallest of line 16, line 17, or line 8 of Schedule B</span>
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetRecognizedBuiltInGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 19 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Section 1374(b)(2) deduction</span>
							<span class="styDotLn" style="float:right;">........................</span>
						</div>
						<div class="styLNRightNumBox">19</div>
						<div class="styLNAmountBox" style="border-right-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section1374b2DeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 20 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Subtract line 19 from line 18. If zero or less, enter 0 here and on line 23.</span>
							<span class="styDotLn" style="float:right;">..........</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetBuiltInGainLessDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 21 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter 35% of line 20</span>
							<span class="styDotLn" style="float:right;">...........................</span>
						</div>
						<div class="styLNRightNumBox">21</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetBuiltInGainLessPctDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 22 -->
					<div class="IRS1120SScheduleD_LineContainer">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width:139mm;">
          Section 1374(b)(3) business credit and minimum tax credit carryforwards from C corporation years
            <span class="styDotLn" style="float:right;">...</span>
						</div>
						<div class="styLNRightNumBox">22</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessAndMinimumTaxCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 23 -->
					<div class="IRS1120SScheduleD_LineContainer" style="border-bottom:2px solid black;">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width:139mm;">
							<b> Tax. </b> Subtract line 22 from line 21 (if zero or less, enter 0). Enter here and on Form 1120S, page 1, line 22b
        </div>
						<div class="styLNRightNumBoxNBB">23</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- footer line -->
					<div style="width:187mm;text-align:right;">
						<b>Schedule D (Form 1120S) 2015</b>
					</div>
				</div>
				<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
					<p style="page-break-before: always"/>
					<!-- BEGIN Left Over Table -->
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
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
