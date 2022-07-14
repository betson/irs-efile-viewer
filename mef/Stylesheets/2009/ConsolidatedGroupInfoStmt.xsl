<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/ConsolidatedGroupInfoStmt" />
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
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
         <meta name="Author" content="Jessica Lee - jesslee@us.ibm.com" />
         <meta name="Description" content="{$depDocTitle}" />        
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>    
          <style type="text/css">
            <xsl:if test="not($Print) or $Print=''">
              <xsl:call-template name="AddOnStyle"></xsl:call-template>    
            </xsl:if>
          </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head>
    
      <body class="styBodyClass">    
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>        
        <div class="styDepTitleLine">
          <div class="styDepTitle" style="width:117mm">
            <xsl:value-of select="$depDocTitle" />
            <!--TY 2003 Parent Corporation Information Statement-->     
          </div>
        </div>        
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template> 

       <table class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
          <thead class="styTableThead">        
            <tr class="styDepTblHdr">           
               <th class="styDepTblCell" scope="col">
                 Name
              </th>
               <th class="styDepTblCell" scope="col">
                 EIN/SSN
              </th>
              <th class="styDepTblCell" scope="col">       
                ActivityCode
              </th>                
              </tr>
          </thead>  
          <tfoot></tfoot>
          <tbody>    
          <xsl:for-each select="$DependencyData/ConsolidatedGroupInfo">
            <tr>
              <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
              </xsl:attribute>  
                                      
              <td class="styDepTblCell" align="left">            
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1" />
                </xsl:call-template>
                <xsl:if test="normalize-space(BusinessName/BusinessNameLine2)!=''">
                  <br/>  
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2" />
                  </xsl:call-template>    
                </xsl:if>                             
              </td>  
              <td class="styDepTblCell">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="EIN" />
                </xsl:call-template>  
                
             <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="SSN" />
                </xsl:call-template>   
                
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MissingSSNEINReason" />
                </xsl:call-template>    
                </td>
     <!--                           
             <td class="styDepTblCell" align="left">            
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="USAddress" />
                </xsl:call-template>
                <xsl:if test="normalize-space(ForeignAddress)!=''">
                  <br/>  
                  <xsl:call-template name="PopulateForeignAddressTemplate">
                    <xsl:with-param name="TargetNode" select="ForeignAddress" />
                  </xsl:call-template>    
                </xsl:if>                             
              </td>  
   
          TOOK THIS OUT TO SET UP FOREIGN ADDR  
              <td class="styDepTblCell" align="left">            
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="Address" />
                </xsl:call-template>                                                
              </td>
        -->  
        
              <td class="styDepTblCell">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCode" />
                </xsl:call-template>                    
              </td>                    
            </tr>
          </xsl:for-each>
          </tbody>    
        </table>        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







