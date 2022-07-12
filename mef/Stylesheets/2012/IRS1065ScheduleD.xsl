<?xml version="1.0" encoding="UTF-8"?>
<!--Created by Doug Peterson 6-27-2006 submitted for inspection 7-13-2006-->
<!-- Last Modified by Eugenia McDonald on 02/08/2013 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065ScheduleDStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1065SchDData" select="$RtnDoc/IRS1065ScheduleD"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1065SchDData)"/>
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
				<meta name="Description" content="IRS Form 1065 Schedule D"/>
				<xsl:call-template name="InitJS"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065ScheduleDStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1065ScheduleD">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;height:23mm;">
						<div class="styFNBox" style="width:26mm;height:23mm;">
							<div style="height:10mm">
								<span class="styFormNumber" style="font-size:9.5pt;">SCHEDULE D<br/>(Form 1065)<br/>
								</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065SchDData"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:5mm;padding-bottom:none">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:23mm;">
							<div class="styMainTitle" style="height:5mm;padding-top:1mm;t">Capital Gains and Losses</div>
							<br/>
							<span style="width:2mm"/>
							<!--<div class="styFBT" style="height:3mm;padding-top:none;padding:left:none">-->
							<img src="{$ImagePath}/1065SchD_Bullet.gif" alt="Bullet"/>
							<b> Attach to Form 1065 or Form 8865.</b>
							<br/>
							<img src="{$ImagePath}/1065SchD_Bullet.gif" alt="Bullet"/>
							<b> Use Form 8949 to list your transactions for lines 1, 2, 3, 8, 9, and 10.</b>
							<br/>
							<div style="text-align:left;">
								<span style="width:20mm"/>
								<img src="{$ImagePath}/1065SchD_Bullet.gif" alt="Bullet"/>
								<b> Information about Schedule D (Form 1065) and its separate <br/>
								<span style="width:34mm"/>instructions is at <i> www.irs.gov/form1065.</i></b>
							</div>
							<!--</div>-->
						</div>
						<div class="styTYBox" style="width:30mm;height:23mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0099</div>
							<div class="styTY" style="height:12.5mm;padding-top:3.5mm;">
							  20<span class="styTYColor">12</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:135mm;height:10mm;font-size:7pt;">
          Name of partnership<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
							<br/>
						</div>
						<div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-size:7pt;">
         Employer identification number<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Start Line 1 -->
					<!-- End Line 1 -->
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;height:3.75mm;">
						<div class="styPartName" style="height:3.75mm;font-size:9pt">Part I</div>
						<div class="styPartDesc" style="float:left;width:167mm;font-size:9pt"> 
						 Short-Term Capital Gains and Losses<img src="{$ImagePath}/1065SchD_Longdash.gif"
						  alt="Longdash"/>Assets Held One Year or Less</div>
					</div>
					<!-- END PART I TITLE -->
					<!-- BEGIN PART I TABLE -->
					<table class="styTable" cellspacing="0">
						<thead class="styTableThead" style="font-size:6.3pt">
							<tr>
								<th class="styTableCellHeader" style="width:1mm;border-right-width:0px;" scope="col"/>
								<th class="styTableCellHeader" style="width:69mm;font-weight:normal;text-align:left" 
								  scope="col">
								  Complete Form 8949 before completing<br/>
									<span style="width:15mm"/> line 1, 2, or 3.<br/>
									This form may be easier to complete if you<br/>
									<span style="width:5mm"/> round off cents to whole dollars.</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col">
									<b>(d)</b> Sales price from Form(s)<br/>8949, line 2, column (d)</th>
								<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
									<b>(e)</b> Cost or other basis from<br/>Form(s) 8949, line 2, <br/>
									<span style="width:3mm"/>column (e)</th>
								<th class="styTableCellHeader" style="width:35mm;font-weight:normal;" scope="col">
									<b>(g)</b> Adjustments to gain or<br/>loss from Form(s) 8949,<br/>
									<span style="width:4mm"/>line 2, column (g)</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;
								  border-right-width:0px;" scope="col"><b>(h)</b><b> Gain or (loss).</b> Combine
								  <br>columns (d), (e), and (g)</br></th>
							</tr>
						</thead>
						<tfoot/>
						<tbody style="font-size:7pt">
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;
								  border-right-width:0px;font-weight:bold;" scope="col">1</td>
								<td class="styTableCell" style="text-align:left;width:51mm;padding-top:10px">
								  Short-term totals from all Forms 8949<br/>with <b>box A </b> checked in <b>Part I</b></td>
								<td class="styTableCell" style="width:35mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065SchDData/ShortTermFromF8949BoxA/SalesPrice"/>
										</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065SchDData/ShortTermFromF8949BoxA/CostOrOtherBasis"/>
										</xsl:call-template>
									<span style="width:4mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
									select="$Form1065SchDData/ShortTermFromF8949BoxA/CostOrOtherBasis"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
							select="$Form1065SchDData/ShortTermFromF8949BoxA/AdjustmentsToGainOrLoss"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
									      select="$Form1065SchDData/ShortTermFromF8949BoxA/GainOrLoss"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;
								  border-right-width:0px;font-weight:bold;" scope="col">2</td>
								<td class="styTableCell" style="text-align:left;width:51mm;padding-top:10px">
								  Short-term totals from all Forms 8949<br/>with <b>box B</b> checked in <b>Part I</b></td>
								<td class="styTableCell" style="width:35mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065SchDData/ShortTermFromF8949BoxB/SalesPrice"/>
										</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" 
								select="$Form1065SchDData/ShortTermFromF8949BoxB/CostOrOtherBasis"/>
										</xsl:call-template>
									<span style="width:4mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
								select="$Form1065SchDData/ShortTermFromF8949BoxB/CostOrOtherBasis"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
							select="$Form1065SchDData/ShortTermFromF8949BoxB/AdjustmentsToGainOrLoss"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
									      select="$Form1065SchDData/ShortTermFromF8949BoxB/GainOrLoss"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;
								  border-right-width:0px;font-weight:bold;" scope="col">3</td>
								<td class="styTableCell" style="text-align:left;width:51mm;padding-top:10px">
								  Short-term totals from all Forms 8949<br/>with <b>box C</b> checked in <b>Part I</b></td>
								<td class="styTableCell" style="width:35mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065SchDData/ShortTermFromF8949BoxC/SalesPrice"/>
									</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" 
								select="$Form1065SchDData/ShortTermFromF8949BoxC/CostOrOtherBasis"/>
										</xsl:call-template>
									<span style="width:4mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
								select="$Form1065SchDData/ShortTermFromF8949BoxC/CostOrOtherBasis"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
							select="$Form1065SchDData/ShortTermFromF8949BoxC/AdjustmentsToGainOrLoss"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
									      select="$Form1065SchDData/ShortTermFromF8949BoxC/GainOrLoss"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- END PART I TABLE -->
					<!-- Start Line 4 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>4</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Short-term capital gain from installment sales from Form 6252, line 26 or 37
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:.5px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox">
							<br/>4</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065SchDData/STCapitalGainInstallmentSales"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 4 -->
					<!-- Start Line 5 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>5</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Short-term capital gain or (loss) from like-kind exchanges from Form 8824
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:7px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm">
							<br/>5</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065SchDData/STCapitalGainLossFromLikeKind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 5-->
					<!-- Start Line 6 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>6</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Partnership's share of net short-term capital gain (loss), including specially allocated short-
							<br/>term capital gains (losses), from other partnerships, estates, and trusts
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="padding-top:4mm;height:8mm;border-bottom-width:1px">
							<br/>6</div>
						<div class="styLNAmountBox" style="height:8mm; padding-top:4mm;
						     border-bottom-width:1px">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065SchDData/PartnersShareShortTermGainLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 6 -->
					<!-- Start Line 7 -->
					<div class="styBB" style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>7</div>
						<div class="styLNDesc" style="width:139mm;">
							<span class="styBoldText">
								<br/>Net short-term capital gain or (loss).</span> Combine lines 1 through 6 in column (h).
								 Enter <br/>here and on Form 1065, Schedule K, line 8 or 11; or Form 8865, Schedule K, 
								 line 8 or 11
                                <!--Dotted Line-->
							    <span class="styBoldText">
								   <span style="width:5px"/>.
                                </span>
						</div>
						<div class="styLNRightNumBoxNBB" style="padding-top:4mm; width:8mm;height:12mm;
						    border-bottom-width:0px;">
							<br/>7</div>
						<div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px;padding-top:4mm">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065SchDData/NetShortTermCapitalGainLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 7 -->
					<!-- BEGIN PART 2 TITLE -->
					<div class="styBB" style="width:187mm;height:3.75mm;border-top-width:1px;">
						<div class="styPartName" style="height:3.75mm;font-size:9pt">Part II</div>
						<div class="styPartDesc" style="float:left;width:167mm;font-size:9pt">
						  Long-Term Capital Gains and Losses<img src="{$ImagePath}/1065SchD_Longdash.gif"
						   alt="Longdash"/>Assets Held More Than One Year</div>
					</div>
					<!-- END PART II TITLE -->
					<!-- BEGIN PART II TABLE -->
					<table class="styTable" cellspacing="0">
						<thead class="styTableThead" style="font-size:6.3pt">
							<tr>
								<th class="styTableCellHeader" style="width:1mm;border-right-width:0px;" scope="col"/>
								<th class="styTableCellHeader" style="width:69mm;font-weight:normal;text-align:left"
								  scope="col">
								  Complete Form 8949 before completing<br/>
									<span style="width:15mm"/> line 8, 9, or 10<br/>
									 This form may be easier to complete if you<br/>
									<span style="width:5mm"/> round off cents to whole dollars. </th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col">
									<b>(d)</b> Sales price from Form(s)<br/>8949, line 4, column (d)</th>
								<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
									<b>(e)</b> Cost or other basis from<br/>Form(s) 8949, line 4,<br/>
									 <span style="width:4mm"/>column (e)</th>
								<th class="styTableCellHeader" style="width:35mm;font-weight:normal;" scope="col">
									<b>(g)</b> Adjustments to gain or<br/>loss from Form(s) 8949,<br/>
									<span style="width:4mm"/>line 4, column (g)</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;
								  border-right-width:0px;" scope="col"><b>(h)</b> <b> Gain or Loss.</b> Combine
								  <br/><span style="width:1.5mm"/>columns (d), (e), and (g)<br/>
								</th>
							</tr>
						</thead>
						<tfoot/>
							<tbody style="font-size:7pt">
								<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;
								  border-right-width:0px;font-weight:bold;" scope="col">8</td>
								<td class="styTableCell" style="text-align:left;width:51mm;padding-top:10px">
								  Long-term totals from all Forms 8949<br/>with <b>box A</b> checked in <b>Part II</b></td>
								<td class="styTableCell" style="width:35mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065SchDData/LongTermFromF8949BoxA/SalesPrice"/>
										</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" 
									select="$Form1065SchDData/LongTermFromF8949BoxA/CostOrOtherBasis"/>
										</xsl:call-template>
									<span style="width:4mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
									select="$Form1065SchDData/LongTermFromF8949BoxA/CostOrOtherBasis"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
							select="$Form1065SchDData/LongTermFromF8949BoxA/AdjustmentsToGainOrLoss"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
									      select="$Form1065SchDData/LongTermFromF8949BoxA/GainOrLoss"/>
									</xsl:call-template>
								</td>
							</tr>		
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;
								  border-right-width:0px;font-weight:bold;" scope="col">9</td>
								<td class="styTableCell" style="text-align:left;width:51mm;padding-top:10px">
								  Long-term totals from all Forms 8949<br/>with <b>box B</b> checked in <b>Part II</b></td>
								<td class="styTableCell" style="width:35mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065SchDData/LongTermFromF8949BoxB/SalesPrice"/>
										</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" 
								select="$Form1065SchDData/LongTermFromF8949BoxB/CostOrOtherBasis"/>
										</xsl:call-template>
									<span style="width:4mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
								select="$Form1065SchDData/LongTermFromF8949BoxB/CostOrOtherBasis"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
							select="$Form1065SchDData/LongTermFromF8949BoxB/AdjustmentsToGainOrLoss"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
									      select="$Form1065SchDData/LongTermFromF8949BoxB/GainOrLoss"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;
								  border-right-width:0px;font-weight:bold;" scope="col">10</td>
								<td class="styTableCell" style="text-align:left;width:51mm;padding-top:10px">
								  Long-term totals from all Forms 8949<br/>with <b>box C</b> checked in <b>Part II</b></td>
								<td class="styTableCell" style="width:35mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065SchDData/LongTermFromF8949BoxC/SalesPrice"/>
									</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" 
								select="$Form1065SchDData/LongTermFromF8949BoxC/CostOrOtherBasis"/>
										</xsl:call-template>
									<span style="width:4mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
								select="$Form1065SchDData/LongTermFromF8949BoxC/CostOrOtherBasis"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
							select="$Form1065SchDData/LongTermFromF8949BoxC/AdjustmentsToGainOrLoss"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
									      select="$Form1065SchDData/LongTermFromF8949BoxC/GainOrLoss"/>
									</xsl:call-template>
								</td>				
							</tr>		
						</tbody>
					</table>
					<!-- END PART II TABLE -->
					<!-- Start Line 11 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/>11</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Long-term capital gain from installment sales from Form 6252, line 26 or 37
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:7px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox">
							<br/>11</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065SchDData/LTCapitalGainInstallmentSales"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 11 -->
					<!-- Start Line 12 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/>12</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>     Long-term capital gain or (loss) from like-kind exchanges from Form 8824
                            <!--Dotted Line-->
							<span class="styBoldText">
							    <span style="width:13px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox">
							<br/>12</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065SchDData/LTCapitalGainLossFromLikeKind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 12 -->
					<!-- Start Line 13 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/>13</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Partnership's share of net long-term capital gain (loss), including specially allocated long-
							<br/>term capital gains (losses), from other partnerships, estates, and trusts
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:13px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="padding-top:4mm;height:8mm;">
							<br/>13</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065SchDData/PartnersShareLongTermGainLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 13 -->
					<!-- Start Line 14 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/>14</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Capital gain distributions (see instructions)
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:7px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:1px">
							<br/>14</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/CapitalGainDistributions"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 14 -->
					<!-- Start Line 15 -->
					<div style="width:187mm;border-bottom:solid black 2px;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/>15</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>
							<span class="styBoldText">Net long-term capital gain or (loss). </span> 
							Combine lines 8 through 14 in column (h). Enter <br/>here and on Form 1065, Schedule K, line 9a 
							or 11; or Form 8865, Schedule K, line 9a or 11
                            <!--Dotted Line-->
							<!--<span class="styBoldText">
								<span style="width:2px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:4mm;height:8mm;border-bottom-width:0px;">
							<br/>15</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065SchDData/NetLongTermCapitalGainLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;font-size:7pt">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 1065.</span>
							<span style="width:12mm;"/>Cat. No. 11393G
                        </div>
						<div style="float:right;">
							<span class="styBoldText">Schedule D (Form 1065) 2012</span>
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<br/>
					<br/>
					<!--
 ************************************************************************************
-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1065SchDData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
