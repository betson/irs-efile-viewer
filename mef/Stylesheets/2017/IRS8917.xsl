<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
	<!ENTITY nbsp "&#160;">
	<!ENTITY bull "&#8226;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8917Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8917Data" select="$RtnDoc/IRS8917"/>
	<!-- tallest box on the form was beside 5 lines of text and was 21mm tall -->
	<xsl:variable name="lineHeight" select="21 div 5"/>
	<!-- estimate of 1px line height or width in mm is 0.22 -->
	<xsl:variable name="borderWidth" select="0.17"/>
	<xsl:variable name="borderWidth35" select="0.35"/>
	<xsl:variable name="pageWidth" select="187"/>
	<xsl:variable name="greyColor" select="'lightgrey'"/>
	<xsl:variable name="widths">
		<!-- lnbox = left number box, rnbox = right number box
         rcbox = right cents box, rbox = total width of right boxes
         rinbox = total width of inner-level right boxes (e.g. lines 13 or 14) -->
		<rec linetype="StdLn" lnbox="10" rnbox="7.5" rcbox="0" rbox="41" rinbox="40.5"/>
	</xsl:variable>
	<xsl:variable name="standardLine" select="'StdLn'"/>
	<xsl:variable name="debuggingColors" select="false()"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8917Data)"/>
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
				<meta name="Description" content="IRS Form 8917"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- Updated 5/22/2015 Per UWR161153 for R9.6 D2-->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8917Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if> 
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8917">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:{$pageWidth}mm;border-bottom:{$borderWidth35}mm solid">
						<div class="styFNBox" style="width:31mm;height:19.5mm;padding-bottom:0mm;border-right:{$borderWidth35}mm solid">
                            Form<span style="width:1mm;"/>
							<span class="styFormNumber">8917</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8917Data"/>
							</xsl:call-template>
							<div class="styAgency" style="padding-top:0mm;height:0mm;padding:bottom:0mm;">
                                Department of the Treasury<br/>
						        Internal Revenue Service
                            </div>
						</div>
						<div class="styFTBox" style="width:125mm;height:18mm;">
							<div class="styMainTitle" style="height:4.5mm;padding:bottom:0mm;padding-top:2px;">Tuition and Fees Deduction<br/>
							</div>
							<div class="styFBT" style="font-size:7.5pt;height:5mm;padding-top:1px;">
								<br/>
								<img src="{$ImagePath}/8917_Bullet.gif" alt="Bullet Image"/>Attach to Form 1040 or Form 1040A.<br/>
								<img src="{$ImagePath}/8917_Bullet.gif" alt="Bullet Image"/>
								<span style="font-weight:boldl;">Go to <i> www.irs.gov/Form8917 </i> for the latest information.</span>
									
							<!--		<a href="http://www.IRS.gov/form8917">www.irs.gov/form8917</a> 
							
								<span style="font-weight:normal;">.</span> -->
							</div>
						</div>
						<div class="styTYBox" style="width:31mm;height:19.5mm;border-left:{$borderWidth35}mm solid;">
								<div class="styOMB" style="padding-top:0mm;border-bottom:1 solid black;font:7pt;height:4mm;">OMB No. 1545-0074</div>
								<div class="styTaxYear">20<span class="styTYColor">17</span></div>
								<div style="margin-left:3mm; text-align:left;">
									Attachment<br/>Sequence No. <span class="styBoldText">60</span>
								</div>
							</div>
					</div>
					<!-- Name(s)  -->
					<div class="styBB" style="width:{$pageWidth}mm;border-bottom:{$borderWidth35}mm solid">
						<div class="styFNBox" style="width:{$pageWidth - 46}mm; height:8mm">
                            Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<div style="line-height:100%; font-family:verdana;font-size:7.5pt"/>
						</div>
						<b> Your social security number</b>
						<br/>
						<span style="width:30mm;text-align:center;">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Caution header -->
					<div style="width:{$pageWidth}mm;height:12.45mm;border-bottom:{$borderWidth}mm solid;line-height:normal;position:relative;clear:all;">
						<img alt="CAUTION" src="{$ImagePath}/Caution12.73x12.45mm.png" style="width:12.73mm;height:12.45mm;position:absolute"/>
						<span style="height:12mm;padding-top:2mm;padding-left:15.73mm;font-size:7.5pt">
							<em>You <b>cannot</b> take both an education credit from Form 8863 and the tuition and fees deduction from this form for the<br/>
								<b>same student</b> for the same tax year.</em>
						</span>
					</div>
					<!-- Before you begin header -->
					<div style="width:{$pageWidth}mm;height:auto;border-bottom:1px solid black;padding:0.8mm;padding-bottom:0mm;padding-right:0mm;">
						<span style="font-size:8.5pt;font-style:italic;font-weight:bold;width:38mm;height:auto;float:left">Before you begin:</span>
						<span style="font-size:7pt;height:auto">
							<span style="width:5mm">
								<img alt="Checkmark" src="{$ImagePath}/Checkmark2.76x2.54mm.png" style="width:2.76mm;height:2.54mm"/>
							</span>To see if you qualify for this deduction, see <i>Who Can Take the Deduction</i> in the instructions below.<br/>
							<span style="width:5mm">
								<img alt="Checkmark" src="{$ImagePath}/Checkmark2.76x2.54mm.png" style="width:2.76mm;height:2.54mm"/>
							</span>If you file Form 1040, figure any write-in adjustments to be entered on the dotted line next to Form<br/>
							<span style="width:5mm"/>1040, line 36. See the 2017 Form 1040 instructions for line 36.
						</span>
						<!-- button display logic -->
			<!--			<div class="styGenericDiv" style="float:right;height:1mm;padding-top:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8917Data/Student"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'Studentctn' "/>
							</xsl:call-template> -->
							<!-- end button display logic 
						</div> -->
					</div>
					<!-- Part I - Body -->
					<!-- Line 1 -->
					<div class="" style="width:187.5mm;">
										

						<div class="styLNLeftNumBoxSD" style="float:left;clear:none;width:1mm;">1</div>
						<div class="styTableContainer" id="Studentctn" style="width:179mm;clear:none;float:right;height:auto;">
							<!--					  -->
							<!-- print logic -->
							<!--
					  <xsl:call-template name="SetInitialState"/>-->
							<!-- end -->
							<table class="styTable" style="font-size:7pt;width:179mm;height:auto;border-color:black;border-collapse:collapse;">
								<thead class="styTableThead" style="vertical-align:top;">
									<tr>
										<th scope="col" class="styTableCellHeader" style="font-weight:normal;width:100mm;padding-top:1mm;">
											<b>(a)</b> Student's name (as shown on page 1 of your tax return)<br/>
											<br/>
											<span style="float:left">First name</span>
											<span style="width:25mm"/>Last name
								</th>
										<th scope="col" class="styTableCellHeader" style="font-weight:normal;width:53mm;padding:1mm 4px;">
											<b>(b)</b> Student's social security number (as shown on page 1 of your tax return)
								</th>
										<th scope="col" class="styTableCellHeader" style="font-weight:normal;width:40mm;padding:1mm 4px;border-right:none;">
											
							
											<b>(c)</b> Adjusted qualified expenses (see instructions)<br/>
											<!-- button display logic -->
						<div class="styGenericDiv" style="float:right;height:1mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8917Data/Student"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'Studentctn' "/>
							</xsl:call-template>
								</div>
							<!-- end button display logic -->				
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($Form8917Data/Student) &lt;= 3)">
										<xsl:for-each select="$Form8917Data/Student">
											<tr>
												<td class="styTableCellText" style="width:auto;">&#160;
											<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StudentName/PersonFirstNm"/>
													</xsl:call-template>
													<span style="width:10px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StudentName/PersonLastNm"/>
													</xsl:call-template>
													<span style="width:4px;"/>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Student Name Control</xsl:with-param>
														<xsl:with-param name="TargetNode" select="StudentNameControlTxt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="text-align:center;width:auto;">
													<xsl:choose>
														<xsl:when test="StudentSSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="StudentSSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AppliedForEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCell" style="width:auto;border-right:none;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AdjustedQualifiedExpensesAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="count($Form8917Data/Student) &lt; 1 or (($Print = $Separated) and (count($Form8917Data/Student) &gt; 3))">
										<tr>
											<td class="styTableCellCtr" style="width:auto;">&#160;
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8917Data/Student"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:auto;">
										&#160;
									</td>
											<td class="styTableCell" style="width:auto;border-right:none;">
										&#160;
									</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8917Data/Student) &lt; 2 or (($Print = $Separated) and (count($Form8917Data/Student) &gt; 3))">
										<tr>
											<td class="styTableCellText">
										&#160;
									</td>
											<td class="styTableCell">
										&#160;
									</td>
											<td class="styTableCell" style="border-right:none;">
										&#160;
									</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8917Data/Student) &lt; 3 or (($Print = $Separated) and (count($Form8917Data/Student) &gt; 3))">
										<tr>
											<td class="styTableCellText" style="border-bottom:none">
										&#160;
									</td>
											<td class="styTableCell" style="border-bottom:none">
										&#160;
									</td>
											<td class="styTableCell" style="border-right:none; border-bottom:none">
										&#160;
									</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!--</div>-->
						<!-- button display logic -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form8917Data/Student"/>
							<xsl:with-param name="containerHeight" select="3"/>
							<xsl:with-param name="containerID" select=" 'Studentctn' "/>
						</xsl:call-template>
						<!-- end button display logic -->
					</div>
					<!-- Line 2 -->
					<div class="" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:auto;padding-top:4mm;">2</div>
						<div class="styLNDesc" style="width:138.3mm;height:auto;padding-top:4mm;">
							<span style="float:left;">Add the amounts on line 1, column (c), and enter the total</span>
							<span class="styIRS8917DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;padding-top:4mm;">2</div>
						<div class="styLNAmountBox" style="height:auto;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8917Data/TotalQualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">3</div>
						<div class="styLNDesc" style="width:98.3mm;height:8mm;padding-top:4mm;">
							Enter the amount from Form 1040, line 22, or Form 1040A, line 15
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">3</div>
						<div class="styLNAmountBox" style="padding-right:2px;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8917Data/TotalIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;"/>
						<div class="styLNAmountBoxNBB" style="height:8mm;"/>
					</div>
					<!-- Line 4 -->
					<div class="" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:auto;padding-top:4mm;">4</div>
						<div class="styLNDesc" style="width:98.3mm;height:auto;padding-top:4mm;">
							Enter the total from either:<br/>
							<br/>
							&#8226; Form 1040, lines 23 through 33, plus any write-in adjustments <br/>
							entered on the dotted line next to Form 1040, line 36, <b>or</b>
							<br/>
							<br/>
							<span style="float:left;">&#8226; Form 1040A, lines 16 through 18.</span>
							<span class="styIRS8917DotLn">............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:19.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:19.5mm;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:19.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:19.5mm;"/>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8917Data/TuitionAndFeesDedOthCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:9.4mm;"/>
						<div class="styLNAmountBoxNBB" style="height:9.4mm;"/>
					</div>
					<!-- Line 5 -->
					<div class="" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:auto;padding-top:4mm;">5</div>
						<div class="styLNDesc" style="width:138.3mm;height:auto;padding-top:4mm;">
							Subtract line 4 from line 3.* If the result is more than $80,000 ($160,000 if married filing jointly), <br/>
							<span style="float:left;">
								<b>stop</b>; you cannot take the deduction for tuition and fees</span>
							<span class="styIRS8917DotLn">..............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm;"/>
						<div class="styLNAmountBoxNBB" style="height:7mm;"/>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8917Data/TuitionAndFeesDedIncmLessCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:138.3mm;">
							*If you are filing Form 2555, 2555-EZ, or 4563, or you are excluding income from Puerto Rico, <br/>
							see <i>Effect of the Amount of Your Income on the Amount of Your Deduction</i> in Pub. 970, chapter <br/>
							6, to figure the amount to enter on line 5.
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:11mm;"/>
						<div class="styLNAmountBoxNBB" style="height:11mm;"/>
					</div>
					<!-- Line 6 -->
					<div class="" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:12mm;padding-top:4mm;">6</div>
						<div class="styLNDesc" style="width:138.3mm;height:16mm;padding-top:4mm;">
							<b>Tuition and fees deduction.</b> Is the amount on line 5 more than $65,000 ($130,000 if married <br/>
							filing jointly)?<br/>
							<span style="width:75mm;float:left;">
							  <xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form8917Data/TuitionAndFeesDedMoreLimitInd"/>
							 </xsl:call-template>	
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8917Data/TuitionAndFeesDedMoreLimitInd"/>
										<xsl:with-param name="BackupName" select="'IRS8917TuitionAndFeesDedMoreLimitInd'"/>
									</xsl:call-template>								
								</input>
								<span style="width:2mm"/>
								<label style="width:10mm;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8917Data/TuitionAndFeesDedMoreLimitInd"/>
										<xsl:with-param name="BackupName" select="'IRS8917TuitionAndFeesDedMoreLimitInd'"/>
									</xsl:call-template>
									<b>Yes.</b>
								</label>
								Enter the smaller of line 2, or $2,000.
								<br/>
								<br/>
							  <xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form8917Data/TuitionAndFeesDedMoreLimitInd"/>
							 </xsl:call-template>	
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8917Data/TuitionAndFeesDedMoreLimitInd"/>
										<xsl:with-param name="BackupName" select="'IRS8917TuitionAndFeesDedMoreLimitInd'"/>
									</xsl:call-template>
								</input>
								<span style="width:2mm"/>
								<label style="width:10mm;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8917Data/TuitionAndFeesDedMoreLimitInd"/>
										<xsl:with-param name="BackupName" select="'IRS8917TuitionAndFeesDedMoreLimitInd'"/>
									</xsl:call-template>
									<b>No.</b>
								</label>
								Enter the smaller of line 2, or $4,000.
								
							</span>
							<span style="float:left;">
								<img alt="Curly brace" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" height="33" width="8"/>
							</span>
							<span class="styIRS8917DotLn">
								<br/>..............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:13.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:13.5mm;"/>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8917Data/TuitionAndFeesDedAmt"/>
							</xsl:call-template>
						</div>
						
					</div>
					<div class="" style="padding-top:5mm;width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc">
							<b>Also enter</b> this amount on Form 1040, line 34, or Form 1040A, line 19.
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;margin-top:1mm;border-top:1px solid black;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
							<span style="width:13mm;"/>                        
				        Cat. No. 37728P
			        </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
				        Form <span class="styBoldText" style="font-size:8pt;">8917</span> (2017)
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
							<xsl:with-param name="TargetNode" select="$Form8917Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:if test="($Print != $Separated) or (count($Form8917Data/Student) &lt;= 3)">
							<xsl:for-each select="$Form8917Data/Student">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I, Line 1 - Student <xsl:number value="position()" format="1"/> Name Control</xsl:with-param>
									<xsl:with-param name="TargetNode" select="StudentNameControlTxt"/>
									<xsl:with-param name="DescWidth" select="100"/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:if>
					</table>
					<!-- END Left Over Table -->
					<!-- Begin Separated Repeating data table for DependentInformations -->
					<xsl:if test="($Print = $Separated) and (count($Form8917Data/Student) &gt; 3)">
						<span class="styRepeatingDataTitle">Form 8917 Line 1 - Students</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="text-align:center;width:100mm;">
										<span style="font-weight:bold;">(a)</span>
										<span class="styNormalText"> Student's name (as shown on page 1 of your tax return)</span>
										<br/>
										<br/>
										<br/>
										<span class="styNormalText" style="width:99mm;text-align:left;">
											<span style="width:22px;"/>
											First name
											<span style="width:100px;"/> 
											Last name
											<span style="width:70px;"/> 
											Name Control
										</span>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:40mm;">
										<span style="font-weight:bold;">(b)</span>
										<span class="styNormalText">
											Student's social security number (as shown on page 1 of your tax return)
										</span>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:40mm;">
										<span style="font-weight:bold;">(c)</span>
										<span class="styNormalText">
											Adjusted qualified expenses (see instructions)
										</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form8917Data/Student">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:120mm;">
											<div style="float:left;clear:none;width:6mm;">
												<span style="text-align:right;float:left;width:4.25mm;font-weight:bold;" class="styGenericDiv">
													<xsl:number value="position()" format="1"/>
												</span>
											</div>
											<div style="padding-left:1mm;float:left;clear:none;width:94mm;">
												<span style="width:40mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StudentName/PersonFirstNm"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentFirstName</xsl:with-param>
													</xsl:call-template>
												</span>
												<span style="width:5px;"/>
												<span style="width:40mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StudentName/PersonLastNm"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentLastName</xsl:with-param>
													</xsl:call-template>
												</span>
												<span style="width:4px;"/>
												<span style="width:4mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StudentNameControlTxt"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentNameControl</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<td class="styTableCellText" style="text-align:center;width:40mm;">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="StudentSSN"/>
												<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentSSN</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:40mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustedQualifiedExpensesAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating Dependent data table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
