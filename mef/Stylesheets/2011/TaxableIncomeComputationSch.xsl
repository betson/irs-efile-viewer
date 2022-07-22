<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="TICSData" select="$RtnDoc/TaxableIncomeComputationSch" />
  
  <!-- Template to display Itemized Taxable Income Computation Schedule -->
  <xsl:template name="ShowTICS">  
    <table id="TICSTbl" class="styDepTbl">    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" scope="col">Line number</th>        
          <th class="styDepTblCell" scope="col">Description</th>  
          <th class="styDepTblCell" scope="col">Amount</th>                                     
        </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>    
        <xsl:for-each select="$TICSData/TaxableIncomeComputation">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>  
            
            <td class="styDepTblCell" style="text-align:center;">              
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="LineNumber" />
              </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Description" />
              </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:right;" nowrap="yes">              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amount" />
              </xsl:call-template>              
            </td>  
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>    
  
  
  
  <!-- VERTICAL TABLE STYLE COMMENTED  
  
  <xsl:template name="ShowTICS">
    
    <xsl:for-each select="$TICSData/TaxableIncomeComputation">
      <table id="TICSTbl" class="styDepTbl">    
        
         <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row"  style="width:40%;text-align:right;">Item No.</th>
          <td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>
        </tr>        
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Line number
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="LineNumber" />
            </xsl:call-template>
          </td>
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Description
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Description" />
            </xsl:call-template>
          </td>
        </tr>        
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Amount
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Amount" />
              </xsl:call-template>
            </span>
          </td>
        </tr>         
        
      </table>
      <br/>        
    </xsl:for-each>    
  </xsl:template>
  -->
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$TICSData" /></xsl:call-template>  
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
          <span class="styDepTitle" style="width:109mm">
            <xsl:value-of select="$depDocTitle" />
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$TICSData" /></xsl:call-template>        
                  
        <xsl:call-template name="ShowTICS" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







