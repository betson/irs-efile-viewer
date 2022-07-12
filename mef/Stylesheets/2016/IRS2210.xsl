<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS2210Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form2210Data" select="$RtnDoc/IRS2210"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form2210Data)"/>
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
				<meta name="Description" content="IRS Form 2210"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS2210Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form2210">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:22mm;padding:bottom:0mm;">
                         Form<span style="width:1mm;"/>
							<span class="styFormNumber">2210</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form2210Data"/>
							</xsl:call-template><br/>
							<div class="styAgency" style="padding-top:3.5mm;height:8mm;padding:bottom:0mm;">Department of the Treasury<br/>
						Internal Revenue Service 
                            </div>
						</div>
						<div class="styFTBox" style="width:125mm;height:22mm;">
							<div class="styMainTitle" style="height:10mm;padding:bottom:0mm;">Underpayment of Estimated Tax by<br/> Individuals, Estates, and Trusts</div>
							<div class="styFBT" stype="font-size:7pt;height:10mm;padding-top:1mm;">
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> Information about Form 2210 and its separate instructions is at <i>www.irs.gov/form2210.</i>
								<br/>
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040, 1040A, 1040NR, 1040NR-EZ, or 1041.</div>
						</div>
						<div class="styTYBox" style="width:31mm; height:22mm">
							<div class="styOMB">OMB No. 1545-0074</div>
							<div>
								<span class="styTaxYear" style="font-size:21pt;">20</span>
								<span class="styTYColor" style="font-family: 'Arial Narrow';font-size:21pt">
									<b>16</b>
								</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">06</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
				<div class="styBB" style="width:187mm;">
					<div class="styFNBox" style="width:140mm;height:9mm;">
                    Name(s) shown on tax return<br/>
                    <!-- 1040x Return Header Attached -->
                    <xsl:if test="$RtnHdrData/Filer/NameLine1Txt">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/NameLine1Txt"/> 
							</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/Filer/NameLine2Txt">
						    <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/NameLine2Txt"/>
							</xsl:call-template>
					</xsl:if>
<!--               This code was added per KISAM #IM02790903 however the KISAM was due to missing requirements and the code should not have been updated and  
                    delivered. The following code is commented out until WR requirements are received for R10.1 to add this functionality when 2210 is attached to a 1041  
                    return		-->
					<!-- If 1041 Return Header Attached -->		
<!--					<xsl:if test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
							</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
							</xsl:call-template>
					</xsl:if>-->
				</div>
					<!-- Identifying Number -->
				<div style="padding-left:1mm;"/>
					<b> Identifying number</b><br/>
						<span style="padding-left:2mm;">
						<!-- 1040 Return Header Attached -->
						<xsl:if test="$RtnHdrData/Filer/PrimarySSN">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
						</xsl:if>
						<xsl:if test="$RtnHdrData/Filer/SpouseSSN">
							    <br/>
								<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/SpouseSSN"/>
								</xsl:call-template>
						</xsl:if>
<!--               This code was added per KISAM #IM02790903 however the KISAM was due to missing requirements and the code should not have been updated and  
                    delivered. The following code is commented out until WR requirements are received for R10.1 to add this functionality when 2210 is attached to a 1041  
                    return		-->
<!--						<xsl:if test="$RtnHdrData/Filer/EIN">
							    <br/>
								<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/EIN"/>
								</xsl:call-template>
						</xsl:if>-->
						</span >
				</div>
						<!--  start instructions -->
	<div style="width:187mm;height:92mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px; padding bottom:1mm;float:left;">
						<div>
			<span class="styBoldText" style="font-size:16px; width:187mm; height:7mm; padding-top:0mm;text-align:center;">Do You Have To File Form 2210?
                            </span>
						</div>
			<div style="width:187mm;height:8mm;">
			<span class="styIRS2210Box" style="width:90mm;height:8mm;text-align:center;padding-top:2mm;">Complete lines 1 through 7 below.  Is line 7 less than $1,000?</span>
						    <img src="{$ImagePath}/2210_Yes_right_Bullet.gif" alt="MediumBullet" align="middle"/>
							<span class="styIRS2210Box" style="width:70mm;height:8mm;text-align:center;padding-top:1mm;"><b>Do not file Form 2210.</b>  You do not owe a penalty.</span>
						</div>
	<div style="width:187mm;">
							<span style="width:30mm;height:4mm;"/>
							<span class="styIRS2210Border" style="width:15mm;height:4mm; padding-left:1mm;  padding-top:1mm; border-left-width:1px;">
								<b> No</b>
							</span>
						</div>
						<div>
							<span style="width:28.8mm;height:1mm;padding-top:0mm;"/>
							<img src="{$ImagePath}/2210_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/>
						</div>
		<div style="width:187mm;height:13mm;">
		<span class="styIRS2210Box" style="width:90mm;height:13mm;text-align:left;padding-top:4mm;">
		<span style= "width:4mm;"></span>Complete lines 8 and 9 below. Is line 6 equal to or more<br/>
		<span style= "width:4mm;"></span>than line 9?</span>
							<img src="{$ImagePath}/2210_Yes_right_Bullet.gif" alt="MediumBullet" align="middle"/>
							<span class="styIRS2210Box" style="width:75mm;height:14mm;text-align:left;padding-top:0mm;">
							<span style= "width:2mm;"></span>You do not owe a penalty. <b>Do not file Form 2210</b><br/>
							<span style= "width:2mm;"></span>(but if box <b>E</b> in Part II applies, you must file page 1 <br/>
							<span style= "width:2mm;"></span>of Form 2210).</span>
						</div>
						<div style="width:187mm;">
							<span style="width:30mm;height:4mm;"/>
							<span class="styIRS2210Border" style="width:15mm;height:4mm; padding-left:1mm;padding-top:1mm; border-left-width:1px;">
								<b> No</b>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="width:28.8mm;height:1mm;padding-top:0mm;"/>
							<img src="{$ImagePath}/2210_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/>
						</div>
						<div style="width:187mm;height:12mm;">
							<span class="styIRS2210Box" style="width:90mm;height:12mm;text-align:center;padding-top:5mm;">You may owe a penalty. Does any box in Part II below apply?</span>
							<img src="{$ImagePath}/2210_Yes_right_Bullet.gif" alt="MediumBullet" align="middle"/>
							<span class="styIRS2210Box" style="width:70mm;min-height:11.5mm;text-align:left;padding-top:1mm;">	
							<span style= "width:2mm;"></span>You <b>must </b>file Form 2210. Does box <b>B, C,</b> or <b>D</b> in<br/>
						   <span style= "width:2mm;"></span>Part II apply?</span>
						</div>
						<div style="width:187mm;height:14mm;padding-top:1mm;">
                             <span style=" width:28.8mm;padding-top:0mm;"/>
                            <img src="{$ImagePath}/2210_No_Down_Bullet.gif" alt="No Down Bullet" align="top"/>
							<span style="width:76.2mm;padding-top:0mm;"/>
							<img src="{$ImagePath}/2210_No_Down_Bullet.gif" alt="No Down Bullet" align="top"/>
							<span style="width:6mm;height:8mm;padding-top:0mm;"/>
							<img src="{$ImagePath}/2210_Yes_Bullet.gif" alt="Yes Bullet" align="top"/>
							<span class="styIRS2210Box" style="width:40mm;height:7mm;text-align:left;padding-top:2mm;padding-left:1mm;">You must figure your penalty.</span>
						</div>
						<div style="width:187mm;padding-bottom:0mm;">
							<span class="styIRS2210Box" style="width:80mm;text-align:left;padding-top:1mm;">
								<span style= "width:1mm;"></span><b>Do not file Form 2210.</b> You are not required to figure<br/>
								<span style= "width:2mm;"></span>your penalty because the IRS will figure it and send<br/>
								<span style= "width:2mm;"></span>you a bill for any unpaid amount.  If you want to figure<br/>
								<span style= "width:2mm;"></span>it, you may use Part lll or Part lV as a worksheet and <br/>
								<span style= "width:2mm;"></span>enter your penalty amount on your tax return, but <b>do <br/>
								<span style= "width:2mm;"></span>not file Form 2210.</b>
							</span>
							<span style=" width:20mm;height:15mm;padding-top:1mm;"/>
							<span class="styIRS2210Box" style="width:75mm;text-align:left;padding-top:1mm;">
							<span style= "width:2mm;"></span>You are <b>not</b> required to figure your penalty because <br/>
							<span style= "width:2mm;"></span>the IRS will figure it and send you a bill for any unpaid<br/>
							<span style= "width:2mm;"></span>amount.  If you want to figure it, you may use Part lll<br/>
							<span style= "width:2mm;"></span>or Part lV as a worksheet and enter your penalty<br/>
							<span style= "width:2mm;"></span>amount on your tax return, but <b>file only page 1 of<br/>
							<span style= "width:2mm;"></span>Form 2210.</b>
							</span>
						</div>
					</div>
					<!-- Part l -->
					<!-- Part I - Header -->
					<div style="width:187mm;height:auto;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;padding-top:0mm;">
						<span class="styPartName" style="height:4mm;width:12mm;font-size:13;">Part l</span>
						<span style="width:170mm;font-weight:normal;" class="styPartDesc">
							<span style="font-size:10pt;vertical-align:top;"/>
							<b>Required Annual Payment</b>
						</span>
					</div>
					<!-- End Part 1 Header -->
					<!-- Part 1 body -->
					<div style="width:187mm;height:auto;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<!-- Line 1 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">1
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Enter your 2016 tax after credits from Form 1040, line 56 (see instructions if not filing Form 1040)</span>
								<!--<span class="styIRS2210DotLn">...</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">1</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/CurrentYearTaxAfterCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">2
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Other taxes, including self-employment tax and, if applicable, Additional Medicare Tax and/or Net</span>
								<br/>
								<span style="float:left;">Investment Income Tax (see instructions)</span>
								<span class="styIRS2210DotLn">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-bottom:0mm;bottom-border-width:1px;padding-top:3mm;">2</div>
							<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-bottom:0mm;bottom-border-width:1px;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/OtherTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left: 2.25mm">3
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
							   Refundable credits, including the premium tax credit (see instructions)
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
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">3</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form2210Data/RefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">4
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
       Current year tax. Combine lines 1, 2, and 3. If less than $1,000, <b>stop;</b> you do not owe a penalty.
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									<b>Do not </b>file Form 2210
								</span>
								<span class="styIRS2210DotLn">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">4</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/CurrentYearTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">5
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.8mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Multiply line 4 by 90% (.90)</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">.............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm; width:7.1mm;">5
                            </div>
							<div class="styLNAmountBox" style="width:36.1mm;height:4mm;padding-bottom:0mm; border-buttom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/CurrentYearTaxCalculatedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4.5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">6
			</div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Withholding taxes. <b>Do not </b>include estimated tax payments  (see instructions)</span>
								<span class="styIRS2210DotLn">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">6</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/WithholdingTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">7
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Subtract line 6 from line 4. If less than $1,000, <b>stop;</b> you do not owe a penalty. <b>  Do not </b>file Form 2210
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">7</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/NetTaxDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">8
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Maximum required annual payment based on prior year's tax (see instructions)</span>
								<span class="styIRS2210DotLn">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">8</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualPaymentBasedOnPriorYrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">9
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									<b>Required annual payment.</b>  Enter the <b>smaller</b> of line 5 or line 8</span>
								<span class="styIRS2210DotLn">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">9</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/RequiredAnnualPaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<b>Next:</b>  Is line 9 more than line 6?
                            </div>
						</div>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form2210Data/OwePenaltyInd"/>
							</xsl:call-template>
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm;"/>
								<input type="checkbox" alt="alt" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2210Data/OwePenaltyInd"/>
										<xsl:with-param name="BackupName">IRS2210OwePenaltyInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form2210Data/OwePenaltyInd"/>
										<xsl:with-param name="BackupName">IRS2210OwePenaltyInd</xsl:with-param>
									</xsl:call-template>
									<b>No.  </b>
								</label>You <b>do not</b> owe a penalty.  <b>Do not</b> file Form 2210 unless box <b>E </b>below applies.
                        </div>
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
								<input type="checkbox" alt="alt" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2210Data/OwePenaltyInd"/>
										<xsl:with-param name="BackupName">IRS2210OwePenaltyInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form2210Data/OwePenaltyInd"/>
										<xsl:with-param name="BackupName">IRS2210OwePenaltyInd</xsl:with-param>
									</xsl:call-template>
									<b>Yes.  </b>
								</label>You may owe a penalty, but <b>do not</b> file Form 2210 unless one or more boxes in Part ll below applies.
                        </div>
						</span>
						<div>
							<span style="width:12.8mm;"/>
							<img src="{$ImagePath}/2210_Bullet_Round.gif" alt="RoundBullet"/>
							If box <b>B, C, </b>or <b>D</b> applies, you must figure your penalty and file Form 2210.
						</div>
						<div>
							<span style="width:12.8mm;"/>
							<img src="{$ImagePath}/2210_Bullet_Round.gif" alt="RoundBullet"/>
							If box <b>A</b> or <b>E</b> applies (but not  <b>B, C,</b> or <b>D</b>) file only page 1 of Form 2210. You are <b> not </b> required to figure your penalty; the IRS
						</div>
						<div>
							<span style="width:12.8mm;"/>
							<span>will figure it and send you a bill for any unpaid amount.  If you want to figure your penalty, you may use Part lll or lV as
                            </span>
						</div>
						<div>
							<span style="width:12.8mm;"/>
							<span>a worksheet and enter your penalty on your tax return, but <b>file only page 1 of Form 2210.</b>
							</span>
						</div>
					</div>
					<!-- Part ll -->
					<!-- Part Il - Header -->
					<div style="width:187mm;height:4mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;">
						<span class="styPartName" style="height:4mm;width:12mm;font-size:13;">Part ll</span>
						<div class="styPartDesc" style="width:170mm;font-weight:normal;">
							<span style="font-size:10pt;vertical-align:top;"/>
							<b>Reasons for Filing.</b>  Check applicable boxes.  If none apply, <b>do not </b>file Form 2210.
						</div>
					</div>
					<!-- End Part 2 Header -->
					<!-- Part 2 body -->
					<div style="width:187mm;height:39mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;">
						<!-- Line A -->
						<div style="width:187mm;padding-top:1mm;height:8mm;">
							<div class="styLNLeftLtrBox" style="font-size:7pt;height:5mm;aligh-text:top;padding-top:0mm; padding-left: 3.25mm">A</div>
							<!-- Defining the base ID for WaiverOfEntirePenaltyInd-->
								<xsl:variable name="WaiverOfEntirePenaltyIndID">
									<xsl:call-template name="PopulateID">
										<xsl:with-param name="TargetNode" select="$Form2210Data/WaiverOfEntirePenaltyInd"/>
									</xsl:call-template>
								</xsl:variable>
							<input type="checkbox" alt="alt" class="styCkbox" style="margin: 0mm 0mm 3mm 1mm">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2210Data/WaiverOfEntirePenaltyInd"/>
									<xsl:with-param name="BackupName">IRS2210WaiverOfEntirePenaltyInd</xsl:with-param>
								</xsl:call-template>
								<xsl:attribute name="id">
									<xsl:choose>
										<xsl:when test="WaiverOfEntirePenaltyIndID != ''">
											<xsl:value-of select="concat($WaiverOfEntirePenaltyIndID, '[1]')"/>
										</xsl:when>
										<xsl:otherwise>IRS2210WaiverOfEntirePenaltyInd[1]</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</input>	
												
							<label>
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2210Data/WaiverOfEntirePenaltyInd"/>
									<xsl:with-param name="BackupName">IRS2210WaiverOfEntirePenaltyInd</xsl:with-param>
								</xsl:call-template>
								<xsl:attribute name="for">
									<xsl:choose>
										<xsl:when test="WaiverOfEntirePenaltyIndID != ''">
											<xsl:value-of select="concat($WaiverOfEntirePenaltyIndID, '[1]')"/>
										</xsl:when>
										<xsl:otherwise>IRS2210WaiverOfEntirePenaltyInd[1]</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
				            </label>
				            
				            <div style="padding:0mm 0mm .5mm 1mm;">
							     You request a <b>waiver</b> (see instructions) of your entire penalty. You must check this box and file page 1 of Form 2210, but you<br/>
								 are not required to figure your penalty.		
							</div> 
						</div>
						
						<!-- Line B -->
						<div style="width:187mm;padding-top:0mm;height:8mm;">
							<div class="styLNLeftLtrBox" style="font-size:7pt;height:5mm;aligh-text:top; padding-top:0mm; padding-left: 3.25mm">B</div>
							<!-- Defining the base ID for WaiverOfPartOfPenaltyInd-->
								<xsl:variable name="WaiverOfPartOfPenaltyIndID">
									<xsl:call-template name="PopulateID">
										<xsl:with-param name="TargetNode" select="$Form2210Data/WaiverOfPartOfPenaltyInd"/>
									</xsl:call-template>
								</xsl:variable>
								<input type="checkbox" alt="alt" class="styCkbox" style="margin: 0mm 0mm 3mm 1mm">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2210Data/WaiverOfPartOfPenaltyInd"/>
										<xsl:with-param name="BackupName">IRS2210WaiverOfPartOfPenaltyInd</xsl:with-param>
									</xsl:call-template>
									<xsl:attribute name="id">
										<xsl:choose>
											<xsl:when test="WaiverOfPartOfPenaltyIndID != ''">
												<xsl:value-of select="concat($WaiverOfPartOfPenaltyIndID, '[2]')"/>
											</xsl:when>
											<xsl:otherwise>IRS2210WaiverOfPartOfPenaltyInd[2]</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</input>
								
								<label>
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2210Data/WaiverOfPartOfPenaltyInd"/>
										<xsl:with-param name="BackupName">IRS2210WaiverOfPartOfPenaltyInd</xsl:with-param>
									</xsl:call-template>
									<xsl:attribute name="for">
										<xsl:choose>
											<xsl:when test="WaiverOfPartOfPenaltyIndID != ''">
												<xsl:value-of select="concat($WaiverOfPartOfPenaltyIndID, '[2]')"/>
											</xsl:when>
											<xsl:otherwise>IRS2210WaiverOfPartOfPenaltyInd[2]</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</label>
							<div style="padding:0mm 0mm .5mm 1mm;">
								   You request a <b>waiver</b> (see instructions) of part of your penalty. You must figure your penalty and waiver amount and file Form <br/>
								    2210.		
							</div>                             
						</div>
						<!-- Line C -->
						<div style="width:187mm;padding-top:0mm;height:8mm;">
							<div class="styLNLeftLtrBox" style="font-size:7pt;height:5mm;align-text:top; padding-top:0mm; padding-left: 3.25mm">C</div>
								<!-- Define base ID for AnnualizedIncomeMethodInd -->
								<xsl:variable name="AnnualizedIncomeMethodIndID">
									<xsl:call-template name="PopulateID">
										<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeMethodInd"/>
									</xsl:call-template>
								</xsl:variable>
								<input type="checkbox" alt="alt" class="styCkbox" style="margin: 0mm 0mm 3mm 1mm">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeMethodInd"/>
										<xsl:with-param name="BackupName">IRS2210AnnualizedIncomeMethodInd</xsl:with-param>
									</xsl:call-template>
									<xsl:attribute name="id">
										<xsl:choose>
											<xsl:when test="AnnualizedIncomeMethodIndID != ''">
												<xsl:value-of select="AnnualizedIncomeMethodIndID"/>
											</xsl:when>
											<xsl:otherwise>IRS2210AnnualizedIncomeMethodInd</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</input>
								<label>
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeMethodInd"/>
										<xsl:with-param name="BackupName">IRS2210AnnualizedIncomeMethodInd</xsl:with-param>
									</xsl:call-template>
									<xsl:attribute name="for">
										<xsl:choose>
											<xsl:when test="AnnualizedIncomeMethodIndID != ''">
												<xsl:value-of select="AnnualizedIncomeMethodIndID"/>
											</xsl:when>
											<xsl:otherwise>
											IRS2210AnnualizedIncomeMethodInd
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</label>
				           <div style="padding:0mm 0mm .5mm 1mm;">
								   Your income varied during the year and your penalty is reduced or eliminated when figured using the <b>annualized income<br/>
								   installment method.</b> You must figure the penalty using Schedule Al and file Form 2210.	
							</div>                              
						</div>
						<!-- Line D -->
						<div style="width:187mm;padding-top:0mm;height:8mm;">
							<div class="styLNLeftLtrBox" style="font-size:7pt;height:5mm;align-text:top; padding-top:0mm; padding-left: 3.25mm">D</div>
								<!-- Define the base ID for ActuallyWithheldInd-->
								<xsl:variable name="ActuallyWithheldIndID">
									<xsl:call-template name="PopulateID">
										<xsl:with-param name="TargetNode" select="$Form2210Data/ActuallyWithheldInd"/>
									</xsl:call-template>
								</xsl:variable>
								<input type="checkbox" alt="alt" class="styCkbox" style="margin: 0mm 0mm 3mm 1mm">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2210Data/ActuallyWithheldInd"/>
										<xsl:with-param name="BackupName">IRS2210ActuallyWithheldInd</xsl:with-param>
									</xsl:call-template>
									<xsl:attribute name="id">
										<xsl:choose>
											<xsl:when test="ActuallyWithheldIndID != ''">
												<xsl:value-of select="ActuallyWithheldIndID"/>
											</xsl:when>
											<xsl:otherwise>IRS2210ActuallyWithheldInd</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</input>
								<label>
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2210Data/ActuallyWithheldInd"/>
										<xsl:with-param name="BackupName">IRS2210ActuallyWithheldInd</xsl:with-param>
									</xsl:call-template>
									<xsl:attribute name="for">
										<xsl:choose>
											<xsl:when test="ActuallyWithheldIndID != ''">
												<xsl:value-of select="ActuallyWithheldIndID"/>
											</xsl:when>
												<xsl:otherwise>
													IRS2210ActuallyWithheldInd
												</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</label>
				            <div style="padding:0mm 0mm .5mm 1mm;">
								   Your penalty is lower when figured by treating the federal income tax withheld from your income as paid on the dates it was<br/>
								   actually withheld, instead of in equal amounts on the payment due dates. You must figure your penalty and file Form 2210.	
							</div>                             
						</div>
						<!-- Line E -->
						<div style="width:187mm;padding-top:0mm;height:8mm;">
							<div class="styLNLeftLtrBox" style="font-size:7pt;height:4mm;align-text:top; padding-top:0mm; padding-left: 3.25mm">E</div>
								<!-- Define the base ID for IRS2210JointReturnInd -->
								<xsl:variable name="IRS2210JointReturnIndID">
									<xsl:call-template name="PopulateID">
										<xsl:with-param name="TargetNode" select="$Form2210Data/JointReturnInd"/>
									</xsl:call-template>
								</xsl:variable>
								<input type="checkbox" alt="alt" class="styCkbox" style="margin: 0mm 0mm 3mm 1mm">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2210Data/JointReturnInd"/>
										<xsl:with-param name="BackupName">IRS2210JointReturnInd</xsl:with-param>
									</xsl:call-template>
									<xsl:attribute name="id">
										<xsl:choose>
											<xsl:when test="IRS2210JointReturnIndID != ''">
												<xsl:value-of select="IRS2210JointReturnIndID"/>
											</xsl:when>
											<xsl:otherwise>IRS2210JointReturnInd</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</input>
								<label>
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2210Data/JointReturnInd"/>
										<xsl:with-param name="BackupName">IRS2210JointReturnInd</xsl:with-param>
									</xsl:call-template>
									<xsl:attribute name="for">
										<xsl:choose>
											<xsl:when test="IRS2210JointReturnIndID != ''">
												<xsl:value-of select="IRS2210JointReturnIndID"/>
											</xsl:when>
												<xsl:otherwise>
													IRS2210JointReturnInd
												</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</label>
							<div style="padding:0mm 0mm .5mm 1mm;">
									You filed or are filing a joint return for either 2015 or 2016, but not for both years, and line 8 above is smaller than line 5<br/>
									above. You must file page 1 of Form 2210, but you are <b>not</b> required to figure your penalty (unless box <b>B, C,</b>  or <b>D</b> applies).
							</div>                            
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:0mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:22mm;"/>                        
      Cat. No. 11744P
       <span style="width:28mm;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">2210</span> (2016)
                           </div>
					</div>
					<br/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm; border-bottom-width:0px;padding-top:.5mm;">
						<div style="float:right;font-size:6pt;font-weight:bold;"/>
					</div>
					<div class="styBB" style="width:187mm;padding-top:0mm;">
						<div style="float:left;">Form 2210 (2016)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- Part lll -->
					<!-- Part Ill - Header -->
					<div style="width:187mm;height:4mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="height:4mm;width:15mm;font-size:13;">Part lll</span>
						<span style="width:170mm;font-weight:normal;" class="styPartDesc">
							<span style="font-size:10pt;vertical-align:center;"/>
							<b>Short Method</b>
						</span>
					</div>
					<!-- END Part lll Header-->
					<!--Section 1 Part III-->
					<div class="styBB" style="width:187mm;height:19mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<div style="width:187mm;padding-top:1mm;">
							<span style="width:14.6mm;"/>
							<i>
								<b>Can You Use the</b>
							</i>
							<span style="width:11mm;"/>You can use the short method if:
                        </div>
							<div class="styBB" style="width:50mm;border-bottom-width:0px;">
								<span style="width:14.6mm;"/>
								<i>
									<b>Short Method? </b>
								</i>
							</div>
							<div class="styBB" style="width:130mm;padding-top:.5mm;border-bottom-width:0px;float:left; clear:none;">
								<img src="{$ImagePath}/2210_Bullet_Round.gif" alt="RoundBullet"/>
								<span style="width:.05mm;"/>								
									You made no estimated tax payments (or your only payments were withheld<br/>
									federal income tax), <b>or</b><br/>							
     							<img src="{$ImagePath}/2210_Bullet_Round.gif" alt="RoundBullet"/>
     							<span style="width:.8mm;"/>
								You paid the same amount of estimated tax on each of the four payment<br/>due dates.
                        </div>
					</div>
					<!--Section 2 Part III Instructions-->
					<div class="styBB" style="width:187mm;border-style:solid; border-bottom-width:2px;border-top-width:0px;border-right-width:0px;border-left-width:0px;float:left;">
							<div class="styBB" style="width:187mm;border-bottom-width:0px;">
								<span style="width:14mm;"/>
								<i>
									<b>Must You Use the</b>
								</i>
								<span style="width:10mm;"/>You must use the regular method (Part lV) instead of the short method if:   
							</div>
							<div class="styBB" style="width:50.5mm;border-bottom-width:0px;">
								<span style="width:14mm;"/>
								<i>
									<b>Regular Method?</b>
								</i>
							</div>
							<div class="styBB" style="width:136mm;padding-top:.5mm;border-bottom-width:0px;float:left;clear:none;">
								<img src="{$ImagePath}/2210_Bullet_Round.gif" alt="RoundBullet"/>
								<span style="width:.005mm;"/>
								    You made any estimated tax payments late,<br/>
								<img src="{$ImagePath}/2210_Bullet_Round.gif" alt="RoundBullet"/>
								<span style="width:.75mm;"/>										
									You checked box <b>C</b> or <b>D</b> in Part ll, <b>or</b><br/>
								<img src="{$ImagePath}/2210_Bullet_Round.gif" alt="RoundBullet"/>
								<span style="width:.75mm;"/>										
									You are filing Form 1040NR or 1040NR-EZ and you did not receive<br/>													
								wages as an employee subject to U.S. income tax withholding.									
						<div class="styBB" style="width:187mm;height:10mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:right;clear:none;">
							<div style="width:187mm;height:2mm;">
								<span style="width:2.25mm;"/>
								<b>Note.</b>
								<i> If any payment was made earlier than the due date, you can use the short method, but using it may cause you </i><br/>
									<span style="width:2.25mm;"/><i>to pay a larger penalty than the regular method. If the payment was only a few days early, the difference is likely to be small.</i>
							</div>
						</div>
					</div>						
						<!-- Line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left: 2.25mm">10
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Enter the amount from Form 2210, line 9</span>
								<span class="styIRS2210DotLn">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-bottom:0mm;padding-top:1.5mm;bottom-border-width:1px;">10</div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-top:1.5mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/RequiredAnnualPaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left: 2.25mm">11
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.8mm;height:5mm;padding-bottom:0mm;">
								<span style="float:left">Enter the amount, if any, from Form 2210, line 6</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">.......</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm; width:7.1mm;padding-top:1.5mm">11
                            </div>
							<div class="styLNAmountBox" style="width:36.1mm;height:5mm;padding-bottom:0mm;padding-top:1.5mm; border-buttom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/WithholdingTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left: 2.25mm">12
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.8mm;height:5mm;padding-bottom:0mm;float:left">
								Enter the total amount, if any, of estimated tax payments you made.<br/>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-top:1.5mm;width:7.1mm;">12
                            </div>
							<div class="styLNAmountBox" style="width:36.1mm;height:5mm;padding-bottom:0mm;padding-top:1.5mm;border-buttom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TotalEstimatedTaxPaymentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left: 2.25mm">13
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;padding-bottom:0mm;">
								<span style="float:left">Add lines 11 and 12</span>
								<span class="styIRS2210DotLn">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-bottom:0mm;padding-top:1.5mm;bottom-border-width:1px;">13</div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;padding-top:1.5mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TotalWhTaxesAndESPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-bottom:0mm;padding-left: 2.25mm">14
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:8mm;padding-bottom:0mm;">
								<b>Total underpayment for year. </b>Subtract line 13 from line 10.  If zero or less, <b>stop;</b> you do<br/>
								<span style="float:left">not owe a penalty.  <b>Do not file Form 2210 unless you checked box E in Part II</b>
								</span>
								<span class="styBoldText">
									<span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                     <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                     <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                    <span style="width:8px"/>.
                                  </span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:5mm;padding-bottom:0;bottom-border-width:1px;">14</div>
							<div class="styLNAmountBox" style="width:36mm;height:8mm;padding-top:5mm; padding-bottom:0mm; bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TotalUnderpaymentForYearAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left: 2.25mm">15
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;padding-bottom:0mm;">
								<span style="float:left">Multiply line 14 by 0.02656</span>
								<span class="styIRS2210DotLn" style="float:right">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-bottom:0mm;padding-top:1.5mm;bottom-border-width:1px;">15</div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;bottom-border-width:1px;padding-top:1mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TotalUnderpaymentCalculatedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 16 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left: 2.25mm">16
                       </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;padding-bottom:0mm;">
								<img src="{$ImagePath}/2210_Bullet_Round.gif" alt="RoundBullet"/>
                If the amount on line 14 was paid <b>on or after </b>4/15/17, enter -0-.
                            </div>
							<div class="styLNRightNumBox" style="height:5mm;padding-bottom:0mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:1px;width:8.3mm;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<img src="{$ImagePath}/2210_Bullet_Round.gif" alt="RoundBullet"/>
                If the amount on line 14 was paid <b>before</b> 4/15/17, make the following computation to find the <br/>amount to enter on line 16.          
                            </div>
							<div class="styLNRightNumBox" style="height:9mm;padding-bottom:0mm;border-bottom-width:0px; background-color:lightgrey; border-right-width:1px;border-right-width:1px;width:8.3mm;"/>
						</div>
						<div style="width:187mm;font-family:arial;font-size:7pt;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:0mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="text-align:bottom;width:135mm;height:2mm;">
								<span style="width:18mm;height:2mm;"/>
								<span style="width:13mm;text-align:center;">Amount on</span>
								<span style="width:14mm;height:2mm;"/>
								<span style="width:24mm;text-align:center;">Number of days paid</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px; background-color:lightgrey; border-right-width:1px;border-left-width:1px;width:8.3mm;"/>
						</div>
						<div style="width:187mm;font-size:7pt;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:0mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="text-align:bottom;width:135mm;height:2mm;">
								<span style="float:left">
									<span style="width:18mm"/>
									<span style="width:13mm;text-align:center;">line 14</span>
									<span style="width:14mm;height:2mm;virtical-align:super;text-align:center;">x</span>
									<span style="width:24mm;height:2mm;text-align:center;">before 4/15/17</span>
									<span style="width:14mm;text-align:center;">x</span>
									<span style="width:5mm;height:2mm;text-align:center;">0.00011</span>
								</span>
								<span class="styIRS2210DotLn" style="float:right;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:1px; border-right-width:1px;width:8.3mm;padding-bottom:0;padding-top:1.5mm">16
                            </div>
							<div class="styLNAmountBox" style="width:35mm;height:5mm;border-left-width:0px;border-bottom-width:1px;padding-bottom:0;padding-top:1.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/DueDatePaidMultipliedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 17 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-bottom:0mm;margin-top:1mm;padding-left: 2.25mm;">17
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;margin-top:1mm;height:8mm;padding-bottom:0mm;">
								<b>Penalty.</b>  Subtract line 16 from line 15.  Enter the result here and on Form 1040, line 79;<br/> Form 1040A, line 51; Form 1040NR, line 76; Form 1040NR-EZ, line 26; or Form 1041, line 26. <br/>
								<b>Do not file Form 2210 unless you checked a box in Part II.</b>
								<span style="width:.25mm;"/>								
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Wavied Short Method Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form2210Data/PenaltyAmt/@waivedShortMethodAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Waived Literal Short Method</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form2210Data/PenaltyAmt/@waivedLiteralShortMethodCd"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<span class="styBoldText">
									<span style="width:10px"/>.
							    <span style="width:10px"/>.
							    <span style="width:10px"/>.
								<span style="width:10px"/>.
							    <span style="width:10px"/>.
							    <span style="width:10px"/>.
								<span style="width:10px"/>.  
								<span style="width:10px"/>.
								<span style="width:6px"/>
								</span>
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;padding-bottom:0;padding-top:9mm;border-bottom-width:0px;">17</div>
							<div class="styLNAmountBox" style="width:36mm;height:12mm;padding-top:9mm; padding-bottom:0mm; border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/PenaltyAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:40px;"/>Form 
                            <span class="styBoldText" style="font-size:8pt;">2210</span> (2016)
                        </div>
					</div>
					<br/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 3 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm; border-bottom-width:0px;padding-top:.5mm;">
						<div style="float:right;font-size:6pt;font-weight:bold;"/>
					</div>
					<div class="styBB" style="width:187mm;padding-top:0mm;">
						<div style="float:left;">Form 2210 (2016)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- Part lV -->
					<!-- Part lV - Header -->
					<div class="styBB" style="width:187mm;height:auto;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="height:4mm;width:15mm;font-size:13;">Part lV</span>
						<span style="width:170mm;font-weight:normal;" class="styPartDesc">
							<span style="font-size:10pt;auto;vertical-align:center;"/>
							<b>Regular Method</b> (See the instructions if you are filing Form 1040NR or 1040NR-EZ.)
                        </span>
					</div>
					<!-- END Part lV Header-->
					<!-- Section A header-->
					<div style="width:187mm;border:0px solid black;border-bottom-width:1px;">
						<span class="styLNDesc" style="width:80mm;height:13.6mm;font-size:8pt;padding-top:5mm;">
							<b>Section A—Figure Your Underpayment</b>
						</span>
						<span class="styLNRightNumBox" style="font-size:7pt;height:13.6mm; width:7.1mm; border-bottom-width:0px; background-color:lightgrey;border-right-width:1px;"/>
						<span class="styLnDesc" style="font-size:7pt;text-align:center; width:99.9mm; height:5mm; border-style: solid; border-color: black;border-bottom-width:1px; border-left-width:0px; border-right-width:0px; border-top-width:0px;">
							<b>Payment Due Dates</b>
						</span>
						<span class="styLNDesc" style="font-size:7pt; width:25mm; height:8.6mm;text-align:center; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px;padding-top:0mm;line-height:150%;">
							<b>(a)</b>
							<br/>4/15/16
							</span>
						<span class="styLNDesc" style="font-size:7pt; width:25mm; height:8.6mm;text-align:center;  border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px;padding-top:0mm;line-height:150%; ">
							<b>(b)</b>
							<br/>6/15/16
							</span>
						<span class="styLNDesc" style="font-size:7pt; width:25mm; height:8.6mm; text-align:center; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px; padding-top:0mm;line-height:150%; ">
							<b>(c)</b>
							<br/>9/15/16
							</span>
						<span class="styLNDesc" style="font-size:7pt; width:24.9mm; height:8.6mm; text-align:center;padding-top:0mm;line-height:150%; ">
							<b>(d)</b>
							<br/>1/15/17
							</span>
					</div>
					<!-- End Section A header-->
					<!---Line 18-->
					<div style="width:187mm;">
						<span class="styLNLeftNumBox" style="width:7mm;height:9mm;">18</span>
						<div class="styLNDesc" style="width:73mm;font-size:7pt;border-right-width:1px;height:9mm;">
							<b>Required installments.</b>  If box C in Part II applies, enter
 the amounts from Schedule AI, line 25. Otherwise, enter
							25% (.25) of line 9, Form 2210, in each column
							<span class="styBoldText">
                                </span>
						</div>
						<span class="styLNRightNumBox" style="font-size:7pt;height:11.4mm; width:7.1mm; border-bottom-width:1px; border-right-width:1px;padding-top:7.5mm;">18
                        </span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:11.4mm; text-align:right; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-top:8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/RequiredInstallmentAAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:11.4mm; text-align:right; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-top:8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/RequiredInstallmentBAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:11.4mm; text-align:right;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-top:8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/RequiredInstallmentCAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:24.9mm; height:11.4mm; text-align:right; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; padding-top:8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/RequiredInstallmentDAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--Line19-->
					<div style="width:187mm;">
						<span class="styLNLeftNumBox" style="width:7mm;height:20mm;">19</span>
						<div class="styLNDesc" style="width:73mm;font-size:7pt;border-right-width:1px;height:20mm;">       
        Estimated tax paid and tax withheld (see <br/>
 the instructions). For column (a) only, also enter the<br/>
 amount from line 19 on line 23. If line 19 is equal to<br/>
 or more than line 18 for all payment periods, stop<br/>
 here; you do not owe a penalty. <b>Do not file Form</b>
							<span style="float:left;">
								<b>2210 unless you checked a box in Part II</b>
							</span>
							<span class="styIRS2210DotLn">...</span>
						</div>
						<span class="styLNRightNumBox" style="font-size:7pt;height:20mm; width:7.1mm; border-bottom-width:1px; border-right-width:1px;padding-top:16mm;">19
                        </span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:20mm; text-align:right;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-top:16mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/EstimatedTaxPdAndWithheldAAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:20mm; text-align:right;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-top:16mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/EstimatedTaxPdAndWithheldBAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:20mm; text-align:right;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-top:16mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/EstimatedTaxPdAndWithheldCAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:24.9mm; height:20mm; text-align:right; border-style: solid; border-color:black;border-top-width:0px;border-left-width:0px;border-right-width:0px; border-bottom-width:1px;padding-top:16mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/EstimatedTaxPdAndWithheldDAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--Line 20-->
					<div style="width:187mm;padding-top:0mm;">
						<span class="styLNLeftNumBox" style="width:7mm;height:14mm;padding-top:6mm;">20</span>
						<div class="styLNDesc" style="width:73mm;font-size:7pt;border-right-width:1px;height:14mm;padding-top:0mm;text-align:top;">
							<i>
								<b>Complete lines 20 through 26 of one column<br/>
 before going to line 20 of the next column.</b>
							</i>
							<br/>
 Enter the amount, if any, from line 26 in the previous<br/>
							<span style="float:left">column</span>
							<span class="styIRS2210DotLn">...............</span>
						</div>
						<span class="styLNRightNumBox" style="height:14mm; width:7.1mm; border-bottom-width:1px; border-right-width:1px;padding-bottom:0;padding-top:10mm;">20
                        </span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:14mm; text-align:center;border-style:solid; border-color:black; background-color:lightgrey;border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:10mm;"/>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:14mm; text-align:right;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/OverpaymentAAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:14mm; text-align:right;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/OverpaymentBAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:24.9mm; height:14mm; text-align:right; border-style: solid; border-color:black;border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; padding-bottom:0;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/OverpaymentCAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--Line 21-->
					<div style="width:187mm;padding-top:0mm;">
						<span class="styLNLeftNumBox" style="width:7mm;height:5mm;">21</span>
						<div class="styLNDesc" style="width:73mm;font-size:7pt;border-right-width:1px;height:5mm;">
							<span style="float:left;">Add lines 19 and 20</span>
							<span class="styIRS2210DotLn">...........</span>
						</div>
						<span class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:7.1mm; border-bottom-width:1px; border-right-width:1px;padding-bottom:0;padding-top:1.5mm">21
                        </span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:5mm; border-style: solid; border-color:black; background-color:lightgrey;border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:1.5mm;"/>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:5mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:1.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/TaxToBeAppliedBAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:5mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:1.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/TaxToBeAppliedCAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:24.9mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right; padding-bottom:0;padding-top:1.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/TaxToBeAppliedDAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--Line 22-->
					<div style="width:187mm;">
						<span class="styLNLeftNumBox" style="width:7mm;height:7mm;">22</span>
						<div class="styLNDesc" style="width:73mm;font-size:7pt;border-right-width:1px;height:7mm;">       
        Add the amounts on lines 24 and 25 in the previous
      <span style="float:left">column</span>
							<span class="styIRS2210DotLn">...............</span>
						</div>
						<span class="styLNRightNumBox" style="height:7.5mm; width:7.1mm; border-bottom-width:1px; border-right-width:1px ;padding-bottom:0;padding-top:4mm;">22
                        </span>
						<span class="styLNDesc" style="font-size:7pt; width:25mm; height:7.5mm; ;border-style: solid;  border-color:black; background-color:lightgrey;border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:4mm;"/>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:7.5mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/TaxesDueColumnBAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:7.5mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/TaxesDueColumnCAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:24.9mm; height:7.5mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; padding-bottom:0;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/TaxesDueColumnDAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--Line 23-->
					<div style="width:187mm;">
						<span class="styLNLeftNumBox" style="width:7mm;height:7mm;">23</span>
						<div class="styLNDesc" style="width:73mm;font-size:7pt;border-right-width:1px;height:7mm;">   
        Subtract line 22 from line 21. If zero or less, enter -0-.<br/>
							<span style="float:left;">For column (a) only, enter the amount from line 19</span>
						</div>
						<span class="styLNRightNumBox" style="height:7.5mm; width:7.1mm; border-bottom-width:1px; border-right-width:1px;padding-bottom:0;padding-top:4mm">23
		</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:7.5mm; text-align:right; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/EstimatedTaxPdAndWithheldAAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:7.5mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/AppliedOverpaymentBAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:7.5mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-bottom:0;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/AppliedOverpaymentCAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:24.9mm; height:7.5mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; padding-bottom:0;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/AppliedOverpaymentDAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--Line 24-->
					<div style="width:187mm;">
						<span class="styLNLeftNumBox" style="width:7mm;height:7mm;">24</span>
						<div class="styLNDesc" style="width:73mm;font-size:7pt;border-right-width:1px;height:4mm;">   
        If line 23 is zero, subtract line 21 from line 22.<br/>
							<span style="float:left;">Otherwise, enter -0-</span>
							<span class="styIRS2210DotLn">...........</span>
						</div>
						<span class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:7.1mm; padding-top:4mm; border-bottom-width:1px; border-right-width:1px;">24
                        </span>
						<span class="styLNDesc" style="font-size:7pt; width:25mm; height:8mm; ;border-style: solid; border-color:black; background-color:lightgrey; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-top:0px;"/>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:8mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/AppliedUnderpaymentBAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:8mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/AppliedUnderpaymentCAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:24.9mm; height:8mm; border-style: solid;   border-color:black; background-color:lightgrey; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px;"/>
					</div>
					<!--Line 25-->
					<div style="width:187mm;">
						<span class="styLNLeftNumBox" style="width:7mm;height:9mm;">25</span>
						<div class="styLNDesc" style="width:73mm;font-size:7pt;border-right-width:1px;height:9mm;">
							<b>Underpayment.</b>  If line 18 is equal to or more than<br/>
 line 23, subtract line 23 from line 18. Then go to line<br/>
							<span style="float:left;">20 of the next column. Otherwise, go to line 26</span>
							<span class="styIRS2210DotLn">..</span>
							<img src="{$ImagePath}/2210_Bullet_Md.gif" alt="MediumBullet"/>
						</div>
						<span class="styLNRightNumBox" style="font-size:7pt;height:11mm; width:7.1mm; border-bottom-width:1px; border-right-width:1px;padding-top:7mm;">25
                        </span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:11mm; text-align:right;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; padding-top:7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/UnderpaymentAAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:11mm; text-align:center;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px;text-align:right; border-right-width:1px; padding-top:7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/UnderpaymentBAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:11mm; text-align:center;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px;text-align:right; border-right-width:1px; padding-top:7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/UnderpaymentCAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:24.9mm; height:11mm; text-align:right; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; padding-top:7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/UnderpaymentDAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--Line 26-->
					<div style="width:187mm;padding-top:0mm;">
						<span class="styLNLeftNumBox" style="width:7mm;height:9mm;padding-top:0mm;">26</span>
						<div class="styLNDesc" style="width:73mm;font-size:7pt;border-right-width:1px;height:10mm;padding-top:0mm;">       
        Overpayment. If line 23 is more than line 18,<br/>
        subtract line 18 from line 23. Then go to line 20 of<br/>
							<span style="float:left;"> the next column </span>
							<span class="styIRS2210DotLn">............</span>
						</div>
						<span class="styLNRightNumBox" style="font-size:7pt;height:10mm; width:7.1mm; border-bottom-width:0px; border-right-width:1px;padding-top:6mm;">26</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:10mm; ;border-style: solid; text-align:right; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px; padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/OverpaymentAAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:10mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px; padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/OverpaymentBAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:6pt; width:25mm; height:10mm; border-style: solid;text-align:right; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px; padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/OverpaymentCAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNDesc" style="font-size:7pt; width:24.9mm; height:10mm; border-style: solid; padding-top:0mm;padding-bottom:0mm;border-color:black; background-color:lightgrey; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:0px;"/>
					</div>
					<!--Section B Figure the Penalty-->
					<div class="styLNDesc" style="padding-top:1mm;padding-bottom:0mm;width:187mm;font-size:8pt; height:5mm; border-style: solid; border-color:black;border-top-width:1px; border-bottom-width:1px;border-left-width:0px; border-right-width:0px;">
						<b>Section B—Figure the Penalty</b> (Use the Worksheet for Form 2210, Part IV, Section B—Figure the Penalty in the instructions.)</div>
					<!--Line 27-->
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<span class="styLNLeftNumBox" style="width:7mm;height:9mm;">27</span>
						<div class="styLNDesc" style="width:140mm;font-size:7pt;border-right-width:1px;height:9mm;">
							<b>Penalty.
        </b>  Enter the total penalty from line 14 of the Worksheet for Form 2210, Part IV, Section B—Figure the Penalty. Also include this amount on Form 1040,
 line 79; Form 1040A, line 51; Form 1040NR,<br/> line 76; Form 1040NR-EZ, line 26; or Form 1041, 
					line 26. <b>Do not file Form 2210 unless you checked a box in Part II</b>
							<span style="width:2mm;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Waived Literal Regular Method Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form2210Data/TotalPenaltyAmt/@waivedLiteralRegularMethodCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Waived Literal Regular Method Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form2210Data/TotalPenaltyAmt/@waivedRegularMethodAmt"/>
							</xsl:call-template>
							<!--Dotted Line-->
							<span class="styBoldText">   
                                        <span style="width:16px"/>.
                                        <span style="width:16px"/>.
                                        <span style="width:16px"/>.
                                        <span style="width:16px"/>.
                                       <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                       <span style="width:16px"/>.    
                                        <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                       <span style="width:16px"/>.     
                                         <span style="width:16px"/>.   
                                       <span style="width:16px"/>.        
                                        <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                       <span style="width:16px"/>.     
                                         <span style="width:16px"/>. 
                                         <span style="width:16px"/>.    
                                         <span style="width:16px"/>.   
                                       <span style="width:16px"/>.     
                                       <span style="width:4px"/>
                               </span>
							<img src="{$ImagePath}/2210_Bullet_Md.gif" alt="MediumBullet"/>
						</div>
						<div class="styLNRightNumBox" style="font-size:7pt;height:14mm; width:7.1mm; border-bottom-width:0px; border-right-width:1px;padding-top:9mm;">27
                        </div>
						<div class="styLNDesc" style="font-size:6pt; width:32mm; height:14mm; padding-top:9mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:0px; text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2210Data/TotalPenaltyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
      Form 
                            <span class="styBoldText" style="font-size:8pt;">2210</span> (2016)
                        </div>
					</div>
					<br/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 4 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm; border-bottom-width:0px;padding-top:.5mm;">
						<div style="float:right;font-size:6pt;font-weight:bold;">	</div>
					</div>
					<div class="styBB" style="width:187mm;padding-top:0mm;">
						<div style="float:left;">Form 2210 (2016)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;float:left;clear:none;">
						<div class="styLNDesc" style="width:187mm;font-size:8pt;border-right-width:1px;height:4mm;">
							<b>Schedule AI—Annualized Income Installment Method</b> (See the instructions.)
                        </div>
					</div>
					<div class="styBB" style="width:187mm;float:left;clear:none;">
						<div class="styLNDesc" style="font-size:7pt; width:77mm; border-right-width:1px;height:11mm;">Estates and trusts, <b>do not</b> use the period ending dates shown to the right.
        Instead, use the following: 2/29/16, 4/30/16, 7/31/16, and 11/30/16.
                        </div>
						<div class="styLNRightNumBox" style="font-size:7pt;height:11mm; width:6mm;  border-bottom-width:0px; border-right-width:1px;background-color:lightgrey; "/>
						<div class="styLNDesc" style="font-size:8pt; font-family:'arial narrow'; width:26mm; height:11mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px; text-align:center;">
							<b>(a)</b>
							<br/>1/1/16-3/31/16</div>
						<div class="styLNDesc" style="font-size:8pt;font-family:'arial narrow';  width:26mm; height:11mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px; text-align:center;vertical-align:top;">
							<b>(b)</b>
							<br/>1/1/16-5/31/16</div>
						<div class="styLNDesc" style="font-family:'arial narrow';font-size:8pt; width:26mm; height:11mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px; text-align:center;vertical-align:top;">
							<b>(c)</b>
							<br/>1/1/16-8/31/16</div>
						<div class="styLNDesc" style="font-family:'arial narrow';font-size:8pt; width:26mm; height:11mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:0px; text-align:center;vertical-align:top;">
							<b>(d)</b>
							<br/>1/1/16-12/31/16
                        </div>
					</div>
					<!-- Part l -->
					<!-- Part I - Header -->
					<div class="styBB" style="width:187mm;height:auto;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;clear:none;">
						<span class="styPartName" style="height:4mm;width:12mm;font-size:13;">Part l</span>
						<span style="width:170mm;font-weight:normal;" class="styPartDesc">
							<span style="font-size:10pt;vertical-align:top;"/>
							<b>Annualized Income Installments</b>
						</span>
					</div>
					<!-- End Part 1 Header -->
					<!-- Part 1 body -->
					<div class="styBB" style="width:187mm;height:auto;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;clear:none;">
						<!-- Line 1 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 4mm;height:10mm;">1
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:10mm;">Enter your adjusted gross income for each period (see instructions). 
        (Estates and trusts, enter your taxable income without your exemption for each period.)
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:10mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:7mm; ">1
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:10mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AGIPeriodAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:10mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AGIPeriodBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:10mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AGIPeriodCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:10mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AGIPeriodDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 4mm;height:8mm;">2
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:8mm;">
								<span style="float:left;">Annualization amounts. (Estates and trusts, see </span>
								<br/>
								<span style="float:left;">instructions)</span>
								<span class="styIRS2210DotLn">............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-bottom:0;padding-top:4mm; ">2
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:8mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-bottom:0;padding-top:4mm;">4</div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-bottom:0;padding-top:4mm;">2.4</div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-bottom:0;padding-top:4mm;">1.5</div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:center;padding-bottom:0;padding-top:4mm;">1</div>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 4mm;height:5mm;">3
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:5mm;">
								<span style="float:left;">Annualized income. Multiply line 1 by line 2</span>
								<span class="styIRS2210DotLn">...</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:1mm; ">3
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 4mm;height:14mm;">4
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:14mm;">If you itemize, enter itemized deductions for the period shown in each column. All others enter -0-, and skip to line 7. <b>Exception: </b>Estates and trusts, skip to line 9 and enter amount from line 3
							<span class="styBoldText">
									<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                  </span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:14mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:10mm; ">4
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:14mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ItemizedDeductionsAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:14mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ItemizedDeductionsBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:14mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ItemizedDeductionsCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:14mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ItemizedDeductionsDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 4mm;height:5mm;">5
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:4mm;">
								<span style="float:left;">Annualization amounts</span>
								<span class="styIRS2210DotLn">.........</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:1mm; ">5
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;">4</div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;">2.4</div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;">1.5</div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:center;padding-top:1mm;">1</div>
						</div>
						<!-- Line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 4mm;height:5mm;">6
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:5mm;">
                                Multiply line 4 by line 5 (see instructions if line 3 is more than $155,650)
                        <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.      
                                        <span style="width:16px"/>.
                                       <span style="width:16px"/>.
                               </span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:7.4mm; width:6mm;border-bottom-width:1px; border-right-width:1px; padding-top:3.4mm; ">6
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:7.4mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:3.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedItemizedDedAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:7.4mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:3.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedItemizedDedBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:7.4mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:3.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedItemizedDedCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:7.4mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:3.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedItemizedDedDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 4mm;height:17mm;">7
         </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:17mm;float:left;clear:none">In each column, enter the full amount of your standard deduction from Form 1040, line 40, or Form 1040A, line 24. (Form 1040NR or 1040NR-EZ filers, enter  -0-. <b>Exception:</b> Indian students and
       business apprentices, see instructions.)
       
        <span class="styBoldText">
									<span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                               </span>
							</div>
							<div class="styLNRightNumBox" style="height:17mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-bottom:0;padding-top:13mm; ">7
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:17mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:13mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ReturnStandardDeductionAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:17mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:13mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ReturnStandardDeductionBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:17mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:13mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ReturnStandardDeductionCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:17mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-bottom:0;padding-top:13mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ReturnStandardDeductionDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 4mm;height:5mm;">8
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:5mm;">
								<span style="float:left;">Enter the <b>larger</b> of line 6 or line 7</span>
								<span class="styIRS2210DotLn">......</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-bottom:0;padding-top:1.5mm; ">8
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/InstallmentDeductionAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/InstallmentDeductionBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/InstallmentDeductionCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/InstallmentDeductionDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 4mm;height:5mm;">9
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:5mm;">
								<span style="float:left;">Subtract line 8 from line 3</span>
								<span class="styIRS2210DotLn">........</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-bottom:0;padding-top:1.5mm ">9
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/NetIncomeAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/NetIncomeBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/NetIncomeCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/NetIncomeDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:14mm;">10
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:14mm;">
								<span style="float:left;">In each column, multiply $4,050 by the total</span>
								<br/>
								<span style="float:left;">number of exemptions claimed (see instructions if</span>
								<br/>
								<span style="float:left;">line 3 is more than $155,650). (Estates, trusts, and</span>
								<br/>
								<span style="float:left;">Form 1040NR or 1040NR-EZ filers, see</span>
								<br/>
								<span style="float:left;">instructions.)</span>
								<span class="styIRS2210DotLn">............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:17mm; width:6mm;border-bottom-width:1px; border-right-width:1px; padding-top:12.4mm; ">10
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:17mm ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:13mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ExemptionClaimedAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:17mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:13mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ExemptionClaimedBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:17mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:13mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ExemptionClaimedCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:17mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:13mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ExemptionClaimedDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:8mm;">11
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:8mm;">
								<span style="float:left;">Subtract line 10 from line 9. If zero or less,</span>
								<br/>
								<span style="float:left;">enter -0-</span>
								<span class="styIRS2210DotLn">.............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:3mm; ">11
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxableIncomeAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxableIncomeBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxableIncomeCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxableIncomeDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:8mm;">12
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:8mm;">
								Figure your tax on the amount on line 11 (see <span style="float:left;">instructions)</span>
								<span class="styIRS2210DotLn">.............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:2mm; ">12
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TentativeTaxAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TentativeTaxBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TentativeTaxCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TentativeTaxDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:8mm;">13
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:8mm;">
								Self-employment tax from line 34  (complete <span style="float:left;">Part II below)</span>
								<span class="styIRS2210DotLn">............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:3mm; ">13
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/SEWorksheetByQtr/AnnualizedSelfEmploymentTxAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/SEWorksheetByQtr/AnnualizedSelfEmploymentTxBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/SEWorksheetByQtr/AnnualizedSelfEmploymentTxCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/SEWorksheetByQtr/AnnualizedSelfEmploymentTxDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:8mm;">14
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:8mm;">
								<span style="float:left;">Enter other taxes for each payment period including,</span>
								<br/>
								<span style="float:left;">if applicable, Additional Medicare Tax and/or Net</span>
								<br/>
								<span style="float:left;">Investment Income Tax (see instructions)</span>
								<span class="styIRS2210DotLn">...</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:10.6mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:6.6mm; ">14
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:10.6mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/OtherTaxesAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:10.6mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/OtherTaxesBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:10.6mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/OtherTaxesCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:10.6mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/OtherTaxesDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:5mm;">15
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:5mm;">
								<span style="float:left;">Total tax. Add lines 12, 13, and 14</span>
								<span class="styIRS2210DotLn">......</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:1mm; ">15
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxBeforeCreditsAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxBeforeCreditsBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxBeforeCreditsCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxBeforeCreditsDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 16 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:11mm;">16
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:11mm;">For each period, enter the same type of credits as allowed on Form
								2210, Part l, lines 1 and 3  <span style="float:left;">(see instructions)</span>
								<span class="styIRS2210DotLn">...........</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:11mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:7mm; ">16
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:11mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AllowedCreditsAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:11mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AllowedCreditsBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:11mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AllowedCreditsCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:11mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AllowedCreditsDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 17 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:8mm;">17
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:8mm;">
							Subtract line 16 from line 15. If zero or less, enter <br/>
								<span style="float:left;">-0-</span>
								<span class="styIRS2210DotLn">...............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:6mm;  border-bottom-width:1px; border-right-width:1px;padding-top:4mm">17
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/NetTaxDueAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/NetTaxDueBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/NetTaxDueCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/NetTaxDueDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 18 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:4mm;">18
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:4mm;">
								<span style="float:left;">Applicable percentage</span>
								<span class="styIRS2210DotLn">.........</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; ">18
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:4mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;">22.5%</div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:4mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;">45%</div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:4mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;">67.5%</div>
							<div class="styLNDesc" style="font-size:7pt; width:26mm; height:4mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:center;">90%</div>
						</div>
						<!-- Line 19 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:4mm;">19
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:4mm;">
								<span style="float:left;">Multiply line 17 by line 18</span>
								<span class="styIRS2210DotLn">........</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm; width:6mm;  border-bottom-width:1px; border-right-width:1px;">19
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:4mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ApplicableTaxDueAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:4mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ApplicableTaxDueBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:4mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ApplicableTaxDueCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:4mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/ApplicableTaxDueDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:16mm;padding-top:9mm;">20</div>
							<div class="styLNDesc" style="width:69mm; border-right-width:1px;height:16mm;">
								<div style="padding-bottom:3mm;font-size:6pt;">
									<b>
										<i>Complete lines 20–25 of one column before going to<br/>line 20 of the next column.</i>
									</b>
								</div>
								Enter the total of the amounts in all previous<span style="float:left;"> columns of line 25</span>
								<span class="styIRS2210DotLn">...........</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:16mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:11mm; ">20</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:16mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; background-color:lightgrey;"/>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:16mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:12mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeInstallAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:16mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:12mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeInstallBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:16mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:12mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeInstallCAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:8mm;">21
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:8mm;">
								Subtract line 20 from line 19. If zero or less, enter <br/>
								<span style="float:left;"> -0-</span>
								<span class="styIRS2210DotLn">..............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:4mm; ">21
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxDueAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxDueBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxDueCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/TaxDueDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 22 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:8mm;">22
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:8mm;">Enter 25% (.25) of line 9 on page 1 of Form 2210 in<span style="float:left;"> each column</span>
								<span class="styIRS2210DotLn">.............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:4mm; ">22
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/InstallmentTaxAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/InstallmentTaxBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/InstallmentTaxCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/InstallmentTaxDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 23 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:8mm;">23
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:8mm;">Subtract line 25 of the previous column from line 24 
								<span style="float:left;">of that column</span>
								<span class="styIRS2210DotLn">............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;width:6mm; height:8mm;  border-bottom-width:1px; border-right-width:1px; padding-top:4mm; ">23
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; background-color:lightgrey; padding-top:4mm;"/>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AccumulatedAdjustedTaxBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AccumulatedAdjustedTaxCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AccumulatedAdjustedTaxDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 24 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:5mm;">24
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:5mm;">
								<span style="float:left;">Add lines 22 and 23</span>
								<span class="styIRS2210DotLn">..........</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:6mm;  border-bottom-width:1px; border-right-width:1px;padding-bottom:0;padding-top:1.5mm">24
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AggregateTaxDueAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AggregateTaxDueBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AggregateTaxDueCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:right;padding-bottom:0;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AggregateTaxDueDAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 25 -->
						<div style="width:187mm;float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:5mm;">25
                            </div>
							<div class="styLNDesc" style="font-size:7pt; width:69mm; border-right-width:1px;height:5mm;">
                                Enter the <b>smaller</b> of line 21 or line 24 here and on 
								<span style="float:left;">Form 2210, Part lV, line 18</span>
								<span class="styIRS2210DotLn">......
                                    <img src="{$ImagePath}/2210_Bullet_Md.gif" alt="MediumBullet"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:8.5mm; width:6mm;  border-bottom-width:0px; border-right-width:1px;padding-bottom:0;padding-top:5mm;">25
                            </div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8.5mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeInstallAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8.5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeInstallBAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8.5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px; text-align:right;padding-bottom:0;padding-top:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeInstallCAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="font-size:6pt; width:26mm; height:8.5mm; border-style: solid; border-color:black; border-top-width:0px; border-left-width:0px;border-right-width:0px; border-bottom-width:0px; text-align:right;padding-bottom:0;padding-top:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210Data/AnnualizedIncomeInstallDAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break -->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
					</div>
					<!-- END Page Break and Footer-->
					<div>
						<!-- Max two occurances -->
						<xsl:variable name="IRS2210SEWSByQtr" select="$Form2210Data/SEWorksheetByQtr"/>
						<xsl:choose>
							<xsl:when test="$IRS2210SEWSByQtr">
								<!--Display Schedule AI Part II when data is available-->
								<xsl:for-each select="$IRS2210SEWSByQtr">
									<xsl:call-template name="SEWSByQtr"/>
								</xsl:for-each>
							</xsl:when>
							<!--Display blank if no results from SEWorksheetByQtr-->
							<xsl:otherwise>
								<xsl:call-template name="SEWSByQtr"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">2210</span> (2016)
                        </div>
					</div>
					<!-- END Page Break and Footer-->
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
							<xsl:with-param name="TargetNode" select="$Form2210Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III, Line 17 - Waived Literal Short Method</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form2210Data/PenaltyAmt/@waivedLiteralShortMethodCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part III, Line 17- Waived Short Method Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form2210Data/PenaltyAmt/@waivedShortMethodAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part IV, Line 27 - Waived Literal Regular Method</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form2210Data/TotalPenaltyAmt/@waivedLiteralRegularMethodCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part IV, Line 27 - Waived Regular Method Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form2210Data/TotalPenaltyAmt/@waivedRegularMethodAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="SEWSByQtr" name="SEWSByQtr">
		<div style="width:187mm;float:none;clear:none;">
			<!-- Part II -->
			<!-- Part || - Header -->
			<div class="styBB" style="width:187mm;height:auto;border-style:solid; border-bottom-width:1px; border-top-width:1px;
          border-right-width:0px; border-left-width:0px;float:left;clear:none;">
				<span class="styPartName" style="height:4mm;width:14mm; font-family:arial; font-size:13;">Part II</span>
				<span style="width:170mm;font-weight:normal;" class="styPartDesc">
					<span style="font-size:10pt;vertical-align:top;"/>
					<b>Annualized Self-Employment Tax </b>(Form 1040 and Form 1040NR filers only)
                                    </span>
			</div>
			<!-- End Part II Header -->
			<!-- Part II body -->
		</div>
		<table class="styTable" cellspacing="0">
			<tr style="width:187mm;float:left;clear:none;">
				<!--Line 26-->
				<td class="styLNLeftNumBox" style="width:7mm; padding-left: 2.25mm; height:8mm;">26</td>
				<td class="styLNDesc" style="font-size:7pt; width:70mm; border-right-width:1px;height:8mm;">Net earnings from self-employment for the period
			        <span style="float:left;">(see instructions)</span>
					<span class="styIRS2210DotLn">...........</span>
				</td>
				<td class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:6mm;border-bottom-width:1px; border-right-width:1px; padding-top:4mm;">26
                </td>
				<td class="styTableCellSmall" style="font-size:6pt;height:8mm; width:26mm;border-color:black; border-left-width:0px; padding-top:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NetSelfEmploymentEarningsAAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="font-size:6pt;height:8mm; width:26mm;border-color:black; border-left-width:0px; padding-top:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NetSelfEmploymentEarningsBAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="font-size:6pt;height:8mm; width:26mm;border-color:black; border-left-width:0px;padding-top:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NetSelfEmploymentEarningsCAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="font-size:6pt;height:8mm; width:26mm;border-color:black; border-left-width:0px;padding-top:4mm;border-right-width:0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NetSelfEmploymentEarningsDAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 27-->
			<tr  style="width:187mm;float:left;clear:none;">
				<td class="styLNLeftNumBox" style="width:7mm; padding-left: 2.25mm;padding-top: 1mm">27
                                    </td>
				<td style="font-size:7pt; width:70mm; border-right-width:1px;height:4mm;">
					<span style="float:left;">Prorated social security tax limit</span>
					<span class="styIRS2210DotLn">.....</span>
				</td>
				<td  class="styLNRightNumBox" style="font-size:7pt;height:5mm;width:6mm;border-bottom-width:1px; border-right-width:1px; padding-top:1mm;float:none;">27
                </td>
		        <td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;float:none;">$29,625</td>
				<td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;float:none;">$49,375</td>
				<td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;float:none;">$79,000</td>
				<td class="styLNDesc" style="font-size:7pt;height:5mm; width:26mm;border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:center;padding-top:1mm;float:none;">$118,500</td>
			</tr>
			<!--Line 28-->
			<tr style="width:187mm;float:left;clear:none;">
				<td class="styLNLeftNumBox" style="width:5mm; padding-left: 2mm; padding-bottom:9mm; height:14mm;">28
                </td>
				<td class="styLNDesc" style="font-size:7pt; width:72mm; border-right-width:1px;height:14mm;padding-left:2mm;">
                    Enter actual wages for the period subject to social<br/>
					security tax or the 6.2% portion of the 7.65%<br/>
					railroad retirement (tier 1) tax. <b>Exception:</b> If you<br/>
					filed Form 4137 or Form 8919, see instructions
				</td>
				<td class="styLNRightNumBox" style="font-size:7pt;height:14mm;width:6mm; border-bottom-width:1px; border-right-width:1px;padding-top:8mm;float:left;">28
                </td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black;border-left-width:0px; vertical-align:bottom;float:left;height:14mm;padding-top:9mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="SSTRRTWagesAAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:14mm;padding-top:9mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="SSTRRTWagesBAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:14mm;padding-top:9mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="SSTRRTWagesCAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; border-right-width:0px; vertical-align:bottom;float:left;height:14mm;padding-top:9mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="SSTRRTWagesDAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 29-->
			<tr style="width:187mm;float:left;clear:none;">
				<td class="styLNLeftNumBox" style="width:5mm; padding-left: 2.25mm;height:7mm;padding-bottom:3mm;">29
                                    </td>
				<td class="styLNDesc" style="font-size:7pt; width:72mm; border-right-width:1px;height:5mm;padding-left:2mm;">
					<span style="float:left;padding-right:5mm;">Subtract line 28 from line 27. If zero or less, enter </span>
					<span  style="float:left;">-0-</span>
				    <!--Dotted Line-->
				    <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
				</td>
				<td class="styLNRightNumBox" style="font-size:7pt;height:7mm; width:6mm;border-bottom-width:1px; border-right-width:1px; padding-top:1.5mm; ">29
                </td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:7mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NetProratedSSTLimitAAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black;border-left-width:0px; vertical-align:bottom;float:left;height:7mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NetProratedSSTLimitBAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:7mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NetProratedSSTLimitCAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black;border-left-width:0px;border-right-width:0px;vertical-align:bottom;float:left;height:7mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NetProratedSSTLimitDAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 30-->
			<tr style="width:187mm;float:left;clear:none;">
				<td class="styLNLeftNumBox" style="width:5mm; padding-left: 2mm;height:5mm;padding-top:1mm;">30
                </td>
				<td class="styLNDesc" style="font-size:7pt; width:72mm; border-right-width:1px;height:5mm;padding-left:2mm;">
					<span style="float:left;">Annualization amounts</span>
					<span class="styIRS2210DotLn">.........</span>
				</td>
				<td class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:6mm;border-bottom-width:1px; border-right-width:1px; padding-top:1mm;">30
                </td>
				<td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;">0.496</td>
				<td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;">0.2976</td>
				<td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;">0.186</td>
				<td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:center;padding-top:1mm;">0.124</td>
			</tr>
			<!--Line 31-->
			<tr style="width:187mm;float:left;clear:none;">
				<td class="styLNLeftNumBox" style="width:5mm; padding-left: 2mm;height:5mm;padding-bottom:0mm;padding-top:1mm;">31
                                    </td>
				<td class="styLNDesc" style="font-size:7pt; width:72mm; border-right-width:1px;height:4mm;padding-left:2mm;">
					<span style="float:left;">Multiply line 30 by the <b>smaller</b> of line 26 or line 29</span>
					<span class="styIRS2210DotLn"/>
				</td>
				<td class="styLNRightNumBox" style="font-size:7pt;height:5mm;width:6mm;border-bottom-width:1px; border-right-width:1px; padding-top:1.5mm;">31
                                    </td>
				<td class="styTableCellSmall" style="width:26mm;border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:5mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedSSTRRTWagesAAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm;border-color:black; border-left-width:0px;vertical-align:bottom;height:5mm;float:left;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedSSTRRTWagesBAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;height:5mm;float:left;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedSSTRRTWagesCAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm;border-color:black;border-left-width:0px;border-right-width:0px;vertical-align:bottom;float:left;height:5mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedSSTRRTWagesDAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 32-->
			<tr style="width:187mm;float:left;clear:none;">
				<td class="styLNLeftNumBox" style="width:5mm; padding-left: 2.25mm;height:5mm;">32
                                    </td>
				<td class="styLNDesc" style="font-size:7pt; width:72mm; border-right-width:1px;height:4mm;padding-left:2mm;">
					<span style="float:left;">Annualization amounts</span>
					<span class="styIRS2210DotLn">........</span>
				</td>
				<td class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:1mm; ">32
                                    </td>
				<td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; ;border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;">0.116</td>
				<td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;">0.0696</td>
				<td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px; text-align:center;padding-top:1mm;">0.0435</td>
				<td class="styLNDesc" style="font-size:7pt; width:26mm; height:5mm; border-style: solid; border-color:black; border-top-width:0px;border-left-width:0px; border-right-width:0px; border-bottom-width:1px; text-align:center;padding-top:1mm;">0.029</td>
			</tr>
			<!--Line 33-->
			<tr style="width:187mm;float:left;clear:none;">
				<td class="styLNLeftNumBox" style="width:5mm; padding-left: 2.25mm;height:5mm;">33
                </td>
				<td class="styLNDesc" style="font-size:7pt; width:72mm; border-right-width:1px;height:5mm;padding-left:2mm;">
					<span style="float:left;">Multiply line 26 by line 32</span>
					<span class="styIRS2210DotLn">.......</span>
				</td>
				<td class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:6mm;  border-bottom-width:1px; border-right-width:1px; padding-top:1.8mm; ">33
                </td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:5mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedNetSEEarningsAAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:5mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedNetSEEarningsBAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:5mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedNetSEEarningsCAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; border-right-width:0px; vertical-align:bottom;float:left;height:5mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedNetSEEarningsDAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 34-->
			<tr style="width:187mm;float:left;clear:none;">
				<td class="styLNLeftNumBox" style="width:5mm;padding-left: 2mm;height:9mm; border-bottom-width:1px; border-color:black; border-style:solid; border-left-width:0px; border-right-width:0px; border-top-width:0px;padding-bottom:3mm;">34
                                    </td>
				<td class="styLNDesc" style="font-size:7pt; width:72mm; border-bottom-width:1px; border-color:black; border-style:solid; border-left-width:0px; border-right-width:0px; border-top-width:0px; height:9mm;padding-left:2mm;">
					<span  style="float:left;padding-right:10mm;">Add lines 31 and 33. Enter here and on line</span> 
					<span style="float:left;"> 13 above</span>
					<span class="styIRS2210DotLn">...........
                    <img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/>
					</span>
				</td>
				<td class="styLNRightNumBox" style="font-size:7pt;height:9mm; width:6mm;  border-bottom-width:0px; border-right-width:1px; border-bottom-width:1px;padding-top:5.3mm;">34
                </td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:9mm;padding-top:5.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedSelfEmploymentTxAAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:9mm;padding-top:5.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedSelfEmploymentTxBAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; vertical-align:bottom;float:left;height:9mm;padding-top:5.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedSelfEmploymentTxCAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellSmall" style="width:26mm; border-color:black; border-left-width:0px; border-right-width:0px; vertical-align:bottom;float:left;height:9mm;padding-top:5.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AnnualizedSelfEmploymentTxDAmt"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
