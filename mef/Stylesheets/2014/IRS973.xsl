<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS973Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form973Data" select="$RtnDoc/IRS973"/>
	<xsl:variable name="StockInformationSize" select="count($Form973Data/StockInformation)"/>
	<xsl:variable name="RowsToShow" select="9"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form973Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 973"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS973Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form973">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styTBB" style="width:187mm;height: 26mm">
						<div class="styFNBox" style="height: 26.5mm; width:33mm;font-size: 7pt; padding-top:2mm">
      Form <span class="styFormNumber">973</span>
							<br/>
							<br/>
							<span class="styAgency">(Rev. December 2003)</span>
							<span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form973Data"/>
								</xsl:call-template>
							</span>
							<br/>
							<br/>
							<div style="line-height:100%">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:123mm; height: 26mm">
							<div class="styFMT" style="line-height:100%;height:12mm;font-size: 12pt; font-weight: bold; padding-top: 2mm;">
								<div class="styMainTitle">Corporation Claim for Deduction<br/>for Consent Dividends<br/>
								</div>
								<span style="font-size:8pt;padding-top: 2mm;">(Under Section 561 of the Internal Revenue Code)</span>
								<br/>
								<br/>
								<span style="font-size:7pt">
          
For tax year beginning 
							<span style="width:20mm;border-bottom:1 solid black; font-weight: normal">
										<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
									</span>
								, and ending 
    <span style="width:20mm;border-bottom:1 solid black; font-weight: normal">
										<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
									</span>.
          
          
        
        </span>
							</div>
						</div>
						<div class="styTYBox" style="width:31mm; height: 26.5mm">
							<div style="padding-top:10mm; font-size:7pt">OMB No. 1545-0044</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!-- BEGIN NAME OF CORPORATION AND EIN LINE -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:135mm;font-size:7pt;font-weight:normal;">
    Name of corporation
    <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br style="height:1mm;"/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:50mm;font-weight:bold;padding-left:2mm;">
    Employer identification number<br/>
							<br/>
							<span style="width:50mm;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--END NAME OF CORPORATION AND EIN LINE -->
					<!-- BEGIN TABLE FOR StockInformation -->
					<!-- BEGIN Table expand/collapse toggle button end -->
					<!-- Test for size of StockInformation collection, don't display table expand / colapse toggle button if not needed -->
					<xsl:if test="$StockInformationSize &gt; $RowsToShow">
						<div class="styBB" style="width:187mm;border-top-width:0px">
							<!-- Table expand/collapse toggle button-->
							<span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form973Data/StockInformation"/>
									<xsl:with-param name="containerHeight" select="$RowsToShow"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'SIctn' "/>
								</xsl:call-template>
							</span>
						</div>
					</xsl:if>
					<!-- END Table expand/collapse toggle button end-->
					<div class="styIRS973TableContainer" style="height:72mm;" id="SIctn">
						<xsl:call-template name="SetInitialState"/>
						<table cellspacing="0" class="styTable" cellpadding="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCell" scope="col" style="width:32mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
									Class of stock
									</th>
									<th class="styTableCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Number of shares<br/>
outstanding on first<br/> day of tax year</th>
									<th class="styTableCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Number of shares<br/>
outstanding on last<br/> day of tax year</th>
									<th class="styTableCell" scope="col" style="width:39mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
        Description of dividend rights
      </th>
									<th class="styTableCell" scope="col" style="width:36mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
        Actual distributions per<br/>share made in tax year<sup>*</sup>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form973Data/StockInformation) &lt;= 9) ">
									<xsl:for-each select="$Form973Data/StockInformation">
										<xsl:call-template name="StockInformationTemp"/>
									</xsl:for-each>
									<!-- Render out the rest of the empty rows if less than $RowsToShow data items present for consistency with PDF display. -->
									<xsl:call-template name="EmptyIteratorTemp">
										<xsl:with-param name="NumEmptyRows" select="$RowsToShow - $StockInformationSize"/>
										<xsl:with-param name="TempToCall" select="'StockInformationTemp'"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and (count($Form973Data/StockInformation) &gt; 9) ">
									<xsl:call-template name="EmptyIteratorTemp">
										<xsl:with-param name="NumEmptyRows" select="9"/>
										<xsl:with-param name="TempToCall" select="'StockInformationTemp'"/>
										<xsl:with-param name="IsSeparated" select="'yes' "/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form973Data/StockInformation"/>
						<xsl:with-param name="containerHeight" select="$RowsToShow"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'SIctn' "/>
					</xsl:call-template>
					<!-- END TABLE FOR StockInformation -->
					<!-- BEGIN DescribeUnequalTreatment -->
					<div style="width:187mm;">
						<div class="styLNDesc" style="width:187mm;font-size:8pt;padding-left:5mm;">
							<sup>*</sup>If a distribution was not made on all shares of any class, describe any unequal treatment:</div>
						<div style="width:187mm;"/>
						<xsl:choose>
							<xsl:when test="not($Form973Data/DescribeUnequalTreatmentTxt) or $Form973Data/DescribeUnequalTreatmentTxt = ''">
								<xsl:call-template name="EmptyIteratorTemp">
									<xsl:with-param name="NumEmptyRows" select="3"/>
									<xsl:with-param name="TempToCall" select="'EmptyExplanationLine'"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="((count($Form973Data/DescribeUnequalTreatmentTxt) &gt; 1) and ($Print = $Separated))">
								<xsl:call-template name="EmptyIteratorTemp">
									<xsl:with-param name="NumEmptyRows" select="3"/>
									<xsl:with-param name="IsSeparated" select="'yes'"/>
									<xsl:with-param name="TempToCall" select="'EmptyExplanationLine'"/>
									<xsl:with-param name="CalledTemplate" select="$Form973Data/DescribeUnequalTreatmentTxt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="$Form973Data/DescribeUnequalTreatmentTxt">
									<div class="styBB" style="width:187mm;text-align:left;float:none;clear:both;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</div>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
						<div class="styTBB" style="width:187mm;"/>
					</div>
					<!-- END DescribeUnequalTreatment -->
					<!-- BEGIN DescribeChangesInOutstdStock -->
					<div style="width:187mm;">
						<div class="styLNDesc" style="width:187mm;font-size:8pt;padding-left:5mm;padding-top:5mm;">Describe any other changes in outstanding stock during the tax year:</div>
						<div style="width:187mm;"/>
						<xsl:choose>
							<xsl:when test="not($Form973Data/DescribeChangesInOutstdStkTxt) or $Form973Data/DescribeChangesInOutstdStkTxt = ''">
								<xsl:call-template name="EmptyIteratorTemp">
									<xsl:with-param name="NumEmptyRows" select="9"/>
									<xsl:with-param name="TempToCall" select="'EmptyExplanationLine'"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="((count($Form973Data/DescribeChangesInOutstdStkTxt) &gt; 1) and ($Print = $Separated))">
								<xsl:call-template name="EmptyIteratorTemp">
									<xsl:with-param name="NumEmptyRows" select="9"/>
									<xsl:with-param name="IsSeparated" select="'yes'"/>
									<xsl:with-param name="TempToCall" select="'EmptyExplanationLine'"/>
									<xsl:with-param name="CalledTemplate" select="$Form973Data/DescribeChangesInOutstdStkTxt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="$Form973Data/DescribeChangesInOutstdStkTxt">
									<div class="styBB" style="width:187mm;text-align:left;float:none;clear:both;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</div>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
						<div class="styTBB" style="width:187mm;text-align:center;">(Use more sheets if necessary.)</div>
						<!-- Page Footer -->
<div style="width:187mm;clear:both;border-top:1px solid black;">
  <div style="width:100mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see back of form.</div>
  <div style="width:45mm;text-align:center;" class="styGenericDiv">Cat. No. 17059P</div>
  <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">973</span> (Rev. 12-2003)</div>
</div>						
						
						
						
						
				</div>
					<!-- ENDDescribeChangesInOutstdStock -->
					<!-- BEGIN StockEntitledToCumulativeDiv -->
					<div style="width:187mm;">
						<!-- Page 2 heading -->
						<div style="width:187mm;border-bottom:solid black 2px;padding-top:2mm;">
							<span style="float:left;">Form 973 (Rev. 12-2003)</span>
							<span style="float:right;">Page <b>2</b>
							</span>
						</div>
						<!-- End Page 2 heading -->
						<div class="styLNDesc" style="width:187mm;font-size:8pt;padding-left:5mm;clear:both;float:none;">If any stock outstanding on the last day of the tax year is entitled to cumulative dividends, show the amount for earlier years unpaid at the beginning of the tax year. Give the class or classes of stock involved.</div>
						<div style="width:187mm;clear:both;float:none;"/>
						<xsl:choose>
							<xsl:when test="not($Form973Data/StockEntitledToCumDivTxt) or $Form973Data/StockEntitledToCumDivTxt = ''">
								<xsl:call-template name="EmptyIteratorTemp">
									<xsl:with-param name="NumEmptyRows" select="10"/>
									<xsl:with-param name="TempToCall" select="'EmptyExplanationLine'"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="((count($Form973Data/StockEntitledToCumDivTxt) &gt; 1) and ($Print = $Separated))">
								<xsl:call-template name="EmptyIteratorTemp">
									<xsl:with-param name="NumEmptyRows" select="10"/>
									<xsl:with-param name="IsSeparated" select="'yes'"/>
									<xsl:with-param name="TempToCall" select="'EmptyExplanationLine'"/>
									<xsl:with-param name="CalledTemplate" select="$Form973Data/StockEntitledToCumDivTxt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="$Form973Data/StockEntitledToCumDivTxt">
									<div class="styBB" style="width:187mm;text-align:left;float:none;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</div>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
						<div class="styTBB" style="width:187mm;text-align:center;clear:both;float:none;">(Use more sheets if necessary.)</div>
					</div>
					<!-- END StockEntitledToCumulativeDiv -->
					<!-- Recycle Image -->
					<div align="center" style="width:187mm;padding-top:1mm;clear:both;"/>
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
							<xsl:with-param name="TargetNode" select="$Form973Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Begin Separated Repeating Data table -->
					<!-- Begin SRD for first part -->
					<xsl:if test="($Print = $Separated) and (count($Form973Data/StockInformation) &gt; 9)">
						<span class="styRepeatingDataTitle">Form 973 - Stock Information:</span>
						<table cellspacing="0" class="styDepTbl" cellpadding="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Class of stock</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Number of shares<br/>
      outstanding on first<br/> day of tax year</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Number of shares<br/>
      outstanding on last<br/> day of tax year</th>
									<th class="styDepTblCell" scope="col" style="width:39mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
              Description of dividend rights
            </th>
									<th class="styDepTblCell" scope="col" style="width:36mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
              Actual distributions per<br/>share made in tax year<sup>*</sup>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form973Data/StockInformation">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="font-size:7pt;font-weight:normal;border-color:black;                 text-align:left;height:7mm;width:32mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StockClassDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="font-size:7pt;border-color:black;width:40mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SharesOnFirstDayCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="font-size:7pt;border-style:solid;border-color:black;width:40mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SharesOnLastDayCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:39mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DescriptionOfDividendRightsTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:36mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ActualDistributionsPerShareAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End SRD for first part -->
					<!--Begin SRD for the unequal treatment -->
					<xsl:if test="($Print = $Separated) and (count($Form973Data/DescribeUnequalTreatmentTxt) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 973 - If a distribution was not made on all shares of any class, describe any unequal treatment:</span>
						<table cellspacing="0" class="styDepTbl" cellpadding="0" style="font-size:7pt;">
							<thead class="styTableThead">  
        </thead>
							<tbody>
								<xsl:for-each select="$Form973Data/DescribeUnequalTreatmentTxt">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;height:7mm;width:187mm;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End SRD for Unequal treatment -->
					<!--Begin SRD for the outstanding stock treatment -->
					<xsl:if test="($Print = $Separated) and (count($Form973Data/DescribeChangesInOutstdStkTxt) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 973 - Describe any other changes in outstanding stock during the tax year:</span>
						<table cellspacing="0" class="styDepTbl" cellpadding="0" style="font-size:7pt;">
							<thead class="styTableThead">  
        </thead>
							<tbody>
								<xsl:for-each select="$Form973Data/DescribeChangesInOutstdStkTxt">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;height:7mm;width:187mm;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End SRD for outstanding stock -->
					<!--Begin SRD for the cumulative dividends -->
					<xsl:if test="($Print = $Separated) and (count($Form973Data/StockEntitledToCumDivTxt) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 973 - If any stock outstanding on the last day of the tax year is entitled to cumulative dividends, show the amount for earlier years unpaid at the beginning of the tax year. Give the class or classes of stock involved:</span>
						<table cellspacing="0" class="styDepTbl" cellpadding="0" style="font-size:7pt;">
							<thead class="styTableThead">  
        </thead>
							<tbody>
								<xsl:for-each select="$Form973Data/StockEntitledToCumDivTxt">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;height:7mm;width:187mm;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End SRD for cumulative dividends -->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="StockInformationTemp">
		<xsl:param name="IsSeparated">no</xsl:param>
		<!-- 
    Data element names in StockInformation element
    ClassOfStock
    NumberOfSharesOnFirstDay
    NumberOfSharesOnLastDay
    DescriptionOfDividendRights
    ActualDistributionsPerShare-
    -->
		<tr>
			<td class="styTableCell" style="font-size:7pt;font-weight:normal;border-color:black;text-align:left;height:7mm;width:32mm;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="StockClassDesc"/>
				</xsl:call-template>
				<xsl:if test="$IsSeparated = 'yes' ">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$Form973Data/StockInformation"/>
						<xsl:with-param name="ShortMessage" select="'true'"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<td class="styTableCell" style="font-size:7pt;border-color:black;width:40mm;text-align:right;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="SharesOnFirstDayCnt"/>
				</xsl:call-template>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCell" style="font-size:7pt;border-style:solid;border-color:black;width:40mm;text-align:right;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="SharesOnLastDayCnt"/>
				</xsl:call-template>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:39mm;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="DescriptionOfDividendRightsTxt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:36mm;text-align:center;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="ActualDistributionsPerShareAmt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="EmptyExplanationLine">
		<xsl:param name="IsSeparated">no</xsl:param>
		<xsl:param name="CalledTemplate">no</xsl:param>
		<div class="styBB" style="width:187mm;height:7mm;">
			<xsl:if test="$IsSeparated = 'yes' ">
				<xsl:call-template name="PopulateAdditionalDataTableMessage">
					<xsl:with-param name="TargetNode" select="$CalledTemplate"/>
				</xsl:call-template>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- The param CalledTemplate is used to differentiate different elements for the additional data table as the different elements call the same template -->
	<xsl:template name="EmptyIteratorTemp">
		<xsl:param name="NumEmptyRows"/>
		<xsl:param name="TempToCall"/>
		<xsl:param name="CalledTemplate" select="$Form973Data"/>
		<xsl:param name="IsSeparated">no</xsl:param>
		<xsl:if test="$IsSeparated = 'no' ">
			<xsl:if test="$NumEmptyRows &gt; 0">
				<xsl:choose>
					<xsl:when test="$TempToCall = 'StockInformationTemp'">
						<xsl:call-template name="StockInformationTemp"/>
					</xsl:when>
					<xsl:when test="$TempToCall = 'EmptyExplanationLine'">
						<xsl:call-template name="EmptyExplanationLine"/>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
				<xsl:call-template name="EmptyIteratorTemp">
					<xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
					<xsl:with-param name="TempToCall" select="$TempToCall"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$IsSeparated = 'yes' ">
			<xsl:choose>
				<xsl:when test="$TempToCall = 'StockInformationTemp'">
					<xsl:call-template name="StockInformationTemp">
						<xsl:with-param name="IsSeparated">yes</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$TempToCall = 'EmptyExplanationLine'">
					<xsl:call-template name="EmptyExplanationLine">
						<xsl:with-param name="IsSeparated">yes</xsl:with-param>
						<xsl:with-param name="CalledTemplate" select="$CalledTemplate"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<xsl:call-template name="EmptyIteratorTemp">
				<xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
				<xsl:with-param name="TempToCall" select="$TempToCall"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
