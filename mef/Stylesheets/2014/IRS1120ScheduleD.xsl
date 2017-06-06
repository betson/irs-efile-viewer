<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120ScheduleDStyle.xsl"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1120ScheduleD"/>
	<xsl:template match="/">
		<html>
			<head>
				<!-- HERE ie11 COMPATIBILITY -->
				<meta http-equiv="X-UA-Compatible" content="IE=5"/>
				<!-- Set Document Title -->
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
				<!-- Set Target to Top -->
				<!-- <meta http-equiv="Window-target" content="_top" /> -->
				<!-- Set Filename and Description -->
				<meta name="Description" content="Schedule D (Form 1120)"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">	
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120ScheduleDStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1120ScheduleD">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;">
						<div class="styFNBox" style="width:33.5mm;height:19mm;border-right-width:.5mm;">
							<div class="styFormNumber" style="font-size: 10pt;">SCHEDULE D
							<br/>
							<div class="styFormNumber" style="font-size: 9pt;">
							  (Form 1120)
							</div>	      
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>			  
							<br/>
							<div class="IRS1120ScheduleD_styAgency" style="height:25px;line-height:11px;">
							  Department of the Treasury<br/>Internal Revenue Service
							</div>
						</div>
					</div>
					<div class="styFTBox" style="width:122.5mm;height:19mm;">
						<div class="styMainTitle" style="height:6mm;">
						  Capital Gains and Losses
						</div>
						<div class="styFST" style="font-size:7pt;text-align:center;">
							<!-- EXCEPTION: browser display as one line but print out/print preview is display as two line -->
							<img src="{$ImagePath}/1120SchD_Bullet.gif" alt="Right arrow"/>  
							  Attach to Form 1120, 1120-C, 1120-F, 1120-FSC, 1120-H, 1120-IC-DISC, 1120-L, 1120-ND, 1120-PC, 1120-POL, 1120-REIT, 1120-RIC, 1120-SF, or certain Forms 990-T.
							<br/>
							<span style="font-weight:bold; ">
								<img src="{$ImagePath}\8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
								Information about Schedule D (Form 1120) and its separate instructions is at 
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1120" title="Link to IRS.gov">
								  <i>www.irs.gov/form1120.</i>
								</a>
							</span>
						</div>
					</div>
					<div class="styTYBox" style="width:30mm;height:19mm;border-left-width:.5mm;">
						<div class="styOMB" style="height:2mm;">OMB No. 1545-0123</div>
						<br/>
						<div class="styTY" style="height:11mm;">20<span class="styTYColor">14</span></div>
					</div>
				</div>
				<!-- END FORM HEADER -->
				<!-- BEGIN TAXPAYER INFO -->
				<div style="width:707px;float:left;clear:left;border-top:1 solid black;">
					<!-- Name -->
					<div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;font-weight:normal;">
						Name
						<br/>
						<span>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<div>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!-- EIN -->
					<div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
						Employer identification number
						<br/>
						<br/>
						<div style="text-align:left;font-weight:normal;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
					<!-- END TAXPAYER INFO -->
					<!-- BEGIN PART I HEADER -->
					<div class="IRS1120ScheduleD_styPartHdr" style="width:707px;float:left;clear:both;">
						<div style="width:607px; float:left;">
							<span style="width:76px">
								<span class="styPartName" style="width: 15mm; height: 4mm;">Part I</span>
							</span>
							<span style="height:4mm;">
							  Short&#8211;Term Capital Gains and Losses&#8211;Assets Held One Year or Less
							</span>
						</div>
					</div>
					<!-- END PART I HEADER -->
					<!-- print logic -->
					<xsl:call-template name="SetInitialState"/>
					<!-- end -->
					<table class="styTable" style="width:187mm;border-color:black" cellspacing="0" summary="Short-Term Capital Gains and Losses--Assets Held One Year or Less">
						<tr valign="top">
							<th class="IRS1120ScheduleD_DescCol" style="
							font-weight:normal;width:48mm;text-align:left;padding-left:8mm;" colspan="2" scope="col">
								See instructions for how to figure the
								amounts to enter on the lines below.<br/><br/>					
							    This form may be easier to complete if you round off cents to whole dollars.
                </th>
							<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
								<b>(d)<br/>
								</b>Proceeds<br>(sales price)</br>
							</th>
							<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
								<b>(e)</b>
								<br/> Cost <br>(or other basis)</br>
							</th>
							<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:left;" scope="col">
								<b>(g)</b> Adjustments to gain or loss from Form(s) 8949, Part 1, line 2, column (g)</th>
							<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:35mm;text-align:left;border-right-width:0px;" scope="col">
								<b>(h) Gain or (loss)</b> Subtract column (e) from column (d) and combine the result with column (g) </th>
						</tr>
						<!-- part I body -->				
						<tr>
						<td class="styLNLeftNumBoxBB" style="width:5mm;padding-left:3mm;vertical-align:top;">1a</td>
						<td class="IRS1120ScheduleD_DescCol" scope="row" style="vertical-align:top;">Totals for all short-term 
							 transactions reported on Form 1099-B for which basis was reported to the IRS and for which you have no adjustments (see instructions). However, if  you choose to report all these transactions on Form 8949, leave this line blank and go to line 1b</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;padding-left:16px;width:33mm;">						    
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="  padding-left:16px;vertical-align:bottom;width:31mm;background-color:lightgrey;">
								<span style="width:1mm;"> </span>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;width:35mm;border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="styLNLeftNumBoxBB" style="width:5mm;padding-left:3mm;vertical-align:top;">1b</td>
									<td class="IRS1120ScheduleD_DescCol" scope="row" style="vertical-align:top;">Totals for all transactions 
								 reported on Form(s) 8949 with <b>Box A </b>checked</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;width:31mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;width:35mm;border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>				
						<td class="styLNLeftNumBoxBB" style="width:5mm;padding-left:3mm;vertical-align:top;">2</td>	
						<td class="IRS1120ScheduleD_DescCol" scope="row" style="vertical-align:top;">Totals for all transactions 
								 reported on Form(s) 8949 with <b>Box B </b>checked  </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>) 
              </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;width:31mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;width:35mm;border-right-width:0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!--line 3-->
						<tr>
						<td class="styLNLeftNumBoxBB" style="width:5mm;padding-left:3mm;vertical-align:top;">3</td>
						<td class="IRS1120ScheduleD_DescCol" scope="row" style="vertical-align:top;">Totals for all transactions 
								 reported on Form(s) 8949 with <b>Box C </b>checked  </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>) 
              </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;width:31mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;width:35mm;border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- END PART I TABLE -->
					<!-- BEGIN LINE 4 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Short-term capital gain from installment sales from Form 6252, line 26 or 37 </span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.60mm;">4</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/STCapGainInstalSlsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 4 -->
					<!-- BEGIN LINE 5 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Short-term capital gain or (loss) from like-kind exchanges from Form 8824</span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.60mm;">5</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/STCapGainLossLikeKindExchAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 5 -->
					<!-- BEGIN LINE 6 :EXCEPTION Per  Gwen Chambliss' email response to IBM Defect 20437 dated 9/19/08 to allow the descrepancy between Schema and Style sheet.  

                  Where Schema efile data type as USAMOUNT which allow neg and pos amount present in a hardcode bracket line 

                  and Style sheet guideline indicate only pos amount allow in a hard coded bracket line.-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Unused capital loss carryover (attach computation)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/UnusedCapitalLossCarryoverAmt"/>
									</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.60mm;">6</div>
						<div class="styLNAmountBox" style="width:35mm;">
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnusedCapitalLossCarryoverAmt"/>
							</xsl:call-template>)
						</div>
					</div>
					</div>
					<!-- END LINE 6 -->
					<!-- BEGIN LINE 7 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Net short-term capital gain or (loss). Combine lines 1a through 6 in column h </span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.60mm;border-bottom-width:0px">7</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 7 -->
					<!-- BEGIN PART II HEADER -->
					<div class="IRS1120ScheduleD_styPartHdr" style="width:707px;height:16px;">
						<span style="float:left;clear:left;">
							<span style="width:76px;">
								<span class="styPartName" style="width: 15mm; height: 4mm;">Part II</span>
							</span>
							<span style="width:613px;height:14px;">Long&#8211;Term Capital Gains and Losses&#8211;Assets Held More Than One Year</span>
						</span>
					</div>
					<!-- END PART II HEADER -->
					<table class="styTable" style="width:187mm;border-color:black" cellspacing="0">
						<tr valign="top">
							<th class="IRS1120ScheduleD_DescCol" style="
							font-weight:normal;width:48mm;text-align:left;padding-left:8mm;" colspan="2" scope="col">
								See instructions for how to figure the
								amounts to enter on the lines below.<br/><br/>					
							    This form may be easier to complete if you round off cents to whole dollars.
                </th>
							<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
								<b>(d)<br/>
								</b>Proceeds<br>(sales price)</br>
							</th>
							<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
								<b>(e)</b>
								<br/> Cost <br>(or other basis)</br>
							</th>
							<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:left;" scope="col">
								<b>(g)</b> Adjustments to gain or loss from Form(s) 8949, Part II, line 2, column (g)</th>
							<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:left;border-right-width:0px;" scope="col">
								<b>(h) Gain or (loss)</b> Subtract column (e) from column (d) and combine the result with column (g) </th>
						</tr>
						<!-- part II  body -->
						<!--Line 8a-->
						<tr>

						<td class="styLNLeftNumBoxBB" style="width:5mm;padding-left:2mm;vertical-align:top;">8a</td>	
						<td class="IRS1120ScheduleD_DescCol" scope="row" style="vertical-align:top;">Totals for all long-term 
							  transactions reported on Form 1099-B for which basis was reported to the IRS and for which you have no adjustments (see instructions). However, if you choose to report all these transactions on Form 8949, leave this line blank and go to line 8b</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">						    
									(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template> )
								</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;width:31mm;background-color:lightgrey;">
								<span style="width:1mm;"> </span>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>					
						<td class="styLNLeftNumBoxBB" style="width:5mm;padding-left:2mm;vertical-align:top;">8b</td>					
						<td class="IRS1120ScheduleD_DescCol" scope="row" style="vertical-align:top;">Totals for all transactions 
								 reported on Form(s) 8949 with <b>Box D </b>checked  </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
									(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
								</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>				
						<td class="styLNLeftNumBoxBB" style="width:5mm;padding-left:2mm;vertical-align:top;">9</td>					
						<td class="IRS1120ScheduleD_DescCol" scope="row" style="vertical-align:top;">Totals for all transactions 
								 reported on Form(s) 8949 with <b>Box E </b>checked    </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
									(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>) 
								</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;border-right;width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>					
						<td class="styLNLeftNumBoxBB" style="width:5mm;padding-left:1mm;vertical-align:top;">10</td>					
						<td class="IRS1120ScheduleD_DescCol" scope="row" style="vertical-align:top;">Totals for all transactions 
								 reported on Form(s) 8949 with <b>Box F </b>checked    </td>	
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">

									(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
								</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- END PART II TABLE -->
					<!-- BEGIN LINE 11 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter gain from Form 4797, line 7 or 9 </span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.....................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">11</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form4797GainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 11 -->
					<!-- BEGIN LINE 12 -->
					<div style="width:187mm;">
					<div style="float:left;clear:none;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Long-term capital gain from installment sales from Form 6252, line 26 or 37 </span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">12</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LTCapGainInstalSlsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 12 -->
					<!-- BEGIN LINE 13 -->
					<div style="width:187mm;">
					<div style="float:left;clear:none;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Long-term capital gain or (loss) from like-kind exchanges from Form 8824 </span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">13</div>
						<div class="styLNAmountBox" style="width:35mm;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LTCapGainLossLikeKindExchAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- BEGIN LINE 14 -->
					<div style="width:187mm;">
					<div style="float:left;clear:none;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Capital gain distributions (see instructions) </span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">....................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">14</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- BEGIN LINE 15 -->
					<div style="width:187mm;">
					<div style="float:left;clear:none;">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Net long-term capital gain or (loss). Combine lines 8a through 14 in column h</span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;border-bottom-width:0px;">15</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 15 -->
					<!-- BEGIN PART III HEADER -->
					<div class="IRS1120ScheduleD_styPartHdr" style="width:707px;float:left;clear:left;">
						<span style="width:76px;">
								<span class="styPartName" style="width: 15mm; height: 4mm;">Part III</span>
						</span>Summary of Parts I and II
            </div>
					<!-- END PART III HEADER -->
					<!-- BEGIN LINE 16 -->
					<div style="width:187mm;">
					<div style="float:left;clear:none;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter excess of net short-term capital gain (line 7) over net long-term capital loss (line 15) </span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">....</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">16</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcNetSTGainOverNetLTLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 16 -->
					<!-- BEGIN LINE 17 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
						<div class="styLNLeftNumBox" >17</div>
						<div class="styLNDesc" style="width:139mm;">     
                Net capital gain. Enter excess of net long-term capital gain (line 15) over net short-term capital  loss
                <span style="float:left;">(line 7) </span>
							<!--Dotted Line-->
							<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">...............................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:4.75mm;">17</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetCapitalGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 17 -->
					<!-- BEGIN LINE 18 -->
					<div style="width:187mm;">
					<div style="float:left;clear:none;">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:139mm;">     
                Add lines 16 and 17. Enter here and on Form 1120, page 1, line 8, or the proper line on other returns. 
                <span style="float:left;"/>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">18</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 18 -->
					<!-- BEGIN NOTE -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="font-weight:bold;">Note: </span>
							<span style="font-style:italic;">If losses exceed gains, see <span style="font-weight:bold;">Capital losses</span> in the instructions.</span>
						</div>
					</div>
					<!-- END NOTE -->
					<!-- BEGIN FOOTER -->
					<div class="IRS1120ScheduleD_styFormFooter" style="width:707px;border-top-width: 1px;">
						<span style="width:104mm;font-weight:bold;font-size:7pt;" class="styGenericDiv">For Paperwork Reduction Act Notice, see the Instructions for Form 1120.</span>
						<span style="width:36mm;font-weight:normal;font-size:7pt;text-align:center;" class="styGenericDiv">Cat. No. 11460M</span>
						<span style="float:right;width:42mm;text-align:right;font-weight:bold;font-size:7pt;" class="styGenericDiv">Schedule D (Form 1120) 2014</span>
					</div>
					<!-- BEGIN FOOTER -->
				</form>
				<!-- leftover data table -->
				<br class="pageend"/>
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
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
