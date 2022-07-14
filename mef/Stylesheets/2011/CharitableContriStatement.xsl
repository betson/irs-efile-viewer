<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="CCSData" select="$RtnDoc/CharitableContriStatement" />
  
  <!-- Template to display Itemized Charitable Contribution Statement -->  
  
  <xsl:template name="ShowCCS">
    <table id="CCSTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">          
           <th class="styDepTblCell" scope="col">Corporation Name </th>        
           <th class="styDepTblCell" scope="col">Corporation EIN </th>  
           <th class="styDepTblCell" scope="col">Type of Contribution </th>        
           <th class="styDepTblCell" scope="col">Method Used </th>        
           <th class="styDepTblCell" scope="col">Fair Market Value </th>  
        </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>    
        <xsl:for-each select="$CCSData/CharitableContribution">  
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
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="CorporationEIN" />
              </xsl:call-template>
              <xsl:if test="MissingEINReason !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
            </td>
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Type" />
              </xsl:call-template>
            </td>
           
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="MethodUsed" />
              </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">
              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="FairMarketValue" />
                </xsl:call-template>
              
            </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>


<!-- VERTICAL TABLE STYLE COMMENTED    
  
  <xsl:template name="ShowCCS">
    
    <xsl:for-each select="$CCSData/CharitableContribution">
      <table id="CCSTbl" class="styDepTbl">
        
         <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row"  style="width:40%;text-align:right;">Item No.</th>
          <td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>
        </tr>
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Corporation Name
          </th>
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
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Corporation EIN
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CorporationEIN" />
            </xsl:call-template>
          </td>
        </tr>
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Type of contribution
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Type" />
            </xsl:call-template>
          </td>
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Fair market value
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FairMarketValue" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Method used
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="MethodUsed" />
            </xsl:call-template>
          </td>
        </tr>

        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Fair market value of underlying property before donation
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FairMarketValueBeforeDonation" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Fair market value of underlying property after donation
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FairMarketValueAfterDonation" />
              </xsl:call-template>
            </span>
          </td>
        </tr>

         <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Type of legal interest contributed
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="TypeOfLegalInterestContributed" />
            </xsl:call-template>
          </td>
        </tr>
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Description of conservation purpose benefited by donation
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CnsrvPurposedBenefitedDesc" />
            </xsl:call-template>
          </td>
        </tr>
          
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Carryover contribution amount
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CarryoverContributionAmount" />
              </xsl:call-template>
            </span>
          </td>
        </tr>

           
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Determination of carryover contribution
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CarryoverContriDetermination" />
            </xsl:call-template>
          </td>
        </tr>
      </table>
      <br/>        
    </xsl:for-each>    
  </xsl:template>  
  
  -->
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$CCSData" /></xsl:call-template>  
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
        <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>    
        <div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:100mm">
            <xsl:value-of select="$depDocTitle" />        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$CCSData" /></xsl:call-template>        
        <xsl:call-template name="ShowCCS" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







