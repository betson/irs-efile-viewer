<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8582Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8582Data" select="$RtnDoc/IRS8582"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="AddParentheses"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">32mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6.5pt;
				<xsl:choose>
					<xsl:when test="$TargetNode">
						<xsl:choose>
							<xsl:when test="$TargetNode/@referenceDocumentId">padding-top:3px;</xsl:when>
							<xsl:otherwise>padding-top:4px;</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>padding-top:4px;</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$AmountBoxStyle">
					<xsl:value-of select="$AmountBoxStyle"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:if test="$TargetNode">
				<xsl:if test="$AddParentheses">(<span style="width:4px;"/></xsl:if>
				<xsl:choose>
					<xsl:when test="$PopulateAsText">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$TargetNode/@referenceDocumentId">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="$AddParentheses">
					<span style="width:4px;"/>)</xsl:if>
			</xsl:if>
		</div>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:3px 0px 0px 0px;
				border-right-width:0px;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle">
					<xsl:value-of select="$NumberBoxStyle"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- ////////////////////////////////////////////////////////////// (Template: Wrksht1Headers) -->
	<xsl:template name="Wrksht1Headers">
		<xsl:param name="AddColoredHeaders"/>
		<xsl:variable name="CommonStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS8582TableCell" scope="col" rowspan="2">
				<xsl:attribute name="style">width:120mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Name of activity
			</th>
			<th class="styIRS8582TableCell" scope="col" colspan="2">
				<xsl:attribute name="style">width:30%; height:7mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Current year
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Prior years
			</th>
			<th class="styIRS8582TableCell" scope="col" colspan="2">
				<xsl:attribute name="style">width:30%;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				Overall gain or loss
			</th>
		</tr>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%; height:8mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(a) Net income<br/>(line 1a)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(b) Net loss<br/>(line 1b)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(c) Unallowed<br/>loss (line 1c)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(d) Gain
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				(e) Loss
			</th>
		</tr>
	</xsl:template>
	<xsl:template name="Wrksht1Rows">
		<xsl:param name="AddColoredRows"/>
		<xsl:param name="AddAdditionalDataMessage"/>
		<!-- ClassType -->
		<xsl:variable name="ClassType">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				<xsl:otherwise>styDepTblRow2</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr style="font-size:7pt;font-family:arial;">
			<xsl:if test="$AddColoredRows">
				<xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
			</xsl:if>
			<!-- Name of activity +++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:25%;text-align:left;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="PassiveActivityName"/>
				</xsl:call-template>
				<xsl:if test="$AddAdditionalDataMessage">
					<xsl:if test="((count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &gt;5) and ($Print = $Separated))">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</td>
			<!-- (a) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="CurrentYearNetIncomeAmt"/>
				</xsl:call-template>
			</td>
			<!-- (b) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="CurrentYearNetLossAmt"/>
				</xsl:call-template>
			</td>
			<!-- (c) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="PriorYearRentalUnallowedAmt"/>
				</xsl:call-template>
			</td>
			<!-- (d) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="OverallGainAmt"/>
				</xsl:call-template>
			</td>
			<!-- (e) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;border-right-width:0px;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="OverallLossAmt"/>
				</xsl:call-template>
			</td>
		</tr>
		
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- ////////////////////////////////////////////////////////////// (Template: Wrksht2Headers) -->
	<xsl:template name="Wrksht2Headers">
		<xsl:param name="AddColoredHeaders"/>
		<xsl:variable name="CommonStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:120mm; height: 8.5mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Name of activity
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:25%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(a) Current year<br/>deductions (line 2a)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:25%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(b) Prior year<br/>unallowed deductions (line 2b)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:25%;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				(c) Overall loss
			</th>
		</tr>
	</xsl:template>
	<xsl:template name="Wrksht2Rows">
		<xsl:param name="AddColoredRows"/>
		<xsl:param name="AddAdditionalDataMessage"/>
		<!-- ClassType -->
		<xsl:variable name="ClassType">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				<xsl:otherwise>styDepTblRow2</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr style="font-size:7pt;font-family:arial;">
			<xsl:if test="$AddColoredRows">
				<xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
			</xsl:if>
			<!-- Name of activity +++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:25%;text-align:left;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="CommercialActivityName"/>
				</xsl:call-template>
				<xsl:if test="$AddAdditionalDataMessage">
					<xsl:if test="((count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &gt;5) and ($Print = $Separated))">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</td>
			<!-- (a) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:25%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="CurrentYearDeductionsAmt"/>
				</xsl:call-template>
			</td>
			<!-- (b) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:25%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="Sect179DeducDeprecPYAmt"/>
				</xsl:call-template>
			</td>
			<!-- (c) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:25%;text-align:right;border-right-width:0px;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="OverallLossAmt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- ////////////////////////////////////////////////////////////// (Template: Wrksht3Headers) -->
	<xsl:template name="Wrksht3Headers">
		<xsl:param name="AddColoredHeaders"/>
		<xsl:variable name="CommonStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS8582TableCell" scope="col" rowspan="2">
				<xsl:attribute name="style">width:120mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Name of activity
			</th>
			<th class="styIRS8582TableCell" scope="col" colspan="2">
				<xsl:attribute name="style">width:30%; height:7mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Current year
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Prior years
			</th>
			<th class="styIRS8582TableCell" scope="col" colspan="2">
				<xsl:attribute name="style">width:30%;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				Overall gain or loss
			</th>
		</tr>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%; height:8mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(a) Net income<br/>(line 3a)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(b) Net loss<br/>(line 3b)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(c) Unallowed<br/>loss (line 3c)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(d) Gain
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				(e) Loss
			</th>
		</tr>
	</xsl:template>
	<xsl:template name="Wrksht3Rows">
		<xsl:param name="AddColoredRows"/>
		<xsl:param name="AddAdditionalDataMessage"/>
		<!-- ClassType -->
		<xsl:variable name="ClassType">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				<xsl:otherwise>styDepTblRow2</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr style="font-size:7pt;font-family:arial;">
			<xsl:if test="$AddColoredRows">
				<xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
			</xsl:if>
			<!-- Name of activity +++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:25%;text-align:left;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="NonParticipateActivityName"/>
				</xsl:call-template>
				<xsl:if test="$AddAdditionalDataMessage">
					<xsl:if test="((count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &gt;5) and ($Print = $Separated))">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</td>
			<!-- (a) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="CurrentYearNetIncomeAmt"/>
				</xsl:call-template>
			</td>
			<!-- (b) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="CurrentYearNetLossAmt"/>
				</xsl:call-template>
			</td>
			<!-- (c) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="PriorYearUnallowedLossesAmt"/>
				</xsl:call-template>
			</td>
			<!-- (d) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="OverallGainAmt"/>
				</xsl:call-template>
			</td>
			<!-- (e) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;border-right-width:0px;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="OverallLossAmt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- ////////////////////////////////////////////////////////////// (Template: Wrksht4Headers) -->
	<xsl:template name="Wrksht4Headers">
		<xsl:param name="AddColoredHeaders"/>
		<xsl:variable name="CommonStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:120mm; height:15mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Name of activity
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Form or schedule<br/>and line number<br/>to be reported on<br/>(see instructions)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(a) Loss
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(b) Ratio
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(c) Special<br/>allowance
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:15%;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				(d) Subtract<br/>column (c) from<br/>column (a)
			</th>
		</tr>
	</xsl:template>
	<xsl:template name="Wrksht4Rows">
		<xsl:param name="AddColoredRows"/>
		<xsl:param name="AddAdditionalDataMessage"/>
		<!-- ClassType -->
		<xsl:variable name="ClassType">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				<xsl:otherwise>styDepTblRow2</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr style="font-size:7pt;font-family:arial;">
			<xsl:if test="$AddColoredRows">
				<xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
			</xsl:if>
			<!-- Name of activity +++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:25%;text-align:left;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="SpecialAllowanceActivityName"/>
				</xsl:call-template>
				<xsl:if test="$AddAdditionalDataMessage">
					<xsl:if test="((count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &gt;5) and ($Print = $Separated))">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</td>
			<!-- ++++++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:center;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="ReportingFormOrScheduleNm"/>
				</xsl:call-template>
			</td>
			<!-- (a) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="F8582WrkshtLossesAmt"/>
				</xsl:call-template>
			</td>
			<!-- (b) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:center;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="LossesPct"/>
				</xsl:call-template>
			</td>
			<!-- (c) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="SpecialAllowanceAmt"/>
				</xsl:call-template>
			</td>
			<!-- (d) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:15%;text-align:right;border-right-width:0px;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="NetSpecialAllowanceAmt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- ////////////////////////////////////////////////////////////// (Template: Wrksht5Headers) -->
	<xsl:template name="Wrksht5Headers">
		<xsl:param name="AddColoredHeaders"/>
		<xsl:variable name="CommonStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:127mm; height:15mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Name of activity
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:19%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Form or schedule<br/>and line number<br/>to be reported on<br/>(see instructions)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:19%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(a) Loss
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:18%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(b) Ratio
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:19%;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				(c) Unallowed loss
			</th>
		</tr>
	</xsl:template>
	<xsl:template name="Wrksht5Rows">
		<xsl:param name="AddColoredRows"/>
		<xsl:param name="AddAdditionalDataMessage"/>
		<!-- ClassType -->
		<xsl:variable name="ClassType">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				<xsl:otherwise>styDepTblRow2</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr style="font-size:7pt;font-family:arial;">
			<xsl:if test="$AddColoredRows">
				<xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
			</xsl:if>
			<!-- Name of activity +++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:25%;text-align:left;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="UnallowedLossActivityName"/>
				</xsl:call-template>
				<xsl:if test="$AddAdditionalDataMessage">
					<xsl:if test="((count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &gt;5) and ($Print = $Separated))">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</td>
			<!-- ++++++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:19%;text-align:center;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="ReportingFormOrScheduleNm"/>
				</xsl:call-template>
			</td>
			<!-- (a) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:19%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="F8582WrkshtLossesAmt"/>
				</xsl:call-template>
			</td>
			<!-- (b) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:18%;text-align:center;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="LossesPct"/>
				</xsl:call-template>
			</td>
			<!-- (c) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:19%;text-align:right;border-right-width:0px;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="PriorYearUnallowedLossesAmt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- ////////////////////////////////////////////////////////////// (Template: Wrksht6Headers) -->
	<xsl:template name="Wrksht6Headers">
		<xsl:param name="AddColoredHeaders"/>
		<xsl:variable name="CommonStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:120mm; height:15mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Name of activity
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:19%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				Form or schedule<br/>and line number to<br/>be reported on (see<br/>instructions)
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:19%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(a) Loss
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:18%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(b) Unallowed loss
			</th>
			<th class="styIRS8582TableCell" scope="col">
				<xsl:attribute name="style">width:19%;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				(c) Allowed loss
			</th>
		</tr>
	</xsl:template>
	<xsl:template name="Wrksht6Rows">
		<xsl:param name="AddColoredRows"/>
		<xsl:param name="AddAdditionalDataMessage"/>
		<!-- ClassType -->
		<xsl:variable name="ClassType">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				<xsl:otherwise>styDepTblRow2</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr style="font-size:7pt;font-family:arial;">
			<xsl:if test="$AddColoredRows">
				<xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
			</xsl:if>
			<!-- Name of activity +++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:25%;text-align:left;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="AllowedLossActivityName"/>
				</xsl:call-template>
				<xsl:if test="$AddAdditionalDataMessage">
					<xsl:if test="((count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &gt;5) and ($Print = $Separated))">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</td>
			<!-- ++++++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:19%;text-align:center;</xsl:attribute>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="ReportingFormOrScheduleNm"/>
				</xsl:call-template>
			</td>
			<!-- (a) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:19%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="F8582WrkshtLossesAmt"/>
				</xsl:call-template>
			</td>
			<!-- (b) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:18%;text-align:right;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="PriorYearUnallowedLossesAmt"/>
				</xsl:call-template>
			</td>
			<!-- (c) +++++++++++++++++++++++ -->
			<td class="styIRS8582TableCell">
				<xsl:attribute name="style">width:19%;text-align:right;border-right-width:0px;</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="F8582WrkshtAllowedLossesAmt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- ////////////////////////////////////////////////////////////// (Template: Wrksht7PrintWrkshtLossActivityGrp) -->
	<xsl:template name="Wrksht7">
		<xsl:param name="TargetNode"/>
		<div class="styGenericDiv" style="width:187mm;height:8mm;border-top:1px solid black;border-bottom:1px solid black;float:none;clear:both;">
			<!-- Name of activity -->
			<div class="styIRS8582CleanDiv" style="width:25%;height:4mm;">
				<span style="width:100%;text-align:left;padding-top:1mm;">
					<b>Name of activity:</b>
				</span>
			</div>
			<!-- (a) -->
			<div class="styIRS8582CleanDiv" style="width:15%;height:4mm;">
				<span style="width:100%;text-align:center;padding-top:1mm;">
					<b>(a)</b>
				</span>
			</div>
			<!-- (b) -->
			<div class="styIRS8582CleanDiv" style="width:15%;height:4mm;">
				<span style="width:100%;text-align:center;padding-top:1mm;">
					<b>(b)</b>
				</span>
			</div>
			<!-- (c) Ratio -->
			<div class="styIRS8582CleanDiv" style="width:15%;height:4mm;">
				<span style="width:100%;text-align:center;padding-top:1mm;">
					<b>(c) Ratio</b>
				</span>
			</div>
			<!-- (d) Unallowed loss -->
			<div class="styIRS8582CleanDiv" style="width:15%;height:4mm;">
				<span style="width:100%;text-align:center;padding-top:1mm;">
					<b>(d) Unallowed loss</b>
				</span>
			</div>
			<!-- (e) Allowed loss -->
			<div class="styIRS8582CleanDiv" style="width:15%;height:4mm;border-right-width:0px;">
				<span style="width:100%;text-align:center;padding-top:1mm;">
					<b>(e) Allowed loss</b>
				</span>
			</div>
			<div class="styIRS8582CleanDiv" style="width:25%;height:4mm;">
				<span style="width:100%;text-align:left;">
					<xsl:if test="$TargetNode">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$TargetNode/MultipleLossActivityName"/>
						</xsl:call-template>
					</xsl:if>
				</span>
			</div>
			<!-- (a) -->
			<div class="styIRS8582CleanDiv" style="width:15%;height:4mm;" />
			<!-- (b) -->
			<div class="styIRS8582CleanDiv" style="width:15%;height:4mm;" />
			<!-- (c) Ratio -->
			<div class="styIRS8582CleanDiv" style="width:15%;height:4mm;" />
			<!-- (d) Unallowed loss -->
			<div class="styIRS8582CleanDiv" style="width:15%;height:4mm;" />
			<!-- (e) Allowed loss -->
			<div class="styIRS8582CleanDiv" style="width:15%;height:4mm;border-right-width:0px;" />
		</div>
		<xsl:choose>
			<xsl:when test="not($TargetNode) or not($TargetNode/WrkshtLossActivityGrp)">
				<xsl:call-template name="Wrksht7PrintWrkshtLossActivityGrp"/>
				<xsl:call-template name="Wrksht7PrintWrkshtLossActivityGrp"/>
				<xsl:call-template name="Wrksht7PrintWrkshtLossActivityGrp"/>
			</xsl:when>
				<xsl:when test="count($TargetNode/WrkshtLossActivityGrp) = 1">
				<xsl:for-each select="$TargetNode/WrkshtLossActivityGrp">
					<xsl:call-template name="Wrksht7PrintWrkshtLossActivityGrp">
						<xsl:with-param name="TargetNode" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<xsl:call-template name="Wrksht7PrintWrkshtLossActivityGrp"/>
				<xsl:call-template name="Wrksht7PrintWrkshtLossActivityGrp"/>
			</xsl:when>
			<xsl:when test="count($TargetNode/WrkshtLossActivityGrp) = 2">
				<xsl:for-each select="$TargetNode/WrkshtLossActivityGrp">
					<xsl:call-template name="Wrksht7PrintWrkshtLossActivityGrp">
						<xsl:with-param name="TargetNode" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<xsl:call-template name="Wrksht7PrintWrkshtLossActivityGrp"/>
			</xsl:when>
				<xsl:otherwise>
				<xsl:for-each select="$TargetNode/WrkshtLossActivityGrp">
					<xsl:call-template name="Wrksht7PrintWrkshtLossActivityGrp">
						<xsl:with-param name="TargetNode" select="."/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
		<div class="styGenericDiv" style="width:187mm; float:left; clear:both;">
			<div class="styIRS8582LineItem" style="height: 6mm; line-height: 150%; border-bottom:2px solid black;">
				<div class="styIRS8582CleanDiv" style="width:40%;height:100%;">
					<div class="styIRS8582LNDesc" style="width:73.5mm;font-size:7pt;padding-left:2px;">
						<b>Total</b>
						<span style="float:right;">
							<!--Dotted Line-->
							<span class="styDotLn">.................</span>
							<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="Small Bullet"/>
						</span>
					</div>
				</div>
				<!-- (b) -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;">
					<span style="width:100%;text-align:right;padding-top:1mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/TotalNetIncomeLossAmt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<!-- (c) Ratio -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;text-align:center;padding-top:1mm;">
					<span style="width:100%;">
						<b>1.00</b>
					</span>
				</div>
				<!-- (d) Unallowed loss -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;">
					<span style="width:100%;text-align:right;padding-top:1mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/TotalUnallowedAmt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<!-- (e) Allowed loss -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;border-right-width:0px;">
					<span style="width:100%;text-align:right;padding-top:1mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/TotalAllowedAmt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="Wrksht7PrintWrkshtLossActivityGrp">
		<xsl:param name="TargetNode"/>
		<table cellspacing="0" cellpadding="0" style="page-break-inside:avoid;">
		<tr>
			<td>
			<div class="styIRS8582LineItem" style="height:11mm;">
				<div class="styIRS8582CleanDiv" style="width:25%;height:100%;">
					<span style="width:100%;text-align:left;">
							<b>
								Form or schedule and line number<br/>
								to be reported on (see<br/>
								instructions):
							</b>
							<span style="height:3mm; width:28mm; border-bottom: 1px dashed black; margin-left:0.5mm;">
								<xsl:if test="$TargetNode">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$TargetNode/ReportingFormOrScheduleNm"/>
									</xsl:call-template>
								</xsl:if>
							</span>
					</span> 
				</div>
				<!-- (a) -->
				<div class="styIRS8582CleanDiv" style="border-right-width:1px;border-bottom-width:1px;width:15%;height:100%;background-color:lightgrey;"/>
				<!-- (b) -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;"/>
				<!-- (c) Ratio -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;"/>
				<!-- (d) Unallowed loss -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;"/>
				<!-- (e) Allowed loss -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;border-right-width:0px;"/>
			</div>
			<!-- 1a -->
			<div class="styIRS8582LineItem" style="height:6.5mm;">
				<div class="styIRS8582CleanDiv" style="width:25%;height:100%;">
					<div class="styIRS8582LNLeftNumBox" style="padding-left:0mm;padding-right:2px;text-align:right;padding-top:0px;">1a</div>
						Net loss plus prior year unallowed<br/>
						loss from form or schedule
						<span style="float:right; padding-right:1mm;">
							<!--Dotted Line-->
							<span class="styDotLn">..</span>
							<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
						</span>
				</div>
				<!-- (a) -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;border-bottom-width:1px;">
					<span style="width:100%;text-align:right;padding-top:3mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/NetLossAmt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<!-- (b) -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;"/>
				<!-- (c) Ratio -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;"/>
				<!-- (d) Unallowed loss -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;"/>
				<!-- (e) Allowed loss -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;border-right-width:0px;"/>
			</div>
			<!-- 1b -->
			<div class="styIRS8582LineItem" style="height:6.5mm;">
				<div class="styIRS8582CleanDiv" style="width:25%;height:100%;">
					<div class="styIRS8582LNLeftNumBox" style="padding-left:0mm;padding-right:2px;text-align:right;padding-top:0px;">b</div>
						Net income from form or<br/>schedule
						<span style="float:right;  padding-right:1mm;">
							<!--Dotted Line-->
							<span class="styDotLn">.......</span>
							<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
						</span>
				</div>
				<!-- (a) -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;border-bottom-width:1px;">
					<span style="width:100%;text-align:right;padding-top:3mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/NetIncomeAmt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<!-- (b) -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;border-bottom-width:1px;"/>
				<!-- (c) Ratio -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;border-bottom-width:1px;"/>
				<!-- (d) Unallowed loss -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;border-bottom-width:1px;"/>
				<!-- (e) Allowed loss -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;background-color:lightgrey;border-bottom-width:1px;border-right-width:0px;"/>
			</div>
			<!-- 1c -->
			<div class="styIRS8582LineItem" style="height:7mm; line-height:7mm; border-bottom: 1px solid black;">
				<div class="styIRS8582CleanDiv" style="width:40%;height:100%;">
					<div class="styIRS8582LNLeftNumBox" style="padding-right:2px;text-align:right;padding-top:0px;">c</div>
						Subtract line 1b from line 1a. If zero or less, enter -0-
						<span style="float:right;  padding-right:1mm;">
							<!--Dotted Line-->
							<span class="styDotLn">..</span>
							<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
						</span>
				</div>
				<!-- (b) -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;">
					<span style="width:100%;text-align:right;padding-top:1mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/NetIncomeLossAmt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<!-- (c) Ratio -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;">
					<span style="width:100%;text-align:center;padding-top:1mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode/LossesPct"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<!-- (d) Unallowed loss -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;">
					<span style="width:100%;text-align:right;padding-top:1mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/PriorYearUnallowedLossesAmt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<!-- (e) Allowed loss -->
				<div class="styIRS8582CleanDiv" style="width:15%;height:100%;border-right-width:0px;">
					<span style="width:100%;text-align:right;padding-top:1mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/F8582WrkshtLossesAmt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
			</div>
			</td>
		</tr>
		</table>	
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8582Data)"/>
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
				<meta name="Description" content="IRS Form 8582"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8582Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8582" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:23mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  8582</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8582Data"/>
							</xsl:call-template>
							<br/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<div class="styMainTitle" style="height:8mm;">
								Passive Activity Loss Limitations<br/>
							</div>
							<div class="styFST" style="height:auto;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;padding-left:0px;">
										<div style="width:120mm;">
											<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="Small Bullet"/> 
											See separate instructions.<br/>
											<span style="height:3mm;" />
											<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="Small Bullet"/> 
											Attach to Form 1040 or Form 1041.<br/>
											<span style="height:3mm;" />
											<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="Small Bullet"/>
											Information about Form 8582 and its instructions is available at <i>www.irs.gov/form8582.</i>
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:23mm;">
							<div class="styOMB" style="height:auto;font-size:7pt;">OMB No. 1545-1008</div>
							<div class="styTY">20<span class="styTYColor">13</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">88</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:9mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="width:50mm;height:9mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Identifying number<br/>
							<span style="font-weight:normal;text-align:center;width:100%"> 
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</span>  
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;padding-bottom:0mm;padding-top:0mm;font-size:8.5pt;height:auto;">
							2013 Passive Activity Loss<br/>
							Caution:
							<span class="styNormalText">
								<span class="styItalicText">
									Complete Worksheets 1, 2, and 3 before completing Part I.
								</span>
							</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- ///////////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:8mm;">
							<div class="styIRS8582LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;font-size:8.5pt;">
								<b>Rental Real Estate Activities With Active Participation</b> (For the definition of active participation, see<br/>
								<b>Special Allowance for Rental Real Estate Activities</b> in the instructions.)
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="Height">100%</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (1a) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:7mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:2px;padding-top:0px;text-align:right;">1a</div>
							<div class="styIRS8582LNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:101mm;height:100%;padding-bottom:0mm;padding-top:0mm;">
									Activities with net income (enter the amount from Worksheet 1,<br/>
									column (a))
									<span class="styDotLn" style="float:right">....................</span>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8582Data/RentalRealtyIncomeAmt"/>
										<xsl:with-param name="Number">1a</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3mm;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:3.2mm;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (1b) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:7mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:0px;padding-top:0px;text-align:right;">b</div>
							<div class="styIRS8582LNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:101mm;height:100%;padding-top:0mm;padding-bottom:0mm;">
									Activities with net loss (enter the amount from Worksheet 1, column<br/>
									(b))
									<span class="styDotLn" style="float:right">.......................</span>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8582Data/RentalRealtyLossAmt"/>
										<xsl:with-param name="AddParentheses">true</xsl:with-param>
										<xsl:with-param name="Number">1b</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3mm;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:3.2mm;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (1c) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:7mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:0px;padding-top:0px;text-align:right;">c</div>
							<div class="styIRS8582LNDesc" style="width:99mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:101mm;height:100%;padding-top:0mm;padding-bottom:0mm;">
									Prior years unallowed losses (enter the amount from Worksheet 1,<br/>
									column (c))
									<span class="styDotLn" style="float:right">....................</span>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8582Data/PYUnallowedRentalLossAmt"/>
										<xsl:with-param name="AddParentheses">true</xsl:with-param>
										<xsl:with-param name="Number">1c</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3mm;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:3.2mm;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (1d) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:0px;text-align:right;">d</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:140.5mm;height:100%;">
									Combine lines 1a, 1b, and 1c
									<span class="styDotLn" style="float:right">.........................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/NetRentalRealtyAmt"/>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="Number">1d</xsl:with-param>
								<xsl:with-param name="Height">100%</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- ///////////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:4mm;">
							<div class="styIRS8582LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;font-size:8.5pt;">
								<b>Commercial Revitalization Deductions From Rental Real Estate Activities</b>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="Height">100%</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (2a) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:2px;text-align:right;">2a</div>
							<div class="styIRS8582LNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:101mm;height:100%;">
									Commercial revitalization deductions from Worksheet 2, column (a)
									<span class="styDotLn" style="float:right">..</span>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582Data/RevitalizationDeductionAmt"/>
										<xsl:with-param name="AddParentheses">true</xsl:with-param>
										<xsl:with-param name="Number">2a</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (2b) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:7mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:0px;padding-top:0px;text-align:right;">b</div>
							<div class="styIRS8582LNDesc" style="width:99mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:101mm;padding-top:0mm;padding-bottom:0mm;">
									Prior year unallowed commercial revitalization deductions from<br/>
									Worksheet 2, column (b)
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right">................</span>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8582Data/PriorYearRevitalizationAmt"/>
										<xsl:with-param name="AddParentheses">true</xsl:with-param>
										<xsl:with-param name="Number">2b</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3mm;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:3.2mm;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (2c) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:0px;text-align:right;">c</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:140.5mm;height:100%;">
									Add lines 2a and 2b
									<span class="styDotLn" style="float:right">............................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/NetRevitalizationAmt"/>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="AddParentheses">true</xsl:with-param>
								<xsl:with-param name="Number">2c</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- ///////////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;font-size:8.5pt;">
								<b>All Other Passive Activities</b>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="Height">100%</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (3a) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:7mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:2px;padding-top:0px;text-align:right;">3a</div>
							<div class="styIRS8582LNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:101mm;height:100%;padding-top:0mm;padding-bottom:0mm;">
									Activities with net income (enter the amount from Worksheet 3,<br/>
									column (a))
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right">.....................</span>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8582Data/OtherActivityIncomeAmt"/>
										<xsl:with-param name="Number">3a</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3mm;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:3.2mm;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (3b) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:7mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:0px;padding-top:0px;text-align:right;">b</div>
							<div class="styIRS8582LNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:101mm;padding-top:0mm;padding-bottom:0mm;">
									Activities with net loss (enter the amount from Worksheet 3, column<br/>
									(b))
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right">.......................</span>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8582Data/OtherActivityLossAmt"/>
										<xsl:with-param name="AddParentheses">true</xsl:with-param>
										<xsl:with-param name="Number">3b</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3mm;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:3.2mm;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (3c) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:7mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:0px;padding-top:0px;text-align:right;">c</div>
							<div class="styIRS8582LNDesc" style="width:99mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:101mm;padding-top:0mm;padding-bottom:0mm;">
									Prior years unallowed losses (enter the amount from Worksheet 3,<br/>
									column (c))
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right">.....................</span>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8582Data/PriorYearUnallowedOtherLossAmt"/>
										<xsl:with-param name="AddParentheses">true</xsl:with-param>
										<xsl:with-param name="Number">3c</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:3mm;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:3.2mm;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (3d) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:0px;text-align:right;">d</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:141mm;height:100%;">
									Combine lines 3a, 3b, and 3c
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right; padding-right:.5mm;">.........................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/NetOtherActivityAmt"/>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="Number">3d</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:11mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:10px;padding-top:0px;">4</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:141mm;height:100%; padding-top:0mm; padding-bottom:0mm;">
									Combine lines 1d, 2c, and 3d. If this line is zero or more, stop here and include this form with your<br/>
									return; all losses are allowed, including any prior year unallowed losses entered on line 1c, 2b, or 3c.<br/>
									Report the losses on the forms and schedules normally used
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right">..............</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/TotalPassiveActivityAmt"/>
								<xsl:with-param name="Number">4</xsl:with-param>
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">padding-top:7mm;</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">padding-top:7.2mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8582LineItem" style="height:11mm;">
							<div class="styIRS8582LNLeftNumBox"/>
							<div class="styIRS8582LNDesc" style="width:181mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:100%;height:100%;padding-top:0mm;padding-bottom:0mm;">
									<span style="width:32.5mm;">If line 4 is a loss and:</span>
									<img src="{$ImagePath}/8582_Bullet_Round.gif" alt="Round Bullet"/>
									<span style="width:4px;"/>
									Line 1d is a loss, go to Part II.<br/>
									<span style="width:32.5mm;"/>
									<img src="{$ImagePath}/8582_Bullet_Round.gif" alt="Round Bullet"/>
									<span style="width:5px;"/>
									Line 2c is a loss (and line 1d is zero or more), skip Part II and go to Part III.<br/>
									<span style="width:32.5mm;"/>
									<img src="{$ImagePath}/8582_Bullet_Round.gif" alt="Round Bullet"/>
									<span style="width:5px;"/>
									Line 3d is a loss (and lines 1d and 2c are zero or more), skip Parts II and III and go to line 15.
								</div>
							</div>
						</div>
						<div class="styIRS8582LineItem" style="height:8mm;">
							<b>Caution:</b>
							<i> If your filing status is married filing separately and you lived 
							with your spouse at any time during the year, <b>do not</b> complete<br/>
							Part II or Part III. Instead, go to line 15.</i>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="height:7mm; padding-left:3mm;padding-bottom:0px;padding-top:0px;font-size:8.5pt;">
							Special Allowance for Rental Real Estate Activities With Active Participation<br/>
							Note:
							<span class="styNormalText">
								<span class="styItalicText">
									Enter all numbers in Part II as positive amounts. See instructions for an example.
								</span>
							</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:10px">5</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:141mm;height:100%;">
									Enter the <b>smaller</b> of the loss on line 1d or the loss on line 4
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right; padding-right:.75mm;">..............</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/RentalRealtyLossLimitAmt"/>
								<xsl:with-param name="Number">5</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:10px">6</div>
							<div class="styIRS8582LNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:101mm;height:100%;">
									Enter $150,000. If married filing separately, see instructions
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;">....</span>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:5mm;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:auto;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582Data/MaximumAllowedIncomeAmt"/>
										<xsl:with-param name="Number">6</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:10px">7</div>
							<div class="styIRS8582LNDesc" style="width:99mm;height:100%;padding-left:3mm;font-size:7.5pt;">
								Enter modified adjusted gross income, but not less than zero (see instructions)
							</div>
							<div class="styIRS8582LNDesc" style="height:5mm;width:81mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;height:5mm</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;height:5mm</xsl:with-param>
										<xsl:with-param name="Height">100%</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">5mm</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8582Data/ModifiedAGIAmt"/>
										<xsl:with-param name="Number">7</xsl:with-param>
									</xsl:call-template>
							</div>
						</div>
						<div class="styIRS8582LineItem" style="height:8mm;">
							<div class="styIRS8582LNLeftNumBox" style="padding-right:2px;text-align:right;"/>
							<div class="styIRS8582LNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;padding-top:0mm;padding-bottom:0mm;">
									<b>Note:</b>
									<i> If line 7 is greater than or equal to line 6, skip lines 8 and 9,<br/>
									enter -0- on line 10. Otherwise, go to line 8.</i>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:10px">8</div>
							<div class="styIRS8582LNDesc" style="width:99mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:101mm;height:100%;">
									Subtract line 7 from line 6
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;">................</span>
								</div>
							</div>
							<div class="styIRS8582LNDesc" style="height:100%;width:81mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="height:100%;;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="Height">100%</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8582LNDesc" style="height:100%;width:40mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ModifiedAGIDifferenceAmt"/>
										<xsl:with-param name="Number">8</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:10px;">9</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:auto;height:100%;">
									Multiply line 8 by 50% (.5). <b>Do not</b> enter more than $25,000. If married filing separately, see instructions
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/PercentNetSpecialAllowanceAmt"/>
								<xsl:with-param name="Number">9</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:8mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:5px;">10</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:141mm;height:100%;">
									Enter the <b>smaller</b> of line 5 or line 9
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;">.......................</span>
									<br/>
									If line 2c is a loss, go to Part III. Otherwise, go to line 15.
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/AllowedRentalRealtyLossAmt"/>
								<xsl:with-param name="Number">10</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part III																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;padding-bottom:0px;padding-top:0px;font-size:8.5pt; height:7mm;">
							Special Allowance for Commercial Revitalization Deductions From Rental Real Estate Activities<br/>
							Note:
							<span class="styNormalText">
								<i> Enter all numbers in Part III as positive amounts. See the example for Part II in the instructions.</i>
							</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:5px;">11</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:141mm;height:100%;">
									Enter $25,000 reduced by the amount, if any, on line 10. If married filing separately, see instructions
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;">.</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/StandardAllowanceAmt"/>
								<xsl:with-param name="Number">11</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:5px;">12</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:141mm;height:100%;">
									Enter the loss from line 4
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;">..........................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/RentalAllowanceAmt"/>
								<xsl:with-param name="Number">12</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:5px;">13</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:141mm;height:100%;">
									Reduce line 12 by the amount on line 10
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;">.....................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/SpecialRevitalizationAmt"/>
								<xsl:with-param name="Number">13</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:5px;">14</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:141mm;height:100%;">
									Enter the <b>smallest</b> of line 2c (treated as a positive amount), line 11, or line 13
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;">........</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/FinalRevitalizationAmt"/>
								<xsl:with-param name="Number">14</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-top-width:0px;border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-top-width:0px;border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part IV																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;float:none;clear:both;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part IV</div>
						<div class="styPartDesc" style="padding-left:3mm;padding-bottom:0px;padding-top:0px;font-size:8.5pt;">
							Total Losses Allowed
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm; float:none; clear:both; ">
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:5px;">15</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:141mm;height:100%;">
									Add the income, if any, on lines 1a and 3a and enter the total
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;">..............</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/TotalIncomeAmt"/>
								<xsl:with-param name="Number">15</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:7mm;">
							<div class="styIRS8582LNLeftNumBox" style="text-align:left;padding-left:5px;padding-top:0px;">16</div>
							<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8582LNDesc" style="width:141mm;height:100%;padding-top:0mm;padding-bottom:0mm;">
									<b>Total losses allowed from all passive activities for 2013.</b>
									Add lines 10, 14, and 15. See instructions<br/>
									to find out how to report the losses on your tax return
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;">.................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8582Data/TotalLossesAllowedAmt"/>
								<xsl:with-param name="Number">16</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;padding-top:3.2mm;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding-top:3mm;</xsl:with-param>
								<xsl:with-param name="Height">100%</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see instructions.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8582</span> (2013)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 63704F
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm; float:none; clear:both;">
						<div style="float:left;">
							Form 8582 (2013)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Worksheet 1																						 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div class="styBB" style="width:187mm; height:5mm;">
						<div class="styPartDesc" style="padding-left:0px;padding-bottom:3px;font-size:8.5pt;">
							Caution:
							<span class="styNormalText">
								<span class="styItalicText">
									The worksheets must be filed with your tax return. Keep a copy for your records.
								</span>
							</span>
						</div>
					</div>
					<div style="width:187mm; height:5mm;" class="styBB">
						<div class="styPartDesc" style="padding-left:0px;padding-bottom:3px;font-size:8.5pt;">
							Worksheet 1<img src="{$ImagePath}/8582_Short_Line.gif" alt="Line image"/>For Form 8582, Lines 1a, 1b, and 1c
							<span class="styNormalText">
								(See instructions.)
							</span>
						</div>
						<xsl:if test="$Print != $Separated">
							<div class="styGenericDiv" style="width:4.2mm;float:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="containerID" select=" 'WrkshtRentalActGrpDiv' "/>
									<xsl:with-param name="headerRowCount" select="2"/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</xsl:if>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm; height:auto;">
						<!-- (Table) ///////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:auto;">
							<div class="styTableContainerNBB" id="WrkshtRentalActGrpDiv">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" style="width:187mm;">
									<thead class="styTableThead">
										<xsl:call-template name="Wrksht1Headers"/>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp">
											<xsl:if test="($Print != $Separated) or (count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &lt;=5)">
												<xsl:call-template name="Wrksht1Rows"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &lt; 1 or ((count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht1Rows">
												<xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &lt; 2 or ((count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht1Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &lt; 3 or ((count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht1Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &lt; 4 or ((count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht1Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &lt; 5 or ((count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht1Rows"/>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<xsl:if test="$Print != $Separated">
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerRowCount" select="2"/>
								<xsl:with-param name="containerID" select=" 'WrkshtRentalActGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
							</xsl:if>
						</div>
						<div class="styIRS8582LineItem" style="height:6mm;">
							<div class="styIRS8582CleanDiv" style="width:25%;">
								<b>
								Total. Enter on Form 8582, lines 1a,<br/> 
								1b, and 1c
								</b>
								<span style="float:right;">
									<!--Dotted Line-->
									<span class="styDotLn">........</span>
									<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%;">
								<span style="width:100%;text-align:right;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtRentalActGrp/TotalCurrentYearNetIncomeAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%">
								<span style="width:100%;text-align:right;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtRentalActGrp/TotalCurrentYearNetLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%">
								<span style="width:100%;text-align:right;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtRentalActGrp/TotalPriorYrRentalUnallowedAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%;;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%;border-right-width:0px;background-color:lightgrey;"/>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Worksheet 2																						 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm; height:4mm;" class="styBB">
						<div class="styPartDesc" style="padding-left:0px;padding-bottom:3px;font-size:8.5pt;">
							Worksheet 2<img src="{$ImagePath}/8582_Short_Line.gif" alt="Line image"/>For Form 8582, Lines 2a and 2b
							<span class="styNormalText">
								(See instructions.)
							</span>
						</div>
						<xsl:if test="$Print != $Separated">
						<div class="styGenericDiv" style="width:4.2mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'WrkshtCommercialGrpDiv' "/>
								<xsl:with-param name="headerRowCount" select="1"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
						</xsl:if>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm; height:auto;">
						<!-- (Table) ///////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:auto;">
							<div class="styTableContainerNBB" id="WrkshtCommercialGrpDiv">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" style="width:100%;">
									<thead class="styTableThead">
										<xsl:call-template name="Wrksht2Headers"/>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp">
											<xsl:if test="($Print != $Separated) or (count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &lt;=4)">
												<xsl:call-template name="Wrksht2Rows"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &lt; 1 or ((count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht2Rows">
												<xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &lt; 2 or ((count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht2Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &lt; 3 or ((count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht2Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &lt; 4 or ((count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht2Rows"/>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<xsl:if test="$Print != $Separated">
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerRowCount" select="1"/>
								<xsl:with-param name="containerID" select=" 'WrkshtCommercialGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
							</xsl:if>
						</div>
						<div class="styIRS8582LineItem" style="height:7mm;">
							<div class="styIRS8582CleanDiv" style="width:25%; height:100%;padding-top:.5mm;">
								<b>Total. Enter on Form 8582, lines 2a and 2b</b>
								<span style="float:right;">
									<!--Dotted Line-->
									<span class="styDotLn">..........</span>
									<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:24.95%;height:100%;padding-top:.5mm;">
								<span style="width:100%;text-align:right;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtCommercialGrp/RevitalizationDeductionAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:25.05%;height:100%;padding-top:.5mm;">
								<span style="width:100%;text-align:right;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtCommercialGrp/PriorYearRevitalizationAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:25%;height:100%;background-color:lightgrey;border-right-width:0px;"/>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Worksheet 3																						 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<div class="styPartDesc" style="padding-left:0px;padding-bottom:3px;font-size:8.5pt;">
							Worksheet 3<img src="{$ImagePath}/8582_Short_Line.gif" alt="Line image"/>For Form 8582, Lines 3a, 3b, and 3c
							<span class="styNormalText">
								(See instructions.)
							</span>
						</div>
						<xsl:if test="$Print != $Separated">
						<div class="styGenericDiv" style="width:4.2mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'WrkshtPassiveGrpDiv' "/>
								<xsl:with-param name="headerRowCount" select="2"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
						</xsl:if>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm; height:auto;">
						<!-- (Table) ///////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:auto;">
							<div class="styTableContainerNBB" id="WrkshtPassiveGrpDiv">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" style="width:100%;">
									<thead class="styTableThead">
										<xsl:call-template name="Wrksht3Headers"/>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp">
											<xsl:if test="($Print != $Separated) or (count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &lt;=5)">
												<xsl:call-template name="Wrksht3Rows"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &lt; 1 or ((count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht3Rows">
												<xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &lt; 2 or ((count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht3Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &lt; 3 or ((count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht3Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &lt; 4 or ((count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht3Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &lt; 5 or ((count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht3Rows"/>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<xsl:if test="$Print != $Separated">
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerRowCount" select="2"/>
								<xsl:with-param name="containerID" select=" 'WrkshtPassiveGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
							</xsl:if>
						</div>
						<div class="styIRS8582LineItem" style="height:6mm;">
							<div class="styIRS8582CleanDiv" style="width:25%;height:100%;">
								<b>Total. Enter on Form 8582, lines 3a, 3b, and 3c</b>
								<span style="float:right;">
									<!--Dotted Line-->
									<span class="styDotLn">.........</span>
									<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%;">
								<span style="width:100%;text-align:right;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtPassiveGrp/TotalOtherCurrentYearIncomeAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%">
								<span style="width:100%;text-align:right;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtPassiveGrp/TotalOtherCurrentYearLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%">
								<span style="width:100%;text-align:right;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtPassiveGrp/TotalOtherPYUnallowedAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%;border-right-width:0px;background-color:lightgrey;"/>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Worksheet 4																						 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<div class="styPartDesc" style="padding-left:0px;padding-bottom:3px;font-size:8.5pt;">
							Worksheet 4<img src="{$ImagePath}/8582_Short_Line.gif" alt="Line image"/>Use this worksheet if an amount is shown on Form 8582, line 10 or 14
							<span class="styNormalText">
								(See instructions.)
							</span>
						</div>
						<xsl:if test="$Print != $Separated">
						<div class="styGenericDiv" style="width:4.2mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'WrkshtAllowanceGrpDiv' "/>
								<xsl:with-param name="headerRowCount" select="1"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
						</xsl:if>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm; height:auto;">
						<!-- (Table) ///////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:auto;">
							<div class="styTableContainerNBB" id="WrkshtAllowanceGrpDiv">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" style="width:100%;">
									<thead class="styTableThead">
										<xsl:call-template name="Wrksht4Headers"/>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp">
											<xsl:if test="($Print != $Separated) or (count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &lt;=5)">
												<xsl:call-template name="Wrksht4Rows"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &lt; 1 or ((count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht4Rows">
												<xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &lt; 2 or ((count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht4Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &lt; 3 or ((count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht4Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &lt; 4 or ((count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht4Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &lt; 5 or ((count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht4Rows"/>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<xsl:if test="$Print != $Separated">
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerRowCount" select="1"/>
								<xsl:with-param name="containerID" select=" 'WrkshtAllowanceGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
							</xsl:if>
						</div>
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582CleanDiv" style="width:40.035%;height:100%;">
								<span style="width:100%;text-align:left;padding-top:1mm;">
									<b>Total</b>
									<span style="float:right;">
										<!--Dotted Line-->
										<span class="styDotLn">.................</span>
										<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
									</span>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%;">
								<span style="width:100%;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtAllowanceGrp/TotalLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%">
								<span style="width:100%;text-align:center;padding-top:1mm;">
									<b>1.00</b>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:15%;height:100%">
								<span style="width:100%;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtAllowanceGrp/TotalSpecialAllowanceAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:14.85%;height:100%;border-right-width:0px;">
								<span style="width:100%;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtAllowanceGrp/TotalNetSpecialAllowanceAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Worksheet 5																						 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<div class="styPartDesc" style="padding-left:0px;padding-bottom:3px;font-size:8.5pt;">
							Worksheet 5<img src="{$ImagePath}/8582_Short_Line.gif" alt="Line image"/>Allocation of Unallowed Losses
							<span class="styNormalText">
								(See instructions.)
							</span>
						</div>
						<xsl:if test="$Print != $Separated">
						<div class="styGenericDiv" style="width:4.2mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'WrkshtLossGrpDiv' "/>
								<xsl:with-param name="headerRowCount" select="1"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
						</xsl:if>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm; height:auto; float:none; clear:both; ">
						<!-- (Table) ///////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:auto;">
							<div class="styTableContainerNBB" id="WrkshtLossGrpDiv">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" style="width:100%;">
									<thead class="styTableThead">
										<xsl:call-template name="Wrksht5Headers"/>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp">
											<xsl:if test="($Print != $Separated) or (count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &lt;=5)">
												<xsl:call-template name="Wrksht5Rows"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &lt; 1 or ((count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht5Rows">
												<xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &lt; 2 or ((count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht5Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &lt; 3 or ((count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht5Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &lt; 4 or ((count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht5Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &lt; 5 or ((count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht5Rows"/>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<xsl:if test="$Print != $Separated">
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerRowCount" select="1"/>
								<xsl:with-param name="containerID" select=" 'WrkshtLossGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
							</xsl:if>
						</div>
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582CleanDiv" style="width:43.86%;height:100%;border-right-width:0px;">
								<span style="width:100%;text-align:left;padding-top:1mm;">
									<b>Total</b>
									<span style="float:right;">
										<!--Dotted Line-->
										<span class="styDotLn">...................</span>
										<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
									</span>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:19.03%;height:100%;border-right-width:0px;border-left-width:1px;">
								<span style="width:100%;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtLossGrp/TotalAllocationLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:17.95%;height:100%;border-right-width:0px;border-left-width:1px;">
								<span style="width:100%;text-align:center;padding-top:1mm;">
									<b>1.00</b>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:18.77%;height:100%;border-right-width:0px;border-left-width:1px;">
								<span style="width:100%;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtLossGrp/TotalLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8582</span> (2013)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;float:none; clear:both; ">
						<div style="float:left;">
							Form 8582 (2013)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Worksheet 6																						 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm; padding-top:1mm;" class="styBB">
						<div class="styPartDesc" style="padding-left:0px;padding-bottom:3px;font-size:8.5pt;">
							Worksheet 6<img src="{$ImagePath}/8582_Short_Line.gif" alt="Line image"/>Allowed Losses
							<span class="styNormalText">
								(See instructions.)
							</span>
						</div>
						<xsl:if test="$Print != $Separated">
						<div class="styGenericDiv" style="width:4.2mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'WrkshtListActivityGrpDiv' "/>
								<xsl:with-param name="headerRowCount" select="1"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
						</xsl:if>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm; height:auto;">
						<!-- (Table) ///////////////////////////////////////////////-->
						<div class="styIRS8582LineItem" style="height:auto;">
							<div class="styTableContainerNBB" id="WrkshtListActivityGrpDiv">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" style="width:100%;">
									<thead class="styTableThead">
										<xsl:call-template name="Wrksht6Headers"/>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp">
											<xsl:if test="($Print != $Separated) or (count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &lt;=5)">
												<xsl:call-template name="Wrksht6Rows"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &lt; 1 or ((count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht6Rows">
												<xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &lt; 2 or ((count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht6Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &lt; 3 or ((count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht6Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &lt; 4 or ((count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht6Rows"/>
										</xsl:if>
										<xsl:if test="count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &lt; 5 or ((count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &gt;5) and ($Print = $Separated))">
											<xsl:call-template name="Wrksht6Rows"/>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<xsl:if test="$Print != $Separated">
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerRowCount" select="1"/>
								<xsl:with-param name="containerID" select=" 'WrkshtListActivityGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
							</xsl:if>
						</div>
						<div class="styIRS8582LineItem" style="height:5mm;">
							<div class="styIRS8582CleanDiv" style="width:43.86%;height:100%;border-right-width:0px;">
								<span style="width:100%;text-align:left;padding-top:1mm;">
									<b>Total</b>
									<span style="float:right;">
										<!--Dotted Line-->
										<span class="styDotLn">...................</span>
										<img src="{$ImagePath}/8582_Bullet_Sm.gif" alt="SmallBullet"/>
									</span>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:19.03%;height:100%;border-right-width:0px;border-left-width:1px;">
								<span style="width:100%;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtListActivityGrp/TotalLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:17.95%;height:100%;border-right-width:0px;border-left-width:1px;">
								<span style="width:100%;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtListActivityGrp/TotalUnallowedLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8582CleanDiv" style="width:18.77%;height:100%;border-right-width:0px;border-left-width:1px;">
								<span style="width:100%;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8582Data/ParentWrkshtListActivityGrp/TotalAllowedLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Worksheet 7																						 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div class="styGenericDiv" style="width:187mm; height:7mm;">
						<div class="styPartDesc" style="padding-left:0px; padding-top:1.5mm; font-size:8.5pt;">
							Worksheet 7<img src="{$ImagePath}/8582_Short_Line.gif" alt="Line image"/>
							Activities With Losses Reported on Two or More Forms or Schedules
							<span class="styNormalText">
								(See instructions.)
							</span>
						</div>
					</div>
					<xsl:choose>
						<xsl:when test="$Form8582Data/ParentWrkshtLossActivityGrp">
							<xsl:for-each select="$Form8582Data/ParentWrkshtLossActivityGrp">
								<xsl:call-template name="Wrksht7">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Wrksht7"/>
						</xsl:otherwise>
					</xsl:choose>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8582</span> (2013)
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
							<xsl:with-param name="TargetNode" select="$Form8582Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
					<!-- Separated Data for Part IV - Worksheet 1 -->
					<xsl:if test="($Print = $Separated) and  (count($Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8582, Part IV - Worksheet 1 - For Form 8582, Lines 1a, 1b, and 1c (See instructions.)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<xsl:call-template name="Wrksht1Headers">
									<xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8582Data/ParentWrkshtRentalActGrp/WrkshtRentalActGrp">
									<xsl:call-template name="Wrksht1Rows">
										<xsl:with-param name="AddColoredRows">true</xsl:with-param>
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part IV - Worksheet 2 -->
					<xsl:if test="($Print = $Separated) and  (count($Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8582, Part IV - Worksheet 2 - For Form 8582, Lines 2a and 2b (See instructions.)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<xsl:call-template name="Wrksht2Headers">
									<xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8582Data/ParentWrkshtCommercialGrp/WrkshtCommercialGrp">
									<xsl:call-template name="Wrksht2Rows">
										<xsl:with-param name="AddColoredRows">true</xsl:with-param>
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part IV - Worksheet 3 -->
					<xsl:if test="($Print = $Separated) and  (count($Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8582, Part IV - Worksheet 3 - For Form 8582, Lines 3a, 3b, and 3c (See instructions.)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<xsl:call-template name="Wrksht3Headers">
									<xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8582Data/ParentWrkshtPassiveGrp/WrkshtPassiveGrp">
									<xsl:call-template name="Wrksht3Rows">
										<xsl:with-param name="AddColoredRows">true</xsl:with-param>
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part IV - Worksheet 4 -->
					<xsl:if test="($Print = $Separated) and  (count($Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8582, Part IV - Worksheet 4 - Use this worksheet if an amount is shown on Form 8582, line 10 or 14 (See instructions.)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<xsl:call-template name="Wrksht4Headers">
									<xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8582Data/ParentWrkshtAllowanceGrp/WrkshtAllowanceGrp">
									<xsl:call-template name="Wrksht4Rows">
										<xsl:with-param name="AddColoredRows">true</xsl:with-param>
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part IV - Worksheet 5 -->
					<xsl:if test="($Print = $Separated) and  (count($Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8582, Part IV - Worksheet 5 - Allocation of Unallowed Losses (See instructions.)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<xsl:call-template name="Wrksht5Headers">
									<xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8582Data/ParentWrkshtLossGrp/WrkshtLossGrp">
									<xsl:call-template name="Wrksht5Rows">
										<xsl:with-param name="AddColoredRows">true</xsl:with-param>
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part IV - Worksheet 6 -->
					<xsl:if test="($Print = $Separated) and  (count($Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8582, Part IV - Worksheet 6 - Allowed Losses (See instructions.)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<xsl:call-template name="Wrksht6Headers">
									<xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8582Data/ParentWrkshtListActivityGrp/WrkshtListActivityGrp">
									<xsl:call-template name="Wrksht6Rows">
										<xsl:with-param name="AddColoredRows">true</xsl:with-param>
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
