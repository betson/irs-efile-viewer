<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Andrew Werner on 8/18/2011 -->
<!-- Last Modified by Eugenia McDonald on 01/06/2021 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleSEStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1040ScheduleSEData" select="$RtnDoc/IRS1040ScheduleSE"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040ScheduleSEData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching  -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1040 Schedule SE"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040ScheduleSEStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1040 Schedule SE" style="font-size:7pt;">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width:187mm;height:18.2mm;border-bottom-width:1px">
						<div class="styFNBox" style="width:29mm;height:18.2mm;">
							<div style="height:12mm;font-size:12px;font-weight:bold;">
								SCHEDULE SE<br/>
								(Form 1040)
								<span style="width:1mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData"/>
								</xsl:call-template>
						</div>
							<div style="height:8mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service <span style="width:.5mm"/> (99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:129mm;height:18.2mm;">
							<div class="styMainTitle" style="height:7mm;padding-top:1.5mm;">
								Self-Employment Tax
							</div>
							<div class="styFST" style="width: 126mm; height: 5mm; padding-top: 2mm; font-size: 6.5pt;">
								<img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
								    Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/ScheduleSE" title="Link to IRS.gov"><i>www.irs.gov/ScheduleSE</i></a> for instructions and the latest information.<br/>
							</div>
							<div class="styFST" style="width: 126mm; height: 5mm; padding-top: 1.5mm; font-size: 6.5pt;">	
								<img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
								    Attach to Form 1040, 1040-SR, or 1040-NR. 																
							</div>
						</div>
						<div class="styTYBox" style="width: 29mm; height: 18.2mm;">
							<div class="styOMB" style="height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
								20<span class="stytycolor">20</span>
							</div>
							<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
								Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">17</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styBB" style="width: 109mm; height: 7mm; border-bottom-width: 0px;">
							<div class="styNameBox" style="width: 109mm; height: 3mm; padding-top: 0.5mm; font-size: 6.0pt; font-weight: normal;">
								Name of person with self-employment income (as shown on Form 1040, 1040-SR, or 1040-NR)<br/>
							</div>
							<div class="styNameBox" style="width: 109mm; height: 4mm; padding-top:.3mm; padding-left:1mm;font-size: 7pt;">
								<xsl:choose>
									<xsl:when test="normalize-space($Form1040ScheduleSEData/PersonNm) !=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/PersonNm"/>
										</xsl:call-template>	
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
										</xsl:call-template>	
									</xsl:otherwise>		
								</xsl:choose>
							</div>
						</div>
						<div class="styEINBox" style="width: 46mm; height: 7mm; text-align:center;padding-top:.5mm; font-size:7pt; font-weight: normal;
						    border-right-width: 1px; border-bottom-width: 0px;">
							Social security number of person<br/> with <b>self-employment </b>income
							<img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
						</div>
						<div class="styLNAmountBox" style="width: 29mm; height: 7mm; text-align: center; padding-top:3.5mm; border-bottom-width: 0px;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form1040ScheduleSEData/SSN) !=''">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>	
								</xsl:otherwise>		
							</xsl:choose>
						</div>
					</div>

					<!-- Part I  -->
					<div class="styBB" style="width:187mm;">
						<span class="styPartName" style="width:16mm;">Part I</span>
						<!--Part I-->
						<span style="width:150mm;" class="styPartDesc">Self-Employment Tax</span>
					</div>
					<!-- End Part I  -->
					<div style="width:187mm; clear: left; float: left;">
						<b>Note:</b> If your only income subject to self-employment tax is <b>church employee income,
						</b> see instructions for how to report your income and the definition of church employee income. 
					</div>
					<!-- SB-Line A -->
					<div style="width: 187mm; height: 8mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:8mm; padding-left:0;">
							A
						</div>
						<div class="styLNDesc" style="width:168mm; height:8mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ExemptForm4361Ind"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleSE</xsl:with-param>
								</xsl:call-template>
								If you are a minister, member of a religious order, or Christian Science practitioner <b>and</b> you filed Form 4361, but you<br/> 
								had $400 or more of <b>other</b> net earnings from self-employment, check here and continue with Part I
							</label>
							<!--Dotted Line-->
							<span style="width:.5mm;"/>
							<span style=" letter-spacing:2.7mm; font-weight:bold;">...........</span>
						</div>
						<div style="height: 7mm; width: 10mm; padding-top: 3mm;">
							<img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
							<span style="width:2mm;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ExemptForm4361Ind"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleSE</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div style="width: 187mm; clear: left; float: left;">
                     Skip lines 1a and 1b if you use the farm optional method in Part II. See instructions.</div>					
<!--End of line SB-1 -->
					<!-- SB-Line 1a -->
					<div style="width: 187mm; height: 7mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">1a</div>
						<div class="styLNDesc" style="width:139mm;height:7mm;">
							Net farm profit or (loss) from Schedule F, line 34, and farm partnerships, Schedule K-1 (Form 1065), <br/>
							<span style="float:left;">box 14, code A. </span>
						   <!--Dotted Line-->
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing: 3mm; float: right; padding-right: 0mm;">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height: 7mm; padding-top: 3mm; border-top-width: 1px;">
							1a</div>
						<div class="styLNAmountBox" style="height: 7mm; text-align: right; padding-top: 3mm; padding-right: 1mm; border-top-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/NetFarmProfitLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line SB-1 -->
					<!-- Line 1b -->
					<div style="width: 187mm; height: 10mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:10mm; padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:139mm; height:10mm;">
							If you received social security retirement or disability benefits, enter the amount of Conservation<br/>Reserve
							Program payments included on Schedule F, line 4b, or listed on Schedule K-1 (Form 1065),<br/>
							<span style="float:left;">box 20, code AH</span>
							<!--Dotted Line-->
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing: 3mm; float: right; padding-right: 0mm;">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:3.5mm;"><br/>1b</div>
						<div class="styLNAmountBox" style="height: 10mm; text-align: right; padding-top: 3.5mm; padding-right: 1mm;"><br/>
							<span style="font-size:6pt">(</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ConservationReserveProgPymtAmt"/>
							</xsl:call-template>
							<span style="font-size:6pt">)</span>
						</div>
					</div>
								
					<!--End of line 1 -->
					<!-- Line SB-2 -->		
					<div style="width: 187mm; height: 4mm; clear: left; float: left;">			
					<div class="styLNDesc" style="width: 147mm; height: 4mm;">
					Skip line 2 if you use the nonfarm optional method in Part II. See instructions.	
					</div>
				
					<div class="styLNRightNumBox" style="height: 4mm; border-bottom-width: 0px;"></div>
					<div class="styLNAmountBox" style="height: 4mm; border-bottom-width: 0px;">
					</div>
					</div>	
					<div style="width: 187mm; height: 7mm; clear: left; float: left;">

						<div class="styLNLeftNumBoxSD" style="height:7mm;">2</div>
						<div class="styLNDesc" style="width: 139mm; height: 7mm;">
						Net profit or (loss) from Schedule C, line 31; and Schedule K-1 (Form 1065), box 14, code A (other than 
						farming). See instructions for other income to report or if you are a minister or member of a religious order.
						</div> 
						<div class="styLNRightNumBox" style="height: 7mm; padding-top: 3mm; border-bottom-width: 1px;">2</div>
						<div class="styLNAmountBox" style="height: 7mm; text-align: right; padding-top: 3mm; padding-right: 1mm; border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/NetNonFarmProfitLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line SB-2 -->
					<!--Line SB-3 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">
								Combine lines 1a, 1b, and 2 
								
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Self Employment Tax Exempt Cd </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Self Employment Tax Exempt Amt </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Chapter 11 Bankruptcy Income Cd </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Chapter 11 Bankruptcy Income Amt </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Community Income Taxed To Spouse Cd </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Community Income Taxed To Spouse Amt </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Exempt Community Income Cd </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Exempt Community Income Amt </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Additional Income Or Loss Cd</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Additional Income Or Loss Amt </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
								</xsl:call-template>
							</span>
							<span class="styIRS1040ScheduleSEDotLn" style=" letter-spacing:3.2mm; font-weight:bold; float: right; 
							    padding-right: 0mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">3</div>
						<div class="styLNAmountBox" style="height:4.4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-3 -->
					<!--Line SB-4a -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="styLNDesc" style="width:139mm;">
							If line 3 is more than zero, multiply line 3 by 92.35% (0.9235). Otherwise, enter amount from line 3
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3.2mm; font-weight:bold; float: right; padding-right: 0mm;">...</span>
						</div>
						<div class="styLNRightNumBox">4a</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/MinimumProfitForSETaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-4a -->
					<!--Line SB-4b -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:139mm;font-family:Arial;">
							<b>Note:</b> If line 4a is less than $400 due to Conservation Reserve Program payments on line 1b, see instructions.
               			</div>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">If you elect one or both of the optional methods, enter the total of lines 15 and 17 here</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3.2mm; font-weight:bold; float: right; 
							    padding-right: 0mm;">.......</span>
						</div>
						<div class="styLNRightNumBox">4b</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/OptionalMethodAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-4B -->
					<!--Line SB-4c -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:7.2mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:139mm;height:7.2mm;">
							Combine lines 4a and 4b. If less than $400, <b>stop;</b> you don't owe self-employment tax.<br/>
							<span style="float:left;"><b>Exception: </b>If less than $400 and you had <b>church employee income,</b>
							 enter -0- and continue</span>
							<!--Dotted Line-->
							  <div style="float: right; padding-right: 1.5mm;">
								  <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
								  <span style=" letter-spacing:3mm; font-weight:bold; float: left;">....</span>
							  </div>
							  </div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br/>4c</div>
						<div class="styLNAmountBox" style="height:7.2mm; padding-right:1mm;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/CombinedSEAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-4C -->
					<!-- Line SB5a -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:7.4mm;">5a </div>
						<div class="styLNDesc" style="width:99mm;height:7.4mm;">
							Enter your <b>church employee income</b> from Form W-2. See <br/>
							<span style="float:left;">instructions for definition of church employee income</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right;
							   padding-right: 1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br/>5a</div>
						<div class="styLNAmountBox" style="height:7.4mm;padding-right:1px;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/W2WagesFromChurchesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.6mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.6mm;"/>
					</div>
					<!-- End LineSB 5a -->
					<!--Line SB-5b -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Multiply line 5a by 92.35% (0.9235). If less than $100, enter -0-</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							   padding-right: 1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox">5b</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/MinAllowableChurchWagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-5B -->
					<!--Line SB-6 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Add lines 4c and 5b</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right;
							    padding-right: 1mm;">.............................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/CombinedSEAndChurchWagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-6 -->
					<!-- Line SB7 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:7.4mm;">7</div>
						<div class="styLNDesc" style="width:139mm;height:7.4mm;">
							Maximum amount of combined wages and self-employment earnings subject to social security <br/>
							<span style="float:left;">tax or the 6.2% portion of the 7.65% railroad retirement (tier 1) tax for 2020</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br/>7</div>
						<div class="styLNAmountBox" style="text-align:right;height:7.4mm;padding-right:1mm;"><br/>
							$137,700
						</div>
					</div>
					<!--End of line SB7 -->
					<!-- Line SB8a -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:11mm;">8a</div>
						<div class="styLNDesc" style="width:99mm;height:11mm;">
							Total social security wages and tips (total of boxes 3 and 7 on Form(s) W-2) <br/> 
                            and railroad retirement (tier 1) compensation. If $137,700 or more, skip<br/>
							 lines 8b through 10, and go to line 11<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm;
                             font-weight:bold; float: right; padding-right: 1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;"><br/><br/>8a</div>
						<div class="styLNAmountBox" style="height:11mm;padding-right:1px;"><br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SSTWagesRRTCompAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:11mm;"/>
					</div>
					<!-- End LineSB 8a -->
					<!-- Line SB8b -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b </div>
						<div class="styLNDesc" style="width:99mm;">
							Unreported tips subject to social security tax from Form 4137, line 10
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right;
							    padding-right: 1mm;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">8b </div>
						<div class="styLNAmountBox" style="padding-right:1px; height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/UnreportedTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- End LineSB 8b -->
					<!-- Line SB8c -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding-left:4mm">c</div>
						<div class="styLNDesc" style="width:99mm;">
							<span style="float:left;">Wages subject to social security tax from Form 8919, line 10</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox">8c</div>
						<div class="styLNAmountBox" style="padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/WagesSubjectToSSTAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- End LineSB 8c -->
					<!--Line SB-8d -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Add lines 8a, 8b, and 8c</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							  padding-right: 1mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox">8d</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/TotalWagesAndUnreportedTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-8d -->
					<!--Line SB-9 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left">Subtract line 8d from line 7. If zero or less, enter -0- here and on line 10 and go to line 11</span>
							<img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet" style="float:right;margin-right:1px; 
							    padding-top: 0.75mm;padding-right: 1.25mm;"/>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/AllowableSEAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-9 -->
					<!--Line SB-10 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Multiply the <b>smaller </b>of line 6 or line 9 by 12.4% (0.124)</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/TaxBaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-10 -->
					<!--Line SB-11 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Multiply line 6 by 2.9% (0.029)</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SEBaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-11 -->
					<!--Line SB-12 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="height:4mm">12</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<b>Self-employment tax.</b> Add lines 10 and 11. Enter here and on
							<b>Schedule 2 (Form 1040), line 4.</b> 
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							  padding-right:1mm ">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">12</div>
						<div class="styLNAmountBox" style="padding-right:1mm;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SelfEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-12 -->
					<!--Line SB13 -->
					<div style="width:187mm; clear: left; float: left; padding-bottom:0px;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:139mm;padding-bottom:0px;">
							<b>Deduction for one-half of self-employment tax.</b>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;background-color:lightgrey;border-left-width:0px;height:4mm;"/>
					</div>
					<div style="width:187mm; border-bottom:solid black 1px; padding-top:0px; clear: left; float: left; ">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:99mm;padding-top:0px;height:4mm;">
							Multiply line 12 by 50% (0.50). Enter here and on <b>Schedule 1 </b>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border:0px;"/>
						<div class="styLNAmountBoxNBB" style="padding-right:1px;height:4mm;border:0px;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;background-color:lightgrey;border-left-width:0px;height:4mm;"/>
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:99mm;padding-top:0px;height:4mm">
							<span style="float:left;"><b>(Form 1040), line 14.</b> </span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right;
							    padding-right: 1mm;">................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;">13</div>
						<div class="styLNAmountBoxNBB" style="padding-right:1px;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/DeductibleSelfEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;background-color:lightgrey;border-left-width:0px;height:4mm;"/>
					</div>
					<!--End of lineSB- 13 -->
					<div class="styBB" style="width:187mm;border-top-width:0px;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="font-weight:normal;"><b>Optional Methods To Figure Net Earnings </b>(see instructions)</div>
					</div>
					<!-- End Part II  -->
					<!--Line SB-14-1 -->
					<div class="styBB" style="width:187mm;height:16.8mm">
						<!-- Line SB7 -->
						<div style="width:187mm;">
							<div class="styGenericDiv" style="padding-left:0.5mm;width:146.97mm;height:6mm;">
								<b>Farm Optional Method.</b> You may use this method <b>only</b> if <b>(a)</b> 
									your gross farm income<span style="font-size:5pt;">
									<sup>1</sup>
								</span>
								wasn't more than $8,460, <b>or (b)</b> your net farm profits<span style="font-size:5pt;">
									<sup>2</sup>
								</span> were less than $6,107.
							</div>
							<div class="styLNRightNumBoxNBB" style="height:6mm;padding-top:4mm;background-color:lightgrey;border-left:1px solid black;"/>
							<div class="styLNAmountBoxNBB" style="text-align:center;height:6mm;padding-top:4mm;"/>
						</div>
						<!--End of line SB14-1 -->
						<!--Line SB-14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">14</div>
							<div class="styLNDesc" style="width:138.97mm;">
								<span style="float:left;">Maximum income for optional methods. </span>
								<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
								    padding-right: 1mm;">....................</span>
							</div>
							<div class="styLNRightNumBox">14</div>
							<div class="styLNAmountBox" style="padding-right:1mm;">
								$5,640
							</div>
						</div>
						<!--End of lineSB-14 -->
						<!--Line SB-15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:6.5mm;padding-bottom:.1mm;">15</div>
							<div class="styLNDesc" style="width:138.97mm;height:6.5mm;padding-top:0mm; padding-bottom:.1mm">
								Enter the <b>smaller</b> of: two-thirds (<sup style="font-size:6pt;">2</sup>/<span style="font-size:5pt;">3</span>)
								of gross farm income<sup style="font-size:6pt;">1</sup> (not less than zero) <b>or</b> $5,640. Also <br/>
								<span style="float:left;">include this amount on line 4b above</span>
								<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
								    padding-right: 1mm;">....................</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:6.5mm;padding-bottom:.1mm"><br/>15</div>
							<div class="styLNAmountBoxNBB" style="height:6.5mm;padding-right:1mm;padding-bottom:.1mm"><br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETaxFarmOptionalMethodAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End of lineSB-15 -->
					<!--Line SB-16-1 -->
					<div style="width:187mm;clear: left; float: left;">
						<!-- Line SB7 -->
						<div class="styLNDesc" style="width:146.97mm;height:12mm;">
							<b>Nonfarm Optional Method.</b> You may use this method <b>only </b> if <b>(a)</b> 
							your net nonfarm profits<span style="font-size:5pt;padding-bottom:1mm">
								<sup>3</sup>
							</span> 
							were less than $6,107 <br/>
							and also less than 72.189% of your gross nonfarm income,<span style="font-size:5pt;padding-bottom:1mm">
								<sup>4</sup> 
							</span>
							<b> and (b) </b> you had net earnings from self-employment<br/> of at least $400 in 2 of the prior 3 years. 
							<b>Caution:</b> You may use this method no more than five times.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:12mm;background-color:lightgrey;border-left:1px solid black;"/>
						<div class="styLNAmountBoxNBB" style="height:12mm;"/>
					</div>
					<!--End of line SB16-1 -->
					<!--Line SB-16 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:138.97mm;">
							<span style="float:left;">Subtract line 15 from line 14</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETaxNonFarmOptionalBaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-16 -->
					<!--Line SB-17 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="height:7mm;padding-top:1mm">17</div>
						<div class="styLNDesc" style="width:138.97mm;height:7mm;padding-bottom:.1mm">
							Enter the <b>smaller </b>of: two-thirds (<sup style="font-size:6pt;">2</sup>/<span style="font-size:5pt;">3</span>
							) of gross nonfarm income<sup style="font-size:6pt;">4</sup> (not less than zero) <b>or</b> the <br/>
							<span style="float:left;">amount on line 16. Also include this amount on line 4b above</span>
								<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
								padding-right: 1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-bottom:.1mm"><br/>17</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:1mm;padding-bottom:.1mm"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETaxNonFarmOptionalMethodAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-17 -->
					<!--Line 18-->
					<div class="styBB" style="width:187mm; clear: left:float:left;">
						<div class="styLNDesc" style="width:90mm;height:14mm;">
							<sup>1</sup>From Sch. F, line 9, and Sch. K-1 (Form 1065), box 14, code B.
							<br/>
							<sup>2</sup>From Sch. F, line 34, and Sch. K-1 (Form 1065), box 14,<br/>
							<span style="padding-left:1mm"> code A - minus the amount you would have entered on line </span>
							<br/>
							<span style="padding-left:1mm">1b had you not used the optional method.</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:96mm;height:14mm;text-align:left;">
							<span style="padding-left:2mm;">
								<sup>3</sup>From Sch. C, line 31; and Sch. K-1 (Form 1065), box 14,<br/>
								<span style="padding-left:1.1mm"> code A.</span>
							</span>
							<br/>
							<span style="padding-left:2mm;">
								<sup>4</sup>From Sch. C, line 7; and Sch. K-1 (Form 1065), box 14,<br/>
								<span style="padding-left:1.1mm">code C.</span>
							</span>
						</div>
						<!--  FOOTER-->
					</div>
					<div class="styGenericDiv" style="float:right; height:40mm">
						<span class="styBoldText">Schedule SE (Form 1040) 2020</span>
						<p class="pageend"/>
					</div>
					<!--End of line 18 -->
					
					<!-- End Part III  -->
					<!-- BEGIN Page Header -->
					  <div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
						  Schedule SE (Form 1040) 2020 <span style="width:50mm"/> Attachment Sequence No. <b>17</b>
						</div>
						<div style="float:right;">
						  Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					  </div>
					  <!-- END Page Header -->	
								<div class="styBB" style="width:187mm; ">
						<span class="styPartName" style="width:16mm;">Part III</span>
						<!--Part I-->
						<span style="width:150mm;" class="styPartDesc">Maximum Deferral of Self-Employment Tax Payments</span>
					</div>
					<!-- End Part III  -->	
					<!--Line 18 -->
					<div style="width: 187mm; height: 4mm; clear: left; float: left;">			
					<div class="styLNDesc" style="width: 147mm; height: 4mm;">
					If line 4c is zero, skip lines 18 through 20, and enter -0- on line 21.	
					</div>
				
					<div class="styLNRightNumBox" style="height: 4mm; border-bottom-width: 0px;"></div>
					<div class="styLNAmountBox" style="height: 4mm; border-bottom-width: 0px;">
					</div>
					</div>
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the portion of line 3 that can be attributed to March 27, 2020, through December 31, 2020</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">...</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/PrtnSETotNetEarningsOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line 18 -->
					<!--Line 19 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">If line 18 is more than zero, multiply line 18 by 92.35% (0.9235); otherwise, enter the amount from line
18</span>

						</div>
						<div class="styLNRightNumBox">19</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/PrtnMinimumProfitForSETaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line 19 -->

					<!--Line 20 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the portion of lines 15 and 17 that can be attributed to March 27, 2020, through December 31,
2020</span>

						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/PortionOptionalMethodAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line 20 -->
					<!--Line 21 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Combine lines 19 and 20.</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox">21</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/PortionCombinedSEAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line 21 -->
					<!--Line 22 -->
										<div style="width: 187mm; height: 4mm; clear: left; float: left;">			
					<div class="styLNDesc" style="width: 147mm; height: 4mm;">
					If line 5b is zero, skip line 22 and enter -0- on line 23.
					</div>
				
					<div class="styLNRightNumBox" style="height: 4mm; border-bottom-width: 0px;"></div>
					<div class="styLNAmountBox" style="height: 4mm; border-bottom-width: 0px;">
					</div>
					</div>
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the portion of line 5a that can be attributed to March 27, 2020, through December 31, 2020</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">...</span>
						</div>
						<div class="styLNRightNumBox">22</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/PrtnW2WagesFromChurchesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line 22 -->
					<!--Line 23 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Multiply line 22 by 92.35% (0.9235).</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox">23</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/PrtnMinAllowableChurchWagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line 23 -->
					<!--Line 24 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Add lines 21 and 23</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox">24</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/PrtnCombSEAndChurchWagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line 24 -->
					<!--Line 25 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the smaller of line 9 or line 24</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox">25</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SEMaximumAllowableAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line 25 -->
					<!--Line 26 -->
					<div style="width:187mm; clear: left; float: left; border-bottom: black 1px solid">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Multiply line 25 by 6.2% (0.062). Enter here and see the instructions for line 12e of Schedule 3 (Form
1040)</span>
							
						</div>
						<div class="styLNRightNumBox" style="border-bottom:0;">26</div>
						<div class="styLNAmountBox" style="padding-right:1mm; border-bottom:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETaxPaymentsMaxDeferredAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line 26-->

					<!--  FOOTER-->	
					<div class="styGenericDiv" style="float:right; height:40mm">
						<span class="styBoldText">Schedule SE (Form 1040) 2020</span>
						<p class="pageend"/>
					</div>			
					
					
					
					
					
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl" style="clear: left; float: left;">
						<xsl:variable name="leftWidth" select="105"/>
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Section A, Line 3 - Additional Income Or Loss Amt </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template> 
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A, Line 3 - Self Employment Tax Exempt Cd </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
					    </xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Section A, Line 3 - Self Employment Tax Exempt Amt </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
                        </xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A, Line 3 - Additional Income Or Loss Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Section A, Line 3 - Community Income Taxed To Spouse Amt </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A, Line 3 - Chapter 11 Bankruptcy Income Cd </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A, Line 3 - Community Income Taxed To Spouse Cd </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A, Line 3 - Exempt Community Income Cd </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Section A, Line 3 - Chapter 11 Bankruptcy Income Amt </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Section A, Line 3 - Exempt Community Income Amt </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Self Employment Tax Exempt Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Self Employment Tax Exempt Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Chapter 11 Bankruptcy Income Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Chapter 11 Bankruptcy Income Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Community Income Taxed To Spouse Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Community Income Taxed To Spouse Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Exempt Community Income Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Exempt Community Income Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Additional Income Or Loss Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Additional Income Or Loss Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
