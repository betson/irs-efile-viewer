<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/QBIPTEAggregationElectionBStmt"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>

  <!-- Template to display table items -->
  
  <xsl:template name="ShowDependencyData">
  
    <!-- Itemized Other Income Schedule Data -->
    <table id="DependencyDataTbl" class="styDepTbl">
      <thead class="styTableThead">
      <tr class="styDepTblHdr">         
         <th class="styDepTblCell" scope="col">Trade Or Business Aggregation Description</th>         
         <th class="styDepTblCell" scope="col">Prior Year Change Description</th> 
      </tr>
      </thead>
        <tfoot/>
        
       <tbody>
      <xsl:for-each select="$DependencyData/QBIPTEAggregationElectionGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
                              
       <td class="styDepTblCell" style="text-align:left;width:90mm;">      		
 			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$DependencyData/QBIPTEAggregationElectionGrp/TradeOrBusinessAggregationDesc"/>
			</xsl:call-template><br />
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$DependencyData/QBIPTEAggregationElectionGrp/TradeOrBusinessAggregationDesc"/>
			</xsl:call-template> 
		</td>       
         <td class="styDepTblCell" style="text-align:right; width:90mm;">      		
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="PriorYearChangeDesc"/>
          </xsl:call-template> 
    	</td> 
    </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
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
          <span class="styDepTitle" style="width:160mm;">
            <span><xsl:value-of select="$depDocTitle"/></span>
          </span>
        </div>
 
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>

        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Name:</div>
          <div style="float:left;clear:none;width:118mm;">
			 <xsl:if test="$DependencyData/QBIPTEAggrgtElectPrtshpNmGrp">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/QBIPTEAggrgtElectPrtshpNmGrp/PartnershipName/BusinessNameLine1Txt"/>
				</xsl:call-template><br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/QBIPTEAggrgtElectPrtshpNmGrp/PartnershipName/BusinessNameLine2Txt"/>
				</xsl:call-template>
			</xsl:if>
			 <xsl:if test="$DependencyData/QBIPTEAggrgtElectSCorpNmGrp">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/QBIPTEAggrgtElectSCorpNmGrp/PassThroughEntityName/BusinessNameLine1Txt"/>
				</xsl:call-template><br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/QBIPTEAggrgtElectSCorpNmGrp/PassThroughEntityName/BusinessNameLine2Txt"/>
				</xsl:call-template>
			</xsl:if>			
		  </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="align:right;float:left;clear:none;">EIN:</div>
          <div style="float:left;clear:none;width:118mm;">
			<xsl:if test="$DependencyData/QBIPTEAggrgtElectPrtshpNmGrp"> 
				<xsl:choose>
					<xsl:when test="$DependencyData/QBIPTEAggrgtElectPrtshpNmGrp/PartnershipEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/QBIPTEAggrgtElectPrtshpNmGrp/PartnershipEIN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/QBIPTEAggrgtElectPrtshpNmGrp/MissingEINReasonCd"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose> 
			</xsl:if>
			<xsl:if test="$DependencyData/QBIPTEAggrgtElectSCorpNmGrp"> 
				<xsl:choose>
					<xsl:when test="$DependencyData/QBIPTEAggrgtElectSCorpNmGrp/PassThroughEntityEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/QBIPTEAggrgtElectSCorpNmGrp/PassThroughEntityEIN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/QBIPTEAggrgtElectSCorpNmGrp/MissingEINReasonCd"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose> 
			</xsl:if>
          </div>
        </div>
        <xsl:call-template name="ShowDependencyData"/>
		<br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>