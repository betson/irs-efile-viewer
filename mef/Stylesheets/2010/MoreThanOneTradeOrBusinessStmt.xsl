<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>    
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="Form3115Deps30Data" select="$RtnDoc/MoreThanOneTradeOrBusinessStmt" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$Form3115Deps30Data" /></xsl:call-template>  
  </xsl:param>
    
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title>
           <!--Financial Services Income Statement-->
          <xsl:value-of select="$depDocTitle" />
        </title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Author" content="Jessica Lee - jesslee@us.ibm.com" />
         <!--meta name="Description" content="Financial Services Income Statement" /-->
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
          <div class="styDepTitle" style="width:123mm">
            <!-- TY 2003 More Than One Trade or Business Statement-->  
            <xsl:value-of select="$depDocTitle" />            
          </div>
        </div>                
                
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$Form3115Deps30Data"/>
        </xsl:call-template>                    
                
        <table class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
          <thead class="styTableThead">        
            <tr class="styDepTblHdr">           
               <th class="styDepTblCell" scope="col">
                 Description of type of business
              </th>
               <th class="styDepTblCell" scope="col">
                 Overall method of accounting
              </th>
              <th class="styDepTblCell" scope="col">       
                Accounting method changed in past 4 years?
              </th>                
              <th class="styDepTblCell" scope="col">    
                Changed as part of this application? 
              </th>  
              <th class="styDepTblCell" scope="col">    
                Changed as part of separate application?
              </th>      
            </tr>
          </thead>  
          <tfoot></tfoot>
          <tbody>    
          <xsl:for-each select="$Form3115Deps30Data/TradeOrBusinessInfo">
            <tr>
              <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
              </xsl:attribute>                          
              <td class="styDepTblCell" align="left">            
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TypeOfBusiness" />
                </xsl:call-template>                                  
              </td>  
              <td class="styDepTblCell" align="left">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="OverallMethodOfAccounting" />
                </xsl:call-template>    
              </td>
              <td class="styDepTblCell">            
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="AcctMethodChangedInPast4Years" />
                </xsl:call-template>    
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="AcctMethodChangedInPast4Years" />
                </xsl:call-template>                                  
              </td>  
              <td class="styDepTblCell">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="ChangedAsPartOfThisApplication" />
                </xsl:call-template>  
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="ChangedAsPartOfThisApplication" />
                </xsl:call-template>    
              </td>
              <td class="styDepTblCell">            
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="ChangedAsPartOfSepApplication" />
                </xsl:call-template>    
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="ChangedAsPartOfSepApplication" />
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







