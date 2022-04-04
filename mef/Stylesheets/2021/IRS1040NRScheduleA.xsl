<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 10/07/2021 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040NRScheduleAStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040NRScheduleA"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
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
				<meta name="Description" content="IRS Form 1040NRScheduleA"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040NRScheduleAStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form1040NRScheduleA">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styTBB" style="width:187mm;height:20mm;">
						<div class="styFNBox" style="width:28mm;height:20mm;">
							<div style="height:8mm;">
								<!-- Ampersand code (&#38;)-->
								<span class="styFormNumber" style="font-size:9pt">
									SCHEDULE A
								</span>
								<br/>
								<span class="styFormNumber" style="font-size:9pt">
									(Form 1040-NR)
									<span style="width:1mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
								</span>
							</div> 
							<br/><br/>
							<div style="height:6mm;padding-top:.1mm;">
								<span class="styAgency">Department of the Treasury
								</span>
								<span class="styAgency" style="width:28mm;">Internal Revenue Service 
									<span style="padding-left:0.2mm;"> (99)</span>
								</span>
							</div>
						</div>         
						<div class="styFTBox" style="width:126.5mm;height:20mm;">
							<div class="styMainTitle">
								Itemized Deductions
							</div>
							<div class="styFBT" style="width:126.5mm;font-size:7pt;
								margin-top:.5mm;font-weight:normal">         
								<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
								<b>Go to <a style="text-decoration:none;color:black;" href="www.irs.gov/Form1040NR " title="Link to IRS.gov"><i>www.irs.gov/Form1040NR </i>
								</a> for instructions and the latest information.</b><br/>
								<span style="padding-top:.5mm;">
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/> <b>Attach to 2021 Form 1040-NR.</b>
								</span>    
								<span style="padding-top:.5mm;">				  
									<b>Caution:</b> If you are claiming a net qualified disaster loss on Form 4684, see the instructions for <br/>line 7.
				                </span>                  
                            </div>
                        </div>           
                        <div class="styTYBox" style="width:32mm;height:19.5mm;">
                            <br/>
                            <div class="styOMB" style="height:2mm;padding-top:0mm;
                                padding-left:3mm;line-height: 0px;">
                                OMB No. 1545-0074
                            </div>
                            <div class="styTY" style="height:6mm;font-size:18pt;
                                padding-top:0mm;padding-bottom:0mm;line-height:100%;
                                padding-left:0mm">
                                20<span class="styTYColor">21</span>
                            </div>
                            <div class="styOMB" style="padding-top:1mm;text-align:left;
                                padding-left:5mm;border-bottom-width:0px;line-height:10px">
                                Attachment <br/>
                                Sequence No. <span class="styBoldText">7A</span>
                            </div>
                        </div>
                    </div>
                    <div style="width:187mm;height:8mm;" class="styBB">
                        <div style="width:151.75mm;height:8mm;font-weight:normal;font-size:7pt;"
               class="styNameBox">
			   Name(s) shown on Form 1040-NR<br/>
                            <div style="padding-top:1.5mm">
                                <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
                                    <xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
                                </xsl:call-template>
                            </div>
                        </div>
                        <div style="width:35mm;height:8mm;padding-left:.3mm;font-size:6.2pt;font-weight:bold;" class="styEINBox">Your Identifying Number<br/>
                            <br/>
                            <span style="width:9.5mm;"/>
                            <span style="font-weight:normal;font-size:6.4pt;">
                                <xsl:call-template name="PopulateReturnHeaderFiler">
                                    <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                                </xsl:call-template>
                            </span>
                        </div>
                    </div>
		           	<!-- Taxes You Paid section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRScheduleAIndentSection" style="height:15mm;">
							Taxes You <br/> Paid
						</div>
						<!-- Sch A Line 1 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD" style="padding-top:3mm">1a</div>
							<div class="sty1040NRScheduleAIndent2Desc" style="height:7mm;padding-top:3mm">
								State and local income taxes <span class="sty1040NRScheduleADotLn">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:6.5mm;
							    padding-top:2.5mm">1a</div>
							<div class="styLNAmountBox" style="height:6.5mm;
							    padding-top:2.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;height:10mm"/>
							<div class="styLNAmountBox" style="border-bottom:none;height:10mm"/>
						</div>
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:4mm">b</div>
							<div class="sty1040NRScheduleAIndentDesc" style="">
								Enter the smaller of line 1a or $10,000 ($5,000 if you checked Married under <i>Filing Status</i> <br/>on page 1 of Form 1040-NR) <span class="sty1040NRScheduleADotLn">....................</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;height:7mm;padding-top:3.5mm;">1b</div>
							<div class="styLNAmountBox" style="border-bottom:none;
							    height:7mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalTaxLimitationAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Gifts to US Charities section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRScheduleAIndentSection" style="height:4mm;">
							<b>Gifts <br/>to U.S <br/> Charities</b><br/>
						<div class="sty1040NRScheduleAIndentSection" style="font-weight:normal;height:25mm;padding-top:2mm;">	
							<b>Caution: </b>If <br/>
							you made a<br/>
							gift and<br/>
							received a<br/>
							benefit in<br/>
							return, see<br/>
							instructions.
							</div>
						</div>
						<!-- Sch A Line 2 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="sty1040NRScheduleAIndent2Desc" style="height:7.2mm;">
								Gifts by cash or check. If you made any gift of $250 or more, <br/> see instructions <span class="sty1040NRScheduleADotLn">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.2mm;background-color:lightgrey;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:4.2mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="height:4.2mm;background-color:lightgrey;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:4.2mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="">2</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GiftsByCashOrCheckAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="border-bottom:none;"/>
						</div>
						<!-- Sch A Line 3 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="sty1040NRScheduleAIndent2Desc" style="height:10mm;">
								Other than by cash or check. If you made any gift of $250 or <br/> 
								more, see instructions.  Individuals <strong>must</strong> attach Form 8283 if line 3 is over $500<span class="sty1040NRScheduleADotLn">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:6mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:6mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="">3</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="border-bottom:none;"/>
						</div>
						<!-- Sch A Line 4 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="sty1040NRScheduleAIndent2Desc" style=""/>
							<div class="styLNRightNumBox" style="border-bottom:none;"/>
							<div class="styLNAmountBox" style="border-bottom:none;"/>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="border-bottom:none;"/>
						</div>
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="sty1040NRScheduleAIndent2Desc" style="">
								Carryover from prior year <span class="sty1040NRScheduleADotLn">...........</span>
							</div>
							<div class="styLNRightNumBox" style="">4</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CarryoverFromPriorYearAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="border-bottom:none;"/>
						</div>
						<!-- Sch A Line 5 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="sty1040NRScheduleAIndentDesc" style=""/>
							<div class="styLNRightNumBox" style="border-bottom:none;"/>
							<div class="styLNAmountBox" style="border-bottom:none;"/>
						</div>
						<div style="width:167mm;float:left;margin-left:20mm;height:7mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:3mm">5</div>
							<div class="sty1040NRScheduleAIndentDesc" style="padding-top:3mm">
								Add lines 2 through 4 <span class="sty1040NRScheduleADotLn">......................</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;height:7mm;padding-top:3mm">5</div>
							<div class="styLNAmountBox" style="border-bottom:none;height:7mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalCharitableContriAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Casualty and Theft Losses section -->
					<div class="styBB" style="border-top:1px solid black;border-bottom-width:1px;height:10.5mm">
						<div class="sty1040NRScheduleAIndentSection" style="font-size:7pt;">
							Casualty <br/>and Theft <br/> Losses
						</div>
						<!-- Sch A Line 6 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="sty1040NRScheduleAIndentDesc" style="height:10mm">
								Casualty and theft loss(es) from a federally declared disaster (other than net qualified<br/>
								disaster losses). Attach Form 4684 and enter the amount from line 18 of that form. See <br/>
								instructions <span class="sty1040NRScheduleADotLn">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;height:7mm;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="border-bottom:none;height:7mm;"/>
							<div class="styLNRightNumBox" style="border-bottom:none;height:3mm;padding-top:0mm">6</div>
							<div class="styLNAmountBox" style="border-bottom:none;height:3mm;padding-top:0mm">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CasualtyOrTheftLossesAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CasualtyOrTheftLossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Other Itemized Deductions section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRScheduleAIndentSection">
							Other <br/> Itemized <br/> Deductions
						</div>
						<!-- Sch A Line 7 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="sty1040NRScheduleAIndentDesc" style="height:26mm;">
								Other&#8212;from list in instructions. List type and amount <!--&#9658;-->
								<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right Arrow"/>
							 <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherMiscDedTypeAndAmt"/>
								</xsl:call-template>
								<span style="border-bottom:1px dashed black;width:41mm;"> </span>
								<br/>
								<span style="border-bottom:1px dashed black;width:96%"> </span>
								<br/>
								<span style="border-bottom:1px dashed black;width:96%"> </span>
								<br/>
								<span style="border-bottom:1px dashed black;width:96%"> </span>
								<br/>
								<span style="border-bottom:1px dashed black;width:96%"> </span>
								<br/>
								<span style="border-bottom:1px dashed black;width:96%"> </span>
								<br/>
								<span style="border-bottom:1px dashed black;width:96%"> </span>
								<br/>
								<span style="border-bottom:1px dashed black;width:96%">
									<xsl:if test="$FormData/OtherMiscDedTypeAndAmt">
										See Additional Data Table
									</xsl:if>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:22mm;background-color:lightgrey;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:22mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="border-bottom:none;">7</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherMiscellaneousDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Total Itemized Deductions section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRScheduleAIndentSection">
							Total <br/> Itemized <br/> Deductions
						</div>
						<!-- Sch A Line 8 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD" style="padding-top:5mm">8</div>
							<div class="sty1040NRScheduleAIndentDesc" style="height:11mm;padding-top:5mm">
								Add the amounts in the far right column for lines 1b through 7. Also, enter this amount on<br/>
								Form 1040-NR, line 12a<span class="sty1040NRScheduleADotLn">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:7mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="border-bottom:none;">8</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:choose>
									<xsl:when test="$FormData/IndiaStandardDedTaxTreatyGrp">
										<span style="float:left;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyCd"/>
												<xsl:with-param name="Desc">Line 8 - India standard deduction tax treaty code</xsl:with-param>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedDeductionsAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<div style="width:100mm;font-weight:bold;font-size:6.5pt;" class="styGenericDiv">
							For Paperwork Reduction Act Notice, see the 
							<span style="font-family:Arial">I</span>nstructions for Form 1040-NR.
						</div>
						<div style="width:46mm;text-align:center;font-size:6pt;
							padding-left:0mm;" class="styGenericDiv">Cat. No. 72749E
						</div>
						<div style="width:41mm;font-size:6pt;" class="styGenericDiv">
							<span class="styBoldText">Schedule A (Form 1040-NR) 2021
							</span>
						</div>
					</div>
					<!-- Additional Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<xsl:if test="$FormData/OtherMiscDedTypeAndAmt">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule A, Line 7 - Other Miscellaneous Deductions</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Miscellaneous Deductions type</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Miscellaneous Deductions amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherMiscDedTypeAndAmt">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
