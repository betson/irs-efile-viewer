<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />  
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
    
  <xsl:param name="DependencyData" select="$RtnDoc/QlfyRehbltExpendCreditStmt" />
  
  <!-- Template to display Qualified Rehabilitation Expenditures Credit Statement  -->
  
  <xsl:template name="ShowDependencyData">
    <!--  Qualified Rehabilitation Expenditures Credit Statement Data -->
    <table class="styDepTbl" style="font-size:7pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:58mm">Pre-1936 Building</th>        
           <th class="styDepTblCell" scope="col" style="width:35mm">Pre-1936 Building Amount</th>
           <th class="styDepTblCell" scope="col" style="width:59mm">Section 1400N(h) Pre-1936 Building Amount</th>        
           <th class="styDepTblCell" scope="col" style="width:59mm">Certified Historic Structure</th>        
           <th class="styDepTblCell" scope="col" style="width:59mm">Certified Historic Structure Amount</th>        
           <th class="styDepTblCell" scope="col" style="width:35mm">Section 1400N(h) Certified Historic Structure Amount</th>            
        </tr>
      </thead>
        <tfoot></tfoot>
       <tbody>
        <xsl:for-each select="$DependencyData/QlfyRehbltExpendCredit">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="width:58mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Pre1936Building"/>
              </xsl:call-template>                  
            </td>
            <td class="styDepTblCell" style="width:35mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Pre1936BuildingAmount"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width:35mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Sect1400NhPre1936BuildingAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell"  style="width:59mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CertifiedHistoricStructure"/>
              </xsl:call-template>
            </td>    
            <td class="styDepTblCell" style="width:35mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CertifiedHistoricStructureAmt"/>
              </xsl:call-template>
            </td>            
            <td class="styDepTblCell" style="width:35mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Sect1400NhCertHistStructureAmt"/>
              </xsl:call-template>
            </td>            
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
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
         <meta name="Author" content="Ravi Venigalla" />
         <meta name="Description" content= "{$depDocTitle}" /> 
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass" >      
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>          
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:75mm">
            <xsl:value-of select="$depDocTitle" />
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>                
        <xsl:call-template name="ShowDependencyData" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







