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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<!-- HERE ie11 COMPATIBILITY  -->
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
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form1120ScheduleD">
					<xsl:call-template name="DocumentHeader"/>
					<!-- BEGIN FORM HEADER -->
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:33.5mm;height:19mm;border-right-width:.5mm;">
							<div class="styFormNumber" style="font-size: 10pt;height:13mm">
								SCHEDULE D
								<br/>
								  (Form 1120)
								  <br/>
								<!-- General Dependency Push Pin -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>			  						
							</div>
							<div class="styAgency" style="font-weight:normal;height:6mm">
							  Department of the Treasury<br/>Internal Revenue Service
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
						<div class="styOMB" style="height:5mm;">OMB No. 1545-0123</div>
						<div class="styTY" style="padding-top:1mm;height:14mm;">20<span class="styTYColor">16</span></div>
					</div>
				</div>
				<!-- END FORM HEADER -->
				<!-- BEGIN TAXPAYER INFO -->
				<div style="width:187mm;float:left;clear:left;border-top:1 solid black;">
					<!-- Name -->
					<div class="styNameBox" style="width:132mm; height:9mm; font-size:7pt;">
						Name
						<br/>
						<span>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
						</span>
					</div>
					<!-- EIN -->
					<div class="styEINBox" style="width:50mm;height:4mm;font-size:7pt;padding-left:2mm;">
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
					<div class="IRS1120ScheduleD_styPartHdr">
						<span class="styPartName" style="margin-right:1mm;">Part I</span>
						  Short&#8211;Term Capital Gains and Losses&#8211;Assets Held One Year or Less
					</div>
					<!-- END PART I HEADER -->
					<!-- print logic -->
					<xsl:call-template name="SetInitialState"/>
					<!-- end -->
					<div style="width:187mm; float:left;">
					<!-- commented out summary="Short-Term Capital Gains and Losses - Assets Held One Year or Less" -->
					<!-- due to JAWS issue where it is being read by JAWS but does not show in the display -->					
					<table class="styTable" style="width:187mm;border-color:black;" cellspacing="0" >
						<tr valign="top" style="width:187mm;">
							<th class="IRS1120ScheduleD_DescCol" style="padding-left:8.5mm;" colspan="2" scope="col">
								<b>See instructions for how to figure the
								amounts to enter on the lines below.</b><br/><br/>					
							    This form may be easier to complete if you round off cents to whole dollars.
							</th>
							<th class="IRS1120ScheduleD_DescColBody" style="text-align:center;" scope="col">
								<b>(d)<br/>
								</b>Proceeds<br>(sales price)</br>
							</th>
							<th class="IRS1120ScheduleD_DescColBody" style="text-align:center;" scope="col">
								<b>(e)</b>
								<br/> Cost <br>(or other basis)</br>
							</th>
							<th class="IRS1120ScheduleD_DescColBody" style="text-align:left;" scope="col">
								<b>(g)</b> Adjustments to gain or loss from Form(s) 8949, Part 1, line 2, column (g)</th>
							<th class="IRS1120ScheduleD_DescColBody" style="text-align:left;border-right-width:0px;" scope="col">
								<b>(h) Gain or (loss)</b> <br/>Subtract column (e) from column (d) and combine the result with column (g) </th>
						</tr>
						<!-- part I body -->				
						<!--line 1a-->
						<tr style="height:20mm;vertical-align:top;">
							<td class="IRS1120ScheduleD_styLNCtrNumNBox" style="height:20mm;">1a</td>
							<td class="IRS1120ScheduleD_DescCol" scope="row" style="width:48mm;">
								Totals for all short-term transactions reported on Form 1099-B for which basis was reported 
								to the IRS and for which you have no adjustments (see instructions). However, if  you choose 
								to report all these transactions on Form 8949, leave this line blank and go to line 1b
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">		
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="background-color:lightgrey;">
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!--line 1b-->
						<tr style="height:8.5mm;vertical-align:top;">
							<td class="IRS1120ScheduleD_styLNCtrNumNBox" style="height:8.5mm">1b</td>
							<td class="IRS1120ScheduleD_DescCol" scope="row" style="width:48mm;">Totals for all transactions 
								 reported on Form(s) 8949 with <b>Box A </b>checked</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!--line 2-->
						<tr style="height:8.5mm;vertical-align:top;">
							<td class="IRS1120ScheduleD_styLNCtrNumNBox" style="height:8.5mm">2</td>
							<td class="IRS1120ScheduleD_DescCol" scope="row" style="width:48mm;">Totals for all transactions 
								 reported on Form(s) 8949 with <b>Box B </b>checked  </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>) 
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!--line 3-->
						<tr style="height:8.5mm;vertical-align:top;">	
							<td class="IRS1120ScheduleD_styLNCtrNumNBox" style="height:8.5mm;">3</td>
							<td class="IRS1120ScheduleD_DescCol" scope="row" style="width:48mm;">Totals for all transactions 
								 reported on Form(s) 8949 with <b>Box C </b>checked  </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>) 
						    </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">	
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					</div>
					<!-- END PART I TABLE -->
					<!-- BEGIN LINE 4 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm">4</div>
						<div class="styLNDesc" style="width:141mm;">
							<span style="float:left;">Short-term capital gain from installment sales from Form 6252, line 26 or 37 </span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">...........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.60mm;">4</div>
						<div class="IRS1120ScheduleD_styLNAmountBox">
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
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm">5</div>
						<div class="styLNDesc" style="width:141mm;">
							<span style="float:left;">Short-term capital gain or (loss) from like-kind exchanges from Form 8824</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">...........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.60mm;">5</div>
						<div class="IRS1120ScheduleD_styLNAmountBox">
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
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm">6</div>
						<div class="styLNDesc" style="width:141mm;">
							<span style="float:left;">Unused capital loss carryover (attach computation)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/UnusedCapitalLossCarryoverAmt"/>
									</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">..................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.60mm;">6</div>
						<div class="IRS1120ScheduleD_styLNAmountBox">
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
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm">7</div>
						<div class="styLNDesc" style="width:141mm;">
							<span style="float:left;">Net short-term capital gain or (loss). Combine lines 1a through 6 in column h </span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">...........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.60mm;border-bottom-width:0px">7</div>
						<div class="IRS1120ScheduleD_styLNAmountBox" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 7 -->
					<!-- BEGIN PART II HEADER -->
					<div class="IRS1120ScheduleD_styPartHdr">
						<span class="styPartName" style="margin-right:1mm;">Part II</span>
							  Long&#8211;Term Capital Gains and Losses&#8211;Assets Held More Than One Year
					</div>					
					<!-- END PART II HEADER -->
					<div style="width:187mm; float:left;">
					<table class="styTable" style="width:187mm;border-color:black" cellspacing="0">
						<tr valign="top" style="width:187mm;">
							<th class="IRS1120ScheduleD_DescCol" style="padding-left:8.5mm;" colspan="2" scope="col">
							<b>See instructions for how to figure the
								amounts to enter on the lines below.</b><br/><br/>					
							    This form may be easier to complete if you round off cents to whole dollars.
							</th>
							<th class="IRS1120ScheduleD_DescColBody" style="text-align:center;" scope="col">
								<b>(d)<br/>
								</b>Proceeds<br>(sales price)</br>
							</th>
							<th class="IRS1120ScheduleD_DescColBody" style="text-align:center;" scope="col">
								<b>(e)</b>
								<br/> Cost <br>(or other basis)</br>
							</th>
							<th class="IRS1120ScheduleD_DescColBody" style="text-align:left;" scope="col">
								<b>(g)</b> Adjustments to gain or loss from Form(s) 8949, Part II, line 2, column (g)</th>
							<th class="IRS1120ScheduleD_DescColBody" style="text-align:left;border-right-width:0px;" scope="col">
								<b>(h) Gain or (loss)</b> <br/>Subtract column (e) from column (d) and combine the result with column (g) </th>
						</tr>
						<!-- part II  body -->
						<!--Line 8a-->
						<tr style="height:20mm;vertical-align:top;">
							<td class="IRS1120ScheduleD_styLNCtrNumNBox" style="height:20mm;">8a</td>
							<td class="IRS1120ScheduleD_DescCol" scope="row" style="width:48mm;">
							Totals for all long-term transactions reported on Form 1099-B for which basis was 
							reported to the IRS and for which you have no adjustments (see instructions). However, 
							if you choose to report all these transactions on Form 8949, leave this line blank and go to line 8b</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">				    
									(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
								</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="background-color:lightgrey;">
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!--Line 8b-->
						<tr style="height:8.5mm;vertical-align:top;">
							<td class="IRS1120ScheduleD_styLNCtrNumNBox" style="height:8.5mm">8b</td>		
							<td class="IRS1120ScheduleD_DescCol" scope="row" style="width:48mm;">Totals for all transactions 
								 reported on Form(s) 8949 with <b>Box D </b>checked  </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
									(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
								</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!--Line 9-->
						<tr style="height:8.5mm;vertical-align:top;">		
							<td class="IRS1120ScheduleD_styLNCtrNumNBox" style="height:8.5mm">9</td>					
							<td class="IRS1120ScheduleD_DescCol" scope="row" style="width:48mm;">
							    Totals for all transactions 
								reported on Form(s) 8949 with <b>Box E </b>checked    </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>) 
								</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!--Line 10-->
						<tr style="height:8.5mm;vertical-align:top;">		
						<td class="IRS1120ScheduleD_styLNCtrNumNBox" style="height:8.5mm;padding-left:2.75mm">10</td>						
							<td class="IRS1120ScheduleD_DescCol" scope="row" style="width:48mm;">
							Totals for all transactions reported on Form(s) 8949 with <b>Box F </b>checked</td>	
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
									(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
								</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					</div>
					<!-- END PART II TABLE -->
					<!-- BEGIN LINE 11 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD">11</div>
						<div class="styLNDesc" style="width:141mm;">
							<span style="float:left;">Enter gain from Form 4797, line 7 or 9 </span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">.....................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">11</div>
						<div class="IRS1120ScheduleD_styLNAmountBox">
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
						<div class="styLNLeftNumBoxSD">12</div>
						<div class="styLNDesc" style="width:141mm;">
							<span style="float:left;">Long-term capital gain from installment sales from Form 6252, line 26 or 37 </span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">..........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">12</div>
						<div class="IRS1120ScheduleD_styLNAmountBox">
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
						<div class="styLNLeftNumBoxSD">13</div>
						<div class="styLNDesc" style="width:141mm;">
							<span style="float:left;">Long-term capital gain or (loss) from like-kind exchanges from Form 8824 </span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">...........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">13</div>
						<div class="IRS1120ScheduleD_styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LTCapGainLossLikeKindExchAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- BEGIN LINE 14 -->
					<div style="width:187mm;">
					<div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD">14</div>
						<div class="styLNDesc" style="width:141mm;">
							<span style="float:left;">Capital gain distributions (see instructions) </span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">....................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">14</div>
						<div class="IRS1120ScheduleD_styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- BEGIN LINE 15 -->
					<div style="width:187mm;">
					<div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD">15</div>
						<div class="styLNDesc" style="width:141mm;">
							<span style="float:left;">Net long-term capital gain or (loss). Combine lines 8a through 14 in column h</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">..........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;border-bottom-width:0px;">15</div>
						<div class="IRS1120ScheduleD_styLNAmountBox" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 15 -->				
					<!-- BEGIN PART III HEADER -->
					<div class="IRS1120ScheduleD_styPartHdr">
						<span class="styPartName" style="margin-right:1mm;">Part III</span>
							  Summary of Parts I and II
					</div>	
					<!-- END PART III HEADER -->
					<!-- BEGIN LINE 16 -->
					<div style="width:187mm;">
					<div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD">16</div>
						<div class="styLNDesc" style="width:141mm;">
							<span style="float:left;">Enter excess of net short-term capital gain (line 7) over net long-term capital loss (line 15) </span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">.....</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">16</div>
						<div class="IRS1120ScheduleD_styLNAmountBox">
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
						<div class="styLNLeftNumBoxSD">17</div>
						<div class="styLNDesc" style="width:141mm;">
                Net capital gain. Enter excess of net long-term capital gain (line 15) over net short-term capital loss (line 7) 
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">.</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:4.75mm;">17</div>
						<div class="IRS1120ScheduleD_styLNAmountBox">
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
						<div class="styLNLeftNumBoxSD" style="height:7mm;">18</div>
						<div class="styLNDesc" style="width:141mm;">
							Add lines 16 and 17. Enter here and on Form 1120, page 1, line 8, or the proper line on other returns. If the <span style="float:left;">corporation has qualified timber gain, also complete Part IV.</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">...............</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="height:7mm;width:4.75mm;padding-top:3.5mm;">18</div>
						<div class="IRS1120ScheduleD_styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
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
						<div class="styLNDesc" style="width:100mm;">
							<span style="font-weight:bold;">Note: <span style="width:.5mm"/></span>
							<span> If losses exceed gains, see <span style="font-weight:bold;">Capital losses</span> in the instructions.</span>
						</div>
					</div>
					<!-- END NOTE -->
					<!-- BEGIN FOOTER -->
					<div class="IRS1120ScheduleD_styFormFooter">
						<span style="width:104mm;">For Paperwork Reduction Act Notice, see the Instructions for Form 1120.</span>
						<span style="width:36mm;text-align:center;font-weight:normal;">Cat. No. 11460M</span>
						<span style="width:42mm;text-align:right;float:right;">Schedule D (Form 1120) 2016</span>
					</div>
					<!-- BEGIN FOOTER -->
				</form>
				<br class="pageEnd" style="display:block"/>
				<p style="page-break-before:always"/>
				<!-- added part IV on new page per UWR 182767 -->
				  <!-- Page 2 -->
				  <!-- Page 2 Header -->
				  <div class="styBB" style="width:187mm;border-bottom:solid 0px;">
					<div style="float:left;">Schedule D (Form 1120) 2016</div>
					<div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
					</div>
				  </div>				
                <!-- BEGIN PART IV HEADER -->
                  <div class="IRS1120ScheduleD_styPartHdr" style="width:187mm;">
                      <div style="width:180mm;">
                            <div class="styPartName" style="width:16mm;" >Part IV</div>
                            <span style="width:3mm;"/>
                            <span style="width:160mm;font-weight:normal"> <b>Alternative Tax for Corporations with Qualified Timber Gain. </b>
                            <i>Complete Part  IV <span style="font-style:normal"><b>only</b></span> if the corporation has qualified timber gain under section 1201(b). Skip this part if you are filing Form 1120-RIC. See instructions.</i></span>                      
                      </div>                 
                </div> 
                <!-- END PART IV HEADER -->
                <!-- BEGIN LINE 19 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">19</div>
						<div class="styLNDesc" style="width:101.4mm;">
							<span style="float:left;">Enter qualified timber gain (as defined in section 1201(b)(2)) </span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">......</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox">19</div>
							<div class="styLNAmountBox" style="width:32.1mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedTimberGainAmt"/>
								</xsl:call-template>   
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;width:37.5mm;background-color:lightgrey;"/>
					</div>
                <!-- END LINE 19 -->
                <!-- BEGIN LINE 20 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">20</div>
						<div class="styLNDesc" style="width:101.4mm;">
							Enter taxable income from Form 1120, page 1, line 30, or the applicable line of <span style="float:left;">your tax return</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">....................</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">20</div>
							<div class="styLNAmountBox" style="height:7mm;width:32.1mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
								</xsl:call-template>       
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:37.5mm;background-color:lightgrey;"/>
					</div>
                <!-- END LINE 20 --> 
                <!-- BEGIN LINE 21 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">21</div>
						<div class="styLNDesc" style="width:101.4mm;">
							Enter the smallest of<b>:</b> (a) the amount on line 19; (b) the amount on line 20; or <span style="float:left;">(c) the amount on Part III, line 17</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">..............</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">21</div>
							<div class="styLNAmountBox" style="height:7mm;width:32.1mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
									 select="$FormData/SmallerAmt"/>
								</xsl:call-template>       
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:37.5mm;background-color:lightgrey;"/>
					</div>
                <!-- END LINE 21 --> 
                 <!-- BEGIN LINE 22 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">22</div>
						<div class="styLNDesc" style="width:141.5mm;">
							<span style="float:left;">Multiply line 21 by 23.8% (0.238)</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">........................</span>
						</div>
						<div style="float:left;width:37.5mm;">
							<div class="styLNRightNumBox">22</div>
							<div class="styLNAmountBox" style="width:29.5mm;">
							<xsl:call-template name="PopulateAmount">
							 	<xsl:with-param name="TargetNode" select="$FormData/SmallerTimesPercentAmt"/>
							</xsl:call-template>   
							</div>
						</div>
					</div>
                <!-- END LINE 22 -->              
                <!-- BEGIN LINE 23 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">23</div>
						<div class="styLNDesc" style="width:101.4mm;">
							<span style="float:left;">Subtract line 17 from line 20. If zero or less, enter -0-</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">.......</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox">23</div>
							<div class="styLNAmountBox" style="width:32.1mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetTaxableIncomeAmt"/>
								</xsl:call-template>   
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;width:37.5mm;background-color:lightgrey;"/>
					</div>
                <!-- END LINE 23 -->
                 <!-- BEGIN LINE 24 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">24</div>
						<div class="styLNDesc" style="width:141.5mm;">
							Enter the tax on line 23, figured using the Tax Rate Schedule (or applicable tax rate) appropriate for the return
							<span style="float:left;">with which Schedule D (Form 1120) is being filed</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">...................</span>
						</div>
						<div style="float:left;width:37.5mm;height:7mm;">
							<div class="styLNRightNumBox" style="height:7mm; padding-top:3.5mm;">24</div>
							<div class="styLNAmountBox" style="width:29.5mm;height:7mm; padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
							 	<xsl:with-param name="TargetNode" select="$FormData/TaxNetTaxableIncomeAmt"/>
							</xsl:call-template>   
							</div>
						</div>
					</div>
                <!-- END LINE 24 -->      
                <!-- BEGIN LINE 25 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">25</div>
						<div class="styLNDesc" style="width:101.4mm;">
							<span style="float:left;">Add lines 21 and 23</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">..................</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox">25</div>
							<div class="styLNAmountBox" style="width:32.1mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmallerPlusNetTaxableIncomeAmt"/>
								</xsl:call-template>   
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;width:37.5mm;background-color:lightgrey;"/>
					</div>
                <!-- END LINE 25 -->
                <!-- BEGIN LINE 26 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">26</div>
						<div class="styLNDesc" style="width:101.4mm;">
							<span style="float:left;">Subtract line 25 from line 20. If zero or less, enter -0-</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">........</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox">26</div>
							<div class="styLNAmountBox" style="width:32.1mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExcessTaxableIncomeAmt"/>
								</xsl:call-template>   
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;width:37.5mm;background-color:lightgrey;"/>
					</div>
                <!-- END LINE 26 -->
                 <!-- BEGIN LINE 27 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">27</div>
						<div class="styLNDesc" style="width:141.5mm;">
							<span style="float:left;">Multiply line 26 by 35% (0.35) </span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">.........................</span>
						</div>
						<div style="float:left;width:37.5mm;">
							<div class="styLNRightNumBox">27</div>
							<div class="styLNAmountBox" style="width:29.5mm;">
							<xsl:call-template name="PopulateAmount">
							 	<xsl:with-param name="TargetNode" select="$FormData/ExcessTaxableIncomeTimesPctAmt"/>
							</xsl:call-template>   
							</div>
						</div>
					</div>
                <!-- END LINE 27 -->   
                <!-- BEGIN LINE 28 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">28</div>
						<div class="styLNDesc" style="width:141.5mm;">
							<span style="float:left;">Add lines 22, 24, and 27</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">...........................</span>
						</div>
						<div style="float:left;width:37.5mm;">
							<div class="styLNRightNumBox">28</div>
							<div class="styLNAmountBox" style="width:29.5mm;">
							<xsl:call-template name="PopulateAmount">
							 	<xsl:with-param name="TargetNode" select="$FormData/CalculatedTaxAmt"/>
							</xsl:call-template>   
							</div>
						</div>
					</div>
                <!-- END LINE 28 -->                  
                 <!-- BEGIN LINE 29 -->
                <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">29</div>
						<div class="styLNDesc" style="width:141.5mm;">
							Enter the tax on line 20, figured using the Tax Rate Schedule (or applicable tax rate) appropriate for the return 
							<span style="float:left;">with which Schedule D (Form 1120) is being filed</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">...................</span>
						</div>
						<div style="float:left;width:37.5mm;height:7mm;">
							<div class="styLNRightNumBox" style="height:7mm; padding-top:3.5mm;">29</div>
							<div class="styLNAmountBox" style="width:29.5mm;height:7mm; padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
							 	<xsl:with-param name="TargetNode" select="$FormData/TaxOnTaxableIncomeAmt"/>
							</xsl:call-template>   
							</div>
						</div>
					</div>
                <!-- END LINE 29 -->  
                 <!-- BEGIN LINE 30 -->
                <div class="styTBB" style="width:187mm;height:7mm;">
						<div class="styLNLeftNumBoxSD">30</div>
						<div class="styLNDesc" style="width:141.5mm;">
							Enter the smaller of line 28 or line 29. Also enter this amount on Form 1120, Schedule J, line 2, or the applicable
							<span style="float:left;"> line of your tax return</span>
							<!--Dotted Line-->
							<span class="IRS1120ScheduleD_styDotLn">............................</span>
						</div>
						<div style="float:left;width:37.5mm;height:7mm;">
							<div class="styLNRightNumBox" style="height:7mm; padding-top:3.5mm;border-bottom-width:0px;">30</div>
							<div class="styLNAmountBox" style="width:29.5mm;height:7mm; padding-top:3.5mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
							 	<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxAmt"/>
							</xsl:call-template>   
							</div>
						</div>
					</div>
                <!-- END LINE 30 -->      
				             				
				<!-- leftover data table -->
				<p style="page-break-before:always"/>
					<div class="styLeftOverTitleLine" id="LeftoverData">
					<div class="styLeftOverTitle">
					  Additional Data        
					</div>
					<div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" 
						onclick="javascript:returnToWriteInImage();"/>
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
