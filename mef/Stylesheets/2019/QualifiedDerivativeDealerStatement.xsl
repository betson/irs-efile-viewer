<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<!--  **************************************************************************************  -->
	<!-- -              Form 1120F Displays as - Qualified Derivative Dealer Statement        -->
    <!--  **************************************************************************************  -->                       
		  <xsl:param name="DependencyData" select="$RtnDoc/QualifiedDerivativeDealerStmt"/>
		<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="DependencyTemplate">
	<xsl:for-each select="$DependencyData/QDDDetailGrp">
	<xsl:variable name="pos" select="position()"/>
	<!--	<table id="OPFPTbl" class="styDepTblLandscape" style="margin-top:4mm;">-->
	 <table id="DataTbl" class="styDepTbl" style="border:none;">
				<thead class="styTableThead">
                <div class="styFST" style="height:3.5mm;font-size:10pt;padding-left:38mm;border:0px;" >Name of QDD:
                <span style="padding-left:2mm;font-weight:normal">
                <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/BusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template></span>
              						<br/><span style="padding-left:31mm;font-weight:normal">
							 <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/BusinessName/BusinessNameLine2Txt"/>
							</xsl:call-template></span>
			             </div><br/><br/>
                <div class="styFST" style="height:3.5mm;font-size:10pt;padding-left:50mm;border:0px;padding-top:2mm" >QI-EIN:
                <span style="padding-left:2mm;font-weight:normal">
                <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/QualifiedIntermediaryEIN"/>
								</xsl:call-template></span>
                </div><br/>
               	 <div class="styFST" style="height:3.5mm;font-size:10pt;padding-left:24mm;border:0px;padding-top:4mm" >Tax Period End Date:
               	      <span style="padding-left:2mm;font-weight:normal">
               	 <xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TaxPeriodEndDt"/>
				</xsl:call-template></span>
               	 </div>
               	 <br/><br/><br/>	
				<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" nowrap="nowrap"  style="width:90mm;"></th>
					<th class="styDepTblCell" scope="col" nowrap="nowrap"  style="width:39mm;">The Gross Amount</th>
					<th class="styDepTblCell" scope="col" nowrap="nowrap"  style="width:39mm;">The Rate of Tax</th>
					<th class="styDepTblCell" scope="col" nowrap="nowrap"  style="width:39mm;">The Amount of Tax Liability</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
					<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 1 = 2">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" align="left" valign="top" style="width:90mm;">Total section 871(m) amount, purposes, only include the amount of the tax liability
						</td>
						<td class="styDepTblCell" align="right" valign="top" style="width:39mm;">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotalSection871mAmountGrp/GrossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;witth:39mm">
							<!--<xsl:call-template name="PopulateText">-->
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotalSection871mAmountGrp/TaxRt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" align="right" valign="top" style="width:39mm;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotalSection871mAmountGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
					</tr>
						<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 1 = 2">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" align="left" valign="top" style="width:90mm;">Total dividends received in its equity derivatives dealer capacity
						</td>
						<td class="styDepTblCell" align="right" valign="top" style="width:39mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotDivRcvdEqtyDerivativeDlrGrp/GrossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;witth:39mm">
						<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotDivRcvdEqtyDerivativeDlrGrp/TaxRt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" align="right" valign="top" style="width:39mm;" >
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotDivRcvdEqtyDerivativeDlrGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 1 = 2">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styDepTblCell" align="left" valign="top" style="width:90mm;">Total QDD tax liability pursuant to section 3.09(A) of the Qualified Intermediary Agreement
						</td>
						<td class="styDepTblCell" align="right" valign="top" style="width:39mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotTxLiabSect309AQIAgrmtGrp/GrossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;witth:39mm">
						<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotTxLiabSect309AQIAgrmtGrp/TaxRt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" align="right" valign="top" style="width:39mm;" >
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotTxLiabSect309AQIAgrmtGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
					</tr>
						<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 1 = 2">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" align="left" valign="top" style="width:90mm;">Total QDD tax liability pursuant to section 3.09(B) of the Qualified Intermediary Agreement
						</td>
					<td class="styDepTblCell" align="right" valign="top" style="width:39mm;" >
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotTxLiabSect309BQIAgrmtGrp/GrossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;witth:39mm">
						<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotTxLiabSect309BQIAgrmtGrp/TaxRt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" align="right" valign="top" style="width:39mm;" >
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotTxLiabSect309BQIAgrmtGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 1 = 2">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>	
			<td class="styDepTblCell" align="left" valign="top" style="width:90mm;">Total QDD tax liability pursuant to section 3.09(C) of the Qualified Intermediary Agreement
						</td>
							<td class="styDepTblCell" align="right" valign="top" style="width:39mm;" >
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotTxLiabSect309CQIAgrmtGrp/GrossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;witth:39mm">
						<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotTxLiabSect309CQIAgrmtGrp/TaxRt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" align="right" valign="top" style="width:39mm;" >
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/TotTxLiabSect309CQIAgrmtGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
					</tr>
			</tbody>
		</table>
		   <table id="DataTbl" class="styDepTbl" style="border:none;">
        <tr>
         <td class="styDepTblCell" style="border:none;padding-right:131mm;padding-bottom:0mm;padding-left:0mm">   
            <div class="styTopSectionLineLbl"><b>Explanation:</b></div>       
          </td> 
          </tr>
          <tr>          
          <td class="styDepTblCell" style="text-align:left;border:none;padding-bottom:0mm">   
                    <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$DependencyData/QDDDetailGrp[$pos]/ExplanationTxt"/>
			</xsl:call-template>             
          </td>                      
        </tr>
            </table><br/><br/>
            </xsl:for-each>
		</xsl:template>
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
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			 <body class="styBodyClass" style="width:187mm;">    
        <xsl:call-template name="DocumentHeaderDependency"/> 
         <!--<body class="styBodyClass" style="width:256mm;">
				<xsl:call-template name="DocumentHeaderDependencyLandscape"/>-->
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="padding-right:2mm;">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="DependencyTemplate"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
