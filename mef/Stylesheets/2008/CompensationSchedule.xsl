<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*" />
    
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  
  <xsl:param name="DependencyData" select="$RtnDoc/CompensationSchedule" />
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
    
  <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="DependencyTemplate">
    <!-- Itemized Other Income Schedule Data -->
    <table id="COSTbl" class="styDepTblLandscape" style="font-size: 7pt" >
           <tr class="styDepTblHdr">
              <th class="styDepTblCell" scope="col" nowrap="nowrap" rowspan="2">Name</th>
              <th class="styDepTblCell" scope="col" nowrap="nowrap" colspan="2">Related Organization</th>         
             <th class="styDepTblCell" scope="col" nowrap="nowrap" rowspan="2">Relationship</th>               
              <th class="styDepTblCell" scope="col" nowrap="nowrap" rowspan="2">Compensation <br/>Amount</th>           
              <th class="styDepTblCell" scope="col" nowrap="nowrap" rowspan="2">Benefit Plan <br/>Contributions</th>                
              <th class="styDepTblCell" scope="col" nowrap="nowrap" rowspan="2">Expense Account</th>
              <th class="styDepTblCell" scope="col" nowrap="nowrap" rowspan="2">Compensation Description</th>       
          </tr>      
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" nowrap="nowrap">Name</th>  
            <th class="styDepTblCell" scope="col" nowrap="nowrap">EIN</th>  
         </tr> 
            
      <xsl:for-each select="$DependencyData/Compensation">
       <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute> 
           
          <td class="styDepTblCell" style="text-align:left">          
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Name" /></xsl:call-template>             
          </td> 
                   
          <td class="styDepTblCell" style="text-align:left">          
            <xsl:if test="normalize-space(RelatedOrganizationName/BusinessNameLine1) != ''">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine1" /></xsl:call-template> 
            </xsl:if>
            <xsl:if test="normalize-space(RelatedOrganizationName/BusinessNameLine2) != ''">
              <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine2" /></xsl:call-template> 
            </xsl:if>
          </td>
                
          <td class="styDepTblCell" style="text-align: center; width: 21mm;">
            <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="RelatedOrganizationEIN" /></xsl:call-template>             
          </td> 
                   
           <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Relationship" /></xsl:call-template>
            </td>
                            
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="CompensationAmount" /></xsl:call-template>             
          </td>
            
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="BenefitPlanContributions" /></xsl:call-template>             
          </td> 
           
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="ExpenseAccount" /></xsl:call-template>             
          </td>
          
          <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CompensationDescription" />
              </xsl:call-template>
          </td>                
                                    
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
  
  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
          <title><xsl:value-of select="$depDocTitle" /></title>
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
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"></xsl:call-template>
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
  <body class="styBodyClass">       
      <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template> 
      <div class="styDepTitleLineLandscape">
        <span class="styDepTitle">
          <span style="width:70mm;"><xsl:value-of select="$depDocTitle" /></span>
        </span>
      </div>                     
      <!--Adding template for left over data  -->
       <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>

        <br/>            
        <xsl:call-template name="DependencyTemplate" />          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







