<?xml version="1.0" encoding="UTF-8"?>
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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
						<div class="styFNBox" style="width:35mm;height:23mm;">
							<div style="height:10mm">
								<span class="styFormNumber" style="font-size:9.5pt;">SCHEDULE D<br/>(Form 1065)<br/>
								</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065SchDData"/>
								</xsl:call-template>
								<xsl:if test="$Form1065SchDData/RelatedPartyLikeKindExchInd">
                               <xsl:call-template name="LinkToLeftoverDataTableInline">
                                 <xsl:with-param name="Desc">Like-Kind Exchange, Related Party Exchange or Related Party Like-Kind Exchange</xsl:with-param>
                                 <xsl:with-param name="TargetNode" select="$Form1065SchDData/RelatedPartyLikeKindExchInd"/>
                              </xsl:call-template>
							</xsl:if>
							</div>
							<div style="padding-top:5mm;padding-bottom:none">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:122mm;height:23mm;">
							<div class="styMainTitle" style="height:5mm;padding-top:1mm;t">Capital Gains and Losses</div>
							<br/><br/><br/>
							<span style="width:2mm"/>
							<!--<div class="styFBT" style="height:3mm;padding-top:none;padding:left:none">-->
							<img src="{$ImagePath}/1065SchD_Bullet.gif" alt="Bullet"/>
							<span style="width:2px;"/><b> Attach to Form 1065 or Form 8865.</b>
							<br/>
							<img src="{$ImagePath}/1065SchD_Bullet.gif" alt="Bullet"/>
							<span style="width:2px;"/><b> Use Form 8949 to list your transactions for lines 1b, 2, 3, 8b, 9, and 10.</b>
							<br/>
							<div style="text-align:center;">
								<img src="{$ImagePath}/1065SchD_Bullet.gif" alt="Bullet"/>
								<span style="width:2px;"/><b>Go to
								<a style="text-decoration:none;color:black" href="http://www.irs.gov/Form1065" title="Link to IRS.gov">               
									<i>www.irs.gov/Form1065</i> for instructions and the latest information.
								</a></b>
							</div>
							<!--</div>-->
						</div>
						<div class="styTYBox" style="width:30mm;height:23.7mm;">
							<div class="styOMB" style="height:auto;">OMB No. 1545-0123</div>
							<div class="styTY" style="height:12.5mm;padding-top:3.5mm;">
							  20<span class="styTYColor">21</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:135mm;height:10mm;font-size:7pt;">
          Name of partnership<br/>
					<xsl:choose>
						<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
						<br/>
						  <span>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
						  </span>
						</xsl:when>
						  <xsl:otherwise>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							</xsl:otherwise>
					</xsl:choose>
						</div>
						<div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-size:7pt;">
         Employer identification number<br/>
					<xsl:choose>
						<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</xsl:when>
						  <xsl:otherwise>
						  <br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
							</xsl:otherwise>
					</xsl:choose>
						</div>
					</div>
					<div class="styBB" style="187mm;">
						<div class="styNameBox" style="width:187mm;border-right:0px solid black;padding-left:1mm;padding-top:1mm;font-size:8pt;">
							Did the partnership dispose of any investment(s) in a qualified opportunity fund during the tax year?
							<span style="width:.5mm;"/>
							<span style="float:right">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065SchDData/DisposeInvestmentQOFInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Dispose Investment Q O F Yes Indicator"  class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065SchDData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName" select="Form1065SchDData/DisposeInvestmentQOFInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1065SchDData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName" select="Form1065SchDData/DisposeInvestmentQOFInd"/>
									</xsl:call-template>
									<span style="padding-left:1mm;">Yes</span>
								</label>   
								<input type="checkbox" alt="Dispose Investment Q O F No Indicator" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065SchDData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName" select="Form1065SchDData/DisposeInvestmentQOFInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form1065SchDData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName" select="Form1065SchDData/DisposeInvestmentQOFInd"/>
									</xsl:call-template>
									<span style="padding-left:1mm;">No</span>
								</label>
							</span>
						</div>
						<div class="styNameBox" style="width:187mm;border-right:0px solid black;padding-left:1mm;font-size:8pt;">
							If “Yes,” attach Form 8949 and see its instructions for additional requirements for reporting your gain or loss.
						</div>
					</div>
					<!-- Start Line 1 -->
					<!-- End Line 1 -->
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;height:auto;">
						<div class="styPartName" style="height:auto;font-size:9pt">Part I</div>
						<div class="styPartDesc" style="float:left;width:167mm;font-size:9pt;height:auto;"> 
						 Short-Term Capital Gains and Losses - Generally Assets Held One Year or Less
							<span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- END PART I TITLE -->
					<!-- BEGIN PART I TABLE -->
					<div style="width:187mm;height:auto;">
					<table class="styTable" style="width:187mm;height:auto;" cellspacing="0">
						<thead class="styTableThead" style="font-size:6.3pt;">
							<tr>
							  <th class="styTableCellHeader" style="width:1mm;border-right-width:0px;" scope="col"/>
								<th class="styTableCellHeader" style="width:56mm;font-weight:normal;text-align:left"
								  scope="col">
								  See instructions for how to figure the<br/>
								  amounts to enter on the lines below.<br/>
								  This form may be easier to complete if you <br/>
								  round off cents to whole dollars.</th>
								<th class="styTableCellHeader" style="width:30mm;font-weight:normal;
								  padding-top:0mm;" scope="col">
									<span style="text-align:center;font-weight:bold">(d)</span><br/>
									<span style="text-align:center;">Proceeds</span><br/>
									<span style="text-align:center;">(sales price)</span></th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col">
									<span style="text-align:center;font-weight:bold">(e)</span><br/>
									<span style="text-align:center;">Cost</span><br/>
									<span style="text-align:center;">(or other basis)</span><br/></th>
								<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
								    <span style="text-align:center;font-weight:bold">(g)</span><br/>
								    <span style="text-align:center;">Adjustments to gain or <br/>loss from Form(s) 8949,</span><br/> 
							<!--		<b>(g)</b> Adjustments to gain or<br/>loss from Form(s) 8949,<br/> -->
									<span style="width:2mm"/>Part I, line 2, column (g)</th>
								<th class="styTableCellHeader" style="width:33mm;font-weight:normal;
								  border-right-width:0px;" scope="col"><b>(h)</b><b> Gain or (loss)</b><br/>
								  Subtract column (e) from<br/>column (d) and combine<br/>
								  the result with column (g)</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody style="font-size:7pt">
							<tr style="height:8mm">
							  <td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;
							    font-weight:bold;vertical-align:top;font-size:8pt" scope="col">1a</td>
								<td class="styTableCell" style="text-align:left;width:56mm;padding-top:0px;padding-left:14px">
								  Totals for all short-term<br/>transactions reported on Form<br/>
								  1099-B for which basis was<br/>reported to the IRS and for which<br/>
								  you have no adjustments (see <br/>instructions). However, if you<br/>
								  choose to report all these<br/>transactions on Form 8949,<br/>
								  leave this line blank and go to<br/>line 1b
									<span style="width:1.8mm"/>
									<span style=" letter-spacing:3.1mm; font-weight:bold; ">.........</span></td>
								<td class="styTableCell" style="width:30mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<!--<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065SchDData/TotalSTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>-->
								<!--<span style="width:4mm"/>-->
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;background-color:lightgrey">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BBssRptNoAdjGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;
								  font-weight:bold;vertical-align:top;font-size:8pt" scope="col">1b</td>
								<td class="styTableCell" style="text-align:left;width:56mm;padding-top:0px;padding-left:14px">
								  Totals for all transactions<br/>reported on Form(s) 8949 with<br/>
								  <b>Box A</b> checked
									<span style="width:1.8mm"/>
									<span style=" letter-spacing:3.1mm; font-weight:bold; ">.......</span></td>
								<td class="styTableCell" style="width:30mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" 
											select="$Form1065SchDData/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
									<span style="width:3mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;
								  font-weight:bold;vertical-align:top;font-size:8pt" scope="col">2</td>
								<td class="styTableCell" style="text-align:left;width:56mm;padding-top:0px;padding-left:14px">
								  Totals for all transactions<br/>reported on Form(s) 8949 with<br/>
								  <b>Box B</b> checked
									<span style="width:1.8mm"/>
									<span style=" letter-spacing:3.1mm; font-weight:bold; ">.......</span></td>
								<td class="styTableCell" style="width:30mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" 
											select="$Form1065SchDData/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
									<span style="width:3mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalSTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;
								font-weight:bold;vertical-align:top;font-size:8pt" scope="col">3</td>
								<td class="styTableCell" style="text-align:left;width:56mm;padding-top:0px;padding-left:14px">
								  Totals for all transactions<br/>reported on Form(s) 8949 with<br/>
								  <b>Box C</b>  checked
									<span style="width:1.8mm"/>
									<span style=" letter-spacing:3.1mm; font-weight:bold; ">.......</span></td>
								<td class="styTableCell" style="width:30mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode"
											 select="$Form1065SchDData/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
									<span style="width:3mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalSTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalSTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					</div>
					<!-- END PART I TABLE -->
					<!-- Start Line 4 -->
					<div style="width:187mm;font-size:7pt;height:7mm;">
						<div class="styLNLeftNumBox" style="padding-top:3.5mm;">
							<span style="width:1mm;"/>4</div>
						<div class="styLNDesc" style="width:138.5mm;height:7mm;padding-top:3.5mm;">
							Short-term capital gain from installment sales from Form 6252, line 26 or 37
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:.5px"/>.
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
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">
							4</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065SchDData/STCapGainInstalSlsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 4 -->
					<!-- Start Line 5 -->
					<div style="width:187mm;font-size:7pt;height:7mm;">
						<div class="styLNLeftNumBox" style="padding-top:3.5mm;">
							<span style="width:1mm"/>5</div>
						<div class="styLNDesc" style="width:138.5mm;height:7mm;padding-top:3.5mm;">
							Short-term capital gain or (loss) from like-kind exchanges from Form 8824
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
                            </span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">
							5</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065SchDData/STCapGainLossLikeKindExchAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 5-->
					<!-- Start Line 6 -->
					<div style="width:187mm;font-size:7pt">
						<div class="styLNLeftNumBox" style="padding-top:1mm;">
							<span style="width:1mm"/>6</div>
						<div class="styLNDesc" style="width:138.5mm;padding-top:1mm;">
							Partnership's share of net short-term capital gain (loss), including specially 
							  allocated short-<br/>term capital gains (losses), from other partnerships, estates, and
							  trusts
                            <!--Dotted Line-->
							<span class="styBoldText">
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
						<div class="styLNRightNumBox" style="padding-top:4mm;height:7.5mm;
						  border-bottom-width:1px">
							6</div>
						<div class="styLNAmountBox" style="height:7.5mm; padding-top:4mm;
						  border-bottom-width:1px">
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065SchDData/PrtshpShareSTCapGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 6 -->
					<!-- Start Line 7 -->
					<div class="styBB" style="width:187mm;font-size:7pt;height:7mm;">
						<div class="styLNLeftNumBox">
							<span style="width:1mm"/>7</div>
						<div class="styLNDesc" style="width:138.5mm;">
							<span class="styBoldText" style="font-size:7pt">
								Net short-term capital gain or (loss).</span> Combine lines 1a through 6 in 
								  column (h).  Enter here and <br/>on Form 1065, Schedule K, line 8 or 11; or Form
								  8865, Schedule K, line 8 or 11
                                <!--Dotted Line-->
							    <span class="styBoldText">
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
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:7mm; 
						  border-bottom-width:0px;">
							<br/>7</div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom-width:0px">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065SchDData/NetSTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 7 -->
					<!-- BEGIN PART 2 TITLE -->

					  <div class="styBB" style="width:187mm;height:auto;border-top-width:1px;">
						<div class="styPartName" style="height:auto;font-size:9pt">Part II</div>
						<div class="styPartDesc" style="float:left;width:167mm;font-size:9pt;height:auto;">
						  Long-Term Capital Gains and Losses - Generally Assets Held More Than One Year
							<span style="font-weight:normal;">(see instructions)</span></div>
					 </div>
					<!-- END PART II TITLE -->
					<!-- BEGIN PART II TABLE -->
					<div style="width:187mm;height:auto;">
					<table class="styTable" style="width:187mm;height:auto;" cellspacing="0">
						<thead class="styTableThead" style="font-size:6.3pt">
							<tr>
								<th class="styTableCellHeader" style="width:1mm;border-right-width:0px;" 
								  scope="col"/>
								<th class="styTableCellHeader" style="width:56mm;font-weight:normal;text-align:left"
								  scope="col">
								  See instructions for how to figure the<br/>
								  amounts to enter on the lines below.<br/>
								  This form may be easier to complete if you<br/>
								  round off cents to whole dollars.</th>
								<th class="styTableCellHeader" style="width:30mm;font-weight:normal;" scope="col">
									<span style="text-align:center;font-weight:bold">(d)</span><br/>
									<span style="text-align:center;">Proceeds</span><br/>
									<span style="text-align:center;">(sales price)</span></th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col">
									<span style="text-align:center;font-weight:bold">(e)</span><br/>
									<span style="text-align:center;">Cost</span><br/>
									<span style="text-align:center;">(or other basis)</span><br/></th>
								<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
								    <span style="text-align:center;font-weight:bold">(g)</span><br/>
								    <span style="text-align:center;">Adjustments to gain or <br/>loss from Form(s) 8949,</span><br/> 
							<!--		<b>(g)</b> Adjustments to gain or<br/>loss from Form(s) 8949,<br/> -->
									<span style="width:2mm"/>Part II, line 2, column (g)</th>
								<th class="styTableCellHeader" style="width:33mm;font-weight:normal; 
								  border-right-width:0px;" scope="col"><b>(h)</b><b> Gain or (loss)</b><br/>
								  Subtract column (e) from <br/>column (d) and combine<br/>
								  the result with column (g)</th>
							</tr>
						</thead>
						<tfoot/>
							<tbody style="font-size:7pt">
								<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;
								  font-weight:bold;vertical-align:top;font-size:8pt" scope="col">8a</td>
								<td class="styTableCell" style="text-align:left;width:56mm;padding-top:0px;padding-left:14px">
								  Totals for all long-term<br/>transactions reported on Form<br/>
								  1099-B for which basis was<br/>reported to the IRS and for which<br/>
								  you have no adjustments (see <br/>instructions). However, if you<br/>
								  choose to report all these<br/>transactions on Form 8949,<br/>
								  leave this line blank and go to<br/>line 8b
									<span style="width:1.8mm"/>
									<span style=" letter-spacing:3.1mm; font-weight:bold; ">.........</span></td>
								<td class="styTableCell" style="width:30mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalLTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<!--<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065SchDData/TotalLTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>-->
									<!--<span style="width:4mm"/>-->
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalLTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;background-color:lightgrey">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalLTCGL1099BBssRptNoAdjGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalLTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</td>
							</tr>	
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;
								  font-weight:bold;vertical-align:top;font-size:8pt" scope="col">8b</td>
								<td class="styTableCell" style="text-align:left;width:56mm;padding-top:0px;padding-left:14px">
								   Totals for all transactions<br/>reported on Form(s) 8949 with<br/>
								   <b>Box D</b> checked
									<span style="width:1.8mm"/>
									<span style=" letter-spacing:3.1mm; font-weight:bold; ">.......</span></td>
								<td class="styTableCell" style="width:30mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalLTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode"
											 select="$Form1065SchDData/TotalLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>	
											</xsl:call-template>
									<span style="width:3mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalLTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalLTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</td>
							</tr>	
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;
						          font-weight:bold;vertical-align:top;font-size:8pt" scope="col">9</td>
								<td class="styTableCell" style="text-align:left;width:56mm;padding-top:0px;padding-left:14px">
								  Totals for all transactions<br/>reported on Form(s) 8949 with<br/>
								  <b>Box E</b> checked
									<span style="width:1.8mm"/>
									<span style=" letter-spacing:3.1mm; font-weight:bold; ">.......</span></td>
								<td class="styTableCell" style="width:30mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalLTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" 
											select="$Form1065SchDData/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
									<span style="width:3mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalLTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalLTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:8mm">
								<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;
								  font-weight:bold;vertical-align:top;font-size:8pt" scope="col">10</td>
								<td class="styTableCell" style="text-align:left;width:56mm;padding-top:0px;padding-left:14px">
								  Totals for all transactions<br/>reported on Form(s) 8949 with<br/>
								  <b>Box F</b> checked
									<span style="width:1.8mm"/>
									<span style=" letter-spacing:3.1mm; font-weight:bold; ">.......</span></td>
								<td class="styTableCell" style="width:30mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalLTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template></td>
								<td class="styTableCell" style="width:38mm;">
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode"
											 select="$Form1065SchDData/TotalLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
									<span style="width:3mm"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1065SchDData/TotalLTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:33mm;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1065SchDData/TotalLTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</td>				
							</tr>		
						</tbody>
					</table>
					</div>
					<!-- END PART II TABLE -->
					<!-- Start Line 11 -->
					<div style="width:187mm;font-size:7pt;height:7mm;">
						<div class="styLNLeftNumBox" style="padding-top:3.5mm;">
							11</div>
						<div class="styLNDesc" style="width:138.5mm;padding-top:3.5mm;height:7mm;">
							Long-term capital gain from installment sales from Form 6252, line 26 or 37
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
                            </span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">
							11</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065SchDData/LTCapGainInstalSlsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 11 -->
					<!-- Start Line 12 -->
					<div style="width:187mm;font-size:7pt;height:7mm;">
						<div class="styLNLeftNumBox" style="padding-top:3.5mm">
							12</div>
						<div class="styLNDesc" style="width:138.5mm;height:7mm;padding-top:3.5mm;">
							    Long-term capital gain or (loss) from like-kind exchanges from Form 8824
                            <!--Dotted Line-->
							<span class="styBoldText">
							    <span style="width:13px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
							    <span style="width:13px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>. 
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">
							12</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">							
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065SchDData/LTCapGainLossLikeKindExchAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 12 -->
					<!-- Start Line 13 -->
					<div style="width:187mm;font-size:7pt">
						<div class="styLNLeftNumBox" style="padding-top:1mm">
							13</div>
						<div class="styLNDesc" style="width:138.5mm;padding-top:1mm;">
							Partnership's share of net long-term capital gain (loss), including specially
							  allocated long-<br/>term capital gains (losses), from other partnerships, estates, 
							  and trusts
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:13px"/>.
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
						<div class="styLNRightNumBox" style="padding-top:4mm;height:8mm;">
							13</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065SchDData/PrtshpShrLTCapGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 13 -->
					<!-- Start Line 14 -->
					<div style="width:187mm;font-size:7pt;height:7mm;">
						<div class="styLNLeftNumBox" style="padding-top:3.5mm">
							14</div>
						<div class="styLNDesc" style="width:138.5mm;padding-top:3.5mm;">
							Capital gain distributions (see instructions)
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
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:1px;padding-top:3.5mm;height:7mm;">
							14</div> 
					                    
						<div class="styLNAmountBox" style="border-bottom-width:1px;padding-top:3.5mm;height:7mm;">
					            
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065SchDData/CapitalGainDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 14 -->
					<!-- Start Line 15 -->
					
					<div style="width:187mm;border-bottom:solid black 2px;font-size:7pt;height:7mm;">
						<div class="styLNLeftNumBox">
							15</div>
						<div class="styLNDesc" style="width:138.5mm;font-size:7pt">
							<span class="styBoldText" style="font-size:7pt">Net long-term capital gain or (loss). </span> 
							Combine lines 8a through 14 in column (h). Enter here and on <br/>Form 1065, 
							Schedule K, line 9a or 11; or Form 8865, Schedule K, line 9a or 11
							  <!--Dotted Line-->
							    <span class="styBoldText">
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
                       
						<div class="styLNRightNumBox" style="height:7mm;
						  border-bottom-width:0px;">
							<br/>15</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;
						  border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065SchDData/NetLTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;font-size:7pt">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions
							  for Form 1065.</span>
							<span style="width:12mm;"/>Cat. No. 11393G
                        </div>
						<div style="float:right;">
							<span class="styBoldText">Schedule D (Form 1065) 2021</span>
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
						<xsl:choose>
							<xsl:when test="$Form1065SchDData/RelatedPartyLikeKindExchInd">
								<tr>
									<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
										<xsl:text>Check the box if you have Like-Kind Exchange, or Related Party Exchange or Related Party Like-Kind Exchange</xsl:text>:</td>
									<td class="styLeftOverTableRowAmount" style="width:87mm;">
										<input type="checkbox" class="styCkbox" alt="Related Party and or Like-Kind Exchange">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1065SchDData/RelatedPartyLikeKindExchInd"/>
												<xsl:with-param name="BackupName">IRS1065ScheduleDRelatedPartyLikeKindExchInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</td>                
								</tr>
							</xsl:when>
						</xsl:choose>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>