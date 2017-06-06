<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>      
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/OwnsForeignPartnershipStmt" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
    
  
  <xsl:template name="DependencyTemplate">
    
    <table id="OFPSTbl" class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col" rowspan="2">Foreign Partnership Item No.</th-->
           <th class="styDepTblCell" scope="col" rowspan="2">Name</th>
           <th class="styDepTblCell" scope="col" rowspan="2">EIN</th>
           <th class="styDepTblCell" scope="col" rowspan="2">Other Forms Filed</th>
           <th class="styDepTblCell" scope="col" rowspan="2">Name of Tax Matters Partner</th>
           <th class="styDepTblCell" scope="col" colspan="2">Foreign Partnership Tax Year</th>         
        </tr>
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col">Beginning Date</th>
           <th class="styDepTblCell" scope="col">Ending Date</th>
        </tr>
      </thead>  
      <tfoot></tfoot>
      <tbody>  
      <xsl:for-each select="$DependencyData/ForeignPartnership">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!--td class="styDepTblCell" valign="top">
            <xsl:value-of select="position()" />
          </td-->          
          <td class="styDepTblCell" valign="top" align="left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="NameOfForeignPartnership/BusinessNameLine1" /></xsl:call-template>
            <xsl:if test="normalize-space(NameOfForeignPartnership/BusinessNameLine2) != ''">
              <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="NameOfForeignPartnership/BusinessNameLine2" /></xsl:call-template>
            </xsl:if>    
          </td>
          <td class="styDepTblCell" valign="top" align="center">
            <xsl:choose> 
    			<xsl:when test="EINOfForeignPartnership">   
             			<xsl:call-template name="PopulateEIN">
               			<xsl:with-param name="TargetNode" select="EINOfForeignPartnership" />
             			</xsl:call-template>    
           		 </xsl:when>  
  			<xsl:otherwise>   
           			<xsl:call-template name="PopulateText">
             				<xsl:with-param name="TargetNode" select="MissingEINOfForeignPartnership" />
           			</xsl:call-template>  
          		</xsl:otherwise>
		</xsl:choose>          		
          </td>  
          <td class="styDepTblCell" valign="top" align="center" width="50mm">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="OtherFormsFiled" /></xsl:call-template>
          </td>  
          <td class="styDepTblCell" valign="top" align="left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="NameOfTaxMattersPartner/BusinessNameLine1" /></xsl:call-template>
            <xsl:if test="normalize-space(NameOfTaxMattersPartner/BusinessNameLine2) != ''">
              <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="NameOfTaxMattersPartner/BusinessNameLine2" /></xsl:call-template>
            </xsl:if>    
          </td>  
          <td class="styDepTblCell" valign="top" align="center" width="75mm">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ForeignPrtshpTYBeginningDate" /></xsl:call-template>
          </td>  
          <td class="styDepTblCell" valign="top" align="center" width="75mm">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ForeignPrtshpTaxYearEndingDate" /></xsl:call-template>
          </td>          
        </tr>
      </xsl:for-each>
      </tbody>  
    </table>
  </xsl:template>
  
  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title>
           <!--Owns Foreign Partnership Statement-->
          <xsl:value-of select="$depDocTitle" />
        </title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />         
         <meta name="Description" content="{$depDocTitle}" />
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">    
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
        
        <div class="styDepTitleLine">
          <div class="styDepTitle" style="width:105mm">
            <!--TY 2003 Owns Foreign Partnership Statement-->
            <xsl:value-of select="$depDocTitle" />
          </div>
        </div>        
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>                    
                          
        <xsl:call-template name="DependencyTemplate" />          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







