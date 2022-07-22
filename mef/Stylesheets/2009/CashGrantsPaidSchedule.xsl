<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*" />
    
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>  
  
  <xsl:param name="DependencyData" select="$RtnDoc/CashGrantsPaidSchedule" />
    
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
    
  <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="DependencyTemplate">
    <!-- Itemized Other Income Schedule Data -->
    <table id="CGPSTbl" class="styDepTbl" style="width:187mm;">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Class of Activity</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Recipient's name</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Address</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Amount</th>  
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Relationship</th>                                  
      </tr>      
      <xsl:for-each select="$DependencyData/CashGrantPaid">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:left">            
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ClassOfActivity" /></xsl:call-template>             
          </td>          
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RecipientName/Individual" /></xsl:call-template> 
            <xsl:if test="normalize-space(RecipientName/Business/BusinessNameLine1) != ''">
              <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RecipientName/Business/BusinessNameLine1" /></xsl:call-template> 
            </xsl:if>
            <xsl:if test="normalize-space(RecipientName/Business/BusinessNameLine2) != ''">
              <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RecipientName/Business/BusinessNameLine2" /></xsl:call-template> 
            </xsl:if>
          </td>          
          <td class="styDepTblCell" nowrap="nowrap" style="text-align:left;width:40mm;">
            <xsl:choose>
              <xsl:when test="AddressUS">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressUS/AddressLine1" /></xsl:call-template> 
                <xsl:if test="normalize-space(AddressUS/AddressLine2) != ''">
                  <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressUS/AddressLine2" /></xsl:call-template> 
                </xsl:if>
                <xsl:if test="normalize-space(AddressUS/City) != ''">
                  <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressUS/City" /></xsl:call-template>, 
                </xsl:if>
                <xsl:if test="normalize-space(AddressUS/State) != ''">
                  &nbsp;<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressUS/State" /></xsl:call-template> 
                </xsl:if>
                &nbsp;<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressUS/ZIPCode" /></xsl:call-template>               </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressForeign/AddressLine1" /></xsl:call-template> 
                <xsl:if test="normalize-space(AddressForeign/AddressLine2) != ''">
                  <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressForeign/AddressLine2" /></xsl:call-template> 
                </xsl:if>
                <xsl:if test="normalize-space(AddressForeign/City) != ''">
                  <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressForeign/City"/></xsl:call-template>,
                </xsl:if>
                <xsl:if test="normalize-space(AddressForeign/ProvinceOrState)!=''">
                  &nbsp;<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressForeign/ProvinceOrState"/></xsl:call-template>
                </xsl:if>
                &nbsp;<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressForeign/PostalCode"/></xsl:call-template>
                <xsl:if test="normalize-space(AddressForeign/Country)!=''">
                  <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressForeign/Country"/></xsl:call-template>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>    
          </td>            
          <td class="styDepTblCell" style="text-align:right;width:32mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="Amount" /></xsl:call-template>             
          </td>  
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Relationship" /></xsl:call-template>             
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
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>  
        <div class="styDepTitleLine">
          <div class="styDepTitle" style="width: 80mm">
            <xsl:value-of select="$depDocTitle" />            
          </div>
        </div>        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template><br/>  
                
        <xsl:call-template name="DependencyTemplate" />          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







