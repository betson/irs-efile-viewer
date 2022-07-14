<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  <xsl:param name="OVDCSData" select="$RtnDoc/Owned50PercentVotingStockStmt"/>
  <!-- - Common Form displays as - 50% Voting Stock of Domestic Corporation Statement - -->
  <xsl:template name="ShowOVDCS">  
    <table id="OVDCSTbl" class="styDepTbl" >    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" style="width:45mm" scope="col">Corporation Name </th>        
          <th class="styDepTblCell" style="width:20mm" scope="col">Corporation EIN </th>  
          <th class="styDepTblCell" style="width:45mm" scope="col">Name </th>        
          <th class="styDepTblCell" style="width:20mm" scope="col">EIN </th>  
          <th class="styDepTblCell" style="width:21mm" scope="col">Percentage owned  </th>  
          <th class="styDepTblCell" style="width:36mm" scope="col">Taxable income or (loss) before NOL </th>                 
        </tr>
      </thead>
        <tfoot/>
       <tbody>    
        <xsl:for-each select="$OVDCSData/Owned50PercentVotingStock">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>  
            <td class="styDepTblCell" style="width:45mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <xsl:if test="CorporationName/BusinessNameLine2Txt != ''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </xsl:if>
            </td>
            <td class="styDepTblCell" style="width:20mm;text-align:center;">
              <xsl:choose>
               <xsl:when test="normalize-space(CorporationEIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"/>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
		            </xsl:call-template>    
		           <span style="width: 2px"/>
	          </xsl:otherwise>   
          </xsl:choose>
            </td>
            <td class="styDepTblCell" style="width:45mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
                <br/><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
              </xsl:if>            
            </td>  
            <td class="styDepTblCell" style="width:20mm;text-align:center;">
                <xsl:choose>
               <xsl:when test="normalize-space(EIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="EIN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"/>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="EINMissingReasonCd"/>
		            </xsl:call-template>    
		           <span style="width: 2px"/>
	          </xsl:otherwise>   
          </xsl:choose>
            </td>  
            <td class="styDepTblCell" style="width:21mm;text-align:right;">              
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="VotingStockOwnedPct"/>
              </xsl:call-template>              
            </td>
            <td class="styDepTblCell" style="width:36mm;text-align:right;">              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableIncomeLossBfrNOLDedAmt"/>
              </xsl:call-template>              
            </td>  
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>    
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$OVDCSData"/></xsl:call-template>  
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
         <meta name="Author" content="Ravi Venigalla"/>
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
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"/>    
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:142mm">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$OVDCSData"/></xsl:call-template>       
        <xsl:call-template name="ShowOVDCS"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>