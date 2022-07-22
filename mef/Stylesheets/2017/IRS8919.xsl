<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8919Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8919Data" select="$RtnDoc/IRS8919"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8919Data)"/>
					</xsl:call-template>
				</title>
				<!-- Remove this later -->
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8919"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8919Style"/>
						<xsl:call-template name="AddOnStyle"/>
				</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="margin-bottom:10px">
				<form name="Form8919">
					<xsl:call-template name="DocumentHeader"/>
						<!-- Begin Form Number and Name -->
						<div class="styBB" style="width:187mm;">
							<div class="styFNBox" style="width:25mm;height:20mm;border-right:none;vertical-align:bottom;">
								Form <span class="styFormNumber">8919</span>
								<div style="padding-top:1mm;">
									<br/>
									<span class="styAgency">Department of the Treasury</span>
									<br/>
									<span class="styAgency">Internal Revenue Service</span>
								</div>
							</div>
							<div class="styFTBox" style="width:135mm;border-right:1px solid black;border-left:1px solid black;height:20mm;padding-top:2mm;">
								<div class="styMainTitle">	
									Uncollected Social Security and<br/>   
									Medicare Tax on Wages
								</div>
								<div class="styFBT" style="height:4mm;margin-top:0mm;padding-top:1mm;">
									<img src="{$ImagePath}/2106EZ_Bullet.gif" alt="Bullet Image"/>Go to <i><a href="http://www.irs.gov/form8919">www.irs.gov/Form8919</a></i> for instructions and the latest information.<br/>
									<img src="{$ImagePath}/2106EZ_Bullet.gif" alt="Bullet Image"/>
										Attach to your tax return.    
								</div>
							</div>
							<div class="styTYBox" style="width:25.5mm;border-left:none;padding-top:.5mm;">
								<div class="styOMB" style="height:4mm;">OMB No. 1545-0074</div>
								<div class="styTaxYear">20<span class="styTYColor">17</span></div>
								<div style="margin-left:3mm; text-align:left;">
									Attachment<br/>Sequence No. <span class="styBoldText">61</span>
								</div>
							</div>
						</div>					
						<!-- End Form Number and Name section -->
					
						<!-- Begin Name and Identifying number section -->
						<div class="styBB" style="width:187mm;">
							<div class="styNameBox" style="width:145mm;height:9mm;font-size:7pt;">
							Name of person who must file this form. If married, complete a separate Form 8919 for each spouse who must file this form.<br/>
								<div style="font-family:verdana;font-size:7pt;padding-top:0mm;">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="$Form8919Data/PersonNm"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styEINBox" style="width:41mm;height:9mm;padding-left:2mm;font-size:7pt;">
								Social security number<br/>
								<span style="font-weight:normal;text-align:center;width:34mm;padding-top:2.5mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form8919Data/SSN"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- End Names and Identifying number section -->
						
						<!-- Begin Who Must File section -->
						<div class="styBB" style="width:187mm;">
							<div class="styWhoMustFileBox" style="width:171mm;height:auto;font-size:7pt;">
								<b>Who Must File.</b> You must file Form 8919 if <b>all</b> of the following apply.			                <span style="width:5mm;"></span>
									<span style="font-size:7pt;">
									<li style="margin-left:25mm;">You performed services for a firm.</li>
									<li style="margin-left:25mm;">You believe your pay from the firm wasn't for services as an independent contractor.</li>
									<li style="margin-left:25mm;">The firm didn't withhold your share of social security and Medicare taxes from your pay.</li>
									<li style="margin-left:25mm;">One of the reasons listed below under <i>Reason codes</i> apply to you.</li>
									</span>
							</div>
						</div>
						<!-- End Who Must File section -->
				
						<!-- Begin Reason Code section -->
						<div class="styBB" style="width:187mm;border-bottom:none;">
							<div class="styReasonCodeBox" style="width:187mm;height:auto;font-size:7pt;">
								<b>Reason codes:  </b><span style="font-size:7pt;">
										For each firm listed below, enter in column (c) the applicable reason code for filing this form. If none of the</span><br/>
										<span style="margin-left:21mm;font-size:7pt;">reason codes apply to you, but you believe you should have been treated as an employee, enter reason</span><br/>
										<span style="margin-left:21mm;font-size:7pt;">code G, and <b>file Form SS-8 on or before the date you file your tax return.</b></span>
										<br/><br/>
							</div>
							<div class="styCodes" style="width:187mm; height:auto;font-size:7.5pt;padding-left:20mm;">
								<span style="width:5.2mm;font-weight:bold;float:left;">A</span>
								<span style="width:161mm;float:left;">
									I filed Form SS-8 and received a determination letter stating that I am an employee of this firm.
								</span>
								<!--<br/><br/>
								<span style="width:5.2mm;font-weight:bold;float:left;">B</span>
								<span style="width:161mm;float:left;">
									I was designated as a "section 530 employee" by my employer or by the IRS prior to January 1, 1997.
								</span>-->
								<br/><br/>
								<span style="width:5.2mm;font-weight:bold;float:left;">C</span>
								<span style="width:161mm;float:left;">
									I received other correspondence from the IRS that states I am an employee.
								</span>
								<!--<br/><br/>
								<span style="width:5.2mm;font-weight:bold;float:left;">D</span>
								<span style="width:161mm;float:left;">
									I was previously treated as an employee by this firm and am performng services in a substantially similar capacity and under substantially similar direction and control. (You must also enter reason code G.)
								</span>
								<br/><br/>
								<span style="width:5.2mm;font-weight:bold;float:left;">E</span>
								<span style="width:161mm;float:left;">
									My co-workers, performing substantially similar services under substanitally similar direction and control, are treated as employees. (You must also enter reason code G.)
								</span>
								<br/><br/>-->
					<!--			<span style="width:5.2mm;font-weight:bold;float:left;">F<br/></span>
								<span style="width:161mm;float:left;">
									My co-workers, performing substantially similar services under substanitally similar direction and control, filed Form SS&#8209;8 for this firm and received a determination that they were employees. (You must also enter reason code G.)
								</span>-->
								<br/><br/>
								<span style="width:5.2mm;font-weight:bold;float:left;">G</span>
								<span style="width:161mm;float:left;">
									I filed Form SS-8 with the IRS and haven't received a reply.
								</span>
								<br/><br/>
								<span style="width:5.2mm;font-weight:bold;float:left;">H</span>
								<span style="width:161mm;float:left;">
									I received a Form W-2 and a Form 1099-MISC from this firm for 2017. The amount on Form 1099-MISC should have been included as wages on Form W-2. <b>(Don't file Form SS-8 if you select reason code H.)</b>
								</span>
								
							</div>
						</div>
						<!-- End Reason Code section -->
					
						<!-- BEGIN Table -->
						<div class="styBB" style="width:187mm;border-bottom-width:0px;"/>
								<div class="styGenericDiv" style="width:5mm;float:right;">
									
										<!-- button display logic -->
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$Form8919Data/UncollectedSocSecMedTaxPerFirm"/>
											<xsl:with-param name="containerHeight" select="5"/>
											<xsl:with-param name="containerID" select=" 'FirmDiv' "/>
										</xsl:call-template>
										
										<!-- end button display logic -->
								</div>
								<!--Lines 1-5-->
								<div class="styTableContainer" id="FirmDiv" style="border-bottom-width: 1px;height:auto;width:187mm;border-top-width: 1px;">
									<xsl:call-template name="SetInitialState"/>
									<table class="styTable" style="font-size:7pt;border-color:black;height:auto;" cellspacing="0">
										<thead class="styTableThead">
											<xsl:call-template name="CreateTableHeaders1"/>
										</thead>
										<tfoot/>
										<tbody>									
											<xsl:for-each select="$Form8919Data/UncollectedSocSecMedTaxPerFirm">
												<!-- If the print parameter is not set to be Separated, or there are less elements than the container height (5), execute-->
												<xsl:if test="($Print != $Separated) or (count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &lt;=5)">
													<xsl:call-template name="CreateTableRows1"/>
												</xsl:if>
											</xsl:for-each>
											<!-- Table Filler Rows -->
											<xsl:if test="count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &lt; 1 or ((count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &gt;5) and ($Print = $Separated))">
												<xsl:call-template name="CreateEmptyTableRows">
													<xsl:with-param name="Number">1</xsl:with-param>
													<xsl:with-param name="InsertAdditionalDataMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &lt; 2 or ((count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &gt;5) and ($Print = $Separated))">
												<xsl:call-template name="CreateEmptyTableRows">
													<xsl:with-param name="Number">2</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &lt; 3 or ((count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &gt;5) and ($Print = $Separated))">
												<xsl:call-template name="CreateEmptyTableRows">
													<xsl:with-param name="Number">3</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &lt; 4 or ((count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &gt;5) and ($Print = $Separated))">
												<xsl:call-template name="CreateEmptyTableRows">
													<xsl:with-param name="Number">4</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &lt; 5 or ((count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &gt;5) and ($Print = $Separated))">
												<xsl:call-template name="CreateEmptyTableRows">
													<xsl:with-param name="Number">5</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</tbody>
									</table>
							</div>
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form8919Data/UncollectedSocSecMedTaxPerFirm"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'FirmDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
						
						<!--  Line 6-->
						<div  style="width:187mm; ">
							<div class="styLNLeftNumBoxSD" style="height:auto;padding-top:1mm;"> 6</div>
							<div class="styLNDesc" style="width:139.60mm;height:auto;float:left;padding-top:1mm;">
								 <b>Total Wages.</b> Combine lines 1 through 5 in column (f). Enter here and include on Form 1040,<br/>
								 <span style="float:left;">line 7; Form 1040NR, line 8; or Form 1040NR-EZ, line 3</span>
								<!--Dotted Line-->
								<span style="float:right;padding-right:3mm;letter-spacing:3.5mm;font-weight:bold;">..............</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:7mm;height:auto;padding-top:4mm;border-bottom-width: 1px;">6</div>
							<div class="styLNAmountBox" style="height:auto;width:32mm;font-size:7pt;padding-top:4mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8919Data/TotalWagesWithNoWithholdingAmt"/>
								</xsl:call-template>
							</div>
						</div>
						
						<!--  Line 7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:auto;padding-top:1mm;"> 7</div>
							<div class="styLNDesc" style="width:100.75mm;float:left;height:auto;padding-top:1mm;">
								<span style="float:left;">Maximum amount of wages subject to social security tax</span>
								<!--Dotted Line-->
								<span style="float:right;padding-right:2.2mm;letter-spacing:3.5mm;font-weight:bold;">.....</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:7mm;height:auto;padding-top:1mm;border-bottom-width: 1px;">7</div>
							<div class="styLNAmountBox" style="height:auto;width:32mm;font-size:7pt;padding-top:1mm;border-bottom-width: 1px;">
								<i>127,200</i>
							</div>
							<div style="float:left;width:7.05mm;height:auto;background-color:lightgrey;border-left:1px solid black;border-right:1px solid black;padding-top:4.7mm;"/>
						</div>
						
						<!--Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:auto;padding-top:1mm;"> 8</div>
							<div class="styLNDesc" style="width:100.75mm;float:left;height:auto;padding-top:1mm;">
								Total social security wages and social security tips (total of boxes 3<br/>
								and 7 on Form(s) W-2), railroad retirement (RRTA) compensation<br/>
								(subject to the 6.2% rate), and unreported tips subject to social<br/>
								<span style="float:left;">security tax from Form 4137, line 10. See instructions</span>
								
								<!--Dotted Line-->
								<span style="float:right;padding-right:2.2mm;letter-spacing:3.5mm;font-weight:bold;">......</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:7mm;height:auto;padding-top:10mm;border-bottom:1px solid black;">8</div>
							<div class="styLNAmountBox" style="height:auto;width:32mm;font-size:7pt;padding-top:10mm;border-bottom-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8919Data/TotalWagesAndUnreportedTipsAmt"/>
									</xsl:call-template>
							</div>
							<div style="float:left;width:7.05mm;height:auto;padding-top:14mm;background-color:lightgrey;border-left:1px solid black;border-right:1px solid black;"/>
						</div>
						
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:auto;padding-top:1mm">9</div>
							<div class="styLNDesc" style="width:139.60mm;height:auto;float:left;padding-top:1mm;">
								<span style="float:left;">Subtract line 8 from 7. If line 8 is more than line 7, enter -0- here and on line 10</span>
								<!--Dotted Line-->
								<span style="float:right;padding-right:3mm;letter-spacing:3.5mm;font-weight:bold;">.......</span>
							</div>									
							<div class="styLNRightNumBox" style="width:7mm;height:auto;border-bottom-width: 1px;padding-top:1mm">9</div>
							<div class="styLNAmountBox" style="height:auto;width:32mm;font-size:7pt;border-bottom-width:1px;padding-top:1mm;padding-right:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8919Data/NetWagesSubjectToSocSecTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- Line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:auto;padding-top:1mm;padding-left:1mm;">10</div>
							<div class="styLNDesc" style="width:139.60mm;height:auto;float:left;padding-top:1mm;">
								<span style="float:left;">Wages subject to social security tax. Enter the smaller of line 6 or line 9</span>
								<!--Dotted Line-->
								<span style="float:right;padding-right:3mm;letter-spacing:3.5mm;font-weight:bold;">.........</span>
							</div>									
							<div class="styLNRightNumBoxNBB" style="width:7mm;height:auto;padding-top:1mm;border-bottom-width: 1px;">10</div>
							<div class="styLNAmountBox" style="height:auto;width:32mm;font-size:7pt;padding-top:1mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8919Data/WagesSubjectToSSTAmt"/>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:auto;padding-top:1mm;padding-left:1mm;">11</div>
							<div class="styLNDesc" style="width:139.60mm;height:auto;float:left;padding-top:1mm;">
								<span style="float:left;">
									Multiply line 10 by 0.062 (social security tax rate for 2017)
								</span>
									<!--Dotted Line-->
								<span style="float:right;padding-right:3mm;letter-spacing:3.5mm;font-weight:bold;">..............</span>
							</div>									
							<div class="styLNRightNumBoxNBB" style="width:7mm;height:auto;padding-top:1mm;border-bottom-width: 1px;">11</div>
							<div class="styLNAmountBox" style="height:auto;width:32mm;font-size:7pt;padding-top:1mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8919Data/UncollectedSocSecTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:auto;padding-top:1mm;padding-left:1mm;">12</div>
							<div class="styLNDesc" style="width:139.60mm;height:auto;float:left;padding-top:1mm;">
								<span style="float:left;">Multiply line 6 by 0.0145 (Medicare tax rate)</span>
								<!--Dotted Line-->
								<span style="float:right;padding-right:3mm;letter-spacing:3.5mm;font-weight:bold;">..................</span>
							</div>									
							<div class="styLNRightNumBoxNBB" style="width:7mm;height:auto;padding-top:1mm;border-bottom-width: 1px;">12</div>
							<div class="styLNAmountBox" style="height:auto;width:32mm;font-size:7pt;padding-top:1mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8919Data/UncollectedMedicareTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:auto;padding-top:1mm;padding-left:1mm;">13</div>
							<div class="styLNDesc" style="width:139.60mm;height:auto;float:left;padding-top:1mm;">
								<div style="float:left;">Add lines 11 and 12. Enter here and on Form 1040, line 58; Form 1040NR, line 56; or
								Form 1040NR-EZ, line 16. (Form 1040-SS and Form 1040-PR filers, see instructions)
									<!--Dotted Line-->
									<span style="margin-left:3mm;letter-spacing:3.5mm;font-weight:bold;">..........</span>
									<span style="width:5px;"/>
									<span style="margin-left:3mm;"/>
									<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" />
								</div>
							</div>									
							<div class="styLNRightNumBoxNBB" style="width:7mm;height:auto;padding-top:5mm;">13</div>
							<div class="styLNAmountBox" style="height:auto;width:32mm;font-size:7pt;padding-top:5mm;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8919Data/UncollectedSocSecMedTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>

					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm; font-size:7pt;border-top:2px solid black; padding-top:0.5mm;text-align:right;">
					<div style="float:left;">
								  <span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
								  <span style="width:13mm;"/>                        
									Cat. No. 37730B
								</div>
								<div style="float:right;">
								  <span style="width:40px;"/>  
								  Form <span class="styBoldText" style="font-size:8pt;">8919</span> (2017)
								</div>						
					</div>

					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="-1" type="button" value="Return to Form" 
								onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8919Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Additional Data Table -->
						
					</table>		
					<!-- END Left Over Table -->
					
					<!-- Separated Data -->
					<xsl:if test="($Print = $Separated) and (count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &gt; 5)">
						<br/><br/>
						<span class="styRepeatingDataTitle">Form 8919</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<xsl:call-template name="CreateTableHeaders">
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8919Data/UncollectedSocSecMedTaxPerFirm">
									<xsl:call-template name="CreateTableRows">
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>				
					
				</form>
			</body>
		</html>
	</xsl:template>
	
	<!-- ////////////////////////////////////// -->

	<xsl:template name="CreateTableHeaders">
		<tr class="styDepTblHdr">

			<th scope="col" class="styTableCell" style="width:75mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;padding-top:8mm;" colspan="2">
				<b>(a)</b>Name of firm
			</th>
			<th scope="col" class="styTableCell" style="width:32mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;">
				<b>(b)</b>Firm's<br/>federal<br/>identification<br/>number<br/>(see instructions)
			</th>
			<th scope="col" class="styTableCell" style="width:21mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;padding-top:4mm;">
				<b>(c)</b>Enter<br/>reason<br/>code from<br/>above
			</th>
			<th scope="col" class="styTableCell" style="width:33.5mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;">
				<b>(d)</b>Date of IRS<br/>determination or<br/>correspondence<label for="receivedInd"></label>
				<br/>(MM/DD/YYYY)<br/>(see instructions)
			</th>
			<th scope="col" class="styTableCell" style="width:20mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;">
				<b>(e)</b>Check<br/>if Form<br/>1099-MISC<br/>was received
			</th>
			<th scope="col" class="styTableCell" 
				style="width:45mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-right:none;">
				<b>(f)</b>Total wages received<br/>with no social security or<br/>Medicare tax<br/>withholding and not<br/>reported on Form W-2
			</th>
		</tr>
	</xsl:template>
	<xsl:template name="CreateTableRows">
				<tr>
					<xsl:variable name="RowNumber">
						<xsl:number format="1" value="position()"/>
					</xsl:variable>
					<xsl:attribute name="class">
					<xsl:choose>
					<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
					<xsl:otherwise>styDepTblRow2</xsl:otherwise>
					</xsl:choose>
					</xsl:attribute>
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:4mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>		
						<xsl:value-of select="$RowNumber"/>
					</td>
					<!--Employer Name-->
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:66mm;text-align:left;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>						
						<xsl:if test="$Form8919Data/UncollectedSocSecMedTaxPerFirm/EmployerName/BusinessNameLine1Txt">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="EmployerName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$Form8919Data/UncollectedSocSecMedTaxPerFirm/EmployerName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="EmployerName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<span style="width:4px;"/>
						</xsl:if>
					</td>					
					<!--Employer EIN OR Employer SSN OR UnknownTINCd-->
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:31mm;text-align:center;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>
						<xsl:if test="$Form8919Data/UncollectedSocSecMedTaxPerFirm/EmployerEIN">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="EmployerEIN"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$Form8919Data/UncollectedSocSecMedTaxPerFirm/SSN">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="SSN"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$Form8919Data/UncollectedSocSecMedTaxPerFirm/UnknownTINCd">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="UnknownTINCd"/>
							</xsl:call-template>
						</xsl:if>
					</td>
					<!--Reason Code-->
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:20mm;text-align:center;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>
						<xsl:for-each select="UncollectedSocSecMedReasonCd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</xsl:for-each>
					</td>
					<!--Rcvd Date-->
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:32mm;text-align:center;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="CorrespondenceReceivedDt"/>
						</xsl:call-template>
					</td>
					<!--Rcvd Ind-->
					<td class="styTableCell">	
						<xsl:attribute name="style">
							width:20mm;text-align:center;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>
						<span>
						<input class="styCkbox" type="checkbox" alt="Form 1099 Checkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="Form1099ReceivedInd"/>
								<xsl:with-param name="BackupName">Firm<xsl:value-of select="position()"/>Form1099ReceivedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						</span>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="Form1099ReceivedInd"/>
								<xsl:with-param name="BackupName">Firm<xsl:value-of select="position()"/>Form1099ReceivedInd</xsl:with-param>
							</xsl:call-template>
						</label>
						<!--hello<xsl:value-of select="position()"/>-->
					</td>
					<!--Amount-->
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:40mm;border-right:none;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="WagesWithNoWitholdingAmt"/>
						</xsl:call-template>
					</td>
				</tr>
	</xsl:template>
	<xsl:template name="CreateEmptyTableRows">
		<xsl:param name="Number">1</xsl:param>
		<xsl:param name="InsertAdditionalDataMessage"/>
		<tr style="font-size: 7pt;">
			<td class="styTableCell" style="width:3%;font-size:7pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
				<xsl:value-of select="$Number"/>
			</td>
			<!--Employer Name-->
			<td class="styTableCell" style="width:27%;font-size: 7pt; text-align:left;">
				<span style="width:4px"/>
				<xsl:if test="$InsertAdditionalDataMessage">
					<xsl:if test="((count($Form8919Data/UncollectedSocSecMedTaxPerFirm) &gt;5) and ($Print = $Separated))">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8919Data/UncollectedSocSecMedTaxPerFirm"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</td>
			<!--Employer EIN-->
			<td class="styTableCell" style="width:15%;font-size: 7pt; text-align:center;">
				<span style="width:4px"/>
			</td>
			<!--Reason Code-->
			<td class="styTableCell" style="width:15%;font-size: 7pt; text-align:center;">
				<span style="width:4px"/>
			</td>
			<!--Rcvd Date-->
			<td class="styTableCell" style="width:15%;font-size: 7pt; text-align:center;">
				<span style="width:4px"/>
			</td>
			<!--Rcvd Ind-->
			<td class="styTableCell" style="width:5%;font-size: 7pt; text-align:center;">
				<input class="styCkbox" type="checkbox" style="width:4mm;">
					<xsl:attribute name="id">Firm<xsl:value-of select="$Number"/>Form1099ReceivedInd</xsl:attribute>
				</input>
				<label><xsl:attribute name="for">Firm<xsl:value-of select="$Number"/>Form1099ReceivedInd</xsl:attribute></label>
				<span style="width:4px"/>
			</td>
			<!--Amount-->
			<td class="styTableCell" style="width:20%;font-size: 7pt; text-align:center;border-right-width:0px;">
				<span style="width:4px"/>
			</td>			
		</tr>
	</xsl:template>
		<xsl:template name="CreateTableHeaders1">
		<tr class="">

			<th scope="col" class="styTableCell" style="width:75mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;padding-top:8mm;" colspan="2">
				<b>(a)</b>Name of firm
			</th>
			<th scope="col" class="styTableCell" style="width:32mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;">
				<b>(b)</b>Firm's<br/>federal<br/>identification<br/>number<br/>(see instructions)
			</th>
			<th scope="col" class="styTableCell" style="width:21mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;padding-top:4mm;">
				<b>(c)</b>Enter<br/>reason<br/>code from<br/>above
			</th>
			<th scope="col" class="styTableCell" style="width:33.5mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;">
				<b>(d)</b>Date of IRS<br/>determination or<br/>correspondence<label for="receivedInd"></label>
				<br/>(MM/DD/YYYY)<br/>(see instructions)
			</th>
			<th scope="col" class="styTableCell" style="width:20mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;">
				<b>(e)</b>Check<br/>if Form<br/>1099-MISC<br/>was received
			</th>
			<th scope="col" class="styTableCell" 
				style="width:45mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-right:none;">
				<b>(f)</b>Total wages received<br/>with no social security or<br/>Medicare tax<br/>withholding and not<br/>reported on Form W-2
			</th>
		</tr>
	</xsl:template>
	<xsl:template name="CreateTableRows1">
				<tr>
					<xsl:variable name="RowNumber">
						<xsl:number format="1" value="position()"/>
					</xsl:variable>
					<xsl:attribute name="class">
					<!--<xsl:choose>-->
					<!--<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>-->
					<!--<xsl:otherwise>styDepTblRow2</xsl:otherwise>-->
					<!--</xsl:choose>-->
					</xsl:attribute>
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:4mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>		
						<xsl:value-of select="$RowNumber"/>
					</td>
					<!--Employer Name-->
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:66mm;text-align:left;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>						
						<xsl:if test="$Form8919Data/UncollectedSocSecMedTaxPerFirm/EmployerName/BusinessNameLine1Txt">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="EmployerName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$Form8919Data/UncollectedSocSecMedTaxPerFirm/EmployerName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="EmployerName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<span style="width:4px;"/>
						</xsl:if>
					</td>					
					<!--Employer EIN OR Employer SSN OR UnknownTINCd-->
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:31mm;text-align:center;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>
						<xsl:if test="$Form8919Data/UncollectedSocSecMedTaxPerFirm/EmployerEIN">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="EmployerEIN"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$Form8919Data/UncollectedSocSecMedTaxPerFirm/SSN">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="SSN"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$Form8919Data/UncollectedSocSecMedTaxPerFirm/UnknownTINCd">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="UnknownTINCd"/>
							</xsl:call-template>
						</xsl:if>
					</td>
					<!--Reason Code-->
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:20mm;text-align:center;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>
						<xsl:for-each select="UncollectedSocSecMedReasonCd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</xsl:for-each>
					</td>
					<!--Rcvd Date-->
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:32mm;text-align:center;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="CorrespondenceReceivedDt"/>
						</xsl:call-template>
					</td>
					<!--Rcvd Ind-->
					<td class="styTableCell">	
						<xsl:attribute name="style">
							width:20mm;text-align:center;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>
						<span>
						<input class="styCkbox" id="receivedInd" type="checkbox" alt="Form 1099 Checkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="Form1099ReceivedInd"/>
								<xsl:with-param name="BackupName">Firm<xsl:value-of select="position()"/>Form1099ReceivedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						</span>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="Form1099ReceivedInd"/>
								<xsl:with-param name="BackupName">Firm<xsl:value-of select="position()"/>Form1099ReceivedInd</xsl:with-param>
							</xsl:call-template>
						</label>
						<!--hello<xsl:value-of select="position()"/>-->
					</td>
					<!--Amount-->
					<td class="styTableCell">
						<xsl:attribute name="style">
							width:40mm;border-right:none;
							<xsl:if test="(position() &gt; 5) and (position() = last())">
								border-bottom-width:0px;
							</xsl:if>
						</xsl:attribute>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="WagesWithNoWitholdingAmt"/>
						</xsl:call-template>
					</td>
				</tr>
	</xsl:template>
</xsl:stylesheet>
