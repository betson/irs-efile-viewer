   <!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
  <!-- Updated by Iskilu Lawal 4/21/2020 UWR # 232938 -->
]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8960Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>  
	<xsl:param name="FormData" select="$RtnDoc/IRS8960"/>  
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
				<!-- No Browser Caching -->  <!-- remove-->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8958"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8960Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form id="IRS8960">
					<xsl:call-template name="DocumentHeader"/>
					<!-- header -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;height:20.2mm;">
							<div style="width:30mm;height:11.5mm;border-bottom:0px solid black;">
								Form <span class="styFormNumber">8960</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</div>
							<div style="width:30mm;padding-top:2.3mm;">
							<span class="styAgency">Department of the Treasury<br/>
							Internal Revenue Service (99)</span></div>
						</div>
						<div class="styFTBox" style="width:126.6mm;">
							<span class="styMainTitle" style="font-size:12pt;">Net Investment Income Tax&#8212;<br/>
							Individuals, Estates, and Trusts</span><br/>
							<div class="styFBT">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								Attach to your tax return.
								<br/>
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								Go to  
									 <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form8960" title="Link to irs.gov">
										<i>www.irs.gov/Form8960</i>
									</a>
									for instructions and the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20.2mm;">
							<div class="styOMB" style="width:100%;height:4mm;">OMB No.1545-2227</div>
							<span class="styTaxYear">20<span class="styTYColor">20</span></span>
							<div class="stySequence" style="width:100%;height:6mm;padding-left:3mm;">
								Attachment<br/>Sequence No. <span style="font-weight:bold;font-size:10pt;">72</span>
							</div>
						</div>
					</div>
					<!-- Primary Taxpayer -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:10mm;">
							Name(s) shown on your tax return<br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:46.8mm;height:10mm;padding-left:2px;">
							Your social security number or EIN<br/>
							<span style="width:100%;text-align:center;font-size:7pt;font-weight:normal;padding-top:4mm;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</span>
						</div>
					</div>
					<!-- Header row -->
					<!-- Part I -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:6mm;padding-top:1mm;">Part I</div>
						<div class="styPartDesc" style="height:14mm;">
							<div style="padding-top:2mm;float:left;">Investment Income</div>
							<span style="font-weight:normal;font-family:Arial;height:8mm;">
								<span style="width:8px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section6013gInd"/>
										<xsl:with-param name="BackupName">IRS8960Section6013gInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Section6013gInd"/>
										<xsl:with-param name="BackupName">IRS8960Section6013gInd</xsl:with-param>
									</xsl:call-template>
									Section 6013(g) election (see instructions)
								</label><br/>
								<!-- $$$$$$$$$$$$$$$$$$$$$$$ new code added need field $$$$$$$$$$$$$$$$$$ -->
								<span style="width:8px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section6013hInd"/>
										<xsl:with-param name="BackupName">IRS8960RegSection6013hInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
							    <label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Section6013hInd"/>
										<xsl:with-param name="BackupName">IRS8960RegSection6013hInd</xsl:with-param>
									</xsl:call-template>
									Section 6013(h) election (see instructions)
								</label><br/>
								<span style="width:8px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/RegSection1141110gInd"/>
										<xsl:with-param name="BackupName">IRS8960RegSection1141110gInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
							<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/RegSection1141110gInd"/>
										<xsl:with-param name="BackupName">IRS8960RegSection1141110gInd</xsl:with-param>
									</xsl:call-template>
									Regulations section 1.1411-10(g) election (see instructions)
								</label>
							</span>
						</div>
					</div>
					<!-- Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							<span style="float:left;">Taxable interest (see instructions)</span>
							<span class="styIRS8960Dots">.................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							<span style="float:left;">Ordinary dividends (see instructions)</span>
							<span class="styIRS8960Dots">................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							<span style="float:left;">Annuities (see instructions)</span>
							<span class="styIRS8960Dots">.................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AnnuitesFromNonQlfPlansAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Rental real estate, royalties, partnerships, S corporations, trusts, etc.</span>
							<span style="float:left;">(see instructions)</span>
							<span class="styIRS8960Dots">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">4a</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-right:2px;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetRentalIncomeOrLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;"/>
					</div>
					<!-- Line 4b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox8960">b</div>
						<div class="styLNDesc" style="width:98.05mm;">
							Adjustment for net income or loss derived in the ordinary course of a non-<br/>
							<span style="float:left;">section 1411 trade or business (see instructions)</span>
							<span class="styIRS8960Dots">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.9mm;"><br/>4b</div>
						<div class="styLNAmountBox" style="height:7.9mm;padding-right:2px;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjNetIncmOrLossNonSect1411Amt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;"/>
					</div>
					<!-- Line 4c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox8960">c</div>
						<div class="styLNDesc">
							<span style="float:left;">Combine lines 4a and 4b</span>
							<span class="styIRS8960Dots">....................</span>
						</div>
						<div class="styLNRightNumBox">4c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RentalREAndAdjNetIncmOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">5a</div>
						<div class="styLNDesc" style="width:98.05mm;">
						   <span style="float:left;padding-top:1mm"> Net gain or loss from disposition of property (see instructions)</span>
							<span class="styIRS8960Dots">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:5.6mm;padding-top:1.6mm;">5a</div>
						<div class="styLNAmountBox" style="height:5.6mm;padding-right:2px;padding-top:1.6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PropertyDisposGainOrLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:5.8mm;"/>
					</div>
					<!-- Line 5b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox8960">b</div>
						<div class="styLNDesc" style="width:98.05mm;">
							Net gain or loss from disposition of property that is not subject to net <br/>
							<span style="float:left;">investment income tax (see instructions)</span>
							<span class="styIRS8960Dots">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;"><br/>5b</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-right:2px;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NonNIITPropDisposGainOrLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;"/>
					</div>
					<!-- Line 5c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox8960">c</div>
						<div class="styLNDesc" style="width:98.05mm;">
							Adjustment from disposition of partnership interest or S corporation stock<br/>
							<span style="float:left;">(see instructions) 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AdjFromDisposOfStockAmt"/>
								</xsl:call-template>
							</span>
							<span class="styIRS8960Dots">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;"><br/>5c</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-right:2px;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjFromDisposOfStockAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;"/>
					</div>
					<!-- Line 5d -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox8960">d</div>
						<div class="styLNDesc">
							<span style="float:left;">Combine lines 5a through 5c</span>
							<span class="styIRS8960Dots">...................</span>
						</div>
						<div class="styLNRightNumBox">5d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromDisposAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							<span style="float:left;">Adjustments to investment income for certain CFCs and PFICs (see instructions)</span>
							<span class="styIRS8960Dots">.....</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCAndPFICInvstIncmChangesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							<span style="float:left;">Other modifications to investment income (see instructions)</span>
							<span class="styIRS8960Dots">...........</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherInvestmentIncomeOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							<span style="float:left;">Total investment income. Combine lines 1, 2, 3, 4c, 5d, 6, and 7</span>
							<span class="styIRS8960Dots">..........</span>
						</div>
						<div class="styLNRightNumBoxNBB">8</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;">Part II</div>
						<div class="styPartDesc">Investment Expenses Allocable to Investment Income and Modifications</div>
					</div>
					<!-- Line 9a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">9a</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Investment interest expenses (see instructions)</span>
							<span class="styIRS8960Dots">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">9a</div>
						<div class="styLNAmountBox" style="height:4.4mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 9b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox8960">b</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">State, local, and foreign income tax (see instructions)</span>
							<span class="styIRS8960Dots">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">9b</div>
						<div class="styLNAmountBox" style="height:4.4mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StateLocalForeignIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 9c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox8960">c</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Miscellaneous investment expenses (see instructions)</span>
							<span class="styIRS8960Dots">....</span>
						</div>
						<div class="styLNRightNumBox">9c</div>
						<div class="styLNAmountBox" style="padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MiscInvestmentExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 9d -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox8960">d</div>
						<div class="styLNDesc">
							<span style="float:left;">Add lines 9a, 9b, and 9c</span>
							<span class="styIRS8960Dots">....................</span>
						</div>
						<div class="styLNRightNumBox">9d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InvestmentExpenseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							<span style="float:left;">Additional modifications (see instructions)</span>
							<span class="styIRS8960Dots">...............</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalModificationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							<span style="float:left;">Total deductions and modifications. Add lines 9d and 10</span>
							<span class="styIRS8960Dots">............</span>
						</div>
						<div class="styLNRightNumBoxNBB">11</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionModificationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part III -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;">Part III</div>
						<div class="styPartDesc">Tax Computation</div>
					</div>
					<!-- Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							Net investment income. Subtract Part II, line 11 from Part I, line 8. Individuals complete lines 13&#8211;17. 
							<span style="float:left;">Estates and trusts complete lines 18a&#8211;21. If zero or less, enter -0-</span>
							<span class="styIRS8960Dots">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm; padding-top:4mm">12</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetInvestmentIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Individuals -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"></div>
						<div class="styLNDesc"><b>Individuals:</b></div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Modified adjusted gross income (see instructions)</span>
							<span class="styIRS8960Dots">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">13</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Threshold based on filing status (see instructions)</span>
							<span class="styIRS8960Dots">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">14</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FilingThresholdAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 15 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Subtract line 14 from line 13. If zero or less, enter -0-</span>
							<span class="styIRS8960Dots">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">15</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MAGILessThresholdAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 16 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc">
							<span style="float:left;">Enter the smaller of line 12 or line 15</span>
							<span class="styIRS8960Dots">.................</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrIncmOrMAGILessThrshldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc">
							Net investment income tax for individuals. Multiply  line 16 by 3.8% (.038).
							<span style="float:left;"><b>Enter here and include on  your tax return</b> (see instructions) </span>
							<span class="styIRS8960Dots">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:4mm;">17</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IndivNetInvstIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Estates and Trusts -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"><b>Estates and Trusts:</b></div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<!-- Line 18a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">18a</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Net investment income (line 12 above)</span>
							<span class="styIRS8960Dots">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">18a</div>
						<div class="styLNAmountBox" style="height:4.4mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetInvestmentIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 18b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD8960">b</div>
						<div class="styLNDesc" style="width:98.05mm;">
							Deductions for distributions of net investment income and deductions <br/>
							<span style="float:left;">under section 642(c) (see instructions)</span>
							<span class="styIRS8960Dots">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;"><br/>18b</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-right:2px;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeDistributionDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;"/>
					</div>
					<!-- Line 18c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD8960">c</div>
						<div class="styLNDesc" style="width:98.05mm;">
							Undistributed net investment income. Subtract line 18b from 18a <br/>
							<span style="float:left;">(see instructions). If zero or less, enter -0-</span>
							<span class="styIRS8960Dots">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;"><br/>18c</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-right:2px;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedNetIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;"/>
					</div>
					<!-- Line 19a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">19a</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Adjusted gross income (see instructions)</span>
							<span class="styIRS8960Dots">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">19a</div>
						<div class="styLNAmountBox" style="height:4.4mm;padding-right:3px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 19b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD8960">b</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Highest tax bracket for estates and trusts for the year (see instructions)</span>
							<span class="styIRS8960Dots"></span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">19b</div>
						<div class="styLNAmountBox" style="height:4.4mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TrustEstHighestTaxBracketAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 19c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD8960">c</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Subtract line 19b from line 19a. If zero or less, enter -0-</span>
							<span class="styIRS8960Dots">....</span>
						</div>
						<div class="styLNRightNumBox">19c</div>
						<div class="styLNAmountBox" style="padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AGILessTrustEstHighestTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 20 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc">
							<span style="float:left;">Enter the smaller of line 18c or line 19c</span>
							<span class="styIRS8960Dots">................</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrUndistrIncmAGILessTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc">
						Net investment income tax for estates and trusts. Multiply line 20 by 3.8% (.038).<span style="float:left;"><b> Enter here and include on your tax return </b>(see instructions)</span>
							<span class="styIRS8960Dots">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:4mm;">21</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstTrustNetInvstIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Footer Page 1 -->
					<div class="pageEnd" style="width:187mm;float:none;clear:both;">
						<span style="float:left;clear:none;font-weight:bold;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="float:left;clear:none;margin-left:20mm;">Cat. No. 59474M</span>
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8960</span> (2020)</span>
					</div>
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
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>