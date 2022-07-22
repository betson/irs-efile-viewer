<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8949Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8949Data" select="$RtnDoc/IRS8949"/>
	<xsl:variable name="p1Lines" select="14"/>
	<xsl:variable name="p2Lines" select="14"/>
	<xsl:template name="ShrtTrmGrpHeaders">
		<xsl:param name="lineNumber">1</xsl:param>
		<tr style="border-color:black;font-size:6pt;" valign="top">
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:left;width:47mm;vertical-align:middle;" scope="col" rowspan="2">
				<div style="width:3mm;float:left;text-align:right;font-weight:bold;font-size:7pt;padding-bottom:17mm;">
					<br/>
					<xsl:value-of select="$lineNumber"/>
				</div>
				<div style="width:40mm;text-align:center;float:left;padding-top:7mm;">(a)<br/>
					<span class="styNormalText">Description of property<br/>
						<span style="font-family:Arial;">(Example: 100 sh. XYZ Co.)</span>
					</span>
				</div>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:20mm;vertical-align:middle;" scope="col" rowspan="2">
				<span class="styNormalText">
					<b>(b) </b>
					<br/>Date acquired<br/> (Mo., day, yr.)</span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:20mm;vertical-align:middle;" scope="col" rowspan="2">
				<span class="styNormalText">
					<b>(c) </b>
					<br/>Date sold or<br/>disposed of<br/> (Mo., day, yr.)<br/>
				</span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:31mm;vertical-align:middle;" scope="col" rowspan="2">
				<span class="styNormalText">
					<b>(d) </b>
					<br/>Proceeds<br/>(sales price)<br/>(see instructions)</span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:30.8mm;vertical-align:middle;" scope="col" rowspan="2">
				<span class="styNormalText">
					<b>(e) </b>
					<br/>Cost or other basis.<br/>See the <b>Note</b> below<br/>and see <i>Column (e)</i>
					<br/>in the separate<br/>instructions</span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:44mm;border-bottom-width:1px;vertical-align:middle;" colspan="2">
				<span class="styNormalText" style="font-family:Arial Narrow">
					<b>Adjustment, if any, to gain or loss.</b>
					<br/>If you enter an amount in column (g),<br/> enter a code in column (f).<br/>
					<b>See the separate instructions.</b>
				</span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:31mm;border-right-width:0px;vertical-align:middle;" scope="col" rowspan="2">
				<span class="styNormalText">
					<b>(h)</b>
					<br/>
					<b>Gain or (loss).</b>
					<br/>Subtract column (e)<br/>from column (d) and<br/>combine the result<br/>with column (g)</span>
			</th>
		</tr>
		<tr style="border-color:black;font-size:6pt;" valign="top">
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:13mm;vertical-align:middle;" scope="col">
				<span class="styNormalText">
					<b>(f)</b>
					<br/>
					<span style="font-family:Arial Narrow">Code(s) from<br/>instructions</span>
				</span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:31mm;vertical-align:middle;" scope="col">
				<b>(g) </b>
				<br/>
				<span class="styNormalText" style="font-family:Arial;">Amount of<br/>adjustment</span>
			</th>
		</tr>
	</xsl:template>
	<xsl:template name="ShrtTrmGrpRows">
		<tr style="font-size:7pt;border-color:black;" valign="top">
			<!--+++++++++++++++++++A+++++++++++++++++++-->
			<td class="styIRS8949TableCell" style="font-size:6pt;width:47mm;text-align:left;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="PropertyDesc"/>
				</xsl:call-template>
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="PropertyDesc"/>
				</xsl:call-template>
				<span class="styIRS8949TableCellPad"/>
			</td>
			<!--++++++++++++++++++++C++++++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:20mm;font-size: 6pt; text-align:center;">
				<xsl:choose>
					<xsl:when test="DateAcquiredInheritedCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="DateAcquiredInheritedCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="AcquiredDt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<span class="styIRS8949TableCellPad"/>
			</td>
			<!--+++++++++++++++++++++D+++++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:20mm;font-size: 6pt;text-align:center;">
				<xsl:choose>
					<xsl:when test="SoldOrDisposedCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SoldOrDisposedCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="SoldOrDisposedDt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<span class="styIRS8949TableCellPad"/>
			</td>
			<!--++++++++++++++++++++++E++++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:31mm;font-size: 6pt; text-align:right;">
				<xsl:choose>
					<xsl:when test="SalesPriceCd">
						<xsl:attribute name="style">width:30mm;font-size:6pt;text-align:center;</xsl:attribute>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SalesPriceCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ProceedsSalesPriceAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<span class="styIRS8949TableCellPad"/>
			</td>
			<!--+++++++++++++++++++++++F+++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:30.8mm;font-size: 6pt;text-align:right;">
				<xsl:choose>
					<xsl:when test="CostOrOtherBasisAmtCd">
						<xsl:attribute name="style">width:30mm;font-size:6pt;text-align:center;</xsl:attribute>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmtCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!--++++++++++++++++++++B++++++++++++++++++-->
			<td class="styIRS8949TableCell" style="font-size: 6pt; width: 13mm;text-align:center;">
				<xsl:choose>
					<xsl:when test="string-length(AdjustmentsToGainOrLossCd) &gt; 8">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="AdjustmentsToGainOrLossCd"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateChgHistory">
								<xsl:with-param name="targetNode" select="AdjustmentsToGainOrLossCd"/>
								<xsl:with-param name="subString">1,8</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateChgHistory">
								<xsl:with-param name="targetNode" select="AdjustmentsToGainOrLossCd"/>
								<xsl:with-param name="subString">9,8</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="string-length(AdjustmentsToGainOrLossCd) &gt; 16">
								<br/>
								<xsl:call-template name="PopulateChgHistory">
									<xsl:with-param name="targetNode" select="AdjustmentsToGainOrLossCd"/>
									<xsl:with-param name="subString">17,3</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="AdjustmentsToGainOrLossCd"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<span class="styIRS8949TableCellPad"/>
			</td>
			<!--+++++++++++++++++++++++G+++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:31mm;font-size: 6pt; text-align:right;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="AdjustmentsToGainOrLossAmt"/>
				</xsl:call-template>
				<span class="styIRS8949TableCellPad"/>
			</td>
			<!--+++++++++++++++++++++++G+++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:31mm;font-size: 6pt; width:31mm;text-align:right;border-right-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
				</xsl:call-template>
				<span class="styIRS8949TableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template: ShortTermCapitalGainAndLossGrp) -->
	<xsl:template name="Form8949Part1">
		<xsl:param name="NodeData" select="/.."/>
		<xsl:variable name="containerPos">ShortTermCapitalGainAndLossGrpDiv<xsl:number value="position()"/>
		</xsl:variable>
	<div style="width:187mm;">
		<!-- BEGIN: Part I (Header)-->
		<div class="styIRS8949LineItem" style="padding-top:0mm;padding-bottom:1.5mm;border-bottom:1px solid;border-top:1px solid;clear:all;height:18mm;">
			<div class="styPartName" style="width:13mm;">Part I</div>
			<div class="styIRS8949LineItem" style="width:174mm;font-size:8pt;padding-left:2px;">
			<b>Short-Term.</b> Transactions involving capital assets you held 1 year or less are short term. For long-term transactions, see page 2. <br/>
					<b>Note:</b> You may aggregate all short-term transactions reported on Form(s) 1099-B showing basis was reported to the IRS and for which NO adjustments or codes are required. Enter the totals directly on Schedule D, line 1a; you aren't required to report these transactions on Form 8949 (see instructions).
			</div>
		</div>
		<div class="styIRS8949LineItem" style="padding-bottom:2mm;height:10mm;">
			<b>You <i>must</i> check Box A, B, <i>or</i> C below. Check only one box.</b> If more than one box applies for your short-term transactions, complete a separate Form 8949, page 1, for each applicable box. If you have more short-term transactions than will fit on this page for one or more of the boxes, complete as many forms with the same box checked as you need.
		</div>
		<!-- END: Part I (Header)-->
		<!-- BEGIN: Part I (Body) -->
		<!-- ################################################################################# -->
		<!-- Begin (Line) 1 -->
		<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
		<!-- Begin Checkboxes (a),(b),(c) -->
		<div class="styBB" style="width:187mm;padding-bottom:.5mm;">
			<div class="styIRS8949LNDesc" style="width:187mm;">
				<div style="width:3mm;float:left;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BThatShowBssInd"/>
							<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransRptOn1099BThatShowBssInd</xsl:with-param>
						</xsl:call-template>
					</input>
				</div>
				<div style="width:182mm;padding-left:0.5mm;clear:none;float:left;">
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BThatShowBssInd"/>
							<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransRptOn1099BThatShowBssInd</xsl:with-param>
						</xsl:call-template>
						<b>
							<span style="font-size:8pt;width:6mm;padding-left:1mm;">(A)</span>
						</b> Short-term transactions reported on Form(s) 1099-B showing basis was reported to the IRS (see <b>
						Note</b> above)
				</label>
				</div>
			</div>
			<div class="styIRS8949LNDesc" style="width:187mm;">
				<div style="width:3mm;float:left;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BNotShowBasisInd"/>
							<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransRptOn1099BNotShowBasisInd</xsl:with-param>
						</xsl:call-template>
					</input>
				</div>
				<div style="width:182mm;padding-left:0.5mm;clear:none;float:left;">
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BNotShowBasisInd"/>
							<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransRptOn1099BNotShowBasisInd</xsl:with-param>
						</xsl:call-template>
						<b>
							<span style="font-size:8pt;width:6mm;padding-left:1mm;">(B)</span>
						</b> Short-term transactions reported on Form(s) 1099-B showing basis wasn't reported to the IRS
				</label>
				</div>
			</div>
			<div class="styIRS8949LNDesc" style="width:180mm;">
				<div style="width:3mm;float:left;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$NodeData/TransactionsNotRptedOn1099BInd"/>
							<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransactionsNotRptedOn1099BInd</xsl:with-param>
						</xsl:call-template>
					</input>
				</div>
				<div style="width:160mm;padding-left:0.5mm;clear:none;float:left;">
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$NodeData/TransactionsNotRptedOn1099BInd"/>
							<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransactionsNotRptedOn1099BInd</xsl:with-param>
						</xsl:call-template>
						<b>
							<span style="font-size:8pt;width:6mm;padding-left:1mm;">(C)</span>
						</b> Short-term transactions not reported to you on Form 1099-B
					</label>
				</div>
			</div>
			<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
			<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
			<div class="styGenericDiv" style="width:3.2mm;float:right;">
				<!-- button display logic -->
				<xsl:call-template name="SetDynamicTableToggleButton">
					<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainAndLossAssetGrp"/>
					<xsl:with-param name="containerHeight" select="$p1Lines"/>
					<xsl:with-param name="headerRowCount" select="3"/>
					<xsl:with-param name="containerID" select="$containerPos"/>
				</xsl:call-template>
				<!-- end button display logic -->
			</div>
		</div>	
			<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
		</div>
		<div class="styIRS8949LineItem" style="clear:both;height:auto;">
			<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
			<div class="styTableContainerNBB" >
				<xsl:attribute name="id"><xsl:value-of select="$containerPos"/></xsl:attribute>
				<!-- ++++++++++++++++++++++++ Start: Table  ++++++++++++++++++++++ -->
				<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
				<xsl:call-template name="SetInitialState"/>
				<table class="styTable" cellspacing="0" style="width:100%;">
					<thead class="styTableThead">
						<xsl:call-template name="ShrtTrmGrpHeaders"/>
					</thead>
					<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
					<tbody>
						<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
						<xsl:if test="($Print != $Separated) or (count($NodeData/CapitalGainAndLossAssetGrp) &lt;= $p1Lines)">
						<xsl:for-each select="$NodeData/CapitalGainAndLossAssetGrp">
							<xsl:call-template name="ShrtTrmGrpRows"/>
						</xsl:for-each>
						<xsl:if test="count($NodeData/CapitalGainAndLossAssetGrp) &lt; $p1Lines">
							<xsl:call-template name="blank-rows">
								<xsl:with-param name="count" select="$p1Lines - count($NodeData/CapitalGainAndLossAssetGrp)"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>  					
					<!-- Creates empty table rows  -->
						<xsl:if test="(($Print = $Separated) and (count($NodeData/CapitalGainAndLossAssetGrp) &gt; $p1Lines))">
							<tr style="border-color:black;" valign="bottom">
								<!--++++++++++++++++++++A++++++++++++++++++-->
								<td class="styIRS8949TableCell" style="width:47mm;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainAndLossAssetGrp"/>
									</xsl:call-template>
									<span style="width:0px"/>
								</td>
								<!--++++++++++++++++++++D++++++++++++++++++-->
								<td class="styIRS8949TableCell">
									<span style="width:4px"/>
								</td>
								<!--++++++++++++++++++++E++++++++++++++++++-->
								<td class="styIRS8949TableCell">
									<span style="width:4px"/>
								</td>
								<!--+++++++++++++++++++++F+++++++++++++++++-->
								<td class="styIRS8949TableCell">
									<span style="width:4px"/>
								</td>
								<!--++++++++++++++++++++++G++++++++++++++++-->
								<td class="styIRS8949TableCell" style="width:31mm;text-align:right;">
									<br/>
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="/.."/>
									</xsl:call-template>
								</td>
								<!--+++++++++++++++++++++++H+++++++++++++++-->
								<td class="styIRS8949TableCell">
									<span style="width:4px"/>
								</td>
								<!--+++++++++++++++++++++++I+++++++++++++++-->
								<td class="styIRS8949TableCell">
									<span style="width:4px"/>
								</td>
								<!--+++++++++++++++++++++++J+++++++++++++++-->
								<td class="styIRS8949TableCell" style="border-right-width: 0px;">
									<span style="width:4px"/>
								</td>
							</tr>
							<xsl:call-template name="blank-rows">
								<xsl:with-param name="count" select="$p1Lines - 1"/>
							</xsl:call-template>
						</xsl:if>
						<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
						<!-- ++++++++++++++++++++++++ Start: Table Footers ++++++++++++++++++++++ -->						
						<tr>
						<tr style="border-top:1px solid;border-color:black;height:18.5mm;">
							<td colspan="3" style="border-bottom:1px solid black;border-right:1px solid black;">
								<div class="styIRS8949LNDesc" style="width:80mm;padding-left:0mm;height:auto;padding-top:3mm;">
									<span style=""><b>2 Totals</b>. Add the amounts in columns (d), (e), (g), and (h)</span>
									<span style="padding-left:3mm;">
									(subtract negative amounts). Enter each total here and include on your Schedule D, <b>line 1b</b> (if <b>Box A</b> above is checked), <b>line 2</b> (if <b>Box B</b> above is checked), or <b>line 3</b> (if <b>Box C</b> above is checked).
									<!--Dotted Line-->
									<span style="font-weight:bold;letter-spacing:3mm;text-align:right;padding-left:3mm;padding-right:2px;">.......</span>
									<img alt="Small arrow" src="{$ImagePath}/8949_Bullet_Sm.gif" width="8" height="8"/></span>
								</div>
							</td>
							<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 6pt; text-align:right; border-bottom:1px solid black;border-right:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$NodeData/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS8949TableCell" valign="bottom" style="width:30.8mm;padding-bottom:1mm;font-size: 6pt; text-align:right; border-bottom:1px solid black;border-right:1px solid black;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$NodeData/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS8949TableCell" valign="bottom" style="width:15mm;padding-bottom:1mm;font-size: 7pt; text-align:right; background-color:lightgrey;border-bottom:1px solid black;border-right:1px solid black;">
								<span class="styIRS8949TableCellPad"/>
							</td>
							<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 6pt; text-align:right; border-bottom:1px solid black;border-right:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$NodeData/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 6pt; text-align:right; border-bottom:1px solid black;border-right:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$NodeData/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- ++++++++++++++++++++++++ End: Table Footers +++++++++++++++++++++++ -->
					</tr>
					</tbody>
				</table>
				<div class="styGenericDiv" style="width:187mm;padding-top:0.5mm;padding-bottom:0.5mm;">
			<b>Note:</b> If you checked Box A above but the basis reported to the IRS was incorrect, enter in column (e) the basis as reported to the IRS, and enter an adjustment in column (g) to correct the basis. See <i>Column</i> (g) in the separate instructions for how to figure the amount of the adjustment.
				</div>
			</div>
			<!-- Set Initial Height of Above Table -->
			<xsl:call-template name="SetInitialDynamicTableHeight">
				<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainAndLossAssetGrp"/>
				<xsl:with-param name="containerHeight" select="$p1Lines"/>
				<xsl:with-param name="headerRowCount" select="3"/>
				<xsl:with-param name="containerID" select="$containerPos"/>
			</xsl:call-template>	
			<!-- End Set Initial Height of Above Table -->
			<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
		</div>

		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- End (Line) 1 & 2 -->
		<!-- ################################################################################# -->
		<!-- END: Part I (Body) -->
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- ////////////////////////////////////////////////////////////// (Template: LongTermCapitalGainAndLossGrp) -->
	<xsl:template name="Form8949Part2">
		<xsl:param name="NodeData" select="/.."/>
		<xsl:variable name="containerPos">LongTermCapitalGainAndLossGrpDiv<xsl:number value="position()"/>
		</xsl:variable>
	<div style="width:187mm;">
		<!-- BEGIN: Part II (Header)-->
		<div class="styIRS8949LineItem" style="padding-top:0mm;padding-bottom:1.5mm;border-bottom:1px solid;border-top:1px solid;clear:all;height:18mm;">
			<div class="styPartName" style="width:13mm;">Part II</div>
			<div class="styIRS8949LineItem" style="width:174mm;font-size:8pt;padding-left:2px;">
			<b>Long-Term.</b>  Transactions involving capital assets you held more than 1 year are long term. For short-term<br/> transactions, see page 1. 
					<br/><b>Note:</b> You may aggregate all long-term transactions reported on Form(s) 1099-B showing basis was reported to the IRS and for which NO adjustments or codes are required. Enter the totals directly on Schedule D, line 8a; you aren't required to report these transactions on Form 8949 (see instructions).
			</div>
		</div>
		<div class="styIRS8949LineItem" style="padding-bottom:2mm;height:10mm;">
			<b>You <i>must</i> check Box D, E, <i>or</i> F below. Check only one box.</b> If more than one box applies for your long-term transactions, complete a separate Form 8949, page 2, for each applicable box. If you have more long-term transactions than will fit on this page for one or more of the boxes, complete as many forms with the same box checked as you need.
		</div>
		<!-- END: Part I (Header)-->
		<!-- BEGIN: Part I (Body) -->
		<!-- ################################################################################# -->
		<!-- Begin (Line) 1 -->
		<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
		<!-- Begin Checkboxes (d),(e),(f) -->
		<div class="styBB" style="width:187mm;padding-bottom:.5mm;">
			<div class="styIRS8949LNDesc" style="width:187mm;">
				<div style="width:3mm;float:left;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BThatShowBssInd"/>
							<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransRptOn1099BThatShowBssInd</xsl:with-param>
						</xsl:call-template>
					</input>
				</div>
				<div style="width:182mm;padding-left:0.5mm;clear:none;float:left;">
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BThatShowBssInd"/>
							<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransRptOn1099BThatShowBssInd</xsl:with-param>
						</xsl:call-template>
						<b>
							<span style="font-size:8pt;width:6mm;padding-left:1mm;">(D)</span>
						</b> Long-term transactions reported on Form(s) 1099-B showing basis was reported to the IRS (see <b>
							Note</b> above)
				</label>
				</div>
			</div>
			<div class="styIRS8949LNDesc" style="width:187mm;">
				<div style="width:3mm;float:left;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BNotShowBasisInd"/>
							<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransRptOn1099BNotShowBasisInd</xsl:with-param>
						</xsl:call-template>
					</input>
				</div>
				<div style="width:182mm;padding-left:0.5mm;clear:none;float:left;">
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BNotShowBasisInd"/>
							<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransRptOn1099BNotShowBasisInd</xsl:with-param>
						</xsl:call-template>
						<b>
							<span style="font-size:8pt;width:6mm;padding-left:1mm;">(E)</span>
						</b> Long-term transactions reported on Form(s) 1099-B showing basis wasn't reported to the IRS
				</label>
				</div>
			</div>
			<div class="styIRS8949LNDesc" style="width:180mm;">
				<div style="width:3mm;float:left;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$NodeData/TransactionsNotRptedOn1099BInd"/>
							<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransactionsNotRptedOn1099BInd</xsl:with-param>
						</xsl:call-template>
					</input>
				</div>
				<div style="width:160mm;padding-left:0.5mm;clear:none;float:left;">
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$NodeData/TransactionsNotRptedOn1099BInd"/>
							<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransactionsNotRptedOn1099BInd</xsl:with-param>
						</xsl:call-template>
						<b>
							<span style="font-size:8pt;width:6mm;padding-left:1mm;">(F)</span>
						</b> Long-term transactions not reported to you on Form 1099-B
				</label>
				</div>
			</div>
			<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
			<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
			<div class="styGenericDiv" style="width:3.2mm;float:right;">
				<!-- button display logic -->
				<xsl:call-template name="SetDynamicTableToggleButton">
					<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainAndLossAssetGrp"/>
					<xsl:with-param name="containerHeight" select="$p2Lines"/>
					<xsl:with-param name="headerRowCount" select="2"/>
					<xsl:with-param name="containerID" select="$containerPos"/>
				</xsl:call-template>
				<!-- end button display logic -->
			</div>
		</div>
			<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
		</div>
		<div class="styIRS8949LineItem" style="clear:both;height:auto;">
			<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
			<div class="styTableContainerNBB">
				<xsl:attribute name="id"><xsl:value-of select="$containerPos"/></xsl:attribute>
				<!-- ++++++++++++++++++++++++ Start: Table  ++++++++++++++++++++++ -->
				<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
				<xsl:call-template name="SetInitialState"/>
				<table class="styTable" cellspacing="0" style="width:100%;">
					<thead class="styTableThead">
						<xsl:call-template name="ShrtTrmGrpHeaders">
							<xsl:with-param name="lineNumber" select="1"/>
						</xsl:call-template>
					</thead>
					<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
					<tbody>
						<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
						<xsl:if test="($Print != $Separated) or (count($NodeData/CapitalGainAndLossAssetGrp) &lt;= $p2Lines)">
							<xsl:for-each select="$NodeData/CapitalGainAndLossAssetGrp">
								<xsl:call-template name="ShrtTrmGrpRows"/>
							</xsl:for-each>
							<xsl:if test="count($NodeData/CapitalGainAndLossAssetGrp) &lt; $p2Lines">
								<xsl:call-template name="blank-rows">
									<xsl:with-param name="count" select="$p2Lines - count($NodeData/CapitalGainAndLossAssetGrp)"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
						<!-- Creates empty table rows  -->
						<xsl:if test="(($Print = $Separated) and (count($NodeData/CapitalGainAndLossAssetGrp) &gt; $p2Lines))">
							<tr style="border-color:black;" valign="bottom">
								<!--++++++++++++++++++++A++++++++++++++++++-->
								<td class="styIRS8949TableCell" style="width:47mm;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainAndLossAssetGrp"/>
									</xsl:call-template>
									<span style="width:0px"/>
								</td>
								<!--++++++++++++++++++++D++++++++++++++++++-->
								<td class="styIRS8949TableCell">
									<span style="width:4px"/>
								</td>
								<!--++++++++++++++++++++E++++++++++++++++++-->
								<td class="styIRS8949TableCell">
									<span style="width:4px"/>
								</td>
								<!--+++++++++++++++++++++F+++++++++++++++++-->
								<td class="styIRS8949TableCell">
									<span style="width:4px"/>
								</td>
								<!--++++++++++++++++++++++G++++++++++++++++-->
								<td class="styIRS8949TableCell" style="width:31mm;text-align:right;">
									<br/>
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="/.."/>
									</xsl:call-template>
								</td>
								<!--+++++++++++++++++++++++H+++++++++++++++-->
								<td class="styIRS8949TableCell">
									<span style="width:4px"/>
								</td>
								<!--+++++++++++++++++++++++I+++++++++++++++-->
								<td class="styIRS8949TableCell">
									<span style="width:4px"/>
								</td>
								<!--+++++++++++++++++++++++J+++++++++++++++-->
								<td class="styIRS8949TableCell" style="border-right-width: 0px;">
									<span style="width:4px"/>
								</td>
							</tr>
							<xsl:call-template name="blank-rows">
								<xsl:with-param name="count" select="$p2Lines - 1"/>
							</xsl:call-template>
						</xsl:if>
					<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
					<!-- ++++++++++++++++++++++++ Start: Table Footers ++++++++++++++++++++++ -->
					<tr>
						<tr style="border-top:1px solid;border-color:black;height:18.5mm;">
							<td colspan="3" style="border-bottom:1px solid black;border-right:1px solid black;">
								<div class="styIRS8949LNDesc" style="width:80mm;padding-left:0mm;height:auto;padding-top:3mm;">
									<span class=""><b>2 Totals</b>. Add the amounts in columns (d), (e), (g), and (h)</span>
									<span style="padding-left:3mm;">(subtract negative amounts). Enter each total here and include on your Schedule D, <b>line 8b</b> (if <b>Box D</b> above is checked), <b>line 9</b> (if <b>Box E</b> above is checked), or <b>line 10</b> (if <b>Box F</b> above is checked)
								<!--Dotted Line-->
									<span style="font-weight:bold;letter-spacing:3mm;text-align:right;padding-left:3mm;padding-right:2px;">..........</span>
									<img alt="Small arrow" src="{$ImagePath}/8949_Bullet_Sm.gif" width="8" height="8"/></span>
								</div>
							</td>
							<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 6pt; text-align:right; border-bottom:1px solid black;border-right:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$NodeData/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS8949TableCell" valign="bottom" style="width:30.8mm;padding-bottom:1mm;font-size: 6pt; text-align:right; border-bottom:1px solid black;border-right:1px solid black;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$NodeData/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS8949TableCell" valign="bottom" style="width:15mm;padding-bottom:1mm;font-size: 6pt; text-align:right; background-color:lightgrey;border-bottom:1px solid black;border-right:1px solid black;">
								<span class="styIRS8949TableCellPad"/>
							</td>
							<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 6pt; text-align:right; border-bottom:1px solid black;border-right:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$NodeData/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 6pt; text-align:right; border-bottom:1px solid black;border-right:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$NodeData/TotalGainOrLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</tr>
					<!-- ++++++++++++++++++++++++ End: Table Footers +++++++++++++++++++++++ -->
					</tbody>
				</table>
				<div class="styGenericDiv" style="width:187mm;padding-top:0.5mm;padding-bottom:0.5mm;">
			<b>Note:</b> If you checked Box D above but the basis reported to the IRS was incorrect, enter in column (e) the basis as reported to the IRS, and enter an adjustment in column (g) to correct the basis. See <i>Column</i> (g) in the separate instructions for how to figure the amount of the adjustment.
				</div>
			</div>
			<!-- Set Initial Height of Above Table -->
			<xsl:call-template name="SetInitialDynamicTableHeight">
				<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainAndLossAssetGrp"/>
				<xsl:with-param name="containerHeight" select="$p2Lines"/>
				<xsl:with-param name="headerRowCount" select="3"/>
				<xsl:with-param name="containerID" select="$containerPos"/>
			</xsl:call-template>
			<!-- End Set Initial Height of Above Table -->
			<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
		</div>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- End (Line) 1 & 2 -->
		<!-- ################################################################################# -->
		<!-- END: Part I (Body) -->
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Begin Template 	-->
	<xsl:template name="SetPageEndFooter">
		<xsl:param name="Info"/>
		<xsl:param name="CatNumber"/>
		<xsl:param name="CatNumberSpanWidth">width:30mm;</xsl:param>
		<xsl:param name="PageNumber"/>
		<!-- Page Break and Footer-->
		<div class="pageEnd" style="width:187mm;padding-top:.5mm;padding-bottom:2mm;float:none;clear:both;border: black solid 0px;border-top-width:2px;">
			<xsl:if test="$Info">
				<div style="float:left;">
					<span class="styBoldText">
						<xsl:value-of select="$Info"/>
					</span>
				</div>
			</xsl:if>
			<xsl:if test="$CatNumber">
				<div style="float:none;">
					<span>
						<span style="width:25mm;"/>  
						<xsl:value-of select="$CatNumber"/>
					</span>
				</div>
			</xsl:if>
			<div style="float:right;">
				Form <span class="styBoldText" style="font-size:8pt;">8949</span> (2017)
			</div>
		</div>
		<!--<p style="page-break-before: always"/>-->
		<!-- END Page Break and Footer-->
		<!-- BEGIN Page Header -->
		<div class="styTBB" style="width:187mm;padding-top:.5mm;float:none;clear:both;">
			<div style="float:left;">
				Form 8949 (2017)
			</div>
			<div style="float:right;">
				Attachment Sequence No. <span style="font-weight:bold;font-size:8pt;width:18mm;">12A</span>
				Page <span style="font-weight:bold;font-size:8pt;">
					<xsl:value-of select="$PageNumber"/>
				</span>
			</div>
		</div>
		<!-- END Page Header -->
	</xsl:template>
	<!-- /////////////////////////////////////////// (Template: BlankRows) -->
	<xsl:template name="blank-rows">
		<xsl:param name="count"/>
		<!-- blank row stuff here -->
		<tr style="border-color:black;font-size:7pt;">
			<!--+++++++++++++++++++A+++++++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:47mm;">
				<span style="width:4px"/>
			</td>
			<!--+++++++++++++++++++++D+++++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:20mm;">
				<span style="width:4px"/>
			</td>
			<!--++++++++++++++++++++++E++++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:20mm;">
				<span style="width:4px"/>
			</td>
			<!--+++++++++++++++++++++++F+++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:31mm;">
				<span style="width:4px"/>
			</td>
			<!--+++++++++++++++++++++++G+++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:31mm;text-align:right;">
				<br/>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="/.."/>
				</xsl:call-template>
			</td>
			<!--+++++++++++++++++++++++H+++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:13mm;">
				<span style="width:4px"/>
			</td>
			<!--+++++++++++++++++++++++I+++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:31mm;">
				<span style="width:4px"/>
			</td>
			<!--+++++++++++++++++++++++J+++++++++++++++-->
			<td class="styIRS8949TableCell" style="width:31mm;border-right-width:0px;">
				<span style="width:4px"/>
			</td>
		</tr>
		<xsl:if test="$count &gt; 1">
			<xsl:call-template name="blank-rows">
				<xsl:with-param name="count" select="$count - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////// (Template:							CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Number"/>
		<xsl:param name="Width">28mm</xsl:param>
		<xsl:param name="Height">4.3mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:26mm;
				height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
				<xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$TargetNode">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
				</xsl:call-template>
				<xsl:if test="$TargetNode/@referenceDocumentId">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
		</div>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:3px 0px 0px 0px;
				border-right-width:0px;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8949Data)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8949"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8949Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8949">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;padding-right:0px;">
						<div class="styFNBox" style="width:27.2mm;height:22.2mm;border-right-width:2px;padding-top:.5mm;padding-right:0px;">
							<div style="padding-top:1mm;font-size:8pt;padding-right:0px;">
								Form<span class="styFormNumber"> 8949</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8949Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<!-- BEGIN:	Header Title-->
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div class="styFTBox" style="width:129.8mm;padding-left:0px;padding-right:0px;">
							<br/>
							<div class="styMainTitle" style="height:8mm;">Sales and Other Dispositions of Capital Assets</div>
							<!-- BEGIN:	2nd Title -->
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:0mm;text-align:center;padding-right:0px;">
								<span style="width:129.8mm;text-align:center;">
									<img src="{$ImagePath}/8949_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:3px;"/>
									<span class="styBoldText">Go to
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8949" title="Link to IRS.gov">               
									<i>www.irs.gov/Form8949</i> for instructions and the latest information.
								</a>
									</span>
									<br/>
									<img src="{$ImagePath}/8949_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:3px;"/>
									<span class="styBoldText">File with your Schedule D to list your transactions for lines 1b, 2, 3, 8b, 9, and 10 of</span>
									<span class="styBoldText">Schedule D.</span>
								</span>
							</div>
							<!-- END:	2nd Title -->
						</div>
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- END:	Header Title-->
						<div class="styTYBox" style="width:30mm;height:22.2mm;border-left-width:2px;">
							<div class="styOMB" style="height:auto;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">17</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">12A</span>
							</div>
						</div>
					</div>
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:104mm;height:9mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return <br/>
							  <xsl:choose>
							  <!-- Name from 1120/990/1065 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								  </xsl:call-template>
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
								  </xsl:call-template>
								</xsl:when>
								<!-- Name from 1040 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								  </xsl:call-template>
								</xsl:when>
								<!--Name from 1041 Return Header--> 
								<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								  </xsl:call-template>
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
								  </xsl:call-template>
								</xsl:when>
								<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								  </xsl:call-template>
								  <br/>
								</xsl:when> 
							  </xsl:choose>
						</div>
						<div style="height:8mm;width:83mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Social security number or taxpayer identification number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%;padding-top:3mm;">
								<!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
								<xsl:choose>
								  <xsl:when test="$RtnHdrData/Filer/EIN">
									<xsl:call-template name="PopulateReturnHeaderFiler">
									  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
									  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								  </xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<div class="styGenericDiv" style="width:187mm;padding-top:0.5mm;padding-bottom:0.5mm;font-style:italic;clear:all;">
						Before you check Box A, B, or C below, see whether you received any Form(s) 1099-B or substitute statement(s) from your broker.
						A substitute statement 	will have the same information as Form 1099-B. Either will show whether your basis (usually your cost) was reported to
						the IRS by your broker and may even tell you which box to check.
					</div>
					<xsl:for-each select="$Form8949Data/ShortTermCapitalGainAndLossGrp">
						<xsl:if test="position() &gt; 1">
							<div class="pageEnd"/>
						</xsl:if>
						<xsl:call-template name="Form8949Part1">
							<xsl:with-param name="NodeData" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($Form8949Data/ShortTermCapitalGainAndLossGrp) = 0">
						<xsl:call-template name="Form8949Part1"/>
					</xsl:if>
					<!-- END PREPARER SIGNATURE SECTION -->
					<xsl:call-template name="SetPageEndFooter">
						<xsl:with-param name="Info">For Paperwork Reduction Act Notice, see your tax return instructions.</xsl:with-param>
						<xsl:with-param name="CatNumber">Cat. No. 37768Z</xsl:with-param>
						<xsl:with-param name="CatNumberSpanWidth">width:30mm;</xsl:with-param>
						<xsl:with-param name="PageNumber">2</xsl:with-param>
					</xsl:call-template>
					<!-- END Page Header -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="height:auto;width:104mm;font-weight:normal;font-size:7pt;">
							<span style="font-family:Arial;font-size:6pt;">Name(s) shown on return.  Name and SSN or taxpayer identification no. not required if shown on other side</span>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer//BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div style="height:8mm;width:83mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							<span style="font-family:Arial;font-size:6pt;">Social security number or taxpayer identification number</span>
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<div class="styGenericDiv" style="width:187mm;padding-top:0.5mm;padding-bottom:0.5mm;font-style:italic;clear:all;">
						Before you check Box D, E, or F below, see whether you received any Form(s) 1099-B or substitute statement(s) from your broker. A substitute
						statement will have the same information as Form 1099-B. Either will show whether your basis (usually your cost) was reported to
						the IRS by your broker and may even tell you which box to check.
					</div>
					<xsl:for-each select="$Form8949Data/LongTermCapitalGainAndLossGrp">
						<xsl:if test="position() &gt; 1">
							<div class="pageEnd"/>
						</xsl:if>
						<xsl:call-template name="Form8949Part2">
							<xsl:with-param name="NodeData" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($Form8949Data/LongTermCapitalGainAndLossGrp) = 0">
						<xsl:call-template name="Form8949Part2"/>
					</xsl:if>
					<!-- Page Break and Footer-->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;border:black solid 0px;border-top-width:2px;clear:all;">
						<div style="float:right;clear:all;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8949</span> (2017)
						</div>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;clear:all;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer" style="">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<xsl:variable name="TableWidth">100</xsl:variable>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$Form8949Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
					<!-- Separated Data for Part I - CapitalGainAndLossAssetGrp -->
					<xsl:for-each select="$Form8949Data/ShortTermCapitalGainAndLossGrp">
						<xsl:if test="($Print = $Separated) and (count(CapitalGainAndLossAssetGrp) &gt; $p1Lines)">
							<br/>
							<br/>
							<span class="styRepeatingDataTitle">
								Form 8949, Part I, Table <xsl:number value="position()"/> - Short-Term
							</span>
							<table class="styDepTbl" cellspacing="0" style="width:187mm;">
								<thead class="styTableThead">
									<xsl:call-template name="ShrtTrmGrpHeaders"/>
								</thead>
								<tbody>
									<xsl:for-each select="CapitalGainAndLossAssetGrp">
										<xsl:call-template name="ShrtTrmGrpRows"/>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<!-- Separated Data for Part II - CapitalGainAndLossAssetGrp -->
					<xsl:for-each select="$Form8949Data/LongTermCapitalGainAndLossGrp">
						<xsl:if test="($Print = $Separated) and (count(CapitalGainAndLossAssetGrp) &gt; $p2Lines)">
							<br/>
							<br/>
							<span class="styRepeatingDataTitle">
								Form 8949, Part II, Table <xsl:number value="position()"/> - Long-Term
							</span>
							<table class="styDepTbl" cellspacing="0" style="width:187mm;">
								<thead class="styTableThead">
									<xsl:call-template name="ShrtTrmGrpHeaders">
										<!--<xsl:with-param name="lineNumber" select="3"/>-->
									</xsl:call-template>
								</thead>
								<tbody>
									<xsl:for-each select="CapitalGainAndLossAssetGrp">
										<xsl:call-template name="ShrtTrmGrpRows"/>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
