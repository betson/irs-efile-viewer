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

	
<xsl:template name="ShrtTrmGrpHeaders">
<tr style="border-color:black;">
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:left;font-size: 7pt; width:50mm;" scope="col">
		<b>1</b><span class="styNormalText" style="padding-left:7px;"><b>(a) </b>Description of property</span><br/>
		<span class="styNormalText">(Example: 100 sh. XYZ Co.)</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width: 13mm;" scope="col">
		<span class="styNormalText"><b>(b) </b>Code
		</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:21mm;" scope="col">
		<span class="styNormalText"><b>(c) </b>Date<br/> acquired<br/> (Mo., day, yr.)
		</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:21mm;" scope="col">
		<span class="styNormalText"><b>(d) </b>Date sold<br/> (Mo., day, yr.)
		</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:30mm;" scope="col">
		<span class="styNormalText"><b>(e) </b>Sales price<br/> (see instructions)
		</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:30mm;" scope="col">
		<span class="styNormalText"><b>(f) </b>Cost or other basis<br/> (see instructions)
		</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:30mm;border-right-width:0px;" scope="col">
		<span class="styNormalText"><b>(g) </b>Adjustments to<br/>gain or loss
		</span>
	</th>
</tr>
</xsl:template>
<xsl:template name="LongTrmGrpHeaders">
<tr style="border-color:black;">
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:left;font-size: 7pt; width:50mm;" scope="col">
		<b>3</b><span class="styNormalText" style="padding-left:7px;"><b>(a) </b>Description of property</span><br/>
		<span class="styNormalText">(Example: 100 sh. XYZ Co.)</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width: 13mm;" scope="col">
		<span class="styNormalText"><b>(b) </b>Code
		</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:21mm;" scope="col">
		<span class="styNormalText"><b>(c) </b>Date<br/> acquired<br/> (Mo., day, yr.)
		</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:21mm;" scope="col">
		<span class="styNormalText"><b>(d) </b>Date sold<br/> (Mo., day, yr.)
		</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:30mm;" scope="col">
		<span class="styNormalText"><b>(e) </b>Sales price<br/> (see instructions)
		</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:30mm;" scope="col">
		<span class="styNormalText"><b>(f) </b>Cost or other basis<br/> (see instructions)
		</span>
	</th>
	<!-- +++++++++++++++++++++++++++++++++++-->
	<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:30mm;border-right-width:0px;" scope="col">
		<span class="styNormalText"><b>(g) </b>Adjustments to<br/>gain or loss
		</span>
	</th>
</tr>
</xsl:template>
<xsl:template name="ShrtTrmGrpRows">
	<tr style="font-size:7pt;border-color:black;">
	<!--+++++++++++++++++++A+++++++++++++++++++-->
	<td class="styIRS8949TableCell" style="font-size:7pt;width:50mm;text-align:left;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="PropertyDescription"/>
		</xsl:call-template>
		<span class="styIRS8949TableCellPad"/>
	</td>
	<!--++++++++++++++++++++B++++++++++++++++++-->
	<td class="styIRS8949TableCell" style="font-size: 7pt; width: 13mm;text-align:center;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="AdjustmentsToGainOrLossCd"/>
		</xsl:call-template>
		<span class="styIRS8949TableCellPad"/>
	</td>
	<!--++++++++++++++++++++C++++++++++++++++++-->
	<td class="styIRS8949TableCell" style="width:21mm;font-size: 7pt; text-align:center;">
		<xsl:choose>
			<xsl:when test="DateAcquiredTxt">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="DateAcquiredTxt"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateMonthDayYear">
					<xsl:with-param name="TargetNode" select="DateAcquired"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<span class="styIRS8949TableCellPad"/>
	</td>
	<!--+++++++++++++++++++++D+++++++++++++++++-->
	<td class="styIRS8949TableCell" style="width:21mm;font-size: 7pt;text-align:center;">
		<xsl:choose>
			<xsl:when test="DateSoldTxt">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="DateSoldTxt"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateMonthDayYear">
					<xsl:with-param name="TargetNode" select="DateSold"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<span class="styIRS8949TableCellPad"/>
	</td>
	<!--++++++++++++++++++++++E++++++++++++++++-->
	<td class="styIRS8949TableCell" style="width:30mm;font-size: 7pt; text-align:right;">
		<xsl:choose>
			<xsl:when test="SalesPriceTxt">
				<xsl:attribute name="style">width:30mm;font-size:7pt;text-align:center;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="SalesPriceTxt"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="SalesPrice"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<span class="styIRS8949TableCellPad"/>
	</td>
	<!--+++++++++++++++++++++++F+++++++++++++++-->
	<td class="styIRS8949TableCell" style="width:30mm;font-size: 7pt;text-align:right;">
		<xsl:choose>
			<xsl:when test="CostOrOtherBasisTxt">
				<xsl:attribute name="style">width:30mm;font-size:7pt;text-align:center;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="CostOrOtherBasisTxt"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<span class="styIRS8949TableCellPad"/>
	</td>
	<!--+++++++++++++++++++++++G+++++++++++++++-->
	<td class="styIRS8949TableCell" style="width:30mm;font-size: 7pt; width:30mm;text-align:right;border-right-width:0px;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="AdjustmentsToGainOrLossAmt"/>
		</xsl:call-template>
		<span class="styIRS8949TableCellPad"/>
	</td>
</tr>
</xsl:template>

<!-- ////////////////////////////////////////////////////////////// (Template: ShortTermCapitalGainAndLossGrp) -->
<xsl:template name="Form8949Part1">
	<xsl:param name="NodeData" select="/.."/>
	<xsl:variable name="containerPos">ShortTermCapitalGainAndLossGrpDiv<xsl:number value="position()"/></xsl:variable>
	<!-- BEGIN: Part I (Header)-->
	<div class="styIRS8949LineItem" style="padding-top:1.5mm;padding-bottom:1.5mm;border-bottom:1px solid;">
		<div class="styPartName" style="width:15mm;">Part I</div>
		<div class="styPartDesc" style="padding-left:3mm;">
			Short-Term Capital Gains and Losses&#8212;Assets Held One Year or Less
		</div>
	</div>
	<div class="styIRS8949LineItem">
		Check the box below that describes the transactions listed on this page.
	</div>
	<div class="styIRS8949LineItem">
		<b>Caution.</b>
		<span style="width:3px;"/>
		Check only one box. If you have more than one type of transaction, complete a separate Form 8949 for each type.
	</div>
	<!-- END: Part I (Header)-->
	<!-- BEGIN: Part I (Body) -->
	<!-- ################################################################################# -->
	<!-- Begin (Line) 1 -->
	<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
	<!-- Begin Checkboxes (a),(b),(c) -->
	<div class="styBB" style="width:187mm;">
		<div class="styIRS8949LNDesc"  style="width:60mm;">
			<div style="width:3mm;float:left;">
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BThatShowBssInd"/>
						<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransRptOn1099BThatShowBssInd</xsl:with-param>
					</xsl:call-template>
				</input>
			</div>
			<div style="width:53mm;padding-left:1.5mm;clear:none;float:left;">
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BThatShowBssInd"/>
						<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransRptOn1099BThatShowBssInd</xsl:with-param>
					</xsl:call-template>
					<span class="styBoldText">(A)</span> Short-Term gains and losses<br/>
					(Form 1099-B, box 3, shows basis)
				</label>
			</div>
		</div>
		<div class="styIRS8949LNDesc"  style="width:60mm;">
			<div style="width:3mm;float:left;">
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BNotShowBasisInd"/>
						<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransRptOn1099BNotShowBasisInd</xsl:with-param>
					</xsl:call-template>
				</input>
			</div>
			<div style="width:53mm;padding-left:1.5mm;clear:none;float:left;">
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BNotShowBasisInd"/>
						<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransRptOn1099BNotShowBasisInd</xsl:with-param>
					</xsl:call-template>
					<span class="styBoldText">(B)</span> Short-Term gains and losses(Form<br/>
					1099-B, box 3, does not show basis)
				</label>
			</div>
		</div>
		<div class="styIRS8949LNDesc"  style="width:60mm;">
			<div style="width:3mm;float:left;">
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$NodeData/TransactionsNotRptedOn1099BInd"/>
						<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransactionsNotRptedOn1099BInd</xsl:with-param>
					</xsl:call-template>
				</input>
			</div>
			<div style="width:53mm;padding-left:1.5mm;clear:none;float:left;">
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$NodeData/TransactionsNotRptedOn1099BInd"/>
						<xsl:with-param name="BackupName">ShortTerm<xsl:number value="position()"/>TransactionsNotRptedOn1099BInd</xsl:with-param>
					</xsl:call-template>
					<span class="styBoldText">(C)</span> Short-Term gains and losses<br/>
					(Form 1099-B not received)
				</label>
			</div>
		</div>
		<div class="styGenericDiv" style="width:170mm;">
			<b>Note.</b> Please round and use whole dollars on this form.
		</div>
		<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
		<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
		<div class="styGenericDiv" style="width:3.2mm;float:right;">
			<!-- button display logic -->
			<xsl:call-template name="SetDynamicTableToggleButton">
				<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainsAndLossesAssetGrp"/>
				<xsl:with-param name="containerHeight" select="25"/>
				<xsl:with-param name="headerRowCount" select="2"/>
				<xsl:with-param name="containerID" select="$containerPos"/>
			</xsl:call-template>
			<!-- end button display logic -->
		</div>
		<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
	</div>
	<div class="styIRS8949LineItem">
		<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
		<div class="styTableContainerNBB">
			<xsl:attribute name="id"><xsl:value-of select="$containerPos"/></xsl:attribute>
			<!-- ++++++++++++++++++++++++ Start: Table  ++++++++++++++++++++++ -->
			<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
			<xsl:call-template name="SetInitialState"/>
			<table class="styTable" cellspacing="0" style="width:100%;">
				<thead class="styTableThead">
					<xsl:call-template name="ShrtTrmGrpHeaders"/>
				</thead>
			<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
			<!-- ++++++++++++++++++++++++ Start: Table Footers ++++++++++++++++++++++ -->
				<tfoot>
					<tr style="border-top:1px solid;border-color:black;">
						<td colspan="4" style="border-bottom:1px solid black;border-right:1px solid black;">
							<div class="styIRS8949CleanDiv" style="float:left;height:12mm;padding:0px 0px 0px 0px;border-right:1px solid black;">
								<div class="styIRS8949LNLeftNumBox" style="width:5mm;padding-left: 2mm;">2</div>
								<div class="styIRS8949LNDesc" style="width:auto;height:100%;padding-left: 1mm;padding-right: 1mm;">
									<span class="styBoldText">Totals</span>. Add the amounts in columns (e) and (f).  Also,<br/>
										combine the amounts in column (g). Enter here and include<br/>
										on Schedule D, line 1 (if box A above is checked), line 2 (if<br/>
										box B above is checked), or line 3 (if box C above is<br/>
										checked)
										<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:12px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
									<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
								</div>
							</div>
							<div class="styIRS8949CleanDiv" style="float:left;clear:none;padding-left:1mm;width:4mm;border:0px;">
								<br /> <br/><br/><br/>
								<span  class="styBoldText"> 2</span>
							</div>
						</td>
						<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 7pt; text-align:right; border-bottom:1px solid black;border-right:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$NodeData/TotalSalesPrice"/>
							</xsl:call-template>
						</td>
						<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 7pt; text-align:right; border-bottom:1px solid black;border-right:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$NodeData/TotalCostOrOtherBasis"/>
							</xsl:call-template>
						</td>
						<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 7pt; text-align:right; border-bottom:1px solid black;border-right:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$NodeData/TotAdjustmentsToGainOrLossAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</tfoot>
			<!-- ++++++++++++++++++++++++ End: Table Footers +++++++++++++++++++++++ -->
				<tbody>
			<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
					<xsl:if test="($Print != $Separated) or (count($NodeData/CapitalGainsAndLossesAssetGrp) &lt;=25)">
						<xsl:for-each select="$NodeData/CapitalGainsAndLossesAssetGrp">
							<xsl:call-template name="ShrtTrmGrpRows"/>
						</xsl:for-each>
						<xsl:if test="count($NodeData/CapitalGainsAndLossesAssetGrp) &lt; 25">
							<xsl:call-template name="blank-rows">
								<xsl:with-param name="count" select="25 - count($NodeData/CapitalGainsAndLossesAssetGrp)"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
					<!-- Creates empty table rows  -->
					<xsl:if test="(($Print = $Separated) and (count($NodeData/CapitalGainsAndLossesAssetGrp) &gt; 25))">
						<tr style="border-color:black;">
							<!--+++++++++++++++++++A+++++++++++++++++++-->
							<td class="styIRS8949TableCell" style="width:50mm;">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainsAndLossesAssetGrp"/>
								</xsl:call-template>
								<span style="width:0px"/>
							</td>
							<!--++++++++++++++++++++B++++++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
							<!--++++++++++++++++++++C++++++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
							<!--+++++++++++++++++++++D+++++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
							<!--++++++++++++++++++++++E++++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
							<!--+++++++++++++++++++++++F+++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
							<!--+++++++++++++++++++++++G+++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
						</tr>
						<xsl:call-template name="blank-rows">
							<xsl:with-param name="count" select="24"/>
						</xsl:call-template>
					</xsl:if>
					<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
				</tbody>
			</table>
		</div>
		<!-- Set Initial Height of Above Table -->
		<xsl:call-template name="SetInitialDynamicTableHeight">
			<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainsAndLossesAssetGrp"/>
			<xsl:with-param name="containerHeight" select="25"/>
			<xsl:with-param name="headerRowCount" select="1"/>
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
	<xsl:variable name="containerPos">LongTermCapitalGainAndLossGrpDiv<xsl:number value="position()"/></xsl:variable>
	<!-- BEGIN: Part II (Header)-->
	<div class="styIRS8949LineItem" style="padding-top:1.5mm;padding-bottom:1.5mm;border-bottom:1px solid;">
		<div class="styPartName" style="width:15mm;">Part II</div>
		<div class="styPartDesc" style="padding-left:3mm;">
			Long-Term Capital Gains and Losses&#8212;Assets Held More Than One Year
		</div>
	</div>
	<div class="styIRS8949LineItem">
		Check the box below that describes the transactions listed on this page.
	</div>
	<div class="styIRS8949LineItem">
		<b>Caution.</b>
		<span style="width:3px;"/>
		Check only one box. If you have more than one type of transaction, complete a separate Form 8949 for each type.
	</div>
	<!-- END: Part I (Header)-->
	<!-- BEGIN: Part I (Body) -->
	<!-- ################################################################################# -->
	<!-- Begin (Line) 1 -->
	<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
	<!-- Begin Checkboxes (a),(b),(c) -->
	<div class="styBB" style="width:187mm;">
		<div class="styIRS8949LNDesc"  style="width:60mm;">
			<div style="width:3mm;float:left;">
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BThatShowBssInd"/>
						<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransRptOn1099BThatShowBssInd</xsl:with-param>
					</xsl:call-template>
				</input>
			</div>
			<div style="width:53mm;padding-left:1.5mm;clear:none;float:left;">
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BThatShowBssInd"/>
						<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransRptOn1099BThatShowBssInd</xsl:with-param>
					</xsl:call-template>
					<span class="styBoldText">(A)</span> Long-Term gains and losses<br/>
					(Form 1099-B, box 3, shows basis)
				</label>
			</div>
		</div>
		<div class="styIRS8949LNDesc"  style="width:60mm;">
			<div style="width:3mm;float:left;">
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BNotShowBasisInd"/>
						<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransRptOn1099BNotShowBasisInd</xsl:with-param>
					</xsl:call-template>
				</input>
			</div>
			<div style="width:53mm;padding-left:1.5mm;clear:none;float:left;">
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$NodeData/TransRptOn1099BNotShowBasisInd"/>
						<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransRptOn1099BNotShowBasisInd</xsl:with-param>
					</xsl:call-template>
					<span class="styBoldText">(B)</span> Long-Term gains and losses(Form<br/>
					1099-B, box 3, does not show basis)
				</label>
			</div>
		</div>
		<div class="styIRS8949LNDesc"  style="width:60mm;">
			<div style="width:3mm;float:left;">
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$NodeData/TransactionsNotRptedOn1099BInd"/>
						<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransactionsNotRptedOn1099BInd</xsl:with-param>
					</xsl:call-template>
				</input>
			</div>
			<div style="width:53mm;padding-left:1.5mm;clear:none;float:left;">
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$NodeData/TransactionsNotRptedOn1099BInd"/>
						<xsl:with-param name="BackupName">LongTerm<xsl:number value="position()"/>TransactionsNotRptedOn1099BInd</xsl:with-param>
					</xsl:call-template>
					<span class="styBoldText">(C)</span> Long-Term gains and losses<br/>
					(Form 1099-B not received)
				</label>
			</div>
		</div>
		<div class="styGenericDiv" style="width:170mm;">
			<b>Note.</b> Please round and use whole dollars on this form.
		</div>
		<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
		<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
		<div class="styGenericDiv" style="width:3.2mm;float:right;">
			<!-- button display logic -->
			<xsl:call-template name="SetDynamicTableToggleButton">
				<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainsAndLossesAssetGrp"/>
				<xsl:with-param name="containerHeight" select="25"/>
				<xsl:with-param name="headerRowCount" select="2"/>
				<xsl:with-param name="containerID" select="$containerPos"/>
			</xsl:call-template>
			<!-- end button display logic -->
		</div>
		<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
	</div>
	<div class="styIRS8949LineItem">
		<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
		<div class="styTableContainerNBB">
			<xsl:attribute name="id"><xsl:value-of select="$containerPos"/></xsl:attribute>
			<!-- ++++++++++++++++++++++++ Start: Table  ++++++++++++++++++++++ -->
			<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
			<xsl:call-template name="SetInitialState"/>
			<table class="styTable" cellspacing="0" style="width:100%;">
				<thead class="styTableThead">
					<xsl:call-template name="LongTrmGrpHeaders"/>
				</thead>
			<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
			<!-- ++++++++++++++++++++++++ Start: Table Footers ++++++++++++++++++++++ -->
				<tfoot>
					<tr style="border-top:1px solid;border-color:black;">
						<td colspan="4" style="border-bottom:1px solid black;border-right:1px solid black;">
							<div class="styIRS8949CleanDiv" style="float:left;height:12mm;padding:0px 0px 0px 0px;border-right:1px solid black;">
								<div class="styIRS8949LNLeftNumBox" style="width:5mm;padding-left: 2mm;">4</div>
								<div class="styIRS8949LNDesc" style="width:auto;height:100%;padding-left: 1mm;padding-right: 1mm;">
									<span class="styBoldText">Totals</span>. Add the amounts in columns (e) and (f).  Also,<br/>
										combine the amounts in column (g). Enter here and include<br/>
										on Schedule D, line 8 (if box A above is checked), line 9 (if<br/>
										box B above is checked), or line 10 (if box C above is<br/>
										checked)
										<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:12px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
									<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
								</div>
							</div>
							<div class="styIRS8949CleanDiv" style="float:left;clear:none;padding-left:1mm;width:4mm;border:0px;">
								<br /> <br/><br/><br/>
								<span  class="styBoldText"> 2</span>
							</div>
						</td>
						<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 7pt; text-align:right; border-bottom:1px solid black;border-right:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$NodeData/TotalSalesPrice"/>
							</xsl:call-template>
						</td>
						<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 7pt; text-align:right; border-bottom:1px solid black;border-right:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$NodeData/TotalCostOrOtherBasis"/>
							</xsl:call-template>
						</td>
						<td class="styIRS8949TableCell" valign="bottom" style="width:30mm;padding-bottom:1mm;font-size: 7pt; text-align:right; border-bottom:1px solid black;border-right:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$NodeData/TotAdjustmentsToGainOrLossAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</tfoot>
			<!-- ++++++++++++++++++++++++ End: Table Footers +++++++++++++++++++++++ -->
				<tbody>
			<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
					<xsl:if test="($Print != $Separated) or (count($NodeData/CapitalGainsAndLossesAssetGrp) &lt;=25)">
						<xsl:for-each select="$NodeData/CapitalGainsAndLossesAssetGrp">
							<xsl:call-template name="ShrtTrmGrpRows"/>
						</xsl:for-each>
						<xsl:if test="count($NodeData/CapitalGainsAndLossesAssetGrp) &lt; 25">
							<xsl:call-template name="blank-rows">
								<xsl:with-param name="count" select="25 - count($NodeData/CapitalGainsAndLossesAssetGrp)"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
					<!-- Creates empty table rows  -->
					<xsl:if test="(($Print = $Separated) and (count($NodeData/CapitalGainsAndLossesAssetGrp) &gt; 25))">
						<tr style="border-color:black;">
							<!--+++++++++++++++++++A+++++++++++++++++++-->
							<td class="styIRS8949TableCell" style="width:50mm;">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainsAndLossesAssetGrp"/>
								</xsl:call-template>
								<span style="width:0px"/>
							</td>
							<!--++++++++++++++++++++B++++++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
							<!--++++++++++++++++++++C++++++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
							<!--+++++++++++++++++++++D+++++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
							<!--++++++++++++++++++++++E++++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
							<!--+++++++++++++++++++++++F+++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
							<!--+++++++++++++++++++++++G+++++++++++++++-->
							<td class="styIRS8949TableCell" >
								<span style="width:4px"/>
							</td>
						</tr>
						<xsl:call-template name="blank-rows">
							<xsl:with-param name="count" select="24"/>
						</xsl:call-template>
					</xsl:if>
					<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
				</tbody>
			</table>
		</div>
		<!-- Set Initial Height of Above Table -->
		<xsl:call-template name="SetInitialDynamicTableHeight">
			<xsl:with-param name="TargetNode" select="$NodeData/CapitalGainsAndLossesAssetGrp"/>
			<xsl:with-param name="containerHeight" select="25"/>
			<xsl:with-param name="headerRowCount" select="1"/>
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
		<div class="pageEnd" style="width:187mm;padding-top:.5mm;padding-bottom:2mm;">
			<xsl:if test="$Info">
				<div style="float:left;">
					<span class="styBoldText">
						<xsl:value-of select="$Info"/>
					</span>
				</div>
			</xsl:if>
			<div style="float:right;">
				<span style="width:40px;"/>  
				Form <span class="styBoldText" style="font-size:8pt;">8949</span> (2011)
			</div>
			<xsl:if test="$CatNumber">
				<div style="float:right;">
					<span>
						<xsl:attribute name="style"><xsl:value-of select="$CatNumberSpanWidth"/></xsl:attribute>
						<xsl:value-of select="$CatNumber"/>
					</span>
				</div>
			</xsl:if>
		</div>
		<!-- END Page Break and Footer-->
		<!-- BEGIN Page Header -->
		<div class="styTBB" style="width:187mm;padding-top:.5mm;">
			<div style="float:left;">
				Form 8949 (2011)<span style="width:95mm;"/>
				Attachment Sequence No. <b>12A</b><span style="width:55px"/>
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
			<tr style="border-color:black;">
					<!--+++++++++++++++++++A+++++++++++++++++++-->
					<td class="styIRS8949TableCell" >
						<span style="width:4px"/>
					</td>
					<!--++++++++++++++++++++B++++++++++++++++++-->
					<td class="styIRS8949TableCell" >
						<span style="width:4px"/>
					</td>
					<!--++++++++++++++++++++C++++++++++++++++++-->
					<td class="styIRS8949TableCell" >
						<span style="width:4px"/>
					</td>
					<!--+++++++++++++++++++++D+++++++++++++++++-->
					<td class="styIRS8949TableCell" >
						<span style="width:4px"/>
					</td>
					<!--++++++++++++++++++++++E++++++++++++++++-->
					<td class="styIRS8949TableCell" >
						<span style="width:4px"/>
					</td>
					<!--+++++++++++++++++++++++F+++++++++++++++-->
					<td class="styIRS8949TableCell" >
						<span style="width:4px"/>
					</td>
					<!--+++++++++++++++++++++++G+++++++++++++++-->
					<td class="styIRS8949TableCell" style="border-right-width:0px;">
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
		<html lang="EN-US">
			<head>
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
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;font-size:8pt;">
								Form<span class="styFormNumber">  8949</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8949Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<!-- BEGIN:	Header Title-->
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div class="styFTBox" style="width:125mm;">
							<br/>
							<div class="styMainTitle" style="height:8mm;">Sales and Other Dispositions of Capital Assets</div>
							<!--<div class="styIRS8949LineItem" style="width:100%;height:4mm;">
								<div class="styIRS8949LNDesc" style="width:85mm;padding-left:5mm;">
									<span class="stySmallText">
										<span class="styBoldText">
											For calendar year 2010 or other tax year beginning
											<span style="width:3px;"/>
											<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
										</span>
									</span>
								</div>
								<div class="styIRS8949LNDesc" style="width:40mm;padding-left:2mm;">
									<span class="stySmallText">
										<span class="styBoldText">
											, and ending
											<span style="width:3px;"/>
											<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
										</span>
									</span>
								</div>
							</div>-->
							<!-- BEGIN:	2nd Title -->
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="width:120mm;text-align:center;">
									<span style="width:2mm;"/>
									<img src="{$ImagePath}/8949_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:3px;"/>
									<span class="styBoldText">See Instructions for Schedule D (Form 1040).</span> <br/>
									<span style="width:2mm"/>
									<img src="{$ImagePath}/8949_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:3px;"/>
									<span class="styBoldText">Attach to Schedule D to list your transactions for lines 1, 2, 3, 8, 9, and 10.</span>
								</span>
							</div>
							<!-- END:	2nd Title -->
						</div>
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- END:	Header Title-->
						<div class="styTYBox" style="width:30mm;border-left-width:2px;">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">11</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">12A</span>
							</div>
						</div>
					</div>
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
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
						<xsl:with-param name="Info">For Paperwork Reduction Act Notice, see your tax return instructions..</xsl:with-param>
						<xsl:with-param name="CatNumber">Cat. No. 37768Z</xsl:with-param>
						<xsl:with-param name="CatNumberSpanWidth">width:53mm;</xsl:with-param>
						<xsl:with-param name="PageNumber">2</xsl:with-param>
					</xsl:call-template>
					<!-- END Page Header -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return. Do not enter name and social security number if shown on other side.<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
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
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8949</span> (2011)
						</div>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<xsl:variable name="TableWidth">100</xsl:variable>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8949Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
					<!-- Separated Data for Part I - CapitalGainsAndLossesAssetGrp -->
					<xsl:for-each select="$Form8949Data/ShortTermCapitalGainAndLossGrp">
						<xsl:if test="($Print = $Separated) and (count(CapitalGainsAndLossesAssetGrp) &gt; 25)">
							<br/>
							<br/>
							<span class="styRepeatingDataTitle">
								Form 8949, Part I, Table <xsl:number value="position()"/> - Short-Term Capital Gains and Losses&#8212;Assets Held One Year or Less
							</span>
							<table class="styDepTbl" cellspacing="0">
								<thead class="styTableThead">
									<xsl:call-template name="ShrtTrmGrpHeaders"/>
								</thead>
								<tbody>
									<xsl:for-each select="CapitalGainsAndLossesAssetGrp">
										<xsl:call-template name="ShrtTrmGrpRows"/>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<!-- Separated Data for Part II - CapitalGainsAndLossesAssetGrp -->
					<xsl:for-each select="$Form8949Data/LongTermCapitalGainAndLossGrp">
						<xsl:if test="($Print = $Separated) and (count(CapitalGainsAndLossesAssetGrp) &gt; 25)">
							<br/>
							<br/>
							<span class="styRepeatingDataTitle">
								Form 8949, Part II, Table <xsl:number value="position()"/> - Long-Term Capital Gains and Losses&#8212;Assets Held More Than One Year
							</span>
							<table class="styDepTbl" cellspacing="0">
								<thead class="styTableThead">
									<xsl:call-template name="LongTrmGrpHeaders"/>
								</thead>
								<tbody>
									<xsl:for-each select="CapitalGainsAndLossesAssetGrp">
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
