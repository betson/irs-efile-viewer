<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 07/30/2015 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleJStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1040SJData" select="$RtnDoc/IRS1040ScheduleJ"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040SJData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1040 Schedule J"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040ScheduleJStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS1040ScheduleJ">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;height:22mm;">
						<div class="styFNBox" style="width:31mm;height:100%;">
							<div class="styFN" style="font-size:10pt;">SCHEDULE J <br/><span style="font-size:8pt;">(Form 1040 or 1040-SR)</span></div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040SJData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-top:2mm">Department of the Treasury <br/>Internal Revenue Service (99)</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:100%;">
							<div class="styFMT">Income Averaging for <br/>Farmers and Fishermen</div>
							<div class="styFBT" style="margin-top:0.4mm;">
								<img src="{$ImagePath}/1040SchJ_Bullet.gif" alt="Right Arrow"/>
								Attach to Form 1040, Form 1040-SR, or Form 1040-NR.<br/>
								<img src="{$ImagePath}/1040SchJ_Bullet.gif" alt="Right Arrow"/>
								Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Schedulej" title="Link to irs.gov">
									<i>www.irs.gov/ScheduleJ </i>
								</a> for instructions and the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:100%;">
							<div class="styOMB">OMB No. 1545-0074</div>
							<div class="styTaxYear">20<span class="styTYColor">19</span></div>
							<div class="stySequence">Attachement <br/>Sequence No. <b>20</b></div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:6mm;">
						<div class="styNameBox" style="width:140mm;height:100%;">
							Name(s) shown on return <br/>
				<xsl:choose>
					    <xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
					   </xsl:when>
				</xsl:choose>			
						</div>
						<div class="styEINBox" style="width:46mm;height:100%;padding-left:4px;">
							Social Security Number (SSN)<br/>
							<span style="text-align:center;width:100%;font-weight:normal;">
							<xsl:choose>
							<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
							   </xsl:call-template>
				   		  </xsl:when>
					    </xsl:choose>
      				   </span>
						</div>
					</div>
					<div class="styTBB">
						<!-- Line 1 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc">
								<span style="float:left;">Enter the taxable income from your <b>2019</b> Form 1040 or 1040-SR, line 11b, or Form 1040-NR, line 41.</span>
								<span class="styIRS1040SJDots"></span>
							</div>
							<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 2a -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">2a</div>
							<div class="styLNDesc">
								<span style="float:left;">Enter your <b>elected farm income</b> (see instructions). <b>Do not</b> enter more than the amount on line 1</span>
								<span class="styIRS1040SJDots">..</span>
							</div>
							<div class="styLNRightNumBox">2a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/ElectedFarmIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="font-weight:bold;">Capital gain included on line 2a:</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 2b -->
						<div class="styGenericDiv" style="width:187mm;height:8mm;">
							<div class="styLNLeftNumBoxSD">b</div>
							<div class="styLNDesc" style="width:97.8mm;padding-right:2mm;">
								Excess, if any, of net long-term capital gain over net short-term <br/>
								<span style="float:left;">capital loss</span>
								<span class="styIRS1040SJDots">...............</span>
							</div>
							<div class="styGenericDiv" style="width:8mm;">
								<div class="styLNRightNumBox" style="border-width:0px;"/>
								<div class="styLNRightNumBox">2b</div>
							</div>
							<div class="styGenericDiv" style="width:32.2mm;">
								<div class="styLNAmountBox" style="border-width:0px;"/>
								<div class="styLNAmountBox" style="padding-right:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040SJData/ExcessNetLongTermCapGainAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:9mm;background-color:lightgrey;border-bottom:1px solid lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 2c -->
						<div class="styGenericDiv" style="width:187mm;height:4mm;">
							<div class="styLNLeftNumBoxSD">c</div>
							<div class="styLNDesc" style="width:97.8mm;padding-right:2mm;">
								<span style="float:left;">Unrecaptured section 1250 gain</span>
								<span class="styIRS1040SJDots">..........</span>
							</div>
							<div class="styLNRightNumBox">2c</div>
							<div class="styLNAmountBox" style="padding-right:1px;width:32.2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/UnrecapturedPropertyGainAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;border-bottom:1px solid lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 3 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc">
								<span style="float:left;">Subtract line 2a from line 1</span>
								<span class="styIRS1040SJDots">....................</span>
							</div>
							<div class="styLNRightNumBox">3</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/NetIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 4 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc">
								<span style="float:left;">Figure the tax on the amount on line 3 using the <b>2019</b> tax rates (see instructions)</span>
								<span class="styIRS1040SJDots">.....</span>
							</div>
							<div class="styLNRightNumBox">4</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/CurrentTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 5 -->
						<div class="styGenericDiv" style="width:187mm;height:30mm;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="width:93.8mm;">
								If you used Schedule J to figure your tax for:<br/>
								&#8226; 2018, enter the amount from your 2018 Schedule J, line 11.<br/>
								&#8226; 2017 but not 2018, enter the amount from your 2017 Schedule J, <br/>
								<span style="width:2.5mm;"/>line 15.
								<br/>
								&#8226; 2016 but not 2017 or 2018, enter the amount from your 2016 <br/> 
								<span style="width:2mm;"/>Schedule J, line 3.
								<br/>Otherwise, enter the taxable income from your <b>2016</b> Form 1040,<br/>
								line 43; Form 1040A, line 27; Form 1040EZ, line 6; Form 1040-NR, <br/>
								line 41; or Form 1040-NR-EZ, line 14. If zero or less, see instructions.
							</div>
							<div class="styGenericDiv" style="width:4mm;height:100%;padding-top:4mm;">
								<img alt="Curly Brace" src="{$ImagePath}/CurlyBrace1.77x22.97mm.png" style="width:1.77mm;height:22.97mm;"/>
							</div>
							<div class="styGenericDiv" style="width:8mm;">
								<div class="styLNRightNumBox" style="border-width:0px;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBox">5</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;"/>
							</div>
							<div class="styGenericDiv" style="width:32.2mm">
								<div class="styLNAmountBoxNBB" style="border-width:0px;"/>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBox" style="padding-right:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040SJData/ThirdPYTxblFarmIncmDetail/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB" style="height:6mm;"/>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:100%;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Line 6 -->
						<div class="styGenericDiv" style="width:187mm;height:4mm;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="styLNDesc" style="width:97.8mm;padding-right:2mm;">
								<span style="float:left;">Divide the amount on <b>line 2a</b> by 3.0</span>
								<span class="styIRS1040SJDots">.........</span>
							</div>
							<div class="styLNRightNumBox">6</div>
							<div class="styLNAmountBox" style="padding-right:1px;width:32.2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/ThirdPYTxblFarmIncmDetail/AverageIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;border-bottom:1px solid lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 7 -->
						<div class="styGenericDiv" style="width:187mm;height:4mm;">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="styLNDesc" style="width:97.8mm;padding-right:2mm;">
								<span style="float:left;">Combine lines 5 and 6. If zero or less, enter -0-</span>
								<span class="styIRS1040SJDots">......</span>
							</div>
							<div class="styLNRightNumBox">7</div>
							<div class="styLNAmountBox" style="padding-right:1px;width:32.2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/ThirdPYTxblFarmIncmDetail/NetIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;border-bottom:1px solid lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 8 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="styLNDesc">
								<span style="float:left;">Figure the tax on the amount on line 7 using the <b>2016</b> tax rates (see instructions)</span>
								<span class="styIRS1040SJDots">.....</span>
							</div>
							<div class="styLNRightNumBox">8</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/ThirdPYTxblFarmIncmDetail/TaxTableAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 9 -->
						<div class="styGenericDiv" style="width:187mm;height:22mm;">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="styLNDesc" style="width:93.8mm;">
								If you used Schedule J to figure your tax for:<br/>
								&#8226; 2018, enter the amount from your 2018 Schedule J, line 15.<br/>
								&#8226; 2017 but not 2018, enter the amount from your 2017 Schedule J, <br/><span style="width:2.5mm;"/>line 3.
								<br/>Otherwise, enter the taxable income from your <b>2017</b> Form 1040, <br/>
								line 43; Form 1040A, line 27; Form 1040EZ, line 6; Form 1040-NR, <br/>
								line 41; or Form 1040-NR-EZ, line 14. If zero or less, see instructions.
							</div>
							<div class="styGenericDiv" style="width:4mm;height:100%;padding-top:2mm;">
								<img alt="Curly Brace" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" style="width:1.77mm;height:18.11mm;"/>
							</div>
							<div class="styGenericDiv" style="width:8mm;">
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBox">9</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;"/>
							</div>
							<div class="styGenericDiv" style="width:32.2mm">
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBox" style="padding-right:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040SJData/SecondPYTxblFarmIncmDetail/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB" style="height:6mm;"/>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:100%;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Line 10 -->
						<div class="styGenericDiv" style="width:187mm;height:4mm;">
							<div class="styLNLeftNumBox">10</div>
							<div class="styLNDesc" style="width:97.8mm;padding-right:2mm;">
								<span style="float:left;">Enter the amount from line 6</span>
								<span class="styIRS1040SJDots">...........</span>
							</div>
							<div class="styLNRightNumBox">10</div>
							<div class="styLNAmountBox" style="padding-right:1px;width:32.2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/ThirdPYTxblFarmIncmDetail/AverageIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;border-bottom:1px solid lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 11 -->
						<div class="styGenericDiv" style="width:187mm;height:4mm;">
							<div class="styLNLeftNumBox">11</div>
							<div class="styLNDesc" style="width:97.8mm;padding-right:2mm;">
								Combine lines 9 and 10. If less than zero, enter as a negative amount
							</div>
							<div class="styLNRightNumBox">11</div>
							<div class="styLNAmountBox" style="padding-right:1px;width:32.2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/SecondPYTxblFarmIncmDetail/NetIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;border-bottom:1px solid lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 12 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">12</div>
							<div class="styLNDesc">
								<span style="float:left;">Figure the tax on the amount on line 11 using the <b>2017</b> tax rates (see instructions)</span>
								<span class="styIRS1040SJDots">.....</span>
							</div>
							<div class="styLNRightNumBox">12</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/SecondPYTxblFarmIncmDetail/TaxTableAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 13 -->
						<div class="styGenericDiv" style="width:187mm;height:21mm;">
							<div class="styLNLeftNumBox">13</div>
							<div class="styLNDesc" style="width:97.8mm;padding-right:3mm;">
								If you used Schedule J to figure your tax for 2018, enter the amount<br/>
								from your 2018 Schedule J, line 3. Otherwise, enter the taxable income<br/>
								from your <b>2018</b> Form 1040, line 10; Form 1040-NR, line 41; or Form 1040-NR-EZ, line 14.
								If zero or less, see instructions
								<span class="styIRS1040SJDots">.....</span>
							</div>
							<div class="styGenericDiv" style="width:8mm;height:21mm;">
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;margin-top:2mm"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"/>
								<div class="styLNRightNumBox" style="">13</div>
							</div>
							<div class="styGenericDiv" style="width:32.2mm;height:21mm">
								<div class="styLNAmountBoxNBB" style="margin-top:2mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4mm"/>
								<div class="styLNAmountBox" style="padding-right:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040SJData/FirstPYTxblFarmIncmDetail/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:100%;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Line 14 -->
						<div class="styGenericDiv" style="width:187mm;height:4mm;">
							<div class="styLNLeftNumBox">14</div>
							<div class="styLNDesc" style="width:97.8mm;padding-right:2mm;">
								<span style="float:left;">Enter the amount from line 6</span>
								<span class="styIRS1040SJDots">...........</span>
							</div>
							<div class="styLNRightNumBox">14</div>
							<div class="styLNAmountBox" style="padding-right:1px;width:32.2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/ThirdPYTxblFarmIncmDetail/AverageIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;border-bottom:1px solid lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 15 -->
						<div class="styGenericDiv" style="width:187mm;height:4mm;">
							<div class="styLNLeftNumBox">15</div>
							<div class="styLNDesc" style="width:97.8mm;padding-right:2mm;">
								Combine lines 13 and 14. If less than zero, enter as a negative amount
							</div>
							<div class="styLNRightNumBox">15</div>
							<div class="styLNAmountBox" style="padding-right:1px;width:32.2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/FirstPYTxblFarmIncmDetail/NetIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;border-bottom:1px solid lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 16 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">16</div>
							<div class="styLNDesc">
								<span style="float:left;">Figure the tax on the amount on line 15 using the <b>2018</b> tax rates (see instructions)</span>
								<span class="styIRS1040SJDots">.....</span>
							</div>
							<div class="styLNRightNumBox">16</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/FirstPYTxblFarmIncmDetail/TaxTableAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 17 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">17</div>
							<div class="styLNDesc">
								<span style="float:left;">Add lines 4, 8, 12, and 16</span>
								<span class="styIRS1040SJDots">....................</span>
							</div>
							<div class="styLNRightNumBoxNBB">17</div>
							<div class="styLNAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/TotalTaxTableAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
							<span style="width:3mm;"/>
							Cat. No. 25513Y
						</div>
						<div style="float:right;">
							<span style="width:26px;"/>
							<span style="font-weight:bold;">Schedule J (Form 1040 or 1040-SR) 2019</span>
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Schedule J (Form 1040 or 1040-SR) 2019</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
					</div>
					<!-- END Page Header -->
					<div class="styTBB" style="width:187mm;">
						<!-- Line 18 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">18</div>
							<div class="styLNDesc">
								<span style="float:left;">Amount from line 17</span>
								<span class="styIRS1040SJDots">......................</span>
							</div>
							<div class="styLNRightNumBox">18</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/TotalTaxTableAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer line -->
						<div class="styGenericDiv" style="width:187mm">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 19 -->
						<div class="styGenericDiv" style="width:187mm;height:30mm;">
							<div class="styLNLeftNumBox">19</div>
							<div class="styLNDesc" style="width:93.8mm;">
								If you used Schedule J to figure your tax for:<br/>
								&#8226; 2018, enter the amount from your 2018 Schedule J, line 12.<br/>
								&#8226; 2017 but not 2018, enter the amount from your 2017 Schedule J, <br/>
								<span style="width:2mm;"/>line 16. <br/>
								&#8226; 2016 but not 2017 or 2018, enter the amount from your 2016 <br/> 
								<span style="width:2mm;"/>Schedule J, line 4.<br/>
								Otherwise, enter the tax from your <b>2016</b> Form 1040, line 44;* <br/>
								Form 1040A, line 28;* Form 1040EZ, line 10; Form 1040-NR, line <br/>
								42;* or Form 1040-NR-EZ, line 15.
							</div>
							<div class="styGenericDiv" style="width:4mm;height:100%;padding-top:4mm;">
								<img alt="Curly Brace" src="{$ImagePath}/CurlyBrace1.77x22.97mm.png" style="width:1.77mm;height:22.97mm;"/>
							</div>
							<div class="styGenericDiv" style="width:8mm;">
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBox">19</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;"/>
							</div>
							<div class="styGenericDiv" style="width:32.2mm">
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBox" style="padding-right:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040SJData/TentativeTax3rdPYRtnAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB" style="height:6mm;"/>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:100%;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Line 20 -->
						<div class="styGenericDiv" style="width:187mm;height:22mm;">
							<div class="styLNLeftNumBox">20</div>
							<div class="styLNDesc" style="width:93.8mm;">
								If you used Schedule J to figure your tax for:<br/>
								&#8226; 2018, enter the amount from your 2018 Schedule J, line 16.<br/>
								&#8226; 2017 but not 2018, enter the amount from your 2017 Schedule J, <br/>
								<span style="width:2mm;"/>line 4. <br/>
								Otherwise, enter the tax from your <b>2017</b> Form 1040, line 44;* <br/>
								Form 1040A, line 28;* Form 1040EZ, line 10; Form 1040-NR, line <br/>
								42;* or Form 1040-NR-EZ, line 15.
							</div>
							<div class="styGenericDiv" style="width:4mm;height:100%;padding-top:2mm;">
								<img alt="Curly Brace" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" style="width:1.77mm;height:18.11mm;"/>
							</div>
							<div class="styGenericDiv" style="width:8mm;">
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBox">20</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;"/>
							</div>
							<div class="styGenericDiv" style="width:32.2mm">
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBox" style="padding-right:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040SJData/TentativeTax2ndPYRtnAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBoxNBB" style="height:6mm;"/>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:100%;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Line 21 -->
						<div class="styGenericDiv" style="width:187mm;height:14mm">
							<div class="styLNLeftNumBox">21</div>
							<div class="styLNDesc" style="width:93.8mm;">
								If you used Schedule J to figure your tax for 2018, enter the amount <br/>
								from your 2018 Schedule J, line 4. Otherwise, enter the tax from <br/>
								your <b>2018</b> Form 1040, line 11;* Form 1040-NR, line 42;* or Form 1040-NR-EZ, line 15
								<span class="styIRS1040SJDots">..............</span>
							</div>
							<div class="styGenericDiv" style="width:4mm;height:100%;padding-top:4mm;"/>
							<div class="styGenericDiv" style="width:8mm;">
								<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
								<div class="styLNRightNumBox">21</div>
							</div>
							<div class="styGenericDiv" style="width:32.2mm">
								<div class="styLNAmountBoxNBB" style="height:6mm;"/>
								<div class="styLNAmountBoxNBB"/>
								<div class="styLNAmountBox" style="padding-right:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040SJData/TentativeTax1stPYRtnAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:100%;"/>
							<div class="styLNAmountBoxNBB" style="height:100%;"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Lines 19-21 Note -->
						<div class="styGenericDiv" style="width:187mm;height:8mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc">
								*<b>Only</b> include tax reported on this line that is imposed by section 1 of the Internal Revenue Code 
								(see instructions). <b>Do not</b> include alternative minimum tax from Form 1040A.
							</div>
							<div class="styLNRightNumBoxNBB" style="height:100%;width:8.3mm;border-right-width:1px;background-color:lightgrey;"/>
							<div class="styLNAmountboxNBB" style="height:100%;"/>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 22 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">22</div>
							<div class="styLNDesc">
								<span style="float:left;">Add lines 19 through 21</span>
								<span class="styIRS1040SJDots">.....................</span>
							</div>
							<div class="styLNRightNumBox">22</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/GrossFarmIncomeTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Line -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 23 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">23</div>
							<div class="styLNDesc" style="">
								<b>Tax.</b> Subtract line 22 from line 18. Also include this amount on Form 1040 or 1040-SR,<br/> line 12a,
								 or Form 1040-NR, line 42</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">23</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040SJData/AverageFarmIncomeTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;height:14mm;">
							<div class="styLNDesc" style="width:146mm;padding-left:1px;">
								<br/>
								<b>Caution.</b> Your tax may be less if you figure it using the 2019 Tax Table, Tax Computation Worksheet, <br/>
								Qualified Dividends and Capital Gain Tax Worksheet, or Schedule D Tax Worksheet. Attach Schedule J <br/>
								only if you are using it to figure your tax.
							</div>
							<div class="styShadingCell" style="width:40mm;height:100%;"/>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1 solid black;border-top-width1px;">
						<div style="float:right;">
							<span style="width:80px;"/>
							<span style="font-weight:bold">Schedule J (Form 1040 or 1040-SR) 2019</span>
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1040SJData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>