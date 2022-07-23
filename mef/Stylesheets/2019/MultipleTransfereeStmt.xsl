<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/MultipleTransfereeStmt"/>
  
  <xsl:template name="DependencyTemplate">
	<xsl:for-each select="$DependencyData/Net965TaxLiabTransferGrp">
		<div class="styTopSectionLine" style="font-weight:bold;text-align:center;margin-top:3mm;">
			Net 965 Tax Liability Transfer Group <xsl:value-of select="position()"/>
		</div>
		<div class="styTopSectionLine" style="width:187mm;display:block;">
			<div class="styTopSectionLineLbl" style="float:left">
				<b>Election or Transfer Year: </b>
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateYear">
					<xsl:with-param name="TargetNode" select="ElectionTransferYr"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine" style="width:187mm;display:block;">
			<div class="styTopSectionLineLbl" style="float:left">
				<b>S Corporation EIN: </b>
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateEIN">
					<xsl:with-param name="TargetNode" select="SCorporationEIN"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine" style="width:187mm;display:block;">
			<div class="styTopSectionLineLbl" style="float:left">
				<b>Deferred Net Tax Liability Transferred Amount: </b>
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="DeferredNetTaxLiabTrnsfrAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<table id="MTSTbl" class="styDepTbl" style="margin-bottom:2mm;clear:both;">
		  <thead class="styDepTableThead">
			<tr class="styDepTblHdr">
			   <!--th class="styDepTblCell" scope="col">Item No.</th-->
			   <th class="styDepTblCell" scope="col">Transferee TIN</th>
			   <th class="styDepTblCell" scope="col">Transferred Amount</th>
			</tr>
		  </thead>
		  <tfoot/>
		  <tbody>
			<xsl:for-each select="TaxLiabilityTransfereeGrp">
			  <tr>
				<xsl:attribute name="class">
				  <xsl:choose>
					 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
					 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
				  </xsl:choose>
				</xsl:attribute>
				<!--td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()" /></td-->        
				<td class="styDepTblCell" style="text-align:center;">
					<xsl:choose>
						<xsl:when test="SSN">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="SSN"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="EIN"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="styDepTblCell" style="text-align:right;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="TransferredAmt"/>
				  </xsl:call-template>
				</td>
			  </tr>
			</xsl:for-each>
		  </tbody>
		</table>
		<br /><br />
    </xsl:for-each>
  </xsl:template>
  
  
  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">

    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
           <title><xsl:value-of select="$depDocTitle"/></title>
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
            <span><xsl:value-of select="$depDocTitle"/></span>            
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"/>
        <xsl:call-template name="DependencyTemplate">
        </xsl:call-template>  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>