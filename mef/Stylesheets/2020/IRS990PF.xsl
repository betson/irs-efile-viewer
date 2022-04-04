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
					<xsl:if test="($Print=$Separated) and (count($FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp) &gt;24) and 
					($RowCounter=1)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" 
							select="$FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp/RelationshipStatementTxt"/>
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
					<xsl:if test="($Print=$Separated) and (count($FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail) &gt;16) and $RowCounter=1">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail/InvolvedAmt"/>
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
					<xsl:if test="($Print=$Separated) and (count($FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipScheduleDetail) &gt;5) and ($RowCounter=1)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" 
							select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipScheduleDetail/OrganizationBusinessName/BusinessNameLine1Txt"/>
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
				<td class="styLNAmountBox" style="float:none;width: 53mm; border-left-width: 0px; text-align:left">
					<xsl:if test="$RowCount=0 and $Print=$Separated">
					<xsl:choose>
						<xsl:when test="$FormData/OfficerDirTrstKeyEmplInfoGrp/OfficerDirTrstKeyEmplGrp/PersonNm != ''">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/OfficerDirTrstKeyEmplInfoGrp/OfficerDirTrstKeyEmplGrp/PersonNm"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						<xsl:if test="$FormData/OfficerDirTrstKeyEmplInfoGrp/OfficerDirTrstKeyEmplGrp/BusinessName != ''">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/OfficerDirTrstKeyEmplInfoGrp/OfficerDirTrstKeyEmplGrp/BusinessName"/>
							</xsl:call-template>
						</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="float:none">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="float:none">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="width: 38mm; float:none">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="border-right-width:0px; float:none">
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
				<td class="styLNAmountBox" style="float:left;width: 59mm; border-left-width: 0px; text-align: left">
					<xsl:if test="$RowCount = 0">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/OfficerDirTrstKeyEmplInfoGrp/CompOfHghstPdEmplOrNONETxt"/>
						</xsl:call-template>
					</xsl:if>
					<span style="width: 1px"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="float:none">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="float:none">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="float:none">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="border-right-width:0px; float:none">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<tr>
				<td class="styLNAmountBox" style="width: 59mm; border-left-width: 0px; float:none">
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
				<td class="styLNAmountBox" style="float:left; text-align: left; width: 91mm; border-left-width: 0px">
					<xsl:if test="$RowCount = 0">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/OfficerDirTrstKeyEmplInfoGrp/CompOfHghstPdCntrctOrNONETxt"/>
						</xsl:call-template>
					</xsl:if>
					<span style="width: 1px"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="width: 64mm; float:none">
					<span class="styTableCellPad"/>
				</td>
				<td class="styLNAmountBox" rowspan="2" style="border-right-width:0px; float:none">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<tr>
				<td class="styLNAmountBox" style="width: 91mm; border-left-width: 0px; float:none">
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
					<xsl:if test="(count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp)=0) or ((count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt;5) and ($Print = $Separated))">
						<xsl:if test="$RowCount = 1">
							<xsl:attribute name="style">width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm</xsl:attribute>1a
             </xsl:if>
						<xsl:if test="($RowCount != 1) and ($Print != $Separated)">
							<xsl:attribute name="style">width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 7mm</xsl:attribute>
							<xsl:call-template name="GenerateLetter2">
								<xsl:with-param name="RowCount" select="$RowCount"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
					<xsl:if test="count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp)!=0 and $RowCount != 1">
						<xsl:attribute name="style">border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm</xsl:attribute>
						<xsl:call-template name="GenerateLetter2">
							<xsl:with-param name="RowCount" select="$RowCount"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styTableCell" style="width: 105mm;text-align: left">
					<xsl:if test="($RowCount = 1) and (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt;5) and ($Print = $Separated)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp"/>
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
					<xsl:if test="($RowCount = 1) and (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt;5) and ($Print = $Separated)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp"/>
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
						<xsl:if test="($RowCount = 1) and (count($FormData/AnalysisIncomeProducingActyGrp/ProgramServiceRevPartVIIGrp) != 0) and ($Print = $Separated)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/ProgramServiceRevPartVIIGrp"/>
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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
				<meta name="Desc" content="IRS Form 990-PF"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
						<xsl:call-template name="IRS990PFStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS990PF">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeader"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:187mm; height:24mm;">
						<div class="styFNBox" style="width:33mm;height:24mm">
							<div style="padding-top:1mm;">
								  Form<span class="styFormNumber">990-PF</span>
								<br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									  <xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
								</xsl:call-template>
							</div>
							<br/>
							<div>
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:124mm;height:24mm;padding-top: 1.5mm">
							<br/><div class="styMainTitle">Return of Private Foundation</div>
							<div class="styFBT" style="font-size: 8pt; margin-top: 0px">or Section 4947(a)(1) Trust Treated as Private Foundation</div>
							<div class="styFBT" style="font-size: 7pt; font-weight: normal; margin-top: 0px; padding-top: 1mm">
								<span style="padding-right: 2mm">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>	
								<span class="styBoldText">Do not enter social security numbers on this form as it may be made public.</span>
								<br/>
								<span style="padding-right: 1mm">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>								
								<span class="styBoldText">Go to <a href="http://www.irs.gov/form990pf" 
									title="Link to IRS.gov"><i>www.irs.gov/Form990PF</i></a> for instructions and the latest information.</span>
							</div>
						</div>
						<div class="styTYBox" style="width:29mm;height:24mm;">							
							<div class="styOMB" style="height:5mm;font-size: 7pt">OMB No. 1545-0052</div>
							<div class="styTaxYear" style="padding-top: 1.5mm">20<span class="styTYColor">20</span>
							</div>
						  <div class="styPartName" style="height:8mm; width:29.5mm;padding-top:0.3mm">Open to Public Inspection</div>					
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<div class="styComType" style="width:187mm; font-size: 8pt; padding-top: 1.5mm; padding-bottom:1.5mm">
						<div class="styBoldText" style="height:3mm;width:182mm;">
						  For calendar year 2020, or tax year beginning						
							<xsl:choose>
								<xsl:when test="string-length($RtnHdrData/TaxPeriodBeginDt) != 0 and string-length($RtnHdrData/TaxPeriodEndDt) != 0" >
									<span style="width: 35mm">
										<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate">
											<xsl:with-param name="TargetNode">TaxPeriodBeginDt</xsl:with-param>
										</xsl:call-template>
									</span> , and ending 
										<span style="width: 25mm">
										<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate">
											<xsl:with-param name="TargetNode">TaxPeriodEndDt</xsl:with-param>
										</xsl:call-template>								
									</span>
								</xsl:when>
								<xsl:otherwise>
									<span style="width: 35mm">
									</span> 2020, and ending 
									<span style="width: 25mm">							
									</span>, 20
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;">
						<div class="styLblNameAddr" 
						style="width:122mm;height:29mm;border-left-width:0px;border-top-width:1px;border-right-width:1px;border-bottom-width:1px;">
							<div class="styNameAddr" style="width:121.55mm;height:auto"><!--10mm-->
							     Name of foundation<br/>
								<span class="stySmallText">
									<span style="width:8px"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span class="stySmallText">
									<span style="width:8px"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span class="stySmallText">
									<span style="width:8px"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="width:122mm;height:10mm;">
								<span style="width: 88mm;vertical-align:top ">
									<!--<span style="width: 89mm">--> Number and street (or P.O. box number if mail is not delivered to street address)<!--</span>-->
									<span class="stySmallText" style="width: 88mm; padding-left:3mm">
										<!--<span style="width:8px"/>-->
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
									<!--</span>
									<span class="stySmallText" style="width: 89mm">
										<span style="width:8px"/>-->
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</span>
								</span>
								<span style="border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; width: 8mm; 
									height: 10mm;">
									<span style="width: 8mm;padding-left:1mm;">Room/suite</span>
									<span style="width: 6mm"/>
									<span class="stySmallText" style="width:8mm"/>
								</span>
							</div>
							<div class="styNameAddr" style="border-bottom-width:0px;width:100mm;height:10mm;">
								City or town, state or province, country, and ZIP or foreign postal code<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									<xsl:with-param name="MainForm">true</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
						<div class="styEINDateAssets" style="width:65mm;height:11mm;border-top-width: 1px;">
							<span class="styBoldText">A Employer identification number</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="EINChanged">true</xsl:with-param>
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINDateAssets" style="width:65mm;height:10mm;padding-top: 1mm">
							<span class="styBoldText">B </span> Telephone number (see instructions)<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Phone</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINDateAssets" style="width:65mm;height:5mm;border-bottom-width: 0px; padding-top: 2mm">
							<span class="styBoldText" style="float: left">C </span>
							<label for="Pending" style="float: left; clear:none; padding-left: 1mm">If exemption application is pending, check here
							</label>
							<span style="float: right">
								<!--          <span style="padding-right: 2mm"><img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/></span>
          <input type="checkbox" class="styCkBox" TabIndex="-1" id="Pending" onclick="return false;"></input>
          </span>
*** Enabled "Pending" Box on 02/13/08          
 -->
								<span style="padding-right: 2mm">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>
								<input type="checkbox" alt="Pending" class="styCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Pending"/>
										<xsl:with-param name="BackupName">IRS990PFPending</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>					
					<div style="width: 187mm">
						<span style="width: 122mm; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 0px; float: left">
								<span  style="width:3mm;"><b>G</b></span>
								<span style="width:30mm;"> Check all that apply: </span> 						
									<span style="width:28mm;">
										<input type="checkbox" alt="InitialReturn" class="styIRS990PFCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
												<xsl:with-param name="BackupName">IRS990PFInitialReturn</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
												<xsl:with-param name="BackupName">IRS990PFInitialReturn</xsl:with-param>
											</xsl:call-template>Initial return</label>
									</span>									
									<span style="width:58mm;">
										<input type="checkbox" alt="InitialReturnOfAFormerPublicCharity" class="styIRS990PFCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/InitialReturnFormerPubChrtyInd"/>
												<xsl:with-param name="BackupName">IRS990PFInitialReturnFormerPublicChrty</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/InitialReturnFormerPubChrtyInd"/>
												<xsl:with-param name="BackupName">IRS990PFInitialReturnFormerPublicChrty</xsl:with-param>
											</xsl:call-template>Initial return of a former public charity</label>
									</span>		
									 <br/>
								<span style="width:34mm;"></span> 						
									<span style="width:28mm;">
										<input type="checkbox" alt="FinalReturn" class="styIRS990PFCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
												<xsl:with-param name="BackupName">IRS990PFFutureFilingNotRequiredInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
												<xsl:with-param name="BackupName">IRS990PFFutureFilingNotRequiredInd</xsl:with-param>
											</xsl:call-template>Final return</label>
									</span>
								<span style="width:58mm;">
									<input type="checkbox" alt="AmendedReturn" class="styIRS990PFCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
											<xsl:with-param name="BackupName">IRS990PFAmendedReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
											<xsl:with-param name="BackupName">IRS990PFAmendedReturn</xsl:with-param>
										</xsl:call-template>Amended return</label>
								</span>
								<br/>
								<span style="width:34mm;"></span> 			
								<span style="width:28mm;">
									<input type="checkbox" alt="AddressChange" class="styIRS990PFCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
											<xsl:with-param name="BackupName">IRS990PFAddressChange</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
											<xsl:with-param name="BackupName">IRS990PFAddressChange</xsl:with-param>
										</xsl:call-template>Address change
									</label>
								</span>
								<span style="width:58mm;"><!-- NameChange checkbox is for Paper Filers Only.  It is a write in field. -->
									<input type="checkbox" alt="NameChange" class="styIRS990PFCkBox" id="NameChange" onclick="return false;"/>
									<label for="NameChange">Name change</label>
								</span>
						</span>
						<!-- Checkboxes D 1 and D 2 are for Paper Filers Only.  They are write in fields -->
						<div class="styEINDateAssets" style="width:65mm;height:5mm;border-bottom-width: 0px; padding-top: 1.5mm">
							<span style="float: left"><b> D 1.</b> Foreign organizations, check here.............  </span>
							<label for="ForeignOrg" style="float: left; clear: none; padding-left: 1mm;">
							</label>
							<span style="float: right">
								<span style="width:4mm;">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>
								<input type="checkbox" alt="ForeignOrganization" class="styCkBox" TabIndex="-1" id="ForeignOrg" onclick="return false;"/>
							</span>
						</div>						
						<span class="styEINDateAssets" style="width:65mm;height:5mm;border-bottom-width: 0px; float:right; padding-top: 1mm">
							<span style="float: left; padding-left: 3mm"><b>2</b>. Foreign organizations meeting the 85% <br/>
								<span style="width: 3.2mm"/>test, check here and attach computation ...	
							</span>
							<label for="85" style="float: left; clear: none; padding-left: 1mm;">
							</label>
							<span style=" float:right;padding-top: 1mm;">
								<span style="width:4mm;">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>
								<input type="checkbox" alt="Foreign organization meeting 85% test" class="styCkBox" id="85" onclick="return false;"/>
							</span>
						</span>										
					</div>		
					<!-- H section starts here.-->
					<div style="width: 187mm;">
					<div class="styEINDateAssets" style="width:65mm;height:5mm;border-bottom-width: 0px; float: right; clear: both;">
							<span class="styBoldText" style="float: left">E </span>
							<label for="507" style="float: left; clear: none; padding-left: 2mm">If private foundation status was terminated<br/>under section 507(b)(1)(A), check here ....... 
							</label>
							<span style="float: right; ">
								<span style="padding-right: 2mm">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>
								<input type="checkbox" alt="PFStatusTerminatedSect507b1A" class="styCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PFStatusTermSect507b1AInd"/>
										<xsl:with-param name="BackupName">IRS990PFPFStatusTerminatedSect507b1A</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<span style="width: 122mm; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width: 1px; float: left;">
							<span class="styBoldText">H</span> Check type of organization: <span style="width: 2mm"/>
							<input type="checkbox" alt="Section 501(c)(3) exempt private foundation" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Organization501c3ExemptPFInd"/>
									<xsl:with-param name="BackupName">IRS990PFExemptPF</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Organization501c3ExemptPFInd"/>
									<xsl:with-param name="BackupName">IRS990PFExemptPF</xsl:with-param>
								</xsl:call-template>Section 501(c)(3) exempt private foundation
							</label>
							<br/>
							<input type="checkbox" alt="Section 4947(a)(1) nonexempt charitable trust" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Organization4947a1TrtdPFInd"/>
									<xsl:with-param name="BackupName">IRS990PFNECT</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-right: 3mm">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Organization4947a1TrtdPFInd"/>
									<xsl:with-param name="BackupName">IRS990PFNECT</xsl:with-param>
								</xsl:call-template>Section 4947(a)(1) nonexempt charitable trust
							</label>
							<input type="checkbox" alt="Other taxable private foundation" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Organization501c3TaxablePFInd"/>
									<xsl:with-param name="BackupName">IRS990PFTaxablePF</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Organization501c3TaxablePFInd"/>
									<xsl:with-param name="BackupName">IRS990PFTaxablePF</xsl:with-param>
								</xsl:call-template>Other taxable private foundation
							</label>
						</span>
					</div>
					<!-- I section starts here.-->
					<div style="width: 187mm;"><!-- float:none; clear:none-->
						<!-- Checkbox on Line F is Paper Filers Only.  It is a write in field. -->
						<div class="styEINDateAssets" style="width:65mm;height:15mm; padding-top: 1.5mm; float: right; clear:both;padding-bottom:5.35mm;">
							<span class="styBoldText" style="float: left">F </span>
							<label for="60" style="float: left; clear: none; padding-left: 2mm">If the foundation is in a 60-month termination<br/>under section 507(b)(1)(B), check here .......
							</label> 
							<span style="float:right;">
								<span style="padding-right: 2mm">
									<img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
								</span>
								<input type="checkbox" alt="Foundation is in a 60-month termination" class="styCkBox" id="60" onclick="return false;"/>
							</span>						
						</div>
						<span style="width: 55mm; float: left; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px;padding-top:1mm; height: 15mm">
							<span class="styBoldText">I </span> 
								Fair market value of all assets at end<br/>
							<span style="width: 2mm"/>of year (from Part II, col. (c),
							<br/>
							<span style="width: 2mm"/>
							<span class="styItalicText">line 16)</span>							
							<span style="width: 2mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styBoldText">$</span>
							<span style="width: 2mm"/>
							<span class="styIRS990PFUnderlinedText">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FMVAssetsEOYAmt"/>
								</xsl:call-template>
							</span>
						</span>
						<span style="width: 67mm; float: left; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px; height: 15mm; padding-left: 2mm">
							<span class="styBoldText">J </span> Accounting method: <span style="width: 2mm"/>
							<input type="checkbox" alt="MethodOfAccountingCash" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-right: 3mm">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template> Cash</label>
							<input type="checkbox" alt="MethodOfAccountingAccrual" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-right: 3mm">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template> Accrual</label>
							<br/>
							<span style="width: 2mm"/>
							<input type="checkbox" alt="MethodOfAccountingOther" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOtherInd"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-right: 3mm">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOtherInd"/>
									<xsl:with-param name="BackupName">IRS990PFMethodOfAccountingOther</xsl:with-param>
								</xsl:call-template> Other (specify)</label>
							<span class="styIRS990PFUnderlinedText">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
								</xsl:call-template>
							</span>
							<br/>
							<span class="styItalicText">(Part I, column (d) must be on cash basis.)</span>
						</span>
						<!-- I section ends here.-->
				</div>
					<!-- BEGIN Part I -->
					<!--<div>-->
					<table class="styTable" style="font-size: 7pt; border-color:black; width: 187mm;clear:none;" cellspacing="0"><!--float:left-->
						<thead style="font-size: 6pt">
							<tr scope="col">
								<th scope="col" class="styTableCellHeader" colspan="2" 
									style="height: 4mm; width: 12mm; border-bottom-width: 0px; border-right-width: 0px">
									<span class="styPartName" style="width: 12mm; height:4mm">Part I</span>
								</th>
								<th scope="col" class="styTableCellHeader" valign="top" rowspan="3" colspan="2" 
									style="height: 4mm; width: 71mm; text-align: left">
									<span class="styPartDesc" style="width: 71mm; font-size: 8pt;">
									  Analysis of Revenue and Expenses
									  <i style="font-size: 6pt;font-weight:normal">
											<!--<span class="styItalicText">-->(The total of amounts in columns (b), (c), and (d) may not necessarily equal the amounts in column (a) (see instructions).)<!--</span>-->
										</i>
									</span>
								</th>
								<th scope="col" class="styTableCellHeader"  rowspan="3" colspan="2" style="height: 4mm; width: 29mm;">
									<span class="styBoldTex" style="float:left">(a)</span>
									<span class="styNormalText">
									  Revenue and<br/>expenses per<br/>books
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" rowspan="3" style="height: 4mm; width: 25mm">
									<span class="styBoldTex" style="float:left">(b)</span>
									<span class="styNormalText">
									  Net investment<br/>income
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" rowspan="3" style="height: 4mm; width: 25mm">
									<span class="styBoldTex" style="float:left">(c)</span>
									<span class="styNormalText">
									  Adjusted net<br/>income
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" rowspan="3" style="height: 4mm; width: 25mm; border-right-width: 0px">
									<span class="styBoldTex" style="float:left">(d)</span>
									<span class="styNormalText">
									  Disbursements<br/>for charitable<br/>purposes<br/>(cash basis only)
									</span>
								</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCellHeader" colspan="2" style="height: 4mm; width: 12mm; border-bottom-width: 0px; border-right-width: 0px;">
									<span class="styTableCellPad"/>
								</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 6mm;border-right-width: 0px;">
									<span class="styTableCellPad"/>
								</th>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 6mm; border-right-width: 0px;">
									<span class="styTableCellPad"/>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<!-- Begin Part I Revenue Section -->
							<tr>
								<td class="styIRS990VTImageBox" style="width: 4mm; border-right: 1px solid black; border-top-width: 0px; border-bottom: 1px solid black" 
									rowspan="16" valign="middle">
									<img src="{$ImagePath}/990PF_Revenue.gif" alt="Revenue"/>
								</td>							
								<td class="styLNLeftNumBox" style="width:4mm; padding-left: 2mm;">1</td>
								<td class="styIRS990PFLNDesc" colspan="2" style="border-right-width:0px;" ><!--colspan="2"-->
								<!--<td class="styIRS990PFLNDesc" style="font-size: 7pt; padding-top: 1mm" colspan="2">-->
									<span style="">Contributions, gifts, grants, etc., received (attach schedule)	
							<!--		<span class="styDotLn" style="float:right" >...........</span>-->
								</span>
								</td>
					<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; boder-bottom-width:1px; float:none;width: 29mm;vertical-align:bottom;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/ContriRcvdRevAndExpnssAmt"/>
					</xsl:call-template>
				</td>							
				<td class="styIRS990PFShadingCell"  style="border-right-width:1px;  border-bottom-width: 1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS990PFShadingCell" style="border-right-width:1px;  border-bottom-width: 1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS990PFShadingCell" style=" border-bottom-width: 1px; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<tr>
				<td class="styLNLeftNumBox" style=" width: 4mm; padding-top:2mm;padding-left: 2mm;">2</td>
				<td class="styIRS990PFLNDesc"  colspan="2" style=" font-size: 7pt;padding-left:2mm ; border-right-width:0px" > Check 
				<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>					
					<input type="checkbox" alt="NotRequiredToAttachScheduleB" class="styCkBox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/ScheduleBNotRequiredInd"/>
							<xsl:with-param name="BackupName">IRS990PFNotRequiredToAttachScheduleB</xsl:with-param>
						</xsl:call-template>if the foundation is <span class="styBoldText">not</span> required to attach Sch. B 
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/ScheduleBNotRequiredInd"/>
								<xsl:with-param name="BackupName">IRS990PFNotRequiredToAttachScheduleB</xsl:with-param>
							</xsl:call-template> 
						</label>
					</input>
					<span class="styDotLn" style="float:right" >.............</span>
				</td>		
				<td class="styIRS990PFShadingCell" colspan="2" style=" width:29mm;border-right-width:1px; border-left-width: 1px; border-bottom-width: 1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS990PFShadingCell" style="border-right-width:1px;  border-bottom-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS990PFShadingCell" style="border-right-width:1px;  border-bottom-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS990PFShadingCell" style=" border-bottom-width: 1px; border-right-width:0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<tr>
				<td class="styLNLeftNumBox" style=" width: 4mm; padding-left: 2mm;">3</td>
				<td class="styIRS990PFLNDesc" colspan="2" style="padding-left:2mm; border-right-width:0px;">Interest on savings and temporary cash investments</td>
				<td class="styIRS990PFLNAmountBox"  colspan="2" style="border-right-width:1px; border-left-width: 1px;float:none; width:29mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestOnSavRevAndExpnssAmt"/>
					</xsl:call-template>
				</td>
				<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestOnSavNetInvstIncmAmt"/>
					</xsl:call-template>
				</td>
				<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestOnSavingsAdjNetIncmAmt"/>
					</xsl:call-template>
				</td>
				<td class="styIRS990PFShadingCell" style="border-right-width:0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<tr>
				<td class="styLNLeftNumBox" style="; width: 4mm;padding-left: 2mm;">4</td>
				<td class="styIRS990PFLNDesc" colspan="2" style=" float:none;border-right-width:0px " >
					<span style="">Dividends and interest from securities</span>
					<span class="styDotLn" style="float:right">...</span>	
				</td>				
				<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 1px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DividendsRevAndExpnssAmt"/>
						</xsl:call-template>
					</td>
					<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DividendsNetInvstIncmAmt"/>
						</xsl:call-template>
					</td>
					<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DividendsAdjNetIncmAmt"/>
						</xsl:call-template>
					</td>
					<td class="styIRS990PFShadingCell" style="border-right-width:0px">
						<span class="styTableCellPad"/>
					</td>
				</tr>
				<tr>					
						<td class="styLNLeftNumBox" style="width: 4mm;padding-left: 2mm;">5a</td>
						<td class="styIRS990PFLNDesc" colspan="2" style="border-right-width:0px;float:none" >
							<span style="">Gross rents</span>
							<span class="styDotLn" style="float:right">............</span>
						</td>
					<td class="styIRS990PFLNAmountBox" colspan="2"  style="border-right-width:1px; border-left-width: 1px; width:29mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossRentsRevAndExpnssAmt"/>
						</xsl:call-template>
					</td>
					<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px; ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossRentsNetInvstIncmAmt"/>
						</xsl:call-template>
					</td>
					<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossRentsAdjNetIncmAmt"/>
						</xsl:call-template>
					</td>
					<td class="styIRS990PFShadingCell" style="border-right-width:0px; float:none">
						<span class="styTableCellPad"/>
					</td>
				</tr>
							<tr>
								<td class="styLNLeftLtrBox" style=" width: 4mm;padding-left: 3.5mm;">b</td>								
								<td class="styIRS990PFLNDesc" colspan="2">Net rental income or (loss)
									<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right; float:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NetRentalIncomeOrLossAmt"/>
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
									<!--<span style="width:2px;"/>-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NetGainSaleAstRevAndExpnssAmt"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NetGainSaleAstRevAndExpnssAmt"/>
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
								<td class="styIRS990PFLNDesc" colspan="2" style="font-size: 7pt; padding-top: 1mm">Gross sales price for all assets on line 6a
        <span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right; width:22mm; float:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossSalesPriceAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CapGainNetIncmNetInvstIncmAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NetSTCapitalGainAdjNetIncmAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/IncmModificationsAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: .5mm; width: 4mm">10a</td>
								<td class="styIRS990PFLNDesc" style="padding-top: 1mm; font-size: 7pt; width: 54mm">Gross sales less returns and allowances</td>
								<td class="styLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px; width: 22mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossSalesLessRetAndAllwncAmt"/>
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
								<td class="styLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px; width: 22mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CostOfGoodsSoldAmt"/>
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
									<!--<span style="width:2px;"/>-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossProfitRevAndExpnssAmt"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossProfitRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/GrossProfitAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left:2mm; width: 4mm">11</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float:left; clear:none">Other income (attach schedule)</span>
									<span class="styDotLn" style="float:right">.......</span>
								</td>
								<td class="styIRS990PFFormLinkBox">
									<!--<span style="width:2px;"/>-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherIncomeRevAndExpnssAmt"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherIncomeRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherIncomeNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherIncomeAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-right-width:0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 2mm; width: 7mm; height:5mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom: 1px solid black; padding-top:.5mm">12</td>
								<td class="styIRS990PFLNDesc" colspan="2" style="border-bottom: 1px solid black ">
									<span style="float:left; clear:none">
										<span class="styBoldText">Total. </span> Add lines 1 through 11</span>
									<span class="styDotLn" style="float:right">........</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalAdjNetIncmAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CompOfcrDirTrstRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CompOfcrDirTrstNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CompOfcrDirTrstAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/CompOfcrDirTrstDsbrsChrtblAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OthEmplSlrsWgsRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OthEmplSlrsWgsNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OthEmplSlrsWgsAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OthEmplSlrsWgsDsbrsChrtblAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PensionEmplBnftRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PensionEmplBnftNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PensionEmplBnftAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PensionEmplBnftDsbrsChrtblAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/LegalFeesRevAndExpnssAmt"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/LegalFeesRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/LegalFeesNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/LegalFeesAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/LegalFeesDsbrsChrtblAmt"/>
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
									<!--<span style="width:2px;"/>-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AccountingFeesRevAndExpnssAmt"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AccountingFeesRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AccountingFeesNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AccountingFeesAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AccountingFeesChrtblPrpsAmt"/>
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
									<!--<span style="width:2px;"/>-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherProfFeesRevAndExpnssAmt"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherProfFeesRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherProfFeesNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherProfFeesAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherProfFeesDsbrsChrtblAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/InterestDsbrsChrtblAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width:4mm">18</td>
								<td class="styIRS990PFLNDesc" style="font-size: 7pt; padding-top: 1mm" colspan="2">
									<span style="float: left">Taxes (attach schedule) (see instructions)</span>
									<span class="styDotLn" style="float:right">...</span>
								</td>
								<td class="styIRS990PFFormLinkBox">
									<!--<span style="width:2px;"/>-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TaxesRevAndExpnssAmt"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TaxesRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TaxesNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TaxesAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TaxesDsbrsChrtblAmt"/>
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
									<!--<span style="width:2px;"/>-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DeprecAndDpltnRevAndExpnssAmt"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DeprecAndDpltnRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DeprecAndDpltnNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/DeprecAndDpltnAdjNetIncmAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OccupancyRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OccupancyNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OccupancyAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OccupancyDsbrsChrtblAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TravConfMeetingRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TravConfMeetingNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TravConfMeetingAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TravConfMeetingDsbrsChrtblAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PrintingAndPubRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PrintingAndPubNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PrintingAndPubAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/PrintingAndPubDsbrsChrtblAmt"/>
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
									<!--<span style="width:2px;"/>-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherExpensesRevAndExpnssAmt"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherExpensesRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherExpensesNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherExpensesAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/OtherExpensesDsbrsChrtblAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotOprExpensesRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotOprExpensesNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotOprExpensesAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px; border-right-width:0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotOprExpensesDsbrsChrtblAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="width: 4mm">25</td>
								<td class="styIRS990PFLNDesc" colspan="2">
									<span style="float:left; clear:none">Contributions, gifts, grants paid</span>
									<span class="styDotLn" style="float:right">.......</span>
								</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/ContriPaidRevAndExpnssAmt"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/ContriPaidDsbrsChrtblAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="border-color: black; border-style: solid; border-left-width: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; padding-top:1mm; width: 7mm;height:8mm">26</td>
								<td class="styIRS990PFLNDesc" colspan="2" style="border-bottom-width: 1px; font-size: 7pt; padding-top: 1mm">
									<span class="styBoldText">Total expenses and disbursements. </span> Add lines 24 and 25</td>
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm;vertical-align:bottom">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalExpensesRevAndExpnssAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px;vertical-align:bottom">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalExpensesNetInvstIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px;vertical-align:bottom">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalExpensesAdjNetIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-left-width: 0px; border-right-width:0px;vertical-align:bottom">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/TotalExpensesDsbrsChrtblAmt"/>
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
								<td class="styIRS990PFLNAmountBox" colspan="2" style="border-right-width:1px; border-left-width: 0px; width: 29mm;vertical-align:bottom">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/ExcessRevenueOverExpensesAmt"/>
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
								<td class="styIRS990PFLNAmountBox" style="font-size: 6pt; border-right-width:1px; border-left-width: 0px;vertical-align:bottom">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/NetInvestmentIncomeAmt"/>
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
								<td class="styLNLeftLtrBox" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width:7mm; height:5mm">c</td>
								<td class="styIRS990PFLNDesc" style="border-bottom-width: 1px" colspan="2">
									<span style="float:left; clear: none">
										<span class="styBoldText">Adjusted net income </span> (if negative, enter -0-)</span>
									<span class="styDotLn" style="float:right">...</span>
								</td>
								<td class="styIRS990PFShadingCell" colspan="2" style="width: 29mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFShadingCell">
									<span class="styTableCellPad"/>
								</td>
								<td class="styIRS990PFLNAmountBox" style="border-right-width:1px; border-left-width: 0px;vertical-align:bottom">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisOfRevenueAndExpenses/AdjustedNetIncomeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS990PFShadingCell" style="border-left-width: 0px; border-right-width: 0px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</tbody>
					</table>
					<!--</div>-->
					<!-- END Part I -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm; float: none; clear: none">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
						</div>
						<div style="float:right">Cat. No. 11289X 
						<span style="width:60px"/>
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
  </div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
							Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->
					<div class="styTableContainer" style="border-top-width: 1px; border-bottom-width: 1px; width: 187mm; height: auto">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead style="font-size: 6pt">
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" rowspan="2" colspan="2" style="height: 4mm; width: 12mm; border-right-width: 0px">
										<span class="styPartName" style="width: 12mm; height:5mm">Part II</span>
									</th>
									<th scope="col" class="styTableCellHeader" rowspan="2" style="text-align: left; width: 25mm; border-right-width: 0px">
										<span class="styPartDesc" style="font-size: 7pt; width: 25mm">
											  Balance Sheets 
										</span>
									</th>
									<th scope="col" class="styTableCellHeader" rowspan="2" style="width: 65mm">
										<span class="styNormalText" style="font-size: 6pt; width: 65mm; text-align: left">
											Attached schedules and amounts in the description column
											<br/>should be for end-of-year amounts only. (See instructions.)
										</span>
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
									<th scope="col" class="styTableCellHeader" style="width: 26mm;">(a)
									        <span class="styNormalText">Book Value</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 26mm;">(b)
										<span class="styNormalText">
											  Book Value
										</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 26mm; border-right-width: 0px;">(c)
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
									<td class="styIRS990VTImageBox" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; 
										border-top-width: 0px; border-bottom-width: 1px" rowspan="25" valign="middle">
										<img src="{$ImagePath}/990PF_Assets.gif" alt="Assets"/>
									</td>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">1</td>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span style="float: left">Cash—non-interest-bearing</span>
										<span class="styDotLn" style="float:right">.............</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; font-size: 6pt; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CashBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CashEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width:0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CashEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">2</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Savings and temporary cash investments</span>
										<span class="styDotLn" style="float:right">.........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px;; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/SavAndTempCashInvstBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/SavAndTempCashInvstEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/SavAndTempCashInvstEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">3</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Accounts receivable 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/AcctRcvblAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Less: allowance for doubtful accounts 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/AcctRcvblAllwncDbtflAcctAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/AcctRcvblBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/AcctRcvblEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/AcctRcvblEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">4</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Pledges receivable 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/PledgesRcvblAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Less: allowance for doubtful accounts 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/PledgesRcvblAllwncDbtflAcctAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/PledgesRcvblBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/PledgesRcvblEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/PledgesRcvblEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">5</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Grants receivable</span>
										<span class="styDotLn" style="float:right">.................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/GrantsReceivableBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/GrantsReceivableEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/GrantsReceivableEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">6</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Receivables due from officers, directors, trustees, and other</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width: 4mm; padding-left: 2mm;"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm;">
									<span style="float: left">disqualified persons (attach schedule) (see instructions)</span>
									<span class="styDotLn" style="float:right">.....</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/RcvblFromOfficersBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/RcvblFromOfficersEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/RcvblFromOfficersEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/RcvblFromOfficersEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm">7</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm;">Other notes and loans receivable (attach schedule) 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right;width:19mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherNtsAndLoansRcvblAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Less: allowance for doubtful accounts 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherRcvblAllwncDbtflAcctAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherNtsAndLoansRcvblBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherNtsAndLoansRcvblEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherNtsAndLoansRcvblEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherNtsAndLoansRcvblEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm; ">8</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Inventories for sale or use</span>
										<span class="styDotLn" style="float:right">..............</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/InventoriesBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/InventoriesEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/InventoriesEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 2mm; ">9</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Prepaid expenses and deferred charges</span>
										<span class="styDotLn" style="float:right">..........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/PrepaidExpensesBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/PrepaidExpensesEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/PrepaidExpensesEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width: 4mm; padding-left: .5mm; ">10a</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Investments—U.S. and state government obligations (attach schedule)</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/USGovernmentObligationsBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/USGovernmentObligationsEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/USGovernmentObligationsEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/USGovtObligationsEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 4mm;">b</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Investments—corporate stock (attach schedule)</span>
										<span class="styDotLn" style="float:right">.......</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CorporateStockBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CorporateStockEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CorporateStockEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CorporateStockEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm; padding-left: 4mm; ">c</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Investments—corporate bonds (attach schedule)</span>
										<span class="styDotLn" style="float:right">.......</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CorporateBondsBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CorporateBondsEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CorporateBondsEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CorporateBondsEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">11</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Investments—land, buildings, and equipment: basis 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 21.5mm; font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/InvstLandCostOrOtherBasisAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Less: accumulated depreciation (attach schedule) 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 23mm; font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/InvstLandAccumDepreciationAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px;float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LandBldgInvestmentsBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LandBldgInvestmentsEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LandBldgInvestmentsEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LandBldgInvestmentsEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">12</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Investments—mortgage loans</span>
										<span class="styDotLn" style="float:right">.............</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/MortgageLoansBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/MortgageLoansEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/MortgageLoansEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">13</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear:none">Investments—other (attach schedule)</span>
										<span class="styDotLn" style="float:right">..........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherInvestmentsBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherInvestmentsEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherInvestmentsEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherInvestmentsEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">14</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Land, buildings, and equipment: basis 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LandBldgEquipCostOrOtherBssAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Less: accumulated depreciation (attach schedule) 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 21.5mm; font-size: 6pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LandBldgEquipAccumDeprecAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LandBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LandEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LandEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LandEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">15</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Other assets (describe 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 50mm"/>)
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px;float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherAssetsBOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherAssetsBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherAssetsEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherAssetsEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherAssetsEOYFMVAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherAssetsEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">16</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span class="styBoldText">Total assets </span> (to be completed by all filers—see the</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="height:5mm; width: 8mm; border-color: black; border-style:solid; border-top-width: 0px; border-bottom-width
										: 1px; border-right-width: 0px; border-left-width: 0px">
										<span style="width: 1px"/>
									</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm; border-bottom-width: 1px">instructions. Also, see page 1, item I)</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/TotalAssetsBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/TotalAssetsEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:0px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/TotalAssetsEOYFMVAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--  Lines 17 through 23  -->
								<tr>
									<td class="styIRS990VTImageBox" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px;
										 border-top-width: 0px; border-bottom-width: 1px" rowspan="7" valign="middle">
										<img src="{$ImagePath}/990PF_Liabilities.gif" alt="Liabilities"/>
									</td>
									<td class="styLNLeftNumBox" style="width: 4mm">17</td>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span style="float: left">Accounts payable and accrued expenses</span>
										<span class="styDotLn" style="float:right">..........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; font-size: 6pt; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/AccountsPayableBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/AccountsPayableEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">18</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Grants payable</span>
										<span class="styDotLn" style="float:right">.................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/GrantsPayableBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/GrantsPayableEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">19</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Deferred revenue</span>
										<span class="styDotLn" style="float:right">.................</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/DeferredRevenueBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/DeferredRevenueEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">20</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Loans from officers, directors, trustees, and other disqualified persons</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LoansFromOfficersBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LoansFromOfficersEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/LoansFromOfficersEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">21</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Mortgages and other notes payable (attach schedule)</span>
										<span class="styDotLn" style="float:right">......</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/MortgagesAndNotesPayableBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/MortgagesAndNotesPayableEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/MortgagesAndNotesPayableEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">22</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Other liabilities (describe 
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<!--<span style="width: 1mm"/>-->
										<span class="styIRS990PFUnderlinedText" style="width: 50mm"/>)
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherLiabilitiesBOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherLiabilitiesBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<span style="float: left">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherLiabilitiesEOYAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OtherLiabilitiesEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 8mm; height:5mm; border-color: black; border-style:solid; border-top-width: 0px;
										 border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px">23</td><!-- height: 8mm;padding-top: 4mm;-->
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm;   border-bottom-width: 1px"><!--height: 8mm;padding-top: 4mm;-->
										<span style="float: left">
											<span class="styBoldText">Total liabilities </span>(add lines 17 through 22)</span>
										<span class="styDotLn" style="float:right">.........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px;; float:none  "><!--height: 8mm;padding-top: 4mm-->
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/TotalLiabilitiesBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; ; float:none "><!--height: 8mm;padding-top: 4mm-->
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/TotalLiabilitiesEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px;; float:none  "><!--height: 8mm;padding-top: 4mm-->
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- Lines 24 through 31  -->
								<tr>
									<td class="styIRS990VTImageBox" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; 
										border-top-width: 0px; border-bottom-width: 1px" rowspan="14" valign="middle">
										<img src="{$ImagePath}/990PF_NAFB.gif" alt="Net Assets or Fund Balances"/>
									</td>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span class="styBoldText">Foundations that follow FASB ASC 958, check here
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" 
													select="$FormData/Form990PFBalanceSheetsGrp/OrganizationFollowsFASB117Ind"/>
													<xsl:with-param name="BackupName">IRS990PFOrgThatFollowSFAS117</xsl:with-param>
												</xsl:call-template>
											</label>
										</span>
										<span style="width: 1.5mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 2.5mm"/>
										<input type="checkbox" alt="FoundationsThatFollowSFAS117" class="styCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" 
												select="$FormData/Form990PFBalanceSheetsGrp/OrganizationFollowsFASB117Ind"/>
												<xsl:with-param name="BackupName">IRS990PFOrgThatFollowSFAS117</xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; font-size: 6pt; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span class="styBoldText">and complete lines 24, 25, 29 and 30.</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">24</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Net assets without donor restrictions</span>
										<span class="styDotLn" style="float:right">...........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/NoDonorRstrNetAssestsBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/NoDonorRstrNetAssestsEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">25</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Net assets with donor restrictions</span>
										<span class="styDotLn" style="float:right">............</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/DonorRstrNetAssetsBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/DonorRstrNetAssetsEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr><!--
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">26</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Permanently restricted</span>
										<span class="styDotLn" style="float:right">...............</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/PermanentlyRestrictedBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/PermanentlyRestrictedEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>-->
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span class="styBoldText">Foundations that do not follow FASB ASC 958, check here
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" 
													select="$FormData/Form990PFBalanceSheetsGrp/OrgDoesNotFollowFASB117Ind"/>
													<xsl:with-param name="BackupName">IRS990PFOrgThatDoNotFollowSFAS117</xsl:with-param>
												</xsl:call-template>
											</label>
										</span>
										<span style="width: 1.5mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1.5mm"/>
										<input type="checkbox" alt="FoundationsThatDoNotFollowSFAS117" class="styCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/OrgDoesNotFollowFASB117Ind"/>
												<xsl:with-param name="BackupName">IRS990PFOrgThatDoNotFollowSFAS117</xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm"/>
									<td class="styIRS990PFLNDesc" style="width: 94mm" colspan="2">
										<span class="styBoldText">and complete lines 26 through 30.</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">26</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float: left">Capital stock, trust principal, or current funds</span>
										<span class="styDotLn" style="float:right">........</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CapitalStockBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/CapitalStockEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">27</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Paid-in or capital surplus, or land, bldg., and equipment fund</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/AdditionalPaidInCapitalBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/AdditionalPaidInCapitalEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">28</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">Retained earnings, accumulated income, endowment, or other funds</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/RetainedEarningBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/RetainedEarningEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">29</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear: none">
											<span class="styBoldText">Total net assets or fund balances </span> (see instructions)</span>
										<span class="styDotLn" style="float:right">.....</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/TotNetAstOrFundBalancesBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/TotNetAstOrFundBalancesEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 4mm">30</td>
									<td class="styIRS990PFLNDesc" colspan="2" style="width: 94mm">
										<span style="float:left; clear: none">
											<span class="styBoldText">Total liabilities and net assets/fund balances </span> (see instructions)</span>
										<span class="styDotLn" style="float:right">.</span>
									</td>
									<td class="styLNAmountBoxSmall" style="border-left-width:0px; border-right-width: 1px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/TotalLiabilitiesNetAstBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxSmall" style="border-right-width:1px; border-left-width: 0px; float:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form990PFBalanceSheetsGrp/TotalLiabilitiesNetAstEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCellSmall" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 1px; float:none">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  Part III  -->
					<div style="width:187mm;border-top-width:1px;" class="styBB">
						<div class="styPartName" style="height:auto">Part III</div>
						<div class="styPartDesc" style="width: 160mm; padding-left:3mm;">
							Analysis of Changes in Net Assets or Fund Balances 
						</div>  
		<div class="styBB" style="width:187mm;border-top:1px solid black;">
			<!--  BEGIN LINE 1  -->
				<div style="width:187mm;">
					<div class="styLNLeftNumBoxSD" style="height:auto;">1</div>
					<div class="styLNDesc" style="border: 0 solid black;height:auto;width:132mm">
						Total net assets or fund balances at beginning of year—Part II, column (a), line 29 (must agree
						with end-of-year figure reported on prior year’s return)
						<span class="styDotLn" style="float:right">...............</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.75mm;border-bottom-width:1px">1</div>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.75mm;border-bottom-width:1px;width:32mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/TotNetAstOrFundBalancesBOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--  BEGIN LINE 2  -->
				<div style="width:187mm;">
					<div class="styLNLeftNumBoxSD" style="height:auto;">2</div>
					<div class="styLNDesc" style="border: 0 solid black;height:auto;width:132mm">
							Enter amount from Part I, line 27a
							<span class="styDotLn" style="float:right">.....................</span>
					</div>
					<div class="styLNRightNumBox" style=";border-bottom-width:1px">2</div>
					<div class="styLNAmountBox" style=";border-bottom-width:1px;width:32mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/ExcessRevenueOverExpensesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--  BEGIN LINE 3  -->
				<div style="width:187mm;">
					<div class="styLNLeftNumBoxSD" style="height:auto;">3</div>
					<div class="styLNDesc" style="border: 0 solid black;height:auto;width:132mm">
									Other increases not included in line 2 (itemize)
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 58mm"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/OtherIncreasesAmt"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>
					</div>
					<div class="styLNRightNumBox" style=";border-bottom-width:1px">3</div>
					<div class="styLNAmountBox" style=";border-bottom-width:1px;width:32mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/OtherIncreasesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--  BEGIN LINE 4  -->
				<div style="width:187mm;">
					<div class="styLNLeftNumBoxSD" style="height:auto;">4</div>
					<div class="styLNDesc" style="border: 0 solid black;height:auto;width:132mm">
							Add lines 1, 2, and 3
							<span class="styDotLn" style="float:right">..........................</span>
					</div>
					<div class="styLNRightNumBox" style=";border-bottom-width:1px">4</div>
					<div class="styLNAmountBox" style=";border-bottom-width:1px;width:32mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="										  		$FormData/ChgInNetAssetsFundBalancesGrp/SubtotalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--  BEGIN LINE 5  -->
				<div style="width:187mm;">
					<div class="styLNLeftNumBoxSD" style="height:auto;">5</div>
					<div class="styLNDesc" style="border: 0 solid black;height:auto;width:132mm">
								Decreases not included in line 2 (itemize)
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 64mm"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/OtherDecreasesAmt"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>
					</div>
					<div class="styLNRightNumBox" style=";border-bottom-width:1px">5</div>
					<div class="styLNAmountBox" style=";border-bottom-width:1px;width:32mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="										  		$FormData/ChgInNetAssetsFundBalancesGrp/OtherDecreasesAmt"/>
						</xsl:call-template>
					</div>
				</div>	
				<!--  BEGIN LINE 6  -->
				<div style="width:187mm;">
					<div class="styLNLeftNumBoxSD" style="height:auto;">6</div>
					<div class="styLNDesc" style="border: 0 solid black;height:auto;width:132mm">
							Total net assets or fund balances at end of year (line 4 minus line 5)—Part II, column (b), line 29
							<span class="styDotLn" style="float:right">.</span>
					</div>
					<div class="styLNRightNumBox" style="height:auto;border-bottom-width:0px">6</div>
					<div class="styLNAmountBox" style=";border-bottom-width:0px;width:32mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="										  		$FormData/ChgInNetAssetsFundBalancesGrp/TotNetAstOrFundBalancesEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>										
		</div>			
		<!--   *************************************************************-->			
<!--					<div class="styTableContainer" style="width: 187mm; height:auto ">--><!--36mm--><!--
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" colspan="2" style=" border-right-width: 0px; width: 14mm">--><!--height: 8mm;--><!--
										<span class="styPartName" style="width: 14mm; height: 4mm">Part III</span>
									</th>
									<th scope="col" class="styTableCellHeader" colspan="2" style="text-align: left; border-right-width: 0px; width: 170mm;">
										<span class="styPartDesc" style="text-align: left; width: 170mm;">
          Analysis of Changes in Net Assets or Fund Balances 
        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styLNLeftNumBox" style="width:4mm;">1</td>
									<td class="styLNDesc" colspan="2" style="width: 10mm; float:none">Total net assets or fund balances at beginning of year—Part II, column (a), line 30 (must agree</td>
									<td class="styLNRightNumBox" style="border-bottom-width: 0px; float:none">
										<span style="width: 1px"/>
									</td>
									<td class="styLNAmountBox" style="border-right-width:0px; border-bottom-width: 0px; float:none">
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
											<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/TotNetAstOrFundBalancesBOYAmt"/>
										</xsl:call-template>
									</td>
								</tr> -->
<!--								<tr>
									<td class="styLNLeftNumBox">2</td>
									<td class="styLNDesc" style="width: 139mm">
										<span style="float: left">Enter amount from Part I, line 27a</span>
										<span class="styDotLn" style="float:right">.....................</span>
									</td>
									<td class="styLNRightNumBox">2</td>
									<td class="styLNAmountBox" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/ExcessRevenueOverExpensesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox">3</td>
									<td class="styLNDesc" style="width: 139mm">Other increases not included in line 2 (itemize)
        <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 58mm"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/OtherIncreasesAmt"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>
									</td>
									<td class="styLNRightNumBox">3</td>
									<td class="styLNAmountBox" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/OtherIncreasesAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/SubtotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox">5</td>
									<td class="styLNDesc" style="width: 139mm">Decreases not included in line 2 (itemize)
        <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 1mm"/>
										<span class="styIRS990PFUnderlinedText" style="width: 64mm"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/OtherDecreasesAmt"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>
									</td>
									<td class="styLNRightNumBox">5</td>
									<td class="styLNAmountBox" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/OtherDecreasesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox">6</td>
									<td class="styLNDesc" style="width: 139mm">
										<span style="float: left">Total net assets or fund balances at end of year (line 4 minus line 5)—Part II, column (b), line 30</span>
										<span class="styDotLn" style="float:right">.</span>
									</td>
									<td class="styLNRightNumBox" style="border-bottom-width: 0px">6</td>
									<td class="styLNAmountBox" style="border-right-width:0px; border-bottom-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChgInNetAssetsFundBalancesGrp/TotNetAstOrFundBalancesEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
						</tbody>
						</table>-->
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
							Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
						</div>
					</div>					
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
							Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					<!--END HEADER-->
					<div style="width:187mm;border-top-width:1px; height:5mm" class="styBB">
						<div class="styPartName" style="height:auto">Part IV</div>
						<div class="styPartDesc" style="width: 160mm; padding-left:3mm;">
							Capital Gains and Losses for Tax on Investment Income 
						</div>
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp"/>
								<xsl:with-param name="setDynamicHeight" select="5"/>
								<xsl:with-param name="containerID" select="'AthruDctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Part IV  -->
					<div class="styTableContainer" style="width:187mm;height:auto;border-bottom-width:0px;" id="AthruDctn" >
						<!--<xsl:call-template name="SetInitialState"/>-->
						<table class="styTable" style="font-size: 7pt;border-color:black;" cellspacing="0">
							<thead class="styTableThead">
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" style="width: 113mm" colspan="2">
									  <span class="styNormalText"><b>(a) </b>List and describe the kind(s) of property sold (e.g., real estate,<br/>
									  <span style="width: 4mm"/>2-story brick warehouse; or common stock, 200 shs. MLC Co.)</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="text-align: center; width: 24mm">
									  (b) <br/><span class="styNormalText">How acquired<br/>P—Purchase<br/>D—Donation</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 25mm">
									  (c) <br/><span class="styNormalText">Date acquired<br/>(mo., day, yr.)</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 25mm; border-right-width: 0px">
									  (d) <br/><span class="styNormalText">Date sold<br/>(mo., day, yr.)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &lt; 6)">
									<xsl:for-each select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp">
										<tr>
											<td  style="width: 8mm;font-weight:bold; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; 
											border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm;"><!--height:auto class="styLNLeftNumBox"-->
												<xsl:if test="position()=1">
													<xsl:attribute name="style">width: 8mm;font-weight:bold; border-color: black; border-style: solid; border-right-width: 0px; 
													border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 3mm</xsl:attribute>1
											   </xsl:if>
												<xsl:call-template name="GenerateLetter"/>
											</td>
											<td class="styTableCell" style="width: 105mm; text-align: left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 24mm; text-align: center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="HowAcquiredCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 25mm; text-align: center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AcquiredDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 25mm; border-right-width:0px; text-align: center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SoldDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="($Print = $Separated) and (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt; 5)">
										<xsl:call-template name="AdditionalRowsCapitalGains1">
											<xsl:with-param name="RowCount" select="1"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="AdditionalRowsCapitalGains1">
											<xsl:with-param name="RowCount" select="count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) +1"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp"/>
						<xsl:with-param name="setDynamicHeight" select="6"/>
						<xsl:with-param name="containerID" select=" 'AthruDctn' "/>
						<xsl:with-param name="headerRowCount" select="2"/> <!--  -->
					</xsl:call-template>
					<xsl:if test="(count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt; 5) and $Print=''">
						<div class="styGenericDiv" style="width:187mm;height:auto">
							<div style="float:right">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp"/>
									<xsl:with-param name="setDynamicHeight" select="5"/>
									<xsl:with-param name="containerID" select="'EthruHctn'"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<div class="styTableContainer" style="width:187mm;height:34mm;border-color:black;border-bottom-width:0px;border-top-width:1px;" id="EthruHctn">
						<!--<xsl:call-template name="SetInitialState"/>-->
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" style="width: 39mm;padding-left: 2mm" colspan="2">
										  (e)<br/> <span class="styNormalText">Gross sales price</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 45mm">
										  (f)<br/> <span class="styNormalText">Depreciation allowed<br/>(or allowable)</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 45mm">
										  (g) <br/><span class="styNormalText">Cost or other basis<br/>plus expense of sale</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 50mm; border-right-width: 0px">
										  (h) <br/><span class="styNormalText">Gain or (loss)<br/>(e) plus (f) minus (g)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &lt;6)">
									<xsl:for-each select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp">
										<tr>
											<td class="styLNLeftLtrBox" 
											style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 
												1px; padding-left: 5mm;">
												<xsl:if test="position()=1"/>
												<xsl:call-template name="GenerateLetter"/>
											</td>
											<td class="styTableCell" style="width: 39mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 45mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DepreciationAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 45mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 50mm; border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="($Print = $Separated) and (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt; 5)">
										<xsl:call-template name="AdditionalRowsCapitalGains2">
											<xsl:with-param name="RowCount" select="1"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="AdditionalRowsCapitalGains2">
											<xsl:with-param name="RowCount" select="count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) + 1"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp"/>
						<xsl:with-param name="setDynamicHeight" select="6"/>
						<xsl:with-param name="containerID" select=" 'EthruHctn' "/>
					</xsl:call-template>
					<xsl:if test="(count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt; 5) and $Print=''">
						<div class="styGenericDiv" style="width:187mm">
							<div style="float:right">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp"/>
									<xsl:with-param name="setDynamicHeight" select="6"/>
									<xsl:with-param name="headerRowCount" select="2"/>
									<xsl:with-param name="containerID" select="'IthruLctn'"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<div class="styTableContainer" style="border-bottom-width:1px; width:187mm; height:38mm;" id="IthruLctn">
						<!--<xsl:call-template name="SetInitialState"/>-->
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" colspan="4" style="width: 137mm; border-top-width: 1px">
										<span class="styNormalText">Complete only for assets showing gain in column (h) and owned by the foundation on 12/31/69</span>
									</th>
									<th scope="col" class="styTableCellHeader" rowspan="2" style="width: 50mm; border-right-width: 0px; border-top-width: 1px">
										(l)<br/> <span class="styNormalText">Gains (Col. (h) gain minus<br/>col. (k), but not less than -0-) <span class="styBoldText">or</span>
											<br/>Losses (from col.(h))</span>
									</th>
								</tr>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" style="padding-left: 4mm; width: 39mm" colspan="2">
										(i)<br/> <span class="styNormalText">F.M.V. as of 12/31/69</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 45mm">
										(j)<br/> <span class="styNormalText">Adjusted basis<br/>as of 12/31/69</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 45mm">
										(k)<br/> <span class="styNormalText">Excess of col. (i)<br/>over col. (j), if any</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &lt;6)">
									<xsl:for-each select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp">
										<tr>
											<td class="styLNLeftLtrBox" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
												<xsl:if test="position()=1"/>
												<xsl:call-template name="GenerateLetter"/>
											</td>
											<td class="styTableCell" style="width: 39mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FMVAsOf123169Amt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 45mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AdjustedBasisAsOf123169Amt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 45mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExcessFMVOverAdjustedBssAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 50mm; border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainsMinusExcessOrLossesAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="($Print = $Separated) and (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt; 5)">
										<xsl:call-template name="AdditionalRowsCapitalGains2">
											<xsl:with-param name="RowCount" select="1"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="AdditionalRowsCapitalGains2">
											<xsl:with-param name="RowCount" select="count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) + 1"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp"/>
						<xsl:with-param name="setDynamicHeight" select="6"/>
						<xsl:with-param name="headerRowCount" select="2"/>
						<xsl:with-param name="containerID" select=" 'IthruLctn' "/>
					</xsl:call-template>
					<div class="styTableContainer" style="border-bottom: 0px solid black; border-top:0px solid black; width: 187mm; height:auto "><!--24mm-->
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styLNLeftNumBox"  style="padding-left: 5mm; padding-top:3mm">2</td>
									<td class="styTableCell" valign="middle" style="text-align: left;float:none;padding-left:2mm; width: 72mm; border-bottom-width: 0px; 
										border-right-width: 0px">Capital gain net income or (net capital loss)</td>
									<td class="styTableCell" style="width: 4mm; border-bottom-width: 0px; border-right-width: 0px; text-align: left">
										<img src="{$ImagePath}/990PF_Left_Bracket_Small.gif" alt="Bracket"/>
									</td>
									<td class="styTableCell" style="width: 47.75mm; border-bottom-width: 0px; border-right-width: 0px; text-align: left">If gain, also enter in Part I, 
										line 7<br/>If (loss), enter -0- in Part I, line 7</td>
									<td class="styTableCell" style="width: 4.25mm; border-right-width:0px; border-bottom-width: 0px; text-align: left">
										<img src="{$ImagePath}/990PF_Bracket_Small.gif" alt="Bracket"/>
									</td>
									<td class="styLNRightNumBox" style="width: 8mm; padding-top:6mm; height:auto">2</td>
									<td class="styLNAmountBox" style="width: 41mm; padding-top: 6mm; height:auto">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CapGainsLossTxInvstIncmDetail/CapitalGainNetIncomeAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" valign="middle" style="height:auto; padding-left: 5mm">3</td>
									<td class="styTableCell" colspan="4" 
									style="text-align: left; padding-left:2mm; width: 124.25mm;height:auto; border-bottom-width: 0px; border-right-width: 0px">Net short-term 
										capital gain or (loss) as defined in sections 1222(5) and (6):</td>
									<td class="styLNRightNumBox" style="width: 8mm; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBox" style="width: 41.5mm; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" valign="middle" style="padding-left: 5mm"/>
									<td class="styTableCell" colspan="3" 
									style="text-align: left; padding-left:2mm; width: 124.25mm; border-bottom-width: 0px; border-right-width: 0px; "><!--padding-top: 1mm-->
										If gain, also enter in Part I, line 8, column (c) (see instructions).  If (loss), enter -0- <br/>
										in Part I, line 8 
										<span class="styDotLn" style="float:right">...................</span>
									</td>
									<td class="styTableCell" style="width: 4mm; text-align:left; border-right-width:0px; border-bottom-width: 0px">
										<img src="{$ImagePath}/990PF_Bracket_Small.gif" alt="Bracket"/>
									</td>
									<td class="styLNRightNumBox" style="width: 8mm; border-bottom-width: 1px; height:auto;padding-top:3mm">3</td>
									<td class="styLNAmountBox" style="width: 41.5mm; border-bottom-width: 1px;height:auto; padding-top: 3mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/CapGainsLossTxInvstIncmDetail/NetShortTermCapitalGainLossAmt"/>
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
					<!--<div class="GenericDiv" style="width: 187mm; padding-top:0.5mm">(For optional use by domestic private foundations subject to the section 
					  4940(a) tax on net investment income.)
					</div>
					<div class="GenericDiv" style="width: 187mm"><br/>If section 4940(d)(2) applies, leave this part blank.</div>
					<div  style="width: 187mm">
					    Was the foundation liable for the section 4942 tax on the distributable amount of any year in the base period?
					    <span style="width: 39mm; padding-top:.5mm; padding-left: 2mm; text-align:right">
							<input type="checkbox" alt="LiableFor4942TaxYes" class="styCkBox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/LiableSection4942TaxInd"/>
									<xsl:with-param name="BackupName">IRS990PFLiableFor4942Tax</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 1mm"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/LiableSection4942TaxInd"/>
									<xsl:with-param name="BackupName">IRS990PFLiableFor4942Tax</xsl:with-param>
								</xsl:call-template> Yes
							</label>
							<span style="width: 2mm"/>
							<input type="checkbox" alt="LiableFor4942TaxNo" class="styCkBox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/LiableSection4942TaxInd"/>
									<xsl:with-param name="BackupName">IRS990PFLiableFor4942Tax</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 1mm"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/LiableSection4942TaxInd"/>
									<xsl:with-param name="BackupName">IRS990PFLiableFor4942Tax</xsl:with-param>
								</xsl:call-template> No
							</label>
						</span>
					</div>-->
					<div class="GenericDiv" style="width: 187mm;font-weight:bold;font-size:8pt">SECTION 4940(e) REPEALED ON DECEMBER 20, 2019 - DO NOT COMPLETE
					</div>
					<div style="font-size: 7pt; font-weight:bold; padding-left: 4mm; width:187mm; text-align: left; border-bottom:1px solid black; 
						border-right-width: 0px; border-top:1px solid black ;padding-top:.5mm;padding-bottom:.5mm;">1 
						<span class="styNormalText" style="padding-left:2mm"> Reserved<!--Enter the appropriate amount in each column for each year; see instructions before making any entries.-->
						</span>
					</div>
					<table class="styTable" style="font-size: 7pt; border-color:black;border-top: 1 solid black; width: 187mm;padding-left: 4mm;" cellspacing="0">
						<thead style="font-size: 6pt">
							<tr scope="col">
								<th scope="col" class="styTableCellHeader" style="width: 39mm">
								    (a)<br/>
									<span class="styNormalText">Reserved</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="width: 45mm">
								    (b)<br/>
									<span class="styNormalText">Reserved</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="width: 45mm">
								    (c)<br/>
									<span class="styNormalText">Reserved</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="width: 50mm; border-right-width: 0px">
								    (d)<br/>
									<span class="styNormalText">Reserved</span>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top" >
							<tr>
								<td class="styTableCell" style="width: 39mm; text-align: center"></td>
								<td class="styTableCell" style="width: 45mm">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/AdjustedQlfyDistriYr1Amt"/>
									</xsl:call-template>-->
								</td>
								<td class="styTableCell" style="width: 45mm">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/NetVlNoncharitableAssetsYr1Amt"/>
									</xsl:call-template>-->
								</td>
								<td class="styTableCell" style="width: 50mm; border-right-width:0px">
									<!--<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/DistributionYr1Rt"/>
									</xsl:call-template>-->
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 39mm; text-align: center"></td>
								<td class="styTableCell" style="width: 45mm">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/AdjustedQlfyDistriYr2Amt"/>
									</xsl:call-template>-->
								</td>
								<td class="styTableCell" style="width: 45mm">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/NetVlNoncharitableAssetsYr2Amt"/>
									</xsl:call-template>-->
								</td>
								<td class="styTableCell" style="width: 50mm; border-right-width:0px">
									<!--<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/DistributionYr2Rt"/>
									</xsl:call-template>-->
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 39mm; text-align: center"></td>
								<td class="styTableCell" style="width: 45mm">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/AdjustedQlfyDistriYr3Amt"/>
									</xsl:call-template>-->
								</td>
								<td class="styTableCell" style="width: 45mm">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/NetVlNoncharitableAssetsYr3Amt"/>
									</xsl:call-template>-->
								</td>
								<td class="styTableCell" style="width: 50mm; border-right-width:0px">
									<!--<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/DistributionYr3Rt"/>
									</xsl:call-template>-->
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 39mm; text-align: center"></td>
								<td class="styTableCell" style="width: 45mm">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/AdjustedQlfyDistriYr4Amt"/>
									</xsl:call-template>-->
								</td>
								<td class="styTableCell" style="width: 45mm">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/NetVlNoncharitableAssetsYr4Amt"/>
									</xsl:call-template>-->
								</td>
								<td class="styTableCell" style="width: 50mm; border-right-width:0px">
									<!--<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/DistributionYr4Rt"/>
									</xsl:call-template>-->
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 39mm; text-align: center"></td>
								<td class="styTableCell" style="width: 45mm">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/AdjustedQlfyDistriYr5Amt"/>
									</xsl:call-template>-->
								</td>
								<td class="styTableCell" style="width: 45mm">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/NetVlNoncharitableAssetsYr5Amt"/>
									</xsl:call-template>-->
								</td>
								<td class="styTableCell" style="width: 50mm; border-right-width:0px">
									<!--<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/DistributionYr5Rt"/>
									</xsl:call-template>-->
								</td>
							</tr>
						</tbody>
					</table>
					<div style="font-size: 7pt; width: 187mm" >
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 5mm; ">2</div>
								<div  class="styLNDesc" style="text-align: left; width: 121mm; border-bottom-width: 0px; border-right-width: 0px; ">
									<!--<span style="float: left; clear:none">
										<span class="styBoldText">Total </span> of line 1, column (d) </span>-->
									<span style="float:left; clear:none">Reserved</span>
									<span class="styDotLn" style="float:right">...........................</span>
								</div>
								<div class="styLNRightNumBox" style="; float:none;">2</div>
								<span class="styLNAmountBox" style="width: 42mm;float:none ">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/TotalDistributionRt"/>
									</xsl:call-template>-->
								</span>
							</div>
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 5mm; ">3</div>
								<div  class="styLNDesc" style="text-align: left; width: 121mm; border-bottom-width: 0px; border-right-width: 0px; ">
									<span style="float: left; clear:none"> Reserved<!--Average distribution ratio for the 5-year base period—divide the total on line 2 by 5.0, or by the 	
										number of years the foundation has been in existence if less than 5 years-->
									<span class="styDotLn" style="float:right">...........................</span>
									</span>
								</div>
								<div class="styLNRightNumBox" style="float:none">3</div>
								<span class="styLNAmountBox" style="width: 42mm;float:none ">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/AverageDistributionRt"/>
									</xsl:call-template>-->
								</span>
							</div>
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 5mm; ">4</div>
								<div  class="styLNDesc" style="text-align: left; width: 121mm; border-bottom-width: 0px; border-right-width: 0px; ">
									<span style="float: left; clear:none">Reserved<!--Enter the net value of noncharitable-use assets for 2020 from Part X, line 5--></span>
									<span class="styDotLn" style="float:right">...........................</span>
								</div>
								<div class="styLNRightNumBox" style="float:none;">4</div>
								<span class="styLNAmountBox" style="width: 42mm;float:none; ">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/NetVlNoncharitableAssetsAmt"/>
									</xsl:call-template>-->
								</span>
							</div>
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 5mm; ">5</div>
								<div  class="styLNDesc" style="text-align: left; width: 121mm; border-bottom-width: 0px; border-right-width: 0px; ">
									<span style="float: left; clear:none">Reserved<!--Multiply line 4 by line 3--></span>
									<span class="styDotLn" style="float:right">...........................</span>
								</div>
								<div class="styLNRightNumBox" style="float:none">5</div>
								<span class="styLNAmountBox" style="width: 42mm;float:none ">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/AdjNetVlNoncharitableAssetsAmt"/>
									</xsl:call-template>-->
								</span>
							</div>
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 5mm; ">6</div>
								<div  class="styLNDesc" style="text-align: left; width: 121mm; border-bottom-width: 0px; border-right-width: 0px; ">
									<span style="float: left; clear:none">Reserved<!--Enter 1% of net investment income (1% of Part I, line 27b)--></span>
									<span class="styDotLn" style="float:right">...........................</span>
								</div>
								<div class="styLNRightNumBox" style="float:none">6</div>
								<span class="styLNAmountBox" style="width: 42mm;float:none ">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/NetInvestmentIncomePctAmt"/>
									</xsl:call-template>-->
								</span>
							</div>
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 5mm; ">7</div>
								<div  class="styLNDesc" style="text-align: left; width: 121mm; border-bottom-width: 0px; border-right-width: 0px; ">
									<span style="float: left; clear:none">Reserved<!--Add lines 5 and 6--></span>
									<span class="styDotLn" style="float:right">...........................</span>
								</div>
								<div class="styLNRightNumBox" style="float:none">7</div>
								<span class="styLNAmountBox" style="width: 42mm;float:none ">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/AdjNonchrtblNetInvstIncmPctAmt"/>
									</xsl:call-template>-->
								</span>
							</div>
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 5mm; ">8</div>
								<div  class="styLNDesc" style="text-align: left; width: 121mm; border-bottom-width: 0px; border-right-width: 0px; ">
									<span style="float: left; clear:none">Reserved<!--Enter qualifying distributions from Part XII, line 4--></span>
									<span class="styDotLn" style="float:right">,..........................</span>
								</div>
								<div class="styLNRightNumBox" style="float:none">8</div>
								<span class="styLNAmountBox" style="width: 42mm;float:none ">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyUndSect4940eReducedTaxGrp/QualifyingDistributionsAmt"/>
									</xsl:call-template>-->
								</span>
							</div>
							<div>
								<div colspan="4" style="padding-left: 8mm"><!--If line 8 is equal to or greater than line 7, check the box in Part VI, line 1b, and complete that part 
										using a 1% tax rate. See the Part VI instructions.-->
								</div>
							</div>							
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style:solid; border-bottom-width: 0px; border-top-width: 1px; border-left-width: 0px;border-right-width: 0px">
						<div style="float:right">
						    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
						</div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
						    Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!--END HEADER-->
					<!-- Part VI  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width:15mm;">Part VI
						</div>
						<div class="styPartDesc" style="font-size: 7pt;padding-left:3mm;">
						    Excise Tax Based on Investment Income (Section 4940(a), 4940(b), 4940(e), or 4948—see instructions)  
						</div>
					</div>
					<table class="styTable" style="font-size: 7pt; border-color:black;width:187mm" cellspacing="0">
						<thead/>
						<tfoot/>
						<tbody valign="top">
							<!--  Line 1a -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-top:2mm ">1a</td>
								<td class="styTableCell" colspan="2"  style="text-align: left;float:none ; width: 136mm; border-bottom-width: 0px; border-right-width:0px"><!--"styLNDesc"--> 
									<span style="font-size:7pt">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" 
												select="$FormData/ExciseTaxBasedOnInvstIncmGrp/ExemptOperatingFoundationsInd"/>
												<xsl:with-param name="BackupName">IRS990PFExemptOperatingFoundations</xsl:with-param>
											</xsl:call-template>
										</label>Exempt operating foundations described in section 4940(d)(2), check here
									<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
										<input type="checkbox" alt="ExemptOperatingFoundations" class="styCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" 
													select="$FormData/ExciseTaxBasedOnInvstIncmGrp/ExemptOperatingFoundationsInd"/>
												<xsl:with-param name="BackupName">IRS990PFExemptOperatingFoundations</xsl:with-param>
											</xsl:call-template>
										</input>
										and enter “N/A" on line 1.</span>
								</td>
								<td rowspan="5" width="3mm">
									<img src="{$ImagePath}/990PF_Bracket_Large.gif" alt="Bracket for line 1a"/>
								</td>
								<td class="styLNRightNumBox" style="background-color:lightgrey; border-bottom-width: 0px; height:6mm">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 30mm;height:6mm   ">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="; width: 5mm"/><!--padding-left: 3mm-->
								<td class="styTableCell" colspan="3" style="text-align: left; width: 136mm; border-bottom-width: 0px; border-right-width: 0px">
								    Date of ruling or determination letter:
								    <span class="styIRS990PFUnderlinedText" style="width: 15mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/RulingLetterDt"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText">(attach copy of letter if necessary–see instructions)</span>
								</td>
								<td class="styLNRightNumBox" style="float:left; background-color: lightgrey; border-bottom-width: 0px;height:5mm">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 30mm; height:5mm">
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
											<xsl:with-param name="TargetNode" 
											select="$FormData/ExciseTaxBasedOnInvstIncmGrp/DomesticOrgMeetingSect4940eInd"/>
											<xsl:with-param name="BackupName">IRS990PFDomesticOrgMeetingSect4940e</xsl:with-param>
										</xsl:call-template>
									</label>Reserved<!--Domestic foundations that meet the section 4940(e) requirements in Part V, check-->
									<span class="styDotLn" style="float: right; clear: none">................................</span>
								</td>
								<td class="styLNRightNumBox">1</td>
								<td class="styLNAmountBox" style="width: 30mm">
									<xsl:choose>
										<xsl:when test="$FormData/ExciseTaxBasedOnInvstIncmGrp/InvestmentIncomeExciseTaxAmt != ''">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$FormData/ExciseTaxBasedOnInvstIncmGrp/InvestmentIncomeExciseTaxAmt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/NotApplicableCd"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 3mm; width: 5mm"/>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 136mm; border-bottom-width: 0px; border-right-width: 0px">
									<!--<span style="float: left; clear: none">here<span style="width: 1mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
										<span style="width: 1mm"/>
										<input type="checkbox" alt="DomesticOrgMeetingSect4940e" class="styCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" 
												select="$FormData/ExciseTaxBasedOnInvstIncmGrp/DomesticOrgMeetingSect4940eInd"/>
												<xsl:with-param name="BackupName">IRS990PFDomesticOrgMeetingSect4940e</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1px"/>and enter 1% of Part I, line 27b</span>-->
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height:6mm">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 30mm; height:6mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!-- Line 1b  -->
							<!--  Line 1c  -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 5mm">c</td>
								<td class="styTableCell" colspan="3" 
									style="padding-top: 1mm; text-align: left; width: 136mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="font-size: 7pt; ">All other domestic foundations enter 1.39% of line 27b. Exempt foreign organizations enter 4% of Part I, line 12, col. 
										(b)
									</span>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; height:7mm">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 30mm; height:7mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  Line 1c  -->
							<!--  Line 2  -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">2</td>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 140mm; border-bottom-width: 0px; border-right-width: 0px; font-size: 7pt">
									Tax under section 511 (domestic section 4947(a)(1) trusts and taxable foundations only. Others enter -0-)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/TaxUnderSection511Amt"/>
										<xsl:with-param name="TabOrder" select="2"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="float:left">2</td>
								<td class="styLNAmountBox" style="width: 30mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/TaxUnderSection511Amt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  Line 2  -->
							<!--  Line 3  -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">3</td>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 140mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="float: left; clear: none">Add lines 1 and 2</span>
									<span class="styDotLn">...........................</span>
								</td>
								<td class="styLNRightNumBox">3</td>
								<td class="styLNAmountBox" style="width: 30mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/SubtotalAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  Line 3  -->
							<!--  Line 4  -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">4</td>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 140mm; border-bottom-width: 0px; border-right-width: 0px">
									<span >Subtitle A (income) tax (domestic section 4947(a)(1) trusts and taxable foundations only. Others enter -0-)</span><!--style="font-size: 7pt"-->
								</td>
								<td class="styLNRightNumBox">4</td>
								<td class="styLNAmountBox" style="width: 30mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/SubtitleATaxAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 4  -->
							<!-- Line 5  -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">5</td>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 140mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="float: left; clear: none">
										<span class="styBoldText">Tax based on investment income. </span> Subtract line 4 from line 3. If zero or less, enter -0-
        <span class="styDotLn" style="float:none; clear:none">.....</span>
									</span>
								</td>
								<td class="styLNRightNumBox">5</td>
								<td class="styLNAmountBox" style="width: 30mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/TaxBasedOnInvestmentIncomeAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  Line 5  -->
							<!--  Line 6  -->
							<tr>
								<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">6</td>
								<td class="styTableCell" colspan="3" style="text-align: left; width: 140mm; border-bottom-width: 0px; border-right-width: 0px">
								        Credits/Payments:
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 30mm; border-bottom-width: 0px; height: 4mm">
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
								<td class="styLNLeftLtrBox" style="padding-left:4mm; width: 5mm">a</td>
								<td class="styTableCell"  style="padding-left:3mm;text-align: left; width: 99mm; border-bottom-width: 0px; border-right-width: 0px">
								    2020 estimated tax payments and 2019 overpayment credited to 2020
								</td>
								<td class="styLNRightNumBox">6a</td>
								<td class="styLNAmountBox" colspan="2" style="width: 36mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/EstimatedPlusOvpmtIncmTxAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 30mm; border-bottom-width: 0px; height:4mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  Line 6a  -->
							<!--  Line 6b  -->
							<!-- According to TY2016 schema, this is a Paper Filers Only Field.  There is no field name to populate here. -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 5mm">b</td>
								<td class="styTableCell" style="padding-left:3mm;text-align: left; width: 99mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="float: left; clear: none">Exempt foreign organizations—tax withheld at source</span>
									<span class="styDotLn" style="float: right">......</span>
								</td>
								<td class="styLNRightNumBox">6b</td>
								<td class="styLNAmountBox" colspan="2" style="width: 36mm">
									<span class="styTableCellPad"/>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 30mm; border-bottom-width: 0px; height:4mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  Line 6b  -->
							<!--  Line 6c  -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 5mm">c</td>
								<td class="styTableCell" style="padding-left:3mm;text-align: left; width: 99mm; border-bottom-width: 0px; border-right-width: 0px">
									<span style="float: left; clear: none">Tax paid with application for extension of time to file (Form 8868)</span>
									 <span class="styDotLn" style="float: right">...</span>
								 </td>
								<td class="styLNRightNumBox">6c</td>
								<td class="styLNAmountBox" colspan="2" style="width: 36mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/ExtsnRequestIncomeTaxPaidAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 30mm; border-bottom-width: 0px; height:4mm">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  Line  6c  -->
							<!--  Line 6d  -->
							<tr>
								<td class="styLNLeftLtrBox" style="padding-left: 4mm; width: 5mm">d</td>
								<td class="styTableCell" style="padding-left:3mm;text-align: left; width: 99mm; border-bottom-width: 0px; border-right-width: 0px">
        Backup withholding erroneously withheld 
									<span class="styDotLn" style="float:none; clear:none">...........</span>
								</td>
								<td class="styLNRightNumBox">6d</td>
								<td class="styLNAmountBox" colspan="2" style="width: 36mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/BackupWithholdingWithheldAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styShadingCell" style="width: 30mm; border-bottom-width: 0px; height:4mm">
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
									<td class="styTableCell" colspan="2" style="padding-left:3mm;text-align: left; width: 143mm; border-bottom-width: 0px; border-right-width: 0px">
										<span style="float: left; clear: none">Total credits and payments. Add lines 6a through 6d</span>
										<span class="styDotLn">..............									
											<xsl:choose>
											<xsl:when test="$FormData/ExciseTaxBasedOnInvstIncmGrp/OriginalReturnTaxPaidAmt">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part VI Line 7 - Tax Paid with the Original Return</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/OriginalReturnTaxPaidAmt"/>
													</xsl:call-template>
												</xsl:when>
											<xsl:when test="$FormData/ExciseTaxBasedOnInvstIncmGrp/OriginalReturnOverpaymentAmt">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part VI Line 7 - Original Return Overpayment</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/OriginalReturnOverpaymentAmt"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>	
										</span>
									</td>
									<td class="styLNRightNumBox" style="">7</td>
									<td class="styLNAmountBox" style="width: 30mm; ">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/TotalPaymentsAndCreditsAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="padding-top:1mm;padding-left: 3mm; width: 5mm">8</td>
									<td class="styTableCell" colspan="2" style="padding-left:3mm;text-align: left; width: 134mm; border-bottom-width: 0px; border-right-width: 0px">
											Enter any <span class="styBoldText">penalty</span> for underpayment of estimated tax. 
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/Form2220AttachedInd"/>
												<xsl:with-param name="BackupName">IRS990PFForm2220Attached</xsl:with-param>
											</xsl:call-template>
										</label> Check here
										<span style="width: 1mm"/>
										<input type="checkbox" alt="Form2220Attached" class="styCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/Form2220AttachedInd"/>
												<xsl:with-param name="BackupName">IRS990PFForm2220Attached</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width: 1mm"/>if Form 2220 is attached.
        <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/Form2220AttachedInd"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>
									</td>
									<td class="styLNRightNumBox" style="height:5mm; padding-top:1mm">8</td>
									<td class="styLNAmountBox" style="width: 30mm; height:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/EsPenaltyAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="padding-left: 3mm; width: 5mm">9</td>
									<td class="styTableCell" colspan="2" style="padding-left:3mm; text-align: left; width: 134mm; border-bottom-width: 0px; border-right-width: 0px">
										<span class="styBoldText">Tax due. </span> If the total of lines 5 and 8 is more than line 7, enter
										 <span class="styBoldText">amount owed</span>
										<span class="styDotLn" style="float:none; clear:none; padding-left: 1.25mm">.......</span>
										<span style="width: 4mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
									</td>
									<td class="styLNRightNumBox">9</td>
									<td class="styLNAmountBox" style="width: 30mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/TaxDueAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 5mm">10</td>
									<td class="styTableCell" colspan="2" style="padding-left:3mm; text-align: left; width: 134mm; border-bottom-width: 0px; border-right-width: 0px">
										<span class="styBoldText">Overpayment. </span> If line 7 is more than the total of lines 5 and 8, enter the 
										<span class="styBoldText">amount overpaid</span>
										<span class="styDotLn" style="float:none; clear:none; padding-left:.25mm">...</span>
										<span style="width: 4mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
									</td>
									<td class="styLNRightNumBox">10</td>
									<td class="styLNAmountBox" style="width: 30mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/OverpaymentAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width: 5mm">11</td>
									<td class="styTableCell" style="padding-left:3mm; text-align: left; width: 90mm; border-bottom-width: 0px; border-right-width: 1px;">
									    Enter the amount of line 10 to be: <span class="styBoldText" style="font-size:6pt;">Credited to 2021 estimated tax</span>
										<span style="width: 1mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
										<span style="width: 1mm"/>
										<span style="text-align: right; width: 15mm;vertical-align:bottom;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/AppliedToESTaxAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styBoldText" style="border:none; width: 18mm;">
										<span style="width: 6.25mm;float:left;">Refunded</span>
										<span style="padding-left:9mm;">
										    <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="Bullet"/>
										</span>
									</td>
									<td class="styLNRightNumBox" style="border-bottom:0">11</td>
									<td class="styLNAmountBox" style="width: 30mm; border-bottom:0;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/RefundAmt"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LegislativePoliticalActyInd"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float: right; clear: none">....................</span>
						</div>
						<div class="styLNRightNumBox">1a</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LegislativePoliticalActyInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LegislativePoliticalActyInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 1a  -->
					<!--  Line 1b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 155mm">
							Did it spend more than $100 during the year (either directly or indirectly) for political purposes? (see Instructions
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">for definition)</span>
							<span class="styDotLn" style="clear: none">.................................</span>
						</div>
						<div class="styLNRightNumBox">1b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/MoreThan100SpentInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/MoreThan100SpentInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="padding-left: 2mm; width: 155mm">
							<span class="styItalicText">
        If the answer is "Yes" to <span class="styBoldText">1a</span> or <span class="styBoldText">1b,</span> attach a detailed description of the activities and copies of any materials
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
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Form1120POLFiledInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Form1120POLFiledInd"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Section4955OrganizationTaxAmt"/>
								</xsl:call-template>
							</span>
							<span style="width: 2mm"/>
							<span class="styBoldText">(2)</span> On foundation managers.<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span style="width: 1mm"/>$
          <span class="styIRS990PFUnderlinedText" style="text-align: right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Section4955ManagersTaxAmt"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/TaxReimbursedAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/ActivitiesNotPreviouslyRptInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/ActivitiesNotPreviouslyRptInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span class="styItalicText">If "Yes," attach a detailed description of the activities.</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/ActivitiesNotPreviouslyRptInd"/>
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
        <span class="styItalicText">If "Yes," attach a conformed copy of the changes</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/ChangesToArticlesOrBylawsInd"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float: right; clear: none">....</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/ChangesToArticlesOrBylawsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/ChangesToArticlesOrBylawsInd"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/UnrelatedBusIncmOverLimitInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/UnrelatedBusIncmOverLimitInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 4a  -->
					<!--  Line 4b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox" style="padding-left:3mm">b</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">If "Yes," has it filed a tax return on <span class="styBoldText">Form 990-T</span> for this year?</span>
							<span class="styDotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">4b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Form990TFiledInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Form990TFiledInd"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/OrganizationDissolvedEtcInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/OrganizationDissolvedEtcInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span class="styItalicText">If "Yes," attach the statement required by General Instruction T.</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/OrganizationDissolvedEtcInd"/>
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
					<div style="width: 187mm; padding-left: 8mm;">
						<div style="float: left">
							<li style="margin-left:3mm">By language in the governing instrument, or</li>
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm; padding-left: 8mm;">
						<div style="float: left">
							<li style="margin-left:3mm">By state legislation that effectively amends the governing instrument so that no mandatory 
								directions</li>
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Section508eRqrSatisfiedInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Section508eRqrSatisfiedInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 6  -->
					<!--  Line 7  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">7</div>
						<div class="styLNDesc" style="font-size: 7pt; width: 155mm;">
      Did the foundation have at least $5,000 in assets at any time during the year?<span class="styItalicText"> If "Yes," complete Part II, col. (c), </span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm" >
						<td class="styTableCell" colspan="2" style="text-align: left;  border-bottom-width: 0px; border-right-width: 0px">
							<span class="styItalicText" style="float:left">and Part XV.</span>
							<span class="styDotLn" style="float:right;clear: none">.................................</span>  
						</td>	   
						</div>
						<div class="styLNRightNumBox" >7</div>
						<div class="styLNRightNumBox" >
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/AtLeast5000InAssetsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" >
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/AtLeast5000InAssetsInd"/>
							</xsl:call-template>
						</div>						
					</div>
					<!--  Line 7  -->
					<!--  Line 8a  -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">8a</div>
						<div class="styLNDesc" style="width: 155mm">
							  Enter the states to which the foundation reports or with which it is registered (see instructions)
						</div>
   				     	<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; "/> 
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; "/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px; "/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styGenericDiv" style="width: 179mm;height:100%;">
							<div class="styLNDesc" style="width: 155mm;height:100%;">
								<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
								<span class="styIRS990PFUnderlinedText" style="width: 130mm; font-size: 6pt">
									<xsl:if test="($Print = $Separated) and (count($FormData/StatementsRegardingActyGrp/OrgReportOrRegisterStateCd)     &gt;25)">
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/OrgReportOrRegisterStateCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count    ($FormData/StatementsRegardingActyGrp/OrgReportOrRegisterStateCd) 
											&lt;26))">
										<xsl:for-each select="$FormData/StatementsRegardingActyGrp/OrgReportOrRegisterStateCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<xsl:if test="position()!=last()">, <span style="width: 1mm"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:6.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="height: 6.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
							<div class="styLNRightNumBox" style="height:6.5mm ;background-color: lightgrey; border-bottom-width: 0px"/>
						</div>
					</div>
					<!--  Line 8a  -->
					<!--  Line 8b  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 3.5mm">b</div>
						<div class="styLNDesc" style="width: 155mm">
      If the answer is "Yes" to line 7, has the foundation furnished a copy of Form 990-PF to the Attorney
    </div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 155mm">
      General (or designate) of each state as required by General Instruction G?
      <span class="styItalicText">If "No," attach explanation <span class="styBoldText">.</span>
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Form990PFFiledWithAttyGenInd"/>
								<xsl:with-param name="TabOrder" select="2"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">8b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Form990PFFiledWithAttyGenInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/Form990PFFiledWithAttyGenInd"/>
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
						   or 4942(j)(5) for calendar year 2020 or the taxable year beginning in 2020?  See the instructions for Part XIV.
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">If "Yes," complete Part XIV
							</span>
							<span class="styDotLn" style="float: right; clear: none">.............................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/PrivateOperatingFoundationInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/PrivateOperatingFoundationInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 9  -->
					<!--  Line 10  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style=" width: 155mm">
      Did any persons become substantial contributors during the tax year? <span class="styItalicText"> If "Yes," attach a schedule listing their names </span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm" >
						<td class="styTableCell" colspan="2" style="text-align: left;  border-bottom-width: 0px; border-right-width: 0px">
							<span class="styItalicText" style="float:left">and addresses.
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/NewSubstantialContributorsInd"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>						
							<span class="styDotLn" style="float:right;clear: none">...............................</span> 
						</td>	
						</div>						
						<div class="styLNRightNumBox" >10</div>
						<div class="styLNRightNumBox" >
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/NewSubstantialContributorsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" >
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/NewSubstantialContributorsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 10  -->		
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style:solid; border-bottom-width: 0px; border-top-width: 1px; border-left-width: 0px; 
						border-right-width: 0px">
						<div style="float:right">
							Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
						</div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)
						</div>
						<div style="float:right">
						    Page <span class="styBoldText" style="font-size: 8pt">5</span>
						</div>
					</div>
					<!--END HEADER-->	
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm">Part VII-A</div>
						<div class="styPartDesc" style="width: 100mm;font-weight:normal"><b>Statements Regarding Activities</b> (continued)</div>
					</div>		
					<!--  Line 11  -->
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
							    meaning of section 512(b)(13)? If "Yes," attach schedule. See instructions
							    <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/OwnControlledEntityInd"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="right: float; clear: none">.............</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/OwnControlledEntityInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/OwnControlledEntityInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 11  -->
					<!--  Line 12  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
							  Did the foundation make a distribution to a donor advised fund over which the foundation or a disqualified person had
							</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">advisory privileges? If "Yes," attach statement. See instructions</span>
							    <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/DonorAdvisedFundInd"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template> 
							<span class="styDotLn" style="float: right; clear: none">.................</span>
						</div>						
						<div class="styLNRightNumBox">12</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/DonorAdvisedFundInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/DonorAdvisedFundInd"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/ComplyWithPublicInspRqrInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/ComplyWithPublicInspRqrInd"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/WebsiteAddressTxt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  Line 13  -->
					<!--  Line 14  -->
					<div style="width: 187mm; padding-top:1mm;height:auto ">
						<div class="styLNLeftNumBox" style="height:8mm">14</div>
						<div class="styLNDesc" style="width: 170mm" >
						    The books are in care of<span style="width: 1mm" />
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styIRS990PFUnderlinedText" style="width: 90mm; font-size:6pt">
								<xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActyGrp/PersonsWithBooksName !=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode"
											 select="$FormData/StatementsRegardingActyGrp/PersonsWithBooksName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="$FormData/StatementsRegardingActyGrp/PersonsWithBooksName/BusinessNameLine2Txt != ''">, 
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/StatementsRegardingActyGrp/PersonsWithBooksName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/IndividualWithBooksNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
							Telephone no.<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styIRS990PFUnderlinedText" style="width: 22mm">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/PhoneNum"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<br/>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 179mm; height:auto">
						  Located at<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styIRS990PFUnderlinedText" style="width: 121mm; font-size: 6pt">
								<xsl:if test="count($FormData/StatementsRegardingActyGrp/LocationOfBooksUSAddress) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LocationOfBooksUSAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/StatementsRegardingActyGrp/LocationOfBooksUSAddress/AddressLine2Txt != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LocationOfBooksUSAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/StatementsRegardingActyGrp/LocationOfBooksUSAddress/CityNm != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LocationOfBooksUSAddress/CityNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/StatementsRegardingActyGrp/LocationOfBooksUSAddress/StateAbbreviationCd != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LocationOfBooksUSAddress/StateAbbreviationCd"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
								<xsl:if test="count($FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress/AddressLine2Txt != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress/CityNm != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress/CityNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress/ProvinceOrStateNm != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											select="$FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress/ProvinceOrStateNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress/CountryCd != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
							</span>
							ZIP+4<span style="width: 1mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							<span class="styIRS990PFUnderlinedText" style="width: 28mm">
								<xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActyGrp/LocationOfBooksUSAddress/ZIPCd !=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LocationOfBooksUSAddress/ZIPCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/LocationOfBooksForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--  Line 14  -->
					<!--  Line 15  -->
					<div style="width: 187mm;padding-bottom:1mm" >
						<div class="styLNLeftNumBox" style="padding-top:2mm;">15</div>
						<div class="styLNDesc" style="width: 179mm">
							<span style="float:left; clear: none"> Section 4947(a)(1) nonexempt charitable trusts filing Form 990-PF in lieu of <b>Form 1041</b> —check here
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/NECTFilingInLieuOFForm1041Ind"/>
										<xsl:with-param name="BackupName">IRS990PFNECTFilingInLieuOFForm1041</xsl:with-param>
									</xsl:call-template> 
								</label>
										<span class="styDotLn" style="float: none; clear: none">.........</span>
										<span style="width: 2mm"/>
										<span style="width: 1mm"/>
										<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 2mm"/>
								<input type="checkbox" alt="NECTFilingInLieuOFForm1041" class="styCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/NECTFilingInLieuOFForm1041Ind"/>
										<xsl:with-param name="BackupName">IRS990PFNECTFilingInLieuOFForm1041</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>							
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">and enter the amount of tax-exempt interest received or accrued during the year
						          <span class="styDotLn" style="float: none; clear: none">........</span>
								<span style="width: 2mm"/>
								<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
								<span style="width: 2mm"/>
							</span>
						</div>
						<div class="styLNRightNumBox">15</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/TaxExemptInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 15  -->
					<!--  Line 16  -->
					<div style="width: 187mm; padding-top: 1mm;">
					<span style="float:left;">
						<span class="styLNLeftNumBox">16</span>
						<span class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								At any time during calendar year 2020, did the foundation have an interest in or a signature or other authority over
							</span></span>
						<span style="float:right;">
						<span class="styLNRightNumBox" style="border-left-width:0px;border-bottom-width:0px;"/>
						<span class="styLNRightNumBox">Yes</span>
						<span class="styLNRightNumBox">No</span>
						</span>
					<div class="styBB" style="width: 187mm;padding-top:0mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 155mm;float:left;">
						   a bank, securities, or other financial account in a foreign country?
				          <span class="styDotLn" style="float: none; clear: none">.................</span>
				</div>
						<span style="float:right;">
						<span class="styLNRightNumBox" style="border-top-width:0px;">16</span>
						<span class="styLNRightNumBox" style="border-top-width:0px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/ForeignAccountsQuestionInd"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActyGrp/ForeignAccountsQuestionInd"/>
							</xsl:call-template>
						</span>
						</span>
						<div style="width: 187mm;"><!--height:4mm;-->
						    <span style="float:right;">
						    <span class="styLNRightNumBox" style="height:7mm;background-color: lightgrey; border-bottom-width: 0px;"/>
						<span class="styLNRightNumBox" style="height:7mm;background-color:lightgrey; border-bottom-width: 0px;border-left-width:0px;"/>
						<span class="styLNRightNumBox" style="height:7mm;background-color:lightgrey; border-bottom-width:0px;"/>
						    </span>
							<span class="styLNLeftNumBox"/>
							<span class="styLNDesc" style="width: 155mm">
								<span style="float: left; clear: none">
										See the instructions for exceptions and filing requirements for FinCEN Form 114.  If "Yes", enter the name of the foreign 
										<br/>country 
									<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
									<span style="width: 2mm"/>
										<xsl:for-each select="$FormData/StatementsRegardingActyGrp/ForeignCountryCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<xsl:if test="position()!=last()">, <span style="width: 1mm"/>
											</xsl:if>
										</xsl:for-each>
								</span>
							</span>
						</div>
					</div>
						</span>
					</div>					
					<!-- Line 16  -->
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
							<span class="styBoldText">File Form 4720 if any item is checked in the "Yes" column, unless an exception applies.</span>
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
								<input type="checkbox" alt="SaleOrExchangeWithDisqualifiedPersonYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/SaleOrExchDisqualifiedPrsnInd"/>
										<xsl:with-param name="BackupName">IRS990PFSaleOrExchangeWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/SaleOrExchDisqualifiedPrsnInd"/>
											<xsl:with-param name="BackupName">IRS990PFSaleOrExchangeWithDsqflyPerson</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="SaleOrExchangeWithDisqualifiedPersonNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/SaleOrExchDisqualifiedPrsnInd"/>
										<xsl:with-param name="BackupName">IRS990PFSaleOrExchangeWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/SaleOrExchDisqualifiedPrsnInd"/>
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
								 a disqualified person?<span class="styDotLn" style="float: none; clear: none">......................</span>
							</span>
							<span style=" float: right;clear:none; padding-right: 2mm">
								<input type="checkbox" alt="BorrowOrLendWithDisqualifiedPersonYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/BrrwOrLendDisqualifiedPrsnInd"/>
										<xsl:with-param name="BackupName">IRS990PFBorrowOrLendWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/BrrwOrLendDisqualifiedPrsnInd"/>
											<xsl:with-param name="BackupName">IRS990PFBorrowOrLendWithDsqflyPerson</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="BorrowOrLendWithDisqualifiedPersonNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/BrrwOrLendDisqualifiedPrsnInd"/>
										<xsl:with-param name="BackupName">IRS990PFBorrowOrLendWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/BrrwOrLendDisqualifiedPrsnInd"/>
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
								<input type="checkbox" alt="FurnishedGoodsWithDisqualifiedPersonYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/FurnGoodsDisqualifiedPrsnInd"/>
										<xsl:with-param name="BackupName">IRS990PFFurnishedGoodsWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/FurnGoodsDisqualifiedPrsnInd"/>
											<xsl:with-param name="BackupName">IRS990PFFurnishedGoodsWithDsqflyPerson</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="FurnishedGoodsWithDisqualifiedPersonNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/FurnGoodsDisqualifiedPrsnInd"/>
										<xsl:with-param name="BackupName">IRS990PFFurnishedGoodsWithDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/FurnGoodsDisqualifiedPrsnInd"/>
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
								<input type="checkbox" alt="PayCompensationToDisqualifiedPersonYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/PayCompDisqualifiedPrsnInd"/>
										<xsl:with-param name="BackupName">IRS990PFPayCompensationToDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/PayCompDisqualifiedPrsnInd"/>
											<xsl:with-param name="BackupName">IRS990PFPayCompensationToDsqflyPerson</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="PayCompensationToDisqualifiedPersonNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/PayCompDisqualifiedPrsnInd"/>
										<xsl:with-param name="BackupName">IRS990PFPayCompensationToDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/PayCompDisqualifiedPrsnInd"/>
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
								 for the benefit or use of a disqualified person)?<span class="styDotLn" style="float: none; clear: none">...............</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" alt="TransferAssetsToDisqualifiedPersonYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/TransferAstDisqualifiedPrsnInd"/>
										<xsl:with-param name="BackupName">IRS990PFTransferAssetsToDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/TransferAstDisqualifiedPrsnInd"/>
											<xsl:with-param name="BackupName">IRS990PFTransferAssetsToDsqflyPerson</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="TransferAssetsToDisqualifiedPersonNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/TransferAstDisqualifiedPrsnInd"/>
										<xsl:with-param name="BackupName">IRS990PFTransferAssetsToDsqflyPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/TransferAstDisqualifiedPrsnInd"/>
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
									 Agree to pay money or property to a government official? (<span class="styBoldText">Exception.</span> Check "No"
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
								 after termination of government service, if terminating within 90 days.)<span class="styDotLn" style="float: none; clear: none">.......</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" alt="PaymentToGovernmentOfficalYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/PaymentToGovernmentOfficialInd"/>
										<xsl:with-param name="BackupName">IRS990PFPaymentToGovernmentOffical</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/PaymentToGovernmentOfficialInd"/>
											<xsl:with-param name="BackupName">IRS990PFPaymentToGovernmentOffical</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="PaymentToGovernmentOfficalNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/PaymentToGovernmentOfficialInd"/>
										<xsl:with-param name="BackupName">IRS990PFPaymentToGovernmentOffical</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/PaymentToGovernmentOfficialInd"/>
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
								 If any answer is "Yes" to 1a(1)–(6), did <span class="styBoldText">any </span> of the acts fail to qualify under the exceptions described in Regulations
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
								 section 53.4941(d)-3 or in a current notice regarding disaster assistance? See instructions 
								 <span class="styDotLn" style="float: none; clear: none">........</span>
							</span>
						</div>
						<div class="styLNRightNumBox">1b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/ActsFailToQlfyAsExceptionsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/ActsFailToQlfyAsExceptionsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/RelyingCurrentNtcDsstrAsstInd"/>
										<xsl:with-param name="BackupName">IRS990PFRelyingCurrNoticeDisasterAsst1</xsl:with-param>
									</xsl:call-template>Organizations relying on a current notice regarding disaster assistance check here</label>
								<span class="styDotLn" style="float: none; clear: none">........</span>
								<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							</span>
							<span style="float: right; clear:none; padding-right: 6.25mm">
								<input type="checkbox" alt="RelyingCurrNoticeDisasterAsst1" class="styCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/RelyingCurrentNtcDsstrAsstInd"/>
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
         that were not corrected before the first day of the tax year beginning in 2020?<span class="styDotLn" style="float: none; clear: none">.............</span>
							</span>
						</div>
						<div class="styLNRightNumBox">1c</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UncorrectedPriorActsInd"/>
								<xsl:with-param name="BackupName">IRS990PFUncorrectedPriorActsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UncorrectedPriorActsInd"/>
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
								 At the end of tax year 2020, did the foundation have any undistributed income (lines 6d
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
								 and 6e, Part XIII) for tax year(s) beginning before 2020?<span class="styDotLn" style="float: none; clear: none">.............</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" alt="UndistributedIncomePriorYearsYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePYInd"/>
										<xsl:with-param name="BackupName">IRS990PFUndistributedIncomePriorYears</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePYInd"/>
											<xsl:with-param name="BackupName">IRS990PFUndistributedIncomePriorYears</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="UndistributedIncomePriorYearsNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePYInd"/>
										<xsl:with-param name="BackupName">IRS990PFUndistributedIncomePriorYears</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePYInd"/>
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
         If "Yes," list the years
         <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
								<xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePY1Yr != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePY1Yr"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width: 1mm"/>,
          <xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePY2Yr != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePY2Yr"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width: 1mm"/>,
        <xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePY3Yr != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePY3Yr"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width: 1mm"/>,
        <xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePY4Yr != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistributedIncomePY4Yr"/>
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
         to <span class="styBoldText">all </span> years listed, answer "No" and attach statement—see instructions.)
         <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2NotAppInd"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
								<span class="styDotLn" style="float: none; clear: none">..............</span>
							</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2NotAppInd"/>
								<xsl:with-param name="BackupName">IRS990PFUndistrIncome4942a2NotAppliedYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2NotAppInd"/>
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
         If the provisions of section 4942(a)(2) are being applied to <b>any</b> of the years listed in 2a, list the years here.
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
									<xsl:when test="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2AppYr1Yr != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2AppYr1Yr"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
									<span style="width: 1mm"/>,
								<xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2AppYr2Yr != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2AppYr2Yr"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
									<span style="width: 1mm"/>,
								<xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2AppYr3Yr != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2AppYr3Yr"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 6mm"/>
									</xsl:otherwise>
								</xsl:choose>
									<span style="width: 1mm"/>,
								<xsl:choose>
									<xsl:when test="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2AppYr4Yr != ''">
										<span style="width: 2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UndistrIncmSect4942a2AppYr4Yr"/>
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
								 Did the foundation hold more than a 2% direct or indirect interest in any business enterprise at
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
								 any time during the year?<span class="styDotLn" style="float: none; clear: none">......................</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" alt="BusinessHoldingsYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/BusinessHoldingsInd"/>
										<xsl:with-param name="BackupName">IRS990PFBusinessHoldings</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/BusinessHoldingsInd"/>
											<xsl:with-param name="BackupName">IRS990PFBusinessHoldings</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="BusinessHoldingsNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/BusinessHoldingsInd"/>
										<xsl:with-param name="BackupName">IRS990PFBusinessHoldings</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/BusinessHoldingsInd"/>
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
         If "Yes," did it have excess business holdings in 2020 as a result of <span class="styBoldText">(1)</span> any purchase by the foundation
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
         if the foundation had excess business holdings in 2020.)<span class="styDotLn" style="float: none; clear: none">..................</span>
							</span>
						</div>
						<div class="styLNRightNumBox">3b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/ExcessBusinessHoldingsInd"/>
								<xsl:with-param name="BackupName">IRS990PFExcessBusinessHoldingsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/ExcessBusinessHoldingsInd"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/JeopardyInvestmentsInd"/>
								<xsl:with-param name="BackupName">IRS990PFExcessBusinessHoldingsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/JeopardyInvestmentsInd"/>
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
					<div style="width: 187mm" class="styBB">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
								 charitable purpose that had not been removed from jeopardy before the first day of the tax year beginning in 2020?
						    </span>
						</div>
						<div class="styLNRightNumBox">4b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UncorrectedPYJeopardyInvstInd"/>
								<xsl:with-param name="BackupName">IRS990PFUncorrectedJeopardyInvestmentsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/UncorrectedPYJeopardyInvstInd"/>
								<xsl:with-param name="BackupName">IRS990PFUncorrectedJeopardyInvestmentsNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 4b  -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
							Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
					    </div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
							Page <span class="styBoldText" style="font-size: 8pt">6</span>
						</div>
					</div>
					<!--END HEADER-->					
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm">Part VII-B</div>
						<div class="styPartDesc" style="width: 160mm">
							Statements Regarding Activities for Which Form 4720 May Be Required <span style="font-weight:normal"> <i>(continued)</i></span>
						</div>
					</div>					
					<!--  Line 5a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">5a</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">During the year did the foundation pay or incur any amount to:</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox">Yes</div>
						<div class="styLNRightNumBox">No</div>
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
								<input type="checkbox" alt="InfluenceLegislationYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/InfluenceLegislationInd"/>
										<xsl:with-param name="BackupName">IRS990PFInfluenceLegislation</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/InfluenceLegislationInd"/>
											<xsl:with-param name="BackupName">IRS990PFInfluenceLegislation</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="InfluenceLegislationNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/InfluenceLegislationInd"/>
										<xsl:with-param name="BackupName">IRS990PFInfluenceLegislation</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/InfluenceLegislationInd"/>
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
								 on, directly or indirectly, any voter registration drive?<span class="styDotLn" style="float: none; clear: none">.............</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" alt="InfluenceElectionYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/InfluenceElectionInd"/>
										<xsl:with-param name="BackupName">IRS990PInfluenceElection</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/InfluenceElectionInd"/>
											<xsl:with-param name="BackupName">IRS990PInfluenceElection</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="InfluenceElectionNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/InfluenceElectionInd"/>
										<xsl:with-param name="BackupName">IRS990PFInfluenceElection</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/InfluenceElectionInd"/>
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
								<input type="checkbox" alt="InfluenceElectionYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/GrantsToIndividualsInd"/>
										<xsl:with-param name="BackupName">IRS990PFInfluenceElection</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/GrantsToIndividualsInd"/>
											<xsl:with-param name="BackupName">IRS990PFInfluenceElection</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="InfluenceElectionNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/GrantsToIndividualsInd"/>
										<xsl:with-param name="BackupName">IRS990PFInfluenceElection</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/GrantsToIndividualsInd"/>
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
								 in section 4945(d)(4)(A)? See instructions<span class="styDotLn" style="float: none; clear: none">................</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" alt="GrantsToOrganizationsYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/GrantsToOrganizationsInd"/>
										<xsl:with-param name="BackupName">IRS990PFGrantsToOrganizations</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/GrantsToOrganizationsInd"/>
											<xsl:with-param name="BackupName">IRS990PFGrantsToOrganizations</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="GrantsToOrganizationsNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/GrantsToOrganizationsInd"/>
										<xsl:with-param name="BackupName">IRS990PFGrantsToOrganizations</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/GrantsToOrganizationsInd"/>
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
								 educational purposes, or for the prevention of cruelty to children or animals?<span class="styDotLn" style="float: none; clear: none">.....</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" alt="NoncharitablePurposeYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/NoncharitablePurposeInd"/>
										<xsl:with-param name="BackupName">IRS990PFNoncharitablePurpose</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/NoncharitablePurposeInd"/>
											<xsl:with-param name="BackupName">IRS990PFNoncharitablePurpose</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="NoncharitablePurposeNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/NoncharitablePurposeInd"/>
										<xsl:with-param name="BackupName">IRS990PFNoncharitablePurpose</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/NoncharitablePurposeInd"/>
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
								 If any answer is "Yes" to 5a(1)–(5), did <span class="styBoldText">any </span> of the transactions fail to qualify under the exceptions described in
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
								 Regulations section 53.4945 or in a current notice regarding disaster assistance?  See instructions
								 <span class="styDotLn" style="float: none; clear: none">......</span>
						    </span>
						</div>
						<div class="styLNRightNumBox">5b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/TransactionsFailToQlfyAsExcInd"/>
								<xsl:with-param name="BackupName">IRS990PFTrFailToQualifyAsExceptionsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/TransactionsFailToQlfyAsExcInd"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/RelyingCurrentNtcDsstrAsst1Ind"/>
										<xsl:with-param name="BackupName">IRS990PFRelyingCurrNoticeDisasterAsst2</xsl:with-param>
									</xsl:call-template>Organizations relying on a current notice regarding disaster assistance check here</label>
								<span class="styDotLn" style="float: none; clear: none">.........</span>
								<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
							</span>
							<span style="float: right; clear:none; padding-right: 6.25mm">
								<input type="checkbox" alt="Organizations relying on a current notice regarding disaster assistance" class="styCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/RelyingCurrentNtcDsstrAsst1Ind"/>
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
								 If the answer is "Yes" to question 5a(4), does the foundation claim exemption from the
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
								 tax because it maintained expenditure responsibility for the grant?<span class="styDotLn" style="float: none; clear: none">..........</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" alt="MaintainedExpenditureResponsibilityYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/MaintainedExpenditureRspnsInd"/>
										<xsl:with-param name="BackupName">IRS990PFMaintExpendResponsibility</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/MaintainedExpenditureRspnsInd"/>
											<xsl:with-param name="BackupName">IRS990PFMaintExpendResponsibility</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="MaintainedExpenditureResponsibilityNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/MaintainedExpenditureRspnsInd"/>
										<xsl:with-param name="BackupName">IRS990PFMaintExpendResponsibility</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" 
											select="$FormData/StatementsRegardingActy4720Grp/MaintainedExpenditureRspnsInd"/>
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
								 If "Yes," attach the statement required by Regulations section 53.4945–5(d).
						    </span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/MaintainedExpenditureRspnsInd"/>
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
								 Did the foundation, during the year, receive any funds, directly or indirectly, to pay premiums on
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
								 a personal benefit contract?<span class="styDotLn" style="float: none; clear: none">.....................</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<input type="checkbox" alt="ReceiveFundsToPayPersonalBenefitContractYes" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/RcvFndsToPayPrsnlBnftCntrctInd"/>
										<xsl:with-param name="BackupName">IRS990PFRcvFundsToPayPrsnlBnftContract</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" 
											select="$FormData/StatementsRegardingActy4720Grp/RcvFndsToPayPrsnlBnftCntrctInd"/>
											<xsl:with-param name="BackupName">IRS990PFRcvFundsToPayPrsnlBnftContract</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="ReceiveFundsToPayPersonalBenefitContractNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/RcvFndsToPayPrsnlBnftCntrctInd"/>
										<xsl:with-param name="BackupName">IRS990PFRcvFundsToPayPrsnlBnftContract</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/RcvFndsToPayPrsnlBnftCntrctInd"/>
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
								 Did the foundation, during the year, pay premiums, directly or indirectly, on a personal benefit contract?
								 <span class="styDotLn" style="float: none; clear: none">....</span>
							</span>
						</div>
						<div class="styLNRightNumBox">6b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/PayPremiumsPrsnlBnftCntrctInd"/>
								<xsl:with-param name="BackupName">IRS990PFPayPremiumsPrsnlBnftContractYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/PayPremiumsPrsnlBnftCntrctInd"/>
								<xsl:with-param name="BackupName">IRS990PFPayPremiumsPrsnlBnftContractNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span class="styItalicText" style="float: left; clear: none"> 
								 If "Yes" to 6b, file Form 8870.
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
								<input type="checkbox" alt="ProhibitedTaxShelterTransactionYes"  class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/ProhibitedTaxShelterTransInd"/>
										<xsl:with-param name="BackupName">IRS990PFProhibitedTaxShelterTransactn</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/ProhibitedTaxShelterTransInd"/>
											<xsl:with-param name="BackupName">IRS990PFProhibitedTaxShelterTransactn</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="ProhibitedTaxShelterTransactionNo" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/ProhibitedTaxShelterTransInd"/>
										<xsl:with-param name="BackupName">IRS990PFProhibitedTaxShelterTransactn</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/ProhibitedTaxShelterTransInd"/>
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
					<div class="styNBB" style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> 
								 If "Yes", did the foundation receive any proceeds or have any net income attributable to the transaction?
								 <span class="styDotLn" style="float: none; clear: none">....</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style=" border-bottom:1">7b</div>
						<div class="styLNRightNumBox" style=" border-bottom:1">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/ProceedsOrNetIncomeInd"/>
								<xsl:with-param name="BackupName">IRS990PFProceedsOrNetIncomeYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style=" border-bottom:1">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/ProceedsOrNetIncomeInd"/>
								<xsl:with-param name="BackupName">IRS990PFProceedsOrNetIncomeNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 7b  -->
					<!--  Line 8  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">8</div>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none"> Is the foundation subject to the section 4960 tax on payment(s) of more than $1,000,000 in remuneration or
						    </span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:0"/>
					</div>
					<div class="styBB" style="width: 187mm;height: 5.3mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
							<span style="float: left; clear: none">excess parachute payment during the year?
								 <span class="styDotLn" style="float: none; clear: none">.................</span>
							</span>
							<span style="float: right; clear:none; padding-right: 2mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/SubjToTaxRmnrtnExPrchtPymtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/SubjToTaxRmnrtnExPrchtPymtInd"/>
										<xsl:with-param name="BackupName">IRS990PFSubjToTaxRmnrtnExPrchtPymt</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/SubjToTaxRmnrtnExPrchtPymtInd"/>
											<xsl:with-param name="BackupName">IRS990PFSubjToTaxRmnrtnExPrchtPymt</xsl:with-param>
										</xsl:call-template>Yes</label>
								</span>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkBox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/SubjToTaxRmnrtnExPrchtPymtInd"/>
										<xsl:with-param name="BackupName">IRS990PFSubjToTaxRmnrtnExPrchtPymt</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm"/>
								<span class="styBoldText">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/StatementsRegardingActy4720Grp/SubjToTaxRmnrtnExPrchtPymtInd"/>
											<xsl:with-param name="BackupName">IRS990PFSubjToTaxRmnrtnExPrchtPymt</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:1"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:1"/>
						<div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom:1"/>
					</div>
					<!--  Line 8  -->
					<!-- Begin Part VIII -->
					<div style="width:187mm;border-top-width: 0px; float: none; clear: both" class="styBB">
						<div class="styPartName" style="width:18mm; margin-top: 2mm; margin-bottom:2.5mm">Part VIII</div>
						<div class="styPartDesc" style="padding-top: 0mm;width:169mm">
						   Information About Officers, Directors, Trustees, Foundation Managers, Highly Paid Employees,<br/>and Contractors  
						</div>
					</div>
					<!--  Line 1  -->
					<div style="width: 187mm; border-right-width: 0px; border-bottom-width:1px; padding-left: 2mm; text-align: left; font-weight:bold">
						 1  <span style="width: 2mm"/> List all officers, directors, trustees, foundation managers and their compensation.  See instructions
				    </div><!--th scope="col" class="styTableCellHeader" colspan="5"-->
					<table class="styTable" style="font-size: 7pt; border-color:black; width: 187mm" cellspacing="0">
						<thead class="styTableThead">
							<tr scope="col" style="height:auto">
								<th scope="col" class="styTableCellHeader" style="border-right-width: 0px; border-top-width:1px; width: 53mm">(a)
									<span class="styNormalText">
									  Name and address
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px;  border-top-width:1px;width: 40mm">
									<span class="styNormalText">
									<b>(b)</b>  Title, and average<br/>hours per week<br/>devoted to position
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; border-top-width:1px;width: 32mm">(c)
									<span class="styNormalText">
									  Compensation<br/>
									</span>
										(If not paid, enter<br/>-0-)
								</th>
								<th scope="col" class="styTableCellHeader" style="height:auto;border-right-width: 0px; border-left-width: 1px;
									border-top-width:1px; width: 32mm">
									<span class="styNormalText">
										<b>(d)</b>  Contributions to employee benefit plans and deferred compensation
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="width: 32mm; border-right-width: 0px; border-left-width: 1px; border-top-width:1px">
									<span class="styNormalText">
										<b>(e)</b>  Expense account,<br/>other allowances
									</span>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<xsl:if test="($Print != $Separated) or (count($FormData/OfficerDirTrstKeyEmplInfoGrp/OfficerDirTrstKeyEmplGrp) &lt;5)">
								<xsl:for-each select="$FormData/OfficerDirTrstKeyEmplInfoGrp/OfficerDirTrstKeyEmplGrp">
									<tr>
										<td class="styLNAmountBox" style="float:none;text-align: left; width: 53mm; border-left-width: 0px; font-size: 6pt; height:auto">
											<xsl:choose>
												<xsl:when test="PersonNm != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
													<span style="width: 2mm"/>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
														<xsl:with-param name="TabOrder" select="2"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="BusinessName"/>
														<xsl:with-param name="TabOrder" select="2"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styLNAmountBox" rowspan="2" style="float: none;text-align: left; height:auto; font-size:6pt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TitleTxt"/>
											</xsl:call-template>
											<xsl:if test="AverageHrsPerWkDevotedToPosRt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AverageHrsPerWkDevotedToPosRt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styLNAmountBox" rowspan="2" style="float: none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CompensationAmt"/>
											</xsl:call-template>
										</td>
										<td class="styLNAmountBox" rowspan="2" style="float: none;width: 38mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EmployeeBenefitProgramAmt"/>
											</xsl:call-template>
										</td>
										<td class="styLNAmountBox" rowspan="2" style="float: none;border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenseAccountOtherAllwncAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="styLNAmountBox" style="text-align: left; width: 53mm; border-left-width: 0px; height:auto; font-size:6pt">
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
							<xsl:if test="(($Print = $Separated) and (count($FormData/OfficerDirTrstKeyEmplInfoGrp/OfficerDirTrstKeyEmplGrp) &gt;4)) or 
							(count($FormData/OfficerDirTrstKeyEmplInfoGrp/OfficerDirTrstKeyEmplGrp) = 0)">
								<xsl:call-template name="AddRowsLine1">
									<xsl:with-param name="RowCount" select="0"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
					<!--  Line 1  -->
					<!--  Line 2  -->       
					<div  style="width: 187mm; border-right-width: 0px; padding-left: 2mm; text-align: left; font-weight:bold">2  
						<span style="width: 2mm"/> 
						Compensation of five highest-paid employees (other than those included on line 1—see instructions).  If none, enter “NONE."
					</div>
					<div>
					<table class="styTable" style="font-size: 7pt; border-color:black; width: 187mm; height:100%" cellspacing="0">
						<thead class="styTableTHead">
							<tr>
								<th scope="col" class="styTableCellHeader" colspan="5" style="width: 187mm; border-right-width: 0px;"></th>
							</tr>
							<tr scope="col">
								<th scope="col" class="styTableCellHeader" style="border-right-width: 0px; width: 59mm">
									<span class="styNormalText">
									<b>(a)</b>  Name and address of each employee paid more than $50,000
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; width: 32mm">
									<span class="styNormalText">
										<b>(b)</b>  Title, and average<br/>hours per week<br/>devoted to position
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width:0px; border-left-width: 1px; width: 32mm">(c)
									<span class="styNormalText">
									  Compensation		
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="border-right-width: 0px; border-left-width: 1px; width: 32mm">
									<span class="styNormalText">
										<b>(d)</b>  Contributions to<br/>employee benefit<br/>plans and deferred<br/>compensation
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="width: 32mm; border-right-width: 0px; border-left-width: 1px">
									<span class="styNormalText">
									<b>(e)</b>  Expense account,<br/>other allowances
									</span>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<xsl:for-each select="$FormData/OfficerDirTrstKeyEmplInfoGrp/CompensationHighestPaidEmplGrp">
								<tr>
									<td class="styLNAmountBox" style="float:none;text-align: left; width: 59mm; border-left-width: 0px">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PersonNm"/>
										</xsl:call-template>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="PersonNm"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBox" rowspan="2" style="float: none;text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="TitleTxt"/>
										</xsl:call-template>
										<xsl:if test="AverageHrsPerWkDevotedToPosRt != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AverageHrsPerWkDevotedToPosRt"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styLNAmountBox" rowspan="2" style="float: none;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CompensationAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBox" rowspan="2" style="float: none;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="EmployeeBenefitsAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBox" rowspan="2" style="float: none;border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ExpenseAccountAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNAmountBox" style="text-align: left; width: 59mm; border-left-width: 0px; height:auto">
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
								<xsl:with-param name="RowCount" select="count($FormData/OfficerDirTrstKeyEmplInfoGrp/CompensationHighestPaidEmplGrp)"/>
							</xsl:call-template>
							<tr>
								<td class="styTableCell" colspan="4" style="width: 155mm; border-bottom-width: 1px; text-align: left; border-right-width: 0px">
									<span class="styBoldText">Total </span> number of other employees paid over $50,000<span class="styDotLn" 
									style="float: none; clear: none; padding-right: 4mm">...................</span>
									<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
								</td>
								<td class="styLNAmountBox" style="text-align:right; float:none; clear:none">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OfficerDirTrstKeyEmplInfoGrp/OtherEmployeePaidOver50kCnt"/>
										<xsl:with-param name="MaxSize" select="6"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
					<!--  Line 2  -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
							Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
						</div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
							Page <span class="styBoldText" style="font-size: 8pt">7</span>
						</div>
					</div>
					<!--END HEADER-->
					<div style="width:187mm;border-top-width: 1px; float: none; clear: both" class="styBB">
						<div class="styPartName" style="width:18mm; margin-top: 2mm; margin-bottom:2.5mm">Part VIII</div>
						<div class="styPartDesc" style="padding-top: 0mm;width:169mm">
						   Information About Officers, Directors, Trustees, Foundation Managers, Highly Paid Employees,<br/>
						   and Contractors <i>(continued)</i>
						</div>
					</div>
					<!--  Line 3  -->
					<table class="styTable" style="font-size: 7pt; border-color:black; width: 187mm" cellspacing="0">
						<thead class="styTHead">
							<tr scope="col">
								<tr>
									<th scope="col" class="styTableCellHeader" colspan="5" style="width: 187mm; border-right-width: 0px; padding-left: 2mm; text-align: left">
        3  <span style="width: 2mm"/> Five highest-paid independent contractors for professional services (see instructions). If none, enter "NONE".
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
							<xsl:for-each select="$FormData/OfficerDirTrstKeyEmplInfoGrp/CompensationOfHghstPdCntrctGrp">
								<tr>
									<td class="styLNAmountBox" style="text-align: left; width: 91mm; border-left-width: 0px; height:auto">
										<xsl:choose>
											<xsl:when test="PersonNm != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
													<xsl:with-param name="TabOrder" select="2"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="BusinessName"/>
														<xsl:with-param name="TabOrder" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styLNAmountBox" rowspan="2" style="float: none;text-align: left; width: 64mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ServiceTypeTxt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBox" rowspan="2" style="float: none;border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CompensationAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNAmountBox" style="text-align: left; width: 91mm; border-left-width: 0px; height:auto">
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
								<xsl:with-param name="RowCount" select="count($FormData/OfficerDirTrstKeyEmplInfoGrp/CompensationOfHghstPdCntrctGrp)"/>
							</xsl:call-template>
						</tbody>
					</table>
					<div class="styBB" style="width: 187mm"><!--
							<tr>
								<td class="styTableCell" colspan="3" style="width: 155mm; border-bottom-width: 1px; text-align: left; border-right-width: 0px">
									<span class="styBoldText">Total </span> number of other employees paid over $50,999<span class="styDotLn" 
									style="float: none; clear: none; padding-right: 4mm">...................</span>
									<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
								</td>
								<td class="styLNAmountBox" style="text-align:right; float:none; clear:none">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OfficerDirTrstKeyEmplInfoGrp/OtherEmployeePaidOver50kCnt"/>
										<xsl:with-param name="MaxSize" select="6"/>
									</xsl:call-template>
								</td>
							</tr>-->
						<span class="styBoldText">Total </span> number of others receiving over $50,000 for professional services<span class="styDotLn" 
						style="float: none; clear: none; padding-right: 5mm">.............</span>
						<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet" style="padding-right:5.8mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; float:none; clear:none">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OfficerDirTrstKeyEmplInfoGrp/ContractorPaidOver50kCnt"/>
								<xsl:with-param name="MaxSize" select="6"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 3  -->
					<!--<div class="pageEnd"/>
					<div style="page-break-after:always"/>-->
					<!--  Part IX-A  -->
					<div style="width:187mm;border-top-width: 0px; " class="styBB">
						<div class="styPartName" style="width:18mm;">Part IX-A</div> 
						<div class="styPartDesc" style=";width:169mm">
							Summary of Direct Charitable Activities 
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 100%; border-bottom-width: 0px">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead class="styTHead">
								<tr scope="col">
									<th scope="col"  colspan="1" class="styTableCellHeader" style="border-right-width: 0px; width: 153mm; text-align: left; font-size: 6pt;">
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
									<xsl:when test="count($FormData/SummaryOfDirectChrtblActyGrp/Expenses1Amt)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px; ">
												<span class="styBoldText">1</span>
											</td>
											<td class="styLNAmountBox" style=" width: 148mm; border-left-width: 0px; height:auto;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="float: none;border-right-width:0px;height:auto ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Expenses1Amt"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style=" width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox"  style="text-align: left; width: 148mm; border-left-width: 0px; heigh:auto">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox"  style="float: right;text-align: left;width: 148mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="float:left; width: 5mm; border-left-width: 0px;border-bottom-width: 0px;">
												<span class="styBoldText">1</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width:148mm;border-left-width: 0px; height:auto; ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Description1Txt"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="float:none; border-right-width:0px; vertical-align:bottom;padding-top:0mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Expenses1Amt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="count($FormData/SummaryOfDirectChrtblActyGrp/Expenses2Amt)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px;">
												<span class="styBoldText">2</span>
											</td>
											<td class="styLNAmountBox" style=" text-align: left; width: 148mm; border-left-width: 0px; height:auto">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="float: none;border-right-width:0px; padding-top:0mm; height:auto">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Expenses2Amt"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px;height:auto;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px; height:auto">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px;">
												<span class="styBoldText">2</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px; height:auto">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Description2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="float:none;border-right-width:0px;vertical-align:bottom;padding-top:0mm; height:auto">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Expenses2Amt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="count($FormData/SummaryOfDirectChrtblActyGrp/Expenses3Amt)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px;">
												<span class="styBoldText">3</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px; height:auto">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="float:none;border-right-width:0px;padding-top:0mm; height:auto">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Expenses3Amt"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px; height:auto">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px; height:auto">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px;height:auto">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px;">
												<span class="styBoldText">3</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px;height:auto">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Description3Txt"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="float:none;border-right-width:0px;vertical-align:bottom;padding-top:0mm;height:auto">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Expenses3Amt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="count($FormData/SummaryOfDirectChrtblActyGrp/Expenses4Amt)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px;">
												<span class="styBoldText">4</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px;height:auto">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="float:none;border-right-width:0px; padding-top:0mm; height:auto">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Expenses4Amt"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px; height:auto">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px; height:auto">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;height:auto">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px;height:auto">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styLNAmountBox" style="width:5mm; border-left-width: 0px;border-bottom-width: 0px;">
												<span class="styBoldText">4</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 148mm; border-left-width: 0px; height:auto">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Description4Txt"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="float:none;border-right-width:0px;vertical-align:bottom;padding-top:0mm; height:auto">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SummaryOfDirectChrtblActyGrp/Expenses4Amt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<!--  Part IX-A  -->

					<!--  Part IX-B  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width:18mm">Part IX-B</div>
						<div class="styPartDesc" style="width:169mm">
    Summary of Program-Related Investments <span class="styNormalText"> (see instructions)</span>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 100%; border-bottom-width: 0px">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead class="styTHead">
								<tr scope="col">
									<th scope="col" colspan="1" class="styTableCellHeader" style="border-right-width: 0px; width: 155mm; text-align: left; font-size: 6pt; padding-left: 4mm">
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
									<xsl:when test="count($FormData/SumOfProgramRelatedInvstGrp/Description1Txt)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px; height:auto">
												<span class="styBoldText">1</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px;"><!-- height:16mm-->
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="float:none;border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvstGrp/Expenses1Amt"/>
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
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px; height:auto">
												<span class="styBoldText">1</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px; height:auto">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvstGrp/Description1Txt"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="float:none;border-right-width:0px;vertical-align:bottom;padding-top:0mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvstGrp/Expenses1Amt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="count($FormData/SumOfProgramRelatedInvstGrp/Description2Txt)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px; height:auto">
												<span class="styBoldText">2</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px; height:auto">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="float:none;border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvstGrp/Expenses2Amt"/>
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
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px; height:auto">
												<span class="styBoldText">2</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px; height:auto">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvstGrp/Description2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styLNAmountBox" style="float:none;border-right-width:0px;vertical-align:bottom;padding-top:0mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvstGrp/Expenses2Amt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<tr>
									<td class="styLNAmountBox" colspan="2" style="padding-left:4mm; border-bottom-width: 0px; text-align:left; width: 155mm; border-left-width: 0px">All other program-related investments. See instructions.</td>
									<td class="styLNAmountBox" style="float:none;border-right-width:0px; border-bottom-width: 0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="count($FormData/SumOfProgramRelatedInvstGrp/AllOtherProgramRltdInvstTotAmt)=0">
										<tr>
											<td class="styLNAmountBox" style="width: 5mm; border-left-width: 0px;border-bottom-width: 0px; height:auto">
												<span class="styBoldText">3</span>
											</td>
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px; height:auto">
												<span class="styTableCellPad"/>
											</td>
											<td class="styLNAmountBox" rowspan="3" style="float:none;border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvstGrp/AllOtherProgramRltdInvstTotAmt"/>
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
											<td class="styLNAmountBox" style="text-align: left; width: 150mm; border-left-width: 0px;border-right-width:0px;padding-right:4mm;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvstGrp/AllOtherProgramRltdInvstTotAmt"/>
													<xsl:with-param name="TabOrder" select="2"/>
												</xsl:call-template>
												<span style="width: 1px"/>
											</td>
											<td class="styLNAmountBox" style="float:none;border-right-width:0px;border-left-width: 1px;border-bottom-width: 1px;vertical-align:bottom;padding-top:0mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvstGrp/AllOtherProgramRltdInvstTotAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<div class="styBB" style="width: 187mm">
					<span style="width:155mm;float:left;">
					<span style="float:left;"><b>Total.</b> Add lines 1 through 3</span>
					<span style="float:right;">
							<span class="styDotLn">.........................<span style="width: 3mm"/>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/></span>					</span>
						</span>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumOfProgramRelatedInvstGrp/TotalAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Part IX-B  -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
  </div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
							Page <span class="styBoldText" style="font-size: 8pt">8</span>
						</div>
					</div>
					<!--END HEADER-->					
					<!--  Part X  -->
					<div style="width:187mm;border-top-width: 1px; height:auto" class="styBB" >
						<div class="styPartName" style="width:11mm; ">Part X</div>
						<div class="styPartDesc" style="height:auto;  width:176mm; padding-top:0mm">
							Minimum Investment Return 
							<span class="styNormalText" style="float:none; font-size:7pt"> (All domestic foundations must complete this part. Foreign foundations, see 
								instructions.)</span>
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
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/AverageMonthlyFMVOfSecAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/AverageMonthlyCashBalancesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<!--  Line 1c  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Fair market value of all other assets (see instructions)</span>
							<span class="styDotLn">................</span>
						</div>
						<div class="styLNRightNumBox">1c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/FMVAllOtherNoncharitableAstAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/TotalFMVOfUnusedAssetsAmt"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/ReductionClaimedAmt"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn">.............</span>
						</div>
						<div class="styLNRightNumBox">1e</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/ReductionClaimedAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/AcquisitionIndebtednessAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2  -->
					<!--  Line 3  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">3</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Subtract line 2 from line 1d</span>
							<span class="styDotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/AdjustedTotalFMVOfUnusedAstAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3  -->
					<!--  Line 4 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">4</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Cash deemed held for charitable activities. Enter 1 1/2% of line 3 (for greater amount, see</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">instructions)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/CashDeemedCharitableAmt"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/CashDeemedCharitableAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/NetVlNoncharitableAssetsAmt"/>
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
							<span class="styDotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px">6</div>
						<div class="styLNAmountBox" style="border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinimumInvestmentReturnGrp/MinimumInvestmentReturnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6  -->
					<!--  Part XI  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="margin-top: 2mm; height:auto">Part XI</div>
						<div class="styPartDesc" style="height:auto; font-size:7pt; font-weight:normal; padding-top:0mm;">
							<b>Distributable Amount</b>
							<label style="font-weight:normal">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/Sect4942j3j5FndtnAndFrgnOrgInd"/>
									<xsl:with-param name="BackupName">IRS990PFSect4942j3j5FndtnAndFrgnOrg</xsl:with-param>
								</xsl:call-template> 
							</label> (see instructions) (Section 4942(j)(3) and (j)(5) private operating foundations and certain foreign organizations check here 
								<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="right arrow"/>
								<span style="width: 2mm"/>
								<input type="checkbox" alt="Section 4942(j)(3) and (j)(5) and do not complete this part" class="styIRS990PFCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/Sect4942j3j5FndtnAndFrgnOrgInd"/>
										<xsl:with-param name="BackupName">IRS990PFSect4942j3j5FndtnAndFrgnOrg</xsl:with-param>
									</xsl:call-template>
								</input> 
								<label style="font-weight:normal"></label> and do not complete this part.)
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
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/MinimumInvestmentReturnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1  -->
					<!--  Line 2a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">2a</div>
						<div class="styLNDesc" style="width: 99mm">
							<span style="float:left; clear: none">Tax on investment income for 2020 from Part VI, line 5</span>
							<span class="styDotLn">......</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/TaxBasedOnInvestmentIncomeAmt"/>
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
							<span style="float:left; clear: none">Income tax for 2020. (This does not include the tax from Part VI.)</span>
							<span class="styDotLn">...</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/IncomeTaxAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/TotalTaxAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/DistributableBeforeAdjAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/RecoveriesQualfiedDistriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4  -->
					<!--  Line 5 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">5</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Add lines 3 and 4</span>
							<span class="styDotLn">............................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/DistributableBeforeDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5  -->
					<!--  Line 6  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">6</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">Deduction from distributable amount (see instructions)</span>
							<span class="styDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/DeductionFromDistributableAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6  -->
					<!--  Line 7  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">7</div>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">
								<span class="styBoldText">Distributable amount </span> as adjusted. Subtract line 6 from line 5. Enter here and on Part XIII, line 1  </span>
								<span class="styDotLn">...</span>
						</div>
					<!--	<div class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 139mm">
							<span style="float:left; clear: none">line 1</span>
							
						</div>-->
						<div class="styLNRightNumBox" style="border-bottom-width: 0px">7</div>
						<div class="styLNAmountBox" style="border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/DistributableAsAdjustedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<!--  Part XII  -->
					<div style="width:187mm;border-top-width: 1px; height: 8mm" class="styBB">
						<div class="styPartName" style="margin-top: 2.5mm; margin-bottom:1.5mm">Part XII</div>
						<div class="styPartDesc" style="margin-top: 2.5mm; margin-bottom:1.5mm">
							Qualifying Distributions <span class="styNormalText"> (see instructions)</span>
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
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistriPartXIIGrp/ExpensesAndContributionsAmt"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">1a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistriPartXIIGrp/ExpensesAndContributionsAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistriPartXIIGrp/ProgramRelatedInvstTotalAmt"/>
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
							<span class="styDotLn">...............................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistriPartXIIGrp/CharitableAssetsAcquisPaidAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistriPartXIIGrp/SetAsideSuitabilityTestAmt"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistriPartXIIGrp/SetAsideCashDistriTestAmt"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">3b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistriPartXIIGrp/SetAsideCashDistriTestAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistriPartXIIGrp/QualifyingDistributionsAmt"/>
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
							<span style="float:left; clear: none">income. Enter 1% of Part I, line 27b. See instructions</span>
							<span class="styDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistriPartXIIGrp/PctSect4940eOrgNetInvstIncmAmt"/>
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
							<span class="styDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingDistriPartXIIGrp/AdjustedQualifyingDistriAmt"/>
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
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
  </div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">9</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--  Part XIII  -->
					<div style="width:187mm;border-top-width: 1px; border-bottom-width: 0px; height: 4mm" class="styBB">
						<div class="styPartName" style="width: 20mm">Part XIII</div>
						<div class="styPartDesc" style="width: 160mm">Undistributed Income <span class="styNormalText"> (see instructions)</span>
						</div>
					</div>
					<div class="styTableContainer" style="border-top-width: 1px; width: 187mm; height: 100%">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" colspan="2" 
									style="width: 75mm; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px">
										<span class="styTableCellPad"/>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 28mm">
									    (a)<br/>
										<span class="styNormalText">Corpus</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 28mm">
									    (b)<br/>
										<span class="styNormalText">Years prior to 2019</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 28mm">
									    (c)<br/>
										<span class="styNormalText">2019</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 28mm; border-right-width: 0px">
									    (d)<br/>
										<span class="styNormalText">2020</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">1
										</span>
										<span style="width: 2mm"/>
										    Distributable amount for 2020 from Part XI, line 7
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
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/DistributableAsAdjustedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">2</span>
										<span style="width: 2mm"/>
										         Undistributed income, if any, as of the end of 2020:
									</td>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">a
										</span>
										<span style="width: 1.5mm"/>
										    Enter amount for 2019 only<span class="styDotLn" style="float:none; clear:none">.......
										</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/UndistributedIncomePYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">b
										</span>
										<span style="width: 1.5mm"/>
											Total for prior years:<span style="width: 2mm"/>
										<xsl:choose>
											<xsl:when test="$FormData/UndistributedIncomeGrp/PriorYear1Yr != ''">
												<span style="width: 2mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/PriorYear1Yr"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 5mm"/>
											</xsl:otherwise>
										</xsl:choose>
										<span style="width: 1mm"/>,
										<xsl:choose>
											<xsl:when test="$FormData/UndistributedIncomeGrp/PriorYear2Yr != ''">
												<span style="width: 2mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/PriorYear2Yr"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<span style="width: 2mm"/>20<span class="styIRS990PFUnderlinedText" style="width: 5mm"/>
											</xsl:otherwise>
										</xsl:choose>
										<span style="width: 1mm"/>,
										<xsl:choose>
											<xsl:when test="$FormData/UndistributedIncomeGrp/PriorYear3Yr != ''">
												<span style="width: 2mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/PriorYear3Yr"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/TotalForPriorYearsAmt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">3
										</span>
										<span style="width: 2mm"/>
										    Excess distributions carryover, if any, to 2020:
									</td>
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
										    From 2015<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessDistributionCyovYr5Amt"/>
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
										    From 2016<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessDistributionCyovYr4Amt"/>
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
										    From 2017<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessDistributionCyovYr3Amt"/>
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
										    From 2018<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessDistributionCyovYr2Amt"/>
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
										    From 2019<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessDistributionCyovYr1Amt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">f<span style="width: 2mm"/>Total</span>
										    of lines 3a through e<span class="styDotLn" style="float:none; clear:none">........</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/TotalExcessDistributionCyovAmt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">4</span>
										<span style="width: 2mm"/>Qualifying distributions for 2020 from Part</td>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span style="width: 5.5mm"/>
										    XII, line 4: <img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
										<span style="width: 2mm"/>$ <span class="styIRS990PFUnderlinedText" style="text-align: right; width: 32mm; font-size: 6pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/QualifyingDistributionsAmt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">a
										</span>
										<span style="width: 1mm"/>
										    Applied to 2019, but not more than line 2a</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/AppliedToYear1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey;border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
									</tr>
								<tr>
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">b
										</span>
										<span style="width: 1mm"/>
										    Applied to undistributed income of prior years
										    <br/>
										<span style="width: 5.5mm"/>(Election required—see instructions)<span class="styDotLn" style="float:none; clear:none">.....
										</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm;  font-size: 6pt"> 
										<span style="padding-right: 4mm">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/AppliedToPriorYearsAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/AppliedToPriorYearsAmt"/>
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
									<td class="styTableCell" 
									style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">c
										</span>
										<span style="width: 1mm"/>
										    Treated as distributions out of corpus (Election<br/>
										<span style="width: 6mm"/>required—see instructions)<span class="styDotLn" style="float:none; clear:none">........
										</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm;  font-size: 6pt"> 
										<span style="padding-right: 4mm">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/TreatedAsDistriFromCorpusAmt"/>
												<xsl:with-param name="TabOrder" select="2"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/TreatedAsDistriFromCorpusAmt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">d
										</span>
										<span style="width: 1mm"/>
										    Applied to 2020 distributable amount<span class="styDotLn" style="float:none; clear:none">.....
										</span>
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
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/AppliedToCurrentYearAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">e
										</span>
										<span style="width: 1mm"/>
										    Remaining amount distributed out of corpus
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/RemainingDistriFromCorpusAmt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">5</span>
										<span style="width: 2mm"/>
										    Excess distributions carryover applied to 2020.
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessDistriCyovAppCYCorpusAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessDistributionCyovAppCYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styItalicText" style="padding-left: 6mm">(If an amount appears in column (d), the <br/>
											<span style="width: 6mm"/>
											    same amount must be shown in column (a).)
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">6<span style="width: 3mm"/>Enter the net total of each column as<br/>
											<span style="width: 6mm"/>
											    indicated below:
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">a
										</span>
										<span style="width: .5mm"/>
										    Corpus. Add lines 3f, 4c, and 4e. Subtract line 5
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/TotalCorpusAmt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">b</span>
										<span style="width: .5mm"/>
										    Prior years’ undistributed income. Subtract<br/>
										<span style="width: 5.5mm"/>line 4b from line 2b
										     <span class="styDotLn" style="float:none; clear:none">..........
										     </span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/PriorYearUndistributedIncmAmt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">c
										</span>
										<span style="width: 1mm"/>
										    Enter the amount of prior years’ undistributed<br/>
										<span style="width: 5.5mm"/>
										    income for which a notice of deficiency has<br/>
										<span style="width: 5.5mm"/>
										    been issued, or on which the section 4942(a)<br/>
										<span style="width: 5.5mm"/>
										    tax has been previously assessed<span class="styDotLn" style="float:none; clear:none">......
										</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/PriorYearDeficiencyOrTaxAmt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">d
										</span>
										<span style="width: 1mm"/>
										    Subtract line 6c from line 6b. Taxable amount<br/>
										<span style="width: 5.5mm"/>—see instructions
										    <span class="styDotLn" style="float:none; clear:none">...........
										    </span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/Taxable1Amt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">e
										</span>
										<span style="width: 1mm"/>
										    Undistributed income for 2019. Subtract line<br/>
										<span style="width: 5.5mm"/>4a from line 2a. Taxable amount—see
										    <br/>
										<span style="width: 5.5mm"/>instructions
										    <span class="styDotLn" style="float:none; clear:none">.............
										    </span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/Taxable2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" 
									style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">f</span>
										<span style="width: 1mm"/>
										    Undistributed income for 2021. Subtract<br/>
										<span style="width: 5.5mm"/>lines 4d and 5 from line 1. This amount must
										    <br/>
										<span style="width: 5.5mm"/>be distributed in 2020
										    <span class="styDotLn" style="float:none; clear:none">..........
										    </span>
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
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/UndistributedIncomeCYAmt"/>
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
										<span style="width: 5.5mm"/>section 170(b)(1)(F) or 4942(g)(3) (Election may 
										<br/>
										<span style="width: 5.5mm; "/>be required - see instructions)
										 <span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/CorpusDistri170b1EOr4942g3Amt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2mm">8
										</span>
										<span style="width: 2mm"/>Excess distributions carryover from 2015 not
										    <br/>
										<span style="width: 5.5mm"/>applied on line 5 or line 7 (see instructions)
										  <span class="styDotLn" style="float:none; clear:none">...
										  </span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 2.5mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessDistriCyovFromYr5Amt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2mm">9<span style="width: 2mm"/>Excess distributions carryover to 2021.
										</span>
										<br/>
										<span style="width: 5.5mm"/>Subtract lines 7 and 8 from line 6a
										    <span class="styDotLn" style="float:none; clear:none">......
										    </span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessDistriCyovToNextYrAmt"/>
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
									<td class="styTableCell" 
										style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 75mm" colspan="2">
										<span class="styBoldText">10</span>
										<span style="width: 2mm"/>
										    Analysis of line 9:
									</td>
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
										<span class="styBoldText" style="padding-left: 2.5mm">a
										</span>
										<span style="width: 1.5mm"/>
										    Excess from 2016<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessFromYear4Amt"/>
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
										<span class="styBoldText" style="padding-left: 2.5mm">b
										</span>
										<span style="width: 1.5mm"/>
										    Excess from 2017<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessFromYear3Amt"/>
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
										    Excess from 2018<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessFromYear2Amt"/>
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
										<span class="styBoldText" style="padding-left: 2.5mm">d
										</span>
										<span style="width: 1.5mm"/>
										    Excess from 2019<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessFromYear1Amt"/>
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
										    Excess from 2020<span class="styDotLn" style="float:none; clear:none">....</span>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeGrp/ExcessFromCurrentYearAmt"/>
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
						   Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
						</div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
						    Page <span class="styBoldText" style="font-size: 8pt">10</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--  Part XIV  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm">Part XIV</div>
						<div class="styPartDesc" style="width: 160mm">
						    Private Operating Foundations <span class="styNormalText"> (see instructions and Part VII-A, question 9)</span>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNDesc" style="text-align:left; width: 131mm">
							<span class="styBoldText">1a</span>
							<span style="width: 2mm"/>
							     If the foundation has received a ruling or determination letter that it is a private operating<br/>
							<span style="width: 6mm"/>
							    foundation, and the ruling is effective for 2020, enter the date of the ruling<span class="styDotLn" style="float:none; clear:none">.......
							    </span>
							<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
						</div>
						<div class="styLNAmountBox" style="width: 56mm; border-right-width: 0px; height: 6mm; padding-top: 2mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/PrivateOperatingFndtnRulingDt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNDesc" style="text-align:left; width: 187mm; height:auto">
							<span class="styBoldText" style="padding-left: 2mm">b</span>
							<span style="width: 1.5mm"/>
							    Check box to indicate whether the organization is a private operating foundation described in section<span style="width: 1mm"/>
							<input type="checkbox" alt="4942(j)(3)" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/Section4942j3Ind"/>
									<xsl:with-param name="BackupName">IRS990PFSection4942j3</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/Section4942j3Ind"/>
									<xsl:with-param name="BackupName">IRS990PFSection4942j3</xsl:with-param>
								</xsl:call-template>4942(j)(3)
							</label> or<span style="width: 2mm"/>
							<input type="checkbox" alt="4942(j)(5)" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/Section4942j5Ind"/>
									<xsl:with-param name="BackupName">IRS990PFSection4942j5</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 1mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/Section4942j5Ind"/>
									<xsl:with-param name="BackupName">IRS990PFSection4942j5</xsl:with-param>
								</xsl:call-template>4942(j)(5)
							</label>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 100%; border-bottom-width: 0px">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styTableCell" rowspan="3" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; 
										width: 62mm">
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
									<td class="styTableCellSmall" rowspan="2" 
										style="text-align: center; border-top-width: 1px; border-right-width: 0px; padding-top: 2mm">
										<span class="styBoldText">(e) Total</span>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align: center">
										<span class="styBoldText">(a)</span> 2020</td>
									<td class="styTableCellSmall" style="text-align: center">
										<span class="styBoldText">(b)</span> 2019</td>
									<td class="styTableCellSmall" style="text-align: center">
										<span class="styBoldText">(c)</span> 2018</td>
									<td class="styTableCellSmall" style="text-align: center">
										<span class="styBoldText">(d)</span> 2017
										</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/LessorAdjNetIncmMinInvstRetGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/LessorAdjNetIncmMinInvstRetGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/LessorAdjNetIncmMinInvstRetGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/LessorAdjNetIncmMinInvstRetGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/LessorAdjNetIncmMinInvstRetGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 1.5mm">b</span>
										<span style="width: 2mm"/>
         85% of line 2a
         <span class="styDotLn" style="float:right; clear:none">.........</span>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/Pct85LessorAdjIncmOrMinRetGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/Pct85LessorAdjIncmOrMinRetGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/Pct85LessorAdjIncmOrMinRetGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/Pct85LessorAdjIncmOrMinRetGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/Pct85LessorAdjIncmOrMinRetGrp/TotalAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistributionsGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistributionsGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistributionsGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistributionsGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistributionsGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style=" float:left;padding-left: 1.5mm">d</span>
										<span style="width: 2mm;"/>
										 Amounts included in line 2c not used directly
										 <div class="styLNLeftLtrBox" style="width:6mm;"/> for active conduct of exempt activities
										    <span class="styDotLn" style="float:right; clear:none">..........</span>
									</td>
									<td class="styTableCellSmall" style="padding-top: 2mm; font-size: 6pt;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistriNotUsedDrtGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 2mm; font-size: 6pt;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistriNotUsedDrtGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 2mm; font-size: 6pt;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistriNotUsedDrtGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 2mm; font-size: 6pt;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistriNotUsedDrtGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 2mm; font-size: 6pt;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistriNotUsedDrtGrp/TotalAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistriMadeDrtGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistriMadeDrtGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistriMadeDrtGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistriMadeDrtGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/QualifyingDistriMadeDrtGrp/TotalAmt"/>
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
         “Assets" alternative test—enter:</td>
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
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalAssetsGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalAssetsGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalAssetsGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalAssetsGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalAssetsGrp/TotalAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalAssetsSect4942j3BiGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalAssetsSect4942j3BiGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalAssetsSect4942j3BiGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalAssetsSect4942j3BiGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalAssetsSect4942j3BiGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 1.5mm">b</span>
										<span style="width: 2mm"/>
        “Endowment" alternative test— enter 2/3<br/>
										<span style="width: 6mm"/>
        of minimum investment return shown in<br/>
										<span style="width: 6mm"/>
        Part X, line 6 for each year listed<span class="styDotLn" style="float:none; clear:none">...</span>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TwoThirdsMinimumInvstRetGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TwoThirdsMinimumInvstRetGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TwoThirdsMinimumInvstRetGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TwoThirdsMinimumInvstRetGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 6mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TwoThirdsMinimumInvstRetGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styTableCellSmall" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 62mm">
										<span class="styBoldText" style="padding-left: 1.5mm">c</span>
										<span style="width: 2mm"/>
											 “Support" alternative test—enter:</td>
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
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalSupportGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 12mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalSupportGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 12mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalSupportGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 12mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalSupportGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 12mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/TotalSupportGrp/TotalAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/PublicSupportType/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/PublicSupportType/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/PublicSupportType/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/PublicSupportType/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px;  padding-top: 9mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/PublicSupportType/TotalAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/LargestSupportFromEOGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/LargestSupportFromEOGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/LargestSupportFromEOGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/LargestSupportFromEOGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; padding-top: 3mm; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/LargestSupportFromEOGrp/TotalAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/GrossInvestmentIncomeGrp/CurrentYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/GrossInvestmentIncomeGrp/Year1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/GrossInvestmentIncomeGrp/Year2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/GrossInvestmentIncomeGrp/Year3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="border-right-width: 0px; border-bottom-width: 0px; font-size: 6pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PrivateOperatingFoundationsGrp/GrossInvestmentIncomeGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  Part XV  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="margin-top:2mm">Part XV</div>
						<div class="styPartDesc" style="height:auto">
							Supplementary Information (Complete this part only if the foundation had $5,000 or more in<br/>
							assets at any time during the year—see instructions.)  
						</div>
					</div>
					<!--  Line 1a  -->
					<div style="text-align:left; width: 187mm">
						<span class="styBoldText">1</span>
						<span style="width: 4.5mm"/>
						<span class="styBoldText">Information Regarding Foundation Managers:</span>
					</div>
					<div style="text-align:left; width: 187mm;height:auto">
						<span class="styBoldText" style="padding-left:2mm">a</span>
						<span style="width: 2mm"/>List any managers of the foundation who have contributed more than 2% of the total contributions     
							received by the foundation<br/>
						<span style="width: 6mm"/>
							before the close of any tax year (but only if they have contributed more than $5,000). (See section 507(d)(2).)
				    </div>
					<div class="styGenericDiv" style="width:187mm;height:auto">
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/ContributingManagerNm"/>
								<xsl:with-param name="setDynamicHeight" select="4"/>
								<xsl:with-param name="containerID" select="'1aCMctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; " id="1aCMctn"><!--height:14mm-->
						<!--<xsl:call-template name="SetInitialState"/>-->
						<table class="styTable" style="font-size: 7pt">
							<tbody>
								<!--<xsl:call-template name="SetInitialState"/>-->
								<xsl:if test="($Print != $Separated) or (count($FormData/SupplementaryInformationGrp/ContributingManagerNm) &lt;2)">
									<xsl:for-each select="$FormData/SupplementaryInformationGrp/ContributingManagerNm">
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
								<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformationGrp/ContributingManagerNm) &gt;1)">
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; border-bottom-width: 0px">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/ContributingManagerNm"/>
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
						<span style="width: 2mm"/>List any managers of the foundation who own 10% or more of the stock of a corporation (or an equally large 
							portion of the<br/>
						<span style="width: 6mm"/>
							ownership of a partnership or other entity) of which the foundation has a 10% or greater interest.
				    </div>
					<div class="styGenericDiv" style="width:187mm;height:auto">
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/ShareholderManagerNm"/>
								<xsl:with-param name="setDynamicHeight" select="4"/>
								<xsl:with-param name="containerID" select="'1bSMctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm;" id="1bSMctn">
						<!--<xsl:call-template name="SetInitialState"/>-->
						<table class="styTable" style="font-size: 7pt">
							<tbody>
								<!--<xsl:call-template name="SetInitialState"/>-->
								<xsl:if test="($Print != $Separated) or (count($FormData/SupplementaryInformationGrp/ShareholderManagerNm) &lt;2)">
									<xsl:for-each select="$FormData/SupplementaryInformationGrp/ShareholderManagerNm">
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
								<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformationGrp/ShareholderManagerNm) &gt;1)">
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; border-bottom-width: 0px">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/ShareholderManagerNm"/>
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
						<input type="checkbox" alt="Only makes contributions to preselected charitable organizations" class="styIRS990PFCkBox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/OnlyContriToPreselectedInd"/>
								<xsl:with-param name="BackupName">IRS990PFOnlyContributesToPreselected</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/OnlyContriToPreselectedInd"/>
								<xsl:with-param name="BackupName">IRS990PFOnlyContributesToPreselected</xsl:with-param>
							</xsl:call-template>
							   if the foundation only makes contributions to preselected charitable organizations and does not accept<br/>
							<span style="width: 6mm"/>
								unsolicited requests for funds. If the foundation makes gifts, grants, etc. to individuals or organizations under<br/>
							<span style="width: 6mm"/>
							  other conditions, complete items 2a, b, c, and d.  See instructions
						</label>
					</div>
					<!--  Line 2  -->
					<!--  Line 2a  - 2d   -->
					<div class="styGenericDiv" style="width:187mm; ">
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp"/>
								<xsl:with-param name="setDynamicHeight" select="1"/>
								<xsl:with-param name="containerID" select="'2aASctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" style="width: 187mm; height: 50mm" id="2aASctn">
						<!--<xsl:call-template name="SetInitialState"/>-->
						<table class="styTable" style="font-size: 7pt">
							<tbody>
								<!--<xsl:call-template name="SetInitialState"/>-->
								<xsl:if test="($Print != $Separated) or (count($FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp) &lt;2)">
									<xsl:for-each select="$FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp">
										<tr>
											<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm; height:auto">
												<span class="styBoldText" style="padding-left:2mm">a</span>
												<span style="width: 2mm"/>The name, address, and telephone number or e-mail address of the person to whom applications 
													should be addressed:</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientPersonNm"/>
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
												<xsl:if test="count(RecipientPhoneNum) &gt;0">
													<br/>
													<xsl:call-template name="PopulatePhoneNumber">
														<xsl:with-param name="TargetNode" select="RecipientPhoneNum"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientEmailAddressTxt) &gt;0">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientEmailAddressTxt"/>
													</xsl:call-template>
												</xsl:if>												
											</td>
										</tr>
										<!--  Line 2a  -->
										<!--  Line 2b  -->
										<tr>
											<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px">
												<span class="styBoldText" style="padding-left:2mm">b</span>
												<span style="width: 2mm"/>The form in which applications should be submitted and information and materials they should 
													include:</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FormAndInfoAndMaterialsTxt"/>
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
													<xsl:with-param name="TargetNode" select="SubmissionDeadlinesTxt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!--  Line 2c  -->
										<!--  Line 2d  -->
										<tr>
											<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
												<span class="styBoldText" style="padding-left:2mm">d</span>
												<span style="width: 2mm"/>Any restrictions or limitations on awards, such as by geographical areas, charitable fields, kinds 
													of institutions, or other<br/>
												<span style="width: 6mm"/>factors:</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">width: 187mm; padding-left: 6mm; border-bottom-width: 0px</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RestrictionsOnAwardsTxt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!--  Line 2d  -->
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp)=0) or (($Print = $Separated) and 
									(count($FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp) &gt;1))">
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
											<span class="styBoldText" style="padding-left:2mm">a</span>
											<span style="width: 2mm"/>The name, address, and telephone number or email address of the person to whom applications 
												should be addressed:
										</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; padding-top: 4mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" 
													select="$FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp/RecipientPersonNm"/>
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
												<xsl:with-param name="TargetNode" 
													select="$FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp/FormAndInfoAndMaterialsTxt"/>
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
												<xsl:with-param name="TargetNode" 
													select="$FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp/SubmissionDeadlinesTxt"/>
											</xsl:call-template>
										</td>
									</tr>
									<!--  Line 2c  -->
									<!--  Line 2d  -->
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm; padding-top: 1mm">
											<span class="styBoldText" style="padding-left:2mm">d</span>
											<span style="width: 2mm"/>Any restrictions or limitations on awards, such as by geographical areas, charitable fields, kinds of institutions, or 
												other
											  <br/>
											<span style="width: 6mm"/>factors:</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; border-bottom-width: 0px;padding-top:5mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" 
													select="$FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp/RestrictionsOnAwardsTxt"/>
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
							Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
						</div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
							Page <span class="styBoldText" style="font-size: 8pt">11</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--  Part XV  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName">Part XV</div>
						<div class="styPartDesc" style="width: 160mm">
							Supplementary Information <span class="styNormalText"> (continued) </span>
						</div>
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp"/>
								<xsl:with-param name="setDynamicHeight" select="4"/>
								<xsl:with-param name="headerRowCount" select="1"/>
								<xsl:with-param name="containerID" select="'Paidctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainerNBB" style="width: 187mm; height: auto; border-bottom-width: 0px" id="Paidctn">
						<!--<xsl:call-template name="SetInitialState"/>-->
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" colspan="5" style="text-align: left; height: 4mm; width: 187mm; border-right-width: 0px">
										<span class="styPartDesc" style="padding-left: 0px">3 
											<span style="width: 4.5mm"/>Grants and Contributions Paid During the Year or Approved for Future Payment
										</span>
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
									<td class="styTableCell" style="border-bottom-width: 0px; text-align:left; width: 55mm; height:auto">
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
								<xsl:if test="($Print != $Separated) or (($Print = $Separated) and 
								(count($FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp) &lt;5))">
									<xsl:for-each select="$FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp">
										<tr style="border-bottom-width: 0px; height:auto">
											<td class="styTableCell" style="text-align:left; width: 55mm">
												<xsl:if test="count(RecipientPersonNm) &gt;0">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientPersonNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientBusinessName/BusinessNameLine1Txt) &gt;0">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientBusinessName/BusinessNameLine2Txt) &gt;0">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2Txt"/>
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
													<xsl:with-param name="TargetNode" select="RecipientRelationshipTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align: left; width: 20mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientFoundationStatusTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align: left; width: 40mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="GrantOrContributionPurposeTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align: right; width: 32mm; border-right-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Amt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp) &lt;1) or (($Print = $Separated) and 
									(count($FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp) &gt;4))">
									<tr style="height: auto">
										<td class="styTableCell" style="text-align:left; width: 55mm">
										<xsl:choose>
											<xsl:when test="$FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp/RecipientPersonNm !=''">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" 
													select="$FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp/RecipientPersonNm"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" 
												select="$FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp/RecipientBusinessName"/>
											</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
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
									<xsl:if test="($Print != $Separated)">
										<td class="styTableCell" style="width: 32mm; border-right-width: 0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/TotalGrantOrContriPdDurYrAmt"/>
											</xsl:call-template>
										</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp"/>
						<xsl:with-param name="setDynamicHeight" select="9"/>
						<xsl:with-param name="containerID" select=" 'Paidctn' "/>
					</xsl:call-template>
					<xsl:if test="(count($FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp) &gt;4)">
						<div class="styBB" style="width: 187mm">
							<div style="float:right">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp"/>
									<xsl:with-param name="setDynamicHeight" select="4"/>
									<xsl:with-param name="headerRowCount" select="1"/>
									<xsl:with-param name="containerID" select="'Futurectn'"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<div class="styTableContainerNBB" style="width: 187mm; height: auto; border-bottom-width: 0px; border-top-width:1px" id="Futurectn">
						<!--<xsl:call-template name="SetInitialState"/>-->
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
								<xsl:if test="($Print != $Separated) or (($Print = $Separated) and
									 (count($FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp) &lt;4))">
									<xsl:for-each select="$FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp">
										<tr>
											<td class="styTableCell" style="text-align:left;  width: 55mm">
												<xsl:if test="count(RecipientPersonNm) &gt;0">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientPersonNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientBusinessName/BusinessNameLine1Txt) &gt;0">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count(RecipientBusinessName/BusinessNameLine2Txt) &gt;0">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2Txt"/>
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
													<xsl:with-param name="TargetNode" select="RecipientRelationshipTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align: left; width: 20mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientFoundationStatusTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align: left; width: 40mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="GrantOrContributionPurposeTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 32mm; border-right-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Amt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp) &lt;1) or 
								((count($FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp) &gt;3) and ($Print = $Separated))">
									<tr style="height: auto">
										<td class="styTableCell" style="width: 55mm; text-align: left">
										<xsl:choose>
											<xsl:when test="$FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp/RecipientPersonNm !=''">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" 
													select="$FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp/RecipientPersonNm"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>											
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" 
													select="$FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp/RecipientBusinessName"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
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
										<span class="styBoldText">Total <span class="styDotLn" style="float:none; clear:none">.................................</span>
											<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
											<span style="width: 1.5mm"/> 3b</span>
									</td>
									<xsl:if test="($Print != $Separated)">
										<td class="styTableCell" style="width: 32mm; border-right-width: 0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/TotalGrantOrContriApprvFutAmt"/>
											</xsl:call-template>
										</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp"/>
						<xsl:with-param name="setDynamicHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'Futurectn' "/>
					</xsl:call-template>
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
							Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
						</div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
							Page <span class="styBoldText" style="font-size: 8pt">12</span>
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
									<span style="width:8mm"/>
									<span class="styNormalText" style="text-align:left;width:70mm;height:4mm;font-size:7pt"> Enter gross amounts unless otherwise indicated. </span>
								</th>
								<th scope="col" class="styTableCellHeader" colspan="2" style="height: 4mm; width: 45mm">
									<span class="styNormalText"> Unrelated business income </span>
								</th>
								<th scope="col" class="styTableCellHeader" colspan="2" style="height: 4mm; width: 46mm">
									<span class="styNormalText">
										<span style="font-size: 6pt">Excluded by section 512, 513, or 514
										</span>
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" rowspan="2" style="height: 4mm; width: 25mm; border-right-width: 0px">(e)<br/>
									<span class="styNormalText"> Related or exempt<br/>  function income<br/>  (See instructions.)          
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
									<span class="styNormalText"> Business code 
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 25mm">(b)<br/>
									<span class="styNormalText"> Amount          
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 25mm">(c)<br/>
									<span class="styNormalText"> Exclusion code  
									</span>
								</th>
								<th scope="col" class="styTableCellHeader" style="height: 4mm; width: 25mm">(d)<br/>
									<span class="styNormalText"> Amount   
									</span>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<xsl:if test="(count($FormData/AnalysisIncomeProducingActyGrp/ProgramServiceRevPartVIIGrp) &gt;0 and ($Print != $Separated)) or
							 (($Print = $Separated) and (count($FormData/AnalysisIncomeProducingActyGrp/ProgramServiceRevPartVIIGrp) &lt;7))">
								<xsl:for-each select="$FormData/AnalysisIncomeProducingActyGrp/ProgramServiceRevPartVIIGrp">
									<tr>
										<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 71mm">
										<span style="vertical-align:top;">
											<span class="styBoldText" style="padding-left: 4.5mm;">
												<xsl:call-template name="GenerateLetter3"/>
											</span>
											</span>
											<span style="width: 1mm"/>
											<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; width: 61mm; float:right">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Desc"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center; vertical-align:bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnrelatedBusinessTaxblIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center;vertical-align:bottom;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExclusionCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExclusionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncmAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="(count($FormData/AnalysisIncomeProducingActyGrp/ProgramServiceRevPartVIIGrp) &lt;7)">
								<xsl:call-template name="RowsAtoF">
									<xsl:with-param name="RowCount" select="count($FormData/AnalysisIncomeProducingActyGrp/ProgramServiceRevPartVIIGrp) + 1"/>
									<xsl:with-param name="Letters" select="7"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="(($Print = $Separated) and (count($FormData/AnalysisIncomeProducingActyGrp/ProgramServiceRevPartVIIGrp) &gt;6))">
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
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/FeesContractsFromGovtAgGrp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/FeesContractsFromGovtAgGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/FeesContractsFromGovtAgGrp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/FeesContractsFromGovtAgGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/FeesContractsFromGovtAgGrp/RelatedOrExemptFunctionIncmAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">2</span>
									<span style="width: 1mm"/>
        Membership dues and assessments<span class="styDotLn" style="float:none; clear:none">....</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/MembershipDuesAndAssmntGrp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/MembershipDuesAndAssmntGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/MembershipDuesAndAssmntGrp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/MembershipDuesAndAssmntGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/MembershipDuesAndAssmntGrp/RelatedOrExemptFunctionIncmAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="float:left; padding-left:1.5mm;">3</span>
									<span style="width: 1mm"/>
									Interest on savings and temporary cash <br/> 
									<div class="styLNLeftLtrBox" style="width:5mm;"/>investments
									<span class="styDotLn" style="float:right; clear:none">...........</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/IntOnSavAndTempCashInvstGrp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/IntOnSavAndTempCashInvstGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/IntOnSavAndTempCashInvstGrp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/IntOnSavAndTempCashInvstGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/IntOnSavAndTempCashInvstGrp/RelatedOrExemptFunctionIncmAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">4</span>
									<span style="width: 1mm"/>
        Dividends and interest from securities<span class="styDotLn" style="float:none; clear:none">....</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/DivAndIntFromSecPartVIIGrp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/DivAndIntFromSecPartVIIGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/DivAndIntFromSecPartVIIGrp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/DivAndIntFromSecPartVIIGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/DivAndIntFromSecPartVIIGrp/RelatedOrExemptFunctionIncmAmt"/>
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
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRntlIncmReDebtFincdPropGrp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRntlIncmReDebtFincdPropGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRntlIncmReDebtFincdPropGrp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRntlIncmReDebtFincdPropGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRntlIncmReDebtFincdPropGrp/RelatedOrExemptFunctionIncmAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 71mm">
									<span class="styBoldText" style="padding-left: 4.5mm">b</span>
									<span style="width: 1mm"/>Not debt-financed property<span class="styDotLn" style="float:none; clear:none">.....</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRntlIncmReNotDebtFincdProp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRntlIncmReNotDebtFincdProp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRntlIncmReNotDebtFincdProp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRntlIncmReNotDebtFincdProp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRntlIncmReNotDebtFincdProp/RelatedOrExemptFunctionIncmAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="float:left;padding-left:1.5mm">6</span>
									<span style="width: 1mm"/>
									Net rental income or (loss) from personal property
									</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRentalIncomePersonalPropGrp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRentalIncomePersonalPropGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRentalIncomePersonalPropGrp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRentalIncomePersonalPropGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetRentalIncomePersonalPropGrp/RelatedOrExemptFunctionIncmAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">7</span>
									<span style="width: 1mm"/>
        Other investment income<span class="styDotLn" style="float:none; clear:none">.....</span>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/OtherInvestmentIncmPartVIIGrp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/OtherInvestmentIncmPartVIIGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/OtherInvestmentIncmPartVIIGrp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/OtherInvestmentIncmPartVIIGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/OtherInvestmentIncmPartVIIGrp/RelatedOrExemptFunctionIncmAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="float:left; padding-left:1.5mm">8</span>
									<span style="width:1mm"/>
									Gain or (loss) from sales of assets other than <br/>
									<div class="styLNLeftLtrBox" style="width:5mm;"/>inventory
									<span class="styDotLn" style="float:right; clear:none">............</span>
									</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/GainSalesAstOthThanInvntryGrp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/GainSalesAstOthThanInvntryGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/GainSalesAstOthThanInvntryGrp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/GainSalesAstOthThanInvntryGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/GainSalesAstOthThanInvntryGrp/RelatedOrExemptFunctionIncmAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText" style="padding-left:1.5mm">9</span>
									<span style="width: 1mm"/>
        Net income or (loss) from special events:
      </td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetIncomeLossFromSpecialEvtGrp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetIncomeLossFromSpecialEvtGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetIncomeLossFromSpecialEvtGrp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/NetIncomeLossFromSpecialEvtGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$FormData/AnalysisIncomeProducingActyGrp/NetIncomeLossFromSpecialEvtGrp/RelatedOrExemptFunctionIncmAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
									<span class="styBoldText">10</span>
									<span style="width: 1mm"/>
									    Gross profit or (loss) from sales of inventory
									<!--<span class="styDotLn" style="float:none; clear:none">..</span>-->
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center; vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/GrossProfitLossSlsOfInvntryGrp/BusinessCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$FormData/AnalysisIncomeProducingActyGrp/GrossProfitLossSlsOfInvntryGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center; vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/GrossProfitLossSlsOfInvntryGrp/ExclusionCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/GrossProfitLossSlsOfInvntryGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm; vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/GrossProfitLossSlsOfInvntryGrp/RelatedOrExemptFunctionIncmAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<xsl:if test="(($Print!=$Separated) and (count($FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp) &gt;0)) or (($Print=$Separated) and (count($FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp) &lt;6))">
								<xsl:for-each select="$FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp">
									<xsl:if test="position()=1">
									
										<tr>
											<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left;">
												<span style="float:left;">
															<span class="styBoldText">11</span>
												<span style="width: 1mm"/>
														Other revenue: </span> <br/>
											
												<span class="styBoldText" style="float;left; padding-left: 4.5mm; vertical-align:top">
													<xsl:number value="position()" format="a"/>
												</span>
												<span style="width: 1mm"/>
													
											<span style="float:none;">
											<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; padding-top:1mm; width:60mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Desc"/>
												</xsl:call-template>
											</span>
											</span>
											
										</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessCd"/>
												</xsl:call-template>
											</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="UnrelatedBusinessTaxblIncmAmt"/>
												</xsl:call-template>
											</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center; vertical-align:bottom;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExclusionCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExclusionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm;vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncmAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									</xsl:if>
									<xsl:if test="position() != 1">
										<tr>
											<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 71mm">
												<span style="vertical-align:top;">
												<span class="styBoldText" style="padding-left: 4.5mm;">
													<xsl:number value="position()" format="a"/>
												</span>
												</span>
												<span style="width: 1mm"/>
												<span class="styIRS990PFUnderlinedText" style="font-size: 6pt; width: 60mm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Desc"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 20mm; text-align: center;vertical-align:bottom;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UnrelatedBusinessTaxblIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; text-align: center; vertical-align:bottom;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExclusionCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; width: 25mm; vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExclusionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size: 6pt; border-right-width:0px; width: 25mm; vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncmAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="(count($FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp) &lt;1) or (($Print=$Separated) and (count($FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp) &gt;5))">
								<tr>
									<td class="styTableCell" style="width: 71mm; border-bottom-width: 0px; text-align: left">
										<span class="styBoldText">11</span>
										<span style="width: 1mm"/>
        Other revenue: <span class="styBoldText">a</span>
										<span class="styIRS990PFUnderlinedText" style="width: 32mm; font-size: 6pt">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp"/>
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
									<xsl:with-param name="RowCount" select="count($FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp) + 2"/>
									<xsl:with-param name="Letters" select="6"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="(($Print=$Separated) and (count($FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp) &gt;5))">
								<xsl:call-template name="RowsAtoF">
									<xsl:with-param name="RowCount" select="2"/>
									<xsl:with-param name="Letters" select="6"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="count($FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp) &lt;6">
								<xsl:if test="count($FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp) != 0">
									<xsl:call-template name="RowsAtoF">
										<xsl:with-param name="RowCount" select="count($FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp) + 1"/>
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
								<td class="styTableCellSmall" style="width: 25mm; font-size: 6pt; vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/SubtotalsIncmProducingActyGrp/UnrelatedBusinessTaxblIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="width: 21mmm; background: lightgrey">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="width: 25mm; font-size: 6pt; vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$FormData/AnalysisIncomeProducingActyGrp/SubtotalsIncmProducingActyGrp/ExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="border-right-width:0px; width: 25mm; font-size: 6pt; vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$FormData/AnalysisIncomeProducingActyGrp/SubtotalsIncmProducingActyGrp/RelatedOrExemptFunctionIncmAmt"/>
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
							    Add line 12, columns (b), (d), and (e)<span class="styDotLn" style="float: none; clear: none">..................</span>
						</div>
						<div class="styGenericDiv" style="width: 50mm">
							<div class="styBoldText">13</div>
							<div class="styIRS990PFUnderlinedText" style="width: 45mm; text-align: right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActyGrp/TotalIncomeProducingActyAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styGenericDiv" style="width: 187mm; padding-left: 5mm">
					    (See worksheet in line 13 instructions to verify calculations.)
					</div><!--
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>-->
					<!--  Part XVI-B  --><!--
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm">Part XVI-B</div>
						<div class="styPartDesc" style="width: 160mm">
						  Relationship of Activities to the Accomplishment of Exempt Purposes
						</div>
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp"/>
								<xsl:with-param name="containerHeight" select="24"/>
								<xsl:with-param name="containerID" select="'RActn'"/>
							</xsl:call-template>
						</div>
					</div>-->
						<!-- The page break was commented out, and the header was commented out and moved in response to Defect 48222 gdy-->
					<!--106mm-->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm">Part XVI-B</div>
						<div class="styPartDesc" style="width: 160mm">
						  Relationship of Activities to the Accomplishment of Exempt Purposes
						</div>
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp"/>
								<xsl:with-param name="setDynamicHeight" select="24"/>
								<xsl:with-param name="containerID" select="'RActn'"/>
							</xsl:call-template>
						</div>
						<div class="styTableContainer" style="width: 187mm; height:auto ; border-bottom-width: 0px" id="RActn">
					</div> 
						<!--<xsl:call-template name="SetInitialState"/>-->
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
											the accomplishment of the foundation’s exempt purposes (other than by providing funds for such purposes). (See<br/>
											instructions.)
										</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print!=$Separated) or (($Print=$Separated) and
								 (count($FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp) &lt;25))">
									<xsl:for-each select="$FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp">
										<tr>
											<td class="styTableCell" style="text-align:left; width: 15mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNumberTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 173mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelationshipStatementTxt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:call-template name="PopulateAdditionalRows">
										<xsl:with-param name="RowCounter" select="count($FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp) + 1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="($Print=$Separated) and (count($FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp) &gt;24)">
									<xsl:call-template name="PopulateAdditionalRows">
										<xsl:with-param name="RowCounter" select="1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp"/>
						<xsl:with-param name="containerHeight" select="25"/>
						<xsl:with-param name="containerID" select=" 'RActn' "/>
					</xsl:call-template>
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
  </div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2020)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">13</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--  Part XVII  -->
					<div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartName" style="width: 20mm; margin-top:2mm">Part XVII</div>
						<div class="styPartDesc" style="width: 160mm; height:auto">
    Information Regarding Transfers To and Transactions and Relationships With Noncharitable Exempt Organizations
  </div>
					</div>
					<!--  Line 1  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm;">1</div>
						<div class="styLNDesc" style="width: 157mm; font-size: 7pt">Did the organization directly or indirectly engage in any of the following with any other organization described in section 501(c) (other than section 501(c)(3) organizations) or in section 527, relating to political organizations?
    </div>
						<div class="styLNRightNumBoxWide" style="width: 9mm; background-color: lightgrey;height:7.5mm;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">Yes</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">No</div>
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
							<span class="styDotLn">...................................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1a(1)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/TrnsfrOfCashToNonchrtblEOInd"/>
								<xsl:with-param name="BackupName">IRS990PFTrnsfrOfCashToNoncharitableEOYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/TrnsfrOfCashToNonchrtblEOInd"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/TrnsfrOtherAssetNonchrtblEOInd"/>
								<xsl:with-param name="BackupName">IRS990PFTrnsfrOthAssetsNoncharitableEOYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/TrnsfrOtherAssetNonchrtblEOInd"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/SalesOrExchangesOfAssetsInd"/>
								<xsl:with-param name="BackupName">IRS990PFSalesOrExchangesOfAssetsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/SalesOrExchangesOfAssetsInd"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/PurchaseOfAssetsNonchrtblEOInd"/>
								<xsl:with-param name="BackupName">IRS990PFPurchaseAssetsNoncharitableEOYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/PurchaseOfAssetsNonchrtblEOInd"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RentalOfFacilitiesOthAssetsInd"/>
								<xsl:with-param name="BackupName">IRS990PFRentalOfFacilitiesEtcYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RentalOfFacilitiesOthAssetsInd"/>
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
							<span class="styDotLn">...........................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1b(4)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/ReimbursementArrangementsInd"/>
								<xsl:with-param name="BackupName">IRS990PFReimbursementArrangementsYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/ReimbursementArrangementsInd"/>
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
							<span class="styDotLn">.............................</span>
						</div>
						<div class="styLNRightNumBoxWide" style="width: 9mm">1b(5)</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/LoansOrLoanGuaranteesInd"/>
								<xsl:with-param name="BackupName">IRS990PFLoansOrLoanGuaranteesYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/LoansOrLoanGuaranteesInd"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/PerformanceOfServicesEtcInd"/>
								<xsl:with-param name="BackupName">IRS990PFPerformanceOfServicesEtcYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/PerformanceOfServicesEtcInd"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/SharingOfFacilitiesEtcInd"/>
								<xsl:with-param name="BackupName">IRS990PFSharingOfFacilitiesEtcYes</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/SharingOfFacilitiesEtcInd"/>
								<xsl:with-param name="BackupName">IRS990PFSharingOfFacilitiesEtcNo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 1c  -->
					<!--  Line 1d  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left: 2mm">d</div>
						<div class="styLNDesc" style="width: 180mm; height:auto">
							If the answer to any of the above is "Yes," complete the following schedule. Column <span class="styBoldText">(b)</span> should always show the 
							fair market value<br/>
							of the goods, other assets, or services given by the reporting foundation. If the foundation received less than fair market value<br/>
							in any transaction or sharing arrangement, show in column <span class="styBoldText">(d)</span>  the value of the goods, other assets, or services 
							received.
						</div>
					</div>
					<!--  Line 1d  -->					
					<div  style="width:187mm">
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail"/>
								<xsl:with-param name="setDynamicHeight" select="5"/><!--16-->
								<xsl:with-param name="containerID" select="'TSctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<br/>
					<div class="styTableContainer" style="width: 187mm;display:table; height: auto; border-top-width:1px; border-bottom-width: 0px" id="TSctn">
						<!--<xsl:call-template name="SetInitialState"/>-->
						<table class="styTable" style="font-size: 7pt; border-color:black; table-layout:fixed;overflow:hidden " cellspacing="0"><!--white-space:nowrap-->
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
								<xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail) &lt;17))">
									<xsl:for-each select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail">
										<tr>
											<td class="styTableCell" style="text-align:left; width: 15mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNumberTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width: 32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InvolvedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; width: 55mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NoncharitableExemptOrgName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="NoncharitableExemptOrgName/BusinessNameLine2Txt !=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NoncharitableExemptOrgName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="text-align:left; width: 85mm; border-right-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransfersTransAndShrArrngmDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:call-template name="PopulateAdditionalRows2">
										<xsl:with-param name="RowCounter" select="count($FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail) +1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="($Print=$Separated) and (count($FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail) &gt;16)">
									<xsl:call-template name="PopulateAdditionalRows2">
										<xsl:with-param name="RowCounter" select="1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail"/>
						<xsl:with-param name="containerHeight" select="17"/>
						<xsl:with-param name="containerID" select=" 'TSctn' "/>
					</xsl:call-template>
					<!--  Line 2a  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="width: 5mm">2a</div>
						<div class="styLNDesc" style="width: 180mm; height:auto">
						  Is the foundation directly or indirectly affiliated with, or related to, one or more tax-exempt organizations<br/>
						  described in section 501(c) (other than section 501(c)(3)) or in section 527?
						  <span class="styDotLn" style="float:none; clear:none">...........</span>
							<input type="checkbox" alt="Relationship to noncharitable tax exempt organizationsYes" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipsNonchrtblEOInd"/>
									<xsl:with-param name="BackupName">IRS990PFRelationshipsNoncharitableEOs</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipsNonchrtblEOInd"/>
									<xsl:with-param name="BackupName">IRS990PFRelationshipsNoncharitableEOs</xsl:with-param>
								</xsl:call-template>Yes
							</label>
							<span style="width: 4mm"/>
							<input type="checkbox" alt="Relationship to noncharitable tax exempt organizationsNo" class="styIRS990PFCkBox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipsNonchrtblEOInd"/>
									<xsl:with-param name="BackupName">IRS990PFRelationshipsNoncharitableEOs</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipsNonchrtblEOInd"/>
									<xsl:with-param name="BackupName">IRS990PFRelationshipsNoncharitableEOs</xsl:with-param>
								</xsl:call-template>No
							</label>
						</div>
					</div>
					<!--  Line 2a  -->
					<!--  Line 2b  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="width: 5mm; padding-left:2mm">b</div>
						<div class="styLNDesc" style="width:140mm;height:auto"> If "Yes," complete the following schedule.</div> 
							<div style="float:right">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipScheduleDetail"/>
									<xsl:with-param name="setDynamicHeight" select="5"/>
									<xsl:with-param name="containerID" select="'RSctn'"/>
								</xsl:call-template>
							</div> 						
					</div>
					<br/>
					<!--  Line 2b  -->
					<div class="styTableContainer" style="width: 187mm; height: auto;display:table ; border-top-width: 1px; border-bottom-width: 0px" id="RSctn">
						<!--<xsl:call-template name="SetInitialState"/>-->
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
								<xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipScheduleDetail) &lt;6))">
									<xsl:for-each select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipScheduleDetail">
										<tr>
											<td class="styTableCell" style="text-align:left; width: 70mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OrganizationBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="OrganizationBusinessName/BusinessNameLine2Txt !=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizationBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="text-align:left; width: 47mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OrganizationTypeDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; width: 70mm; border-right-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelationshipDescriptionTxt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:call-template name="PopulateAdditionalRows3">
										<xsl:with-param name="RowCounter" select="count($FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipScheduleDetail) + 1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(($Print=$Separated) and (count($FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipScheduleDetail) &gt;5))">
									<xsl:call-template name="PopulateAdditionalRows3">
										<xsl:with-param name="RowCounter" select="1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipScheduleDetail"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'RSctn' "/>
					</xsl:call-template>
					<!-- BEGIN Signature section and Preparer section -->
					<table cellspacing="0" style="width:187mm;font-size:7pt;">
					<!--<table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;">gdy 170109-->
						<tr>
							<!-- "Sign Here" image -->
							<td  style="width:10mm;font-size:10pt; font-weight:bold;border-right:1px solid black" rowspan="4">Sign Here
								<!--<img src="{$ImagePath}/990PF_sign_here.gif" alt="SignHere"/>  -->
							</td>				
							<td>
								<!-- BEGIN Signature Section -->
								<table class="styTable" cellspacing="0" style="width:176mm;font-size:7pt;">
									<tr>
										<td colspan="6"  style="width:178mm;vertical-align:top;border-color: black; border-style:solid; border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px;padding-left: 2mm;">
            Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete.  Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
          </td>
									</tr>
									<!-- Data for "Signature of officer or trustee", "Date", "Title" -->
									<tr>
										<td rowspan="2" style=";width:6mm;height:8mm;padding-left:1mm;">
											<img src="{$ImagePath}/990PF_Bullet_Jumbo.gif" alt="Bullet" style="width:2mm;height:8mm;"/>
										</td>
										<td class="styIRS990PFSignatureBox" style="float:none;width:60mm;">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styIRS990PFSignatureBox" style="float:none; width:25mm;height:4mm;border-right-width: 0px;padding-left:1mm;">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
											</xsl:call-template>
										</td>
										<td rowspan="2" style="padding-left:2mm;width:4mm;height:8mm;">
											<img src="{$ImagePath}/990PF_Bullet_Jumbo.gif" alt="Bullet" style="width:2mm;height:8mm;"/>
										</td>
										<td class="styIRS990PFSignatureBox" style="float:none;width:30mm;height:4mm;border-right-width:0px">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
											</xsl:call-template>
										</td>
										<td rowspan="2" style="width:35mm;">
								<div class="styGenericDiv" style="width:2px;"/>
							<div style="width:32mm;font-size:5pt;border-right:3px solid black;border-left:3px solid black;border-bottom:3px solid black;border-top:3px solid 
								black;float:right;" class="styGenericDiv">
									May the IRS discuss this return<br/>
									with the preparer shown below<br/>
									(see instr.)
							  <!-- Permission to discuss return with preparer checkboxes are write in fields -->
							  <input class="styCkbox" alt="MayIRSdiscussReturnWithPreparerYes" type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									  <xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
									  <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep
									  </xsl:with-param>
								</xsl:call-template>
							  </input>
							  <span class="styBoldText">
								<label for="dummyidyes">
								  <xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
									<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								  </xsl:call-template>
								  Yes
								</label>
							  </span>
							  <input class="styCkbox" alt="MayIRSdiscussReturnWithPreparerNo" type="checkbox" name="Checkbox" id="dummyidno" style="width:2mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
								  <xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
								  <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								</xsl:call-template>
							  </input> 
							  <span class="styBoldText">
								<label for="dummyidno">  
								  <xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
									<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								  </xsl:call-template>
								  No
								</label>
							  </span>
							</div>
						 </td>	
									</tr>
									<!-- Labels "Signature of officer or trustee", "Date", "Title" for data on the previous row -->
									<tr>
										<td class="styIRS990PFSignatureText" style="float:none; width:60mm;height:3mm;padding-bottom:1mm;">
										   Signature of officer or trustee
										</td>
										<td class="styIRS990PFSignatureText" style="float:none; width:20mm;height:3mm;padding-bottom:1mm;">
											Date
										</td>
										<td class="styIRS990PFSignatureText" style="float:none;width:30mm;height:3mm;padding-bottom:1mm;">
										   Title
										</td>
         							</tr>
								</table>
								<!-- END Signature Section -->
							</td>
						</tr>
						</table>
								<!-- BEGIN Preparer's Section -->
								<table class="styTable" cellspacing="0" style="width:176mm;font-size:7pt;">
									<tr>
										<!-- "Paid Preparers Use Only" image -->
										<td rowspan="3"  
											style="width:20mm;font-weight:bold;font-size:10pt;border-top:1px solid black;border-bottom:1px solid black; border-right:1px solid black">
										<!--<img src="{$ImagePath}/990PF_paid_preparer.gif" alt="PaidPreparersUseOnly"/> -->Paid Preparer Use Only
										</td><!--class="styIRS990PFLeftBox"height: 24.5mm;-->
										<!-- Print/Type preparer's name -->
										<td style="vertical-align:top;border-style:solid;border-color:black;border-top-width:1px; border-bottom-width: 1px; border-left-width: 0px; 
											border-right-width: 1px;">
											<span class="styIRS990PFSignatureBox" 
												style="float:none;width:42.5mm;border-right-width:0px;border-bottom-width:0px;border-left-width:0px;border-top-width:0px;">
												<span class="styIRS990PFSignatureText" style="width:40mm;padding-top:1mm;padding-left:1mm;">Print/Type preparer's name</span>
												<span class="styGenericDiv" style="width:4mm;height:12mm;padding-top: 6mm">
												</span>
												<span class="styGenericDiv" style="width:32mm;height:12mm;padding-top:6mm;">
													<xsl:call-template name="PopulateReturnHeaderPreparer">
														<xsl:with-param name="TargetNode">Name</xsl:with-param>
													</xsl:call-template>
												</span>
											</span>
										</td>										
										<!-- Preparer signature -->
										<td style="vertical-align:top;border-style:solid;border-color:black;border-top-width:1px; border-bottom-width: 1px; border-left-width: 0px; 	
											border-right-width: 1px;">
											<span class="styIRS990PFSignatureBox" 
												style="width:42.5mm;border-right-width:0px;border-bottom-width:0px;border-left-width:0px;border-top-width:0px;">
												<span class="styIRS990PFSignatureText" style="width:40mm;padding-top:1mm;padding-left:1mm;">Preparer's Signature</span>
												<span class="styGenericDiv" style="width:4mm;height:12mm;padding-top: 6mm">
												</span>
												<span class="styGenericDiv" style="width:32mm;height:12mm;padding-top:6mm;">
													<xsl:call-template name="PopulateReturnHeaderPreparer">														
													</xsl:call-template>
												</span>
											</span>
										</td>
										<!-- Date -->
										<td style="width:21mm;vertical-align:top;padding-left:.5mm;text-align:right;border-style:solid;border-color:black;border-top-width:1px; 
											border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
											<span style="width:21mm;text-align:left;padding-top:2mm">Date</span>
											<span style="width:21mm;height:11mm;padding-top:6mm;text-align:center;">
												<xsl:call-template name="PopulateReturnHeaderPreparer">
													<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
												</xsl:call-template>
											</span>
										</td>
										<!-- Self-employed? -->
										<td style="vertical-align:top;border-top:1px solid black;border-style:solid;border-color:black;border-top-width:1px; border-bottom-width: 1px; 
											border-left-width: 0px; border-right-width: 1px;">
											<span class="styIRS990PFSignatureText" style="width:22mm;height:15mm;padding-left:.5mm;padding-top:4mm;">
												<label for="dummyid1">
													<xsl:call-template name="PopulateReturnHeaderPreparer">
														<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
														<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
													</xsl:call-template>
														Check if self-<br/>employed <img src="{$ImagePath}/990PF_Bullet_Sm.gif" alt="bullet"/>
												</label>
												<input type="checkbox" alt="CheckIfSelfEmployed" class="styIRS990PFCkBox" id="dummyid1">
													<xsl:call-template name="PopulateReturnHeaderPreparer">
														<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
														<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
										</td>
										<!-- SSN/PTIN-->
										<td style="width:20mm;vertical-align:top;padding-left:1mm;border-top:1px solid black;border-style:solid;border-color:black;border-top-width:1px; 
											border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;padding-top:2mm">
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
							<!--row 2-->
							<td rowspan="1" colspan="4" style="border-bottom:1px solid black;border-right:1px solid black;padding-left:.5mm;">Firm's name
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                                <span style="width:3mm"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-left:21mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="border-bottom:1px solid black;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<!--row 3-->
							<td rowspan="1" colspan="4" style="border-bottom:1px solid black;border-right:1px solid black;padding-left:.5mm;">Firm's address
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:3mm"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-left:24mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:24mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:24mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="border-bottom:1px solid black;padding-left:1mm;"> Phone no. 
				<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>									
									
					</table>
					<!-- END Signature section and Preparer section -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm;">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">990-PF</span> (2020)
  </div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
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
					<xsl:choose>
						<xsl:when test="$FormData/ExciseTaxBasedOnInvstIncmGrp/OriginalReturnTaxPaidAmt">
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Part VI Line 7 - Tax Paid with the Original Return</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/OriginalReturnTaxPaidAmt"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$FormData/ExciseTaxBasedOnInvstIncmGrp/OriginalReturnOverpaymentAmt">
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Part VI Line 7 -Original Return Overpayment</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ExciseTaxBasedOnInvstIncmGrp/OriginalReturnOverpaymentAmt"/>
									<xsl:with-param name="DescWidth" select="100"/>
								</xsl:call-template>
						</xsl:when>
					</xsl:choose>	
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
									Special Condition Description
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<xsl:for-each select="$FormData/SpecialConditionDesc">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
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
					<xsl:if test="($Print = $Separated) and (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt; 5)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part IV - Capital Gains and Losses for Tax on Investment Income - Columns a - d</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 113mm" colspan="2">
									    (a) <span class="styNormalText"> List and describe the kind(s) of property sold (e.g., real estate,<br/>2-story brick warehouse; or common 
									    stock, 200 shs. MLC Co.)</span>
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
								<xsl:for-each select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; 
										border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
											<xsl:if test="position()=1">
												<xsl:attribute name="style">width: 9mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px;
													 border-top-width: 0px; border-bottom-width: 1px; padding-left: 3mm;
												</xsl:attribute>1
											</xsl:if>
											<xsl:call-template name="GenerateLetter"/>
										</td>
										<td class="styDepTblCell" style="width: 105mm; text-align: left; border-left-width: 0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 24mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="HowAcquiredCd"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 25mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 25mm; border-right-width:0px; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SoldDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt; 5)">
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
								<xsl:for-each select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
											<xsl:if test="position()=1"/>
											<xsl:call-template name="GenerateLetter"/>
										</td>
										<td class="styDepTblCell" style="width: 39mm; border-left-width: 0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 45mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 45mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 50mm; border-right-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp) &gt; 5)">
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
								<xsl:for-each select="$FormData/CapGainsLossTxInvstIncmDetail/CapGainsLossTxInvstIncmGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm">
											<xsl:if test="position()=1"/>
											<xsl:call-template name="GenerateLetter"/>
										</td>
										<td class="styDepTblCell" style="width: 39mm; border-left-width: 0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FMVAsOf123169Amt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 45mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustedBasisAsOf123169Amt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 45mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExcessFMVOverAdjustedBssAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 50mm; border-right-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainsMinusExcessOrLossesAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/StatementsRegardingActyGrp/OrgReportOrRegisterStateCd) &gt;25)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part VII-A Line 8a</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead"/>
							<tbody>
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align: left; width:80mm"> Enter the states to which the foundation reports or with which it is registered:</td>
									<td class="styDepTblCell" style="text-align: left; width: 104mm">
										<xsl:if test="($Print = $Separated) and (count($FormData/StatementsRegardingActyGrp/OrgReportOrRegisterStateCd) &gt;25)">
											<xsl:for-each select="$FormData/StatementsRegardingActyGrp/OrgReportOrRegisterStateCd">
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
					<xsl:if test="($Print = $Separated) and (count($FormData/OfficerDirTrstKeyEmplInfoGrp/OfficerDirTrstKeyEmplGrp) &gt;4)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part VIII Line 1 - List all officers, directors, trustees, foundation managers and their
						 compensation
						</span>
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
								<xsl:for-each select="$FormData/OfficerDirTrstKeyEmplInfoGrp/OfficerDirTrstKeyEmplGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1
												</xsl:when>
													<xsl:otherwise>styDepTblRow2
													</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align: left; width: 53mm; border-left-width: 0px; font-size: 6pt">
											<xsl:choose>
												<xsl:when test="PersonNm != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
													<span style="width: 2mm"/>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
														<xsl:with-param name="TabOrder" select="2"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
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
												<xsl:with-param name="TargetNode" select="TitleTxt"/>
											</xsl:call-template>
											<xsl:if test="AverageHrsPerWkDevotedToPosRt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AverageHrsPerWkDevotedToPosRt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styDepTblCell" rowspan="2" style="width: 31mm; text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CompensationAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" rowspan="2" style="width: 31mm; text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EmployeeBenefitProgramAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" rowspan="2" style="border-right-width:0px; width: 31mm; text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenseAccountOtherAllwncAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1
												</xsl:when>
													<xsl:otherwise>styDepTblRow2
													</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
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
					<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformationGrp/ContributingManagerNm) &gt;1)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XV Line 1a - List any managers of the foundation who have contributed more than 2% 
							of the total contributions received by the foundation before the close of any tax year (but only if they have contributed more than $5,000).
						</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead"/>
							<tbody>
								<xsl:for-each select="$FormData/SupplementaryInformationGrp/ContributingManagerNm">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
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
					<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformationGrp/ShareholderManagerNm) &gt;1)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XV Line 1b - List any managers of the foundation who own 10% or more of the stock 
						of a corporation (or an equally large portion of the ownership of a partnership or other entity) of which the foundation has a 10% or greater 
						interest.</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead"/>
							<tbody>
								<xsl:for-each select="$FormData/SupplementaryInformationGrp/ShareholderManagerNm">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
											</xsl:attribute>
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
					<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp) &gt;1)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XV Line 2a - 2d - Information Regarding Contribution, Grant, Gift, Loan, Scholarship, 
							etc., Programs:</span>
						<xsl:for-each select="$FormData/SupplementaryInformationGrp/ApplicationSubmissionInfoGrp">
							<table class="styDepTbl" style="font-size: 7pt">
								<thead class="styTableThead"/>
								<tbody>
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 
											187mm">
											<span class="styBoldText" style="padding-left:2mm">a</span>
											<span style="width: 2mm"/>The name, address, and telephone number of the person to whom applications should be addressed:
										</td>
									</tr>
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/></xsl:attribute>
										<td class="styDepTblCell" style="border-top-width: 0px; text-align: left; width: 187mm; padding-left: 6mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecipientPersonNm"/>
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
											<xsl:if test="count(RecipientPhoneNum) &gt;0">
												<br/>
												<xsl:call-template name="PopulatePhoneNumber">
													<xsl:with-param name="TargetNode" select="RecipientPhoneNum"/>
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
											<span style="width: 2mm"/>The form in which applications should be submitted and information and materials they should 
												include:</td>
									</tr>
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/></xsl:attribute>
										<td class="styDepTblCell" style="border-top-width: 0px; text-align: left; width: 187mm; padding-left: 6mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FormAndInfoAndMaterialsTxt"/>
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
												<xsl:with-param name="TargetNode" select=" SubmissionDeadlinesTxt"/>
											</xsl:call-template>
										</td>
									</tr>
									<!--  Line 2c  -->
									<!--  Line 2d  -->
									<tr>
										<xsl:attribute name="style">background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/></xsl:attribute>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 187mm">
											<span class="styBoldText" style="padding-left:2mm">d</span>
											<span style="width: 2mm"/>Any restrictions or limitations on awards, such as by geographical areas, charitable fields, kinds of 
												institutions, or other
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
												<xsl:with-param name="TargetNode" select=" RestrictionsOnAwardsTxt"/>
											</xsl:call-template>
										</td>
									</tr>
									<!--  Line 2d  -->
								</tbody>
							</table>
						</xsl:for-each>
						<br/>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp) &gt;4)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990PF Part XV Line 3 - Grants and Contributions Paid During the Year or Approved for Future 	
							Payment</span>
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
								<xsl:for-each select="$FormData/SupplementaryInformationGrp/GrantOrContributionPdDurYrGrp">
									<tr style="border-bottom-width: 0px">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 55mm">
											<xsl:if test="count(RecipientPersonNm) &gt;0">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientPersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientBusinessName/BusinessNameLine1Txt) &gt;0">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientBusinessName/BusinessNameLine2Txt) &gt;0">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2Txt"/>
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
												<xsl:with-param name="TargetNode" select="RecipientRelationshipTxt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 20mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecipientFoundationStatusTxt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 45mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="GrantOrContributionPurposeTxt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align: right; width: 32mm; border-right-width: 0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td class="styDepTblCell" style="text-align: left; width: 155mm; padding-left: 4mm" colspan="4">
										<span class="styBoldText">Total <span class="styDotLn" style="float:none; clear:none">...............................</span>
											<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
											<span style="width: 1.5mm"/> 3a</span>
									</td>
									<td class="styDepTblCell" style="width: 32mm; border-right-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/TotalGrantOrContriPdDurYrAmt"/>
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
								<xsl:for-each select="$FormData/SupplementaryInformationGrp/GrantOrContriApprvForFutGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;  width: 55mm">
											<xsl:if test="count(RecipientPersonNm) &gt;0">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientPersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientBusinessName/BusinessNameLine1Txt) &gt;0">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="count(RecipientBusinessName/BusinessNameLine2Txt) &gt;0">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2Txt"/>
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
												<xsl:with-param name="TargetNode" select="RecipientRelationshipTxt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 20mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecipientFoundationStatusTxt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 40mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="GrantOrContributionPurposeTxt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 32mm; border-right-width: 0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td class="styDepTblCell" style="text-align: left; width: 155mm;padding-left: 4mm" colspan="4">
										<span class="styBoldText">Total <span class="styDotLn" style="float:none; clear:none">................................</span>
											<img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/>
											<span style="width: 1.5mm"/> 3b</span>
									</td>
									<td class="styDepTblCell" style="width: 32mm; border-right-width: 0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformationGrp/TotalGrantOrContriApprvFutAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/AnalysisIncomeProducingActyGrp/ProgramServiceRevPartVIIGrp) &gt;6)">
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
								<xsl:for-each select="$FormData/AnalysisIncomeProducingActyGrp/ProgramServiceRevPartVIIGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 71mm">
											<span class="styBoldText">
												<xsl:call-template name="GenerateLetter3"/>
											</span>
											<span style="width: 1mm"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 20mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessCd"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnrelatedBusinessTaxblIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExclusionCd"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExclusionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncmAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp) &gt;5)">
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
								<xsl:for-each select="$FormData/AnalysisIncomeProducingActyGrp/OtherRevenueDescribedGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 71mm">
											<span class="styBoldText">
												<xsl:number value="position()" format="a"/>
											</span>
											<span style="width: 1mm"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 20mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessCd"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnrelatedBusinessTaxblIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm; text-align: center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExclusionCd"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExclusionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size: 6pt; width: 25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncmAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!--  Part XVI-B  -->
					<xsl:if test="($Print = $Separated) and (count($FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp) &gt;24)">
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
								<xsl:for-each select="$FormData/RlnOfActyToAccomOfExmptPrpsGrp/RlnOfActyToAccomOfExmptPrpsGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 15mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNumberTxt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:left; border-right-width: 0px; width: 173mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelationshipStatementTxt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail) &gt;16)">
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
								<xsl:for-each select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 15mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNumberTxt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width: 32mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InvolvedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:left; width: 55mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NoncharitableExemptOrgName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="NoncharitableExemptOrgName/BusinessNameLine2Txt !=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NoncharitableExemptOrgName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="text-align:left; width: 85mm; border-right-width: 0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransfersTransAndShrArrngmDesc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/TrnsfrTransRlnNonchrtblEOGrp/TransferScheduleDetail) &gt;6)">
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
								<xsl:for-each select="$FormData/TrnsfrTransRlnNonchrtblEOGrp/RelationshipScheduleDetail">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left; width: 70mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OrganizationBusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="OrganizationBusinessName/BusinessNameLine2Txt !=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OrganizationBusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="text-align:left; width: 47mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OrganizationTypeDesc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:left; width: 70mm; border-right-width: 0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelationshipDescriptionTxt"/>
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