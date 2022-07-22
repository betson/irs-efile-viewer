<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="AOVSSData" select="$RtnDoc/AnyOwned50PctVotingStockStmt" />
  
  <!-- Template to displayAny Owned 50% or more of corporations voting stock statement -->
  
  <xsl:template name="ShowAOVSS">
    <!-- Any Owned 50% or more of corporations voting stock statement -->
    <table id="AOVSSTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
        <!--   <th class="styTblCell" scope="col">Item No.</th> -->
           <th class="styDepTblCell" scope="col">Corporation Name</th>        
           <th class="styDepTblCell" scope="col">Corporation EIN</th>  
           <th class="styDepTblCell" scope="col">Name</th>        
           <th class="styDepTblCell" scope="col">TIN</th>        
        </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>    
        <xsl:for-each select="$AOVSSData/AnyOwned50PctVotingStock">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          <!--  <td class="styTblCell" scope="row" style="text-align:center;"><xsl:value-of select="position()" /></td> -->
                      
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
             <td class="styDepTblCell" style="text-align:center;width:32mm" >
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
                <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1" />
              </xsl:call-template>
                      
              <xsl:if test="Name/BusinessNameLine2 != ''">
                <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>  
            </td>
            
      <td class="styDepTblCell" style="text-align:center;width=24mm">
         <xsl:choose> 
          <xsl:when test="EIN">
                <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="EIN" />
              </xsl:call-template>
          </xsl:when>
          <xsl:when test="SSN">
            <xsl:call-template name="PopulateSSN">
              <xsl:with-param name="TargetNode" select="SSN" />
            </xsl:call-template>
         </xsl:when> 
        <xsl:otherwise>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="EINMissingReason" />
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose> 
     </td>        
 </tr>      
 </xsl:for-each>
 </tbody>
</table>
  </xsl:template>

        
  <!-- VERTICAL TABLE STYLE COMMENTED        
  <xsl:template name="ShowAOVSS">
    
    <xsl:for-each select="$AOVSSData/AnyOwned50PctVotingStock">
      <table id="AOVSSTbl" class="styDepTbl">    
        
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
            Name
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1" />
            </xsl:call-template>
                    
            <xsl:if test="Name/BusinessNameLine2 != ''">
              <br />
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2" />
              </xsl:call-template>
            </xsl:if>  
          </td>
        </tr>              
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            EIN
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="EIN" />
            </xsl:call-template>
          </td>
        </tr>             
        
      </table>
      <br/>        
    </xsl:for-each>    
  </xsl:template>

-->
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$AOVSSData" /></xsl:call-template>  
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
          <span class="styDepTitle" style="width:179mm">          
            <xsl:value-of select="$depDocTitle" />  
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$AOVSSData" /></xsl:call-template>      
                  
        <xsl:call-template name="ShowAOVSS" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







