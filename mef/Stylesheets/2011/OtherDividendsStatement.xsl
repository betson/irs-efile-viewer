<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="ODSData" select="$RtnDoc/OtherDividendsStatement" />
  
  <!--  Template to display Other Dividends Statement -->
  <xsl:template name="ShowODS">  
    <table id="ODSTbl" class="styDepTbl" style="font-size:7pt;">    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" scope="col">Corporation Name </th>        
          <th class="styDepTblCell" scope="col">Corporation EIN </th>  
          <th class="styDepTblCell" scope="col">Type of other dividend  </th>        
          <th class="styDepTblCell" scope="col">Source of dividend </th>  
          <th class="styDepTblCell" scope="col">Amount of dividend </th>                              
        </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>    
        <xsl:for-each select="$ODSData/OtherDividends">  
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
            
            <td class="styDepTblCell" style="text-align:left;">
              <nobr>
             <xsl:choose>
               <xsl:when test="normalize-space(CorporationEIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"></span>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="MissingEINReason"/>
		            </xsl:call-template>    
		           <span style="width: 2px"></span>
	          </xsl:otherwise>   
          </xsl:choose>
              </nobr>
            </td>
            
            <td class="styDepTblCell" style="text-align:left;" >
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Type" />
              </xsl:call-template>                      
            </td>
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="SourceOfDividend" />
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
  <xsl:template name="ShowODS">    
    <xsl:for-each select="$ODSData/OtherDividends">
      <table id="ODSTbl" class="styDepTbl">    
        
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
            Type of other dividend
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Type" />
            </xsl:call-template>                      
          </td>
        </tr>                          
        
              
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Source of dividend
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="SourceOfDividend" />
          </xsl:call-template>
        </td>
      </tr>
      
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Amount of dividend
        </th>
        <td class="styDepTblCell" style="text-align:left;">
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
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$ODSData" /></xsl:call-template>  
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
          <span class="styDepTitle" style="width:85mm">
            <xsl:value-of select="$depDocTitle" />
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$ODSData" /></xsl:call-template>        
                
        <xsl:call-template name="ShowODS" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







