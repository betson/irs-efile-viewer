<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
	<!ENTITY ndash "&#8211;">
	<!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8992Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8992"/>
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
				<meta name="Description" content="IRS Form 8992"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8992Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8992">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							Form <span class="styFN" style="font-size:18pt;">8992</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<br/>
							(Rev. December 2021)<br/>
							<br/>
							<span class="styAgency">
								Department of the Treasury
								<br/>
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;padding-bottom:2mm;">U.S. Shareholder Calculation of Global Intangible <br/>
							Low-Taxed Income (GILTI)</span>
							<br/>
							<br/>
							<br/>
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8992</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;padding-top:4mm;padding-bottom:4mm;">OMB No. 1545-0123</div>
							<div style="margin-left:0mm;text-align:left;font-size:7pt;padding-top:2mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">992</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;">
							Name of person filing this return <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:1mm;font-weight:normal;">
							<span style="font-weight:bold;padding-right:1mm;">A</span>&nbsp;&nbsp; Identifying number <br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;">
							Name of U.S. shareholder <br/>
							<xsl:choose>
								<xsl:when test="$FormData/ShareholderBusinessName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/ShareholderBusinessName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ShareholderBusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderPersonNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:1mm;font-weight:normal;">
							<span style="font-weight:bold;padding-right:1mm;">B</span> Identifying number <br/>
							<xsl:choose>
								<xsl:when test="$FormData/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:167mm;">
							Net Controlled Foreign Corporation (CFC) Tested Income
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;width:117mm;">
							Sum of Pro Rata Share of Net Tested Income <br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							If the U.S. shareholder is not a member of a U.S. consolidated group, 
							enter the total from Schedule A (Form 8992), line 1, column (e).  <br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							If the U.S. shareholder is a member of a U.S. consolidated group, 
							enter the amount from Schedule B (Form 8992), Part II, column (c), that pertains to the U.S. shareholder.
						</div>
						<div class="styGenericDiv" style="height:16mm;width:3mm;text-align:left;padding-top:4px;">
							<img alt="Curly bracket" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" height="56" width="6"/>
						</div>
						<div class="styGenericDiv" style="height:16mm;width:18mm;padding-top:6mm;">
							<span class="sty8992DotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:6.5mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="">1</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumProRataShrNetTestedIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:auto;width:117mm;">
							Sum of Pro Rata Share of Net Tested Loss <br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							If the U.S. shareholder is not a member of a U.S. consolidated group, 
							enter the total from Schedule A (Form 8992), line 1, column (f). <br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							If the U.S. shareholder is a member of a U.S. consolidated group, enter the amount from 
							Schedule B (Form 8992), Part II, column (f), that pertains to the U.S. shareholder.
						</div>
						<div class="styGenericDiv" style="height:16mm;width:3mm;text-align:left;padding-top:4px;">
							<img alt="Curly bracket" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" height="56" width="6"/>
						</div>
						<div class="styGenericDiv" style="height:16mm;width:18mm;padding-top:6mm;">
							<span class="sty8992DotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6.7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:6.7mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="">2</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/SumProRataShrNetTestedLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Net CFC Tested Income. Combine lines 1 and 2. If zero or less, stop here
							<span class="sty8992DotLn">.........</span>
						</div>
						<div class="styLNRightNumBoxNBB">3</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetCFCTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:167mm;">
							Calculation of Global Intangible Low-Taxed Income (GILTI)
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Net CFC Tested Income. Enter amount from Part I, line 3
							<span class="sty8992DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetCFCTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:auto;width:117mm;">
							Deemed Tangible Income Return (DTIR) <br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							If the U.S. shareholder is not a member of a U.S. consolidated group, 
							multiply the total from Schedule A (Form 8992), line 1, 	column (g), by 10% (0.10). <br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							If the U.S. shareholder is a member of a U.S. consolidated group, 
							enter the amount from Schedule B (Form 8992), Part II, column (i), that pertains to the U.S. shareholder.
						</div>
						<div class="styGenericDiv" style="height:16mm;width:3mm;text-align:left;padding-top:4px;">
							<img alt="Curly bracket" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" height="56" width="6"/>
						</div>
						<div class="styGenericDiv" style="height:16mm;width:18mm;padding-top:6mm;">
							<span class="sty8992DotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6.7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:6.7mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="">2</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeemedTangibleIncomeReturnAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="styLNDesc" style="width:83mm;height:auto;">
							Sum of Pro Rata Share of Tested Interest Expense <br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							<span style="display:inline;font-family:Arial;">If the U.S. shareholder is not a member of a U.S. consolidated group, 
							enter the total from Schedule A (Form 8992), line 1, column (j). </span>
							<br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							If the U.S. shareholder is a member of a U.S. consolidated group, leave line 3a blank.
						</div>
						<div class="styGenericDiv" style="height:16mm;width:3mm;text-align:left;padding-top:4px;">
							<img alt="Curly bracket" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" height="56" width="6"/>
						</div>
						<div class="styGenericDiv" style="height:16mm;width:14mm;padding-top:6mm;">
							<span class="sty8992DotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;">
							<br/>
							<br/>3a</div>
						<div class="styLNAmountBox" style="height:10mm;width:30mm;padding-right:2px;">
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedIntExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:10mm;"/>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:30mm;height:8mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:8mm;"/>
					</div>
					<!-- Line 3b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:83mm;height:auto;">
							Sum of Pro Rata Share of Tested Interest Income <br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							<span style="display:inline;font-family:Arial;">If the U.S. shareholder is not a member of a U.S. consolidated group, 
							enter the total from Schedule A (Form 8992), line 1, column (i).</span>
							<br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							If the U.S. shareholder is a member of a U.S. consolidated group, leave line 3b blank.
						</div>
						<div class="styGenericDiv" style="height:16mm;width:3mm;text-align:left;padding-top:4px;">
							<img alt="Curly bracket" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" height="56" width="6"/>
						</div>
						<div class="styGenericDiv" style="height:16mm;width:14mm;padding-top:6mm;">
							<span class="sty8992DotLn">...</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6.7mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="width:30mm;height:6.7mm;"/>
						<div class="styLNRightNumBoxNBB" style="height:6.7mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:6.7mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;">3b</div>
						<div class="styLNAmountBox" style="height:4mm;width:30mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedIntIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11.6mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:11.6mm;"/>
					</div>
					<!-- Line 3c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="height:auto;width:117mm;">
							Specified Interest Expense <br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							If the U.S. shareholder is not a member of a U.S. 
							consolidated group, subtract line 3b from line 3a. If zero or less, enter -0-. <br/>
							<div style="height:3px;display:block;">
								<br/>
							</div>
							If the U.S. shareholder is a member of a U.S. consolidated group, enter the 
							amount from Schedule B (Form 8992), Part II, column (m), that pertains to the U.S. shareholder.
						</div>
						<div class="styGenericDiv" style="height:16mm;width:3mm;text-align:left;padding-top:4px;">
							<img alt="Curly bracket" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" height="56" width="6"/>
						</div>
						<div class="styGenericDiv" style="height:16mm;width:18mm;padding-top:6mm;">
							<span class="sty8992DotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6.7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:6.7mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="">3c</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SpecifiedInterestExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Net DTIR. Subtract line 3c from line 2. If zero or less, enter -0-
							<span class="sty8992DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetDTIRAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							GILTI. Subtract line 4 from line 1
							<span class="sty8992DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBoxNBB">5</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GILTIReceivedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:25mm;">Cat. No. 37816Y</span>
						<span style="float:right;">Form <strong>8992</strong> (Rev. 12-2021)</span>
					</div>
					
					<br></br>
					<br></br>
					
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
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
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillTableCols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="10"/>
		<tr>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:2px;">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTableCols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTableCols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
