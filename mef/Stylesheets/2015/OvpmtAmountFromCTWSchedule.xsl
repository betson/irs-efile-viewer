<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/OvpmtAmountFromCTWSchedule"/>
	<!-- 1120F Display name is Overpayment Amount From Chapter Three Withholding Schedule -->
	<!-- Main template begin -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template end-->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:value-of select="$depDocTitle"/>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
        </style>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<span style="width:162mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Total Payments. Enter The Amount From Form 1120-F, Page 1, Line 5i:</span>
					</div>
					<div class="styDepGenericDiv" style="clear:right;text-align:right;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/Totalpayments"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Enter the Tax Amount From Form 1120-F, Page 1, Line 1:</span>
					</div>
					<div class="styDepGenericDiv" style="clear:right;text-align:right;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/TaxAmountLine1"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Enter the Portion of the Tax Amount Shown on Form 1120-F, Page 1, Line 2 Pertaining to Income Associated with Amounts Deducted and Withheld Under Sections 1445 and 1446 (see general guidelines provided below):</span>
					</div>
					<div class="styDepGenericDiv" style="clear:right;text-align:right;">
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/TaxAmountFromCTW"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Total Tax. Combine Lines 2<br/>and 3:</span>
					</div>
					<div style="float:left;clear:none;">
					<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/TotalTax"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Tentative Overpayment Resulting From Tax Deducted and Withheld Under Chapter 3.  Subtract Line 4 From Line 1:</span>
					</div>
					<div class="styDepGenericDiv" style="clear:right;text-align:right;">
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/TentativeOverpaymentAMTCTW"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Enter the Amount From Form 1120-F, Page 1, Line 8a:</span>
					</div>
					<div class="styDepGenericDiv" style="clear:right;text-align:right;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/OverpaymentAmount"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Overpayment Resulting From Tax Deducted and Withheld Under Chapter 3. Enter the Smaller of Line 5 or line 6. Enter the Result Here and on Form 1120-F, Page 1, Line 8b:</span>
					</div>
					<div class="styDepGenericDiv" style="clear:right;text-align:right;">
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/OverpaymentAmountFromCTW"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Tax on ECI Per the Tax Return.  Enter the Amount From Form 1120-F, Page 1, Line 2:</span>
					</div>
					<div class="styDepGenericDiv" style="clear:right;text-align:right;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/TaxOnECI"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Refigure the Taxable Income on Form 1120-F, Section II, Line 31, by Excluding From Section II,<br/> Line 8 any Amount From the Disposition of a U.S. Real<br/>Property Interest Necessary to Properly Compute the Overpayment Described in Section 6611(e)(4), and by Excluding From Section II, Line<br/>10 any Partnership ECTI<br/>Allocable to the Corporation<br/>Under the Rules of Regulations Section 1.1446-2 Necessary to Properly Reflect the<br/>Overpayment Described in Section 6611(e)(4) (Attach Explanation of Amounts Excluded):</span>
					</div>
					<div class="styDepGenericDiv" style="clear:right;text-align:right;">
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/TaxOnCTWIncome"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">
          Refigured Tax on ECI. Using the Refigured Taxable Income From Line b, Refigure the Tax for Schedule II of Form 1120-F on Schedule J and Enter the Refigured Tax From Schedule J, Line 9 Here:</span>
					</div>
					<div class="styDepGenericDiv" style="clear:right;text-align:right;">
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/RefiguredTaxOnECI"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Subtract Line c From Line a. Enter the Result Here and on Line 3 Above:</span>
					</div>
					<div class="styDepGenericDiv" style="clear:right;text-align:right;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/CalculatedTaxAmountFromCTW"/>
						</xsl:call-template>
					</div>
				</div>
				<br/>
				<!--table begin -->
				<table id="GeneralDeductionsTbl" class="styDepTbl">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width: 37mm;vertical-align:middle;">
           		Chapter Three Withholding Excludable Amounts Info
           		</th>
							<th class="styDepTblCell" scope="col" style="width: 150mm;vertical-align:middle;">
           		Explanation of Excludable Amounts From Chapter Three Withholding Computation
           		</th>
						</tr>
					</thead>
					<xsl:for-each select="$DependencyData/CTWExcludableAmountsInfo">
						<tr>
							<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<td class="styDepTblCell" style="width: 37mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ExcludableAmounts"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="width: 150mm;text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ExplanationExcludableAmounts"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
