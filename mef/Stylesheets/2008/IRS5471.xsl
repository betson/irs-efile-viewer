<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5471Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="IRS5471Data" select="$RtnDoc/IRS5471"/>
	<xsl:param name="IRS5471AData" select="$RtnDoc/IRS5471/IRS5471ScheduleA"/>
	<xsl:param name="IRS5471BData" select="$RtnDoc/IRS5471/IRS5471ScheduleB"/>
	<xsl:param name="IRS5471CData" select="$RtnDoc/IRS5471/IRS5471ScheduleC"/>
	<xsl:param name="IRS5471DData" select="$RtnDoc/IRS5471/IRS5471ScheduleD"/>
	<xsl:param name="IRS5471EData" select="$RtnDoc/IRS5471/IRS5471ScheduleE"/>
	<xsl:param name="IRS5471FData" select="$RtnDoc/IRS5471/IRS5471ScheduleF"/>
	<xsl:param name="IRS5471GData" select="$RtnDoc/IRS5471/IRS5471ScheduleG"/>
	<xsl:param name="IRS5471HData" select="$RtnDoc/IRS5471/IRS5471ScheduleH"/>
	<xsl:param name="IRS5471IData" select="$RtnDoc/IRS5471/IRS5471ScheduleI"/>
	<!-- MRH - 11-24-2003 Copied and modified lshen's code from the PopulateTemplate - add template to handle left-over data with image that is displayed using absolute position-->
	<xsl:template name="IRS5471LinkToLeftoverDataTable">
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="Style"/>
		<xsl:param name="TabOrder">1</xsl:param>
		<!-- do nothing if for printing -->
		<xsl:choose>
			<xsl:when test="$TargetNode='X' or $TargetNode='x'">
				<!-- do nothing if for printing -->
				<!--xsl:if test="not($Print) or $Print=''" Commented to print pen images-->
				<xsl:if test="($TargetNode)">
					<div>
						<img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: {'Yes'}" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );" onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
					</div>
				</xsl:if>
				<!--/xsl:if-->
			</xsl:when>
			<xsl:otherwise>
				<!-- do nothing if for printing -->
				<!--xsl:if test="not($Print) or $Print=''" Commented to print pen image-->
				<xsl:if test="($TargetNode)">
					<div>
						<img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: {'No'}" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );" onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
					</div>
				</xsl:if>
				<!--/xsl:if-->
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="IRS5471PopulateLeftoverRow">
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="DescWidth">100</xsl:param>
		<xsl:param name="AmountWidth" select="187 - $DescWidth"/>
		<xsl:if test="$TargetNode">
			<tr>
				<td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">
					<xsl:value-of select="$Desc"/>:</td>
				<!--<xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="Desc" />
       </xsl:call-template></td>-->
				<td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
					<xsl:choose>
						<xsl:when test="$TargetNode='X'">Yes</xsl:when>
						<xsl:otherwise>No</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsD">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="PersonCount"/>
		<xsl:if test="($PersonCount &gt;4) and ($Print = $Separated)">
			<tr>
				<td class="styTableCell" style="width: 68mm; border-color: black; text-align: left; font-size: 7pt">
					<span class="styTableCellPad"/>
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor/PersonName"/>
					</xsl:call-template>
				</td>
				<td class="styTableCell" style="width: 63mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 30mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 12mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 7mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:7mm; border-color: black; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsD">
				<xsl:with-param name="PersonCount" select="1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
		<!-- Separated data case -->
		<xsl:if test="$PersonCount &lt; $NumOfRows">
			<tr>
				<td class="styTableCell" style="width: 68mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 63mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 30mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 12mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 7mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 7mm; border-color: black; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsD">
				<xsl:with-param name="PersonCount" select="$PersonCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsScheduleAI">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="StockCount"/>
		<!-- Separated data case -->
		<xsl:if test="($StockCount &gt;4) and ($Print = $Separated)">
			<tr>
				<td class="styTableCell" style="width: 68mm; border-color: black; text-align: left">
					<span class="styTableCellPad"/>
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation"/>
					</xsl:call-template>
				</td>
				<td class="styTableCell" style="width: 48mm;text-align:right; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 48mm; text-align: right; border-color: black; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsScheduleAI">
				<xsl:with-param name="StockCount" select="1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
		<!-- Separated data case Schedule A -->
		<xsl:if test="$StockCount &lt; $NumOfRows">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 90mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 48mm;text-align:right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 48mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsScheduleAI">
				<xsl:with-param name="StockCount" select="$StockCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- separated data Schedule B -->
	<xsl:template name="AddRowsScheduleB">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="ShareholdersCount"/>
		<xsl:param name="StockSetsCount"/>
		<xsl:if test="($ShareholdersCount &lt; 1) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm; text-align: left; font-size: 7pt" rowspan="4">
					<span class="styTableCellPad"/>
					<xsl:if test="(($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp/PersonName"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 2) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 3) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 4) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 5) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- AddDepRowsScheduleB -->
	<xsl:template name="AddDepRowsScheduleB">
		<xsl:param name="RowNumber"/>
		<xsl:param name="index"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styTableCell" style=" width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style=" width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style=" width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableLastCol" id="FSspcr"/>
			</tr>
			<xsl:call-template name="AddDepRowsScheduleB">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- /AddDepRowsScheduleB -->
	<xsl:template name="AddDepSubRows">
		<xsl:param name="RowNumber"/>
		<xsl:param name="index"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
			<!-- ************************************************** -->
				<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableLastCol" id="FSspcr"/>
			</tr>
			<xsl:call-template name="AddDepSubRows">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddSubRows">
		<xsl:param name="RowNumber"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS5471TableLastCol" id="FSspcr"/>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsScheduleE">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="TPCount"/>
		<!-- Separated data case -->
		<xsl:if test="($TPCount &gt; $NumOfRows) and ($Print = $Separated)">
			<tr style="height:4mm;">
				<td class="styTableCell" style="border-color: black; width: 90mm; text-align: left ">
					<span style=" width: 2mm;"/>
					<b>2</b>
					<span style=" width: 2px;"/>
					<span class="styTableCellPad"/>
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation/DescOfEachClassOfStock"/>
					</xsl:call-template>
				</td>
				<td class="styTableCell" style="border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableLastCol" id="PAspcr"/>
			</tr>
			<xsl:call-template name="AddRowsScheduleE">
				<xsl:with-param name="TPCount" select="1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
		<!-- /Separated data case -->
		<xsl:if test="$TPCount &lt; $NumOfRows">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 90mm; font-size: 7pt; text-align: left; padding-left: 2mm">
					<span class="styBoldText">
						<xsl:number value="$TPCount + 2"/>
					</span>
					<span style="width: 2px"/>
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS5471TableLastCol" id="PAspcr"/>
			</tr>
			<xsl:call-template name="AddRowsScheduleE">
				<xsl:with-param name="TPCount" select="$TPCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($IRS5471Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="TY 2006 IRS Form 5471"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- uncomment this before checking in111111 code this one-->
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 5471 CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS5471Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS5471">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeader"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:30.25mm; height: 23.25mm">
							<div>
                Form 
                <span class="styFormNumber">5471</span>
								<br/>
								<span style="width: 3mm">
									<xsl:call-template name="IRS5471LinkToLeftoverDataTable">
										<xsl:with-param name="Desc">Change In Taxable Year No. 898c</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/ChangeInTaxableYearNo898c"/>
										<xsl:with-param name="Style"/>
									</xsl:call-template>
								</span>
								<span style="width: 3mm">
									<xsl:call-template name="IRS5471LinkToLeftoverDataTable">
										<xsl:with-param name="Desc">Election Change In Year 898c</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/ElectionChangeInYear898c"/>
										<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width: 3mm">
									<xsl:call-template name="IRS5471LinkToLeftoverDataTable">
										<xsl:with-param name="Desc">Section 898c Election</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/Section898cElection"/>
										<xsl:with-param name="Style">padding-left:6mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width: 3mm">
									<xsl:call-template name="IRS5471LinkToLeftoverDataTable">
										<xsl:with-param name="Desc">Section 338g Election</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/Section338gElection"/>
										<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width: 3mm">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Dormant Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/@dormantIndicator"/>
										<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width: 3mm">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Change Annual Accounting Period</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/@changeAnnualAccountingPeriod"/>
										<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width: 3mm;padding-left:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471Data"/>
										<xsl:with-param name="Style">width:10mm;text-align:right;padding-left:16mm</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styAgency">(Rev. December 2007)</div>
							<div class="styAgency" style="font-size: 6pt; text-align:bottom;padding-top:.5mm;">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:126mm;height:20mm;">
							<div class="styMainTitle" style="font-size:12pt;">Information Return of U.S. Persons With Respect To Certain Foreign Corporations</div>
							<div class="styFST" style="padding-top:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
								<span style="width: 2mm"/>See separate instructions.
                <br/>
							</div>
							<div style="text-align: left; padding-top: 1mm; padding-left: .5mm; text-align:bottom;">Information furnished for the foreign corporation's annual accounting period (tax year required by section 898) 		 <span style="font-size:6pt">(see instructions) </span>beginning     
                    <span style="width: 20mm">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxYearBeginning"/>
									</xsl:call-template>
								</span>, and ending
          		<span style="width: 20mm">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxYearEnding"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="height: 23.25mm">
							<div class="styOMB" style="height:7mm;">
								<div style="text-align:left;font-size: 7pt;padding-left: 1mm">OMB No. 1545-0704</div>
								<div class="stySequence" style="padding-left:1mm; height: 4mm">Attachment<br/> Sequence No.<span class="styBoldText"> 121</span>
								</div>
							</div>
							<div class="styBoldText" style="height:2mm;vertical-align: middle;text-align:left; padding-left: 1mm;padding-top:1.5mm;"/>
							<div style="font-size:6pt; height:6mm; text-align: left; padding-left: 1mm"/>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN TAXPAYER INFO   -->
					<!--   BEGIN NAME   -->
					<div style="width:187mm;">
						<div class="styNameBox" style="height: 4.5mm;font-size: 7pt;width: 109mm">Name of person filing this return
    <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn"/>
							</xsl:call-template>
							<div style="font-family: verdana, arial, sans-serif; font-size: 7pt; font-weight: normal; height: 4.5mm">
								<xsl:choose>
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/Name/BusinessNameLine1 != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/Name/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/PersonFilingThisReturn/Name/BusinessNameLine2 != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/Name/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<span class="styEINBox" style="font-size:7pt; padding-left:1mm">A<span style="width:8px;"/>Identifying number</span>
						<span class="styNormalText" style="padding-top: 2mm; text-align: left; width: 70mm;padding-left:5mm;">
							<xsl:choose>
								<xsl:when test="$IRS5471Data/EIN != ''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/MissingEINReason"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</span>
					</div>
					<!--  END NAME   -->
					<!--   BEGIN ADDRESS AND CATEGORY   -->
					<div style="width:187mm;">
						<div class="styAddrFld" style="border-bottom-width: 0px; border-left-width: 0px; border-style:solid; font-size: 6pt; height: 8mm;width: 109mm; float:left; font-weight: normal">Number, street, and room or suite no. (or P.O. box number if mail is not delivered to street address)
    <span style="font-family: verdana, arial, sans-serif;font-size: 7pt; font-weight: normal;">
								<!-- Added new code to have choice between USAddress and ForeignAddress -->
								<!-- Added per RIS 13 and EXO-0273OTH  12/27/06 -->
								<xsl:choose>
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine1 != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine1"/>
										</xsl:call-template>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine2 != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine2"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine1 != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine1"/>
										</xsl:call-template>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine2 != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine2"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styComType" style="width: 78mm; height: 8mm; float: right;clear:both; padding-left: 1mm;border-top-width: 1px; border-bottom-width: 0px;">
							<b style="font-size: 7pt;">B</b>
							<span style="width: 8px; font-size: 7pt;"/>Category of filer (See instructions.  Check applicable box(es)):
    			<br/>
							<span style="margin-left: 4mm; font-size: 8pt">
       		 1
                <span style="width:8px;"/>
                (repeal)
                <span style="width:12px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler2"/>
									</xsl:call-template>
        2</label>
								<span style="width:8px"/>
								<input type="checkbox" class="styCkbox" name="CategoryOfFiler2">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler2"/>
									</xsl:call-template>
								</input>
								<span style="width:12px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler3"/>
									<xsl:with-param name="Style">width: 32mm; text-align:left; padding-left: 8mm</xsl:with-param>
								</xsl:call-template>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler3"/>
									</xsl:call-template>
        3</label>
								<span style="width: 8px"/>
								<input type="checkbox" class="styCkbox" name="CategoryOfFiler3">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler3"/>
									</xsl:call-template>
								</input>
								<span style="width:12px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler4"/>
									</xsl:call-template>
        4</label>
								<span style="width:8px"/>
								<input type="checkbox" class="styCkbox" name="CategoryOfFiler4">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler4"/>
									</xsl:call-template>
								</input>
								<span style="width:12px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler5"/>
									</xsl:call-template>
        5</label>
								<span style="width:8px"/>
								<input type="checkbox" class="styCkbox" name="CategoryOfFiler5">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler5"/>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<!--   END ADDRESSS AND CATEGORY   -->
					<!--   BEGIN CITY, STATE, ZIP AND VOTING PERCENTAGE   -->
					<div style="width:187mm;">
						<div class="styComType" style="font-size: 7pt; width: 109mm; height: 8mm; border-top-width: 1px; border-bottom-width: 0px;border-right-width: 1px">City or town, state, and ZIP code
    <br/>
							<span style="font-family: verdana, arial, sans-serif;font-size: 7pt; font-weight: normal;">
								<!-- <span style="font-family: verdana, arial, sans-serif;font-size: 8pt; font-weight: bold;"> -->
								<!-- NEW CODE ADDED TO REFLECT USADDRESS AND FOREIGNADDRESS  -->
								<!-- Added per RIS 13 and EXO-0273OTH  12/27/06 -->
								<xsl:choose>
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/USAddress">
										<xsl:attribute name="style">margin-left:0mm; padding-top:1mm; 
                   </xsl:attribute>
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress"/>
										</xsl:call-template>
										<!--     , <span style="width:8px"/>
                   <xsl:call-template name="PopulateText">
                   <xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/State"/>  
                  	</xsl:call-template>  <span style="width:8px"/>
                  <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/ZIPCode"/>
                  </xsl:call-template>      -->
									</xsl:when>
									<xsl:otherwise>
										<!-- xsl:attribute name="style">line-height:100%; font-size:5pt </xsl:attribute-->
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styComType" style="width: 78mm; height: 8mm; float: right;clear:both; padding-left: 1mm;border-top-width: 1px; border-bottom-width: 0px;text-align: left">
							<b style="font-size: 7pt;padding-right: 1mm">C</b>
              
    Enter the total percentage of the foreign corporation's voting stock
    you owned at the end of its annual accounting period 
    <span class="styFixedUnderline" style="width:12mm;float:none;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/PercentageOfVotingStockOwned"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--   END CITY, STATE, ZIP AND VOTING PERCENTAGE   -->
					<!--   BEGIN FILER'S TAX YEAR   -->
					<div class="styBB" style="width: 187mm; border-top-width: 1px">
						<span style="text-align:left">Filer's tax year beginning
                  <span style="width: 20mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FilersTaxYearBeginning"/>
								</xsl:call-template>
							</span>, and ending
        <span style="width: 20mm; ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FilersTaxYearEnding"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--   END FILER'S TAX YEAR   -->
					<!--   END TAXPAYER INFO   -->
					<!--   BEGIN BLOCK D   -->
					<!--   BEGIN LINE D   -->
					<div class="styBB" style="width:187mm">
						<div style="float:left;">
							<b style="font-size: 7pt;">D</b>
							<span class="styNBSP"/>
							<span style="font-size: 7pt;">  Person(s) on whose behalf this information return is filed:</span>
						</div>
						<div style="width:7mm;text-align:right;float:right;clear:none;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'PBctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE D   -->
					<!--   BEGIN BLOCK D TABLE   -->
					<div class="styIRS5471TableContainer" id="PBctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 68mm" rowspan="2">
                    (1)<span class="styNormalText"> Name</span>
									</th>
									<th class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 63mm" rowspan="2">
                    (2)<span class="styNormalText"> Address</span>
									</th>
									<th class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 30mm" rowspan="2">
                    (3)<span class="styNormalText"> Identifying number</span>
									</th>
									<th class="styTableCellHeader" style="border-color: black; font-size: 7pt;border-right-width: 0px" colspan="3">
                    (4)<span class="styNormalText"> Check applicable box(es)</span>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" style="border-color: black; width: 17mm; font-weight: normal">Shareholder</th>
									<th class="styTableCellHeader" style="border-color: black; width: 11mm; font-weight: normal">Officer</th>
									<th class="styTableCellHeader" style="border-color: black; border-right-width:0px; width: 14mm; font-weight: normal">Director</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471Data/PersonInformationIsFiledFor">
									<xsl:if test="($Print != $Separated) or (count($IRS5471Data/PersonInformationIsFiledFor) &lt;=4)">
										<tr>
											<td class="styTableCell" style="width: 68mm; text-align: left; border-color: black; font-size: 7pt;">
												<xsl:if test="PersonName!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonName"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="BusinessName/BusinessNameLine1!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2 != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; width: 63mm; text-align: left; font-size: 7pt;">
												<xsl:if test="AddressInUS !=''">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="AddressInUS"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressInForeign !=''">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="AddressInForeign"/>
													</xsl:call-template>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; width: 30mm;  text-align: center; font-size: 7pt;">
												<xsl:choose>
													<xsl:when test="EIN != ''">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReason"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; text-align: center; font-size: 7pt; width: 17mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderIndicator"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; text-align: center; font-size: 7pt; width: 11mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OfficerIndicator"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; text-align: center; font-size: 7pt; border-right-width: 0px; width: 14mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DirectorIndicator"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:call-template name="AddRowsD">
									<xsl:with-param name="NumOfRows" select="4"/>
									<xsl:with-param name="PersonCount" select="count($IRS5471Data/PersonInformationIsFiledFor)"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'PBctn' "/>
					</xsl:call-template>
					<!--   END Block D TABLE   -->
					<!--   BEGIN IMPORTANT HEADER   -->
					<div class="styGenericDiv" style="width: 187mm; font-size: 8pt">
						<span class="styBoldText" style="vertical-align: top;">Important:</span>
						<span class="styItalicText" style="width: 160mm; padding-left: 2mm"> Fill in all applicable lines and schedules.  All information <b>must</b> be in English.  All amounts <b>must</b> be stated</span>
					</div>
					<div class="styBB" style="width: 187mm; font-size: 8pt">
						<span class="styItalicText" style="width: 149mm; padding-left: 21mm">in U.S. dollars unless otherwise indicated.</span>
					</div>
					<!--   END IMPORTANT HEADER   -->
					<!--   BEGIN BLOCK 1   -->
					<!--   BEGIN 1A, 1B, 1C   -->
					<table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;">
						<tr>
							<td class="styTableCell" rowspan="2" valign="top" style="width: 117mm; text-align: left;border-color:black; border-bottom-width: 0px">
								<b>1a</b>
								<span class="styNBSP"/>Name and address of foreign corporation<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine1"/>
								</xsl:call-template>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine2 != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<br/>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/ForeignCorporation/AddressInUS">
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/AddressInUS"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/AddressInForeign"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="styTableCell" valign="top" style="width: 59.5mm;height: 9.5mm;border-color:black;border-right-width: 0px">
								<span style="width:59.5mm;text-align:left;padding-left:1mm;">
									<b>b</b>
									<span class="styNBSP"/>Employer identification number, if any
                </span>
								<br/>
								<br/>
								<span style="text-align:left; width: 59.5mm; padding-left:7mm;">
									<xsl:choose>
										<xsl:when test="$IRS5471Data/EmployerEIN != ''">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/EmployerEIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/MissingEmployerEINReason"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
						</tr>
						<tr>
							<td class="styTableCell" valign="top" style="border-color:black;border-bottom-width: 0px;width:59.5mm; height: 9.5mm;border-right-width: 0px">
								<span style="width:59.5mm;text-align:left;padding-left:1mm;">
									<b>c</b>
									<span class="styNBSP"/>Country under whose laws incorporated
                </span>
								<br/>
								<br/>
								<span style="text-align:left; width: 59.5mm; padding-left:7mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CountryUnderWhoseLawsInc"/>
									</xsl:call-template>
								</span>
							</td>
						</tr>
					</table>
					<!--   END BLOCK 1A, 1B, 1C   -->
					<!--   BEGIN BLOCK 1D, 1E, 1F, 1G, 1H   -->
					<table class="styTable" cellspacing="0" style="width:187mm;border-top:1px solid black;font-size: 7pt">
						<tr>
							<td class="styTableCell" valign="top" style="width: 33mm; height: 10mm; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;">
								<span style="width:32mm;text-align:left;padding-left:1mm;">
									<b>d</b>
									<span style="width: 1mm"/>Date of incorporation
                </span>
								<br/>
								<br/>
								<span style="text-align: left; width: 32mm;padding-left:3.5mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/DateOfIncorporation"/>
									</xsl:call-template>
								</span>
							</td>
							<td class="styTableCell" valign="top" style="width: 41mm; height: 10mm; border-color: black; border-bottom-width: 0px">
								<span style="width:41mm;text-align:left;padding-left:1mm;">
									<b>e</b>
									<span style="width: 1mm"/>Principal place of business
		           </span>
								<br/>
								<br/>
								<span style="text-align: left; width: 41mm;padding-left:4mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PrincipalPlaceOfBusiness"/>
									</xsl:call-template>
								</span>
							</td>
							<td class="styTableCell" valign="top" style="width: 39mm; height: 10mm; border-color: black; border-bottom-width: 0px">
								<span style="width:39mm;text-align:left;padding-left:1mm;">
									<b>f</b>
									<span style="width: 1mm"/>Principal business activity
	              </span>
								<span style="text-align: center; width: 39mm">code number<br/>
								</span>
								<span style="text-align: left; width: 39mm; padding-left:3.5mm;">
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PrincipalBusinessActivityCode != ''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PrincipalBusinessActivityCode"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/InactivePrincipalBusActyCode"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
							<td class="styTableCell" valign="top" style="width: 39mm; height: 10mm; border-color: black; border-bottom-width: 0px">
								<span style="width:39mm;text-align:left;padding-left:1mm;">
									<b>g</b>
									<span style="width: 1mm"/>Principal business activity
	              </span>
								<br/>
								<div style="width:100%; margin-left:3.5mm; text-align:left;padding-top:3mm;padding-bottom:0mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PrincipalBusinessActivity"/>
									</xsl:call-template>
								</div>
							</td>
							<td class="styTableCell" valign="top" style="width: 33mm; height: 10mm; border-color: black; border-bottom-width: 0px; border-right-width: 0px">
								<span style="width:32mm;text-align:left;padding-left:1mm;">
									<b>h</b>
									<span style="width: 1mm"/>Functional currency
	              </span>
								<br/>
								<br/>
								<span style="text-align: left; width: 32mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/FunctionalCurrency"/>
									</xsl:call-template>
								</span>
							</td>
						</tr>
					</table>
					<!--   END BLOCK 1D, 1E, 1F, 1G, 1H   -->
					<!--   END BLOCK 1   -->
					<!--   BEGIN BLOCK 2   -->
					<!--   BEGIN LINE 2   -->
					<div class="styBB" style="text-align: left; border-top-width: 1px;width: 187mm">
						<b>2</b>
						<span style="width:1.5mm;"/> Provide the following information for the foreign corporation's accounting period stated above.</div>
					<!--   END LINE 2   -->
					<!-- BEGIN BLOCK 2A, 2B   -->
					<table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;">
						<tr>
							<th class="styTableCellHeader " style="border-color:black;height: 2mm; border-bottom-width: 0px; margin-left: .25mm; width: 102mm" valign="top">
								<span style="width:102mm;padding-left:1.5mm;text-align:left;">
                  a<span style="width: 1mm"/>
									<span class="styNormalText">Name, address, and identifying number of branch office or agent (if any) in<br/>
										<span style="width: 3mm"/>the United States</span>
								</span>
							</th>
							<th class="styTableCellHeader " style="border-color: black;height: 2mm; width: 70mm;border-right-width: 0px" colspan="2">
								<span style="width:70mm;padding-left:1.5mm;text-align:left;">
                  b<span style="width: 1mm"/>
									<span class="styNormalText">If a U.S. income tax return was filed, enter:</span>
								</span>
							</th>
						</tr>
						<tr>
							<td class="styLNAmountBoxNBB" style="text-align: left; border-left-width: 0px;border-right-width: 1px; width: 102mm" valign="top" rowspan="2">
								<xsl:choose>
									<xsl:when test="$IRS5471Data/BranchOfficeInTheUS/PersonName != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/PersonName"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine1 != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine1"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine2 != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<br/>
								<xsl:if test="$IRS5471Data/BranchOfficeInTheUS/AddressInUS != ''">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/AddressInUS"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$IRS5471Data/BranchOfficeInTheUS/AddressInForeign != ''">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/AddressInForeign"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/EINOfBranchOfficeInTheUS != ''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/EINOfBranchOfficeInTheUS"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/MissingEINBranchOfficeInTheUS"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<span class="styTableCellPad"/>
							</td>
							<th class="styTableCellHeader " style="font-weight: normal; border-color: black; width: 70mm">
								<i>(i)</i>
								<span style="width:1mm"/>Taxable income or (loss)</th>
							<th class="styTableCellHeader " style="font-weight: normal; border-color: black; border-right-width: 0px; width: 70mm">
								<i>(ii)</i>
								<span style="width: 1mm"/>U.S. income tax paid (after all credits)</th>
						</tr>
						<tr>
							<td class="styLNAmountBoxNBB" valign="top" style="height: 8mm; border-left-width: 0px; border-right-width: 1px; width: 70mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxableIncomeOrLoss"/>
								</xsl:call-template>
								<span class="styTableCellPad"/>
							</td>
							<td class="styLNAmountBoxNBB" valign="top" style="border-left-width: 0px;height: 8mm; width: 70mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/USIncomeTaxPaidAfterAllCredits"/>
								</xsl:call-template>
								<span class="styTableCellPad"/>
							</td>
						</tr>
					</table>
					<!--   END BLOCK 2A, 2B   -->
					<!--   BEGIN BLOCK 2C, 2D   -->
					<table class="styTable" cellspacing="0" style="width:187mm; font-size: 7pt">
						<tr>
							<td class="styTableCell" valign="top" style="width: 102mm; height: 25mm; text-align: left; border-color: black; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 1px">
								<span style="width:102mm;padding-left:1.5mm;text-align:left;">
									<b>c</b>
									<span style="width: 1mm"/>Name and address of foreign corporation's statutory or resident agent in <br/>
									<span style="width:10px;"/>country of incorporation
                 </span>
								<br/>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/PersonName != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/PersonName"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/BusinessName/BusinessNameLine1 != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/BusinessName/BusinessNameLine1"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/BusinessName/BusinessNameLine1 != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/BusinessName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<br/>
								<xsl:if test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/AddressInUS != ''">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/AddressInUS"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/AddressInForeign != ''">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/AddressInForeign"/>
									</xsl:call-template>
								</xsl:if>
							</td>
							<!-- Beginning of Table Cell 2d PersonWithRecordsCustody -->
							<td class="styTableCell" valign="top" style="width: 97mm; border-color:black; border-left-width: 1px; border-top-width: 1px; height: 25mm;text-align:left; border-right-width: 0px; border-bottom-width: 0px">
								<span style="text-align:left;padding-left:1.5mm;">
									<b>d</b>
									<span style="width:  1mm"/>Name and address (including corporate department, if <br/>
									<span style="width: 4mm"/>applicable) of person (or persons) with custody of the books <br/>
									<span style="width: 4mm"/>and records of the foreign corporation, and the location of <br/>
									<span style="width: 4mm"/>such books and records, if different
	              </span>
								<br/>
								<xsl:if test="$IRS5471Data/PersonWithRecordsCustody/BusinessName/BusinessNameLine1 != ''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/BusinessName/BusinessNameLine1"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<xsl:if test="$IRS5471Data/PersonWithRecordsCustody/BusinessName/BusinessNameLine2 != ''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/BusinessName/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:if>
								<!--  AddressInUS -->
								<xsl:if test="$IRS5471Data/PersonWithRecordsCustody/AddressInUS != ''">
									<br/>
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/AddressInUS"/>
									</xsl:call-template>
								</xsl:if>
								<!-- AddressInForeign -->
								<br/>
								<xsl:if test="$IRS5471Data/PersonWithRecordsCustody/AddressInForeign != ''">
									<br/>
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/AddressInForeign"/>
									</xsl:call-template>
								</xsl:if>
								<!--  </td>
	                               </tr>
	                               </table> -->
								<!--  Added LocationAddressInUS and LocationAddressInForeign Per RIS 15 - 1/23/07  -->
								<!-- LocationAddressInUS -->
								<br/>
								<xsl:if test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS != ''">
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS/AddressLine1 != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS/AddressLine1"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS/AddressLine2 != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS/AddressLine2"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS/City != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS/City"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS/State != ''">,
	                      				 <span style="width:5px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS/State"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS/ZIPCode != ''">
											<span style="width:8px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInUS/ZIPCode"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</xsl:if>
								<br/>
								<!--       LocationAddressInForeign -->
								<xsl:if test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign!= ''">
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/AddressLine1 != ''">
											<!-- <br/> -->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/AddressLine1"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/AddressLine2 != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/AddressLine2"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/City != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/City"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/ProvinceOrState != ''">,<span style="width: 1mm"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/ProvinceOrState"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/PostalCode != ''">
											<span style="width: 2mm"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/PostalCode"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/Country != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody/LocationAddressInForeign/Country"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</xsl:if>
							</td>
						</tr>
					</table>
					<!--   END BLOCK 2C, 2D   -->
					<!--   BEGIN SCHEDULE A HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm;">Schedule A</div>
						<div class="styPartDesc" style="width: 160mm;">Stock of the Foreign Corporation</div>
						<span style="width:5mm;text-align:right;float:right;clear:none">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'SCctn' "/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END SCHEDULE A HEADER   -->
					<!--  BEGIN A, B, i and ii   -->
					<div class="styIRS5471TableContainer" id="SCctn" style="height: 22mm">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" id="SCTable" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="border-color:black; width: 90mm; text-align: center" rowspan="2">
                    (a)<span class="styNormalText"> Description of each class of stock</span>
									</th>
									<th class="styTableCellHeader" style="border-color:black; width: 96mm; text-align: center; border-right-width: 0px;" colspan="2">
                    (b)<span class="styNormalText"> Number of shares issued and outstanding</span>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" style="border-color:black; width: 48mm; text-align: center;">
										<span class="styNormalText">
											<span class="styItalicText">(i)</span> Beginning of annual accounting period</span>
									</th>
									<th class="styTableCellHeader" style="border-color:black; width: 48mm; border-right-width:0px;">
										<span class="styNormalText">
											<span class="styItalicText">(ii)</span> End of annual accounting period</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471AData/StockOfTheForeignCorporation">
									<xsl:if test="($Print != $Separated) or (count($IRS5471AData/StockOfTheForeignCorporation) &lt;=4)">
										<tr>
											<td class="styTableCell" style="border-color:black; width: 90mm; text-align: left">
												<xsl:choose>
													<xsl:when test="DescOfEachClassOfStock">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DescOfEachClassOfStock"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SelectionOfEachClassOfStock "/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width: 48mm;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NumOfSharesBegngAnnualAcctPrd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width: 48mm; text-align: right; border-right-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NumberOfSharesEndAnnualAcctPrd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:call-template name="AddRowsScheduleAI">
									<xsl:with-param name="NumOfRows" select="4"/>
									<xsl:with-param name="StockCount" select="count($IRS5471AData/StockOfTheForeignCorporation)"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'SCctn' "/>
					</xsl:call-template>
					<!--   END A, B, i and ii   -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
						</div>
						<div style="float:right">
    Cat. No. 49958V 
    <span style="width:90px"/>
    Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2007)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2007)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN SCHEDULE B   -->
					<!--   BEGIN SCHEDULE B HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm;height:3.75mm">Schedule B</div>
						<div class="styPartDesc" style="width: 160mm;">
                	U.S. Shareholders of Foreign Corporation <span style="font-size: 8pt; width: 80mm; font-weight: normal">(see instructions.)</span>
						</div>
						<span style="width:5mm;text-align:right;float:right; clear: none">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'FSctn' "/>
							</xsl:call-template>
						</span>
						<!--   END SCHEDULE B HEADER   -->
					</div>
					<!--  BEGIN TABLE SCHEDULE B   -->
					<div class="styIRS5471TableContainer" name="FSctn" id="FSctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" name="FSTable" id="FSTable">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCell" style="border-color: black; width: 60mm; text-align: center;">
    					(a)<span class="styNormalText"> Name, address, and identifying number of shareholder</span>
									</th>
									<th class="styTableCell" style="border-color: black; width: 60mm; text-align: center">
                    (b)<span class="styNormalText"> Description of each class of stock held by shareholder (<b>Note:</b>
											<i> This description should match the corresponding description entered in Schedule A, Part I, column (a).)</i>
										</span>
									</th>
									<th class="styTableCell" style="border-color: black; width: 20mm; text-align: center">
                    (c)<span class="styNormalText"> Number of shares held at beginning of annual accounting period</span>
									</th>
									<th class="styTableCell" style="border-color: black; width: 20mm; text-align: center; border-right-width: 1px">
                    (d)<span class="styNormalText"> Number of shares held at end of annual accounting period</span>
									</th>
									<th class="styTableCell" style="border-color: black; width: 20mm; text-align: center; border-right-width: 0px">
                    (e)<span class="styNormalText"> Pro rata share of subpart F income (enter as a percentage)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471BData/USShareholdersOfForeignCorp">
									<xsl:variable name="FSRowCount" select="count(ForeignCorporationStocks)"/>
									<!--  <xsl:variable name="testCount" select="count($IRS5471BData/USShareholdersOfForeignCorp[count(ForeignCorporationStocks) &gt; 5])"/> -->
									<xsl:if test="($Print != $Separated) or ((count($IRS5471BData/USShareholdersOfForeignCorp[count(ForeignCorporationStocks) &gt; 4]) &lt;=0))
     				and (count($IRS5471BData/USShareholdersOfForeignCorp) &lt;=5)">
										<xsl:for-each select="ForeignCorporationStocks">
											<xsl:choose>
												<xsl:when test="position()=1">
													<tr>
														<td class="styTableCell" style="border-color: black; text-align:left; width: 60mm">
															<xsl:choose>
																<xsl:when test="$FSRowCount&gt;4">
																	<xsl:attribute name="rowspan"><xsl:value-of select="$FSRowCount"/></xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="rowspan">4</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../PersonName != ''">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../PersonName"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../BusinessName/BusinessNameLine1 != ''">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../BusinessName/BusinessNameLine1"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../BusinessName/BusinessNameLine1 != ''">
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../BusinessName/BusinessNameLine2"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:if test="../AddressInUS != ''">
																<xsl:choose>
																	<xsl:when test="../AddressInUS/AddressLine1 != ''">
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInUS/AddressLine1"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
																<xsl:choose>
																	<xsl:when test="../AddressInUS/AddressLine2 != ''">
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInUS/AddressLine2"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
																<xsl:choose>
																	<xsl:when test="../AddressInUS/City != ''">
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInUS/City"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
																<xsl:choose>
																	<xsl:when test="../AddressInUS/State != ''">,
	                      <xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInUS/State"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
																<xsl:choose>
																	<xsl:when test="../AddressInUS/ZIPCode != ''">
																		<span style="width:8px"/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInUS/ZIPCode"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
															</xsl:if>
															<xsl:if test="../AddressInForeign != ''">
																<xsl:choose>
																	<xsl:when test="../AddressInForeign/AddressLine1 != ''">
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInForeign/AddressLine1"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
																<xsl:choose>
																	<xsl:when test="../AddressInForeign/AddressLine2 != ''">
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInForeign/AddressLine2"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
																<xsl:choose>
																	<xsl:when test="../AddressInForeign/City != ''">
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInForeign/City"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
																<xsl:choose>
																	<xsl:when test="../AddressInForeign/ProvinceOrState != ''">,<span style="width: 1mm"/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInForeign/ProvinceOrState"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
																<xsl:choose>
																	<xsl:when test="../AddressInForeign/PostalCode != ''">
																		<span style="width: 2mm"/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInForeign/PostalCode"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
																<xsl:choose>
																	<xsl:when test="../AddressInForeign/Country != ''">
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="../AddressInForeign/Country"/>
																		</xsl:call-template>
																	</xsl:when>
																</xsl:choose>
															</xsl:if>
															<br/>
															<xsl:choose>
																<xsl:when test="../EINOfShareholder != ''">
																	<xsl:call-template name="PopulateEIN">
																		<xsl:with-param name="TargetNode" select="../EINOfShareholder"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:when test="../SSNOfShareholder != ''">
																	<xsl:call-template name="PopulateSSN">
																		<xsl:with-param name="TargetNode" select="../SSNOfShareholder"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../MissingEINReasonOfShareholder"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:left; border-color: black; width: 60mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DescOfStockHeldByShareholder"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="border-color: black;text-size:4mm; width: 29mm; text-align: right">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="NumOfSharesBegngAnnualAcctPrd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="border-color: black; text-size:5mm;width: 29mm; text-align: right; border-right-width: 1px">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="NumberOfSharesEndAnnualAcctPrd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
															<xsl:choose>
																<xsl:when test="$FSRowCount&gt;4">
																	<xsl:attribute name="rowspan"><xsl:value-of select="$FSRowCount"/></xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="rowspan">4</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:call-template name="PopulatePercent">
																<xsl:with-param name="TargetNode" select="../ProRataShareOfSubpartFIncome"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styIRS5471TableLastCol" id="FSspcr"/>
													</tr>
													<xsl:if test="position()=last()">
														<xsl:call-template name="AddSubRows">
															<xsl:with-param name="RowNumber" select="position()"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td class="styTableCell" style="border-color: black; width: 60mm;text-align:left">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DescOfStockHeldByShareholder"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-size:5mm;border-color: black; width: 29mm; text-align: right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="NumOfSharesBegngAnnualAcctPrd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-size:5mm;border-color: black; width: 29mm; text-align: right; border-right-width: 1px">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="NumberOfSharesEndAnnualAcctPrd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styIRS5471TableLastCol" id="FSspcr"/>
													</tr>
													<xsl:if test="position()=last()">
														<xsl:call-template name="AddSubRows">
															<xsl:with-param name="RowNumber" select="position()"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</xsl:if>
								</xsl:for-each>
								<xsl:call-template name="AddRowsScheduleB">
									<xsl:with-param name="NumOfRows" select="5"/>
									<xsl:with-param name="ShareholdersCount" select="count($IRS5471BData/USShareholdersOfForeignCorp)"/>
									<xsl:with-param name="StockSetsCount" select="count($IRS5471BData/USShareholdersOfForeignCorp[count(ForeignCorporationStocks) &gt; 4])"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'FSctn' "/>
					</xsl:call-template>
					<!--  END SCHEDULE B   -->
					<!--  BEGIN SCHEDULE C   -->
					<table class="styTable" style="width:187mm;font-size: 7pt" cellspacing="0">
						<thead>
							<div class="styBB" style="width:187mm;">
								<div class="styPartName" style="width: 22mm;">Schedule C</div>
								<div class="styPartDesc" style="width: 165mm;">Income Statement <span style="font-size: 8pt; width: 80mm; font-weight: normal">(see instructions.)</span>
								</div>
							</div>
							<tr scope="col">
								<th colspan="2" class="styBoldText" style="width: 6mm; border-style: solid; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-bottom:10mm;vertical-align:top; font-size: 8pt">Important:</th>
								<th colspan="6" class="styItalicText" style="padding-left: 1mm; border-top-width: 0px; width: 177mm;border-style: solid; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px; font-size: 8pt">
									<span style="font-weight:normal;width: 160mm">
               Report all information in functional currency in accordance with U.S. GAAP.  Also, report each amount in<br/>
              U.S. dollars translated from functional currency (using GAAP translation rules). However, if the<br/>
              functional currency is the U.S. dollar, complete only the U.S. Dollars column.  See instructions for special<br/>
               rules for DASTM corporations.
            </span>
								</th>
							</tr>
							<tr>
								<th style="width: 6mm; border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-bottom-width: 0px; border-top-width: 0px">
									<span style="width:1px;"/>
								</th>
								<th colspan="2">
									<span style="width: 1px"/>
								</th>
								<th class="styLNRightNumBox">
									<span style="width: 1mm"/>
								</th>
								<th class="styLNAmountBox" colspan="2" scope="col" style="width: 38mm; text-align: center">Functional Currency</th>
								<th class="styLNAmountBox" colspan="2" scope="col" style="width: 34mm; text-align:center">U.S. Dollars</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<!--   BEGIN LINE 1   -->
							<!--   BEGIN LINE 1A   -->
							<tr>
								<!-- this is the place i think -->
								<td class="styIRS5471Img" rowspan="12" style="width: 6mm; padding-top:10mm; border-bottom-width: 1px">
									<img src="{$ImagePath}/5471_Income.gif" alt="VerticalIncome"/>
								</td>
								<td>
									<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1.25mm;">1a</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Gross receipts or sales
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">1a</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossReceiptsOrSales"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossReceiptsOrSales"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 1A   -->
							<!--   BEGIN LINE 1B   -->
							<tr>
								<td>
									<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:3.25mm;">b</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Returns and allowances
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">1b</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignReturnsAndAllowances"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USReturnsAndAllowances"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 1B   -->
							<!--   BEGIN LINE 1C   -->
							<tr>
								<td>
									<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:3.25mm;">c</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Subtract line 1b from line 1a
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">1c</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGroReceiptsMinusReturns"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossReceiptsMinusReturns"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 1C   -->
							<!--   END LINE 1   -->
							<!--   BEGIN LINE 2   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">2</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Cost of goods sold
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </b>
								</td>
								<td class="styLNRightNumBox">2</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCostOfGoodsSold"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCostOfGoodsSold"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 2   -->
							<!--   BEGIN LINE 3   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">3</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Gross profit (subtract line 2 from line 1c)
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">3</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossProfit"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossProfit"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 3   -->
							<!--   BEGIN LINE 4   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">4</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Dividends
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </b>
								</td>
								<td class="styLNRightNumBox">4</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDividends"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDividends"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 4   -->
							<!--   BEGIN LINE 5   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">5</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Interest
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </b>
								</td>
								<td class="styLNRightNumBox">5</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignIncomeInterest"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USIncomeInterest"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 5   -->
							<!--   BEGIN LINE 6a   -->
							<tr>
								<td>
									<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1.25mm;">6a</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Gross rents
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
		<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
               <span class="styNBSP"/>.
           
         
          </b>
								</td>
								<td class="styLNRightNumBox">6a</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossRents"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossRents"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 6a   -->
							<!--   BEGIN LINE 6b   -->
							<tr>
								<td>
									<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:4mm;">b</span>
								</td>
								<td class="styLNDesc" style="width: 99mm"> Gross royalties and license fees
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            
          </b>
								</td>
								<td class="styLNRightNumBox">6b</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnGrossRoyaltiesAndLcnsFees"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossRoyaltiesAndLcnsFees"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 6b   -->
							<!--   BEGIN LINE 7   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">7</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Net gain or (loss) on sale of capital assets
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </b>
								</td>
								<td class="styLNRightNumBox">7</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnNetGainOnSaleOfCapitalAst"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USNetGainOnSaleOfCapitalAssets"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 7   -->
							<!--   BEGIN LINE 8   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">8</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Other income (attach schedule)
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </b>
								</td>
								<td class="styLNRightNumBox">8</td>
								<td style="border-color: black; border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 4mm">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherIncome"/>
									</xsl:call-template>
									<span style="width:1px"/>
								</td>
								<td class="styLNAmountBox" style="width: 34mm; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherIncome"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<!--td style="width: 4mm; border-color: black; border-style: solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherIncome"/>
                  </xsl:call-template><span style="width:1px"/>
                </td-->
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherIncome"/>
									</xsl:call-template>
									<span style="width:1px"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 8   -->
							<!--   BEGIN LINE 9   -->
							<tr>
								<td style="border-color:black; border-style:solid; border-bottom-width: 1px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px">
									<span class="styLNLeftNumBoxSD">9</span>
								</td>
								<td class="styLNDesc" style="border-color: black; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; width: 99mm; border-bottom-width: 1px">Total income (add lines 3 through 8)
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </b>
								</td>
								<td class="styLNRightNumBox">9</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTotalIncome"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 9   -->
							<!--   BEGIN LINE 10   -->
							<tr>
								<!-- this is the place II -->
								<td class="styIRS5471Img" rowspan="10" style="width: 6mm; padding-top:5mm; border-bottom-width: 1px">
									<img src="{$ImagePath}/5471_Deductions.gif" alt="VerticalDeductions"/>
								</td>
								<td>
									<span class="styLNLeftNumBox">10</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Compensation not deducted elsewhere
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">10</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCompensationNotDeducted"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCompensationNotDeducted"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 10   -->
							<!--   BEGIN LINE 11a   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">11a</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Rents
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">11a</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignRents"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USRents"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 11a   -->
							<!--   BEGIN LINE 11b   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD" style="padding-left:5mm;">b</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Royalties and license fees
								          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
           <span class="styNBSP"/>.
            <span class="styNBSP"/>.
           <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">11b</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnRoyaltiesAndLicensesFees"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USRoyaltiesAndLicensesFees"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 11b   -->
							<!--   BEGIN LINE 12   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">12</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Interest
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </b>
								</td>
								<td class="styLNRightNumBox">12</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDeductionInterest"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDeductionsInterest"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 12   -->
							<!--   BEGIN LINE 13   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">13</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Depreciation not deducted elsewhere
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">13</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDepreciationNotDeducted"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDepreciationNotDeducted"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 13   -->
							<!--   BEGIN LINE 14  -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">14</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Depletion
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </b>
								</td>
								<td class="styLNRightNumBox">14</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDepletion"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDepletion"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 14   -->
							<!--   BEGIN LINE 15   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">15</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Taxes (exclude provision for income, war profits, and excess</td>
								<td class="styLNRightNumBox" style="border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 36mm; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 36mm; border-bottom-width: 0px; width: 34mm">
									<span style="width: 1px"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="styLNLeftNumBox">
										<span style="width: 1px"/>
									</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">profits  taxes)
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">15</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTaxes"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTaxes"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 15   -->
							<!--   BEGIN LINE 16   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">16</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Other deductions (attach schedule&#151;exclude provision for income, war profits, and excess profits taxes)
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.


          </b>
								</td>
								<td class="styLNRightNumBox" style="padding-top: 3mm">16</td>
								<td style="width: 4mm; border-color: black; border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-top:3mm">
									<span style="width: 1px"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherDeductions"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="padding-top: 3mm; width: 34mm; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherDeductions"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<!--<td style="width: 4mm; border-color: black; border-style: solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-top: 3mm">
                  <span style="width: 1px"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherDeductions"/>
                  </xsl:call-template>
                </td>-->
								<td class="styLNAmountBox" style="padding-top: 3mm; width: 34mm" colspan="2">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherDeductions"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherDeductions"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 16   -->
							<!--   BEGIN LINE 17   -->
							<tr>
								<td style="border-color:black; border-style:solid; border-bottom-width: 1px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px">
									<span class="styLNLeftNumBox">17</span>
								</td>
								<td class="styLNDesc" style="border-color: black; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; width: 99mm; border-bottom-width: 1px">Total deductions (add lines 10 through 16)
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">17</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTotalDeductions"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalDeductions"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 17   -->
							<!--   BEGIN LINE 18   -->
							<tr>
								<td class="styIRS5471Img" rowspan="6" style="width: 6mm; padding-top:3mm;">
									<img src="{$ImagePath}/5471_NetIncome.gif" alt="VerticalNetIncome"/>
								</td>
								<td>
									<span class="styLNLeftNumBox">18</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Net income or (loss) before extraordinary items, prior period</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm;background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" colspan="2" style="border-bottom-width: 0px; background-color: lightgrey; width: 34mm">
									<span style="width: 1px"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox">
									<span style="width: 1px"/>
								</td>
								<td class="styLNDesc" style="width: 99mm">adjustments, and the provision for income, war profits, and excess</td>
								<td class="styLNRightNumBox" style="background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm; background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" colspan="2" style="border-bottom-width: 0px; background-color: lightgrey; width: 34mm">
									<span style="width: 1px"/>
								</td>
							</tr>
							<tr>
								<td style="width: 2mm">
									<span style="width: 1px"/>
								</td>
								<td class="styLNDesc" style="width: 99mm">profits taxes (subtract line 17 from line 9)
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox">18</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnTotalIncomeMinusTotalDed"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalIncomeMinusTotalDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 18   -->
							<!--   BEGIN LINE 19   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">19</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Extraordinary items and prior period adjustments (see instructions)</td>
								<td class="styLNRightNumBox">19</td>
								<td class="styLNAmountBox" colspan="2" style="width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignExtraordinaryItems"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USExtraordinaryItems"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 19  -->
							<!--   BEGIN LINE 20   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">20</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Provision for income, war profits, and excess profits taxes (see <br/>instructions)
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox" style="padding-top: 3mm">20</td>
								<td class="styLNAmountBox" colspan="2" style="padding-top: 3mm; width: 38mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignProvisionForIncome"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="padding-top: 3mm; width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USProvisionForIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 20  -->
							<!--   BEGIN LINE 21   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">21</span>
								</td>
								<td class="styLNDesc" style="width: 99mm">Current year net income or (loss) per books (combine lines 18 <br/>through 20)
          <b>
										<span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.

          </b>
								</td>
								<td class="styLNRightNumBox" style="border-bottom-width: 0px; padding-top: 3mm">21</td>
								<td class="styLNAmountBox" colspan="2" style="padding-top: 3mm; width: 38mm;border-bottom-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnCurrentYrNetIncomePerBooks"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" colspan="2" style="padding-top: 3mm; border-bottom-width: 0px; width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCurrentYearNetIncomePerBooks"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 21 -->
						</tbody>
					</table>
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2007)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2007)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN SCHEDULE E   -->
					<!--   BEGIN SCHEDULE E HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm; height:3.75mm;'">Schedule E</div>
						<div class="styPartDesc" style="width: 158mm;">
              Income, War Profits, and Excess Profits Taxes Paid or Accrued 
              <span style="font-size: 7pt; width: 43mm; font-weight: normal;">(See instructions.)</span>
						</div>
						<span style="width:7mm;text-align:right;float:right; clear: none;">
							<xsl:call-template name="SetTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471EData/IncomeAndWarProfitsTaxesPaid"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'PActn' "/>
								<xsl:with-param name="imageID" select=" 'PAimg' "/>
								<xsl:with-param name="buttonID" select=" 'PAbtn' "/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END SCHEDULE E HEADER   -->
					<!--  BEGIN A, B, C and D   -->
					<div class="styIRS5471TableContainer" style="height: 39mm;float:left;clear:none;" name="PActn" id="PActn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" name="PATable" id="PATable" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="border-color: black; width: 76mm;" rowspan="2">
										<b>(a)</b>
										<br/>
										<span class="styNormalText">Name of country or U.S. possession</span>
									</th>
									<th class="styTableCellHeader" style="border-color:black; height:4mm;width:110mm; border-right-width:0px" colspan="3">
										<b>
											<span class="styBoldText">Amount of Tax</span>
										</b>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" style="border-color:black; height:7.25mm;width:36mm;">
										<b>(b)</b>
										<br/>
										<span class="styNormalText">In foreign currency</span>
									</th>
									<th class="styTableCellHeader" style="border-color:black; width:44mm;">
										<b>(c)</b>
										<br/>
										<span class="styNormalText">Conversion rate</span>
									</th>
									<th class="styTableCellHeader" style="border-color:black; width: 32mm; border-right-width:0px">
										<b>(d)</b>
										<br/>
										<span class="styNormalText">In U.S. dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<tr style="height:4mm;">
									<td class="styTableCell" style="border-color:black; width:76mm; text-align: left">
										<span style="width: 2mm"/>
										<b>1</b>
										<span style="width: 2mm"/>U.S.
                  </td>
									<td class="styTableCell" style="border-color:black;width:36mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-color:black;width:42mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-color:black;text-align:right; border-right-width:0px;width:32mm;">
										<!--                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS5471EData/USIncomeAndProfitsTaxes"/>
                    </xsl:call-template>   -->
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<xsl:for-each select="$IRS5471EData/IncomeAndWarProfitsTaxesPaid">
									<xsl:if test="($Print != $Separated) or (count($IRS5471EData/IncomeAndWarProfitsTaxesPaid) &lt;= 6)">
										<tr style="height:4mm;">
											<td class="styTableCell" style="border-color:black;width:76mm;text-align: left">
												<span style="width: 2mm"/>
												<span class="styBoldText">
													<xsl:choose>
														<xsl:when test="position()&lt;7">
															<xsl:number value="position() + 1"/>
														</xsl:when>
													</xsl:choose>
												</span>
												<span style="width:2mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfCountryOrUSPosession"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black;width:36mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmountOfTaxInForeignCurrency"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black;width:42mm;text-align:center;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AmountOfTaxConversionRate"/>
												</xsl:call-template>
												<span style="width:2px;"/>
											</td>
											<td class="styTableCell" style="border-color:black; text-align:right;border-right-width:0px;width:32mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmountOfTaxInUSDollars"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styIRS5471TableLastCol" id="PAspcr"/>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:call-template name="AddRowsScheduleE">
									<xsl:with-param name="NumOfRows" select="6"/>
									<xsl:with-param name="TPCount" select="count($IRS5471EData/IncomeAndWarProfitsTaxesPaid)"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<!-- Schedule E line 8 -->
					<div class="styBB" style="width: 187mm;" rowspan="2">
						<span class="styLNLeftNumBoxSD" style="padding-top:4mm;">8</span>
						<span class="styLNDesc" style="border-right-width:0px;width:147mm;padding-top:4mm;">Total<b>
								<span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
    <span class="styNBSP"/>.
  </b>
							<img class="styIRS5471Img" style="border-right-width:0px;width:2mm;height:2mm; float:none;" src="{$ImagePath}/5471_Bullet_Line.gif" alt="bullet"/>
						</span>
						<span class="styLNAmountBox" style="height:8mm;padding-top:4mm;text-align:right;border-left-width:1px;border-bottom-width:0px; width:30mm;padding-right:1px;">
							<!--              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS5471EData/TotalIncomeAndWarProfitsTaxes"/>
              </xsl:call-template>     -->
						</span>
					</div>
					<!--   END A, B, C and D   -->
					<!--   END SCHEDULE E   -->
					<!--   BEGIN SCHEDULE F HEADER   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styPartName" style="border-top-width:0px;width: 21mm">Schedule F</div>
						<div class="styPartDesc" style="width: 80mm">Balance Sheet</div>
					</div>
					<div class="styGenericDiv" style="width: 187mmm; font-size: 8pt">
						<span class="styBoldText">Important:</span>
						<span class="styItalicText" style="width: 160mm; padding-left: 2mm"> Report all amounts in U.S. dollars prepared and translated in accordance with U.S. GAAP.  See</span>
					</div>
					<div class="styBB" style="width: 187mm; font-size: 8pt">
						<span class="styItalicText" style="width: 149mm">instructions for an exception for DASTM corporations.</span>
					</div>
					<!--   END SCHEDULE F HEADER   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 108mm; font-size: 8pt; height: 11mm; text-align: center">
							<b>Assets</b>
						</span>
						<span class="styLNRightNumBox" style="height: 11mm"/>
						<span class="styLNAmountBox" style="height: 11mm; text-align: center; width: 34mm">
							<b>(a)</b>
							<br/>Beginning of annual<br/>accounting period</span>
						<span class="styLNAmountBox" style="height: 11mm; text-align: center; width: 34mm">
							<b>(b)</b>
							<br/>End of annual<br/>accounting period</span>
					</div>
					<!--   BEGIN LINE 1   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">1</span>
						<span class="styLNDesc" style="width:100mm">Cash
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">1</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAccountingPeriodCash"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAccountingPeriodCash"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 1   -->
					<!--   BEGIN LINE 2   -->
					<!--   BEGIN LINE 2A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBox">2a</span>
						<span class="styLNDesc" style="width: 100mm">Trade notes and accounts receivable
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">2a</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAccountingPrdTradeNotes"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAccountingPrdTradeNotes"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 2A   -->
					<!--   BEGIN LINE 2B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">b</span>
						<span class="styLNDesc" style="width: 100mm">Less allowance for bad debts
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">2b</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTrdNtsLessBadDebt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTrdNotesLessBadDebt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 2B   -->
					<!--   END LINE 2   -->
					<!--   BEGIN LINE 3   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">3</span>
						<span class="styLNDesc" style="width: 100mm">Inventories
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
   </b>
						</span>
						<span class="styLNRightNumBox">3</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAccountingPrdInventories"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAccountingPrdInventories"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">4</span>
						<span class="styLNDesc" style="width: 100mm">Other current assets (attach schedule)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm">4</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrentAssets"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrentAssets"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrentAssets"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrentAssets"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 4   -->
					<!--   BEGIN LINE 5   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">5</span>
						<span class="styLNDesc" style="width: 100mm">Loans to shareholders and other related persons
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">5</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLoansToStkhldr"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLoansToStockholder"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 5   -->
					<!--   BEGIN LINE 6   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">6</span>
						<span class="styLNDesc" style="width: 100mm">Investment in subsidiaries (attach schedule)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm">6</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPeriodInvestInSbsds"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPeriodInvestInSbsds"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPeriodInvstInSbsds"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPeriodInvstInSbsds"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 6   -->
					<!--   BEGIN LINE 7   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">7</span>
						<span class="styLNDesc" style="width: 100mm">Other investments (attach schedule)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm">7</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherInvestments"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherInvestments"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPeriodOtherInvestments"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPeriodOtherInvestments"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 7   -->
					<!--   BEGIN LINE 8   -->
					<!--   BEGIN LINE 8A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBox">8a</span>
						<span class="styLNDesc" style="width: 100mm">Buildings and other depreciable assets
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm">8a</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdBldgAndOtherAst"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdBldgAndOtherAssets"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 8A   -->
					<!--   BEGIN LINE 8B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">b</span>
						<span class="styLNDesc" style="width: 100mm">Less accumulated depreciation
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">8b</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdAssetsLessDeprec"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdAssetsLessDeprec"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 8B   -->
					<!--  END LINE 8   -->
					<!--   BEGIN LINE 9   -->
					<!--   BEGIN LINE 9A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBox">9a</span>
						<span class="styLNDesc" style="width: 100mm">Depletable assets
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">9a</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdDepletableAssets"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdDepletableAssets"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 9A   -->
					<!--   BEGIN LINE 9B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">b</span>
						<span class="styLNDesc" style="width: 100mm">Less accumulated depletion
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">9b</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdAstLessDepletion"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdAstLessDepletion"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 9B   -->
					<!--  END LINE 9   -->
					<!--   BEGIN LINE 10   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">10</span>
						<span class="styLNDesc" style="width: 100mm">Land (net of any amortization)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">10</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BeginningAccountingPeriodLand"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAccountingPeriodLand"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 10   -->
					<!--   BEGIN LINE 11   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">11</span>
						<span class="styLNDesc" style="width: 100mm">Intangible assets:
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm; height: 4.5mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm; height: 4.5mm"/>
					</div>
					<!--  END LINE 11   -->
					<!--   BEGIN LINE 11A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">a</span>
						<span class="styLNDesc" style="width: 100mm">Goodwill
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">11a</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BeginningAccountingPrdGoodwill"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAccountingPrdGoodwill"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 11A   -->
					<!--   BEGIN LINE 11B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">b</span>
						<span class="styLNDesc" style="width: 100mm">Organization costs
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">11b</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOrganizationCosts"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOrganizationCosts"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 11B   -->
					<!--   BEGIN LINE 11C   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">c</span>
						<span class="styLNDesc" style="width: 100mm">Patents, trademarks, and other intangible assets
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">11c</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPatentsAndOtherAst"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPatentsAndOtherAst"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 11C   -->
					<!--   BEGIN LINE 11D   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">d</span>
						<span class="styLNDesc" style="width: 100mm">Less accumulated amortization for lines 11a, b, and c
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">11d</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdAssetsLessAmortz"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdAssetsLessAmortz"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 11d   -->
					<!--   BEGIN LINE 12   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">12</span>
						<span class="styLNDesc" style="width: 100mm">Other assets (attach schedule)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
   </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm">12</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BeginningAcctPeriodOtherAssets"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BeginningAcctPeriodOtherAssets"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPeriodOtherAssets"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPeriodOtherAssets"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 12   -->
					<!--   BEGIN LINE 13   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 108mm"/>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;width: 34mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;width: 34mm"/>
					</div>
					<div class="styBB" style="width: 187mm">
						<span class="styLNLeftNumBox">13</span>
						<span class="styLNDesc" style="width: 100mm">Total assets
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
   </b>
						</span>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px">13</span>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BeginningAcctPeriodTotalAssets"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPeriodTotalAssets"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 13   -->
					<!--   END LINE 1-13   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 108mm; height: 10mm; font-size: 8pt; text-align: center">
							<b>Liabilities and Shareholders' Equity</b>
						</span>
						<span class="styLNRightNumBox" style="height: 10mm; background-color: ligthgrey"/>
						<span class="styLNAmountBox" style="width: 34mm; height: 10mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="width: 37mm; height: 10mm; border-bottom-width: 0px; background-color: lightgrey"/>
					</div>
					<!--   BEGIN LINE 14   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">14</span>
						<span class="styLNDesc" style="width: 100mm">Accounts payable
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
   </b>
						</span>
						<span class="styLNRightNumBox">14</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPeriodAccountsPayable"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPeriodAccountsPayable"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 14   -->
					<!--   BEGIN LINE 15   -->
					<div class="styGenericDiv">
						<span class="styLNLeftNumBox">15</span>
						<span class="styLNDesc" style="width: 100mm">Other current liabilities (attach schedule)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm">15</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrentLiab"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrentLiab"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrentLiab"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrentLiab"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 15   -->
					<!--   BEGIN LINE 16   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">16</span>
						<span class="styLNDesc" style="width: 100mm">Loans from shareholders and other related persons
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">16</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLoansFromStkhldr"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLoansFromStkhldr"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 16   -->
					<!--   BEGIN LINE 17   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">17</span>
						<span class="styLNDesc" style="width: 100mm">Other liabilities (attach schedule)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm">17 </span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherLiabilities"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherLiabilities"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherLiabilities"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherLiabilities"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 17   -->
					<!--   BEGIN LINE 18   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">18</span>
						<span class="styLNDesc" style="width: 100mm">Capital stock:</span>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm"/>
					</div>
					<!--  END LINE 18   -->
					<!--   BEGIN LINE 18A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">a</span>
						<span class="styLNDesc" style="width: 100mm">Preferred stock
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">18a</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BeginningAcctPrdPreferredStock"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAccountingPrdPreferredStock"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 18A   -->
					<!--   BEGIN LINE 18B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">b</span>
						<span class="styLNDesc" style="width: 100mm">Common stock
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">18b</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BeginningAcctPeriodCommonStock"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPeriodCommonStock"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 18B   -->
					<!--   BEGIN LINE 19   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">19</span>
						<span class="styLNDesc" style="width: 100mm">Paid-in or capital surplus (attach reconciliation)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
   </b>
						</span>
						<span class="styLNRightNumBox">19</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BeginningAcctPrdPaidInSurplus"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BeginningAcctPrdPaidInSurplus"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAccountingPrdPaidInSurplus"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAccountingPrdPaidInSurplus"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 19   -->
					<!--   BEGIN LINE 20   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">20</span>
						<span class="styLNDesc" style="width: 100mm">Retained earnings
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">20</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdRetainedEarnings"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPeriodRetainedEarnings"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 20   -->
					<!--   BEGIN LINE 21   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">21</span>
						<span class="styLNDesc" style="width: 100mm">Less cost of treasury stock
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox">21</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdRtnEarnLessTrStock"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdRtnEarnLessTrStock"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 21   -->
					<!--   BEGIN LINE 22   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 108mm"/>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;width: 34mm"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">22</span>
						<span class="styLNDesc" style="width: 100mm">Total liabilities and shareholders' equity
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
   </b>
						</span>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px">22</span>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTotLiabAndEquity"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTotLiabAndEquity"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 22   -->
					<!--   END LINE 14-22   -->
					<!--   END SCHEDULE F   -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2007)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2007)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN SCHEDULE G   -->
					<!--   BEGIN SCHEDULE G HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm; float: left;">Schedule G</div>
						<div class="styPartDesc" style="width: 165mm;">
							<span style="width:16px; float: left;"/>Other Information</div>
					</div>
					<!--   END SCHEDULE G HEADER   -->
					<div class="styGenericDiv" style="font-size:8pt">
						<span class="styLNDesc" style="font-size: 8pt; width: 171mm"/>
						<span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPartnership"/>
									<xsl:with-param name="backupName">IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
								<b>Yes </b>
							</label>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPartnership"/>
									<xsl:with-param name="backupName">IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</span>
					</div>
					<!--   BEGIN LINE 1   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">1</span>
						<span class="styLNDesc" style="width: 175mm">During the tax year, did the foreign corporation own at least a 10% interest, directly or indirectly, in any foreign </span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 166mm; margin-left:8mm">partnership?
    			<b>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPartnership"/>
								</xsl:call-template>
								<span class="styNBSP"/>.
      		<span class="styNBSP"/>.
      		<span class="styNBSP"/>.
      		<span class="styNBSP"/>.
      		<span class="styNBSP"/>.
      		<span class="styNBSP"/>.
     		 <span class="styNBSP"/>.
     		 <span class="styNBSP"/>.
     		 <span class="styNBSP"/>.
     		 <span class="styNBSP"/>.
   			 <span class="styNBSP"/>.
      		<span class="styNBSP"/>.
      		<span class="styNBSP"/>.
     		 <span class="styNBSP"/>.
     		 <span class="styNBSP"/>.
      		<span class="styNBSP"/>.
     		 <span class="styNBSP"/>.
      		<span class="styNBSP"/>.
      		<span class="styNBSP"/>.
     		 <span class="styNBSP"/>.
      		<span class="styNBSP"/>.
      		<span class="styNBSP"/>.
     		 <span class="styNBSP"/>.
     		 <span class="styNBSP"/>.
    		</b>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPartnership"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPartnership"/>
									<xsl:with-param name="backupName">IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPartnership"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPartnership"/>
									<xsl:with-param name="backupName">IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="margin-left: 8mm">If "Yes," see the instructions for required attachment.</span>
					</div>
					<!--   BEGIN LINE 2   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">2</span>
						<span class="styLNDesc" style="width: 166mm">During the tax year, did the foreign corporation own an interest in any trust?
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
   </b>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
									<xsl:with-param name="backupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
									<xsl:with-param name="backupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
							<xsl:with-param name="backupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
							<xsl:with-param name="backupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
					<!--   END LINE 2   -->
					<!--   BEGIN LINE 3   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">3</span>
						<span class="styLNDesc" style="width: 175mm">During the tax year, did the foreign corporation own any foreign entities that were disregarded as entities</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 166mm; margin-left: 8mm">separate from their owners under Regulations sections 301.7701-2 and 301.7701-3 (see instructions)?
    <b>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsAnyForeignEntities"/>
									<xsl:with-param name="backupName">IRS5471OwnsAnyForeignEntities</xsl:with-param>
								</xsl:call-template>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsAnyForeignEntities"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsAnyForeignEntities"/>
									<xsl:with-param name="backupName">IRS5471OwnsAnyForeignEntities</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsAnyForeignEntities"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsAnyForeignEntities"/>
									<xsl:with-param name="backupName">IRS5471OwnsAnyForeignEntities</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsAnyForeignEntities"/>
							<xsl:with-param name="backupName">IRS5471OwnsAnyForeignEntities</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsAnyForeignEntities"/>
							<xsl:with-param name="backupName">IRS5471OwnsAnyForeignEntities</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 160mm; margin-left: 8mm">If “Yes,” you are generally required to attach Form 8858 for each entity (see instructions).</span>
					</div>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">4</span>
						<span class="styLNDesc" style="width: 166mm">During the tax year, was the foreign corporation a participant in a cost sharing arrangement?
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
       <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      
   </b>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignCorpWasParticipant"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignCorpWasParticipant"/>
									<xsl:with-param name="backupName">IRS5471ForeignCorpWasParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignCorpWasParticipant"/>
									<xsl:with-param name="backupName">IRS5471ForeignCorpWasParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
							<xsl:with-param name="backupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
							<xsl:with-param name="backupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
					<!--   END LINE 4   -->
					<!--   BEGIN LINE 5   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">5</span>
						<span class="styLNDesc" style="width: 166mm">During the tax year, did the foreign corporation become a participant in a cost sharing arrangement?
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
       <span class="styNBSP"/>.
      <span class="styNBSP"/>.
 
      
   </b>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignCorpWasParticipant"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignCorpBecameParticipant"/>
									<xsl:with-param name="backupName">IRS5471ForeignCorpBecameParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignCorpBecameParticipant"/>
									<xsl:with-param name="backupName">IRS5471ForeignCorpBecameParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
							<xsl:with-param name="backupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/OwnsInterestInAnyTrust"/>
							<xsl:with-param name="backupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
					<!--   END LINE 5   -->
					<!--   BEGIN SCHEDULE H   -->
					<!--   BEGIN SCHEDULE H HEADER   -->
					<div class="styBB" style="border-bottom-width: 0px;border-top-width:1px; width: 187mm;">
						<div class="styPartName" style="width: 22mm;float:left;">Schedule H</div>
						<div class="styPartDesc" style="width: 165mm">
							<span style="width:16px; float: left;"/>Current Earnings and Profits
            <span style="font-size: 8pt; width: 50mm; font-weight: normal">(see instructions.)</span>
						</div>
					</div>
					<!--   END SCHEDULE H HEADER   -->
					<!--   BEGIN IMPORTANT HEADER   -->
					<div class="styBB" style="width: 187mm">
						<span class="styBoldText" style="font-size: 8pt">Important:</span>
						<span class="styItalicText" style="font-size: 8pt; width: 120mm; font-weight: normal;">
							<span style="width:2px"/>  Enter the amounts on lines 1 through 5c in <b>functional</b> currency.</span>
					</div>
					<!--   END IMPORTANT HEADER   -->
					<!--   BEGIN LINE 1   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD" style="height: 4.5mm">1</span>
						<span class="styLNDesc" style="width: 138mm">Current year net income or (loss) per foreign books of account
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.75mm">1</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.75mm; width: 33mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471HData/CYIncomePerForeignBooksOfAcct"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 1   -->
					<!--   BEGIN LINE 2   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 146mm"/>
						<span class="styLNRightNumBox" style="height: 4.5mm;width: 8mm;background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; width: 33mm;background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">2</span>
						<span class="styLNDesc" style="width: 69.75mm; vertical-align: bottom;">Net adjustments made to line 1 to determine current</span>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 34mm; border-bottom-width:0px; border-top-width: 1px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 34mm; border-bottom-width:0px; border-top-width: 1px"/>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm;background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 69.75mm; margin-left: 8mm">earnings and profits according to U.S. financial and</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; width: 34mm; border-left-width: 1px; border-bottom-width: 0px; text-align: center; font-weight: bold">Net</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; width: 34mm; border-left-width: 1px; border-bottom-width: 0px; text-align: center; font-weight: bold">Net</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="padding-top: .75mm; height: 4.5mm; width: 69.75mm; margin-left: 8mm; vertical-align: top;">tax accounting standards (see instructions):</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; width: 34mm; border-left-width: 1px; border-bottom-width: 0px; text-align: center; font-weight: bold">Additions</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; width: 34mm; border-left-width: 1px; border-bottom-width: 0px; text-align: center; font-weight: bold">Subtractions</span>
						<span class="styLNRightNumBox" style="height: 4.5mm;  background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="padding-top: .75mm; height: 4.5mm; width: 77.75mm; "/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 34mm; border-left-width: 1px; text-align: center"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 34mm; border-left-width: 1px; text-align: center"/>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   BEGIN LINE 2A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">a</span>
						<span class="styLNDesc" style="width: 69.75mm">Capital gains or losses
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; font-size: 6pt; height: 4.5mm; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/CapitalGainsOrLossNetAddition"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; font-size: 6pt; height: 4.5mm; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/CapitalGainsLossNetSubtraction"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2A   -->
					<!--   BEGIN LINE 2B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">b</span>
						<span class="styLNDesc" style="width: 69.75mm">Depreciation and amortization
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/DeprecAndAmortizNetAddition"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/DeprecAndAmortizNetSubtraction"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm;background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2B   -->
					<!--   BEGIN LINE 2C   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">c</span>
						<span class="styLNDesc" style="width: 69.75mm">Depletion
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/DepletionNetAddition"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/DepletionNetSubtraction"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm;background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2C   -->
					<!--   BEGIN LINE 2D   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">d</span>
						<span class="styLNDesc" style="width: 69.75mm">Investment or incentive allowance
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/InvstOrIncntvAllowanceNetAddn"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm;  border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/InvstOrIncntvAllwncNetSubtrctn"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2D   -->
					<!--   BEGIN LINE 2E   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">e</span>
						<span class="styLNDesc" style="width: 69.75mm">Charges to statutory reserves
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/ChrgsToStryReservesNetAddition"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/ChrgsToStryRsrvNetSubtraction"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2E   -->
					<!--   BEGIN LINE 2F   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">f</span>
						<span class="styLNDesc" style="width: 69.75mm">Inventory adjustments
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/InventoryAdjustmentNetAddition"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/InventoryAdjNetSubtraction"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2F   -->
					<!--   BEGIN LINE 2G   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">g</span>
						<span class="styLNDesc" style="width: 69.75mm">Taxes
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/TaxesNetAddition"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/TaxesNetSubtraction"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm;background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2G   -->
					<!--   BEGIN LINE 2H   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">h</span>
						<span class="styLNDesc" style="width: 69.75mm">Other (attach schedule)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
   </b>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471HData/OtherAdjustmentsNetAddition"/>
									<xsl:with-param name="Style">width: 8mm; text-align:right</xsl:with-param>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/OtherAdjustmentsNetAddition"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471HData/OtherAdjNetSubtraction"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/OtherAdjNetSubtraction"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height:5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height:5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2H   -->
					<!--   END LINE 2   -->
					<!--   BEGIN LINE 3   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">3</span>
						<span class="styLNDesc" style="width: 69.75mm">Total net additions
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 34mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/TotalNetAdditions"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 34mm; border-left-width: 1px; background-color: lightgrey"/>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm;border-bottom-width: 0px; background-color: lightgrey"/>
					</div>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">4</span>
						<span class="styLNDesc" style="width: 104mm">Total net subtractions
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4mm; font-size: 6pt; width: 34mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/TotalNetSubtractions"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm;background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 4   -->
					<!--   BEGIN LINE 5A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBox">5a</span>
						<span class="styLNDesc" style="width: 138mm">Current earnings and profits (line 1 plus line 3 minus line 4)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm;">5a</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/CurrentEarningsAndProfits"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 5A   -->
					<!--   BEGIN LINE 5B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBox">b</span>
						<span class="styLNDesc" style="width: 138mm">DASTM gain or (loss) for foreign corporations that use DASTM (see instructions)
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm;">5b</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt;width: 33mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/DASTMGainOrLoss"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 5B   -->
					<!--   BEGIN LINE 5C   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBox">c</span>
						<span class="styLNDesc" style="width: 138mm">Combine lines 5a and 5b
    <b>
								<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm">5c</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/EarnAndProfitsPlusDASTMGain"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 5C   -->
					<!--   BEGIN LINE 5D   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBox">d</span>
						<span class="styLNDesc" style="width: 138mm">Current earnings and profits in U.S. dollars (line 5c translated at the appropriate exchange rate as</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 137.75mm; margin-left: 8.25mm">defined in section 989(b) and the related regulations (see instructions))</span>
						<span class="styLNRightNumBox" style="height: 4.5mm;">5d</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; font-size: 6pt; width: 33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471HData/CurrentEarnAndPrftInUSDollars"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="border-right-width: 0px; width: 49.75mm; margin-left: 8.25mm">Enter exchange rate used for line 5d</span>
						<img class="styIRS5471Img" style="border-right-width: 0px; width: 2mm; height: 2mm; float: none" src="{$ImagePath}/5471_Bullet_Line.gif" alt="bullet"/>
						<span style="width:8px"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS5471HData/CurrentEarnAndPrftInUSDollars/@exchangeRateUsed"/>
						</xsl:call-template>
					</div>
					<!--   END LINE 5D SCHEDULE H  -->
					<div class="styBB" style="width:187mm;float:none;clear:both;"/>
					<!-- Schedule I header -->
					<!-- Filler for Schedule I-->
					<!-- Display the data container only if there is no data for Schedule I. -->
					<!-- If the print parameter is "separated" and there is more than one instance of Schedule I, -->
					<!-- then display a message directing the user to the additional data table -->
					<xsl:if test="not($IRS5471IData)">
						<div class="styBB" style="width:187mm;float:none;clear:both;">
							<span class="styPartName" style="width: 20mm;float:left;">Schedule I</span>
							<span class="styPartDesc" style="width: 160mm;">Summary of Shareholder’s Income From Foreign Corporation<span class="styNormalText"> (see instructions)</span>
							</span>
						</div>
						<!--        <div class="styBB" style="width:187mm;"> -->
						<!-- Schedule I line 1 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">1</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Subpart F income (line 38b, Worksheet A in the instructions)    
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn">..............</div>
								<div class="styLNRightNumBox">
                  1
                </div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$IRS5471IData/IRS5471ScheduleI"/>
										<xsl:with-param name="ShortMessage" select="'true'"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">2</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Earnings invested in U.S. property (line 17, Worksheet B in the instructions)   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn">.........</div>
								<div class="styLNRightNumBox">2</div>
								<div class="styLNAmountBox" style="width:33mm;"/>
							</div>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">3</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Previously excluded subpart F income withdrawn from qualified investments (line 6b, Worksheet C   
                </div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBoxNBB"/>
								<div class="styLNAmountBoxNBB" style="width:33mm;"/>
							</div>
						</div>
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;"/>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  in the instructions)   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn">............................</div>
								<div class="styLNRightNumBox">3</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PrevExcludedSubpartFIncome"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 4 first line-->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">4</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Previously excluded export trade income withdrawn from investment in export trade assets (line 7b,  
                </div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBoxNBB"/>
								<div class="styLNAmountBoxNBB" style="width:33mm;"/>
							</div>
						</div>
						<!-- Line 4 second line-->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;"/>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Worksheet D in the instructions)   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn">.......................</div>
								<div class="styLNRightNumBox">
                4
                </div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="WithdrawnExportTradeIncome"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">5</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Factoring income   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn">............................</div>
								<div class="styLNRightNumBox">
                  5
                </div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="FactoringIncome"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 6 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">6</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Total of lines 1 through 5. Enter here and on your income tax return. See instructions   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn">......</div>
								<div class="styLNRightNumBox">
                  6
                </div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="WthdrwPropAndFactoringIncome"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 7 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">7</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Dividends received (translated at spot rate on payment date under section 989(b)(1))   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn">......</div>
								<div class="styLNRightNumBox">7
                </div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="DividendsReceived"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 8 -->
						<div class="styBB" style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">8</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Exchange gain or (loss) on a distribution of previously taxed income  
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn">............</div>
								<div class="styLNRightNumBoxNBB">
                 8
                </div>
								<div class="styLNAmountBoxNBB" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ExchangeGainOnDistribution"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--YES and NO Boxes for blocked income -->
						<div class="styGenericDiv" style="width: 187mm;">
							<span class="styLNDesc" style="font-size: 8pt; width: 186mm;background-color:yellow;">
								<span style="float: right; clear: none">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
										</xsl:call-template>
										<b>No</b>
									</label>
									<span style="width: 2mm"/>
								</span>
								<span style="float: right; clear: none">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
										</xsl:call-template>
										<b>Yes </b>
									</label>
									<span style="width: 1.42mm"/>
								</span>
							</span>
						</div>
						<!--   BEGIN LINE 1   -->
						<div class="styGenericDiv" style="width: 187mm;padding-top:1mm;">
							<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
							<span class="styLNDesc" style="width: 169mm; margin-left: 1mm">Was any income of the foreign corporation blocked?
    <b>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
									</xsl:call-template>
									<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>. 
    </b>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width: 10px"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<!--   END LINE 1   -->
						<div class="styGenericDiv" style="width: 187mm">
							<span class="styLNDesc" style="font-size: 8pt; width: 186mm">
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
									</xsl:call-template>
								</label>
								<span style="width: 2mm"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
									</xsl:call-template>
								</label>
							</span>
						</div>
						<!--   BEGIN LINE 2   -->
						<div class="styGenericDiv" style="width: 187mm">
							<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
							<span class="styLNDesc" style="width: 169mm; margin-left: 1mm">Did any such income become unblocked during the tax year (see section 964(b))?
    <b>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
									</xsl:call-template>
									<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width: 10px"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styGenericDiv" style="width: 187mm;">
							<span class="styLNDesc" style="width: 160mm;">If the answer to either question is "Yes," attach an explanation.</span>
						</div>
					</xsl:if>
					<!--   END LINE 2   -->
					<!-- Display all instances of Schedule I data if the print option is not "separated" -->
					<!-- If the print option is "separated", but there is only one Schedule I, display that instance -->
					<xsl:for-each select="$IRS5471IData">
						<div class="styBB" style="width:187mm;float:none;clear:both;">
							<span class="styPartName" style="width: 20mm;">Schedule I</span>
							<span class="styPartDesc" style="width: 160mm;">Summary of Shareholder’s Income From Foreign Corporation<span class="styNormalText"> (see instructions)</span>
							</span>
						</div>
						<div class="styBB" style="width:187mm;float:none;clear:both;">
							<!-- Schedule I line 1 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;">1</div>
									<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Subpart F income (line 38b, Worksheet A in the instructions)    
                </div>
								</div>
								<div style="float:right;">
									<div class="styDotLn">..............</div>
									<div class="styLNRightNumBox">
                  1
                </div>
									<div class="styLNAmountBox" style="width:33mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SubpartFIncome"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- Line 2 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;">2</div>
									<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Earnings invested in U.S. property (line 17, Worksheet B in the instructions)   
                </div>
								</div>
								<div style="float:right;">
									<div class="styDotLn">.........</div>
									<div class="styLNRightNumBox">
                  2
                </div>
									<div class="styLNAmountBox" style="width:33mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="EarningsInvestedInUSProperty"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- Line 3 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;">3</div>
									<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Previously excluded subpart F income withdrawn from qualified investments (line 6b, Worksheet C   
                </div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBoxNBB"/>
									<div class="styLNAmountBoxNBB" style="width:33mm;"/>
								</div>
							</div>
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;"/>
									<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  in the instructions)   
                </div>
								</div>
								<div style="float:right;">
									<div class="styDotLn">............................</div>
									<div class="styLNRightNumBox">3</div>
									<div class="styLNAmountBox" style="width:33mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PrevExcludedSubpartFIncome"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- Line 4 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;">4</div>
									<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Previously excluded export trade income withdrawn from investment in export trade assets (line 7b,  
                </div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBoxNBB"/>
									<div class="styLNAmountBoxNBB" style="width:33mm;"/>
								</div>
							</div>
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;"/>
									<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Worksheet D in the instructions)  
                </div>
								</div>
								<div style="float:right;">
									<div class="styDotLn">.......................</div>
									<div class="styLNRightNumBox">4</div>
									<div class="styLNAmountBox" style="width:33mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="WithdrawnExportTradeIncome"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- Line 5 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;">5</div>
									<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Factoring income    
                </div>
								</div>
								<div style="float:right;">
									<div class="styDotLn">............................</div>
									<div class="styLNRightNumBox">
                  5
                </div>
									<div class="styLNAmountBox" style="width:33mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="FactoringIncome"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- Line 6 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;">6</div>
									<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Total of lines 1 through 5. Enter here and on your income tax return. See instructions    
                </div>
								</div>
								<div style="float:right;">
									<div class="styDotLn">......</div>
									<div class="styLNRightNumBox">
                  6
                </div>
									<div class="styLNAmountBox" style="width:33mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="WthdrwPropAndFactoringIncome"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- Line 7 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;">7</div>
									<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Dividends received (translated at spot rate on payment date under section 989(b)(1))   
                </div>
								</div>
								<div style="float:right;">
									<div class="styDotLn">......</div>
									<div class="styLNRightNumBox">7</div>
									<div class="styLNAmountBox" style="width:33mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="DividendsReceived"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- Line 8 -->
							<div style="width:187mm;border-bottom:1px solid black;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;">8</div>
									<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                 Exchange gain or (loss) on a distribution of previously taxed income    
                </div>
								</div>
								<div style="float:right;">
									<div class="styDotLn">............</div>
									<div class="styLNRightNumBoxNBB">8</div>
									<div class="styLNAmountBoxNBB" style="width:33mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ExchangeGainOnDistribution"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<div class="styGenericDiv" style="width: 187mm">
								<span class="styLNDesc" style="font-size: 8pt; width: 186mm">
									<span style="float: right; clear: none">
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
											</xsl:call-template>
											<b>No</b>
										</label>
										<span style="width: 2mm"/>
									</span>
									<span style="float: right; clear: none">
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
											</xsl:call-template>
											<b>Yes </b>
										</label>
										<span style="width: 1.42mm"/>
									</span>
								</span>
							</div>
							<!--   BEGIN LINE 1   -->
							<div class="styGenericDiv" style="width: 187mm;padding-top:1mm;">
								<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
								<span class="styLNDesc" style="width: 169mm; margin-left: 1mm">Was any income of the foreign corporation blocked?
    <b>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
										</xsl:call-template>
										<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
								</span>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
										</xsl:call-template>
									</input>
								</span>
								<span class="styNBSP" style="width: 10px"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<!--   END LINE 1   -->
							<div class="styGenericDiv" style="width: 187mm">
								<span class="styLNDesc" style="font-size: 8pt; width: 186mm">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
										</xsl:call-template>
									</label>
									<span style="width: 2mm"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
										</xsl:call-template>
									</label>
								</span>
							</div>
							<!--   BEGIN LINE 2   -->
							<div class="styGenericDiv" style="width: 187mm">
								<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
								<span class="styLNDesc" style="width: 169mm; margin-left: 1mm">Did any such income become unblocked during the tax year (see section 964(b))?
    <b>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
										</xsl:call-template>
										<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
								</span>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
										</xsl:call-template>
									</input>
								</span>
								<span class="styNBSP" style="width: 10px"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="styGenericDiv" style="width: 187mm">
								<span class="styLNDesc" style="width: 160mm;">If the answer to either question is "Yes," attach an explanation.</span>
							</div>
						</div>
					</xsl:for-each>
					<!--   END LINE 2   -->
					<!--   BEGIN FORM FOOTER  -->
					<div style="width: 187mm; border-color: black;padding-top:.5mm; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<span style="float: left; width: 100mm"/>
						<span style="float: right">Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2007)</span>
					</div>
					<!--   END FORM FOOTER   -->
					<br/>
					<div class="pageEnd"/>
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
          Additional Data        
        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$IRS5471Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Change In Taxable Year No. 898c</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/ChangeInTaxableYearNo898c"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Election Change In Year 898c</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/ElectionChangeInYear898c"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section 898c Election</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/Section898cElection"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section 338g Election</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/Section338gElection"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dormant Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/@dormantIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Change Annual Accounting Period</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/@changeAnnualAccountingPeriod"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Separated Repeating Data Table Line D -->
					<xsl:if test="($Print = $Separated) and  (count($IRS5471Data/PersonInformationIsFiledFor) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471, Line D - Person(s) on whose behalf this information return is filed:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="font-size: 7pt; text-align: center" rowspan="2">
										<b>
											<br/>(1)</b> Name</th>
									<th class="styDepTblCell" style="font-size: 7pt; text-align: center" rowspan="2">
										<b>
											<br/>(2)</b> Address</th>
									<th class="styDepTblCell" style="font-size: 7pt; text-align: center" rowspan="2">
										<b>
											<br/>(3)</b> Identifying number</th>
									<th class="styDepTblCell" style="font-size: 7pt;" colspan="3">
										<b>(4)</b> Check applicable box(es)</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell">Shareholder</th>
									<th class="styDepTblCell">Officer</th>
									<th class="styDepTblCell">Director</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471Data/PersonInformationIsFiledFor">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width: 68mm; font-size: 7pt;text-align: left">
											<xsl:if test="PersonName!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonName"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
												</xsl:call-template>
												<xsl:if test="BusinessName/BusinessNameLine2 != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 63mm; font-size: 7pt;text-align: left">
											<xsl:if test="AddressInUS !=''">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressInUS"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="AddressInForeign !=''">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressInForeign"/>
												</xsl:call-template>
											</xsl:if>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 30mm; text-align: center; font-size: 7pt;">
											<xsl:choose>
												<xsl:when test="EIN != ''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReason"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align: center; font-size: 7pt; width: 17mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderIndicator"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="text-align: center; font-size: 7pt; width: 11mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OfficerIndicator"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="text-align: center; font-size: 7pt; width: 14mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DirectorIndicator"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Repeating Data Table Line D -->
					<!-- Separated Repeating Data Table for Schedule A -->
					<xsl:if test="($Print = $Separated) and  (count($IRS5471AData/StockOfTheForeignCorporation) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471, Schedule A - Stock of the Foreign Corporation:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width: 90mm; text-align: center; font-size: 7pt;" rowspan="2">
										<br/>
										<b>(a)</b> Description of each class of stock</th>
									<th class="styDepTblCell" style="width: 96mm; text-align: center; border-right-width: 0px; font-size: 7pt;" colspan="2">
										<b>(b)</b> Number of shares issued and outstanding</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width: 48mm; text-align: center;">
										<i>(i)</i> Beginning of annual accounting period</th>
									<th class="styDepTblCell" style="width: 48mm; border-right-width:0px;">
										<i>(ii)</i> End of annual accounting period</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471AData/StockOfTheForeignCorporation">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width: 90mm; text-align: left">
											<xsl:choose>
												<xsl:when test="DescOfEachClassOfStock">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DescOfEachClassOfStock"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SelectionOfEachClassOfStock "/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 48mm;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NumOfSharesBegngAnnualAcctPrd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 48mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NumberOfSharesEndAnnualAcctPrd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Repeating Data Table for Schedule A -->
					<!-- Separated Repeating Data Table for Schedule B -->
					<xsl:if test="((count($IRS5471BData/USShareholdersOfForeignCorp) &gt; 5) or (count($IRS5471BData/USShareholdersOfForeignCorp[count(ForeignCorporationStocks) &gt; 4]) &gt; 0)) and ($Print = $Separated)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471, Schedule B - U.S. Shareholders of Foreign Corporation (See page 4 of the instructions.):</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width: 60mm; text-align: center;">
										<br/>
										<br/>
										<b>(a)</b> Name, address, and identifying number of shareholder</th>
									<th class="styDepTblCell" style="width: 60mm; text-align: center">
										<b>(b)</b> Description of each class of stock held by shareholder (<b>Note:</b>
										<i> This description should match the corresponding description entered in Schedule A, Part I, column (a).)</i>
									</th>
									<th class="styDepTblCell" style="width: 20mm; text-align: center">
										<b>(c)</b> Number of shares held at beginning of annual accounting period</th>
									<th class="styDepTblCell" style="width: 20mm; text-align: center; border-right-width: 1px">
										<b>(d)</b> Number of shares held at end of annual accounting period</th>
									<th class="styDepTblCell" style="width: 20mm; text-align: center; border-right-width: 0px">
										<b>(e)</b> Pro rata share of subpart F income (enter as a percentage)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471BData/USShareholdersOfForeignCorp">
									<xsl:variable name="RowCount" select="count(ForeignCorporationStocks)"/>
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width: 60mm; text-align: left; font-size: 6pt">
											<xsl:choose>
												<xsl:when test="$RowCount&gt;4">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"/></xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="rowspan">4</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="PersonName != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonName"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1 != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1 != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="AddressInUS != ''">
												<xsl:if test="AddressInUS/AddressLine1 != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInUS/AddressLine1"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressInUS/AddressLine2 != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInUS/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressInUS/City != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInUS/City"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressInUS/State != ''">,
                <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInUS/State"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressInUS/ZIPCode != ''">
													<span style="width:8px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInUS/ZIPCode"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<xsl:if test="AddressInForeign != ''">
												<xsl:if test="AddressInForeign/AddressLine1 != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInForeign/AddressLine1"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressInForeign/AddressLine2 != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInForeign/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressInForeign/City != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInForeign/City"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressInForeign/ProvinceOrState != ''">,<span style="width: 1mm"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInForeign/ProvinceOrState"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressInForeign/PostalCode != ''">
													<span style="width: 2mm"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInForeign/PostalCode"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressInForeign/Country != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AddressInForeign/Country"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<br/>
											<xsl:choose>
												<xsl:when test="EINOfShareholder != ''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EINOfShareholder"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="SSNOfShareholder != ''">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSNOfShareholder"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonOfShareholder"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 60mm;text-align:left;padding-left:1px;padding-right:0px;padding-top:0px;padding-bottom:0px; font-size: 6pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/DescOfStockHeldByShareholder"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 20mm; text-align: right;padding-left:1px;padding-right:0px;padding-top:0px;padding-bottom:0px; font-size: 6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/NumOfSharesBegngAnnualAcctPrd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 20mm; text-align: right; border-right-width: 1px;font-size:6pt;padding-left:1px;padding-right:0px;padding-top:0px;padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/NumberOfSharesEndAnnualAcctPrd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 20mm; text-align: right; font-size: 6pt">
											<xsl:choose>
												<xsl:when test="$RowCount&gt;4">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"/></xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="rowspan">4</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="ProRataShareOfSubpartFIncome"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!--td class="styIRS5471TableLastCol" id="FSspcr"/-->
									</tr>
									<xsl:for-each select="ForeignCorporationStocks">
										<xsl:if test="not(position() = 1)">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCell" style="width: 60mm; text-align: left; font-size: 6pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DescOfStockHeldByShareholder"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width: 20mm; text-align: right; font-size: 6pt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="NumOfSharesBegngAnnualAcctPrd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width: 20mm; text-align: right; border-right-width: 1px; font-size: 6pt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="NumberOfSharesEndAnnualAcctPrd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="position()=last()">
											<xsl:call-template name="AddDepRowsScheduleB">
												<xsl:with-param name="RowNumber" select="position()"/>
												<xsl:with-param name="index" select="1"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Repeating Data Sch. B -->
					<!-- Separated data table for Schedule E -->
					<xsl:if test="($Print = $Separated) and  (count($IRS5471EData/IncomeAndWarProfitsTaxesPaid) &gt; 6)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471, Schedule E - Income, War Profits, and Excess Profits Taxes Paid or Accrued (See page 5 of the instructions.):</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width: 90mm; text-align: center; font-size: 7pt;" rowspan="2">
										<br/>
										<b>(a)</b>
										<br/>Name of country or U.S. possession</th>
									<th class="styDepTblCell" style="font-size: 7pt; width: 96mm; text-align: center; border-right-width: 0px" colspan="3">
										<b>Amount of Tax</b>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width: 34mm; text-align: center; font-size: 7pt;">
										<b>(b)</b>
										<br/> In foreign currency</th>
									<th class="styDepTblCell" style="width: 30mm; text-align: center; border-right-width:1px; font-size: 7pt;">
										<b>(c)</b>
										<br/>Conversion rate</th>
									<th class="styDepTblCell" style="width: 32mm; text-align: center; border-right-width:0px; font-size: 7pt;">
										<b>(d)</b>
										<br/>In U.S. dollars</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<tr class="styDepTblRow1">
									<td class="styTableCell" style="width: 90mm; font-size: 7pt; text-align: left">
										<span style="width: 2px"/>
										<b>1</b>
										<span style="width: 6px"/>U.S.<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 34mm; font-size: 7pt; text-align: right; background-color: lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 30mm; font-size: 7pt; text-align: right; background-color: lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 32mm; font-size: 7pt; text-align: right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS5471EData/USIncomeAndProfitsTaxes"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<xsl:for-each select="$IRS5471EData/IncomeAndWarProfitsTaxesPaid">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width: 90mm; font-size: 7pt; text-align: left">
											<span style="width: 2px"/>
											<span class="styBoldText">
												<xsl:number value="position() + 1"/>
											</span>
											<span style="width: 2px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfCountryOrUSPosession"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 34mm; font-size: 7pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmountOfTaxInForeignCurrency"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 30mm; font-size: 7pt; text-align: right; border-right-width: 1px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AmountOfTaxConversionRate"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 32mm; font-size: 7pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmountOfTaxInUSDollars"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS5471TableLastCol" id="PAspcr"/>
									</tr>
								</xsl:for-each>
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" colspan="3" style="text-align: left">
										<xsl:value-of select="count($IRS5471EData/IncomeAndWarProfitsTaxesPaid)  + 2"/>
										<span style="width:5px"/>Total
	  			<b>
											<span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.		    
				</b>
										<img class="styIRS5471Img" style="border-right-width: 0px; width: 2mm; height: 2mm; float: none" src="{$ImagePath}/5471_Bullet_Line.gif" alt="bullet"/>
									</td>
									<td class="styDepTblCell" style="border-color: black; text-align: right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS5471EData/TotalIncomeAndWarProfitsTaxes"/>
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
					</xsl:if>
					<!-- /Separated data table for Schedule E -->
					<!-- Additional Data Table for Separated Repeating Data from Schedule I -->
					<xsl:if test="($Print = $Separated) and (count($IRS5471IData/IRS5471ScheduleI) &gt; 1) ">
						<span class="styRepeatingDataTitle">
							<br/>Form 5471, Schedule I - Summary of Shareholder's Income From Foreign Corporation:
            </span>
						<xsl:for-each select="$IRS5471IData">
							<table class="styDepTbl" style="font-size:7pt">
								<tbody>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">1</div>
                      Subpart F income (line 38b, Worksheet A in the instructions)    
                      <span style="letter-spacing:3mm;font-weight:bold">..............</span>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">1</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SubpartFIncome"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">2</div>
                      Earnings invested in U.S. property (line 17, Worksheet B in the instructions    
                      <span style="letter-spacing:3mm;font-weight:bold">.........</span>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">2</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EarningsInvestedInUSProperty"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">3</div>
                      Previously excluded subpart F income withdrawn from qualified investments (line 6b, Worksheet C<br/>
                      in the instructions)    
                      <span style="letter-spacing:3mm;font-weight:bold">............................</span>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">3</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PrevExcludedSubpartFIncome"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">4</div>
                      Previously excluded export trade income withdrawn from investment in export trade assets (line 7b,<br/>
                      Worksheet D in the instructions)
                    <span style="letter-spacing:3mm;font-weight:bold">.......................</span>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">4</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="WithdrawnExportTradeIncome"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">5</div>
                      Factoring income     
                      <span style="letter-spacing:3mm;font-weight:bold">............................</span>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">5</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FactoringIncome"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">6</div>
                      Total of lines 1 through 5. Enter here and on your income tax return. See instructions     
                      <span style="letter-spacing:3mm;font-weight:bold">......</span>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">6</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="WthdrwPropAndFactoringIncome"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
											<div class="styLNLeftNumBox" style="text-align:left">7</div>
                      Dividends received (translated at spot rate on payment date under section 989(b)(1))
                      <span style="letter-spacing:3mm;font-weight:bold">......</span>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;vertical-align:bottom;width:5mm">7</td>
										<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsReceived"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
											<div class="styLNLeftNumBox" style="text-align:left">8</div>
                      Exchange gain or (loss) on a distribution of previously taxed income 
                      <span style="letter-spacing:3mm;font-weight:bold">............</span>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;vertical-align:bottom;width:5mm">8</td>
										<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExchangeGainOnDistribution"/>
											</xsl:call-template>
										</td>
									</tr>
									<div class="styGenericDiv" style="width: 187mm">
										<span class="styLNDesc" style="font-size: 8pt; width: 186mm">
											<span style="float: right; clear: none">
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
													</xsl:call-template>
													<b>No</b>
												</label>
												<span style="width: 2mm"/>
											</span>
											<span style="float: right; clear: none">
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
													</xsl:call-template>
													<b>Yes </b>
												</label>
												<span style="width: 1.42mm"/>
											</span>
										</span>
									</div>
									<!--   BEGIN LINE 1   -->
									<div class="styGenericDiv" style="width: 187mm;padding-top:1mm;">
										<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
										<span class="styLNDesc" style="width: 169mm; margin-left: 1mm">Was any income of the foreign corporation blocked?
    <b>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
												</xsl:call-template>
												<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
										</span>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
												</xsl:call-template>
											</input>
										</span>
										<span class="styNBSP" style="width: 10px"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
												</xsl:call-template>
											</input>
										</span>
									</div>
									<!--   END LINE 1   -->
									<div class="styGenericDiv" style="width: 187mm">
										<span class="styLNDesc" style="font-size: 8pt; width: 186mm">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
												</xsl:call-template>
											</label>
											<span style="width: 2mm"/>
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
												</xsl:call-template>
											</label>
										</span>
									</div>
									<!--   BEGIN LINE 2   -->
									<div class="styGenericDiv" style="width: 187mm">
										<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
										<span class="styLNDesc" style="width: 169mm; margin-left: 1mm">Did any such income become unblocked during the tax year (see section 964(b))?
    <b>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
												</xsl:call-template>
												<span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
      <span class="styNBSP"/>.
    </b>
										</span>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
												</xsl:call-template>
											</input>
										</span>
										<span class="styNBSP" style="width: 10px"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="IncomeBecomeUnblockedThisTY"/>
												</xsl:call-template>
											</input>
										</span>
									</div>
									<div class="styGenericDiv" style="width: 187mm">
										<span class="styLNDesc" style="width: 160mm;">If the answer to either question is "Yes," attach an explanation.</span>
									</div>
									<!--   END LINE 2   -->
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:if>
					<!-- End Schedule I Separated Data -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
