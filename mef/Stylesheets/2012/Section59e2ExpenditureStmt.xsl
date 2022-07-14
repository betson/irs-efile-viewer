<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/Section59e2ExpenditureStmt" />
  
  <!-- 1120 Common Section 59(e)(2) Expenditure Statement -->

  <!-- Template to display table items -->
  <xsl:template name="ShowDependencyData">
  
  
    <!-- Itemized Other Income Schedule Data -->
    <table id="DependencyDataTbl" class="styDepTbl">
      <thead class="styTableThead">
      <tr class="styDepTblHdr">         
         <th class="styDepTblCell" scope="col" style="width:87mm;">Type of Expenditure</th>         
         <th class="styDepTblCell" scope="col" style="width:40mm;">Month of the Expenditure Occurred or Incurred</th>  
         <th class="styDepTblCell" scope="col" style="width:60mm;">Amount</th>                                                                                
      </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>
      <xsl:for-each select="$DependencyData/Section59e2Expenditure">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
                              
       <td class="styDepTblCell" style="text-align:left;width: 87mm;">      		
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Type"/>
          </xsl:call-template> 
	</td>       
       <td class="styDepTblCell" style="text-align:center; width: 40mm">      		
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Month"/>
          </xsl:call-template> 
	</td>  
       <td class="styDepTblCell" style="text-align:right; width: 60mm">      		
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="Amount"/>
          </xsl:call-template> 
	</td> 
    </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
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
         <meta name="Author" content="Jason Iozzo" />
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
          <span class="styDepTitle" style="width:113mm;">
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
