<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/ItemizedOtherIncomeSchedule" />
  
  <!-- Template to display Itemized Charitable Contribution Statement -->
  <xsl:template name="DependencyTemplate">  
    <table id="IOISTbl" class="styDepTblLandscape" style="font-size:8pt">    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" scope="col">Corporation Name </th>        
          <th class="styDepTblCell" scope="col">Corporation EIN </th>  
          <th class="styDepTblCell" scope="col">Income Type </th>        
          <th class="styDepTblCell" scope="col">Amount </th>  
          <th class="styDepTblCell" scope="col">Partnership Name </th>  
           <th class="styDepTblCell" scope="col">Partnership EIN </th>  
           <th class="styDepTblCell" scope="col">Partnership Address </th>  
           <th class="styDepTblCell" scope="col">Partnership Amount </th>                   
        </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>    
        <xsl:for-each select="$DependencyData/ItemizedIncome">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>  
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1" />
              </xsl:call-template>
            
              <xsl:if test="CorporationName/BusinessNameLine2 != ''">
                <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>
            </td>  
            
            <td class="styDepTblCell" style="text-align:center;">
          <xsl:choose>
            <xsl:when test="CorporationEIN">
                       <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="CorporationEIN" />
                      </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="MissingEINReason" />
                    </xsl:call-template>
                    </xsl:otherwise>
               </xsl:choose>
            </td>
          
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="IncomeType" />
              </xsl:call-template>
            </td>        
        
            <td class="styDepTblCell" style="text-align:right;" nowrap="yes">              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amount"/>
              </xsl:call-template>              
            </td>  
        
            <td class="styDepTblCell" style="text-align:center;text-align:left;" >
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine1" />
              </xsl:call-template>
              <xsl:if test="PartnershipName/BusinessNameLine2 != ''">
                <br /><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine2" />
                  </xsl:call-template>
              </xsl:if>            
            </td>        
        
            <td class="styDepTblCell" style="text-align:center;">
          <xsl:choose>
            <xsl:when test="PartnershipEIN">
                       <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="PartnershipEIN" />
                      </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="EINMissingReason" />
                    </xsl:call-template>
                    </xsl:otherwise>
               </xsl:choose>
            </td>        
        
            <td class="styDepTblCell" style="text-align:center;text-align:left;" >
              <!--xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PartnershipAddress/AddressLine1" />
              </xsl:call-template>
              <xsl:if test="PartnershipAddress/AddressLine2 != ''">
                <br /><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="PartnershipAddress/AddressLine2" />                      </xsl:call-template>
                  </xsl:if>
              <xsl:if test="PartnershipAddress/City != ''"><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PartnershipAddress/City" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="PartnershipAddress/State != ''">, <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PartnershipAddress/State" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="PartnershipAddress/ZIPCode != ''"><span style="width:7px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PartnershipAddress/ZIPCode" />
                </xsl:call-template>
              </xsl:if -->
              
                 <xsl:choose>
	                <xsl:when test="PartnershipUSAddress">
	                        <xsl:call-template name="PopulateUSAddressTemplate">
	                        <xsl:with-param name="TargetNode" select="PartnershipUSAddress" />
	                        </xsl:call-template>  
	               </xsl:when>
	               <xsl:otherwise>
	                        <xsl:call-template name="PopulateForeignAddressTemplate">
	                        <xsl:with-param name="TargetNode" select="PartnershipForeignAddress" />
	                        </xsl:call-template>  
	               </xsl:otherwise>
               </xsl:choose>
            </td>
                    
            <td class="styDepTblCell" style="text-align:right;" nowrap="yes">            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PartnershipAmount" />
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
        <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>    
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle" style="width:95mm">
            <xsl:value-of select="$depDocTitle" />
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>        
                
        <xsl:call-template name="DependencyTemplate" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







