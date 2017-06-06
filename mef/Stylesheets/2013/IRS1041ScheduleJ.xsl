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
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />  
	<xsl:param name="FormData" select="$RtnDoc/IRS1041ScheduleJ" />  
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 1040 Schedule J" />
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
			<body class="styBodyClass">
				<form id="IRS1041ScheduleJ">
					<xsl:call-template name="DocumentHeader"/>
					<!-- header -->
					<div class="styTBB" style="width:187mm;height:18mm;">
						<div class="styFNBox" style="width:31mm;height:100%;">
							<div class="styFN" style="font-size:14;height:10mm;">SCHEDULE J <br/><span style="font-size:12;">(Form 1041)</span>
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
								Attach to Form 1041.<br/><span style="font-size:4pt;"><br/></span>
								<img src="{$ImagePath}/1040ScheduleJ_Bullet.gif" alt="Bullet Point"/>
								Information about Schedule J (Form 1041) and its separate instructions is at <i>www.irs.gov/form1041</i>.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:100%;">
							<div class="styOMB">OMB No. 1545-0092</div>
							<div class="styTaxYear">20<span class="styTYColor">13</span></div>
						</div>
					</div>
					<!-- Primary Taxpayer -->
					<div class="styBB" style="width:187mm;height:8mm;">
						<div class="styNameBox" style="width:140mm;height:100%;font-size:7pt;">
							Name of trust <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;height:100%;padding-left:4px;font-size:7pt;">
							Employer identification number<br/>
							<span style="text-align:center;width:100%;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Part I -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Accumulation Distribution in 2013</div>
						<div style="float:none;clear:both;width:187mm;"><b>Note: </b><i>See the Form 4970 instructions for certain income that minors may exclude and special rules for multiple trusts.</i></div>
					</div>
					<div style="width:187mm;border-bottom:1px solid black;">
						<!-- Line 1 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc">
								Other amounts paid, credited, or otherwise required to be distributed for 2013 (from Form 1041,<br/>
								<span style="float:left;">Schedule B, line 10)</span>
								<span class="styIRS1041SJDots">...........................</span>
							</div>
							<div class="styLNRightNumBox"><br/>1</div>
							<div class="styLNAmountBox"><br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SecondTierDistributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc"  style="width:106mm;"/>
							<div class="styLNRightNumBoxNBB" style="border-left-color:white;"/>
							<div class="styLNAmountBoxNBB" style="border-left-color:white;"/>
							<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:106mm;">
								<span style="float:left;">Distributable net income for 2013 (from Form 1041, Schedule B, line 7)</span>
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
								Income required to be distributed currently for 2013 (from Form 1041, 
								<span style="float:left;">Schedule B, line 9)</span>
								<span class="styIRS1041SJDots">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7.6mm;"><br/>3</div>
							<div class="styLNAmountBox" style="height:7.6mm;"><br/>
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
								<span class="styIRS1041SJDots">.................</span>
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
								<span style="float:left;">Accumulation distribution for 2013. Subtract line 4 from line 1</span>
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
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Ordinary Income Accumulation Distribution <span style="font-weight:normal;"> (Enter the applicable throwback years below.)</span></div>
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
						<span style="float:right;clear:none;font-weight:bold;">Schedule J (Form 1041) 2013</span>
					</div>
					<div class="styTBB" style="width:187mm;">
						<span style="float:left;clear:none;">Schedule J (Form 1041) 2013</span>
						<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">2</span></span>
					</div>
					<!-- Part 3 -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Taxes Imposed on Undistributed Net Income <span style="font-weight:normal;font-size:6pt;"> (Enter the applicable throwback years below.) (See the instructions.)</span></div>
						<div style="float:none;clear:both;width:187mm;">
							<b>Note: </b><i>If more than 5 throwback years are involved, attach additional schedules. If the trust received an accumulation distribution from
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
						<xsl:call-template name="Part4Section">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($FormData/AllocationToBeneficiaryDetail) = 0">
						<xsl:call-template name="Part4Section"/>
					</xsl:if>
					<div class="pageEnd" style="width:187mm;">
						<span style="float:right;clear:none;font-weight:bold;">Schedule J (Form 1041) 2013</span>
					</div>
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
							<br/><br/>
							<span class="styRepeatingDataTitle">
								Form 1041 Schedule J, Part IV, Line 32+<br/>
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
				<div class="styIRS1041SJBox" style="width:62.4mm;border-left:none;font-weight:normal;text-align:left;">
					<b>Note: </b><i> If the distribution is thrown back to more 
					than 5 years (starting with the earliest applicable 
					tax year beginning after 1968), attach additional 
					schedules. (If the trust was a simple trust, see 
					Regulations section 1.665(e)-1A(b).)</i>
				</div>
				<div class="styIRS1041SJBox">
					<span style="font-size:4pt;"><br/></span>
					Throwback <br/>year ending<br/>
					<span style="font-size:6pt;"><br/></span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<span style="font-size:4pt;"><br/></span>
					Throwback <br/>year ending<br/>
					<span style="font-size:6pt;"><br/></span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<span style="font-size:4pt;"><br/></span>
					Throwback <br/>year ending<br/>
					<span style="font-size:6pt;"><br/></span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<span style="font-size:4pt;"><br/></span>
					Throwback <br/>year ending<br/>
					<span style="font-size:6pt;"><br/></span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<span style="font-size:4pt;"><br/></span>
					Throwback <br/>year ending<br/>
					<span style="font-size:6pt;"><br/></span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
			</div>
		</div>
		<!-- Line 6 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD">6</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Distributable net income (see <br/>
				<span style="float:left;">the instructions)</span>
				<span class="styIRS1041SJDots">......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/>6</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 7 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD">7</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Distributions (see the <br/>
				<span style="float:left;">instructions)</span>
				<span class="styIRS1041SJDots">.......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/>7</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/DistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/DistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/DistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/DistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/DistributionAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding:0px;"/>
			<div class="styLNDesc" style="width:46.5mm;height:3.5mm;padding:0px;"/>
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
			<div class="styLNDesc" style="width:46.5mm;">
				<span style="float:left;">Subtract line 7 from line 6</span>
				<span class="styIRS1041SJDots">..</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox">8</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/IncomeLessDistributionsAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/IncomeLessDistributionsAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/IncomeLessDistributionsAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/IncomeLessDistributionsAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/IncomeLessDistributionsAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 9 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD">9</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Enter amount from page 2, <br/>
				<span style="float:left;">line 25 or line 31, as applicable</span>
				<span class="styIRS1041SJDots">.</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/>9</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/TaxUndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/TaxUndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/TaxUndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/TaxUndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/TaxUndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 10 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">10</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Undistributed net income <br/>
				<span style="float:left;">Subtract line 9 from line 8</span>
				<span class="styIRS1041SJDots">..</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/>10</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/UndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/UndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/UndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/UndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/UndistributedNetIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 11 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">11</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Enter amount of prior <br/>
				accumulation distributions <br/>
				thrown back to any of these <br/>
				<span style="float:left;">years</span>
				<span class="styIRS1041SJDots">.........</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/><br/><br/>11</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/PriorAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/PriorAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/PriorAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/PriorAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/PriorAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding:0px;"/>
			<div class="styLNDesc" style="width:46.5mm;height:3.5mm;padding:0px;"/>
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
			<div class="styLNDesc" style="width:46.5mm;">
				<span style="float:left;">Subtract line 11 from line 10</span>
				<span class="styIRS1041SJDots">..</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox">12</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/PriorYearUndistriNetAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/PriorYearUndistriNetAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/PriorYearUndistriNetAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/PriorYearUndistriNetAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/PriorYearUndistriNetAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding:0px;"/>
			<div class="styLNDesc" style="width:46.5mm;height:3.5mm;padding:0px;"/>
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
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">13</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Allocate the amount on line 5 <br/>
				to the earliest applicable year <br/>
				first. Do not allocate an <br/>
				amount greater than line 12 <br/>
				for the same year (see the <br/>
				<span style="float:left;">instructions)</span>
				<span class="styIRS1041SJDots">......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/><br/><br/><br/><br/>13</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/AllocatedAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/AllocatedAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/AllocatedAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/AllocatedAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/AllocatedAccumulationDistriAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 14 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">14</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Divide line 13 by line 10 and <br/>
				multiply result by amount on <br/>
				<span style="float:left;">line 9</span>
				<span class="styIRS1041SJDots">.........</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/><br/>14</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/AllocatedResultDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/AllocatedResultDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/AllocatedResultDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/AllocatedResultDistriAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/AllocatedResultDistriAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding:0px;"/>
			<div class="styLNDesc" style="width:46.5mm;height:3.5mm;padding:0px;"/>
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
			<div class="styLNDesc" style="width:46.5mm;">
				<span style="float:left;">Add lines 13 and 14</span>
				<span class="styIRS1041SJDots">....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox">15</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/TotalAccumDistriAllocatedAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/TotalAccumDistriAllocatedAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/TotalAccumDistriAllocatedAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/TotalAccumDistriAllocatedAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/TotalAccumDistriAllocatedAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 16 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">16</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Tax-exempt interest included <br/>
				on line 13 (see the <br/>
				<span style="float:left;">instructions)</span>
				<span class="styIRS1041SJDots">......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/><br/>16</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/TaxExemptInterestAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/TaxExemptInterestAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/TaxExemptInterestAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/TaxExemptInterestAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 4]/TaxExemptInterestAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding:0px;"/>
			<div class="styLNDesc" style="width:46.5mm;height:3.5mm;padding:0px;"/>
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
			<div class="styLNDesc" style="width:46.5mm;">
				<span style="float:left;">Subtract line 16 from line 15</span>
				<span class="styIRS1041SJDots">..</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBoxNBB" style="height:4.4mm;">17</div>
				<div class="styIRS1041SJAmtNBB">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos]/AccumulationDistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 1]/AccumulationDistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 2]/AccumulationDistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncmAccumDistriGrp[$pos + 3]/AccumulationDistributionAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB">
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
				<div class="styIRS1041SJBox" style="width:54.4mm;border:none;font-weight:normal;text-align:left;">
					If the trust elected the alternative tax <br/>
					on capital gains (repealed for tax <br/>
					years beginning after 1978), <b>skip</b> <br/>
					lines 18 through 25 and <b>complete</b> <br/>
					lines 26 through 31.
				</div>
				<div class="styIRS1041SJBox" style="width:8mm;border-left:none;border-right:none;"><br/><br/><br/><br/>&nbsp;</div>
				<div class="styIRS1041SJBox">
					<span style="font-size:4pt;"><br/></span>
					Throwback <br/>year ending<br/>
					<span style="font-size:6pt;"><br/></span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<span style="font-size:4pt;"><br/></span>
					Throwback <br/>year ending<br/>
					<span style="font-size:6pt;"><br/></span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<span style="font-size:4pt;"><br/></span>
					Throwback <br/>year ending<br/>
					<span style="font-size:6pt;"><br/></span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<span style="font-size:4pt;"><br/></span>
					Throwback <br/>year ending<br/>
					<span style="font-size:6pt;"><br/></span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1041SJBox">
					<span style="font-size:4pt;"><br/></span>
					Throwback <br/>year ending<br/>
					<span style="font-size:6pt;"><br/></span>
					<span style="width:15mm;border-bottom:1px black dashed;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/ThrowbackYr"/>
						</xsl:call-template>
					</span>
				</div>
			</div>
		</div>
		<!-- Line 18 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">18</div>
			<div class="styLNDesc" style="width:46.5mm;">
				<span style="float:left;">Regular tax</span>
				<span class="styIRS1041SJDots">.......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox">18</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/RegularTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/RegularTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/RegularTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/RegularTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/RegularTaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 19 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">19</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Trust's share of net short-term <br/>
				<span style="float:left;">gain</span>
				<span class="styIRS1041SJDots">.........</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/>19</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/NetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/NetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/NetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/NetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/NetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 20 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">20</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Trust's share of net long-term <br/>
				<span style="float:left;">gain</span>
				<span class="styIRS1041SJDots">.........</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/>20</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/NetLongTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/NetLongTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/NetLongTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/NetLongTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/NetLongTermGainAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 21 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">21</div>
			<div class="styLNDesc" style="width:46.5mm;">
				<span style="float:left;">Add lines 19 and 20</span>
				<span class="styIRS1041SJDots">....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox">21</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/TotalNetGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TotalNetGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TotalNetGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TotalNetGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TotalNetGainAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 22 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">22</div>
			<div class="styLNDesc" style="width:46.5mm;">
				<span style="float:left;">Taxable income</span>
				<span class="styIRS1041SJDots">......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox">22</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/TaxableIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TaxableIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TaxableIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TaxableIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TaxableIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 23 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">23</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Enter percent. Divide line 21 <br/>
				by line 22, but do not enter <br/>
				<span style="float:left;">more than 100%</span>
				<span class="styIRS1041SJDots">.....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/><br/>23</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/TaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
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
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">24</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Multiply line 18 by the <br/>
				<span style="float:left;">percentage on line 23</span>
				<span class="styIRS1041SJDots">....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/>24</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/IncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/IncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/IncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/IncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/IncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 25 -->
		<div style="width:187mm;border-bottom:1px solid black;">
			<div class="styLNLeftNumBox">25</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Tax on undistributed net <br/>
				income. Subtract line 24 from <br/>
				line 18. Enter here and on <br/>
				<span style="float:left;">page 1, line 9</span>
				<span class="styIRS1041SJDots">......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="border-bottom:none;"><br/><br/><br/>25</div>
				<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/TaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div style="width:187mm;">
			<div class="styGenericDiv" style="width:54.5mm;height:15mm;padding-top:2px;">
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
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">26</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Tax on income other than <br/>
				<span style="float:left;">long-term capital gain</span>
				<span class="styIRS1041SJDots">....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/>26</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/AlternativeTaxOnOtherIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/AlternativeTaxOnOtherIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/AlternativeTaxOnOtherIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/AlternativeTaxOnOtherIncomeAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/AlternativeTaxOnOtherIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 27 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">27</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Trust's share of net short-term <br/>
				<span style="float:left;">gain</span>
				<span class="styIRS1041SJDots">.........</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/>27</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/AltTaxNetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/AltTaxNetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/AltTaxNetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/AltTaxNetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/AltTaxNetShortTermGainAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 28 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">28</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Trust's share of taxable <br/>
				income less section 1202 <br/>
				<span style="float:left;">deduction</span>
				<span class="styIRS1041SJDots">........</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/><br/>28</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/TrustTxblIncomeNotExcldSBAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TrustTxblIncomeNotExcldSBAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TrustTxblIncomeNotExcldSBAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TrustTxblIncomeNotExcldSBAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/TrustTxblIncomeNotExcldSBAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 29 -->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">29</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Enter percent. Divide line 27 <br/>
				by line 28, but do not enter <br/>
				<span style="float:left;">more than 100%</span>
				<span class="styIRS1041SJDots">.....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/><br/>29</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/AlternativeTaxTaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/AlternativeTaxTaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/AlternativeTaxTaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/AlternativeTaxTaxableIncomePct"/>
					</xsl:call-template>
					<xsl:if test="not($FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/TaxableIncomePct)">
						%
					</xsl:if>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
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
		<div style="width:187mm;">
			<div class="styLNLeftNumBox">30</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Multiply line 26 by the <br/>
				<span style="float:left;">percentage on line 29</span>
				<span class="styIRS1041SJDots">....</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox"><br/>30</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/AltTaxIncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/AltTaxIncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/AltTaxIncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/AltTaxIncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtBox"><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/AltTaxIncomeSubjectToTaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!-- Line 31 -->
		<div style="width:187mm;border-bottom:1px solid black;">
			<div class="styLNLeftNumBox">31</div>
			<div class="styLNDesc" style="width:46.5mm;">
				Tax on undistributed net <br/>
				income. Subtract line 30 from <br/>
				line 26. Enter here and on <br/>
				<span style="float:left;">page 1, line 9</span>
				<span class="styIRS1041SJDots">......</span>
			</div>
			<div style="float:right;">
				<div class="styLNRightNumBox" style="border-bottom:none;"><br/><br/><br/>31</div>
				<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos]/AlternativeTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 1]/AlternativeTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 2]/AlternativeTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 3]/AlternativeTaxAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/><br style="font-size:7pt;"/><br style="font-size:7pt;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/UndistriNetIncomeTaxesGrp[$pos + 4]/AlternativeTaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="Part4Section">
		<xsl:param name="TargetNode" select="/.."/>
		<div class="styBB" style="width:187mm;">
			<div class="styPartName">Part IV</div>
			<div class="styPartDesc">Allocation to Beneficiary</div>
			<div style="float:none;clear:both;width:187mm;">
				<b>Note: </b><i>Be sure to complete <b>Form 4970</b>, Tax on Accumulation Distribution of Trusts.</i>
			</div>
		</div>
		<div style="width:187mm;border-bottom:1px solid black;">
			<div style="float:left;width:136.8mm;">
				Beneficiary's name <br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode/BeneficiaryNm"/>
				</xsl:call-template>
			</div>
			<div class="" style="float:left;width:49mm;border-left:1px solid black;padding-left:1mm;">
				Identifying number <br/>
				<span style="width:45mm;text-align:center;">
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
			<div style="width:111.9mm;float:left;">
				<div style="width:100%;border-bottom:1px solid black;height:10.6mm;">
					Beneficiary's address (number and street including apartment number or P.O. box) <br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$TargetNode//AddressLine1"/>
					</xsl:call-template>
					<xsl:if test="$TargetNode//AddressLine2">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$TargetNode//AddressLine2"/>
						</xsl:call-template>
					</xsl:if>
				</div>
				<div style="width:100%;height:10.6mm;border-bottom:1px solid black;">
					City, state, and ZIP code <br/>
					<xsl:call-template name="PopulateCityStateInfo">
						<xsl:with-param name="TargetNode" select="$TargetNode/USAddress"/>
						<xsl:with-param name="ForeignAddressTargetNode" select="$TargetNode/ForeignAddress"/>
					</xsl:call-template>
					<xsl:if test="$TargetNode/ForeignAddress">
						<span style="width:7px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$TargetNode/ForeignAddress/Country"/>
						</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			<div class="styIRS1041SJBox" style="font-weight:normal;height:21.2mm;">
				<b>(a)</b><br/>This<br/>beneficiary's<br/>share of<br/>line 13
			</div>
			<div class="styIRS1041SJBox" style="font-weight:normal;height:21.2mm;">
				<b>(b)</b><br/>This<br/>beneficiary's<br/>share of<br/>line 14
			</div>
			<div class="styIRS1041SJBox" style="font-weight:normal;height:21.2mm;">
				<b>(c)</b><br/>This<br/>beneficiary's<br/>share of<br/><div style="float:left;clear:none;padding-left:8mm;">line 16</div>
				<div style="float:right;">
					<xsl:call-template name="SetTableToggleButton">
						<xsl:with-param name="TargetNode" select="$TargetNode/AllocationToBenefShareDetail"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID">BeneficiaryShares<xsl:value-of select="position()"/></xsl:with-param>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div class="styIRS1041SJCon" id="">
			<xsl:attribute name="id">BeneficiaryShares<xsl:value-of select="position()"/></xsl:attribute>
			<xsl:call-template name="SetInitialState"/>
			<xsl:variable name="Reps" select="count($TargetNode/AllocationToBenefShareDetail)"/>
			<xsl:if test="not($Print = $Separated and $Reps &gt; 5)">
				<xsl:for-each select="$TargetNode/AllocationToBenefShareDetail">
					<xsl:variable name="lineNo" select="position() + 31"/>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">
							<xsl:if test="$lineNo &lt; 37">
								<xsl:value-of select="$lineNo"/>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:96mm;">
							<span style="float:left;">
								Throwback Year 
								<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;text-align:center;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="ThrowbackYr"/>
									</xsl:call-template>
								</span>
							</span>
							<span class="styIRS1041SJDots">..............</span>
						</div>
						<div class="styLNRightNumBox">
							<xsl:if test="$lineNo &lt; 37">
								<xsl:value-of select="$lineNo"/>
							</xsl:if>
						</div>
						<div class="styIRS1041SJAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllocatedAccumulationDistriAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1041SJAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllocatedResultDistriAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1041SJAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TaxExemptInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="($Reps &lt; 1) or ($Print = $Separated and $Reps &gt; 5)">
				<div style="width:187mm;">
					<div class="styLNLeftNumBox">32</div>
					<div class="styLNDesc" style="width:96mm;">
						<span style="float:left;">
							Throwback Year 
							<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;"></span>
						</span>
						<span class="styIRS1041SJDots">..............</span>
					</div>
					<div class="styLNRightNumBox">32</div>
					<div class="styIRS1041SJAmtBox">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$TargetNode/AllocationToBenefShareDetail"/>
							<xsl:with-param name="ShortMessage" select="true()"/>
						</xsl:call-template>
					</div>
					<div class="styIRS1041SJAmtBox"/>
					<div class="styIRS1041SJAmtBox"/>
				</div>
			</xsl:if>
			<xsl:if test="($Reps &lt; 2) or ($Print = $Separated and $Reps &gt; 5)">
				<div style="width:187mm;">
					<div class="styLNLeftNumBox">33</div>
					<div class="styLNDesc" style="width:96mm;">
						<span style="float:left;">
							Throwback Year 
							<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;"></span>
						</span>
						<span class="styIRS1041SJDots">..............</span>
					</div>
					<div class="styLNRightNumBox">33</div>
					<div class="styIRS1041SJAmtBox"/>
					<div class="styIRS1041SJAmtBox"/>
					<div class="styIRS1041SJAmtBox"/>
				</div>
			</xsl:if>
			<xsl:if test="($Reps &lt; 3) or ($Print = $Separated and $Reps &gt; 5)">
				<div style="width:187mm;">
					<div class="styLNLeftNumBox">34</div>
					<div class="styLNDesc" style="width:96mm;">
						<span style="float:left;">
							Throwback Year 
							<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;"></span>
						</span>
						<span class="styIRS1041SJDots">..............</span>
					</div>
					<div class="styLNRightNumBox">34</div>
					<div class="styIRS1041SJAmtBox"/>
					<div class="styIRS1041SJAmtBox"/>
					<div class="styIRS1041SJAmtBox"/>
				</div>
			</xsl:if>
			<xsl:if test="($Reps &lt; 4) or ($Print = $Separated and $Reps &gt; 5)">
				<div style="width:187mm;">
					<div class="styLNLeftNumBox">35</div>
					<div class="styLNDesc" style="width:96mm;">
						<span style="float:left;">
							Throwback Year 
							<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;"></span>
						</span>
						<span class="styIRS1041SJDots">..............</span>
					</div>
					<div class="styLNRightNumBox">35</div>
					<div class="styIRS1041SJAmtBox"/>
					<div class="styIRS1041SJAmtBox"/>
					<div class="styIRS1041SJAmtBox"/>
				</div>
			</xsl:if>
			<xsl:if test="($Reps &lt; 5) or ($Print = $Separated and $Reps &gt; 5)">
				<div style="width:187mm;">
					<div class="styLNLeftNumBox">36</div>
					<div class="styLNDesc" style="width:96mm;">
						<span style="float:left;">
							Throwback Year 
							<span style="width:14mm;margin-left:2mm;border-bottom:1px dashed black;"></span>
						</span>
						<span class="styIRS1041SJDots">..............</span>
					</div>
					<div class="styLNRightNumBox">36</div>
					<div class="styIRS1041SJAmtBox"/>
					<div class="styIRS1041SJAmtBox"/>
					<div class="styIRS1041SJAmtBox"/>
				</div>
			</xsl:if>
		</div>
		<div style="width:187mm;border-bottom:1px solid black;">
			<div class="styLNLeftNumBox">37</div>
			<div class="styLNDesc" style="width:96mm;">
				Total. Add lines 32 through 36. Enter here and on the appropriate <br/>
				<span style="float:left;">lines of Form 4970</span>
				<span class="styIRS1041SJDots">................</span>
			</div>
			<div class="styLNRightNumBoxNBB"><br/>37</div>
			<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/CurrentDistributionAmt"/>
				</xsl:call-template>
			</div>
			<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/TrustTaxesAmt"/>
				</xsl:call-template>
			</div>
			<div class="styIRS1041SJAmtNBB"><br style="font-size:7pt;"/>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/ExemptInterestAmt"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
