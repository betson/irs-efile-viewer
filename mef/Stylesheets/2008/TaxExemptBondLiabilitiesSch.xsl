<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  <xsl:param name="Form990DepsData" select="$RtnDoc/TaxExemptBondLiabilitiesSch" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$Form990DepsData" /></xsl:call-template>  
  </xsl:param>
    
  <!-- Template to display dependency schedule -->
  <xsl:template name="ShowDS">
    <!-- Itemized dependency Schedule -->
    <xsl:for-each select="$Form990DepsData/TaxExemptBondLiability">
      <table id="DSTbl" class="styDepTbl">      
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="col"  style="text-align: right">Item No.</th>
          <td class="styDepTblCell" style="text-align: center">
            <xsl:value-of select="position()" />
          </td>
        </tr>    
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="col"  style="text-align: right">Name of Issue</th>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="NameOfIssue" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">    
          <th class="styDepTblCell" scope="col"  style="text-align: right">Purpose</th>          
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Purpose" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow2">      
          <th class="styDepTblCell" scope="col"  style="text-align: right">Amount Outstanding</th>                              
          <td class="styDepTblCell" style="text-align:left">
            <span style="width: 44mm; text-align: right">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AmountOutstanding" /></xsl:call-template>
            </span>             
          </td>
        </tr>
        <tr class="styDepTblRow1">            
          <th class="styDepTblCell" scope="col"  style="text-align: right">Unexpeded Bond Proceeds</th>                        
          <td class="styDepTblCell" style="text-align:left">
            <span style="width: 44mm; text-align: right">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="UnexpendedBondProceeds" /></xsl:call-template> 
            </span>            
          </td>
        </tr>
        <tr class="styDepTblRow2">      
          <th class="styDepTblCell" scope="col"  style="text-align: right">Third Party Use</th>                              
          <td class="styDepTblCell" style="text-align:left">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="ThirdPartyUse" />
              </xsl:call-template>
          </td>
        </tr>
        <tr class="styDepTblRow1">        
          <th class="styDepTblCell" scope="col"  style="text-align: right">Space Percentage</th>                            
          <td class="styDepTblCell" style="text-align:left">
            <span style="width: 52mm; text-align: right">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="SpacePercentage" /></xsl:call-template>   
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow2">      
          <th class="styDepTblCell" scope="col"  style="text-align: right">Maturity Date</th>                              
          <td class="styDepTblCell" style="text-align:left">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="MaturityDate" /></xsl:call-template>
          </td>
        </tr>
        <tr class="styDepTblRow1">                    
          <th class="styDepTblCell" scope="col"  style="text-align: right">Repayment Terms</th>                
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RepaymentTerms" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow2">      
          <th class="styDepTblCell" scope="col"  style="text-align: right">Interest Rate</th>                              
          <td class="styDepTblCell" style="text-align:left">
            <span style="width: 52mm; text-align: right">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="InterestRate" /></xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow1">    
          <th class="styDepTblCell" scope="col"  style="text-align: right">Security</th>                                
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Security" /></xsl:call-template>             
          </td>
        </tr>
      </table>
      <br />
    </xsl:for-each>
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
         <meta name="Author" content="lshen@us.ibm.com" />
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
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>  
        <div class="styDepTitleLine">
          <div class="styDepTitle" style="width: 105mm">
            <xsl:value-of select="$depDocTitle" />
          </div>
        </div>        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$Form990DepsData" /></xsl:call-template>
        <br/>            
        <xsl:call-template name="ShowDS" />          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>