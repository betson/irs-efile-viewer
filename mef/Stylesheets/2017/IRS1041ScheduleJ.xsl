<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1041ScheduleJStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1041ScheduleJ"/>
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
				<meta name="Description" content="IRS Form 1040 Schedule J"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				     <xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS1041ScheduleJStyle"/>
					<xsl:call-template name="AddOnStyle"/>
				     </xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form id="IRS1041ScheduleJ">
					<xsl:call-template name="DocumentHeader"/>
					<!-- header -->
					<div class="styTBB" style="width:187mm;height:18mm;">
						<div class="styFNBox" style="width:31mm;height:100%;border-right-width:2px">
							<div class="styFN" style="font-size:9pt;height:10mm;">SCHEDULE J <br/>
								<span style="font-size:12;">(Form 1041)</span>
								<!--General Dependency Push Pin-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</div>
							<div class="styAgency" style="">Department of the Treasury <br/>Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:100%;">
							<div class="styFMT" style="font-size:11pt;">Accumulation Distribution for Certain Complex Trusts</div>
							<div class="styFBT">
								<img src="{$ImagePath}/1040ScheduleJ_Bullet.gif" alt="Bullet Point"/>
								Attach to Form 1041.<br/>
								<span style="font-size:4pt;">
									<br/>
								</span>
								<img src="{$ImagePath}/1040ScheduleJ_Bullet.gif" alt="Bullet Point"/>
								Go to  
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1041" title="Link to IRS.gov">
									<i>www.irs.gov/Form1041</i> for instructions and the latest information.</a>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:100%;border-left-width:2px">
							<div class="styOMB">OMB No. 1545-0092</div>
							<div class="styTaxYear">20<span class="styTYColor">17</span>
							</div>
						</div>
					</div>
					<!-- Primary Taxpayer -->
					<div class="styBB" style="width:187mm;height:9mm;">
						<div class="styNameBox" style="width:140mm;height:100%;font-size:7pt;">
							Name of trust <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;height:100%;padding-left:4px;font-size:7pt;">
							Employer identification number<br/>
							<span style="width:100%;text-align:bottom;font-weight:normal;padding-top:3mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Part I -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:3.5mm">Part I</div>
						<div class="styPartDesc">Accumulation Distribution in 2017</div>
						<div style="float:none;clear:both;width:187mm;">
							<b>Note: </b>
							<i>See the Form 4970 instructions for certain income that minors may exclude and special rules for multiple trusts.</i>
						</div>
					</div>
					<div style="width:187mm;border-bottom:1px solid black;">
						<!-- Line 1 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc">
								Other amounts paid, credited, or otherwise required to be distributed for 2017 (from Form 1041,<br/>
								<span style="float:left;">Schedule B, line 10)</span>
								<span class="styIRS1041SJDots">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm">1</div>
							<div class="styLNAmountBox" style="height:7mm;padding-top:3mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SecondTierDistributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:106mm;"/>
							<div class="styLNRightNumBoxNBB" style="border-left-color:white;"/>
							<div class="styLNAmountBoxNBB" style="border-left-color:white;"/>
							<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:106mm;">
								<span style="float:left;">Distributable net income for 2017 (from Form 1041, Schedule B, line 7)</span>
								<span class="styIRS1041SJDots">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.4mm;">2</div>
							<div class="styLNAmountBox" style="height:4.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DistributableNetIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:4.4mm;border-bottom:none;background-color:lightgrey;"/>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:106mm;">
								Income required to be distributed currently for 2017 (from Form 1041, 
								<span style="float:left;">Schedule B, line 9)</span>
								<span class="styIRS1041SJDots">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7.6mm;">
								<br/>3</div>
							<div class="styLNAmountBox" style="height:7.6mm;">
								<br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FirstTierDistributionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:7.6mm;border-bottom:none;background-color:lightgrey;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc">
								<span style="float:left;">Subtract line 3 from line 2. If zero or less, enter -0-</span>
								<span class="styIRS1041SJDots">................</span>
							</div>
							<div class="styLNRightNumBox">4</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetDistributedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc">
								<span style="float:left;">Accumulation distribution for 2017. Subtract line 4 from line 1</span>
								<span class="styIRS1041SJDots">.............</span>
							</div>
							<div class="styLNRightNumBoxNBB">5</div>
							<div class="styLNAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styBB" style="width:187mm;padding:1.5mm 0mm;">
						<div class="styPartName" style="height:3.5mm">Part II</div>
						<div class="styPartDesc">Ordinary Income Accumulation Distribution <span style="font-weight:normal;"> (Enter the applicable throwback years below.)</span>
						</div>
					</div>
					<xsl:for-each select="$FormData/OrdinaryIncmAccumDistriGrp[position() mod 5 = 1]">
						<xsl:call-template name="Part2Section">
							<xsl:with-param name="iteration" select="position()"/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($FormData/OrdinaryIncmAccumDistriGrp) = 0">
						<xsl:call-template name="Part2Section"/>
					</xsl:if>
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;clear:none;font-weight:bold;">For Paperwork Reduction Act Notice, see the Instructions for Form 1041.</span>
						<span style="float:left;clear:none;margin-left:14mm;">Cat. No. 11382Z</span>
						<span style="float:right;clear:none;font-weight:bold;">Schedule J (Form 1041) 2017</span>
					</div>
					<p style="page-break-before: always"/>
					<div class="styTBB" style="width:187mm;">
						<span style="float:left;clear:none;">Schedule J (Form 1041) 2017</span>
						<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">2</span>
						</span>
					</div>
					<!-- Part 3 -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:3.5mm">Part III</div>
						<div class="styPartDesc">Taxes Imposed on Undistributed Net Income <span style="font-weight:normal;font-size:7pt;"> (Enter the applicable throwback years below.) (See the instructions.)</span>
						</div>
						<div style="float:none;clear:both;width:187mm;">
							<b>Note: </b>
							<i>If more than 5 throwback years are involved, attach additional schedules. If the trust received an accumulation distribution from
							another trust, see Regulations section 1.665(d)-1A.</i>
						</div>
					</div>
					<xsl:for-each select="$FormData/UndistriNetIncomeTaxesGrp[position() mod 5 = 1]">
						<xsl:call-template name="Part3Section">
							<xsl:with-param name="iteration" select="position()"/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($FormData/UndistriNetIncomeTaxesGrp) = 0">
						<xsl:call-template name="Part3Section"/>
					</xsl:if>
					<!-- Part 4 -->
					<xsl:for-each select="$FormData/AllocationToBeneficiaryDetail">
<div class="styGenericDiv" style="break-inside:avoid;">
						<xsl:call-template name="Part4Section">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/AllocationToBeneficiaryDetail) = 0">
						<xsl:call-template name="Part4Section"/>
					</xsl:if>
					<div class="pageEnd" style="width:187mm;">
						<span style="float:right;clear:none;font-weight:bold;">Schedule J (Form 1041) 2017</span>
					</div>
					<p style="page-break-before: always"/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Separated Data for Part IV -->
					<xsl:for-each select="$FormData/AllocationToBeneficiaryDetail">
						<xsl:if test="($Print = $Separated) and (count(AllocationToBenefShareDetail) &gt; 5)">
							<br/>
							<br/>
							<span class="styRepeatingDataTitle">
								Form 1041 Schedule J, Part IV, Line 32<br/>
								Name: <span style="font-weight;normal;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="BeneficiaryNm"/>
									</xsl:call-template>
								</span>
							</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:187mm;" border="1">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col" style="">Throwback Year</th>
										<th class="styDepTblCell" scope="col" style="">(a) This beneficiary's share of line 13</th>
										<th class="styDepTblCell" scope="col" style="">(b) This beneficiary's share of line 14</th>
										<th class="styDepTblCell" scope="col" style="">(c) This beneficiary's share of line 16</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="AllocationToBenefShareDetail">
										<tr style="border-color:black;height:6mm;">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td style="border-color:black;">
												<xsl:call-template name="PopulateYear">
													<xsl:with-param name="TargetNode" select="ThrowbackYr"/>
												</xsl:call-template>
											</td>
											<td style="border-color:black;text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AllocatedAccumulationDistriAmt"/>
												</xsl:call-template>
											</td>
											<td style="border-color:black;text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AllocatedResultDistriAmt"/>
												</xsl:call-template>
											</td>
											<td style="border-color:black;text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxExemptInterestAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="Part2Section">
		<xsl:param name="iteration" select="1"/>
		<xsl:variable name="pos" select="$iteration * 5 - 4"/>
		<div style="width:187mm;">
			<div style="float:right;">
				<div class="styIRS1041SJBox" style="width:57mm;border-left:none;font-weight:normal;text-align:left;">
					<b>Note: </b>
					<i> If the distribution is thrown back to more 
					than 5 years (starting with the earliest applicable 
					tax year beginning after 1968), attach additional 
					schedules. (If the trust was a simple trust, see 
					Regulations section 1.665(e)-1A(b).)</i>
				</div>
				<div class="styIRS1041SJBox">
					<br/>Throwback <br/>year ending<br/>
					<span style="font-size:6pt;">
						<br/>
					</span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<br/>Throwback <br/>year ending<br/>
					<span style="font-size:6pt;">
						<br/>
					</span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<br/>Throwback <br/>year ending<br/>
					<span style="font-size:6pt;">
						<br/>
					</span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<br/>Throwback <br/>year ending<br/>
					<span style="font-size:6pt;">
						<br/>
					</span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<br/>Throwback <br/>year ending<br/>
					<span style="font-size:6pt;">
						<br/>
					</span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
			</div>
		</div>
		<!-- Line 6 -->
		<div style="width:187mm;height:7mm;">
			<div class="styLNLeftNumBoxSD">6</div>
			<div class="styLNDesc" style="width:41mm;">
				Distributable net income (see the instructions)
				<span class="styIRS1041SJDots">....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">6</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 7 -->
		<div style="width:187mm;height:7mm;">
			<div class="styLNLeftNumBoxSD">7</div>
			<div class="styLNDesc" style="width:41mm;">
				Distributions (see the instructions)
				<span class="styIRS1041SJDots">......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">7</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/DistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/DistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/DistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/DistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/DistributionAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding:0px;"/>
			<div class="styLNDesc" style="width:41mm;height:3.5mm;padding:0px;"/>
			<div style="float:right;">
				<div class="styLNRightNumBoxNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
			</div>
		</div>
		<!-- Line 8 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD">8</div>
			<div class="styLNDesc" style="width:41mm;">
				Subtract line 7 from line 6
				<span class="styIRS1041SJDots">.</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/IncomeLessDistributionsAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/IncomeLessDistributionsAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/IncomeLessDistributionsAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/IncomeLessDistributionsAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/IncomeLessDistributionsAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 9 -->
		<div style="width:187mm;height:7mm;">
			<div class="styLNLeftNumBoxSD">9</div>
			<div class="styLNDesc" style="width:41mm;">
				Enter amount from page 2, line 25 or line 31, as applicable
				<span class="styIRS1041SJDots">.</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">9</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/TaxUndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/TaxUndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/TaxUndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/TaxUndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/TaxUndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 10 -->
		<div style="width:187mm;height:7mm;">
			<div class="styLNLeftNumBox">10</div>
			<div class="styLNDesc" style="width:41mm;">
				Undistributed net income Subtract line 9 from line 8
				<span class="styIRS1041SJDots">.</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">10</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/UndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/UndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/UndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/UndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/UndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 11 -->
		<div style="width:187mm;height:14mm;">
			<div class="styLNLeftNumBox">11</div>
			<div class="styLNDesc" style="width:41mm;">
				Enter amount of prior accumulation distributions thrown back to any of these years
				<span class="styIRS1041SJDots">.......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm">11</div>
				<div class="styIRS1041SJAmtBox" style="height:14mm;padding-top:11mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/PriorAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:14mm;padding-top:11mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/PriorAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:14mm;padding-top:11mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/PriorAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:14mm;padding-top:11mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/PriorAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:14mm;padding-top:11mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/PriorAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding:0px;"/>
			<div class="styLNDesc" style="width:41mm;height:3.5mm;padding:0px;"/>
			<div style="float:right;">
				<div class="styLNRightNumBoxNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
			</div>
		</div>
		<!-- Line 12 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">12</div>
			<div class="styLNDesc" style="width:41mm;">
				Subtract line 11 from line 10
				<span class="styIRS1041SJDots">.</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/PriorYearUndistriNetAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/PriorYearUndistriNetAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/PriorYearUndistriNetAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/PriorYearUndistriNetAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/PriorYearUndistriNetAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding:0px;"/>
			<div class="styLNDesc" style="width:41mm;height:3.5mm;padding:0px;"/>
			<div style="float:right;">
				<div class="styLNRightNumBoxNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
			</div>
		</div>
		<!-- Line 13 -->
		<div style="width:187mm;height:16mm;">
			<div class="styLNLeftNumBox">13</div>
			<div class="styLNDesc" style="width:41mm;">
				Allocate the amount on line 5 to the earliest applicable year first. Do not allocate an 
				amount greater than line 12 for the same year (see the instructions)
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:16mm;padding-top:12.5mm">13</div>
				<div class="styIRS1041SJAmtBox" style="height:16mm;padding-top:13mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/AllocatedAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:16mm;padding-top:13mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/AllocatedAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:16mm;padding-top:13mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/AllocatedAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:16mm;padding-top:13mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/AllocatedAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:16mm;padding-top:13mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/AllocatedAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 14 -->
		<div style="width:187mm;height:10mm;">
			<div class="styLNLeftNumBox">14</div>
			<div class="styLNDesc" style="width:41mm;">
				Divide line 13 by line 10 and multiply result by amount on line 9
				<span class="styIRS1041SJDots">.......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">14</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/AllocatedResultDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/AllocatedResultDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/AllocatedResultDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/AllocatedResultDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/AllocatedResultDistriAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding:0px;"/>
			<div class="styLNDesc" style="width:41mm;height:3.5mm;padding:0px;"/>
			<div style="float:right;">
				<div class="styLNRightNumBoxNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
			</div>
		</div>
		<!-- Line 15 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">15</div>
			<div class="styLNDesc" style="width:41mm;">
				Add lines 13 and 14
				<span class="styIRS1041SJDots">...</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/TotalAccumDistriAllocatedAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/TotalAccumDistriAllocatedAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/TotalAccumDistriAllocatedAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/TotalAccumDistriAllocatedAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/TotalAccumDistriAllocatedAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 16 -->
		<div style="width:187mm;height:8mm;">
			<div class="styLNLeftNumBox">16</div>
			<div class="styLNDesc" style="width:41mm;">
				Tax-exempt interest included on line 13 (see the instructions)
				<span class="styIRS1041SJDots">.</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:8mm;padding-top:4.5mm">16</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/TaxExemptInterestAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/TaxExemptInterestAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/TaxExemptInterestAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/TaxExemptInterestAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/TaxExemptInterestAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding:0px;"/>
			<div class="styLNDesc" style="width:41mm;height:3.5mm;padding:0px;"/>
			<div style="float:right;">
				<div class="styLNRightNumBoxNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
				<div class="styIRS1041SJAmtNBB" style="height:3.5mm;padding:0px;"/>
			</div>
		</div>
		<!-- Line 17 -->
		<div style="width:187mm;border-bottom:2px solid black;">
			<div class="styLNLeftNumBox">17</div>
			<div class="styLNDesc" style="width:41mm;">
				Subtract line 16 from line 15
				<span class="styIRS1041SJDots">.</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBoxNBB" style="height:4.5mm;">17</div>
				<div class="styIRS1041SJAmtNBB" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/AccumulationDistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/AccumulationDistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/AccumulationDistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/AccumulationDistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/AccumulationDistributionAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="Part3Section">
		<xsl:param name="iteration" select="1"/>
		<xsl:variable name="pos" select="$iteration * 5 - 4"/>
		<div style="width:187mm;">
			<div style="float:right;">
				<div class="styIRS1041SJBox" style="width:49mm;border:none;font-weight:normal;text-align:left;">
					If the trust elected the alternative tax on capital gains (repealed for tax years beginning after 1978),
					 <b>skip</b> lines 18 through 25 and <b>complete</b> lines 26 through 31.
				</div>
				<div class="styIRS1041SJBox" style="width:8mm;border-left:none;border-right:none;">
					<br/>
					<br/>
					<br/>
					<br/>&nbsp;</div>
				<div class="styIRS1041SJBox">
					<br/>Throwback <br/>year ending<br/>
					<span style="font-size:6pt;">
						<br/>
					</span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<br/>Throwback <br/>year ending<br/>
					<span style="font-size:6pt;">
						<br/>
					</span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<br/>Throwback <br/>year ending<br/>
					<span style="font-size:6pt;">
						<br/>
					</span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<br/>Throwback <br/>year ending<br/>
					<span style="font-size:6pt;">
						<br/>
					</span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<br/>Throwback <br/>year ending<br/>
					<span style="font-size:6pt;">
						<br/>
					</span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
			</div>
		</div>
		<!-- Line 18 -->
		<div style="width:187mm;height:4.5mm;">
			<div class="styLNLeftNumBox">18</div>
			<div class="styLNDesc" style="width:41mm;">
				Regular tax
				<span class="styIRS1041SJDots">......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm">18</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/RegularTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/RegularTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/RegularTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/RegularTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/RegularTaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 19 -->
		<div style="width:187mm;height:8mm;">
			<div class="styLNLeftNumBox">19</div>
			<div class="styLNDesc" style="width:41mm;">
				Trust's share of net short-term gain
				<span class="styIRS1041SJDots">........</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:8mm;padding-top:4.5mm">19</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/NetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/NetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/NetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/NetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/NetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 20 -->
		<div style="width:187mm;height:8mm;">
			<div class="styLNLeftNumBox">20</div>
			<div class="styLNDesc" style="width:41mm;">
				Trust's share of net long-term gain
				<span class="styIRS1041SJDots">........</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:8mm;padding-top:4.5mm">20</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/NetLongTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/NetLongTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/NetLongTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/NetLongTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/NetLongTermGainAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 21 -->
		<div style="width:187mm;height:4.5mm;">
			<div class="styLNLeftNumBox">21</div>
			<div class="styLNDesc" style="width:41mm;">
				Add lines 19 and 20
				<span class="styIRS1041SJDots">...</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm">21</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/TotalNetGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TotalNetGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TotalNetGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TotalNetGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TotalNetGainAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 22 -->
		<div style="width:187mm;height:4.5mm;">
			<div class="styLNLeftNumBox">22</div>
			<div class="styLNDesc" style="width:41mm;">
				Taxable income
				<span class="styIRS1041SJDots">....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm">22</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/TaxableIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TaxableIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TaxableIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TaxableIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:4.5mm;padding-top:1.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TaxableIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 23 -->
		<div style="width:187mm;height:10mm;">
			<div class="styLNLeftNumBox">23</div>
			<div class="styLNDesc" style="width:41mm;">
				Enter percent. Divide line 21 by line 22, but do not enter more than 100%
				<span class="styIRS1041SJDots">.....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">23</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/TaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
			</div>
		</div>
		<!-- Line 24 -->
		<div style="width:187mm;height:7mm;">
			<div class="styLNLeftNumBox">24</div>
			<div class="styLNDesc" style="width:41mm;">
				Multiply line 18 by the percentage on line 23
				<span class="styIRS1041SJDots">...</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">24</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/IncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/IncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/IncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/IncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/IncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 25 -->
		<div style="width:187mm;height:14mm;border-bottom:1px solid black;">
			<div class="styLNLeftNumBox">25</div>
			<div class="styLNDesc" style="width:41mm;">
				Tax on undistributed net income. Subtract line 24 from
				line 18. Enter here and on page 1, line 9
				<span class="styIRS1041SJDots">.......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm;border-bottom:none;">25</div>
				<div class="styIRS1041SJAmtNBB" style="height:14mm;padding-top:11mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/TaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:14mm;padding-top:11mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:14mm;padding-top:11mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:14mm;padding-top:11mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:14mm;padding-top:11mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styGenericDiv" style="width:49mm;height:15mm;padding-top:2px;">
				Do not complete lines 26 through 31 <br/>
				unless the trust elected the <br/>
				alternative tax on long-term capital <br/>
				gain.
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBoxNBB" style="height:15mm;background-color:lightgrey"/>
				<div class="styIRS1041SJAmtNBB" style="height:15mm;background-color:lightgrey"/>
				<div class="styIRS1041SJAmtNBB" style="height:15mm;background-color:lightgrey"/>
				<div class="styIRS1041SJAmtNBB" style="height:15mm;background-color:lightgrey"/>
				<div class="styIRS1041SJAmtNBB" style="height:15mm;background-color:lightgrey"/>
				<div class="styIRS1041SJAmtNBB" style="height:15mm;background-color:lightgrey"/>
			</div>
		</div>
		<!-- Line 26 -->
		<div style="width:187mm;height:7mm">
			<div class="styLNLeftNumBox">26</div>
			<div class="styLNDesc" style="width:41mm;">
				Tax on income other than long-term capital gain
				<span class="styIRS1041SJDots">....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">26</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/AlternativeTaxOnOtherIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/AlternativeTaxOnOtherIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/AlternativeTaxOnOtherIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/AlternativeTaxOnOtherIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/AlternativeTaxOnOtherIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 27 -->
		<div style="width:187mm;height:7mm">
			<div class="styLNLeftNumBox">27</div>
			<div class="styLNDesc" style="width:41mm;">
				Trust's share of net short-term gain
				<span class="styIRS1041SJDots">........</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">27</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/AltTaxNetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/AltTaxNetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/AltTaxNetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/AltTaxNetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/AltTaxNetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 28 -->
		<div style="width:187mm;height:8mm">
			<div class="styLNLeftNumBox">28</div>
			<div class="styLNDesc" style="width:41mm;">
				Trust's share of taxable income less section 1202 deduction
				<span class="styIRS1041SJDots">.</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:8mm;padding-top:4.5mm">28</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/TrustTxblIncomeNotExcldSBAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TrustTxblIncomeNotExcldSBAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TrustTxblIncomeNotExcldSBAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TrustTxblIncomeNotExcldSBAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:8mm;padding-top:5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TrustTxblIncomeNotExcldSBAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 29 -->
		<div style="width:187mm;height:10mm">
			<div class="styLNLeftNumBox">29</div>
			<div class="styLNDesc" style="width:41mm;">
				Enter percent. Divide line 27 by line 28, but do not enter more than 100%
				<span class="styIRS1041SJDots">......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">29</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/AlternativeTaxTaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/AlternativeTaxTaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/AlternativeTaxTaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/AlternativeTaxTaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:10mm;padding-top:7mm">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/AlternativeTaxTaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
			</div>
		</div>
		<!-- Line 30 -->
		<div style="width:187mm;height:7mm">
			<div class="styLNLeftNumBox">30</div>
			<div class="styLNDesc" style="width:41mm;">
				Multiply line 26 by the percentage on line 29
				<span class="styIRS1041SJDots">...</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">30</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/AltTaxIncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/AltTaxIncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/AltTaxIncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/AltTaxIncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox" style="height:7mm;padding-top:4mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/AltTaxIncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 31 -->
		<div style="width:187mm;height:14mm;border-bottom:1px solid black;">
			<div class="styLNLeftNumBox">31</div>
			<div class="styLNDesc" style="width:41mm;">
				Tax on undistributed net income. Subtract line 30 from line 26. Enter here and on page 1, line 9
				<span class="styIRS1041SJDots">.......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm;border-bottom:none;">31</div>
				<div class="styIRS1041SJAmtNBB" style="height:14mm;padding-top:11mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/AlternativeTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:14mm;padding-top:11mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/AlternativeTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:14mm;padding-top:11mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/AlternativeTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:14mm;padding-top:11mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/AlternativeTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB" style="height:14mm;padding-top:11mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/AlternativeTaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="Part4Section">
		<xsl:param name="TargetNode" select="/.."/>
<div class="styGenericDiv" style="break-inside:avoid;">
		<div class="styBB" style="width:187mm;">
			<div class="styPartName">Part IV</div>
			<div class="styPartDesc">Allocation to Beneficiary</div>
			<div style="float:none;clear:both;width:187mm;">
				<b>Note: </b>
				<i>Be sure to complete <b>Form 4970</b>, Tax on Accumulation Distribution of Trusts.</i>
			</div>
		</div>
		<div style="width:187mm;border-bottom:1px solid black;">
			<div style="float:left;width:135mm;">
				Beneficiary's name <br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode/BeneficiaryNm"/>
				</xsl:call-template>
			</div>
			<div class="" style="float:left;width:52mm;border-left:1px solid black;padding-left:1mm;">
				Identifying number <br/>
				<span style="width:45mm;text-align:left;padding-top:2mm">
					<xsl:choose>
						<xsl:when test="SSN">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$TargetNode/EIN"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</div>
		</div>
		<div style="width:187mm;">
			<div style="width:109mm;float:left;">
				<div style="width:109mm;border-bottom:1px solid black;height:10.6mm;">
					Beneficiary's address (number and street including apartment number or P.O. box) 
					<xsl:choose>
						<xsl:when test="$TargetNode/USAddress"><br/>												
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode/USAddress/AddressLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$TargetNode/USAddress/AddressLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/USAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode/ForeignAddress/AddressLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$TargetNode/ForeignAddress/AddressLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/ForeignAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<div style="width:109mm;height:10.6mm;border-bottom:1px solid black;">
					City, state, and ZIP code <br/>
					<xsl:call-template name="PopulateCityStateInfo">
						<xsl:with-param name="TargetNode" select="$TargetNode/USAddress"/>
						<xsl:with-param name="ForeignAddressTargetNode" select="$TargetNode/ForeignAddress"/>
					</xsl:call-template>
					<xsl:if test="$TargetNode/ForeignAddress">
						<span style="width:7px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$TargetNode/ForeignAddress/CountryCd"/>
						</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			<div class="styIRS1041SJBox" style="font-weight:normal;height:21.2mm;padding-top:2mm;">
				<b>(a)</b>
				<br/>This<br/>beneficiary's<br/>share of<br/>line 13
			</div>
			<div class="styIRS1041SJBox" style="font-weight:normal;height:21.2mm;padding-top:2mm;">
				<b>(b)</b>
				<br/>This<br/>beneficiary's<br/>share of<br/>line 14
			</div>
			<div class="styIRS1041SJBox" style="font-weight:normal;height:21.2mm;padding-top:2mm;">
				<b>(c)</b>
				<br/>This<br/>beneficiary's<br/>share of<br/>
				<div style="float:left;clear:none;padding-left:8mm;">line 16</div>
				<div style="float:right;padding-top:3mm;">
					<xsl:call-template name="SetDynamicTableToggleButton">
						<xsl:with-param name="TargetNode" select="$TargetNode/AllocationToBenefShareDetail"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerID">BeneficiaryShares<xsl:value-of select="position()"/>
						</xsl:with-param>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
		<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
		<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
		<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
		<div class="styTableContainer" style="width:187mm;">
			<xsl:attribute name="id">BeneficiaryShares<xsl:value-of select="position()"/></xsl:attribute>
			<xsl:call-template name="SetInitialState"/>
			<!-- end -->
			<table class="styTable" cellspacing="0">
				<thead/>
				<tfoot/>
				<tbody style="border:1px solid black;">
					<xsl:variable name="Reps" select="count($TargetNode/AllocationToBenefShareDetail)"/>
					<xsl:if test="not($Print = $Separated and $Reps &gt; 5)">
						<xsl:for-each select="$TargetNode/AllocationToBenefShareDetail">
							<xsl:variable name="lineNo" select="position() + 31"/>
							<tr style="width:187mm;">
								<td class="styLNLeftNumBox">
									<xsl:if test="$lineNo &lt; 37">
										<xsl:value-of select="$lineNo"/>
									</xsl:if>
								</td>
								<td class="styLNDesc" style="width:93mm;">
									<span style="float:left;font-size:7pt">Throwback Year 
								<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;text-align:center;">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="ThrowbackYr"/>
											</xsl:call-template>
										</span>
									</span>
									<span class="styDotLn" style="float:right">..............</span>
								</td>
								<td class="styLNRightNumBox" style="height:4.4mm">
									<xsl:if test="$lineNo &lt; 37">
										<xsl:value-of select="$lineNo"/>
									</xsl:if>
								</td>
								<td class="styIRS1041SJAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AllocatedAccumulationDistriAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1041SJAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AllocatedResultDistriAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1041SJAmtBox" style="width:21.5mm;padding-right:0;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TaxExemptInterestAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="($Reps &lt; 1) or ($Print = $Separated and $Reps &gt; 5)">
						<tr style="width:187mm;">
							<td class="styLNLeftNumBox">32</td>
							<td class="styLNDesc" style="width:93mm;">
								<span style="float:left;">
							Throwback Year 
							<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;"/>
								</span>
								<span class="styDotLn" style="float:right">..............</span>
							</td>
							<td class="styLNRightNumBox" style="height:4.5mm;">32</td>
							<td class="styIRS1041SJAmtBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$TargetNode/AllocationToBenefShareDetail"/>
									<xsl:with-param name="ShortMessage" select="true()"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1041SJAmtBox"/>
							<td class="styIRS1041SJAmtBox"/>
						</tr>
					</xsl:if>
					<xsl:if test="($Reps &lt; 2) or ($Print = $Separated and $Reps &gt; 5)">
						<tr style="width:187mm;">
							<td class="styLNLeftNumBox">33</td>
							<td class="styLNDesc" style="width:93mm;">
								<span style="float:left;">
							Throwback Year 
							<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;"/>
								</span>
								<span class="styDotLn" style="float:right">..............</span>
							</td>
							<td class="styLNRightNumBox" style="height:4.5mm;">33</td>
							<td class="styIRS1041SJAmtBox" style="height:4.5mm;"/>
							<td class="styIRS1041SJAmtBox"/>
							<td class="styIRS1041SJAmtBox"/>
						</tr>
					</xsl:if>
					<xsl:if test="($Reps &lt; 3) or ($Print = $Separated and $Reps &gt; 5)">
						<tr style="width:187mm;">
							<td class="styLNLeftNumBox">34</td>
							<td class="styLNDesc" style="width:93mm;">
								<span style="float:left;">
							Throwback Year 
							<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;"/>
								</span>
								<span class="styDotLn" style="float:right">..............</span>
							</td>
							<td class="styLNRightNumBox" style="height:4.5mm;">34</td>
							<td class="styIRS1041SJAmtBox" style="height:4.5mm;"/>
							<td class="styIRS1041SJAmtBox"/>
							<td class="styIRS1041SJAmtBox"/>
						</tr>
					</xsl:if>
					<xsl:if test="($Reps &lt; 4) or ($Print = $Separated and $Reps &gt; 5)">
						<tr style="width:187mm;">
							<td class="styLNLeftNumBox">35</td>
							<td class="styLNDesc" style="width:93mm;">
								<span style="float:left;">
							Throwback Year 
							<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;"/>
								</span>
								<span class="styDotLn" style="float:right">..............</span>
							</td>
							<td class="styLNRightNumBox" style="height:4.5mm;">35</td>
							<td class="styIRS1041SJAmtBox" style="height:4.5mm;"/>
							<td class="styIRS1041SJAmtBox"/>
							<td class="styIRS1041SJAmtBox"/>
						</tr>
					</xsl:if>
					<xsl:if test="($Reps &lt; 5) or ($Print = $Separated and $Reps &gt; 5)">
						<tr class="styIRS1041SJCon" style="clear:all;height:auto;width:187mm;">
							<td class="styLNLeftNumBox">36</td>
							<td class="styLNDesc" style="width:93mm;">
								<span style="float:left;">
							Throwback Year 
							<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;"/>
								</span>
								<span class="styDotLn" style="float:right">..............</span>
							</td>
							<td class="styLNRightNumBox" style="height:4.5mm;">36</td>
							<td class="styIRS1041SJAmtBox" style="height:4.5mm;"/>
							<td class="styIRS1041SJAmtBox"/>
							<td class="styIRS1041SJAmtBox"/>
						</tr>
					</xsl:if>
				</tbody>
			</table>
			<xsl:call-template name="SetInitialDynamicTableHeight">
				<xsl:with-param name="TargetNode" select="$TargetNode/AllocationToBenefShareDetail"/>
				<xsl:with-param name="containerHeight" select="5"/>
				<xsl:with-param name="headerHeight" select="0"/>
				<xsl:with-param name="containerID">BeneficiaryShares<xsl:value-of select="position()"/>
				</xsl:with-param>
			</xsl:call-template>
		</div>
		<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
		<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
		<div style="width:187mm;height:7mm;border-bottom:1px solid black;">
			<div class="styLNLeftNumBox">37</div>
			<div class="styLNDesc" style="width:93mm;">
				Total. Add lines 32 through 36. Enter here and on the appropriate <br/>
				<span style="float:left;">lines of Form 4970</span>
				<span class="styIRS1041SJDots">................</span>
			</div>
			<div class="styLNRightNumBoxNBB" style="height:7mm;padding-top:3.5mm">37</div>
			<div class="styIRS1041SJAmtNBB" style="height:7mm;padding-top:4mm">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/CurrentDistributionAmt"/>
				</xsl:call-template>
			</div>
			<div class="styIRS1041SJAmtNBB" style="height:7mm;padding-top:4mm">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/TrustTaxesAmt"/>
				</xsl:call-template>
			</div>
			<div class="styIRS1041SJAmtNBB" style="height:7mm;padding-top:4mm">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/ExemptInterestAmt"/>
				</xsl:call-template>
			</div>
		</div>
</div>
	</xsl:template>
</xsl:stylesheet>
