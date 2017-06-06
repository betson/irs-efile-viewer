<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS990PFStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS990PF"/>
	<xsl:template name="PopulateAdditionalRows">
		<xsl:param name="RowCounter"/>
		<xsl:if test="$RowCounter &lt;25">
			<tr>
				<td class="styTableCell" style="text-align:left; width: 15mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 173mm">
					<xsl:if test="($Print=$Separated) and (count($FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps) &gt;24) and ($RowCounter=1)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps/RelationshipStatement"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="PopulateAdditionalRows">
				<xsl:with-param name="RowCounter" select="$RowCounter + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PopulateAdditionalRows2">
		<xsl:param name="RowCounter"/>
		<xsl:if test="$RowCounter &lt;17">
			<tr>
				<td class="styTableCell" style="text-align:left; width: 15mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="text-align:left; width: 32mm; font-size: 6pt">
					<xsl:if test="($Print=$Separated) and (count($FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule) &gt;16) and $RowCounter=1">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule/AmountInvolved"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="text-align:left; width: 55mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="text-align:left; width: 85mm; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="PopulateAdditionalRows2">
				<xsl:with-param name="RowCounter" select="$RowCounter + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PopulateAdditionalRows3">
		<xsl:param name="RowCounter"/>
		<xsl:if test="$RowCounter &lt;6">
			<tr>
				<td class="styTableCell" style="text-align:left; width: 70mm">
					<xsl:if test="($Print=$Separated) and (count($FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule) &gt;5) and ($RowCounter=1)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule/NameOfOrganization/BusinessNameLine1"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="text-align:left; width: 47mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="text-align:left; width: 70mm; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="PopulateAdditionalRows3">
				<xsl:with-param name="RowCounter" select="$RowCounter + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsLine1">
		<xsl:param name="RowCount"/>
		<xsl:if test="$RowCount &lt;4">
			<tr>
				<td class="styLNAmountBox" style="width: 53mm; border-left-width: 0px; text-align:left">
					<xsl:if test="$RowCount=0 and $Print=$Separated">
						<xsl:if test="$FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee/PersonName != ''">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee/PersonName"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee/BusinessName != ''">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee/BusinessName"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="width: 38mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="border-right-width:0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<tr>
				<td class="styLNAmountBox" style="width: 53mm; border-left-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsLine1">
				<xsl:with-param name="RowCount" select="$RowCount + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsLine2">
		<xsl:param name="RowCount"/>
		<xsl:if test="$RowCount &lt;5">
			<tr>
				<td class="styLNAmountBox" style="width: 59mm; border-left-width: 0px; text-align: left">
					<xsl:if test="$RowCount = 0">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/CompOfHighestPaidEmplNONE"/>
						</xsl:call-template>
					</xsl:if>
					<span style="width: 1px"/>
				</td>
				<td class="styLNAmountBox" rowspan="2">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="border-right-width:0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<tr>
				<td class="styLNAmountBox" style="width: 59mm; border-left-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsLine2">
				<xsl:with-param name="RowCount" select="$RowCount + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsLine3">
		<xsl:param name="RowCount"/>
		<xsl:if test="$RowCount &lt;5">
			<tr>
				<td class="styLNAmountBox" style="text-align: left; width: 91mm; border-left-width: 0px">
					<xsl:if test="$RowCount = 0">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/CompOfHghstPaidCntrctNONE"/>
						</xsl:call-template>
					</xsl:if>
					<span style="width: 1px"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="width: 64mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="border-right-width:0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<tr>
				<td class="styLNAmountBox" style="width: 91mm; border-left-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsLine3">
				<xsl:with-param name="RowCount" select="$RowCount + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AdditionalRowsCapitalGains1">
		<xsl:param name="RowCount"/>
		<xsl:if test="$RowCount &lt; 6">
			<tr>
				<td class="styLNLeftLtrBox">
					<xsl:if test="(count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo)=0) or ((count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt;5) and ($Print = $Separated))">
						<xsl:if test="$RowCount = 1">
							<xsl:attribute name="style">width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm</xsl:attribute>
              1a
             </xsl:if>
						<xsl:if test="($RowCount != 1) and ($Print != $Separated)">
							<xsl:attribute name="style">width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 7mm</xsl:attribute>
							<xsl:call-template name="GenerateLetter2">
								<xsl:with-param name="RowCount" select="$RowCount"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
					<xsl:if test="count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo)!=0 and $RowCount != 1">
						<xsl:attribute name="style">border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm</xsl:attribute>
						<xsl:call-template name="GenerateLetter2">
							<xsl:with-param name="RowCount" select="$RowCount"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styTableCell" style="width: 105mm;text-align: left">
					<xsl:if test="($RowCount = 1) and (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt;5) and ($Print = $Separated)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 24mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 25mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 25mm; border-right-width:0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:if test="$RowCount=0">
				<xsl:call-template name="AdditionalRowsCapitalGains1">
					<xsl:with-param name="RowCount" select="$RowCount + 2"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="$RowCount!= 0">
				<xsl:call-template name="AdditionalRowsCapitalGains1">
					<xsl:with-param name="RowCount" select="$RowCount + 1"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AdditionalRowsCapitalGains2">
		<xsl:param name="RowCount"/>
		<xsl:if test="$RowCount &lt;6">
			<tr>
				<td class="styLNLeftLtrBox" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
					<xsl:call-template name="GenerateLetter2">
						<xsl:with-param name="RowCount" select="$RowCount"/>
					</xsl:call-template>
				</td>
				<td class="styTableCell" style="width: 39mm; text-align: left">
					<xsl:if test="($RowCount = 1) and (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt;5) and ($Print = $Separated)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 45mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 45mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 50mm; border-right-width:0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AdditionalRowsCapitalGains2">
				<xsl:with-param name="RowCount" select="$RowCount + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="GenerateLetter">
		<xsl:if test="position()=1">a</xsl:if>
		<xsl:if test="position()=2">b</xsl:if>
		<xsl:if test="position()=3">c</xsl:if>
		<xsl:if test="position()=4">d</xsl:if>
		<xsl:if test="position()=5">e</xsl:if>
		<xsl:if test="position() &gt;5">
			<span style="width: 1.5mm"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="GenerateLetter2">
		<xsl:param name="RowCount"/>
		<xsl:if test="$RowCount=1">a</xsl:if>
		<xsl:if test="$RowCount=2">b</xsl:if>
		<xsl:if test="$RowCount=3">c</xsl:if>
		<xsl:if test="$RowCount=4">d</xsl:if>
		<xsl:if test="$RowCount=5">e</xsl:if>
		<xsl:if test="$RowCount=6">f</xsl:if>
	</xsl:template>
	<xsl:template name="GenerateLetter3">
		<xsl:if test="position()=1">a</xsl:if>
		<xsl:if test="position()=2">b</xsl:if>
		<xsl:if test="position()=3">c</xsl:if>
		<xsl:if test="position()=4">d</xsl:if>
		<xsl:if test="position()=5">e</xsl:if>
		<xsl:if test="position()=6">f</xsl:if>
		<xsl:if test="position() &gt;6">
			<span style="width: 1.5mm"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RowsAtoF">
		<xsl:param name="RowCount"/>
		<xsl:param name="Letters"/>
		<xsl:if test="$RowCount &lt;$Letters">
			<tr>
				<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 71mm">
					<span class="styBoldText" style="padding-left: 4.5mm">
						<xsl:call-template name="GenerateLetter2">
							<xsl:with-param name="RowCount" select="$RowCount"/>
						</xsl:call-template>
					</span>
					<span style="width: 1mm"/>
					<span class="styIRS990PFUnderlinedText" style="width: 52mm">
						<xsl:if test="($RowCount = 1) and (count($FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII) != 0) and ($Print = $Separated)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</td>
				<td class="styTableCellSmall" style="width: 20mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCellSmall" style="width: 25mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCellSmall" style="width: 25mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCellSmall" style="width: 25mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCellSmall" style="border-right-width:0px; width: 25mm">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="RowsAtoF">
				<xsl:with-param name="RowCount" select="$RowCount + 1"/>
				<xsl:with-param name="Letters" select="$Letters"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 990-PF"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS990PFStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS990PF">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeader"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:187mm; height:20mm;">
						<div class="styFNBox" style="width:33mm;height:20mm">
							<div style="padding-top:1mm;">
      Form<span class="styFormNumber">990-PF</span>
								<br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</div>
							<br/>
							<div>
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:124mm;height:20mm;padding-top: 1.5mm">
							<div class="styMainTitle">Return of Private Foundation</div>
							<div class="styFBT" style="font-size: 8pt; margin-top: 0px">or Section 4947(a)(1) Nonexempt Charitable Trust<br/>Treated as a Private Foundation</div>
							<div class="styFBT" style="font-size: 7pt; font-weight: normal; margin-top: 0px; padding-top: 1mm">
								<span class="styBoldText">Note. </span>
								<span style="font-size: 6pt">The foundation may be able to use a copy of this return to satisfy state reporting requirements.</span>
								<!--								<span class="styItalicText" style="font-size: 6pt">The foundation may be able to use a copy of this return to satisfy state reporting requirements.</span> -->
							</div>
						</div>
						<div class="styTYBox" style="width:29mm;height:22mm;">
							<!-- changed height to 22 from 20 -->
							<div class="styOMB" style="height:5mm;font-size: 7pt">OMB No. 1545-0052</div>
							<div class="styTaxYear" style="padding-top: 1.5mm">
      20<span class="styTYColor">10</span>
							</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<div class="styComType" style="width:187mm; font-size: 8pt; padding-top: 1.5mm; padding-bottom:1.5mm">
						<div class="styBoldText" style="height:3mm;width:182mm;">
      For calendar year 2010, or tax year beginning
<!--      <xsl:call-template name="PopulateReturnHeaderTaxYear"/> -->
							<span style="width: 25mm">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
							</span> , and ending 
        <span style="width: 25mm">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
							</span>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;">
						<div style="float:left;clear:left;">
							<div class="styComType" style="font-size: 7pt; border-bottom-width: 0px">
								<div class="styBoldText" style="height:3mm;width:3mm;float:left;clear:none;font-size: 7pt; padding-top: 1mm">G</div>
								<div class="styNormalText" style="height:3mm; padding-top: .5mm; float: left; clear: none">
									<span style="padding-right: 6mm">Check all that apply:</span>
									<span style="width:30mm;">
										<input type="checkbox" class="styIRS990PFCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/InitialReturn"/>
												<xsl:with-param name="BackupName">IRS990PFInitialReturn</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/InitialReturn"/>
												<xsl:with-param name="BackupName">IRS990PFInitialReturn</xsl:with-param>
											</xsl:call-template>Initial return</label>
									</span>
									<span style="width:60mm;">
										<input type="checkbox" class="styIRS990PFCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/InitialReturnFormerPublicChrty"/>
												<xsl:with-param name="BackupName">IRS990PFInitialReturnFormerPublicChrty</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/InitialReturnFormerPublicChrty"/>
												<xsl:with-param name="BackupName">IRS990PFInitialReturnFormerPublicChrty</xsl:with-param>
											</xsl:call-template>Initial return of a former public charity</label>
									</span>
									<!--			<span style="width:60mm;">
										<input type="checkbox" class="styIRS990PFCkBox" TabIndex="-1" id="InitialReturnFPC" onclick="return false;"/>
										<label for="InitialReturnFPC">Initial return of a former public charity</label>
									</span>  -->
									<!--             <span style="width:30mm;">
                <input type="checkbox" class="styIRS990PFCkBox" TabIndex="-1" id="FinalReturn" onclick="return false;"></input>
                <label for="FinalReturn">Final return</label>
              </span>
 *** Enabled Final Return Box on 01/09/07             
 -->
									<span style="width:30mm;">
										<input type="checkbox" class="styIRS990PFCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/FinalReturn"/>
												<xsl:with-param name="BackupName">IRS990PFFinalReturn</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/FinalReturn"/>
												<xsl:with-param name="BackupName">IRS990PFFinalReturn</xsl:with-param>
											</xsl:call-template>Final return</label>
									</span>
									<span style="width:25mm;"/>
								</div>
							</div>
						</div>
						<div class="styComType" style="font-size: 7pt; border-bottom-width: 0px">
							<div class="styNormalText" style="height:3mm; padding-top: .5mm; float: right; clear: none">
								<!--              <span style="width:30mm;">
                <input type="checkbox" class="styIRS990PFCkBox" TabIndex="-1" id="AmendedReturn" onclick="return false;"></input>
                <label for="AmendedReturn">Amended return</label>
              </span>
*** Enabled Amended Return Box on 12/29/06              
-->
								<span style="width:30mm;">
									<input type="checkbox" class="styIRS990PFCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedReturn"/>
											<xsl:with-param name="BackupName">IRS990PFAmendedReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedReturn"/>
											<xsl:with-param name="BackupName">IRS990PFAmendedReturn</xsl:with-param>
										</xsl:call-template>Amended return</label>
								</span>
								<span style="width:37mm;">
									<input type="checkbox" class="styIRS990PFCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AddressChange"/>
											<xsl:with-param name="BackupName">IRS990PFAddressChange</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AddressChange"/>
											<xsl:with-param name="BackupName">IRS990PFAddressChange</xsl:with-param>
										</xsl:call-template>Address change</label>
								</span>
								<span style="width:30mm;">
									<input type="checkbox" class="styIRS990PFCkBox" TabIndex="-1" id="NameChange" onclick="return false;"/>
									<label for="NameChange">Name change</label>
								</span>
								<span style="width:54mm;"/>
							</div>
						</div>
						<div class="styLblNameAddr" style="width:122mm;height:28mm;border-left-width:0px;border-top-width:1px;border-right-width:1px;border-bottom-width:1px;">
							<!--							<div class="styUseLbl" style="width:20mm;height:30mm;text-align:center; font-size: 7pt">Use the IRS label.<br/>Otherwise,<br/>print<br/>or type.<br/>See Specific<br/>Instructions.</div>   -->
							<div class="styNameAddr" style="width:121.55mm;height:8mm;">
            Name of foundation<br/>
								<span class="stySmallText">
									<span style="width:8px"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span class="stySmallText">
									<span style="width:8px"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span class="stySmallText">
									<span style="width:8px"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
							</div>
							<div class="styNameAddr" style="width:121.55mm;height:10mm;">
								<span style="width: 89mm; height: 10mm">
									<span style="width: 89mm"> Number and street (or P.O. box number if mail is not delivered to street address)</span>
									<span class="stySmallText" style="width: 89mm">
										<span style="width:8px"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="stySmallText" style="width: 89mm">
										<span style="width:8px"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
										</xsl:call-template>
									</span>
								</span>
								<span style="border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; width: 8mm; height: 10mm">
									<span style="width: 8mm;padding-left:1mm;">Room/suite</span>
									<span style="width: 8mm"/>
									<span class="stySmallText" style="width:8mm"/>
								</span>
							</div>
							<div class="styNameAddr" style="border-bottom-width:0px;width:100mm;height:8.8mm;">
            City or town, state, and ZIP code<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Country</xsl:with-param>
									<xsl:with-param name="MainForm">true</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
						<div class="styEINDateAssets" style="width:65mm;height:9mm;border-top-width: 1px">
							<span class="styBoldText">A Employer identification number</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="EINChanged">true</xsl:with-param>
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINDateAssets" style="width:65mm;height:10mm;padding-top: 1mm">
							<span class="styBoldText">B </span> Telephone number (see page 10 of the instructions)<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Phone</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINDateAssets" style="width:65mm;height:5mm;border-bottom-width: 0px; padding-top: 2mm">
							<span class="styBoldText" style="float: left">C </span>
							<label for="Pending" style="float: left; clear:none; padding-left: 1mm">If exemption application is pending, check here </label>
							<span style="float: right">
								<!--          <span style="padding-right: 2mm"><img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/></span>
          <input type="checkbox" class="styCkBox" TabIndex="-1" id="Pending" onclick="return false;"></input>
          </span>
*** Enabled "Pending" Box on 02/13/08          
 -->
								<span style="padding-right: 2mm">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>
								<input type="checkbox" alt="alt" class="styCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Pending"/>
										<xsl:with-param name="BackupName">IRS990PFPending</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:65mm;height:5mm;border-bottom-width: 0px; padding-top: 1.5mm">
							<span class="styBoldText" style="float: left">D 1. </span>
							<label for="ForeignOrg" style="float: left; clear: none; padding-left: 1mm">Foreign organizations, check here . </label>
							<span style="float: right">
								<span style="padding-right: 2mm">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>
								<input type="checkbox" class="styCkBox" TabIndex="-1" id="ForeignOrg" onclick="return false;"/>
							</span>
						</div>
					</div>
					<!-- H section starts here.-->
					<div style="width: 187mm">
						<span style="width: 122mm; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px; float: left">
							<span class="styBoldText">H</span> Check type of organization: <span style="width: 2mm"/>
							<input type="checkbox" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ExemptPF"/>
									<xsl:with-param name="BackupName">IRS990PFExemptPF</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ExemptPF"/>
									<xsl:with-param name="BackupName">IRS990PFExemptPF</xsl:with-param>
								</xsl:call-template>Section 501(c)(3) exempt private foundation</label>
							<br/>
							<input type="checkbox" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/NECT"/>
									<xsl:with-param name="BackupName">IRS990PFNECT</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-right: 3mm">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/NECT"/>
									<xsl:with-param name="BackupName">IRS990PFNECT</xsl:with-param>
								</xsl:call-template>Section 4947(a)(1) nonexempt charitable trust</label>
							<input type="checkbox" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TaxablePF"/>
									<xsl:with-param name="BackupName">IRS990PFTaxablePF</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/TaxablePF"/>
									<xsl:with-param name="BackupName">IRS990PFTaxablePF</xsl:with-param>
								</xsl:call-template>Other taxable private foundation</label>
						</span>
						<span class="styEINDateAssets" style="width:65mm;height:5mm;border-bottom-width: 0px; float:right; padding-top: 1mm">
							<span class="styBoldText" style="float: left; padding-left: 3mm">  2. </span>
							<label for="85" style="float: left; clear: none; padding-left: 1mm">Foreign organizations meeting the 85% test, <br/>check here and attach computation </label>
							<span style="float: right; padding-top: 1mm">
								<span style="padding-right: 2mm">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>
								<input type="checkbox" class="styCkBox" TabIndex="-1" id="85" onclick="return false;"/>
							</span>
						</span>
					</div>
					<!-- I section starts here.-->
					<div style="width: 187mm; float:none; clear:none">
						<span style="width: 55mm; float: left; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px; padding-top:1mm; height: 12.5mm">
							<span class="styBoldText">I </span> 
    Fair market value of all assets at end<br/>
							<span style="width: 2mm"/>of year 
    <span class="styItalicText">(from Part II, col. (c),</span>
							<br/>
							<span style="width: 2mm"/>
							<span class="styItalicText">line 16)</span>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styBoldText">$</span>
							<span style="width: 2mm"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FMVAssetsEOY"/>
							</xsl:call-template>
						</span>
						<span style="width: 67mm; float: left; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px; height: 12.5mm; padding-left: 2mm">
							<span class="styBoldText">J </span> Accounting method: <span style="width: 2mm"/>
							<input type="checkbox" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingCash"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-right: 3mm">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingCash"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template> Cash</label>
							<input type="checkbox" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingAccrual"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-right: 3mm">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingAccrual"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template> Accrual</label>
							<br/>
							<span style="width: 2mm"/>
							<input type="checkbox" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOther"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-right: 3mm">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOther"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingOther</xsl:with-param>
								</xsl:call-template> Other (specify)</label>
							<span class="styUnderlinedText">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOther/@note"/>
								</xsl:call-template>
							</span>
							<br/>
							<span class="styItalicText">(Part I, column (d) must be on cash basis.)</span>
						</span>
						<!-- I section ends here.-->
						<div class="styEINDateAssets" style="width:65mm;height:5mm;border-bottom-width: 0px; float: right; clear: both">
							<span class="styBoldText" style="float: left">E </span>
							<label for="507" style="float: left; clear: none; padding-left: 2mm">If private foundation status was terminated<br/>under section 507(b)(1)(A), check here </label>
							<span style="float: right; padding-top: 2mm">
								<!--      <span style="padding-right: 2mm"><img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/></span>          
      <input type="checkbox" class="styCkBox" TabIndex="-1" id="507" onclick="return false;"></input>
    </span>
*** Enabled "PFStatusTerminatedSect507b1A" Box on 02/13/08    
-->
								<span style="padding-right: 2mm">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>
								<input type="checkbox" alt="alt" class="styCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PFStatusTerminatedSect507b1A"/>
										<xsl:with-param name="BackupName">IRS990PFPFStatusTerminatedSect507b1A</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:65mm;height:5mm; padding-top: 1.5mm; float: right; clear:both">
							<span class="styBoldText" style="float: left">F </span>
							<label for="60" style="float: left; clear: none; padding-left: 2mm">If the foundation is in a 60-month termination<br/>under section 507(b)(1)(B), check here </label>
							<span style="float: right; padding-top:2mm">
								<span>
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox" TabIndex="-1" id="60" onclick="return false;"/>
							</span>
						</div>
					</div>
					<!-- BEGIN Part I -->
					<table class="styTable" style="font-size: 7pt; border-color:black; width: 187mm" cellspacing="0">
						<thead style="font-size: 6pt">
							<tr scope="col">
								<th scope="col" class="styTableCellHeader" colspan="2" style="height: 4mm; width: 12mm; border-bottom-width: 0px; border-right-width: 0px">
									<span class="styPartName" style="width: 12mm">Part I</span>
								</th>
								<th scope="col" class="styTableCellHeader" valign="top" rowspan="3" colspan="2" style="height: 4mm; width: 71mm; text-align: left">
									<span class="styPartDesc" style="width: 71mm; font-size: 8pt">
          Analysis of Revenue and Expenses
          <span class="styNormalText" style="font-size: 6pt">
											<span class="styItalicText">(The total of amounts in columns (b), (c), and (d) may not necessarily equal the amounts in column (a) (see page 11 of the instructions).)</span>
										</span>
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" colspan="2" rowspan="3" style="height: 4mm; width: 29mm">(a)
        <span class="styNormalText">
          Revenue and<br/>expenses per<br/>books
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" rowspan="3" style="height: 4mm; width: 25mm">(b)
        <span class="styNormalText">
          Net investment<br/>income
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" rowspan="3" style="height: 4mm; width: 25mm">(c)
        <span class="styNormalText">
          Adjusted net<br/>income
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" rowspan="3" style="height: 4mm; width: 25mm; border-right-width: 0px">(d)
        <span class="styNormalText">
          Disbursements<br/>for charitable<br/>purposes<br/>(cash basis only)
        </span>
								</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCellHeader" colspan="2" style="height: 4mm; width: 12mm; border-bottom-width: 0px; border-right-width: 0px">
									<span class="styTableCellPad"/>
								</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 6mm;border-right-width: 0px;">
									<span class="styTableCellPad"/>
								</th>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 6mm; border-right-width: 0px">
									<span class="styTableCellPad"/>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<!-- Begin Part I Revenue Section -->
							<tr>
								<td class="styIRS990VTImageBox" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="16" valign="middle">
									<img src="{$ImagePath}/990PF_Revenue.gif" alt="Revenue"/>
								</td>
								<td class="styLNLeftNumBox" style="padding-left: 2mm; width: 4mm">1</td>
								<td class="styIRS990PFLNDesc" style="font-size: 6pt; padding-top: 1mm" colspan="2">Contributions, gifts, grants, etc., received (attach schedule)</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/ContriReceivedRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 2mm; width: 4mm">2</td>
								<td class="styIRS990PFLNDesc" style="font-size: 6pt; padding-top: 1mm" colspan="2"> Check <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
									<span style="width: 1mm"/>
									<input type="checkbox" class="styCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NotRequiredToAttachScheduleB"/>
											<xsl:with-param name="BackupName">IRS990PFNotRequiredToAttachScheduleB</xsl:with-param>
										</xsl:call-template>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NotRequiredToAttachScheduleB"/>
												<xsl:with-param name="BackupName">IRS990PFNotRequiredToAttachScheduleB</xsl:with-param>
											</xsl:call-template> if the foundation is <span class="styBoldText">not</span> required to attach Sch. B</label>
									</input>
								</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="border-left-width: 0px; border-bottom-width: 1px; width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-left-width: 0px; border-bottom-width: 1px">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-left-width: 0px; border-bottom-width: 1px">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 2mm; width: 4mm">3</td>
								<td class="styIRS990PFLNDesc" colspan="2">Interest on savings and temporary cash investments</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestOnSavingsRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestOnSavingsNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestOnSavingsAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 2mm; width: 4mm">4</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Dividends and interest from securities</span>
									<span class="styDotLn" style="float:right">......</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DividendsRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DividendsNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DividendsAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 2mm; width: 4mm">5a</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Gross rents</span>
									<span class="styDotLn" style="float:right">..............</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossRentsRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossRentsNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossRentsAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 3.5mm; width: 4mm">b</td>
								<td class="styIRS990PFLNDesc" colspan="2">Net rental income or (loss)
        <span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NetRentalIncomeOrLoss"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS990PFShadingCell" style="width: 29mm" colspan="2">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 2mm; width: 4mm">6a</td>
								<td class="styIRS990PFLNDesc" colspan="2">Net gain or (loss) from sale of assets not on line 10         </td>
								<td class="styIRS990PFFormLinkBox">
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NetGainSaleAssetsRevAndExpnss"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NetGainSaleAssetsRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 3.5mm; width: 4mm">b</td>
								<td class="styIRS990PFLNDesc" colspan="2" style="font-size: 6pt; padding-top: 1mm">Gross sales price for all assets on line 6a
        <span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossSalesPrice"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 2mm; width: 4mm">7</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float:left; clear:none">Capital gain net income (from Part IV, line 2)</span>
									<span class="styDotLn" style="float:right">...</span>
								</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CapitalGainNetIncmNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 2mm; width: 4mm">8</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float:left; clear:none">Net short-term capital gain</span>
									<span class="styDotLn" style="float:right">.........</span>
								</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="height:4.5mm; border-right-width:1px; border-left-width: 0px; width: 24mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NetSTCGAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px; width: 24mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 2mm; width: 4mm">9</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float:left; clear:none">Income modifications</span>
									<span class="styDotLn" style="float:right">...........</span>
								</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/IncomeModificationsAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: .5mm; width: 4mm">10a</td>
								<td class="styIRS990PFLNDesc" style="padding-top: 1mm; font-size: 6pt; width: 48mm">Gross sales less returns and allowances</td>
								<td class="styLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px; width: 23mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossSalesLessReturnsAndAllwnc"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 4mm">b</td>
								<td class="styIRS990PFLNDesc" style="width: 48mm">
									<span style="float:left; clear:none">Less: Cost of goods sold</span>
									<span class="styDotLn" style="float:right">....</span>
								</td>
								<td class="styLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px; width: 23mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CostOfGoodsSold"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 4mm">c</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float:left; clear:none">Gross profit or (loss) (attach schedule)</span>
									<span class="styDotLn" style="float:right">.....</span>
								</td>
								<td class="styIRS990PFFormLinkBox">
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossProfitRevAndExpnss"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossProfitRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossProfitAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: .5px; width: 4mm">11</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float:left; clear:none">Other income (attach schedule)</span>
									<span class="styDotLn" style="float:right">.......</span>
								</td>
								<td class="styIRS990PFFormLinkBox">
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherIncomeRevAndExpnss"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherIncomeRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherIncomeNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherIncomeAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: .5px; width: 4mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">12</td>
								<td class="styIRS990PFLNDesc" colspan="2" style="border-bottom-width: 1px">
									<span style="float:left; clear:none">
										<span class="styBoldText">Total. </span> Add lines 1 through 11</span>
									<span class="styDotLn" style="float:right">........</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalRevenueAndExpenses"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalNetInvestmentIncome"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalAdjustedNetIncome"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!-- lines 13 through 26 -->
							<tr>
								<td class="styIRS990VTImageBox" style="width: 4mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="17" valign="middle">
									<img src="{$ImagePath}/990PF_OAE.gif" alt="Operating and Administrative Expenses"/>
								</td>
								<td class="styLNLeftNumBox" style="width: 4mm">13</td>
								<td class="styIRS990PFLNDesc" colspan="2">Compensation of officers, directors, trustees, etc.</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CompOfcrDirTrstRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CompOfcrDirTrstNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CompOfcrDirTrstAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CompOfcrDirTrstDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width: 4mm">14</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Other employee salaries and wages</span>
									<span class="styDotLn" style="float:right">......</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OthEmplSlrsWgsRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OthEmplSlrsWgsNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OthEmplSlrsWgsAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OthEmplSlrsWgsDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm">15</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Pension plans, employee benefits</span>
									<span class="styDotLn" style="float:right">.......</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PensionEmplBnftRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PensionEmplBnftNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PensionEmplBnftAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PensionEmplBnftDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm">16a</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Legal fees (attach schedule)</span>
									<span class="styDotLn" style="float:right">.........</span>
								</td>
								<td class="styIRS990PFFormLinkBox">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/LegalFeesRevAndExpnss"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/LegalFeesRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/LegalFeesNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/LegalFeesAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/LegalFeesDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm; padding-left: 4.5mm">b</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Accounting fees (attach schedule)</span>
									<span class="styDotLn" style="float:right">.......</span>
								</td>
								<td class="styIRS990PFFormLinkBox">
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AccountingFeesRevAndExpnss"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AccountingFeesRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AccountingFeesNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AccountingFeesAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AccountingFeesDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm; padding-left: 4.5mm">c</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Other professional fees (attach schedule)</span>
									<span class="styDotLn" style="float:right">....</span>
								</td>
								<td class="styIRS990PFFormLinkBox">
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherProfFeesRevAndExpnss"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherProfFeesRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherProfFeesNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherProfFeesAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherProfFeesDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm">17</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Interest</span>
									<span class="styDotLn" style="float:right">...............</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm">18</td>
								<!--      <td class="styIRS990PFLNDesc" colspan="2">
      <span style="float: left">Taxes (attach schedule) (see the instructions)</span><span class="styDotLn" style="float:right">...</span></td>  -->
								<td class="styIRS990PFLNDesc" style="font-size: 6pt; padding-top: 1mm" colspan="2">Taxes (attach schedule) (see page 14 of the instructions)</td>
								<td class="styIRS990PFFormLinkBox">
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TaxesRevAndExpnss"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TaxesRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TaxesNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TaxesAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TaxesDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm">19</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Depreciation (attach schedule) and depletion</span>
									<span class="styDotLn" style="float:right">...</span>
								</td>
								<td class="styIRS990PFFormLinkBox">
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DeprecAndDepletionRevAndExpnss"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DeprecAndDepletionRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DeprecAndDepletionNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DeprecAndDepletionAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm">20</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Occupancy</span>
									<span class="styDotLn" style="float:right">..............</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OccupancyRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OccupancyNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OccupancyAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OccupancyDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm">21</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Travel, conferences, and meetings</span>
									<span class="styDotLn" style="float:right">.......</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TravConfMeetingRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TravConfMeetingNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TravConfMeetingAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TravConfMeetingDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm">22</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Printing and publications</span>
									<span class="styDotLn" style="float:right">..........</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style=" border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PrintingAndPubRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PrintingAndPubNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PrintingAndPubAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PrintingAndPubDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm">23</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float: left">Other expenses (attach schedule)</span>
									<span class="styDotLn" style="float:right">.......</span>
								</td>
								<td class="styIRS990PFFormLinkBox">
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherExpensesRevAndExpnss"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherExpensesRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherExpensesNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherExpensesAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherExpensesDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width: 4mm">24</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span class="styBoldText">Total operating and administrative expenses.</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px; width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px; width: 24mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px; border-right-width:0px; border-bottom-width: 0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width: 4mm"/>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float:left; clear:none">Add lines 13 through 23</span>
									<span class="styDotLn" style="float:right">..........</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotOprExpensesRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotOprExpensesNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotOprExpensesAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px; border-right-width:0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotOprExpensesDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width: 4mm">25</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float:left; clear:none">Contributions, gifts, grants paid</span>
									<span class="styDotLn" style="float:right">........</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/ContriGiftsPaidRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="width: 24mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px; border-right-width:0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/ContriGiftsPaidDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="border-color: black; border-style: solid; border-left-width: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; width: 4mm">26</td>
								<td class="styIRS990PFLNDesc" colspan="2" style="border-bottom-width: 1px; font-size: 6pt; padding-top: 1mm">
									<span class="styBoldText">Total expenses and disbursements. </span> Add lines 24 and 25</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalExpensesRevAndExpnss"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalExpensesNetInvstIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalExpensesAdjNetIncm"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px; border-right-width:0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalExpensesDsbrsChrtblPrps"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  Lines 27, a, b, c  -->
							<tr>
								<td class="styIRS990VTImageBox" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="4">
									<span class="styTableCellPad"/>
								</td>
								<td class="styLNLeftNumBox" style="width: 4mm">27</td>
								<td class="styIRS990PFLNDesc" colspan="2" style="padding-top: .5mm">Subtract line 26 from line 12:</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="border-bottom-width: 0px; width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-bottom-width: 0px">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-bottom-width: 0px">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-bottom-width: 0px; height:4.5mm; border-left-width: 0px; border-right-width: 0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="width: 4mm">a</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span class="styBoldText">Excess of revenue over expenses and disbursements</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/ExcessOfRevenueOverExpenses"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:1px; border-left-width: 0px">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-left-width: 0px; border-right-width: 0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="width:4mm">b</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span class="styBoldText">Net investment income</span> (if negative, enter -0-)</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NetInvestmentIncome"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell" style="border-left-width: 0px; border-right-width: 0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width:4mm">c</td>
								<td class="styIRS990PFLNDesc" style="border-bottom-width: 1px" colspan="2">
									<span style="float:left; clear: none">
										<span class="styBoldText">Adjusted net income </span>(if negative, enter -0-)</span>
									<span class="styDotLn" style="float:right">...</span>
								</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AdjustedNetIncome"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-left-width: 0px; border-right-width: 0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- END Part I -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm; float: none; clear: none">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see page 30 of the instructions.</span>
						</div>
						<div style="float:right">
    Cat. No. 11289X 
    <span style="width:60px"/>
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->
					<div class="styTableContainer" style="border-top-width: 1px; border-bottom-width: 1px; width: 187mm; height: 100%">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead style="font-size: 6pt">
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" rowspan="2" colspan="2" style="height: 4mm; width: 12mm; border-right-width: 0px">
										<span class="styPartName" style="width: 12mm">Part II</span>
									</th>
									<th scope="col" class="styTableCellHeader" rowspan="2" style="text-align: left; width: 24mm; border-right-width: 0px">
										<span class="styPartDesc" style="font-size: 7pt; width: 24mm">
          Balance Sheets 
        </span>
									</th>
									<th scope="col" class="styTableCellHeader" rowspan="2" style="width: 70mm">
										<span class="styNormalText" style="font-size: 6pt; width: 70mm; text-align: left">Attached schedules and amounts in the description column<br/>should be for end-of-year amounts only. (See instructions.)</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 30mm">
										<span class="styNormalText">
          Beginning of year
        </span>
									</th>
									<th scope="col" class="styTableCellHeader" colspan="2" style="width: 60mm; border-right-width: 0px">
										<span class="styNormalText">
          End of year
        </span>
									</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCellHeader" style="width: 26mm">(a)
        <span class="styNormalText">
          Book Value
        </span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 26mm">(b)
        <span class="styNormalText">
          Book Value
        </span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 26mm; border-right-width: 0px">(c)
        <span class="styNormalText">
          Fair Market Value
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<!-- Begin Part II Assets Section -->
								<tr>
									<td class="styIRS990VTImageBox" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="26" valign="middle">
										<img src="{$ImagePath}/990PF_Assets.gif" alt="Assets"/>
									</td>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">1</td>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span style="float: left">Cash—non-interest-bearing</span>
										<span class="styDotLn" style="float:right">...............</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/CashBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/CashEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/CashEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">2</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Savings and temporary cash investments</span>
										<span class="styDotLn" style="float:right">..........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/SavingsAndTempCashInvstBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/SavingsAndTempCashInvstEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/SavingsAndTempCashInvstEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">3</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Accounts receivable <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AccountsReceivable"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Less: allowance for doubtful accounts <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AllwncForDbtflAcctAcctRcvbl"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AccountsReceivableBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AccountsReceivableEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AccountsReceivableEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">4</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Pledges receivable <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PledgesReceivable"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Less: allowance for doubtful accounts <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AllwncForDbtflAcctPledgesRcvbl"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PledgesReceivableBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PledgesReceivableEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PledgesReceivableEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">5</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Grants receivable</span>
										<span class="styDotLn" style="float:right">.................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/GrantsReceivableBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/GrantsReceivableEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/GrantsReceivableEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">6</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Receivables due from officers, directors, trustees, and other</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width: 4mm; padding-left: 3.5mm; "/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">disqualified persons (attach schedule) (see page 15 of the</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-bottom-width: 0px; border-left-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm; "/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">instructions)</span>
										<span class="styDotLn" style="float:right">....................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/ReceivablesFromOfficersBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/ReceivablesFromOfficersEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/ReceivablesFromOfficersEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/ReceivablesFromOfficersEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">7</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Other notes and loans receivable (attach schedule) <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherNotesAndLoansReceivable"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Less: allowance for doubtful accounts <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AllwncForDbtflAcctOtherRcvbl"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherNotesAndLoansRcvblBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherNotesAndLoansRcvblEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherNotesAndLoansRcvblEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherNotesAndLoansRcvblEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm; ">8</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Inventories for sale or use</span>
										<span class="styDotLn" style="float:right">...............</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InventoriesForSaleOrUseBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InventoriesForSaleOrUseEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InventoriesForSaleOrUseEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm; ">9</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Prepaid expenses and deferred charges</span>
										<span class="styDotLn" style="float:right">...........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PrepaidExpensesBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PrepaidExpensesEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PrepaidExpensesEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width: 4mm; padding-left: .5mm; ">10a</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Investments—U.S. and state government obligations (attach schedule)</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsGovtObligBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsGovtObligEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsGovtObligEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsGovtObligEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 4mm;">b</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Investments—corporate stock (attach schedule)</span>
										<span class="styDotLn" style="float:right">........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsCorpStockBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsCorpStockEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsCorpStockEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsCorpStockEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 4mm; ">c</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Investments—corporate bonds (attach schedule)</span>
										<span class="styDotLn" style="float:right">........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsCorpBondsBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsCorpBondsEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsCorpBondsEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsCorpBondsEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">11</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Investments—land, buildings, and equipment: basis <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 21mm; font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsLandEtcBasis"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Less: accumulated depreciation (attach schedule) <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 23mm; font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AccumDeprecInvestmentsLandEtc"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsLandEtcBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsLandEtcEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsLandEtcEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsLandEtcEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">12</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Investments—mortgage loans</span>
										<span class="styDotLn" style="float:right">..............</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsMortgageLoansBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsMortgageLoansEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsMortgageLoansEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">13</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Investments—other (attach schedule)</span>
										<span class="styDotLn" style="float:right">...........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsOtherBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsOtherEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsOtherEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/InvestmentsOtherEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">14</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Land, buildings, and equipment: basis <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/LandBuildingAndEquipmentBasis"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Less: accumulated depreciation (attach schedule) <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 21mm; font-size: 6pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AccumDeprecLandBldgAndEquip"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/LandBuildingAndEquipmentBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/LandBuildingAndEquipmentEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/LandBuildingAndEquipmentEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/LandBuildingAndEquipmentEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">15</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Other assets (describe <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 50mm"/>)
      </td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherAssetsBOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherAssetsBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherAssetsEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherAssetsEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherAssetsEOYFMV"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherAssetsEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">16</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span class="styBoldText">Total assets </span>(to be completed by all filers—see the</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width: 4mm; border-color: black; border-style:solid; border-top-width: 0px; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px">
										<span style="width: 1px"/>
									</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm; border-bottom-width: 1px">instructions. Also, see page 1, item I)</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TotalAssetsBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TotalAssetsEOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TotalAssetsEOYFMV"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--  Lines 17 through 23  -->
								<tr>
									<td class="styIRS990VTImageBox" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="7" valign="middle">
										<img src="{$ImagePath}/990PF_Liabilities.gif" alt="Liabilities"/>
									</td>
									<td class="styLNLeftNumBox" style="width: 4mm">17</td>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span style="float: left">Accounts payable and accrued expenses</span>
										<span class="styDotLn" style="float:right">..........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AccountsPayableBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/AccountsPayableEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">18</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Grants payable</span>
										<span class="styDotLn" style="float:right">...................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/GrantsPayableBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/GrantsPayableEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">19</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Deferred revenue</span>
										<span class="styDotLn" style="float:right">..................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/DeferredRevenueBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/DeferredRevenueEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">20</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Loans from officers, directors, trustees, and other disqualified persons</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/LoansFromOfficersBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/LoansFromOfficersEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/LoansFromOfficersEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">21</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Mortgages and other notes payable (attach schedule)</span>
										<span class="styDotLn" style="float:right">......</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/MortgagesAndNotesPayableBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/MortgagesAndNotesPayableEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/MortgagesAndNotesPayableEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">22</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Other liabilities (describe <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 50mm"/>)
      </td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherLiabilitiesBOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherLiabilitiesBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherLiabilitiesEOY"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OtherLiabilitiesEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; height: 8mm; padding-top: 4mm; border-color: black; border-style:solid; border-top-width: 0px; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px">23</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm; height: 8mm; padding-top: 4mm; border-bottom-width: 1px">
										<span style="float: left">
											<span class="styBoldText">Total liabilities </span>(add lines 17 through 22)</span>
										<span class="styDotLn" style="float:right">..........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; height: 8mm; padding-top: 4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TotalLiabilitiesBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; height: 8mm; padding-top: 4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TotalLiabilitiesEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; height: 8mm; padding-top: 4mm">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- Lines 24 through 31  -->
								<tr>
									<td class="styIRS990VTImageBox" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="14" valign="middle">
										<img src="{$ImagePath}/990PF_NAFB.gif" alt="Net Assets or Fund Balances"/>
									</td>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span class="styBoldText">
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OrgThatFollowSFAS117"/>
													<xsl:with-param name="BackupName">IRS990PFOrgThatFollowSFAS117</xsl:with-param>
												</xsl:call-template>Foundations that follow SFAS 117, check here</label>
										</span>
										<span style="width: 1.5mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 2.5mm"/>
										<input type="checkbox" class="styCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OrgThatFollowSFAS117"/>
												<xsl:with-param name="BackupName">IRS990PFOrgThatFollowSFAS117</xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; font-size: 6pt; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span class="styBoldText">and complete lines 24 through 26 and lines 30 and 31.</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">24</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Unrestricted</span>
										<span class="styDotLn" style="float:right">....................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/UnrestrictedBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/UnrestrictedEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">25</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Temporarily restricted</span>
										<span class="styDotLn" style="float:right">................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TemporarilyRestrictedBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TemporarilyRestrictedEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">26</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Permanently restricted</span>
										<span class="styDotLn" style="float:right">................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PermanentlyRestrictedBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PermanentlyRestrictedEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span class="styBoldText">
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OrgThatDoNotFollowSFAS117"/>
													<xsl:with-param name="BackupName">IRS990PFOrgThatDoNotFollowSFAS117</xsl:with-param>
												</xsl:call-template>Foundations that do not follow SFAS 117, check here</label>
										</span>
										<span style="width: 1.5mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 2.5mm"/>
										<input type="checkbox" class="styCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/OrgThatDoNotFollowSFAS117"/>
												<xsl:with-param name="BackupName">IRS990PFOrgThatDoNotFollowSFAS117</xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span class="styBoldText">and complete lines 27 through 31.</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">27</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Capital stock, trust principal, or current funds</span>
										<span class="styDotLn" style="float:right">.........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/CapitalStockBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/CapitalStockEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">28</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Paid-in or capital surplus, or land, bldg., and equipment fund</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PaidInOrCapitalSurplusBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/PaidInOrCapitalSurplusEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">29</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Retained earnings, accumulated income, endowment, or other funds</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/RetainedEarningsBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/RetainedEarningsEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">30</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span class="styBoldText">Total net assets or fund balances </span>(see page 17 of the</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">instructions)</span>
										<span class="styDotLn" style="float:right">....................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TotalNetAssetsBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TotalNetAssetsEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">31</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span class="styBoldText">Total liabilities and net assets/fund balances </span>(see page 17 of</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; border-color: black; border-style:solid; border-top-width: 0px; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px">
										<span style="width: 1px"/>
									</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm; border-bottom-width: 1px">
										<span style="float: left">the instructions)</span>
										<span class="styDotLn" style="float:right">..................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TotalLiabilitiesNetAssetsBOY"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BalanceSheets/TotalLiabilitiesNetAssetsEOY"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  Part III  -->
					<div class="styTableContainer" style="width: 187mm; height: 39.5mm">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" style="height: 8mm; border-right-width: 0px; width: 14mm">
										<span class="styPartName" style="width: 14mm; height: 4mm">Part III</span>
									</th>
									<th scope="col" class="styTableCellHeader" colspan="3" style="text-align: left; border-right-width: 0px; width: 160mm">
										<span class="styPartDesc" style="text-align: left; width: 160mm">
          Analysis of Changes in Net Assets or Fund Balances 
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styLNLeftNumBox">1</td>
									<td class="styLNDesc" style="width: 139mm">Total net assets or fund balances at beginning of year—Part II, column (a), line 30 (must agree</td>
									<td class="styLNRightNumBox" style="border-bottom-width: 0px">
										<span style="width: 1px"/>
									</td>
									<td class="styLNAmountBox" style="border-right-width:0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox"/>
									<td class="styLNDesc" style="width: 139mm">
										<span style="float: left">with end-of-year figure reported on prior year’s return)</span>
										<span class="styDotLn" style="float:right">...............</span>
									</td>
									<td class="styLNRightNumBox">1</td>
									<td class="styLNAmountBox" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChangesInNetAssetsFundBalances/TotalNetAssetsFundBalancesBOY"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox">2</td>
									<td class="styLNDesc" style="width: 139mm">
										<span style="float: left">Enter amount from Part I, line 27a</span>
										<span class="styDotLn" style="float:right">......................</span>
									</td>
									<td class="styLNRightNumBox">2</td>
									<td class="styLNAmountBox" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChangesInNetAssetsFundBalances/ExcessOfRevenueOverExpenses"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox">3</td>
									<td class="styLNDesc" style="width: 139mm">Other increases not included in line 2 (itemize)
        <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 62mm"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ChangesInNetAssetsFundBalances/OtherIncreases"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>
									</td>
									<td class="styLNRightNumBox">3</td>
									<td class="styLNAmountBox" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChangesInNetAssetsFundBalances/OtherIncreases"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox">4</td>
									<td class="styLNDesc" style="width: 139mm">
										<span style="float: left">Add lines 1, 2, and 3</span>
										<span class="styDotLn" style="float:right">..........................</span>
									</td>
									<td class="styLNRightNumBox">4</td>
									<td class="styLNAmountBox" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChangesInNetAssetsFundBalances/Subtotal"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox">5</td>
									<td class="styLNDesc" style="width: 139mm">Decreases not included in line 2 (itemize)
        <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 67mm"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ChangesInNetAssetsFundBalances/OtherDecreases"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>
									</td>
									<td class="styLNRightNumBox">5</td>
									<td class="styLNAmountBox" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChangesInNetAssetsFundBalances/OtherDecreases"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox">6</td>
									<td class="styLNDesc" style="width: 139mm">
										<span style="float: left">Total net assets or fund balances at end of year (line 4 minus line 5)—Part II, column (b), line 30</span>
										<span class="styDotLn" style="float:right">..</span>
									</td>
									<td class="styLNRightNumBox" style="border-bottom-width: 0px">6</td>
									<td class="styLNAmountBox" style="border-right-width:0px; border-bottom-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChangesInNetAssetsFundBalances/TotalNetAssetsFundBalancesEOY"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					<!--END HEADER-->
					<div style="width:187mm;border-top-width:1px" class="styBB">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="width: 160mm; padding-left:3mm;">
    Capital Gains and Losses for Tax on Investment Income 
  </div>
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select="'AthruDctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Part IV  -->
					<div class="styTableContainer" style="width:187mm;height:33mm" id="AthruDctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt;border-color:black;" cellspacing="0">
							<thead class="styTableThead">
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" style="width: 113mm" colspan="2">
          (a) <span class="styNormalText"> List and describe the kind(s) of property sold (e.g., real estate,<br/>2-story brick warehouse; or common stock, 200 shs. MLC Co.)</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="text-align: center; width: 24mm">
          (b) <span class="styNormalText">How acquired<br/>P—Purchase<br/>D—Donation</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 25mm">
          (c) <span class="styNormalText">Date acquired<br/>(mo., day, yr.)</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 25mm; border-right-width: 0px">
          (d) <span class="styNormalText">Date sold<br/>(mo., day, yr.)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &lt; 6)">
									<xsl:for-each select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo">
										<tr>
											<td class="styLNLeftNumBox" style="width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
												<xsl:if test="position()=1">
													<xsl:attribute name="style">width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 3mm</xsl:attribute>
                  1
                 </xsl:if>
												<xsl:call-template name="GenerateLetter"/>
											</td>
											<td class="styTableCell" style="width: 105mm; text-align: left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfAsset"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 24mm; text-align: center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="HowAcquired"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 25mm; text-align: center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DateAcquired"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 25mm; border-right-width:0px; text-align: center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DateSold"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="($Print = $Separated) and (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt; 5)">
										<xsl:call-template name="AdditionalRowsCapitalGains1">
											<xsl:with-param name="RowCount" select="1"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="AdditionalRowsCapitalGains1">
											<xsl:with-param name="RowCount" select="count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) +1"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'AthruDctn' "/>
					</xsl:call-template>
					<xsl:if test="(count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt; 5) and $Print=''">
						<div class="styGenericDiv" style="width:187mm;">
							<div style="float:right">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="containerID" select="'EthruHctn'"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<div class="styTableContainer" style="width:187mm;height:29.75mm;border-color:black;border-bottom-width:0px" id="EthruHctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" style="width: 39mm;padding-left: 2mm" colspan="2">
          (e) <span class="styNormalText">Gross sales price</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 45mm">
          (f) <span class="styNormalText">Depreciation allowed<br/>(or allowable)</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 45mm">
          (g) <span class="styNormalText">Cost or other basis<br/>plus expense of sale</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 50mm; border-right-width: 0px">
          (h) <span class="styNormalText">Gain or (loss)<br/>(e) plus (f) minus (g)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &lt;6)">
									<xsl:for-each select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo">
										<tr>
											<td class="styLNLeftLtrBox" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
												<xsl:if test="position()=1"/>
												<xsl:call-template name="GenerateLetter"/>
											</td>
											<td class="styTableCell" style="width: 39mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossSalesPrice"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 45mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Depreciation"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 45mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 50mm; border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainOrLoss"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="($Print = $Separated) and (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt; 5)">
										<xsl:call-template name="AdditionalRowsCapitalGains2">
											<xsl:with-param name="RowCount" select="1"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="AdditionalRowsCapitalGains2">
											<xsl:with-param name="RowCount" select="count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) + 1"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'EthruHctn' "/>
					</xsl:call-template>
					<xsl:if test="(count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt; 5) and $Print=''">
						<div class="styGenericDiv" style="width:187mm">
							<div style="float:right">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select="'IthruLctn'"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<div class="styTableContainer" style="border-bottom-width: 0px; width: 187mm; height: 33.5mm" id="IthruLctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" colspan="4" style="width: 137mm">
										<span class="styNormalText">Complete only for assets showing gain in column (h) and owned by the foundation on 12/31/69</span>
									</th>
									<th scope="col" class="styTableCellHeader" rowspan="2" style="width: 50mm; border-right-width: 0px">
        (l) <span class="styNormalText">Gains (Col. (h) gain minus<br/>col. (k), but not less than -0-) <span class="styBoldText">or</span>
											<br/>Losses (from col.(h))</span>
									</th>
								</tr>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" style="padding-left: 4mm; width: 39mm" colspan="2">
        (i) <span class="styNormalText">F.M.V. as of 12/31/69</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 45mm">
        (j) <span class="styNormalText">Adjusted basis<br/>as of 12/31/69</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 45mm">
        (k) <span class="styNormalText">Excess of col. (i)<br/>over col. (j), if any</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &lt;6)">
									<xsl:for-each select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo">
										<tr>
											<td class="styLNLeftLtrBox" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
												<xsl:if test="position()=1"/>
												<xsl:call-template name="GenerateLetter"/>
											</td>
											<td class="styTableCell" style="width: 39mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FMVAsOf123169"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 45mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AdjustedBasisAsOf123169"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 45mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExcessOfFMVOverAdjustedBasis"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 50mm; border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainsMinusExcessOrLosses"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="($Print = $Separated) and (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt; 5)">
										<xsl:call-template name="AdditionalRowsCapitalGains2">
											<xsl:with-param name="RowCount" select="1"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="AdditionalRowsCapitalGains2">
											<xsl:with-param name="RowCount" select="count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) + 1"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'IthruLctn' "/>
					</xsl:call-template>
					<div class="styTableContainer" style="border-bottom-width: 0px; width: 187mm; height: 23mm">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styLNLeftNumBox" valign="middle" style="padding-left: 5mm">2</td>
									<td class="styTableCell" valign="middle" style="text-align: left; width: 74.25mm; border-bottom-width: 0px; border-right-width: 0px">Capital gain net income or (net capital loss)</td>
									<td class="styTableCell" style="width: 4mm; border-bottom-width: 0px; border-right-width: 0px; text-align: left">
										<img src="{$ImagePath}/990PF_Left_Bracket_Small.gif" alt="Bracket"/>
									</td>
									<td class="styTableCell" style="width: 47.75mm; border-bottom-width: 0px; border-right-width: 0px; text-align: left">If gain, also enter in Part I, line 7<br/>If (loss), enter -0- in Part I, line 7</td>
									<td class="styTableCell" style="width: 4mm; border-right-width:0px; border-bottom-width: 0px; text-align: left">
										<img src="{$ImagePath}/990PF_Bracket_Small.gif" alt="Bracket"/>
									</td>
									<td class="styLNRightNumBox" style="width: 8mm">2</td>
									<td class="styLNAmountBox" style="width: 41mm; padding-top: 5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainNetIncome"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" valign="middle" style="padding-left: 5mm">3</td>
									<td class="styTableCell" colspan="4" style="text-align: left; width: 124.25mm; border-bottom-width: 0px; border-right-width: 0px">Net short-term capital gain or (loss) as defined in sections 1222(5) and (6):</td>
									<td class="styLNRightNumBox" style="width: 8mm; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBox" style="width: 41mm; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" valign="middle" style="padding-left: 5mm"/>
									<td class="styTableCell" colspan="3" style="text-align: left; width: 124.25mm; border-bottom-width: 0px; border-right-width: 0px; padding-top: 1mm">
        If gain, also enter in Part I, line 8, column (c) (see pages 13 and 17 of the instructions).<br/>
        If (loss), enter -0- in Part I, line 8 
          <span style="font-weight: bold">
											<span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
          </span>
									</td>
									<td class="styTableCell" style="width: 4mm; border-right-width:0px; border-bottom-width: 0px">
										<img src="{$ImagePath}/990PF_Bracket_Small.gif" alt="Bracket"/>
									</td>
									<td class="styLNRightNumBox" style="width: 8mm; border-bottom-width: 0px">3</td>
									<td class="styLNAmountBox" style="width: 41mm; border-bottom-width: 0px; padding-top: 5.5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/NetShortTermCapitalGainOrLoss"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc" style="padding-left:3mm;">
    Qualification Under Section 4940(e) for Reduced Tax on Net Investment Income  
  </div>
					</div>
					<div class="GenericDiv" style="width: 187mm; padding-top: 1.5mm">(For optional use by domestic private foundations subject to the section 4940(a) tax on net investment income.)</div>
					<br/>
					<div class="GenericDiv" style="width: 187mm">If section 4940(d)(2) applies, leave this part blank.</div>
					<!--					<br/>   -->
					<div class="GenericDiv" style="width: 187mm">
    Was the foundation liable for the section 4942 tax on the distributable amount of any year in the base period?
  <span style="width: 39mm; padding-top:2mm; padding-left: 2mm; text-align:right">
							<input type="checkbox" class="styCkBox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/LiableFor4942Tax"/>
									<xsl:with-param name="BackupName">IRS990PFLiableFor4942Tax</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 1mm"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/LiableFor4942Tax"/>
									<xsl:with-param name="BackupName">IRS990PFLiableFor4942Tax</xsl:with-param>
								</xsl:call-template> Yes</label>
							<span style="width: 2mm"/>
							<input type="checkbox" class="styCkBox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/LiableFor4942Tax"/>
									<xsl:with-param name="BackupName">IRS990PFLiableFor4942Tax</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 1mm"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/LiableFor4942Tax"/>
									<xsl:with-param name="BackupName">IRS990PFLiableFor4942Tax</xsl:with-param>
								</xsl:call-template> No</label>
						</span>
					</div>
					<div class="GenericDiv" style="width: 187mm">If “Yes,” the foundation does not qualify under section 4940(e). Do not complete this part.</div>
					<!--div class="styTableContainer" style="border-top-width: 1px; width: 187mm; border-bottom-width: 0px; height: 32.75mm"-->
					<table class="styTable" style="font-size: 7pt; border-color:black;border-top: 1 solid black; width: 187mm;" cellspacing="0">
						<thead style="font-size: 6pt">
							<tr>
								<th scope="col" class="styTableCellHeader" colspan="4" style="font-size: 7pt; padding-left: 4mm; width:187mm; text-align: left; border-right-width: 0px;padding-top:1.5mm;padding-bottom:1.5mm;">1 <span class="styNormalText"> Enter the appropriate amount in each column for each year; see page 18 of the instructions before making any entries.</span>
								</th>
							</tr>
							<tr scope="col">
								<th scope="col" class="styTableCellHeader" style="width: 39mm">
        (a)<br/>
									<span class="styNormalText">Base period years Calendar<br/>year (or tax year beginning in)</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="width: 45mm">
        (b)<br/>
									<span class="styNormalText">Adjusted qualifying distributions</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="width: 45mm">
        (c)<br/>
									<span class="styNormalText">Net value of noncharitable-use assets</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="width: 50mm; border-right-width: 0px">
        (d)<br/>
									<span class="styNormalText">Distribution ratio<br/>(col. (b) divided by col. (c))</span>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<tr>
								<td class="styTableCell" style="width: 39mm; text-align: center">2009</td>
								<td class="styTableCell" style="width: 45mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/QualifyingDistributionsYear1"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width: 45mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/NoncharitableAssetsYear1"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width: 50mm; border-right-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/DistributionRatioYear1"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 39mm; text-align: center">2008</td>
								<td class="styTableCell" style="width: 45mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/QualifyingDistributionsYear2"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width: 45mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/NoncharitableAssetsYear2"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width: 50mm; border-right-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/DistributionRatioYear2"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 39mm; text-align: center">2007</td>
								<td class="styTableCell" style="width: 45mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/QualifyingDistributionsYear3"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width: 45mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/NoncharitableAssetsYear3"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width: 50mm; border-right-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/DistributionRatioYear3"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 39mm; text-align: center">2006</td>
								<td class="styTableCell" style="width: 45mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/QualifyingDistributionsYear4"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width: 45mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/NoncharitableAssetsYear4"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width: 50mm; border-right-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/DistributionRatioYear4"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 39mm; text-align: center">2005</td>
								<td class="styTableCell" style="width: 45mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/QualifyingDistributionsYear5"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width: 45mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/NoncharitableAssetsYear5"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width: 50mm; border-right-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/DistributionRatioYear5"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!--/div-->
					<table class="styTable" style="font-size: 7pt; width: 187mm" cellspacing="0">
						<thead/>
						<tfoot/>
						<tbody valign="top">
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 5mm; height: 8mm; padding-top:6mm">2</td>
								<td class="styTableCell" style="text-align: left; width: 126mm; border-bottom-width: 0px; border-right-width: 0px; height: 8mm; padding-top:6mm">
									<span style="float: left; clear:none">
										<span class="styBoldText">Total </span>of line 1, column (d) </span>
									<span class="styDotLn">......................</span>
								</td>
								<td class="styLNRightNumBox" style="width: 8mm; height: 8mm; padding-top:6mm">2</td>
								<td class="styLNAmountBox" style="width: 45mm; height: 8mm; padding-top:6mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/TotalDistributionRatio"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 5mm">3</td>
								<td class="styTableCell" style="text-align: left; width: 126mm; border-bottom-width: 0px; border-right-width: 0px">
									<span>Average distribution ratio for the 5-year base period—divide the total on line 2 by 5, or by<br/>the number of years the foundation has been in existence if less than 5 years</span>
									<span style="font-weight: bold">
										<span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
            <span style="width: 4mm"/>.
          </span>
								</td>
								<td class="styLNRightNumBox" style="width: 8mm">3</td>
								<td class="styLNAmountBox" style="width: 45mm; padding-top: 3mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/AverageDistributionRatio"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 5mm; height: 6mm; padding-top:4mm">4</td>
								<td class="styTableCell" style="text-align: left; width: 126mm; border-bottom-width: 0px; border-right-width: 0px; height: 6mm; padding-top:4mm">
									<span style="float: left; clear:none">Enter the net value of noncharitable-use assets for 2010 from Part X, line 5</span>
									<span class="styDotLn">.....</span>
								</td>
								<td class="styLNRightNumBox" style="width: 8mm; height: 6mm; padding-top:4mm">4</td>
								<td class="styLNAmountBox" style="width: 45mm; height: 6mm; padding-top:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/NetNoncharitableAssets"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 5mm; height: 6mm; padding-top:4mm">5</td>
								<td class="styTableCell" style="text-align: left; width: 126mm; border-bottom-width: 0px; border-right-width: 0px; height: 6mm; padding-top:4mm">
									<span style="float: left; clear:none">Multiply line 4 by line 3</span>
									<span class="styDotLn">.......................</span>
								</td>
								<td class="styLNRightNumBox" style="width: 8mm; height: 6mm; padding-top:6mm">5</td>
								<td class="styLNAmountBox" style="width: 45mm; height: 6mm; padding-top:6mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/AdjustedNoncharitableAssets"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 5mm; height: 6mm; padding-top:4mm">6</td>
								<td class="styTableCell" style="text-align: left; width: 126mm; border-bottom-width: 0px; border-right-width: 0px; height: 6mm; padding-top:4mm">
									<span style="float: left; clear:none">Enter 1% of net investment income (1% of Part I, line 27b)</span>
									<span class="styDotLn">...........</span>
								</td>
								<td class="styLNRightNumBox" style="width: 8mm; height: 6mm; padding-top:4mm">6</td>
								<td class="styLNAmountBox" style="width: 45mm; height: 6mm; padding-top:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/OnePercentNetInvestmentIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 5mm; height: 6mm; padding-top:4mm">7</td>
								<td class="styTableCell" style="text-align: left; width: 126mm; border-bottom-width: 0px; border-right-width: 0px; height: 6mm; padding-top:4mm">
									<span style="float: left; clear:none">Add lines 5 and 6</span>
									<span class="styDotLn">.........................</span>
								</td>
								<td class="styLNRightNumBox" style="width: 8mm; height: 6mm; padding-top:4mm">7</td>
								<td class="styLNAmountBox" style="width: 45mm; height: 6mm; padding-top:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/AdjNonchrtblAssetsAndOnePct"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 5mm; height: 6mm; padding-top:4mm">8</td>
								<td class="styTableCell" style="text-align: left; width: 126mm; border-bottom-width: 0px; border-right-width: 0px; height: 6mm; padding-top:4mm">
									<span style="float: left; clear:none">Enter qualifying distributions from Part XII, line 4</span>
									<span class="styDotLn">..............</span>
								</td>
								<td class="styLNRightNumBox" style="width: 8mm; height: 6mm; padding-top:4mm">8</td>
								<td class="styLNAmountBox" style="width: 45mm; height: 6mm; padding-top:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eForReducedTax/QualifyingDistributions"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="padding-left: 13mm">If line 8 is equal to or greater than line 7, check the box in Part VI, line 1b, and complete that part using a 1% tax rate. See<br/>the Part VI instructions on page 18.</td>
							</tr>
						</tbody>
					</table>
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style:solid; border-bottom-width: 0px; border-top-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!--END HEADER-->
					<!-- Part VI  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width:15mm;">Part VI</div>
						<div class="styPartDesc" style="font-size: 7pt;padding-left:3mm;">
    Excise Tax Based on Investment Income (Section 4940(a), 4940(b), 4940(e), or 4948—see page 18 of the instructions)  
  </div>
					</div>
					<table class="styTable" style="font-size: 7pt; border-color:black;width:187mm" cellspacing="0">
						<thead/>
						<tfoot/>
						<tbody valign="top">
							<!--  Line 1a -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 3mm; width: 5mm">1a</td>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 136mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="font-size:6pt">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/ExemptOperatingFoundations"/>
												<xsl:with-param name="BackupName">IRS990PFExemptOperatingFoundations</xsl:with-param>
											</xsl:call-template>Exempt operating foundations described in section 4940(d)(2), check here</label>
									</span>
									<span style="width: 1mm"/>
									<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
									<span style="width: 1mm"/>
									<input type="checkbox" class="styCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/ExemptOperatingFoundations"/>
											<xsl:with-param name="BackupName">IRS990PFExemptOperatingFoundations</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:1mm"/>
									<span style="font-size: 6pt">and enter “N/A” on line 1.</span>
								</td>
								<td rowspan="5" width="4mm">
									<img src="{$ImagePath}/990PF_Bracket_Large.gif" alt="Bracket"/>
								</td>
								<td class="styLNRightNumBox" style="background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 34mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 3mm; width: 5mm"/>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 136mm; border-bottom-width: 0px; border-right-width: 0px">
        Date of ruling or determination letter:
        <span class="styIRS990PFUnderlinedText" style="width: 18mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/DateOfRulingLetter"/>
										</xsl:call-template>
									</span>
									<span style="width: 2mm"/>
									<span class="styBoldText">(attach copy of letter if necessary–see instructions)</span>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 34mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  Line 1a  -->
							<!--  Line 1b  -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 5mm">b</td>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 136mm; border-bottom-width: 0px; border-right-width: 0px">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/DomesticOrgMeetingSect4940e"/>
											<xsl:with-param name="BackupName">IRS990PFDomesticOrgMeetingSect4940e</xsl:with-param>
										</xsl:call-template>Domestic foundations that meet the section 4940(e) requirements in Part V, check</label>
								</td>
								<td class="styLNRightNumBox">1</td>
								<td class="styLNAmountBox" style="width: 34mm">
									<xsl:choose>
										<xsl:when test="$FormData/ExciseTaxBasedOnInvestmentIncm/InvestmentIncomeExciseTax != ''">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/InvestmentIncomeExciseTax"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/InvestmentIncomeExciseTaxNA"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 3mm; width: 5mm"/>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 136mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="float: left; clear: none">here<span style="width: 1mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
										<span style="width: 1mm"/>
										<input type="checkbox" class="styCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/DomesticOrgMeetingSect4940e"/>
												<xsl:with-param name="BackupName">IRS990PFDomesticOrgMeetingSect4940e</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1px"/>and enter 1% of Part I, line 27b</span>
									<span class="styDotLn" style="float: right; clear: none">...................</span>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 34mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!-- Line 1b  -->
							<!--  Line 1c  -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 5mm">c</td>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 136mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="font-size: 6pt; padding-top: 1.5mm">All other domestic foundations enter 2% of line 27b. Exempt foreign organizations enter 4% of Part I, line 12, col. (b)</span>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 34mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  Line 1c  -->
							<!--  Line 2  -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">2</td>
								<td class="styTableCell" colspan="4" style="text-align: left; width: 140mm; border-bottom-width: 0px; border-right-width: 0px; font-size: 6pt">
        Tax under section 511 (domestic section 4947(a)(1) trusts and taxable foundations only. Others enter -0-)
        <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/TaxUnderSection511"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox">2</td>
								<td class="styLNAmountBox" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/TaxUnderSection511"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  Line 2  -->
							<!--  Line 3  -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">3</td>
								<td class="styTableCell" colspan="4" style="text-align: left; width: 140mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="float: left; clear: none">Add lines 1 and 2</span>
									<span class="styDotLn">............................</span>
								</td>
								<td class="styLNRightNumBox">3</td>
								<td class="styLNAmountBox" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/Subtotal"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  Line 3  -->
							<!--  Line 4  -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">4</td>
								<td class="styTableCell" colspan="4" style="text-align: left; width: 140mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="font-size: 6pt">Subtitle A (income) tax (domestic section 4947(a)(1) trusts and taxable foundations only. Others enter -0-).</span>
								</td>
								<td class="styLNRightNumBox">4</td>
								<td class="styLNAmountBox" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/SubtitleATax"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 4  -->
							<!-- Line 5  -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">5</td>
								<td class="styTableCell" colspan="4" style="text-align: left; width: 140mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="float: left; clear: none">
										<span class="styBoldText">Tax based on investment income. </span> Subtract line 4 from line 3. If zero or less, enter -0-
        <span class="styDotLn" style="float:none; clear:none">.....</span>
									</span>
								</td>
								<td class="styLNRightNumBox">5</td>
								<td class="styLNAmountBox" style="width: 34mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/TaxBasedOnInvestmentIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  Line 5  -->
							<!--  Line 6  -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">6</td>
								<td class="styTableCell" colspan="4" style="text-align: left; width: 140mm; border-bottom-width: 0px; border-right-width: 0px">
        Credits/Payments:
      </td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 34mm; border-bottom-width: 0px; height: 4mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="styTable" style="font-size: 7pt; border-color:black; width: 187mm" cellspacing="0">
						<thead/>
						<tfoot/>
						<tbody valign="top">
							<!--  Line 6a  -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 5mm">a</td>
								<td class="styTableCell" style="text-align: left; width: 96mm; border-bottom-width: 0px; border-right-width: 0px">
        2010 estimated tax payments and 2009 overpayment credited to 2010
      </td>
								<td class="styLNRightNumBox">6a</td>
								<td class="styLNAmountBox" colspan="2" style="width: 36mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/EstTaxPaymentsAndOverpayment"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 34mm; border-bottom-width: 0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  Line 6a  -->
							<!--  Line 6b  -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 5mm">b</td>
								<td class="styTableCell" style="text-align: left; width: 96mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="float: left; clear: none">Exempt foreign organizations—tax withheld at source</span>
									<span class="styDotLn" style="float: right">.......</span>
								</td>
								<td class="styLNRightNumBox">6b</td>
								<td class="styLNAmountBox" colspan="2" style="width: 36mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 34mm; border-bottom-width: 0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  Line 6b  -->
							<!--  Line 6c  -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 5mm">c</td>
								<td class="styTableCell" style="text-align: left; width: 96mm; border-bottom-width: 0px; border-right-width: 0px">
        Tax paid with application for extension of time to file (Form 8868) 
      </td>
								<td class="styLNRightNumBox">6c</td>
								<td class="styLNAmountBox" colspan="2" style="width: 36mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/TaxPaidWithExtension"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 34mm; border-bottom-width: 0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  Line  6c  -->
							<!--  Line 6d  -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 5mm">d</td>
								<td class="styTableCell" style="text-align: left; width: 96mm; border-bottom-width: 0px; border-right-width: 0px">
        Backup withholding erroneously withheld <span class="styDotLn" style="float:none; clear:none">...........</span>
								</td>
								<td class="styLNRightNumBox">6d</td>
								<td class="styLNAmountBox" colspan="2" style="width: 36mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/BackupWithholdingWithheld"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 34mm; border-bottom-width: 0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  Line 6d  -->
						</tbody>
					</table>
					<div class="styTableContainer" style="border-bottom-width: 0px; width: 187mm; height:100%">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">7</td>
									<td class="styTableCell" colspan="2" style="text-align: left; width: 134mm; border-bottom-width: 0px; border-right-width: 0px">
										<span style="float: left; clear: none">Total credits and payments. Add lines 6a through 6d</span>
										<span class="styDotLn">..............
<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Tax Paid Original Return</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/TaxPaidOriginalReturn"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/OriginalReturnOverpayment"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNRightNumBox">7</td>
									<td class="styLNAmountBox" style="width: 34mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/TotalCreditsAndPayments"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">8</td>
									<td class="styTableCell" colspan="2" style="text-align: left; width: 134mm; border-bottom-width: 0px; border-right-width: 0px">
        Enter any <span class="styBoldText">penalty</span> for underpayment of estimated tax. <label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/Form2220Attached"/>
												<xsl:with-param name="BackupName">IRS990PFForm2220Attached</xsl:with-param>
											</xsl:call-template> Check here</label>
										<span style="width: 1mm"/>
										<input type="checkbox" class="styCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/Form2220Attached"/>
												<xsl:with-param name="BackupName">IRS990PFForm2220Attached</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width: 1mm"/>if Form 2220 is attached.
        <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/Form2220Attached"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>
									</td>
									<td class="styLNRightNumBox">8</td>
									<td class="styLNAmountBox" style="width: 34mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/PenaltyForUnderpayment"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">9</td>
									<td class="styTableCell" colspan="2" style="text-align: left; width: 134mm; border-bottom-width: 0px; border-right-width: 0px">
										<span class="styBoldText">Tax due. </span> If the total of lines 5 and 8 is more than line 7, enter <span class="styBoldText">amount owed</span>
										<span class="styDotLn" style="float:none; clear:none; padding-left: 1.25mm">.......</span>
										<span style="width: 4mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
									</td>
									<td class="styLNRightNumBox">9</td>
									<td class="styLNAmountBox" style="width: 34mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/TaxDue"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 5mm">10</td>
									<td class="styTableCell" colspan="2" style="text-align: left; width: 134mm; border-bottom-width: 0px; border-right-width: 0px">
										<span class="styBoldText">Overpayment. </span> If line 7 is more than the total of lines 5 and 8, enter the <span class="styBoldText">amount overpaid</span>
										<span class="styDotLn" style="float:none; clear:none; padding-left:.25mm">...</span>
										<span style="width: 4mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
									</td>
									<td class="styLNRightNumBox">10</td>
									<td class="styLNAmountBox" style="width: 34mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/Overpayment"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 5mm">11</td>
									<td class="styTableCell" style="text-align: left; width: 109mm; border-bottom-width: 0px; border-right-width: 0px;font-size: 6pt">
        Enter the amount of line 10 to be: <span class="styBoldText">Credited to 2011 estimated tax</span>
										<span style="width: 1mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
										<span style="width: 1mm"/>
										<span style="text-align: right; width: 27mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/AmountCreditedToNextYear"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styBoldText" style="border-style:solid; border-color:black; border-left-width:1px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; width: 25mm">
										<span style="width: 6.25mm"/>Refunded
      <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
										<span style="width: 1mm"/>
									</td>
									<td class="styLNRightNumBox" style="border-bottom:0">11</td>
									<td class="styLNAmountBox" style="width: 34mm; border-bottom:0">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/AmountToBeRefunded"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm">Part VII-A</div>
						<div class="styPartDesc" style="width: 100mm">
    Statements Regarding Activities 
  </div>
					</div>
					<!--  Line 1a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">1a</div>
						<div class="styLNDesc" style="width: 155mm">
      During the tax year, did the foundation attempt to influence any national, state, or local legislation or did
     </div>
						<div class="styLNRightNumBox" style="background-color: lightgrey">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox">Yes</div>
						<div class="styLNRightNumBox">No</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">it participate or intervene in any political campaign?
                           <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/LegislativePoliticalActivities"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float: right; clear: none">....................</span>
						</div>
						<div class="styLNRightNumBox">1a</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/LegislativePoliticalActivities"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/LegislativePoliticalActivities"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 1a  -->
					<!--  Line 1b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 155mm">
        Did it spend more than $100 during the year (either directly or indirectly) for political purposes (see page 19 of
    </div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">the instructions for definition)?</span>
							<span class="styDotLn" style="float: right; clear: none">.............................</span>
						</div>
						<div class="styLNRightNumBox">1b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/MoreThan100Spent"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/MoreThan100Spent"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="padding-left: 2mm; width: 155mm">
							<span class="styItalicText">
        If the answer is “Yes” to <span class="styBoldText">1a</span> or <span class="styBoldText">1b,</span> attach a detailed description of the activities and copies of any materials
      </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="padding-left: 2mm; width: 155mm">
							<span class="styItalicText">published or distributed by the foundation in connection with the activities.</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--  Line 1b  -->
					<!--  Line 1c  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> Did the foundation file <span class="styBoldText">Form 1120-POL</span> for this year?</span>
							<span class="styDotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">1c</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/Form1120POLFiled"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/Form1120POLFiled"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 1c  -->
					<!--  Line 1d  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">d</div>
						<div class="styLNDesc" style="width: 155mm">
      Enter the amount (if any) of tax on political expenditures (section 4955) imposed during the year:
    </div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span class="styBoldText">(1)</span> On the foundation. <span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span style="width: 1mm"/>$
        <span class="styIRS990PFUnderlinedText" style="text-align: right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/Sect4955TaxOnOrganization"/>
								</xsl:call-template>
							</span>
							<span style="width: 2mm"/>
							<span class="styBoldText">(2)</span> On foundation managers.<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span style="width: 1mm"/>$
          <span class="styIRS990PFUnderlinedText" style="text-align: right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/Sect4955TaxOnManagers"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--  Line 1d  -->
					<!--  Line 1e  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">e</div>
						<div class="styLNDesc" style="width: 155mm">
      Enter the reimbursement (if any) paid by the foundation during the year for political expenditure tax imposed
    </div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
       on foundation managers.<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span style="width: 1mm"/>$
          <span class="styIRS990PFUnderlinedText" style="text-align: right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ReimbursementOfTax"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--  Line 1e  -->
					<!--  Line 2  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">2</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">Has the foundation engaged in any activities that have not previously been reported to the IRS?</span>
							<span class="styDotLn" style="float: right; clear: none">.......</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ActivitiesNotPrevReported"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ActivitiesNotPrevReported"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span class="styItalicText">If “Yes,” attach a detailed description of the activities.</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ActivitiesNotPrevReported"/>
								<xsl:with-param name="TabOrder" select="2"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!--  Line 2  -->
					<!--  Line 3  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">3</div>
						<div class="styLNDesc" style="width: 155mm">
      Has the foundation made any changes, not previously reported to the IRS, in its governing instrument, articles
    </div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
        of incorporation, or bylaws, or other similar instruments? 
        <span class="styItalicText">If “Yes,” attach a conformed copy of the changes</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ChangesToArticlesOrBylaws"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float: right; clear: none">....</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ChangesToArticlesOrBylaws"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ChangesToArticlesOrBylaws"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 3  -->
					<!--  Line 4a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1.5mm">4a</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">Did the foundation have unrelated business gross income of $1,000 or more during the year?</span>
							<span class="styDotLn">........</span>
						</div>
						<div class="styLNRightNumBox">4a</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/UnrelatedBusIncomeOver1000"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/UnrelatedBusIncomeOver1000"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 4a  -->
					<!--  Line 4b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox" style="padding-left:3mm">b</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">If “Yes,” has it filed a tax return on <span class="styBoldText">Form 990-T</span> for this year?</span>
							<span class="styDotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">4b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/Form990TFiled"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/Form990TFiled"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 4b  -->
					<!--  Line 5  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:2mm">5</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">Was there a liquidation, termination, dissolution, or substantial contraction during the year?</span>
							<span class="styDotLn" style="float: right; clear: none">.........</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/TerminationEtc"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/TerminationEtc"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span class="styItalicText">If “Yes,” attach the statement required by General Instruction T.</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/TerminationEtc"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height:4.5mm"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height:4.5mm"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height:4.5mm"/>
					</div>
					<!--  Line 5  -->
					<!--  Line 6  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">6</div>
						<div class="styLNDesc" style="width: 155mm">
      Are the requirements of section 508(e) (relating to sections 4941 through 4945) satisfied either:
    </div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm; padding-left: 8mm">
						<div style="float: left">
							<li>By language in the governing instrument, or</li>
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; width: 8.25mm"/>
						</div>
					</div>
					<div style="width: 187mm; padding-left: 8mm">
						<div style="float: left">
							<li>By state legislation that effectively amends the governing instrument so that no mandatory directions</li>
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; width: 8.25mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="padding-left: 4.5mm; float: left; clear: none">that conflict with the state law remain in the governing instrument?</span>
							<span class="styDotLn" style="float: right; clear: none">................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/RequirementsOfSect508e"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/RequirementsOfSect508e"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 6  -->
					<!--  Line 7  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">7</div>
						<div class="styLNDesc" style="font-size: 6pt; width: 155mm">
      Did the foundation have at least $5,000 in assets at any time during the year?<span class="styItalicText"> If “Yes,” complete Part II, col. (c), and Part XV.</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/AtLeast5000InAssets"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/AtLeast5000InAssets"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 7  -->
					<!--  Line 8a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">8a</div>
						<div class="styLNDesc" style="width: 155mm">
      Enter the states to which the foundation reports or with which it is registered (see page 19 of the
    </div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styGenericDiv" style="width: 179mm;height:100%;">
							<div class="styLNDesc" style="width: 155mm;height:100%;">
          instructions)<span style="width: 1mm"/>
								<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
								<span class="styIRS990PFUnderlinedText" style="width: 130mm; font-size: 6pt">
									<xsl:if test="($Print = $Separated) and (count($FormData/StatementsRegardingActivities/StatesFiledWith)     &gt;25)">
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/StatesFiledWith"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count    ($FormData/StatementsRegardingActivities/StatesFiledWith) &lt;26))">
										<xsl:for-each select="$FormData/StatementsRegardingActivities/StatesFiledWith">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<xsl:if test="position()!=last()">, <span style="width: 1mm"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:100%; background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="height:100%; background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="height:100% ;background-color: lightgrey; border-bottom-width: 0px"/>
						</div>
					</div>
					<!--  Line 8a  -->
					<!--  Line 8b  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 3.5mm">b</div>
						<div class="styLNDesc" style="width: 155mm">
      If the answer is “Yes” to line 7, has the foundation furnished a copy of Form 990-PF to the Attorney
    </div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 155mm">
      General (or designate) of each state as required by General Instruction G?
      <span class="styItalicText">If “No,” attach explanation <span class="styBoldText">.</span>
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/Form990PFFiledWithAG"/>
								<xsl:with-param name="TabOrder" select="2"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">8b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/Form990PFFiledWithAG"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/Form990PFFiledWithAG"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 8b  -->
					<!--  Line 9  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">9</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">Is the foundation claiming status as a private operating foundation within the meaning of section 4942(j)(3)</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
       or 4942(j)(5) for calendar year 2010 or the taxable year beginning in 2010 (see instructions for Part XIV on
    </div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">page 27)?<span class="styItalicText"> If “Yes,” complete Part XIV</span>
							</span>
							<span class="styDotLn" style="float: right; clear: none">...........................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/PrivateOperatingFoundation"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/PrivateOperatingFoundation"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 9  -->
					<!--  Line 10  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="font-size: 6pt; width: 155mm">
      Did any persons become substantial contributors during the tax year? <span class="styItalicText"> If “Yes,” attach a schedule listing their names and addresses.</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/NewSubstantialContributors"/>
								<xsl:with-param name="TabOrder" select="2"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/NewSubstantialContributors"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/NewSubstantialContributors"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 10  -->
					<!--  Line 11a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width: 155mm">
      At any time during the year, did the foundation, directly or indirectly, own a controlled entity within the
      </div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
      meaning of section 512(b)(13)? If "Yes," attach schedule. (see page 20 of the instructions) 
      <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/InterestInControlledEntity"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="right: float; clear: none">.......</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/InterestInControlledEntity"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/InterestInControlledEntity"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 11a  -->
					<!--  Line 11b  -->
					<!--  <div style="width: 187mm">
    <div class="styLNLeftLtrBox">b</div>
    <div class="styLNDesc" style="width: 155mm">
        If "Yes," did the foundation have a binding written contract in effect on August 17, 2007, covering the interest,
    </div>
    <div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"></div>
    <div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"></div>
    <div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"></div>
  </div>
  <div style="width: 187mm">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width: 155mm">
      <span style="float: left; clear: none">rents, royalties, and annuities described in the attachment for line 11a?</span><span class="styDotLn" style="float: right; clear: none">...............</span>
    </div>
    <div class="styLNRightNumBox">11b</div>
    <div class="styLNRightNumBox">
      <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BindingWrittenContract" />
            </xsl:call-template>
          </div>
    <div class="styLNRightNumBox">
      <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BindingWrittenContract" />
            </xsl:call-template>
          </div>
  </div>  -->
					<!--  Line 11b  -->
					<!--  Line 12  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
      Did the foundation acquire a direct or indirect interest in any applicable insurance contract before August 17, 2008?  </span>
							<!--    <span class="styDotLn" style="right: float; clear: none">.........</span> -->
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ApplicableInsuranceContract"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ApplicableInsuranceContract"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 12  -->
					<!--  Line 13  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width: 155mm">
      Did the foundation comply with the public inspection requirements for its annual returns and exemption application?
    </div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ComplyWithPublicInspectionRqr"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ComplyWithPublicInspectionRqr"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 179mm">
      Website address<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styIRS990PFUnderlinedText" style="width: 153mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/WebsiteAddress"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  Line 13  -->
					<!--  Line 14  -->
					<div style="width: 187mm; padding-top:1mm">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width: 179mm">
    The books are in care of<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styIRS990PFUnderlinedText" style="width: 90mm">
								<xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActivities/BooksInCareOfBusinessName !=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfBusinessName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="$FormData/StatementsRegardingActivities/BooksInCareOfBusinessName/BusinessNameLine2 != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfBusinessName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfPersonName"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span> 
    Telephone no.<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styIRS990PFUnderlinedText" style="width: 30.5mm">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfPhoneNumber"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 179mm">
      Located at<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styIRS990PFUnderlinedText" style="width: 112mm; font-size: 6pt">
								<xsl:if test="count($FormData/StatementsRegardingActivities/BooksInCareOfUSAddress) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfUSAddress/AddressLine1"/>
									</xsl:call-template>
									<xsl:if test="$FormData/StatementsRegardingActivities/BooksInCareOfUSAddress/AddressLine2 != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfUSAddress/AddressLine2"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/StatementsRegardingActivities/BooksInCareOfUSAddress/City != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfUSAddress/City"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/StatementsRegardingActivities/BooksInCareOfUSAddress/State != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfUSAddress/State"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
								<xsl:if test="count($FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress/AddressLine1"/>
									</xsl:call-template>
									<xsl:if test="$FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress/AddressLine2 != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress/AddressLine2"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress/City != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress/City"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress/ProvinceOrState != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress/ProvinceOrState"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress/Country != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress/Country"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
							</span>
      ZIP+4<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styIRS990PFUnderlinedText" style="width: 36mm">
								<xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActivities/BooksInCareOfUSAddress/ZIPCode !=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfUSAddress/ZIPCode"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/BooksInCareOfForeignAddress/PostalCode"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--  Line 14  -->
					<!--  Line 15  -->
					<div style="width: 187mm; padding-top: 1mm">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width: 179mm">
							<span style="float: left; clear: none">
    Section 4947(a)(1) nonexempt charitable trusts filing Form 990-PF in lieu of 
    <span class="styBoldText">Form 1041</span>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/NECTFilingInLieuOFForm1041"/>
										<xsl:with-param name="BackupName">IRS990PFNECTFilingInLieuOFForm1041</xsl:with-param>
									</xsl:call-template> —Check here</label>
							</span>
							<span class="styDotLn" style="float: none; clear: none">.........</span>
							<span style="width: 2mm"/>
							<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span style="width: 2mm"/>
							<input type="checkbox" class="styCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/NECTFilingInLieuOFForm1041"/>
									<xsl:with-param name="BackupName">IRS990PFNECTFilingInLieuOFForm1041</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 139mm">
     and enter the amount of tax-exempt interest received or accrued during the year
     <span class="styDotLn" style="float: none; clear: none">......</span>
							<span style="width: 2mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span style="width: 2mm"/>
						</div>
						<span class="styLNRightNumBox">15</span>
						<span class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/TaxExemptInterestReceived"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 15  -->
					<!--  Line 16  -->
					<div style="width: 187mm; padding-top: 1mm">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width: 179mm">
							<span style="float: left; clear: none">
    At any time during calendar year 2010, did the foundation have an interest in or a signature or other authority over
							</span>
						</div>
					</div>
					<div class="styBB" style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 155mm">
       a bank, securities, or other financial account in a foreign country?     <span class="styDotLn" style="float: none; clear: none">.................</span>
						</div>
						<div class="styLNRightNumBox" style="border-top-width:1px;">16</div>
						<div class="styLNRightNumBox" style="border-top-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ForeignBank"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="border-top-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/ForeignBank"/>
							</xsl:call-template>
						</div>
						<div style="width: 187mm; padding-top: 1mm">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width: 155mm">
								<span style="float: left; clear: none">
    See page 20 of the instructions for exceptions and filing requirements  for Form TD F 90-22.1.  If "Yes", enter the name of the foreign country
   					<span style="width: 2mm"/>
									<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
									<span style="width: 2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActivities/NameOfForeignCountry"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- Line 16  -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">5</span>
						</div>
					</div>
					<!--END HEADER-->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm">Part VII-B</div>
						<div class="styPartDesc" style="width: 160mm">
    Statements Regarding Activities for Which Form 4720 May Be Required 
  </div>
					</div>
					<!--  Line 1a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span class="styBoldText">File Form 4720 if any item is checked in the “Yes” column, unless an exception applies.</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox">Yes</div>
						<div class="styLNRightNumBox">No</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">1a</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">During the year did the foundation (either directly or indirectly):</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0">
							<span style="width: 1px"/>
						</div>
					</div>
					<!-- (1) -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(1)</span> 
        Engage in the sale or exchange, or leasing of property with a disqualified person?
       </span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/SaleOrExchangeWithDsqflyPerson"/>
										<xsl:with-param name="BackupName">IRS990PFSaleOrExchangeWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/SaleOrExchangeWithDsqflyPerson"/>
											<xsl:with-param name="BackupName">IRS990PFSaleOrExchangeWithDsqflyPerson</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/SaleOrExchangeWithDsqflyPerson"/>
										<xsl:with-param name="BackupName">IRS990PFSaleOrExchangeWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/SaleOrExchangeWithDsqflyPerson"/>
											<xsl:with-param name="BackupName">IRS990PFSaleOrExchangeWithDsqflyPerson</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (1)  -->
					<!--  (2)  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(2)</span> 
         Borrow money from, lend money to, or otherwise extend credit to (or accept it from)
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none;padding-left: 5mm"> 
         a disqualified person?<span class="styDotLn" style="float: none; clear: none">.........................</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/BorrowOrLendWithDsqflyPerson"/>
										<xsl:with-param name="BackupName">IRS990PFBorrowOrLendWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/BorrowOrLendWithDsqflyPerson"/>
											<xsl:with-param name="BackupName">IRS990PFBorrowOrLendWithDsqflyPerson</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/BorrowOrLendWithDsqflyPerson"/>
										<xsl:with-param name="BackupName">IRS990PFBorrowOrLendWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/BorrowOrLendWithDsqflyPerson"/>
											<xsl:with-param name="BackupName">IRS990PFBorrowOrLendWithDsqflyPerson</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (2)  -->
					<!-- (3) -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(3)</span> 
         Furnish goods, services, or facilities to (or accept them from) a disqualified person?
       </span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/FurnishedGoodsWithDsqflyPerson"/>
										<xsl:with-param name="BackupName">IRS990PFFurnishedGoodsWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/FurnishedGoodsWithDsqflyPerson"/>
											<xsl:with-param name="BackupName">IRS990PFFurnishedGoodsWithDsqflyPerson</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/FurnishedGoodsWithDsqflyPerson"/>
										<xsl:with-param name="BackupName">IRS990PFFurnishedGoodsWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/FurnishedGoodsWithDsqflyPerson"/>
											<xsl:with-param name="BackupName">IRS990PFFurnishedGoodsWithDsqflyPerson</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (3)  -->
					<!-- (4) -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(4)</span> 
        Pay compensation to, or pay or reimburse the expenses of, a disqualified person?
       </span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/PayCompensationToDsqflyPerson"/>
										<xsl:with-param name="BackupName">IRS990PFPayCompensationToDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/PayCompensationToDsqflyPerson"/>
											<xsl:with-param name="BackupName">IRS990PFPayCompensationToDsqflyPerson</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/PayCompensationToDsqflyPerson"/>
										<xsl:with-param name="BackupName">IRS990PFPayCompensationToDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/PayCompensationToDsqflyPerson"/>
											<xsl:with-param name="BackupName">IRS990PFPayCompensationToDsqflyPerson</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (4)  -->
					<!--  (5)  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(5)</span> 
         Transfer any income or assets to a disqualified person (or make any of either available
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none;padding-left: 5mm"> 
         for the benefit or use of a disqualified person)?<span class="styDotLn" style="float: none; clear: none">.................</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/TransferAssetsToDsqflyPerson"/>
										<xsl:with-param name="BackupName">IRS990PFTransferAssetsToDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/TransferAssetsToDsqflyPerson"/>
											<xsl:with-param name="BackupName">IRS990PFTransferAssetsToDsqflyPerson</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/TransferAssetsToDsqflyPerson"/>
										<xsl:with-param name="BackupName">IRS990PFTransferAssetsToDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/TransferAssetsToDsqflyPerson"/>
											<xsl:with-param name="BackupName">IRS990PFTransferAssetsToDsqflyPerson</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (5)  -->
					<!--  (6)  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(6)</span> 
         Agree to pay money or property to a government official? (<span class="styBoldText">Exception.</span> Check “No”
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none;padding-left:5mm"> 
         if the foundation agreed to make a grant to or to employ the official for a period
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none;padding-left: 5mm"> 
         after termination of government service, if terminating within 90 days.)<span class="styDotLn" style="float: none; clear: none">.........</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/PaymentToGovernmentOffical"/>
										<xsl:with-param name="BackupName">IRS990PFPaymentToGovernmentOffical</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/PaymentToGovernmentOffical"/>
											<xsl:with-param name="BackupName">IRS990PFPaymentToGovernmentOffical</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/PaymentToGovernmentOffical"/>
										<xsl:with-param name="BackupName">IRS990PFPaymentToGovernmentOffical</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/PaymentToGovernmentOffical"/>
											<xsl:with-param name="BackupName">IRS990PFPaymentToGovernmentOffical</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (6)  -->
					<!--  Line 1a  -->
					<!--  Line 1b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         If any answer is “Yes” to 1a(1)–(6), did <span class="styBoldText">any </span>of the acts fail to qualify under the exceptions described in Regulations
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         section 53.4941(d)-3 or in a current notice regarding disaster assistance (see page 20 of the instructions)?<span class="styDotLn" style="float: none; clear: none">...</span>
							</span>
						</div>
						<div class="styLNRightNumBox">1b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/ActsFailToQualifyAsExceptions"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/ActsFailToQualifyAsExceptions"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/RelyingCurrNoticeDisasterAsst1"/>
										<xsl:with-param name="BackupName">IRS990PFRelyingCurrNoticeDisasterAsst1</xsl:with-param>
									</xsl:call-template>Organizations relying on a current notice regarding disaster assistance check here</label>
								<span class="styDotLn" style="float: none; clear: none">.........</span>
								<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							</span>
							<span style="float: right; clear:none; padding-right: 6.25mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/RelyingCurrNoticeDisasterAsst1"/>
										<xsl:with-param name="BackupName">IRS990PFRelyingCurrNoticeDisasterAsst1</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  Line 1b  -->
					<!--  Line 1c  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         Did the foundation engage in a prior year in any of the acts described in 1a, other than excepted acts,
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         that were not corrected before the first day of the tax year beginning in 2010?<span class="styDotLn" style="float: none; clear: none">.............</span>
							</span>
						</div>
						<div class="styLNRightNumBox">1c</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UncorrectedPriorActs"/>
								<xsl:with-param name="BackupName">IRS990PFUncorrectedPriorActsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UncorrectedPriorActs"/>
								<xsl:with-param name="BackupName">IRS990PFUncorrectedPriorActsNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 1c  -->
					<!--  Line 2  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">2</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         Taxes on failure to distribute income (section 4942) (does not apply for years the foundation was a private
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         operating foundation defined in section 4942(j)(3) or 4942(j)(5)):
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  Line 2  -->
					<!--  Line 2a  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         At the end of tax year 2010, did the foundation have any undistributed income (lines 6d
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         and 6e, Part XIII) for tax year(s) beginning before 2010?<span class="styDotLn" style="float: none; clear: none">...............</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYears"/>
										<xsl:with-param name="BackupName">IRS990PFUndistributedIncomePriorYears</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYears"/>
											<xsl:with-param name="BackupName">IRS990PFUndistributedIncomePriorYears</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYears"/>
										<xsl:with-param name="BackupName">IRS990PFUndistributedIncomePriorYears</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYears"/>
											<xsl:with-param name="BackupName">IRS990PFUndistributedIncomePriorYears</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         If “Yes,” list the years
         <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
								<xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYear1 != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYear1"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width: 1mm"/>,
          <xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYear2 != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYear2"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width: 1mm"/>,
        <xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYear3 != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYear3"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width: 1mm"/>,
        <xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYear4 != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistributedIncomePriorYear4"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm; background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  Line 2a  -->
					<!--  Line 2b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         Are there any years listed in 2a for which the foundation is  <span class="styBoldText">not</span> applying the provisions of section 4942(a)(2)
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         (relating to incorrect valuation of assets) to the year’s undistributed income? (If applying section 4942(a)(2)
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         to <span class="styBoldText">all </span>years listed, answer “No” and attach statement—see page 20 of the instructions.)
         <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2NotApplied"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
								<span class="styDotLn" style="float: none; clear: none">.........</span>
							</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2NotApplied"/>
								<xsl:with-param name="BackupName">IRS990PFUndistrIncome4942a2NotAppliedYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2NotApplied"/>
								<xsl:with-param name="BackupName">IRS990PFUndistrIncome4942a2NotAppliedNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 2b  -->
					<!--  Line 2c  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         If the provisions of section 4942(a)(2) are being applied to any of the years listed in 2a, list the years here.
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
								<xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2AppYear1 != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2AppYear1"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width: 1mm"/>,
          <xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2AppYear2 != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2AppYear2"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width: 1mm"/>,
        <xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2AppYear3 != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2AppYear3"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width: 1mm"/>,
        <xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2AppYear4 != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UndistrIncome4942a2AppYear4"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm; background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  Line 2c  -->
					<!--  Line 3a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">3a</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         Did the foundation hold more than a 2% direct or indirect interest in any business
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         enterprise at any time during the year?<span class="styDotLn" style="float: none; clear: none">.....................</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/BusinessHoldings"/>
										<xsl:with-param name="BackupName">IRS990PFBusinessHoldings</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/BusinessHoldings"/>
											<xsl:with-param name="BackupName">IRS990PFBusinessHoldings</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/BusinessHoldings"/>
										<xsl:with-param name="BackupName">IRS990PFBusinessHoldings</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/BusinessHoldings"/>
											<xsl:with-param name="BackupName">IRS990PFBusinessHoldings</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  Line 3a  -->
					<!--  Line 3b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         If “Yes,” did it have excess business holdings in 2010 as a result of <span class="styBoldText">(1)</span> any purchase by the foundation
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         or disqualified persons after May 26, 1969; <span class="styBoldText">(2)</span> the lapse of the 5-year period (or longer period approved
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         by the Commissioner under section 4943(c)(7)) to dispose of holdings acquired by gift or bequest; or <span class="styBoldText">(3)</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         the lapse of the 10-, 15-, or 20-year first phase holding period?<span class="styItalicText"> (Use Schedule C, Form 4720, to determine</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span class="styItalicText" style="float: left; clear: none"> 
         if the foundation had excess business holdings in 2010.)<span class="styDotLn" style="float: none; clear: none">....................</span>
							</span>
						</div>
						<div class="styLNRightNumBox">3b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/ExcessBusinessHoldings"/>
								<xsl:with-param name="BackupName">IRS990PFExcessBusinessHoldingsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/ExcessBusinessHoldings"/>
								<xsl:with-param name="BackupName">IRS990PFExcessBusinessHoldingsNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 3b  -->
					<!--  Line 4a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">4a</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         Did the foundation invest during the year any amount in a manner that would jeopardize its charitable purposes?
         </span>
						</div>
						<div class="styLNRightNumBox">4a</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/JeopardyInvestments"/>
								<xsl:with-param name="BackupName">IRS990PFExcessBusinessHoldingsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/JeopardyInvestments"/>
								<xsl:with-param name="BackupName">IRS990PFExcessBusinessHoldingsNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 4a  -->
					<!--  Line 4b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         Did the foundation make any investment in a prior year (but after December 31, 1969) that could jeopardize its
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         charitable purpose that had not been removed from jeopardy before the first day of the tax year beginning in 2010?
       </span>
						</div>
						<div class="styLNRightNumBox">4b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UncorrectedJeopardyInvestments"/>
								<xsl:with-param name="BackupName">IRS990PFUncorrectedJeopardyInvestmentsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/UncorrectedJeopardyInvestments"/>
								<xsl:with-param name="BackupName">IRS990PFUncorrectedJeopardyInvestmentsNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 4b  -->
					<!--  Line 5a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">5a</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">During the year did the foundation pay or incur any amount to:</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0">
							<span style="width: 1px"/>
						</div>
					</div>
					<!-- (1) -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(1)</span> 
         Carry on propaganda, or otherwise attempt to influence legislation (section 4945(e))?
       </span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/InfluenceLegislation"/>
										<xsl:with-param name="BackupName">IRS990PFInfluenceLegislation</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/InfluenceLegislation"/>
											<xsl:with-param name="BackupName">IRS990PFInfluenceLegislation</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/InfluenceLegislation"/>
										<xsl:with-param name="BackupName">IRS990PFInfluenceLegislation</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/InfluenceLegislation"/>
											<xsl:with-param name="BackupName">IRS990PFInfluenceLegislation</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (1)  -->
					<!--  (2)  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(2)</span> 
         Influence the outcome of any specific public election (see section 4955); or to carry
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none;padding-left: 5mm"> 
         on, directly or indirectly, any voter registration drive?<span class="styDotLn" style="float: none; clear: none">...............</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/InfluenceElection"/>
										<xsl:with-param name="BackupName">IRS990PInfluenceElection</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/InfluenceElection"/>
											<xsl:with-param name="BackupName">IRS990PInfluenceElection</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/InfluenceElection"/>
										<xsl:with-param name="BackupName">IRS990PFInfluenceElection</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/InfluenceElection"/>
											<xsl:with-param name="BackupName">IRS990PInfluenceElection</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (2)  -->
					<!-- (3) -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(3)</span> 
         Provide a grant to an individual for travel, study, or other similar purposes?
       </span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/GrantsToIndividuals"/>
										<xsl:with-param name="BackupName">IRS990PFInfluenceElection</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/GrantsToIndividuals"/>
											<xsl:with-param name="BackupName">IRS990PFInfluenceElection</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/GrantsToIndividuals"/>
										<xsl:with-param name="BackupName">IRS990PFInfluenceElection</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/GrantsToIndividuals"/>
											<xsl:with-param name="BackupName">IRS990PFInfluenceElection</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (3)  -->
					<!-- (4) -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(4)</span> 
         Provide a grant to an organization other than a charitable, etc., organization described
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none;padding-left: 5mm"> 
         in section 509(a)(1), (2), or (3), or section 4940(d)(2)? (see page 22 of the instructions)<span class="styDotLn" style="float: none; clear: none">...</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/GrantsToOrganizations"/>
										<xsl:with-param name="BackupName">IRS990PFGrantsToOrganizations</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/GrantsToOrganizations"/>
											<xsl:with-param name="BackupName">IRS990PFGrantsToOrganizations</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/GrantsToOrganizations"/>
										<xsl:with-param name="BackupName">IRS990PFGrantsToOrganizations</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/GrantsToOrganizations"/>
											<xsl:with-param name="BackupName">IRS990PFGrantsToOrganizations</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (4)  -->
					<!--  (5)  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<span class="styBoldText">(5)</span> 
         Provide for any purpose other than religious, charitable, scientific, literary, or
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none;padding-left: 5mm"> 
         educational purposes, or for the prevention of cruelty to children or animals?<span class="styDotLn" style="float: none; clear: none">........</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/NoncharitablePurpose"/>
										<xsl:with-param name="BackupName">IRS990PFNoncharitablePurpose</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/NoncharitablePurpose"/>
											<xsl:with-param name="BackupName">IRS990PFNoncharitablePurpose</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/NoncharitablePurpose"/>
										<xsl:with-param name="BackupName">IRS990PFNoncharitablePurpose</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/NoncharitablePurpose"/>
											<xsl:with-param name="BackupName">IRS990PFNoncharitablePurpose</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  (5)  -->
					<!--  Line 5a  -->
					<!--  Line 5b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         If any answer is “Yes” to 5a(1)–(5), did <span class="styBoldText">any </span>of the transactions fail to qualify under the exceptions described in
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         Regulations section 53.4945 or in a current notice regarding disaster assistance (see page 22 of the instructions)?
       </span>
						</div>
						<div class="styLNRightNumBox">5b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/TrFailToQualifyAsExceptions"/>
								<xsl:with-param name="BackupName">IRS990PFTrFailToQualifyAsExceptionsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/TrFailToQualifyAsExceptions"/>
								<xsl:with-param name="BackupName">IRS990PFTrFailToQualifyAsExceptionsNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/RelyingCurrNoticeDisasterAsst2"/>
										<xsl:with-param name="BackupName">IRS990PFRelyingCurrNoticeDisasterAsst2</xsl:with-param>
									</xsl:call-template>Organizations relying on a current notice regarding disaster assistance check here</label>
								<span class="styDotLn" style="float: none; clear: none">.........</span>
								<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							</span>
							<span style="float: right; clear:none; padding-right: 6.25mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/RelyingCurrNoticeDisasterAsst2"/>
										<xsl:with-param name="BackupName">IRS990PFRelyingCurrNoticeDisasterAsst2</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  Line 5b  -->
					<!--  Line 5c  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         If the answer is “Yes” to question 5a(4), does the foundation claim exemption from the
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         tax because it maintained expenditure responsibility for the grant?<span class="styDotLn" style="float: none; clear: none">............</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/MaintExpendResponsibility"/>
										<xsl:with-param name="BackupName">IRS990PFMaintExpendResponsibility</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/MaintExpendResponsibility"/>
											<xsl:with-param name="BackupName">IRS990PFMaintExpendResponsibility</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/MaintExpendResponsibility"/>
										<xsl:with-param name="BackupName">IRS990PFMaintExpendResponsibility</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/MaintExpendResponsibility"/>
											<xsl:with-param name="BackupName">IRS990PFMaintExpendResponsibility</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span class="styItalicText" style="float: left; clear: none"> 
         If “Yes,” attach the statement required by Regulations section 53.4945–5(d).
       </span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/MaintExpendResponsibility"/>
								<xsl:with-param name="TabOrder" select="2"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0; height: 4.5mm"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0; height: 4.5mm"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0; height: 4.5mm"/>
					</div>
					<!--  Line 5c  -->
					<!--  Line 6a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">6a</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         Did the foundation, during the year, receive any funds, directly or indirectly, to pay
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         premiums on a personal benefit contract?<span class="styDotLn" style="float: none; clear: none">....................</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/RcvFundsToPayPrsnlBnftContract"/>
										<xsl:with-param name="BackupName">IRS990PFRcvFundsToPayPrsnlBnftContract</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/RcvFundsToPayPrsnlBnftContract"/>
											<xsl:with-param name="BackupName">IRS990PFRcvFundsToPayPrsnlBnftContract</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/RcvFundsToPayPrsnlBnftContract"/>
										<xsl:with-param name="BackupName">IRS990PFRcvFundsToPayPrsnlBnftContract</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/RcvFundsToPayPrsnlBnftContract"/>
											<xsl:with-param name="BackupName">IRS990PFRcvFundsToPayPrsnlBnftContract</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  Line 6a  -->
					<!--  Line 6b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         Did the foundation, during the year, pay premiums, directly or indirectly, on a personal benefit contract?<span class="styDotLn" style="float: none; clear: none">....</span>
							</span>
						</div>
						<div class="styLNRightNumBox">6b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/PayPremiumsPrsnlBnftContract"/>
								<xsl:with-param name="BackupName">IRS990PFPayPremiumsPrsnlBnftContractYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/PayPremiumsPrsnlBnftContract"/>
								<xsl:with-param name="BackupName">IRS990PFPayPremiumsPrsnlBnftContractNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span class="styItalicText" style="float: left; clear: none"> 
         If “Yes” to 6b, file Form 8870.
       </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  Line 6b  -->
					<!--  Line7a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">7a</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
             At any time during the tax year, was the foundation a party to a prohibited tax shelter transaction?
       </span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/ProhibitedTaxShelterTransactn"/>
										<xsl:with-param name="BackupName">IRS990PFProhibitedTaxShelterTransactn</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/ProhibitedTaxShelterTransactn"/>
											<xsl:with-param name="BackupName">IRS990PFProhibitedTaxShelterTransactn</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/ProhibitedTaxShelterTransactn"/>
										<xsl:with-param name="BackupName">IRS990PFProhibitedTaxShelterTransactn</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/ProhibitedTaxShelterTransactn"/>
											<xsl:with-param name="BackupName">IRS990PFProhibitedTaxShelterTransactn</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<!--  Line 7a  -->
					<!--  Line 7b  -->
					<div class="styBB" style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
         If yes, did the foundation receive any proceeds or have any net income attributable to the transaction?
         <span class="styDotLn" style="float: none; clear: none">....</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style=" border-bottom:0">7b</div>
						<div class="styLNRightNumBox" style=" border-bottom:0">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/ProceedsOrNetIncome"/>
								<xsl:with-param name="BackupName">IRS990PFProceedsOrNetIncomeYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style=" border-bottom:0">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720/ProceedsOrNetIncome"/>
								<xsl:with-param name="BackupName">IRS990PFProceedsOrNetIncomeNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 7b  -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">6</span>
						</div>
					</div>
					<!--END HEADER-->
					<div style="width:187mm;border-top-width: 1px; float: none; clear: both" class="styBB">
						<div class="styPartName" style="width:18mm; margin-top: 2mm; margin-bottom:2.5mm">Part VIII</div>
						<div class="styPartDesc" style="padding-top: 0mm;width:169mm">
    Information About Officers, Directors, Trustees, Foundation Managers, Highly Paid Employees,<br/>and Contractors  
  </div>
					</div>
					<!--  Line 1  -->
					<table class="styTable" style="font-size: 7pt; border-color:black; width: 187mm" cellspacing="0">
						<thead class="styTableThead">
							<tr>
								<th scope="col" class="styTableCellHeader" colspan="5" style="width: 187mm; border-right-width: 0px; padding-left: 2mm; text-align: left">
  1  <span style="width: 2mm"/> List all officers, directors, trustees, foundation managers and their compensation (see page 22 of the instructions).
  </th>
							</tr>
							<tr scope="col">
								<th scope="col" class="styTableCellHeader" style="border-right-width: 0px; width: 53mm">(a)
        <span class="styNormalText">
          Name and address
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; width: 32mm">(b)
        <span class="styNormalText">
          Title, and average<br/>hours per week<br/>devoted to position
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; width: 32mm">(c)
        <span class="styNormalText">
          Compensation<br/>
									</span>
        (If not paid, enter<br/>-0-)
      </th>
								<th scope="col" class="styTableCellHeader" style="border-right-width: 0px; border-left-width: 1px; width: 38mm">(d)
        <span class="styNormalText">
          Contributions to<br/>employee benefit plans<br/>and deferred compensation
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="width: 32mm; border-right-width: 0px; border-left-width: 1px">(e)
        <span class="styNormalText">
          Expense account,<br/>other allowances
        </span>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<xsl:if test="($Print != $Separated) or (count($FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee) &lt;5)">
								<xsl:for-each select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee">
									<tr>
										<td class="styLNAmountBox" style="text-align: left; width: 53mm; border-left-width: 0px; font-size: 6pt">
											<xsl:choose>
												<xsl:when test="PersonName != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonName"/>
													</xsl:call-template>
													<span style="width: 2mm"/>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PersonName"/>
														<xsl:with-param name="TabOrder" select="2"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2 != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="BusinessName"/>
														<xsl:with-param name="TabOrder" select="2"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styLNAmountBox" rowspan="2" style="text-align: left">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Title"/>
											</xsl:call-template>
											<xsl:if test="AvgHoursPerWkDevotedToPosition != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AvgHoursPerWkDevotedToPosition"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styLNAmountBox" rowspan="2">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Compensation"/>
											</xsl:call-template>
										</td>
										<td class="styLNAmountBox" rowspan="2" style="width: 38mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ContriToEmplBenefitPlansEtc"/>
											</xsl:call-template>
										</td>
										<td class="styLNAmountBox" rowspan="2" style="border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenseAccountOtherAllowances"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="styLNAmountBox" style="text-align: left; width: 53mm; border-left-width: 0px">
											<xsl:choose>
												<xsl:when test="ForeignAddress !=''">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="(($Print = $Separated) and (count($FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee) &gt;4)) or (count($FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee) = 0)">
								<xsl:call-template name="AddRowsLine1">
									<xsl:with-param name="RowCount" select="0"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
					<!--  Line 1  -->
					<!--  Line 2  -->
					<table class="styTable" style="font-size: 7pt; border-color:black; width: 187mm" cellspacing="0">
						<thead class="styTableTHead">
							<tr>
								<th scope="col" class="styTableCellHeader" colspan="5" style="width: 187mm; border-right-width: 0px; padding-left: 2mm; text-align: left">
        2  <span style="width: 2mm"/> Compensation of five highest-paid employees (other than those included on line 1—see page 23 of the instructions).<br/>
									<span style="width: 5mm"/> If none, enter “NONE.”
        </th>
							</tr>
							<tr scope="col">
								<th scope="col" class="styTableCellHeader" style="border-right-width: 0px; width: 59mm">(a)
        <span class="styNormalText">
          Name and address of each employee paid more than $50,000
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; width: 32mm">(b)
        <span class="styNormalText">
          Title, and average<br/>hours per week<br/>devoted to position
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; width: 32mm">(c)
        <span class="styNormalText">
          Compensation
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width: 0px; border-left-width: 1px; width: 32mm">(d)
        <span class="styNormalText">
          Contributions to<br/>employee benefit<br/>plans and deferred<br/>compensation
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="width: 32mm; border-right-width: 0px; border-left-width: 1px">(e)
        <span class="styNormalText">
          Expense account,<br/>other allowances
        </span>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<xsl:for-each select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/CompensationOfHighestPaidEmpl">
								<tr>
									<td class="styLNAmountBox" style="text-align: left; width: 59mm; border-left-width: 0px">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Name"/>
										</xsl:call-template>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="Name"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBox" rowspan="2" style="text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Title"/>
										</xsl:call-template>
										<xsl:if test="AverageHoursPerWeek != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AverageHoursPerWeek"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styLNAmountBox" rowspan="2">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Compensation"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBox" rowspan="2">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="EmployeeBenefits"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBox" rowspan="2" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ExpenseAccount"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNAmountBox" style="text-align: left; width: 59mm; border-left-width: 0px">
										<xsl:choose>
											<xsl:when test="ForeignAddress !=''">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="ForeignAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="USAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:call-template name="AddRowsLine2">
								<xsl:with-param name="RowCount" select="count($FormData/OfcrDirTrusteesKeyEmployeeInfo/CompensationOfHighestPaidEmpl)"/>
							</xsl:call-template>
							<tr>
								<td class="styTableCell" colspan="4" style="width: 155mm; border-bottom-width: 1px; text-align: left; border-right-width: 0px">
									<span class="styBoldText">Total </span> number of other employees paid over $50,000<span class="styDotLn" style="float: none; clear: none; padding-right: 4mm">...................</span>
									<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
								</td>
								<td class="styLNAmountBox" style="text-align:right; float:none; clear:none">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/TotNumberOfOthEmplPaidOver50k"/>
										<xsl:with-param name="MaxSize" select="6"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!--  Line 2  -->
					<!--  Line 3  -->
					<table class="styTable" style="font-size: 7pt; border-color:black; width: 187mm" cellspacing="0">
						<thead class="styTHead">
							<tr scope="col">
								<tr>
									<th scope="col" class="styTableCellHeader" colspan="5" style="width: 187mm; border-right-width: 0px; padding-left: 2mm; text-align: left">
        3  <span style="width: 2mm"/> Five highest-paid independent contractors for professional services (see page 23 of the instructions). If none, enter "NONE".
        </th>
								</tr>
								<th scope="col" class="styTableCellHeader" style="border-right-width: 0px; width: 91mm">(a)
        <span class="styNormalText">
          Name and address of each person paid more than $50,000
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; width: 64mm">(b)
        <span class="styNormalText">
          Type of service
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; width: 32mm">(c)
        <span class="styNormalText">
          Compensation
        </span>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<xsl:for-each select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/CompensationOfHghstPaidCntrct">
								<tr>
									<td class="styLNAmountBox" style="text-align: left; width: 91mm; border-left-width: 0px">
										<xsl:choose>
											<xsl:when test="PersonName != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonName"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PersonName"/>
													<xsl:with-param name="TabOrder" select="2"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
												</xsl:call-template>
												<xsl:if test="BusinessName/BusinessNameLine2 != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
													</xsl:call-template>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="BusinessName"/>
														<xsl:with-param name="TabOrder" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styLNAmountBox" rowspan="2" style="text-align: left; width: 64mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="TypeOfService"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBox" rowspan="2" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Compensation"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNAmountBox" style="text-align: left; width: 91mm; border-left-width: 0px">
										<xsl:choose>
											<xsl:when test="ForeignAddress !=''">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="ForeignAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="USAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:call-template name="AddRowsLine3">
								<xsl:with-param name="RowCount" select="count($FormData/OfcrDirTrusteesKeyEmployeeInfo/CompensationOfHghstPaidCntrct)"/>
							</xsl:call-template>
						</tbody>
					</table>
					<div class="styBB" style="width: 187mm">
						<span class="styBoldText">Total </span> number of others receiving over $50,000 for professional services<span class="styDotLn" style="float: none; clear: none; padding-right: 5mm">.............</span>
						<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; float:none; clear:none">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/TotNumberOfCntrctPaidOver50k"/>
								<xsl:with-param name="MaxSize" select="6"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 3  -->
					<div class="pageEnd"/>
					<!--  Part IX-A  -->
					<div style="width:187mm;border-top-width: 0px; height: 8mm" class="styBB">
						<div class="styPartName" style="width:18mm; margin-top: 2mm; margin-bottom: 2mm">Part IX-A</div>
						<div class="styPartDesc" style="padding-top: 2mm;width:169mm">
    Summary of Direct Charitable Activities 
  </div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 100%; border-bottom-width: 0px">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead class="styTHead">
								<tr scope="col">
									<th scope="col" colspan="2" class="styTableCellHeader" style="border-right-width: 0px; width: 155mm; text-align: left; font-size: 6pt">
										<span class="styNormalText">
          List the foundation’s four largest direct charitable activities during the tax year. Include relevant statistical information such as the number
                                 of organizations and other beneficiaries served, conferences convened, research papers produced, etc.
        </span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; width: 32mm">
										<span class="styNormalText">
          Expenses
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:choose>
									<xsl:when test="count($FormData/SummaryOfDirectCharitableActy/Expenses1)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">1</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="border-right-width:0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Expenses1"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">1</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Description1"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Expenses1"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="count($FormData/SummaryOfDirectCharitableActy/Expenses2)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">2</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Expenses2"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">2</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Description2"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Expenses2"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="count($FormData/SummaryOfDirectCharitableActy/Expenses3)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">3</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Expenses3"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">3</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Description3"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Expenses3"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="count($FormData/SummaryOfDirectCharitableActy/Expenses4)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">4</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Expenses4"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">4</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Description4"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectCharitableActy/Expenses4"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<!--  Part IX-A  -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">7</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--  Part IX-B  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width:18mm">Part IX-B</div>
						<div class="styPartDesc" style="width:169mm">
    Summary of Program-Related Investments <span class="styNormalText"> (see page 23 of the instructions)</span>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 100%; border-bottom-width: 0px">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead class="styTHead">
								<tr scope="col">
									<th scope="col" colspan="2" class="styTableCellHeader" style="border-right-width: 0px; width: 155mm; text-align: left; font-size: 6pt; padding-left: 4mm">
										<span class="styNormalText">
          Describe the two largest program-related investments made by the foundation during the tax year on lines 1 and 2.
        </span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; width: 32mm">
										<span class="styNormalText">
          Amount
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:choose>
									<xsl:when test="count($FormData/SumOfProgramRelatedInvestments/Description1)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">1</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvestments/Amount1"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">1</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvestments/Description1"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvestments/Amount1"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="count($FormData/SumOfProgramRelatedInvestments/Description2)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">2</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvestments/Amount2"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">2</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvestments/Description2"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvestments/Amount2"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<tr>
									<td class="styLNAmountBox" colspan="2" style=";padding-left:4mm; border-bottom-width: 0px; text-align:left; width: 155mm; border-left-width: 0px">All other program-related investments. See page 24 of the instructions.</td>
									<td class="styLNAmountBox" style="border-right-width:0px; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="count($FormData/SumOfProgramRelatedInvestments/AllOthProgRltdInvestmentsTotal)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">3</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvestments/AllOthProgRltdInvestmentsTotal"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styBoldText">3</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvestments/AllOthProgRltdInvestmentsTotal"/>
													<xsl:with-param name="TabOrder" select="2"/>
												</xsl:call-template>
												<span style="width: 1px"/>
											</td>
											<td class="styLNAmountBox" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvestments/AllOthProgRltdInvestmentsTotal"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<div class="styBB" style="width: 187mm">
						<span class="styBoldText">Total.</span> Add lines 1 through 3<span class="styDotLn" style="float: none; clear: none;padding-right: 4mm">...........................</span>
						<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
						<span style="width: 3mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; padding-left:1mm; float:none; clear:none">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvestments/Total"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Part IX-B  -->
					<!--  Part X  -->
					<div style="width:187mm;border-top-width: 0px" class="styBB">
						<div class="styPartName">Part X</div>
						<div class="styPartDesc">
    Minimum Investment Return <span class="styNormalText"> (All domestic foundations must complete this part. Foreign foundations,<br/>see page 24 of the instructions.)</span>
						</div>
					</div>
					<!--  Line 1  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">1</div>
						<div class="styLNDesc" style="width: 139mm">Fair market value of assets not used (or held for use) directly in carrying out charitable, etc.,</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px; background-color: lightgrey"/>
						<div class="styLNAmountBox" style="border-right-width:0px; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-right: 2mm"/>
						<div class="styLNDesc" style="width: 139mm">purposes:</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px; background-color: lightgrey"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px"/>
					</div>
					<!--  Line 1a  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Average monthly fair market value of securities</span>
							<span class="styDotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">1a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/AvgMonthlyFMVOfSecurities"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1a  -->
					<!--  Line 1b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Average of monthly cash balances</span>
							<span class="styDotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">1b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/AvgMonthlyCashBalances"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<!--  Line 1c  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Fair market value of all other assets (see page 24 of the instructions)</span>
							<span class="styDotLn">............</span>
						</div>
						<div class="styLNRightNumBox">1c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/FMVAllOtherNoncharitableAssets"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c  -->
					<!--  Line 1d  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">d</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">
								<span class="styBoldText">Total</span> (add lines 1a, b, and c)</span>
							<span class="styDotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">1d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/TotalFMVOfUnusedAssets"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1d  -->
					<!--  Line 1e  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">e</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Reduction claimed for blockage or other factors reported on lines 1a and</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 99mm">
							<span style="float:left; clear: none">1c (attach detailed explanation)
    <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/ReductionClaimed"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">1e</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/ReductionClaimed"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- Line 1e  -->
					<!--  Line 2  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">2</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Acquisition indebtedness applicable to line 1 assets</span>
							<span class="styDotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/AcquisitionIndebtedness"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2  -->
					<!--  Line 3  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">3</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Subtract line 2 from line 1d</span>
							<span class="styDotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/AdjTotalFMVOfUnusedAssets"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3  -->
					<!--  Line 4 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">4</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Cash deemed held for charitable activities. Enter 1 1⁄2% of line 3 (for greater amount, see page 25</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none"> of the instructions)
    <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/CashDeemedCharitable"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn">............................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/CashDeemedCharitable"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4  -->
					<!--  Line 5  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">5</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">
								<span class="styBoldText">Net value of noncharitable-use assets. </span> Subtract line 4 from line 3. Enter here and on Part V, line 4</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/NetNoncharitableAssets"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5  -->
					<!--  Line 6  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">6</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">
								<span class="styBoldText">Minimum investment return. </span> Enter 5% of line 5</span>
							<span class="styDotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px">6</div>
						<div class="styLNAmountBox" style="border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturn/MinimumInvestmentReturn"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6  -->
					<!--  Part XI  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="margin-top: 1.75mm; margin-bottom:1.5mm">Part XI</div>
						<div class="styPartDesc">Distributable Amount 
    <span class="styNormalText">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/Sect4942j3j5FndtnAndFrgnOrg"/>
										<xsl:with-param name="BackupName">IRS990PFSect4942j3j5FndtnAndFrgnOrg</xsl:with-param>
									</xsl:call-template> (see page 25 of the instructions) (Section 4942(j)(3) and (j)(5) private operating foundations and certain foreign organizations check here </label>
								<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styIRS990PFCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/Sect4942j3j5FndtnAndFrgnOrg"/>
										<xsl:with-param name="BackupName">IRS990PFSect4942j3j5FndtnAndFrgnOrg</xsl:with-param>
									</xsl:call-template>
								</input> and do not complete this part.)
    </span>
						</div>
					</div>
					<!--  Line 1  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">1</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Minimum investment return from Part X, line 6</span>
							<span class="styDotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/MinimumInvestmentReturn"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1  -->
					<!--  Line 2a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">2a</div>
						<div class="styLNDesc" style="width: 99mm">
							<span style="float:left; clear: none">Tax on investment income for 2010 from Part VI, line 5</span>
							<span class="styDotLn">......</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/TaxBasedOnInvestmentIncome"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style=" border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- Line 2a  -->
					<!--  Line 2b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 99mm">
							<span style="float:left; clear: none">Income tax for 2010. (This does not include the tax from Part VI.)</span>
							<span class="styDotLn">...</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/IncomeTaxForThisYear"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- Line 2b  -->
					<!--  Line 2c  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Add lines 2a and 2b</span>
							<span class="styDotLn">............................</span>
						</div>
						<div class="styLNRightNumBox">2c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/TotalTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2c  -->
					<!--  Line 3  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">3</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Distributable amount before adjustments. Subtract line 2c from line 1</span>
							<span class="styDotLn">............</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/DistributableAmountBeforeAdj"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3  -->
					<!--  Line 4  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">4</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Recoveries of amounts treated as qualifying distributions</span>
							<span class="styDotLn">................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/RecoveriesQlfyDistributions"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4  -->
					<!--  Line 5 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">5</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Add lines 3 and 4</span>
							<span class="styDotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/DistributableAmountBeforeDed"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5  -->
					<!--  Line 6  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">6</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Deduction from distributable amount (see page 25 of the instructions)</span>
							<span class="styDotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/DeductionFrDistributableAmount"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6  -->
					<!--  Line 7  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">7</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">
								<span class="styBoldText">Distributable amount </span>as adjusted. Subtract line 6 from line 5. Enter here and on Part XIII,</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">line 1</span>
							<span class="styDotLn">.................................</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px">7</div>
						<div class="styLNAmountBox" style="border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmount/DistributableAmountAsAdjusted"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<!--  Part XII  -->
					<div style="width:187mm;border-top-width: 1px; height: 8mm" class="styBB">
						<div class="styPartName" style="margin-top: 2.5mm; margin-bottom:1.5mm">Part XII</div>
						<div class="styPartDesc" style="margin-top: 2.5mm; margin-bottom:1.5mm">
    Qualifying Distributions <span class="styNormalText"> (see page 25 of the instructions)</span>
						</div>
					</div>
					<!--  Line 1  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">1</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Amounts paid (including administrative expenses) to accomplish charitable, etc., purposes:</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- Line 1  -->
					<!--  Line 1a  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Expenses, contributions, gifts, etc.—total from Part I, column (d), line 26
    <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistributions/ExpensesAndContributions"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">1a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistributions/ExpensesAndContributions"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1a  -->
					<!--  Line 1b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Program-related investments—total from Part IX-B</span>
							<span class="styDotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">1b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistributions/ProgramRelatedInvestmentsTotal"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b  -->
					<!--  Line 2  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">2</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Amounts paid to acquire assets used (or held for use) directly in carrying out charitable, etc.,</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">purposes</span>
							<span class="styDotLn">................................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistributions/AmountsPaidAcqCharitableAssets"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<!--  Line 3  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">3</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Amounts set aside for specific charitable projects that satisfy the:</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- Line 3  -->
					<!--  Line 3a  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Suitability test (prior IRS approval required)</span>
							<span class="styDotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">3a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistributions/AmountsSetAsideSuitabilityTest"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a  -->
					<!--  Line 3b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Cash distribution test (attach the required schedule)
    <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistributions/AmountsSetAsideCashDistriTest"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">3b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistributions/AmountsSetAsideCashDistriTest"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3b  -->
					<!--  Line 4  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">4</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">
								<span class="styBoldText">Qualifying distributions. </span> Add lines 1a through 3b. Enter here and on Part V, line 8, and Part XIII, line 4</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistributions/QualifyingDistributions"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4  -->
					<!--  Line 5 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">5</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Foundations that qualify under section 4940(e) for the reduced rate of tax on net investment</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">income. Enter 1% of Part I, line 27b (see page 26 of the instructions)</span>
							<span class="styDotLn">............</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistributions/OnePctSect4940eOrgNetInvstIncm"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<!--  Line 6  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">6</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">
								<span class="styBoldText">Adjusted qualifying distributions. </span> Subtract line 5 from line 4</span>
							<span class="styDotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistributions/AdjQualifyingDistributions"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6  -->
					<!--  Note  -->
					<div class="styBB" style="padding-left: 8mm; width: 187mm">
						<span class="styBoldText">Note: </span>
						<!--						<span class="styItalicText">The amount on line 6 will be used in Part V, column (b), in subsequent years when calculating whether the foundation
         qualifies for the<span style="width: 7mm"/> section 4940(e) reduction of tax in those years.</span>  -->
 					The amount on line 6 will be used in Part V, column (b), in subsequent years when calculating whether the foundation
         				qualifies for<br/>
						<span style="width: 8mm"/> the section 4940(e) reduction of tax in those years.
					</div>
					<!-- Note  -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">8</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--  Part XIII  -->
					<div style="width:187mm;border-top-width: 1px; border-bottom-width: 0px; height: 3mm" class="styBB">
						<div class="styPartName" style="width: 20mm">Part XIII</div>
						<div class="styPartDesc" style="width: 160mm">Undistributed Income <span class="styNormalText"> (see page 26 of the instructions)</span>
						</div>
					</div>
					<div class="styTableContainer" style="border-top-width: 1px; width: 187mm; height: 100%">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" colspan="2" style="width: 75mm; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px">
										<span class="styTableCellPad"/>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 28mm">
        (a)<br/>
										<span class="styNormalText">Corpus</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 28mm">
        (b)<br/>
										<span class="styNormalText">Years prior to 2009</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 28mm">
        (c)<br/>
										<span class="styNormalText">2009</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 28mm; border-right-width: 0px">
        (d)<br/>
										<span class="styNormalText">2010</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">1</span>
										<span style="width: 2mm"/>
         Distributable amount for 2010 from Part XI, line 7</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/DistributableAmountAsAdjusted"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">2</span>
										<span style="width: 2mm"/>
         Undistributed income, if any, as of the end of 2010:</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">a</span>
										<span style="width: 1.5mm"/>
         Enter amount for 2009 only<span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/UndistributedIncomePriorYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">b</span>
										<span style="width: 1.5mm"/>
         Total for prior years:<span style="width: 2mm"/>
										<xsl:choose>
											<xsl:when test="$FormData/UndistributedIncome/PriorYear1 != ''">
												<span style="width: 2mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/PriorYear1"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 5mm"/>
											</xsl:otherwise>
										</xsl:choose>
										<span style="width: 1mm"/>,
          <xsl:choose>
											<xsl:when test="$FormData/UndistributedIncome/PriorYear2 != ''">
												<span style="width: 2mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/PriorYear2"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 5mm"/>
											</xsl:otherwise>
										</xsl:choose>
										<span style="width: 1mm"/>,
        <xsl:choose>
											<xsl:when test="$FormData/UndistributedIncome/PriorYear3 != ''">
												<span style="width: 2mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/PriorYear3"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 5mm"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/TotalForPriorYears"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">3</span>
										<span style="width: 2mm"/>
         Excess distributions carryover, if any, to 2010:</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2.5mm">a</span>
										<span style="width: 1.5mm"/>
         From 2005<span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessDistriCarryoverYear5"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2.5mm">b</span>
										<span style="width: 1.5mm"/>
         From 2006<span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessDistriCarryoverYear4"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2.5mm">c</span>
										<span style="width: 1.5mm"/>
         From 2007<span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessDistriCarryoverYear3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2.5mm">d</span>
										<span style="width: 1.5mm"/>
         From 2008<span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessDistriCarryoverYear2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2.5mm">e</span>
										<span style="width: 1.5mm"/>
         From 2009<span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessDistriCarryoverYear1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">f<span style="width: 2mm"/>Total</span>
         of lines 3a through e<span class="styDotLn" style="float:none; clear:none">.........</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/TotalExcessDistriCarryover"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">4</span>
										<span style="width: 2mm"/>Qualifying distributions for 2010 from Part</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span style="width: 5.5mm"/>
         XII, line 4: <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 2mm"/>$ <span class="styIRS990PFUnderlinedText" style="text-align: right; width: 32mm; font-size: 6pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/QualifyingDistributions"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">a</span>
										<span style="width: 1mm"/>
         Applied to 2009, but not more than line 2a</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/AppliedToYear1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">b</span>
										<span style="width: 1mm"/>
         Applied to undistributed income of prior years
          <br/>
										<span style="width: 5.5mm"/>(Election required—see page 26 of the instructions)</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top:3mm; font-size: 6pt">
										<span style="padding-right: 4mm">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/AppliedToPriorYears"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/AppliedToPriorYears"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">c</span>
										<span style="width: 1mm"/>
         Treated as distributions out of corpus (Election<br/>
										<span style="width: 6mm"/>required—see page 26 of the instructions)<span class="styDotLn" style="float:none; clear:none">...</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 3mm; font-size: 6pt">
										<span style="padding-right: 4mm">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/TreatedAsDistriFromCorpus"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/TreatedAsDistriFromCorpus"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">d</span>
										<span style="width: 1mm"/>
         Applied to 2010 distributable amount<span class="styDotLn" style="float:none; clear:none">.....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0p; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/AppliedToCurrentYear"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">e</span>
										<span style="width: 1mm"/>
         Remaining amount distributed out of corpus</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/RemainingDistriFromCorpus"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">5</span>
										<span style="width: 2mm"/>
         Excess distributions carryover applied to 2010.</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessDistriCyovAppCYCorpus"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessDistriCyovAppliedCY"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styItalicText" style="padding-left: 6mm">(If an amount appears in column (d), the <br/>
											<span style="width: 6mm"/>
        same amount must be shown in column (a).)</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">6<span style="width: 3mm"/>Enter the net total of each column as<br/>
											<span style="width: 6mm"/>
          indicated below:</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">a</span>
										<span style="width: .5mm"/>
         Corpus. Add lines 3f, 4c, and 4e. Subtract line 5</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/TotalCorpus"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">b</span>
										<span style="width: .5mm"/>
         Prior years’ undistributed income. Subtract<br/>
										<span style="width: 5.5mm"/>line 4b from line 2b
         <span class="styDotLn" style="float:none; clear:none">...........</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/PriorYearUndistributedIncome"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">c</span>
										<span style="width: 1mm"/>
         Enter the amount of prior years’ undistributed<br/>
										<span style="width: 5.5mm"/>
         income for which a notice of deficiency has<br/>
										<span style="width: 5.5mm"/>
         been issued, or on which the section 4942(a)<br/>
										<span style="width: 5.5mm"/>
         tax has been previously assessed<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/PriorYearDeficiencyOrTax"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">d</span>
										<span style="width: 1mm"/>
         Subtract line 6c from line 6b. Taxable<br/>
										<span style="width: 5.5mm"/>amount—see page 27 of the instructions
         <span class="styDotLn" style="float:none; clear:none">...</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/TaxableAmount1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">e</span>
										<span style="width: 1mm"/>
         Undistributed income for 2009. Subtract line<br/>
										<span style="width: 5.5mm"/>4a from line 2a. Taxable amount—see page 27
         <br/>
										<span style="width: 5.5mm"/>of the instructions
         <span class="styDotLn" style="float:none; clear:none">...........</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/TaxableAmount2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">f</span>
										<span style="width: 1mm"/>
         Undistributed income for 2010. Subtract<br/>
										<span style="width: 5.5mm"/>lines 4d and 5 from line 1. This amount must
         <br/>
										<span style="width: 5.5mm"/>be distributed in 2011
         <span class="styDotLn" style="float:none; clear:none">..........</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px; padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/UndistributedIncomeCY"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2mm">7</span>
										<span style="width: 1mm"/>
         Amounts treated as distributions out of<br/>
										<span style="width: 5.5mm"/>corpus to satisfy requirements imposed by
         <br/>
										<span style="width: 5.5mm"/>section 170(b)(1)(F) or 4942(g)(3) (see page 27
         <br/>
										<span style="width: 5.5mm"/>of the instructions)
         <span class="styDotLn" style="float:none; clear:none">...........</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/DistriFromCorpus170b1EOr4942g3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2mm">8</span>
										<span style="width: 2mm"/>Excess distributions carryover from 2005 not
         <br/>
										<span style="width: 5.5mm"/>applied on line 5 or line 7 (see page 27 of the
         <br/>
										<span style="width: 5.5mm"/>instructions)
         <span class="styDotLn" style="float:none; clear:none">.............</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessDistriCyovFromYear5"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2mm">9<span style="width: 2mm"/>Excess distributions carryover to 2011.</span>
										<br/>
										<span style="width: 5.5mm"/>Subtract lines 7 and 8 from line 6a
         <span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessDistriCyovToNextYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText">10</span>
										<span style="width: 2mm"/>
         Analysis of line 9:</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2.5mm">a</span>
										<span style="width: 1.5mm"/>
         Excess from 2006<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessFromYear4"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2.5mm">b</span>
										<span style="width: 1.5mm"/>
         Excess from 2007<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessFromYear3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2.5mm">c</span>
										<span style="width: 1.5mm"/>
         Excess from 2008<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessFromYear2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2.5mm">d</span>
										<span style="width: 1.5mm"/>
         Excess from 2009<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessFromYear1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 2.5mm">e</span>
										<span style="width: 1.5mm"/>
         Excess from 2010<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncome/ExcessFromCurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">9</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--  Part XIV  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm">Part XIV</div>
						<div class="styPartDesc" style="width: 160mm">
    Private Operating Foundations <span class="styNormalText"> (see page 27 of the instructions and Part VII-A, question 9)</span>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNDesc" style="text-align:left; width: 131mm">
							<span class="styBoldText">1a</span>
							<span style="width: 2mm"/>
     If the foundation has received a ruling or determination letter that it is a private operating<br/>
							<span style="width: 6mm"/>
    foundation, and the ruling is effective for 2010, enter the date of the ruling<span class="styDotLn" style="float:none; clear:none">.......</span>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
						</div>
						<div class="styLNAmountBox" style="width: 56mm; border-right-width: 0px; height: 6mm; padding-top: 2mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/DateOfRuling"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNDesc" style="text-align:left; width: 187mm">
							<span class="styBoldText" style="padding-left: 2mm">b</span>
							<span style="width: 1.5mm"/>
     Check box to indicate whether the organization is a private operating foundation described in section<span style="width: 1mm"/>
							<input type="checkbox" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/Section4942j3"/>
									<xsl:with-param name="BackupName">IRS990PFSection4942j3</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/Section4942j3"/>
									<xsl:with-param name="BackupName">IRS990PFSection4942j3</xsl:with-param>
								</xsl:call-template>4942(j)(3)</label> or<span style="width: 2mm"/>
							<input type="checkbox" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/Section4942j5"/>
									<xsl:with-param name="BackupName">IRS990PFSection4942j5</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 1mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/Section4942j5"/>
									<xsl:with-param name="BackupName">IRS990PFSection4942j5</xsl:with-param>
								</xsl:call-template>4942(j)(5)</label>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 100%; border-bottom-width: 0px">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styTableCell" rowspan="3" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText">2a</span>
										<span style="width: 2mm"/>
         Enter the lesser of the adjusted net<br/>
										<span style="width: 6mm"/>
         income from Part I or the minimum<br/>
										<span style="width: 6mm"/>investment return from Part X for each<br/>
										<span style="width: 6mm"/>year listed
         <span class="styDotLn" style="float:none; clear:none">..........</span>
									</td>
									<td class="styTableCellSmall" style="text-align: center; border-top-width: 1px">Tax year</td>
									<td class="styTableCellSmall" colspan="3" style="text-align: center; border-top-width:1px; width: 75mm">Prior 3 years</td>
									<td class="styTableCellSmall" rowspan="2" style="text-align: center; border-top-width: 1px; border-right-width: 0px; padding-top: 2mm">
										<span class="styBoldText">(e) Total</span>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align: center">
										<span class="styBoldText">(a)</span> 2010</td>
									<td class="styTableCellSmall" style="text-align: center">
										<span class="styBoldText">(b)</span> 2009</td>
									<td class="styTableCellSmall" style="text-align: center">
										<span class="styBoldText">(c)</span> 2008</td>
									<td class="styTableCellSmall" style="text-align: center">
										<span class="styBoldText">(d)</span> 2007</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/LessorAdjNetIncmMinInvstReturn/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/LessorAdjNetIncmMinInvstReturn/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/LessorAdjNetIncmMinInvstReturn/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/LessorAdjNetIncmMinInvstReturn/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/LessorAdjNetIncmMinInvstReturn/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 1.5mm">b</span>
										<span style="width: 2mm"/>
         85% of line 2a
         <span class="styDotLn" style="float:none; clear:none">.........</span>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/Percent85OfLessor/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/Percent85OfLessor/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/Percent85OfLessor/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/Percent85OfLessor/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/Percent85OfLessor/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 1.5mm">c</span>
										<span style="width: 2mm"/>
         Qualifying distributions from Part XII,<br/>
										<span style="width: 6mm"/>line 4 for each year listed
         <span class="styDotLn" style="float:none; clear:none">.....</span>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QualifyingDistributions/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QualifyingDistributions/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QualifyingDistributions/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QualifyingDistributions/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QualifyingDistributions/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="font-size: 6pt; text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="font-size: 7pt; padding-left: 1.5mm">d</span>
										<span style="width: 2mm"/>
         Amounts included in line 2c not used directly<br/>
										<span style="width: 6mm"/>for active conduct of exempt activities
         <span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="padding-top: 2mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QlfyDistriNotUsedDirectly/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 2mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QlfyDistriNotUsedDirectly/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 2mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QlfyDistriNotUsedDirectly/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 2mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QlfyDistriNotUsedDirectly/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 2mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QlfyDistriNotUsedDirectly/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 1.5mm">e</span>
										<span style="width: 2mm"/>
         Qualifying distributions made directly<br/>
										<span style="width: 6mm"/>for active conduct of exempt activities.<br/>
										<span style="width: 6mm"/>Subtract line 2d from line 2c
         <span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QlfyDistriMadeDirectly/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QlfyDistriMadeDirectly/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QlfyDistriMadeDirectly/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QlfyDistriMadeDirectly/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/QlfyDistriMadeDirectly/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText">3</span>
										<span style="width: 2mm"/>
         Complete 3a, b, or c for the<br/>
										<span style="width: 6mm"/>alternative test relied upon:
         </td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 1.5mm">a</span>
										<span style="width: 2mm"/>
         “Assets” alternative test—enter:</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 6mm">(1)</span>
										<span style="width: 1mm"/>
         Value of all assets
         <span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalAssets/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalAssets/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalAssets/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalAssets/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalAssets/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 6mm">(2)</span>
										<span style="width: 1mm"/>
         Value of assets qualifying<br/>
										<span style="width: 12mm"/>under section 4942(j)(3)(B)(i)</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalAssetsSect4942j3Bi/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalAssetsSect4942j3Bi/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalAssetsSect4942j3Bi/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalAssetsSect4942j3Bi/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalAssetsSect4942j3Bi/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 1.5mm">b</span>
										<span style="width: 2mm"/>
        “Endowment” alternative test— enter 2⁄3<br/>
										<span style="width: 6mm"/>
        of minimum investment return shown in<br/>
										<span style="width: 6mm"/>
        Part X, line 6 for each year listed<span class="styDotLn" style="float:none; clear:none">...</span>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TwoThirdsMinInvstReturn/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TwoThirdsMinInvstReturn/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TwoThirdsMinInvstReturn/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TwoThirdsMinInvstReturn/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TwoThirdsMinInvstReturn/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 1.5mm">c</span>
										<span style="width: 2mm"/>
         “Support” alternative test—enter:</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 6mm">(1)</span>
										<span style="width: 1mm"/>
         Total support other than gross<br/>
										<span style="width: 12mm"/>investment income (interest,<br/>
										<span style="width: 12mm"/>
         dividends, rents, payments<br/>
										<span style="width: 12mm"/>on securities loans (section<br/>
										<span style="width: 12mm"/>512(a)(5)), or royalties)
         <span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="padding-top: 12mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalSupport/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 12mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalSupport/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 12mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalSupport/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 12mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalSupport/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 12mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/TotalSupport/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 6mm">(2)</span>
										<span style="width: 1mm"/>
         Support from general public<br/>
										<span style="width: 12mm"/>and 5 or more exempt<br/>
										<span style="width: 12mm"/>
         organizations as provided in<br/>
										<span style="width: 12mm"/>section 4942(j)(3)(B)(iii)<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/PublicSupport/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/PublicSupport/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/PublicSupport/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/PublicSupport/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px;  padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/PublicSupport/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 6mm">(3)</span>
										<span style="width: 1mm"/>
         Largest amount of support<br/>
										<span style="width: 12mm"/>from an exempt organization</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/LargestSupportFromEO/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/LargestSupportFromEO/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/LargestSupportFromEO/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/LargestSupportFromEO/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/LargestSupportFromEO/Total"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 6mm">(4)</span>
										<span style="width: 1mm"/>
         Gross investment income</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/GrossInvestmentIncome/CurrentYear"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/GrossInvestmentIncome/Year1"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/GrossInvestmentIncome/Year2"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/GrossInvestmentIncome/Year3"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; border-bottom-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundations/GrossInvestmentIncome/Total"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  Part XV  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName">Part XV</div>
						<div class="styPartDesc">
    Supplementary Information (Complete this part only if the organization had $5,000 or more in<br/>
    assets at any time during the year—see page 27 of the instructions.)  
  </div>
					</div>
					<!--  Line 1a  -->
					<div style="text-align:left; width: 187mm">
						<span class="styBoldText">1</span>
						<span style="width: 4.5mm"/>
						<span class="styBoldText">Information Regarding Foundation Managers:</span>
					</div>
					<div style="text-align:left; width: 187mm">
						<span class="styBoldText" style="padding-left:2mm">a</span>
						<span style="width: 2mm"/>List any managers of the foundation who have contributed more than 2% of the total contributions     received by the foundation<br/>
						<span style="width: 6mm"/>
    before the close of any tax year (but only if they have contributed more than $5,000). (See section 507(d)(2).)
   </div>
					<div class="styGenericDiv" style="width:187mm">
						<div style="float:right">
							<xsl:call-template name="SetTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/ContributingManager"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="containerID" select="'1aCMctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 14mm" id="1aCMctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt">
							<tbody>
								<xsl:call-template name="SetInitialState"/>
								<xsl:if test="($Print != $Separated) or (count($FormData/SupplementaryInformation/ContributingManager) &lt;2)">
									<xsl:for-each select="$FormData/SupplementaryInformation/ContributingManager">
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">width: 187mm; padding-left: 6mm; border-bottom-width: 0px</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformation/ContributingManager) &gt;1)">
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; border-bottom-width: 0px">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/ContributingManager"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!--  Line 1a  -->
					<!--  Line 1b  -->
					<div style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
						<span class="styBoldText" style="padding-left:2mm">b</span>
						<span style="width: 2mm"/>List any managers of the foundation who own 10% or more of the stock of a corporation (or an       equally large portion of the<br/>
						<span style="width: 6mm"/>
    ownership of a partnership or other entity) of which the foundation has a 10% or greater interest.
   </div>
					<div class="styGenericDiv" style="width:187mm">
						<div style="float:right">
							<xsl:call-template name="SetTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/ShareholderManager"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="containerID" select="'1bSMctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 14mm" id="1bSMctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt">
							<tbody>
								<xsl:call-template name="SetInitialState"/>
								<xsl:if test="($Print != $Separated) or (count($FormData/SupplementaryInformation/ShareholderManager) &lt;2)">
									<xsl:for-each select="$FormData/SupplementaryInformation/ShareholderManager">
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">width: 187mm; padding-left: 6mm; border-bottom-width: 0px</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformation/ShareholderManager) &gt;1)">
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; border-bottom-width: 0px">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/ShareholderManager"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!--  Line 1b  -->
					<!--  Line 2  -->
					<div style="text-align:left; width: 187mm; padding-bottom:1mm">
						<span class="styBoldText">2</span>
						<span style="width: 4.5mm"/>
						<span class="styBoldText">Information Regarding Contribution, Grant, Gift, Loan, Scholarship, etc., Programs:</span>
					</div>
					<div class="styBB" style="text-align:left; width: 187mm; padding-bottom:1.5mm">
						<span style="width: 6mm"/>Check here <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
						<input type="checkbox" class="styIRS990PFCkBox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/OnlyContributesToPreselected"/>
								<xsl:with-param name="BackupName">IRS990PFOnlyContributesToPreselected</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/OnlyContributesToPreselected"/>
								<xsl:with-param name="BackupName">IRS990PFOnlyContributesToPreselected</xsl:with-param>
							</xsl:call-template>
   if the foundation only makes contributions to preselected charitable organizations and does not accept<br/>
							<span style="width: 6mm"/>
  unsolicited requests for funds. If the foundation makes gifts, grants, etc. (see page 28 of the instructions) to individuals or organizations<br/>
							<span style="width: 6mm"/>
  under other conditions, complete items 2a, b, c, and d.</label>
					</div>
					<!--  Line 2  -->
					<!--  Line 2a  - 2d   -->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float:right">
							<xsl:call-template name="SetTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/AppicationSubmissionInfo"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="containerID" select="'2aASctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 50mm" id="2aASctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt">
							<tbody>
								<xsl:call-template name="SetInitialState"/>
								<xsl:if test="($Print != $Separated) or (count($FormData/SupplementaryInformation/AppicationSubmissionInfo) &lt;2)">
									<xsl:for-each select="$FormData/SupplementaryInformation/AppicationSubmissionInfo">
										<tr>
											<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
												<span class="styBoldText" style="padding-left:2mm">a</span>
												<span style="width: 2mm"/>The name, address, and telephone number of the person to whom applications should be addressed:</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientName"/>
												</xsl:call-template>
												<xsl:if test="count(RecipientUSAddress) &gt;0">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="RecipientUSAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientForeignAddress) &gt;0">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="RecipientForeignAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientPhoneNumber) &gt;0">
													<br/>
													<xsl:call-template name="PopulatePhoneNumber">
														<xsl:with-param name="TargetNode" select="RecipientPhoneNumber"/>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
										<!--  Line 2a  -->
										<!--  Line 2b  -->
										<tr>
											<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px">
												<span class="styBoldText" style="padding-left:2mm">b</span>
												<span style="width: 2mm"/>The form in which applications should be submitted and information and materials they should include:</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FormAndInfoAndMaterials"/>
												</xsl:call-template>
											</td>
										</tr>
										<!--  Line 2b  -->
										<!--  Line 2c  -->
										<tr>
											<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
												<span class="styBoldText" style="padding-left:2mm">c</span>
												<span style="width: 2mm"/>Any submission deadlines:</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SubmissionDeadlines"/>
												</xsl:call-template>
											</td>
										</tr>
										<!--  Line 2c  -->
										<!--  Line 2d  -->
										<tr>
											<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
												<span class="styBoldText" style="padding-left:2mm">d</span>
												<span style="width: 2mm"/>Any restrictions or limitations on awards, such as by geographical areas, charitable fields, kinds of institutions, or other
          <br/>
												<span style="width: 6mm"/>factors:</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">width: 187mm; padding-left: 6mm; border-bottom-width: 0px</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RestrictionsOnAwards"/>
												</xsl:call-template>
											</td>
										</tr>
										<!--  Line 2d  -->
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/SupplementaryInformation/AppicationSubmissionInfo)=0) or (($Print = $Separated) and (count($FormData/SupplementaryInformation/AppicationSubmissionInfo) &gt;1))">
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
											<span class="styBoldText" style="padding-left:2mm">a</span>
											<span style="width: 2mm"/>The name, address, and telephone number of the person to whom applications should be addressed:</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; padding-top: 4mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/AppicationSubmissionInfo/RecipientName"/>
											</xsl:call-template>
										</td>
									</tr>
									<!--  Line 2a  -->
									<!--  Line 2b  -->
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; padding-top: 1mm">
											<span class="styBoldText" style="padding-left:2mm">b</span>
											<span style="width: 2mm"/>The form in which applications should be submitted and information and materials they should include:</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; padding-top: 4mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/AppicationSubmissionInfo/FormAndInfoAndMaterials"/>
											</xsl:call-template>
										</td>
									</tr>
									<!--  Line 2b  -->
									<!--  Line 2c  -->
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm; padding-top: 1mm">
											<span class="styBoldText" style="padding-left:2mm">c</span>
											<span style="width: 2mm"/>Any submission deadlines:</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; padding-top: 4mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/AppicationSubmissionInfo/SubmissionDeadlines"/>
											</xsl:call-template>
										</td>
									</tr>
									<!--  Line 2c  -->
									<!--  Line 2d  -->
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm; padding-top: 1mm">
											<span class="styBoldText" style="padding-left:2mm">d</span>
											<span style="width: 2mm"/>Any restrictions or limitations on awards, such as by geographical areas, charitable fields, kinds of institutions, or other
          <br/>
											<span style="width: 6mm"/>factors:</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; border-bottom-width: 0px;padding-top:5mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/AppicationSubmissionInfo/RestrictionsOnAwards"/>
											</xsl:call-template>
										</td>
									</tr>
									<!--  Line 2d  -->
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!--  Line 2  -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm;">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">10</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--  Part XV  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName">Part XV</div>
						<div class="styPartDesc" style="width: 160mm">
    Supplementary Information<span class="styNormalText"> (continued) </span>
						</div>
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear"/>
								<xsl:with-param name="containerHeight" select="9"/>
								<xsl:with-param name="headerHeight" select="3"/>
								<xsl:with-param name="containerID" select="'Paidctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainerNBB" style="width: 187mm; height: 66mm; border-bottom-width: 0px" id="Paidctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" colspan="5" style="text-align: left; height: 4mm; width: 187mm; border-right-width: 0px">
										<span class="styPartDesc" style="padding-left: 0px">3 Grants and Contributions Paid During the Year or Approved for Future Payment</span>
									</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 55mm">
										<span class="styNormalText">
          Recipient
        </span>
									</th>
									<th scope="col" class="styTableCellHeader" rowspan="2" style="height: 4mm; width: 40mm">
										<span class="styNormalText">
          If recipient is an individual,<br/>
          show any relationship to<br/>
          any foundation manager<br/>
          or substantial contributor<br/>
										</span>
									</th>
									<th scope="col" class="styTableCellHeader" rowspan="2" style="height: 4mm; width: 20mm">
										<span class="styNormalText">
          Foundation<br/>
          status of<br/>
          recipient
        </span>
									</th>
									<th scope="col" class="styTableCellHeader" rowspan="2" style="height: 4mm; width: 40mm">
										<span class="styNormalText">
          Purpose of grant or<br/>
          contribution
        </span>
									</th>
									<th scope="col" class="styTableCellHeader" rowspan="2" style="height: 4mm; width: 32mm; border-right-width: 0px">
										<span class="styNormalText">
          Amount
        </span>
									</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 55mm">
										<span class="styNormalText">
          Name and address (home or business)
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styTableCell" style="border-bottom-width: 0px; text-align:left; width: 55mm">
										<span class="styBoldText">a</span>
										<span style="width: 2mm"/>
										<span class="styItalicText">Paid during the year</span>
									</td>
									<td class="styTableCell" style="border-bottom-width: 0px; width: 40mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-bottom-width: 0px; text-align: center; width: 20mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-bottom-width: 0px; text-align: center; width: 40mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-bottom-width: 0px; width: 32mm; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($FormData/SupplementaryInformation/GrantOrContriPaidDuringYear) &lt;5))">
									<xsl:for-each select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear">
										<tr style="border-bottom-width: 0px">
											<td class="styTableCell" style="text-align:left; width: 55mm">
												<xsl:if test="count(RecipientPersonName) &gt;0">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientPersonName"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientBusinessName/BusinessNameLine1) &gt;0">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientBusinessName/BusinessNameLine2) &gt;0">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientUSAddress) &gt;0">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="RecipientUSAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientForeignAddress) &gt;0">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="RecipientForeignAddress"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="text-align: left; width: 40mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientRelationship"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align: left; width: 20mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientFoundationStatus"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align: left; width: 40mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PurposeOfGrantOrContribution"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align: right; width: 32mm; border-right-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Amount"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/SupplementaryInformation/GrantOrContriPaidDuringYear) &lt;1) or (($Print = $Separated) and (count($FormData/SupplementaryInformation/GrantOrContriPaidDuringYear) &gt;4))">
									<tr style="height: 126mm">
										<td class="styTableCell" style="text-align:left; width: 55mm">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear/RecipientPersonName"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear/RecipientBusinessName"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="text-align: left; width: 40mm">
											<span style="width: 1px"/>
										</td>
										<td class="styTableCell" style="text-align: left; width: 20mm">
											<span style="width: 1px"/>
										</td>
										<td class="styTableCell" style="text-align: left; width: 40mm">
											<span style="width: 1px"/>
										</td>
										<td class="styTableCell" style="text-align: right; width: 32mm; border-right-width: 0px">
											<span style="width: 1px"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td class="styTableCell" style="text-align: left; width: 155mm; padding-left: 4mm" colspan="4">
										<span class="styBoldText">Total <span class="styDotLn" style="float:none; clear:none">.................................</span>
											<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
											<span style="width: 1.5mm"/> 3a</span>
									</td>
									<td class="styTableCell" style="width: 32mm; border-right-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/TotGrantOrContriPaidDuringYear"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear"/>
						<xsl:with-param name="containerHeight" select="9"/>
						<xsl:with-param name="containerID" select=" 'Paidctn' "/>
					</xsl:call-template>
					<xsl:if test="(count($FormData/SupplementaryInformation/GrantOrContriApprovedForFuture) &gt;4)">
						<div class="styBB" style="width: 187mm">
							<div style="float:right">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select="'Futurectn'"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<div class="styTableContainerNBB" style="width: 187mm; height: 49mm; border-bottom-width: 0px" id="Futurectn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styTableCell" style="border-bottom-width: 0px; text-align:left;  width: 55mm">
										<span class="styBoldText">b</span>
										<span style="width: 2mm"/>
										<span class="styItalicText">Approved for future payment</span>
									</td>
									<td class="styTableCell" style="border-bottom-width: 0px; width: 40mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-bottom-width: 0px; width: 20mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-bottom-width: 0px; width: 40mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-bottom-width: 0px; width: 32mm; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($FormData/SupplementaryInformation/GrantOrContriApprovedForFuture) &lt;4))">
									<xsl:for-each select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture">
										<tr>
											<td class="styTableCell" style="text-align:left;  width: 55mm">
												<xsl:if test="count(RecipientPersonName) &gt;0">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientPersonName"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientBusinessName/BusinessNameLine1) &gt;0">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientBusinessName/BusinessNameLine2) &gt;0">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientUSAddress) &gt;0">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="RecipientUSAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientForeignAddress) &gt;0">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="RecipientForeignAddress"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="text-align: left; width: 40mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientRelationship"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align: left; width: 20mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientFoundationStatus"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align: left; width: 40mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PurposeOfGrantOrContribution"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 32mm; border-right-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Amount"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/SupplementaryInformation/GrantOrContriApprovedForFuture) &lt;1) or ((count($FormData/SupplementaryInformation/GrantOrContriApprovedForFuture) &gt;3) and ($Print = $Separated))">
									<tr style="height: 80mm">
										<td class="styTableCell" style="width: 55mm; text-align: left">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture/RecipientPersonName"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture/RecipientBusinessName"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width: 40mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 40mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 32mm; border-right-width: 0px">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td class="styTableCell" style="text-align: left; width: 155mm;padding-left: 4mm" colspan="4">
										<span class="styBoldText">Total <span class="styDotLn" style="float:none; clear:none">..................................</span>
											<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
											<span style="width: 1.5mm"/> 3b</span>
									</td>
									<td class="styTableCell" style="width: 32mm; border-right-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/TotGrantOrContriApprovedFuture"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'Futurectn' "/>
					</xsl:call-template>
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">11</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--  Part XVI-A  -->
					<div style="width:187mm;border-top-width: 1px; float: none; clear:both" class="styBB">
						<div class="styPartName" style="width: 20mm">Part XVI-A</div>
						<div class="styPartDesc" style="width: 160mm">
    Analysis of Income-Producing Activities
  </div>
					</div>
					<table class="styTable" style="width:187mm;font-size: 7pt; border-color:black" cellspacing="0">
						<thead>
							<tr>
								<th scope="col" class="styTableCellHeader" style="border-bottom-width: 0px; height: 4mm; width: 71mm; text-align:left">
									<span class="styNormalText">
          Enter gross amounts unless otherwise indicated.
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" colspan="2" style="height: 4mm; width: 45mm">
									<span class="styNormalText">
          Unrelated business income
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" colspan="2" style="height: 4mm; width: 46mm">
									<span class="styNormalText">
										<span style="font-size: 6pt">Excluded by section 512, 513, or 514</span>
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" rowspan="2" style="height: 4mm; width: 25mm; border-right-width: 0px">(e)<br/>
									<span class="styNormalText">
          Related or exempt<br/>
          function income<br/>
          (See page 28 of<br/>
          the instructions.)          
        </span>
								</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 71mm; border-bottom-width: 0px; text-align: left; padding-top: 3mm">
									<span class="styBoldText" style="padding-left:1.5mm">1</span>
									<span style="width: 1mm"/>
									<span class="styNormalText">Program service revenue:</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 20mm">(a)<br/>
									<span class="styNormalText">
          Business code         
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 25mm">(b)<br/>
									<span class="styNormalText">
          Amount          
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 25mm">(c)<br/>
									<span class="styNormalText">
          Exclusion code          
        </span>
								</th>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 25mm">(d)<br/>
									<span class="styNormalText">
          Amount          
        </span>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<xsl:if test="(count($FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII) &gt;0 and ($Print != $Separated)) or (($Print = $Separated) and (count($FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII) &lt;7))">
								<xsl:for-each select="$FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII">
									<tr>
										<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 71mm">
											<span class="styBoldText" style="padding-left: 4.5mm">
												<xsl:call-template name="GenerateLetter3"/>
											</span>
											<span style="width: 1mm"/>
											<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; width: 52mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Description"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessCode"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnrelatedBusinessIncomeAmount"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExclusionCode"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExclusionAmount"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncome"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="(count($FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII) &lt;7)">
								<xsl:call-template name="RowsAtoF">
									<xsl:with-param name="RowCount" select="count($FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII) + 1"/>
									<xsl:with-param name="Letters" select="7"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="(($Print = $Separated) and (count($FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII) &gt;6))">
								<xsl:call-template name="RowsAtoF">
									<xsl:with-param name="RowCount" select="1"/>
									<xsl:with-param name="Letters" select="7"/>
								</xsl:call-template>
							</xsl:if>
							<tr>
								<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 71mm">
									<span class="styBoldText" style="padding-left: 4.5mm">g</span>
									<span style="width: 1mm"/>Fees and contracts from government agencies</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/FeesContractsFromGovtAgencies/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/FeesContractsFromGovtAgencies/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/FeesContractsFromGovtAgencies/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/FeesContractsFromGovtAgencies/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/FeesContractsFromGovtAgencies/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">2</span>
									<span style="width: 1mm"/>
        Membership dues and assessments<span class="styDotLn" style="float:none; clear:none">....</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/MembershipDuesAndAssessments/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/MembershipDuesAndAssessments/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/MembershipDuesAndAssessments/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/MembershipDuesAndAssessments/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/MembershipDuesAndAssessments/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">3</span>
									<span style="width: 2mm"/>
									<span style="font-size: 6pt">Interest on savings and temporary cash investments</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/IntOnSavingsAndTempCashInvst/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/IntOnSavingsAndTempCashInvst/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/IntOnSavingsAndTempCashInvst/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/IntOnSavingsAndTempCashInvst/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/IntOnSavingsAndTempCashInvst/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">4</span>
									<span style="width: 1mm"/>
        Dividends and interest from securities<span class="styDotLn" style="float:none; clear:none">....</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/DividendsAndIntFromSecPartVII/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/DividendsAndIntFromSecPartVII/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/DividendsAndIntFromSecPartVII/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/DividendsAndIntFromSecPartVII/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/DividendsAndIntFromSecPartVII/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">5</span>
									<span style="width: 1mm"/>
        Net rental income or (loss) from real estate:
        <td class="styTableCellSmall" style="width: 20mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="background-color: lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 21mm; background-color: lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="background-color: lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px; background-color: lightgrey">
										<span class="styTableCellPad"/>
									</td>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 71mm">
									<span class="styBoldText" style="padding-left: 4.5mm">a</span>
									<span style="width: 1mm"/>Debt-financed property<span class="styDotLn" style="float:none; clear:none">......</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRentalIncmReDebtFincdProp/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRentalIncmReDebtFincdProp/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRentalIncmReDebtFincdProp/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRentalIncmReDebtFincdProp/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRentalIncmReDebtFincdProp/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 71mm">
									<span class="styBoldText" style="padding-left: 4.5mm">b</span>
									<span style="width: 1mm"/>Not debt-financed property<span class="styDotLn" style="float:none; clear:none">.....</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRntlIncmReNotDebtFincdProp/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRntlIncmReNotDebtFincdProp/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRntlIncmReNotDebtFincdProp/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRntlIncmReNotDebtFincdProp/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRntlIncmReNotDebtFincdProp/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">6</span>
									<span style="width: 2mm"/>
									<span style="font-size: 6pt">Net rental income or (loss) from personal property</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRentalIncmPersonalProperty/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRentalIncmPersonalProperty/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRentalIncmPersonalProperty/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRentalIncmPersonalProperty/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetRentalIncmPersonalProperty/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">7</span>
									<span style="width: 1mm"/>
        Other investment income<span class="styDotLn" style="float:none; clear:none">.....</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/OtherInvestmentIncomePartVII/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/OtherInvestmentIncomePartVII/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/OtherInvestmentIncomePartVII/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/OtherInvestmentIncomePartVII/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/OtherInvestmentIncomePartVII/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">8</span>
									<span style="width: 2mm"/>
									<span style="font-size: 6pt">Gain or (loss) from sales of assets other than inventory</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/GainSalesAssetsOthThanInvntry/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/GainSalesAssetsOthThanInvntry/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/GainSalesAssetsOthThanInvntry/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/GainSalesAssetsOthThanInvntry/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/GainSalesAssetsOthThanInvntry/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">9</span>
									<span style="width: 1mm"/>
        Net income or (loss) from special events:
      </td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetIncomeLossFromSpecialEvents/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetIncomeLossFromSpecialEvents/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetIncomeLossFromSpecialEvents/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetIncomeLossFromSpecialEvents/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/NetIncomeLossFromSpecialEvents/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText">10</span>
									<span style="width: 1mm"/>
        Gross profit or (loss) from sales of inventory<span class="styDotLn" style="float:none; clear:none">..</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/GrossProfitLossSalesOfInvntry/BusinessCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/GrossProfitLossSalesOfInvntry/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/GrossProfitLossSalesOfInvntry/ExclusionCode"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/GrossProfitLossSalesOfInvntry/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/GrossProfitLossSalesOfInvntry/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<xsl:if test="(($Print!=$Separated) and (count($FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed) &gt;0)) or (($Print=$Separated) and (count($FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed) &lt;6))">
								<xsl:for-each select="$FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed">
									<xsl:if test="position()=1">
										<tr>
											<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
												<span class="styBoldText">11</span>
												<span style="width: 1mm"/>
        Other revenue: <span class="styBoldText">a</span>
												<span class="styIRS990PFUnderlinedText" style="width: 32mm; font-size: 6pt">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Description"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessCode"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UnrelatedBusinessIncomeAmount"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExclusionCode"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExclusionAmount"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncome"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="position() != 1">
										<tr>
											<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 71mm">
												<span class="styBoldText" style="padding-left: 4.5mm">
													<xsl:number value="position()" format="a"/>
												</span>
												<span style="width: 1mm"/>
												<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; width: 52mm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Description"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessCode"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UnrelatedBusinessIncomeAmount"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExclusionCode"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExclusionAmount"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncome"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="(count($FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed) &lt;1) or (($Print=$Separated) and (count($FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed) &gt;5))">
								<tr>
									<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
										<span class="styBoldText">11</span>
										<span style="width: 1mm"/>
        Other revenue: <span class="styBoldText">a</span>
										<span class="styIRS990PFUnderlinedText" style="width: 32mm; font-size: 6pt">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed"/>
											</xsl:call-template>
											<span style="width: 1px"/>
										</span>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center">
										<span style="width: 1px"/>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
										<span style="width: 1px"/>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
										<span style="width: 1px"/>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
										<span style="width: 1px"/>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
										<span style="width: 1px"/>
									</td>
								</tr>
								<xsl:call-template name="RowsAtoF">
									<xsl:with-param name="RowCount" select="count($FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed) + 2"/>
									<xsl:with-param name="Letters" select="6"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="(($Print=$Separated) and (count($FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed) &gt;5))">
								<xsl:call-template name="RowsAtoF">
									<xsl:with-param name="RowCount" select="2"/>
									<xsl:with-param name="Letters" select="6"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="count($FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed) &lt;6">
								<xsl:if test="count($FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed) != 0">
									<xsl:call-template name="RowsAtoF">
										<xsl:with-param name="RowCount" select="count($FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed) + 1"/>
										<xsl:with-param name="Letters" select="6"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText">12</span>
									<span style="width: 1mm"/>
        Subtotal. Add columns (b), (d), and (e)<span class="styDotLn" style="float:none; clear:none">..</span>
								</td>
								<td class="styTableCellSmall" style="width: 20mm; background: lightgrey">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="width: 25mm; font-size: 6pt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/SubtotalsPartXVIA/UnrelatedBusinessIncomeAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="width: 21mmm; background: lightgrey">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="width: 25mm; font-size: 6pt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/SubtotalsPartXVIA/ExclusionAmount"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="border-right-width:0px; width: 25mm; font-size: 6pt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/SubtotalsPartXVIA/RelatedOrExemptFunctionIncome"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!--/div-->
					<div>
						<div class="styGenericDiv" style="width: 137mm">
							<span class="styBoldText">13</span>
							<span style="width: 2mm"/>
							<span class="styBoldText">Total. </span> 
    Add line 12, columns (b), (d), and (e)<span class="styDotLn" style="float: none; clear: none">...................</span>
						</div>
						<div class="styGenericDiv" style="width: 50mm">
							<span class="styBoldText">13</span>
							<span class="styIRS990PFUnderlinedText" style="width: 45mm; text-align: right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/TotalPartXVIA"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styGenericDiv" style="width: 187mm; padding-left: 6mm">
    (See worksheet in line 13 instructions on page 28 to verify calculations.)
  </div>
					<!--  Part XVI-B  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm">Part XVI-B</div>
						<div class="styPartDesc" style="width: 160mm">
    Relationship of Activities to the Accomplishment of Exempt Purposes
  </div>
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps"/>
								<xsl:with-param name="containerHeight" select="24"/>
								<xsl:with-param name="containerID" select="'RActn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 106mm; border-bottom-width: 0px" id="RActn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr>
									<th scope="col" class="styTableCellHeader" style="width: 15mm">
        Line No. <br/>
										<img src="{$ImagePath}/990PF_Down_Arrow.gif" alt="DownArrow"/>
									</th>
									<th scope="col" class="styTableCellHeader" style="text-align: left; border-right-width:0px; width: 173mm; padding-left: 3mm">
										<span class="styNormalText">
          Explain below how each activity for which income is reported in column (e) of Part XVI-A contributed importantly to<br/>
          the accomplishment of the organization’s exempt purposes (other than by providing funds for such purposes). (See<br/>
          page 28 of the instructions.)
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps) &lt;25))">
									<xsl:for-each select="$FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps">
										<tr>
											<td class="styTableCell" style="text-align:left; width: 15mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNumber"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 173mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelationshipStatement"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:call-template name="PopulateAdditionalRows">
										<xsl:with-param name="RowCounter" select="count($FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps) + 1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="($Print=$Separated) and (count($FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps) &gt;24)">
									<xsl:call-template name="PopulateAdditionalRows">
										<xsl:with-param name="RowCounter" select="1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps"/>
						<xsl:with-param name="containerHeight" select="24"/>
						<xsl:with-param name="containerID" select=" 'RActn' "/>
					</xsl:call-template>
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2010)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">12</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--  Part XVII  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm">Part XVII</div>
						<div class="styPartDesc" style="width: 160mm">
    Information Regarding Transfers To and Transactions and Relationships With Noncharitable Exempt Organizations
  </div>
					</div>
					<!--  Line 1  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm">1</div>
						<div class="styLNDesc" style="width: 157mm; font-size: 6pt">
      Did the organization directly or indirectly engage in any of the following with any other organization described in section
    </div>
						<div class="styLNRightNumBoxWide" style="width: 9mm; background-color: lightgrey">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox">Yes</div>
						<div class="styLNRightNumBox">No</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox" style="width: 5mm"/>
						<div class="styLNDesc" style="width: 157mm; font-size: 6pt">
      501(c) of the Code (other than section 501(c)(3) organizations) or in section 527, relating to political organizations?
    </div>
						<div class="styLNRightNumBoxWide" style="width: 9mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--  Line 1  -->
					<!--  Line 1a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm">a</div>
						<div class="styLNDesc" style="width: 157mm">
      Transfers from the reporting foundation to a noncharitable exempt organization of:
    </div>
						<div class="styLNRightNumBoxWide" style="width: 9mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm"/>
						<div class="styLNDesc" style="width: 157mm">
							<span style="float:left;clear: none">
								<span class="styBoldText">(1)<span style="width: 1mm"/>
								</span> Cash</span>
							<span class="styDotLn">....................................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1a(1)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/TrnsfrOfCashToNoncharitableEO"/>
								<xsl:with-param name="BackupName">IRS990PFTrnsfrOfCashToNoncharitableEOYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/TrnsfrOfCashToNoncharitableEO"/>
								<xsl:with-param name="BackupName">IRS990PFTrnsfrOfCashToNoncharitableEONo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm"/>
						<div class="styLNDesc" style="width: 157mm">
							<span style="float:left;clear: none">
								<span class="styBoldText">(2)<span style="width: 1mm"/>
								</span> Other assets</span>
							<span class="styDotLn">.................................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1a(2)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/TrnsfrOthAssetsNoncharitableEO"/>
								<xsl:with-param name="BackupName">IRS990PFTrnsfrOthAssetsNoncharitableEOYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/TrnsfrOthAssetsNoncharitableEO"/>
								<xsl:with-param name="BackupName">IRS990PFTrnsfrOthAssetsNoncharitableEONo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 1a  -->
					<!--  Line 1b  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm">b</div>
						<div class="styLNDesc" style="width: 157mm">
      Other transactions:
    </div>
						<div class="styLNRightNumBoxWide" style="width: 9mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm"/>
						<div class="styLNDesc" style="width: 157mm">
							<span style="float:left;clear: none">
								<span class="styBoldText">(1)<span style="width: 1mm"/>
								</span> Sales of assets to a noncharitable exempt organization</span>
							<span class="styDotLn">....................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1b(1)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/SalesOrExchangesOfAssets"/>
								<xsl:with-param name="BackupName">IRS990PFSalesOrExchangesOfAssetsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/SalesOrExchangesOfAssets"/>
								<xsl:with-param name="BackupName">IRS990PFSalesOrExchangesOfAssetsNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm"/>
						<div class="styLNDesc" style="width: 157mm">
							<span style="float:left;clear: none">
								<span class="styBoldText">(2)<span style="width: 1mm"/>
								</span> Purchases of assets from a noncharitable exempt organization</span>
							<span class="styDotLn">..................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1b(2)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/PurchaseAssetsNoncharitableEO"/>
								<xsl:with-param name="BackupName">IRS990PFPurchaseAssetsNoncharitableEOYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/PurchaseAssetsNoncharitableEO"/>
								<xsl:with-param name="BackupName">IRS990PFPurchaseAssetsNoncharitableEONo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm"/>
						<div class="styLNDesc" style="width: 157mm">
							<span style="float:left;clear: none">
								<span class="styBoldText">(3)<span style="width: 1mm"/>
								</span> Rental of facilities, equipment, or other assets</span>
							<span class="styDotLn">.......................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1b(3)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RentalOfFacilitiesEtc"/>
								<xsl:with-param name="BackupName">IRS990PFRentalOfFacilitiesEtcYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RentalOfFacilitiesEtc"/>
								<xsl:with-param name="BackupName">IRS990PFRentalOfFacilitiesEtcNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm"/>
						<div class="styLNDesc" style="width: 157mm">
							<span style="float:left;clear: none">
								<span class="styBoldText">(4)<span style="width: 1mm"/>
								</span> Reimbursement arrangements</span>
							<span class="styDotLn">............................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1b(4)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/ReimbursementArrangements"/>
								<xsl:with-param name="BackupName">IRS990PFReimbursementArrangementsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/ReimbursementArrangements"/>
								<xsl:with-param name="BackupName">IRS990PFReimbursementArrangementsNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm"/>
						<div class="styLNDesc" style="width: 157mm">
							<span style="float:left;clear: none">
								<span class="styBoldText">(5)<span style="width: 1mm"/>
								</span> Loans or loan guarantees</span>
							<span class="styDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1b(5)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/LoansOrLoanGuarantees"/>
								<xsl:with-param name="BackupName">IRS990PFLoansOrLoanGuaranteesYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/LoansOrLoanGuarantees"/>
								<xsl:with-param name="BackupName">IRS990PFLoansOrLoanGuaranteesNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm"/>
						<div class="styLNDesc" style="width: 157mm">
							<span style="float:left;clear: none">
								<span class="styBoldText">(6)  </span> Performance of services or membership or fundraising solicitations</span>
							<span class="styDotLn">................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1b(6)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/PerformanceOfServicesEtc"/>
								<xsl:with-param name="BackupName">IRS990PFPerformanceOfServicesEtcYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/PerformanceOfServicesEtc"/>
								<xsl:with-param name="BackupName">IRS990PFPerformanceOfServicesEtcNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 1b  -->
					<!--  Line 1c  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm">c</div>
						<div class="styLNDesc" style="width: 157mm">
							<span style="float: left; clear: none">Sharing of facilities, equipment, mailing lists, other assets, or paid employees</span>
							<span class="styDotLn">..............</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1c</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/SharingOfFacilitiesEtc"/>
								<xsl:with-param name="BackupName">IRS990PFSharingOfFacilitiesEtcYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/SharingOfFacilitiesEtc"/>
								<xsl:with-param name="BackupName">IRS990PFSharingOfFacilitiesEtcNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 1c  -->
					<!--  Line 1d  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm">d</div>
						<div class="styLNDesc" style="width: 180mm">
      If the answer to any of the above is “Yes,” complete the following schedule. Column <span class="styBoldText">(b)</span> should always show the fair market value<br/>
      of the goods, other assets, or services given by the reporting foundation. If the foundation received less than fair market value<br/>
      in any transaction or sharing arrangement, show in column <span class="styBoldText">(d)</span>  the value of the goods, other assets, or services received.
    </div>
					</div>
					<!--  Line 1d  -->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule"/>
								<xsl:with-param name="containerHeight" select="16"/>
								<xsl:with-param name="containerID" select="'TSctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 67.5mm; border-top-width:1px; border-bottom-width: 0px" id="TSctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead style="font-size: 6pt">
								<tr>
									<th scope="col" class="styTableCellHeader" style="width: 15mm">(a)
        <span class="styNormalText">Line No.</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 32mm">(b)
        <span class="styNormalText">Amount involved</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 55mm">(c)
        <span class="styNormalText">Name of noncharitable exempt organization</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 85mm; border-right-width: 0px">(d)
        <span class="styNormalText">Description of transfers, transactions, and sharing arrangements</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule) &lt;17))">
									<xsl:for-each select="$FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule">
										<tr>
											<td class="styTableCell" style="text-align:left; width: 15mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNumber"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmountInvolved"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; width: 55mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfNoncharitableEO/BusinessNameLine1"/>
												</xsl:call-template>
												<xsl:if test="NameOfNoncharitableEO/BusinessNameLine2 !=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfNoncharitableEO/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="text-align:left; width: 85mm; border-right-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfTransfersEtc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:call-template name="PopulateAdditionalRows2">
										<xsl:with-param name="RowCounter" select="count($FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule) +1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="($Print=$Separated) and (count($FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule) &gt;16)">
									<xsl:call-template name="PopulateAdditionalRows2">
										<xsl:with-param name="RowCounter" select="1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule"/>
						<xsl:with-param name="containerHeight" select="16"/>
						<xsl:with-param name="containerID" select=" 'TSctn' "/>
					</xsl:call-template>
					<!--  Line 2a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm">2a</div>
						<div class="styLNDesc" style="width: 180mm">
      Is the foundation directly or indirectly affiliated with, or related to, one or more tax-exempt organizations<br/>
      described in section 501(c) of the Code (other than section 501(c)(3)) or in section 527?<span class="styDotLn" style="float:none; clear:none">...........</span>
							<input type="checkbox" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipsNoncharitableEOs"/>
									<xsl:with-param name="BackupName">IRS990PFRelationshipsNoncharitableEOs</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipsNoncharitableEOs"/>
									<xsl:with-param name="BackupName">IRS990PFRelationshipsNoncharitableEOs</xsl:with-param>
								</xsl:call-template>Yes</label>
							<span style="width: 4mm"/>
							<input type="checkbox" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipsNoncharitableEOs"/>
									<xsl:with-param name="BackupName">IRS990PFRelationshipsNoncharitableEOs</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipsNoncharitableEOs"/>
									<xsl:with-param name="BackupName">IRS990PFRelationshipsNoncharitableEOs</xsl:with-param>
								</xsl:call-template>No</label>
						</div>
					</div>
					<!--  Line 2a  -->
					<!--  Line 2b  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left:2mm">b</div>
						<div class="styLNDesc" style="width:150mm;">
      If “Yes,” complete the following schedule.
    </div>
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select="'RSctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 2b  -->
					<div class="styTableContainer" style="width: 187mm; height: 25mm; border-top-width: 1px; border-bottom-width: 0px" id="RSctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead style="font-size: 6pt">
								<tr>
									<th scope="col" class="styTableCellHeader" style="width: 70mm">(a)
        <span class="styNormalText">Name of organization</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 47mm">(b)
        <span class="styNormalText">Type of organization</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 70mm; border-right-width: 0px">(c)
        <span class="styNormalText">Description of relationship</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or (($Print=Separated) and (count($FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule) &lt;6))">
									<xsl:for-each select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule">
										<tr>
											<td class="styTableCell" style="text-align:left; width: 70mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine1"/>
												</xsl:call-template>
												<xsl:if test="NameOfOrganization/BusinessNameLine2 !=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="text-align:left; width: 47mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TypeOfOrganization"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; width: 70mm; border-right-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfRelationship"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:call-template name="PopulateAdditionalRows3">
										<xsl:with-param name="RowCounter" select="count($FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule) + 1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(($Print=$Separated) and (count($FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule) &gt;5))">
									<xsl:call-template name="PopulateAdditionalRows3">
										<xsl:with-param name="RowCounter" select="1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'RSctn' "/>
					</xsl:call-template>
					<!-- BEGIN Signature section and Preparer section -->
					<table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;">
						<tr>
							<!-- "Sign Here" image -->
							<td class="styIRS990PFLeftBox" style="width:9.3mm;vertical-align:middle;border-bottom:1px solid black;" rowspan="2">
								<img src="{$ImagePath}/990PF_sign_here.gif" alt="SignHere"/>
							</td>
							<td>
								<!-- BEGIN Signature Section -->
								<table class="styTable" cellspacing="0" style="width:176mm;font-size:7pt;">
									<tr>
										<td colspan="5" class="styIRS990PFSignatureText" style="width:176mm;vertical-align:top;border-color: black; border-style:solid; border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px;padding-left: 2mm;">
            Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete.  Declaration of preparer (other than taxpayer or fiduciary) is based on all information of which preparer has any knowledge.
          </td>
									</tr>
									<!-- Data for "Signature of officer or trustee", "Date", "Title" -->
									<tr>
										<td rowspan="2" style="width:4mm;height:8mm;padding-left:2mm;">
											<img src="{$ImagePath}/990PF_Bullet_Jumbo.gif" alt="Bullet" style="width:2mm;height:8mm;"/>
										</td>
										<td class="styIRS990PFSignatureBox" style="width:90mm;height:4mm;">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styIRS990PFSignatureBox" style="width:25mm;height:4mm;border-right-width: 0px;padding-left:1mm;">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
											</xsl:call-template>
										</td>
										<td rowspan="2" style="padding-left:2mm;width:4mm;height:8mm;">
											<img src="{$ImagePath}/990PF_Bullet_Jumbo.gif" alt="Bullet" style="width:2mm;height:8mm;"/>
										</td>
										<td class="styIRS990PFSignatureBox" style="width:40mm;height:4mm;border-right-width:0px">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Labels "Signature of officer or trustee", "Date", "Title" for data on the previous row -->
									<tr>
										<td class="styIRS990PFSignatureText" style="width:90mm;height:3mm;padding-bottom:1mm;">
           Signature of officer or trustee
         </td>
										<td class="styIRS990PFSignatureText" style="width:25mm;height:3mm;padding-bottom:1mm;">
           Date
         </td>
										<td class="styIRS990PFSignatureText" style="width:40mm;height:3mm;padding-bottom:1mm;">
           Title
         </td>
									</tr>
								</table>
								<!-- END Signature Section -->
							</td>
						</tr>
						<tr>
							<td style="border-bottom:1px solid black;">
								<!-- BEGIN Preparer's Section -->
								<table class="styTable" cellspacing="0" style="width:176mm;font-size:7pt;">
									<tr>
										<!-- "Paid Preparers Use Only" image -->
										<td rowspan="3" class="styIRS990PFLeftBox" style="height: 24.5mm;width:10mm;padding-top:3.5mm;border-top-width:1px;">
											<img src="{$ImagePath}/990PF_paid_preparer.gif" alt="PaidPreparersUseOnly"/>
										</td>
										<!-- Preparer signature -->
										<td style="vertical-align:top;border-style:solid;border-color:black;border-top-width:1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
											<span class="styIRS990PFSignatureBox" style="width:85mm;border-right-width:0px;border-bottom-width:0px;border-left-width:0px;border-top-width:0px;">
												<span class="styIRS990PFSignatureText" style="width:16mm;padding-top:8mm;padding-left:1mm;">Preparer's Signature</span>
												<span class="styGenericDiv" style="width:4mm;height:15mm;padding-top: 6mm">
													<img src="{$ImagePath}/990PF_Bullet_Jumbo.gif" alt="Bullet" style="width:2mm;height:8mm;"/>
												</span>
												<span class="styGenericDiv" style="width:64mm;height:15mm;padding-top:8mm;">
													<xsl:call-template name="PopulateReturnHeaderPreparer">
														<xsl:with-param name="TargetNode">Name</xsl:with-param>
													</xsl:call-template>
												</span>
											</span>
										</td>
										<!-- Date -->
										<td style="vertical-align:top;padding-left:.5mm;text-align:right;border-style:solid;border-color:black;border-top-width:1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
											<span style="width:21mm;text-align:left;">Date</span>
											<span style="width:21mm;height:11mm;padding-top:8mm;text-align:center;">
												<xsl:call-template name="PopulateReturnHeaderPreparer">
													<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
												</xsl:call-template>
											</span>
										</td>
										<!-- Self-employed? -->
										<td style="vertical-align:top;border-top:1px solid black;border-style:solid;border-color:black;border-top-width:1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
											<span class="styIRS990PFSignatureText" style="width:22mm;height:15mm;padding-left:.5mm;padding-top:4mm;">
												<label for="dummyid1">
													<xsl:call-template name="PopulateReturnHeaderPreparer">
														<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>SelfEmployed 
                  <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
													</xsl:call-template>
                Check if self-<br/>employed <img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
												</label>
												<input type="checkbox" class="styIRS990PFCkBox" id="dummyid1">
													<xsl:call-template name="PopulateReturnHeaderPreparer">
														<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
														<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
										</td>
										<!-- SSN/PTIN-->
										<td style="vertical-align:top;padding-left:1mm;border-top:1px solid black;border-style:solid;border-color:black;border-top-width:1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
		PTIN
<!--            Preparer's identifying<br/>number (see <span class="styBoldText">Signature</span> on page 30 <span style="font-size: 6pt">of the instructions</span>)   -->
											<span class="styGenericDiv" style="width:35mm;height:3.75mm;padding-top:2mm;text-align:center;">
												<xsl:call-template name="PopulateReturnHeaderPreparer">
													<xsl:with-param name="TargetNode">SSN</xsl:with-param>
												</xsl:call-template>
												<xsl:call-template name="PopulateReturnHeaderPreparer">
													<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
												</xsl:call-template>
											</span>
										</td>
									</tr>
									<tr>
										<!-- Preparer's info  -->
										<td colspan="2" rowspan="2" style="vertical-align:top;border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px;">
											<span class="styIRS990PFSignatureBox" style="width:34mm;height:14mm;border-color:black;border-bottom-width:0px;border-right-width:0px;">
											  <span style="width:34mm; padding-top: 0mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px;">

             									   <span style="padding-left:1mm;">Firm's name</span>
             									   <span style="width:23px;"/>
             										<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
											<br/><br/><br/><br/>
          									   </span>
          									   
               									<span style="padding-left:1mm;">Firm's address</span>
             									<span style="width:10px;"/>
             										<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
             										<br/><br/><br/>
            									 </span>
  <!--											<span class="styGenericDiv">
												<img src="{$ImagePath}/990PF_Bullet_Jumbo.gif" alt="Bullet"/>
											</span>    -->
		
											<span class="styIRS990PFSignatureBox" style="width:73mm;height:14mm;border-bottom-width: 0px;border-right-width:0px;float:right;">
												<span style="width: 73mm; padding-top: 0mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px;">
													<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
														<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
														<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
													</xsl:call-template>
												</span>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
													<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
													<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
													<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
													<xsl:with-param name="TargetNode">Country</xsl:with-param>
												</xsl:call-template>
											</span>
										</td>
										<!-- Firm's EIN -->
										<td colspan="2" style="vertical-align:top; border-bottom:1 solid black;padding-left:1mm;">
             Firm's EIN<span style="width:2px;"/>
											<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
											<span style="width:5px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<!-- Phone no. -->
										<td colspan="2" style="vertical-align:top;padding-left:1mm;">Phone no.
             <span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparer">
												<xsl:with-param name="TargetNode">Phone</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<!-- END Signature section and Preparer section -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm;">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2010)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
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
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part VI Line 7 - Tax Paid Original Return</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvestmentIncm/TaxPaidOriginalReturn"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
					<br/>
					<span style="padding-left:1mm;font-size:8pt">
						<b>Form 990PF - Special Condition Description:</b>
					</span>
					<br/>
					<!--Special Condition Description -->
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;">

Special Condition Description</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<xsl:for-each select="$FormData/SpecialConditionDescription">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellText" style="width:179mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<!-- END Left Over Table -->
					<xsl:if test="($Print = $Separated) and (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt; 5)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part IV - Capital Gains and Losses for Tax on Investment Income - Columns a - d</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 113mm" colspan="2">
        (a) <span class="styNormalText"> List and describe the kind(s) of property sold (e.g., real estate,<br/>2-story brick warehouse; or common stock, 200 shs. MLC Co.)</span>
									</th>
									<th scope="col" class="styDepTblCell" style="text-align: center; width: 24mm">
        (b) <span class="styNormalText">How acquired<br/>P—Purchase<br/>D—Donation</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 25mm">
        (c) <span class="styNormalText">Date acquired<br/>(mo., day, yr.)</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 25mm; border-right-width: 0px">
        (d) <span class="styNormalText">Date sold<br/>(mo., day, yr.)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="bottom">
								<xsl:for-each select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
											<xsl:if test="position()=1">
												<xsl:attribute name="style">width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 3mm</xsl:attribute>
            1
           </xsl:if>
											<xsl:call-template name="GenerateLetter"/>
										</td>
										<td class="styDepTblCell" style="width: 105mm; text-align: left; border-left-width: 0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DescriptionOfAsset"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 24mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="HowAcquired"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 25mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DateAcquired"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 25mm; border-right-width:0px; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DateSold"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt; 5)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part IV - Capital Gains and Losses for Tax on Investment Income - Columns e - h</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 39mm;padding-left: 2mm" colspan="2">
        (e) <span class="styNormalText">Gross sales price</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 45mm">
        (f) <span class="styNormalText">Depreciation allowed<br/>(or allowable)</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 45mm">
        (g) <span class="styNormalText">Cost or other basis<br/>plus expense of sale</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 50mm; border-right-width: 0px">
        (h) <span class="styNormalText">Gain or (loss)<br/>(e) plus (f) minus (g)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:for-each select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
											<xsl:if test="position()=1"/>
											<xsl:call-template name="GenerateLetter"/>
										</td>
										<td class="styDepTblCell" style="width: 39mm; border-left-width: 0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossSalesPrice"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 45mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Depreciation"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 45mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 50mm; border-right-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainOrLoss"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt; 5)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part IV - Capital Gains and Losses for Tax on Investment Income - Columns i - l</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" colspan="4" style="width: 137mm">
										<span class="styNormalText">Complete only for assets showing gain in column (h) and owned by the foundation on 12/31/69</span>
									</th>
									<th scope="col" class="styDepTblCell" rowspan="2" style="width: 50mm; border-right-width: 0px">
        (l) <span class="styNormalText">Gains (Col. (h) gain minus<br/>col. (k), but not less than -0-) <span class="styBoldText">or</span>
											<br/>Losses (from col.(h))</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="padding-left: 4mm; width: 39mm" colspan="2">
        (i) <span class="styNormalText">F.M.V. as of 12/31/69</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 45mm">
        (j) <span class="styNormalText">Adjusted basis<br/>as of 12/31/69</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 45mm">
        (k) <span class="styNormalText">Excess of col. (i)<br/>over col. (j), if any</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:for-each select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
											<xsl:if test="position()=1"/>
											<xsl:call-template name="GenerateLetter"/>
										</td>
										<td class="styDepTblCell" style="width: 39mm; border-left-width: 0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FMVAsOf123169"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 45mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustedBasisAsOf123169"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 45mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExcessOfFMVOverAdjustedBasis"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 50mm; border-right-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainsMinusExcessOrLosses"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/StatementsRegardingActivities/StatesFiledWith) &gt;25)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part VII-A Line 8a</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead"/>
							<tbody>
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align: left; width:80mm"> Enter the states to which the foundation reports or with which it is registered:</td>
									<td class="styDepTblCell" style="text-align: left; width: 104mm">
										<xsl:if test="($Print = $Separated) and (count($FormData/StatementsRegardingActivities/StatesFiledWith) &gt;25)">
											<xsl:for-each select="$FormData/StatementsRegardingActivities/StatesFiledWith">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
												<xsl:if test="position()!=last()">,<span style="width: 2px"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee) &gt;4)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part VIII Line 1 - List all officers, directors, trustees, foundation managers and their compensation</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="border-right-width: 0px; width: 53mm">(a)
        <span class="styNormalText">
          Name and address
        </span>
									</th>
									<th scope="col" class="styDepTblCell" style="border-right-width:0px; border-left-width: 1px; width: 31mm">(b)
        <span class="styNormalText">
          Title, and average<br/>hours per week<br/>devoted to position
        </span>
									</th>
									<th scope="col" class="styDepTblCell" style="border-right-width:0px; border-left-width: 1px; width: 31mm">(c)
        <span class="styNormalText">
          Compensation<br/>
										</span>
        (If not paid, enter<br/>-0-)
      </th>
									<th scope="col" class="styDepTblCell" style="border-right-width: 0px; border-left-width: 1px; width: 31mm">(d)
        <span class="styNormalText">
          Contributions to<br/>employee benefit plans<br/>and deferred compensation
        </span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 31mm; border-right-width: 0px; border-left-width: 1px">(e)
        <span class="styNormalText">
          Expense account,<br/>other allowances
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:for-each select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align: left; width: 53mm; border-left-width: 0px; font-size: 6pt">
											<xsl:choose>
												<xsl:when test="PersonName != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonName"/>
													</xsl:call-template>
													<span style="width: 2mm"/>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PersonName"/>
														<xsl:with-param name="TabOrder" select="2"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2 != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="BusinessName"/>
														<xsl:with-param name="TabOrder" select="2"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styDepTblCell" rowspan="2" style="text-align: left; width: 31mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Title"/>
											</xsl:call-template>
											<xsl:if test="AvgHoursPerWkDevotedToPosition != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AvgHoursPerWkDevotedToPosition"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styDepTblCell" rowspan="2" style="width: 31mm; text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Compensation"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" rowspan="2" style="width: 31mm; text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ContriToEmplBenefitPlansEtc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" rowspan="2" style="border-right-width:0px; width: 31mm; text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenseAccountOtherAllowances"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align: left; width: 53mm; border-left-width: 0px">
											<xsl:choose>
												<xsl:when test="ForeignAddress !=''">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformation/ContributingManager) &gt;1)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XV Line 1a - List any managers of the foundation who have contributed more than 2% of the total contributions received by the foundation
before the close of any tax year (but only if they have contributed more than $5,000).</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead"/>
							<tbody>
								<xsl:for-each select="$FormData/SupplementaryInformation/ContributingManager">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width: 187mm; padding-left: 1mm; text-align: left">
											<xsl:if test="position()=last()">
												<xsl:attribute name="style">width: 187mm; padding-left: 1mm; border-bottom-width: 0px; text-align: left</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformation/ShareholderManager) &gt;1)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XV Line 1b - List any managers of the foundation who own 10% or more of the stock of a corporation (or an equally large portion of the
    ownership of a partnership or other entity) of which the foundation has a 10% or greater interest.</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead"/>
							<tbody>
								<xsl:for-each select="$FormData/SupplementaryInformation/ShareholderManager">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width: 187mm; padding-left: 1mm; text-align: left">
											<xsl:if test="position()=last()">
												<xsl:attribute name="style">width: 187mm; padding-left: 1mm; border-bottom-width: 0px; text-align: left</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformation/AppicationSubmissionInfo) &gt;1)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XV Line 2a - 2d - Information Regarding Contribution, Grant, Gift, Loan, Scholarship, etc., Programs:</span>
						<xsl:for-each select="$FormData/SupplementaryInformation/AppicationSubmissionInfo">
							<table class="styDepTbl" style="font-size: 7pt">
								<thead class="styTableThead"/>
								<tbody>
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
											<span class="styBoldText" style="padding-left:2mm">a</span>
											<span style="width: 2mm"/>The name, address, and telephone number of the person to whom applications should be addressed:</td>
									</tr>
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/></xsl:attribute>
										<td class="styDepTblCell" style="border-top-width: 0px; text-align: left; width: 187mm; padding-left: 6mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecipientName"/>
											</xsl:call-template>
											<xsl:if test="count(RecipientUSAddress) &gt;0">
												<br/>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="RecipientUSAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientForeignAddress) &gt;0">
												<br/>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="RecipientForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientPhoneNumber) &gt;0">
												<br/>
												<xsl:call-template name="PopulatePhoneNumber">
													<xsl:with-param name="TargetNode" select="RecipientPhoneNumber"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
									<!--  Line 2a  -->
									<!--  Line 2b  -->
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/></xsl:attribute>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px">
											<span class="styBoldText" style="padding-left:2mm">b</span>
											<span style="width: 2mm"/>The form in which applications should be submitted and information and materials they should include:</td>
									</tr>
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/></xsl:attribute>
										<td class="styDepTblCell" style="border-top-width: 0px; text-align: left; width: 187mm; padding-left: 6mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FormAndInfoAndMaterials"/>
											</xsl:call-template>
										</td>
									</tr>
									<!--  Line 2b  -->
									<!--  Line 2c  -->
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/></xsl:attribute>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
											<span class="styBoldText" style="padding-left:2mm">c</span>
											<span style="width: 2mm"/>Any submission deadlines:</td>
									</tr>
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/></xsl:attribute>
										<td class="styDepTblCell" style="border-top-width: 0px; text-align: left; width: 187mm; padding-left: 6mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select=" SubmissionDeadlines"/>
											</xsl:call-template>
										</td>
									</tr>
									<!--  Line 2c  -->
									<!--  Line 2d  -->
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/></xsl:attribute>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
											<span class="styBoldText" style="padding-left:2mm">d</span>
											<span style="width: 2mm"/>Any restrictions or limitations on awards, such as by geographical areas, charitable fields, kinds of institutions, or other
          <br/>
											<span style="width: 6mm"/>factors:</td>
									</tr>
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/></xsl:attribute>
										<td class="styDepTblCell" style="border-top-width: 0px; text-align: left; width: 187mm; padding-left: 6mm">
											<xsl:if test="position()=last()">
												<xsl:attribute name="style">width: 187mm; padding-left: 6mm; border-bottom-width: 0px;border-top-width: 0px</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select=" RestrictionsOnAwards"/>
											</xsl:call-template>
										</td>
									</tr>
									<!--  Line 2d  -->
								</tbody>
							</table>
						</xsl:for-each>
						<br/>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformation/GrantOrContriPaidDuringYear) &gt;4)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XV Line 3 - Grants and Contributions Paid During the Year or Approved for Future Payment</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 55mm">
										<span class="styNormalText">
          Recipient
        </span>
									</th>
									<th scope="col" class="styDepTblCell" rowspan="2" style="height: 4mm; width: 40mm">
										<span class="styNormalText">
          If recipient is an individual,<br/>
          show any relationship to<br/>
          any foundation manager<br/>
          or substantial contributor<br/>
										</span>
									</th>
									<th scope="col" class="styDepTblCell" rowspan="2" style="height: 4mm; width: 20mm">
										<span class="styNormalText">
          Foundation<br/>
          status of<br/>
          recipient
        </span>
									</th>
									<th scope="col" class="styDepTblCell" rowspan="2" style="height: 4mm; width: 40mm">
										<span class="styNormalText">
          Purpose of grant or<br/>
          contribution
        </span>
									</th>
									<th scope="col" class="styDepTblCell" rowspan="2" style="height: 4mm; width: 32mm; border-right-width: 0px">
										<span class="styNormalText">
          Amount
        </span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 55mm">
										<span class="styNormalText">
          Name and address (home or business)
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" style="border-bottom-width: 0px; text-align:left; width: 55mm">
										<span class="styBoldText">a</span>
										<span style="width: 2mm"/>
										<span class="styItalicText">Paid during the year</span>
									</td>
									<td class="styDepTblCell" style="border-bottom-width: 0px; width: 40mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border-bottom-width: 0px; text-align: center; width: 20mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border-bottom-width: 0px; text-align: center; width: 45mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border-bottom-width: 0px; width: 32; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<xsl:for-each select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear">
									<tr style="border-bottom-width: 0px">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 55mm">
											<xsl:if test="count(RecipientPersonName) &gt;0">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientPersonName"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientBusinessName/BusinessNameLine1) &gt;0">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientBusinessName/BusinessNameLine2) &gt;0">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientUSAddress) &gt;0">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="RecipientUSAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientForeignAddress) &gt;0">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="RecipientForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 40mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecipientRelationship"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 20mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecipientFoundationStatus"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 45mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PurposeOfGrantOrContribution"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align: right; width: 32mm; border-right-width: 0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amount"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td class="styDepTblCell" style="text-align: left; width: 155mm; padding-left: 4mm" colspan="4">
										<span class="styBoldText">Total <span class="styDotLn" style="float:none; clear:none">..................................</span>
											<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
											<span style="width: 1.5mm"/> 3a</span>
									</td>
									<td class="styDepTblCell" style="width: 32mm; border-right-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/TotGrantOrContriPaidDuringYear"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr class="styDepTblHdr">
									<td class="styTableCell" style="border-bottom-width: 0px; text-align:left;  width: 55mm">
										<span class="styBoldText">b</span>
										<span style="width: 2mm"/>
										<span class="styItalicText">Approved for future payment</span>
									</td>
									<td class="styDepTblCell" style="border-bottom-width: 0px; width: 40mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border-bottom-width: 0px; width: 20mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border-bottom-width: 0px; width: 40mm">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-bottom-width: 0px; border-right-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<xsl:for-each select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;  width: 55mm">
											<xsl:if test="count(RecipientPersonName) &gt;0">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientPersonName"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientBusinessName/BusinessNameLine1) &gt;0">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientBusinessName/BusinessNameLine2) &gt;0">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientUSAddress) &gt;0">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="RecipientUSAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientForeignAddress) &gt;0">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="RecipientForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 40mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecipientRelationship"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 20mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecipientFoundationStatus"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 40mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PurposeOfGrantOrContribution"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 32mm; border-right-width: 0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amount"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td class="styDepTblCell" style="text-align: left; width: 155mm;padding-left: 4mm" colspan="4">
										<span class="styBoldText">Total <span class="styDotLn" style="float:none; clear:none">..................................</span>
											<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
											<span style="width: 1.5mm"/> 3b</span>
									</td>
									<td class="styDepTblCell" style="width: 32mm; border-right-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/TotGrantOrContriApprovedFuture"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII) &gt;6)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XVI-A Line 1 - Program service revenue:</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="border-bottom-width: 0px; height: 4mm; width: 71mm; text-align:left">
										<span class="styNormalText">
          Enter gross amounts unless otherwise indicated.
        </span>
									</th>
									<th scope="col" class="styDepTblCell" colspan="2" style="height: 4mm; width: 45mm">
										<span class="styNormalText">
          Unrelated business income
        </span>
									</th>
									<th scope="col" class="styDepTblCell" colspan="2" style="height: 4mm; width: 46mm">
										<span class="styNormalText">
											<span style="font-size: 6pt">Excluded by section 512, 513, or 514</span>
										</span>
									</th>
									<th scope="col" class="styDepTblCell" rowspan="2" style="height: 4mm; width: 25mm; border-right-width: 0px">(e)<br/>
										<span class="styNormalText">
          Related or exempt<br/>
          function income<br/>
          (See the<br/>
          instructions.)          
        </span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 71mm; text-align: left; padding-top: 7mm">
										<span class="styBoldText">1</span>
										<span style="width: 1mm"/>
										<span class="styNormalText">Program service revenue:</span>
									</th>
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 20mm">(a)<br/>
										<span class="styNormalText">
          Business code         
        </span>
									</th>
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 25mm">(b)<br/>
										<span class="styNormalText">
          Amount          
        </span>
									</th>
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 25mm">(c)<br/>
										<span class="styNormalText">
          Exclusion code          
        </span>
									</th>
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 25mm">(d)<br/>
										<span class="styNormalText">
          Amount          
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:for-each select="$FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 71mm">
											<span class="styBoldText">
												<xsl:call-template name="GenerateLetter3"/>
											</span>
											<span style="width: 1mm"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Description"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 20mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessCode"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnrelatedBusinessIncomeAmount"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExclusionCode"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExclusionAmount"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncome"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed) &gt;5)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XVI-A Line 11 - Other revenue:</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="border-bottom-width: 0px; height: 4mm; width: 71mm; text-align:left">
										<span class="styNormalText">
          Enter gross amounts unless otherwise indicated.
        </span>
									</th>
									<th scope="col" class="styDepTblCell" colspan="2" style="height: 4mm; width: 45mm">
										<span class="styNormalText">
          Unrelated business income
        </span>
									</th>
									<th scope="col" class="styDepTblCell" colspan="2" style="height: 4mm; width: 46mm">
										<span class="styNormalText">
											<span style="font-size: 6pt">Excluded by section 512, 513, or 514</span>
										</span>
									</th>
									<th scope="col" class="styDepTblCell" rowspan="2" style="height: 4mm; width: 25mm; border-right-width: 0px">(e)<br/>
										<span class="styNormalText">
          Related or exempt<br/>
          function income<br/>
          (See the<br/>
          instructions.)          
        </span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 71mm; text-align: left; padding-top: 7mm">
										<span class="styBoldText">11</span>
										<span style="width: 1mm"/>
										<span class="styNormalText">Other revenue:</span>
									</th>
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 20mm">(a)<br/>
										<span class="styNormalText">
          Business code         
        </span>
									</th>
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 25mm">(b)<br/>
										<span class="styNormalText">
          Amount          
        </span>
									</th>
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 25mm">(c)<br/>
										<span class="styNormalText">
          Exclusion code          
        </span>
									</th>
									<th scope="col" class="styDepTblCell" style="height: 4mm; width: 25mm">(d)<br/>
										<span class="styNormalText">
          Amount          
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:for-each select="$FormData/AnalysisIncomeProducingActy/OtherRevenueDescribed">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 71mm">
											<span class="styBoldText">
												<xsl:number value="position()" format="a"/>
											</span>
											<span style="width: 1mm"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Description"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 20mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessCode"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnrelatedBusinessIncomeAmount"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExclusionCode"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExclusionAmount"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncome"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!--  Part XVI-B  -->
					<xsl:if test="($Print = $Separated) and (count($FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps) &gt;24)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XVI-B - Relationship of Activities to the Accomplishment of Exempt Purposes</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 15mm">
        Line No. <br/>
										<img src="{$ImagePath}/990PF_Down_Arrow.gif" alt="DownArrow">
											<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/></xsl:attribute>
										</img>
									</th>
									<th scope="col" class="styDepTblCell" style="text-align: left; border-right-width:0px; width: 173mm; padding-left: 3mm">
										<span class="styNormalText">
          Explain below how each activity for which income is reported in column (e) of Part XVI-A contributed importantly to<br/>
          the accomplishment of the organization’s exempt purposes (other than by providing funds for such purposes). (See<br/>
          the instructions.)
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:for-each select="$FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 15mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNumber"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:left; border-right-width: 0px; width: 173mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelationshipStatement"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule) &gt;16)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XVII Line 1d - Information Regarding Transfers To and Transactions and Relationships With Noncharitable
Exempt Organizations</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 15mm">(a)
        <span class="styNormalText">Line No.</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 32mm">(b)
        <span class="styNormalText">Amount involved</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 55mm">(c)
        <span class="styNormalText">Name of noncharitable exempt organization</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 85mm; border-right-width: 0px">(d)
        <span class="styNormalText">Description of transfers, transactions, and sharing arrangements</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:for-each select="$FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 15mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNumber"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 32mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmountInvolved"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:left; width: 55mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfNoncharitableEO/BusinessNameLine1"/>
											</xsl:call-template>
											<xsl:if test="NameOfNoncharitableEO/BusinessNameLine2 !=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfNoncharitableEO/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="text-align:left; width: 85mm; border-right-width: 0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DescriptionOfTransfersEtc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule) &gt;6)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XVII Line 2b - Information Regarding Transfers To and Transactions and Relationships With Noncharitable
Exempt Organizations</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 70mm">(a)
        <span class="styNormalText">Name of organization</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 47mm">(b)
        <span class="styNormalText">Type of organization</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 70mm; border-right-width: 0px">(c)
        <span class="styNormalText">Description of relationship</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:for-each select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 70mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine1"/>
											</xsl:call-template>
											<xsl:if test="NameOfOrganization/BusinessNameLine2 !=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="text-align:left; width: 47mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TypeOfOrganization"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:left; width: 70mm; border-right-width: 0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DescriptionOfRelationship"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
