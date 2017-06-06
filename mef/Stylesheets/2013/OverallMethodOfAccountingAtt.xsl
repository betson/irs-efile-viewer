<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
    
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="Form3115Deps35Data" select="$RtnDoc/OverallMethodOfAccountingAtt"/>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$Form3115Deps35Data"/>
    </xsl:call-template>  
  </xsl:param>
      
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Jessica Lee - jesslee@us.ibm.com"/>
         <meta name="Description" content="{$depDocTitle}"/>        
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>    
          <style type="text/css">
            <xsl:if test="not($Print) or $Print=''">
              <xsl:call-template name="AddOnStyle"/>    
            </xsl:if>
          </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head>
    
      <body class="styBodyClass">    
        <xsl:call-template name="DocumentHeaderDependency"/>        
        <div class="styDepTitleLine">
          <div class="styDepTitle" style="width:115mm">
            <xsl:value-of select="$depDocTitle"/>
            <!--TY 2003 Overall Method of Accounting Attachment-->     
          </div>
        </div>        
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$Form3115Deps35Data"/></xsl:call-template>            
                
        <table class="styDepTbl" style="margin-top:4mm; font-size:9pt; font-family:Verdana">
          <thead class="styTableThead">        
            <tr class="styDepTblHdr">           
               <th class="styDepTblCell" scope="col">
                 Item Change Info
              </th>
               <th class="styDepTblCell" scope="col">
                 Present Method of item being changed
              </th>
              <th class="styDepTblCell" scope="col">       
                Proposed Method of item being changed
              </th>                
              <th class="styDepTblCell" scope="col">    
                Present Overall Method Of Accounting
              </th>                
            </tr>
          </thead>  
          <tfoot/>
          <tbody>    
          <xsl:for-each select="$Form3115Deps35Data/ItemChangeInfo">
            <tr>
              <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
              </xsl:attribute>                          
              <td class="styDepTblCell" align="left">            
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ChangeItemDesc"/>
                </xsl:call-template>                                  
              </td>  
              <td class="styDepTblCell" style="text-align:left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PresentMethodOfAccountingDesc"/>
                </xsl:call-template>    
              </td>
              <td class="styDepTblCell" style="text-align:left;">            
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ProposedMethodOfAccountingDesc"/>
                </xsl:call-template>                                                
              </td>  
              <td class="styDepTblCell" style="text-align:left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PresentOverallMethodOfAcctCd"/>
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