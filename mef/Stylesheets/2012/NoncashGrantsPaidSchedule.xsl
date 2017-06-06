<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  
  <xsl:param name="Form990DepsData" select="$RtnDoc/NoncashGrantsPaidSchedule" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$Form990DepsData" /></xsl:call-template>  
  </xsl:param>

    
  <!-- Template to display dependency schedule -->
  <xsl:template name="ShowDS">
    <!-- Itemized dependency Schedule -->
    <xsl:for-each select="$Form990DepsData/NoncashGrantPaid">
      <table id="DSTbl" class="styDepTbl">
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Item No.</th>
          <td class="styDepTblCell" style="text-align:center">
            <xsl:value-of select="position()" />
          </td>  
        </tr>  
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Class of Activity</th>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ClassOfActivity" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">  
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Donee's Name</th>                                  
          <td class="styDepTblCell" style="text-align: left">
            <xsl:choose>
              <xsl:when test="DoneesName/Individual">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="DoneesName/Individual" /></xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="DoneesName/Business/BusinessNameLine1" /></xsl:call-template>
                <xsl:if test="DoneesName/Business/BusinessNameLine2">
                  <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="DoneesName/Business/BusinessNameLine2" /></xsl:call-template>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>          
          </td>
        </tr>
        <tr class="styDepTblRow2">    
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Donee's Address</th>          
          <td class="styDepTblCell" style="text-align:left">
          <!-- US address -->
            <xsl:if test="DoneesAddressUS/AddressLine1 != ''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DoneesAddressUS/AddressLine1" />
              </xsl:call-template> 
            </xsl:if>
            <xsl:if test="DoneesAddressUS/AddressLine1 != ''"><br/></xsl:if> 
            <xsl:if test="DoneesAddressUS/AddressLine2 != ''">            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DoneesAddressUS/AddressLine2" />
              </xsl:call-template><br/>
            </xsl:if>
            <xsl:if test="DoneesAddressUS/City != ''">             
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DoneesAddressUS/City" />
              </xsl:call-template>, 
            </xsl:if> 
            <xsl:if test="DoneesAddressUS/State != ''">            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DoneesAddressUS/State" />
              </xsl:call-template><span style="width: 4px"></span> 
            </xsl:if>             
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="DoneesAddressUS/ZIPCode" />
            </xsl:call-template>     
          <!-- foreign Address -->
            <xsl:if test="DoneesAddressForeign/AddressLine1 != ''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DoneesAddressForeign/AddressLine1" />
              </xsl:call-template><br/> 
            </xsl:if>        
            <xsl:if test="DoneesAddressForeign/AddressLine2 != ''">    
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DoneesAddressForeign/AddressLine2" />
              </xsl:call-template><br/>
            </xsl:if>  
            <xsl:if test="DoneesAddressForeign/City != ''">          
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DoneesAddressForeign/City" />
              </xsl:call-template>, 
            </xsl:if>   
            <xsl:if test="DoneesAddressForeign/ProvinceOrState != ''">          
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DoneesAddressForeign/ProvinceOrState" />
              </xsl:call-template>, 
            </xsl:if>            
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="DoneesAddressForeign/Country" />
            </xsl:call-template> 
            <span style="width: 4mm"></span>    
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="DoneesAddressForeign/PostalCode" />
            </xsl:call-template>     
          </td>
        </tr>
        <tr class="styDepTblRow1">  
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Amount (FMV)</th>                                  
          <td class="styDepTblCell" style="text-align:left">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AmountFmv" /></xsl:call-template>             
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow2">    
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Relationship</th>                                
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Relationship" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">    
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Description</th>                                
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Description" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Book Value</th>                                    
          <td class="styDepTblCell"  style="text-align:left">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BookValue" /></xsl:call-template>             
          </span>
          </td>
        </tr>
        <tr class="styDepTblRow1">    
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">How Book Value is Determined?</th>                                
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="HowBookValueDetermined" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow2">    
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">How FMV is Determined?</th>                                
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="HowFmvDetermined" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">  
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Date of Gift</th>                                  
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="DateOfGift" /></xsl:call-template>             
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
          <span class="styDepTitle">
            <xsl:value-of select="$depDocTitle" />&nbsp;
          </span>
        </div>        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$Form990DepsData" /></xsl:call-template>
        <br/>            
        <xsl:call-template name="ShowDS" />          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>