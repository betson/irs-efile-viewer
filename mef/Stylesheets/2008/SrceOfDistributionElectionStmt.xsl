<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  <xsl:param name="SDESData" select="$RtnDoc/SrceOfDistributionElectionStmt" />
  
  <!-- Template to display Source of Distribution Election Statement -->  
  <xsl:template name="ShowSDES">  
    <table id="SDESTbl" class="styDepTbl" style="font-size:7pt">    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" scope="col">Election Description </th>        
          <th class="styDepTblCell" scope="col">Shareholder Name </th>  
          <th class="styDepTblCell" scope="col">Deemed Dividend Amount </th>        
          <th class="styDepTblCell" scope="col">Election Consent </th>                           
        </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>    
        <xsl:for-each select="$SDESData/SourceOfDistributionElection">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>  
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ElectionDescription" />
              </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ShareholderName/BusinessNameLine1" />
              </xsl:call-template>
            
              <xsl:if test="ShareholderName/BusinessNameLine2 != ''">
                <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ShareholderName/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>
            </td>
            
            <td class="styDepTblCell" style="text-align:right;" >  
              <nobr>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="DeemedDividendAmount" />
              </xsl:call-template>           
              </nobr>               
            </td>
            
            <td class="styDepTblCell" style="text-align:left;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ElectionConsent" />
              </xsl:call-template>            
            </td>  
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>    
  
  
  
  <!-- VERTICAL TABLE STYLE COMMENTED  
  <xsl:template name="ShowSDES">
    
    <xsl:for-each select="$SDESData/SourceOfDistributionElection">
      <table id="SDESTbl" class="styDepTbl">
        
         <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row"  style="width:40%;text-align:right;">Item No.</th>
          <td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>
        </tr>        
                        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Election Description
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ElectionDescription" />
            </xsl:call-template>
          </td>
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Shareholder Name
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ShareholderName/BusinessNameLine1" />
            </xsl:call-template>
          
            <xsl:if test="ShareholderName/BusinessNameLine2 != ''">
              <br />
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ShareholderName/BusinessNameLine2" />
              </xsl:call-template>
            </xsl:if>
          </td>  
        </tr>                
                
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Deemed Dividend Amount
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DeemedDividendAmount" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Election Consent
          </th>
          <td class="styDepTblCell" style="text-align:left;" >            
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ElectionConsent" />
            </xsl:call-template>            
          </td>
        </tr>
                 
      </table>
      <br/>        
    </xsl:for-each>    
  </xsl:template>
-->
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$SDESData" /></xsl:call-template>  
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
          <span class="styDepTitle" style="width:115mm">
            <xsl:value-of select="$depDocTitle" />
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$SDESData" /></xsl:call-template>        
        
        <xsl:call-template name="ShowSDES" />          
        <br/>              
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







