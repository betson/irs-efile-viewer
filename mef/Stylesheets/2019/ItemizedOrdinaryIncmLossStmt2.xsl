<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/ItemizedOrdinaryIncmLossStmt2"/>
  
  <!-- Template to display Itemized ordinary income loss statement -->
  
  <xsl:template name="DependencyTemplate">  
    <table id="IOIL2Tbl" class="styDepTbl">    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
           <th class="styDepTblCell" scope="col">Partnership Name </th>        
           <th class="styDepTblCell" scope="col">Address </th>  
           <th class="styDepTblCell" scope="col">EIN </th>        
           <th class="styDepTblCell" scope="col">Source of trade or business income (loss) </th>      
            <th class="styDepTblCell" scope="col">Amount </th>
             <th class="styDepTblCell" scope="col">Total </th>  
        </tr>
      </thead>
        <tfoot/>
        
       <tbody>    
        <xsl:for-each select="$DependencyData/OrdinaryIncomeLossStmt2Grp">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>  
              
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <xsl:if test="PartnershipName/BusinessNameLine2Txt != ''">
                <br/><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
              </xsl:if>            
            </td>        
        
            <td class="styDepTblCell" style="text-align:left;">
             <xsl:choose>
              <xsl:when test="USAddress">
               <xsl:call-template name="PopulateUSAddressTemplate">
                    <xsl:with-param name="TargetNode" select="USAddress"/>
               </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
               <xsl:call-template name="PopulateForeignAddressTemplate">
                    <xsl:with-param name="TargetNode" select="ForeignAddress"/>
               </xsl:call-template>
              </xsl:otherwise>
             </xsl:choose>
            </td> 
            
            <td class="styDepTblCell" style="text-align:left;width:21mm;">
            <xsl:choose>
            <xsl:when test="EIN">
                       <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="EIN"/>
                      </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                    </xsl:call-template>
                    </xsl:otherwise>
               </xsl:choose>
            </td>
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TradeSourceOrBusIncmLossTxt"/>
              </xsl:call-template>
            </td>
                
            <td class="styDepTblCell" style="text-align:right;" nowrap="yes">            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amt"/>
              </xsl:call-template>            
            </td>              
        
            <td class="styDepTblCell" style="text-align:right;" nowrap="yes">              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalAmt"/>
              </xsl:call-template>              
            </td>  
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>  
  
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
          <span class="styDepTitle" style="width:118mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>        
              
        <xsl:call-template name="DependencyTemplate"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>