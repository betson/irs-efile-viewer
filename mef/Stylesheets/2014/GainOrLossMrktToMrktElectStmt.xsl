<?xml version="1.0" encoding="UTF-8" ?>
<!-- 06/18/2014 - Created new dependency file per UWR #107675 - Jeremy Nichols -->
<!-- 06/11/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 09/09/2015 - Changes made for defect 44130 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="AOVSSData" select="$RtnDoc/GainOrLossMrktToMrktElectStmt" />
    <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$AOVSSData" />
    </xsl:call-template>  
  </xsl:param>

  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
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
        <meta name="Author" content="Chris Sinderson" />
        <meta name="Description" content= "{$depDocTitle}" /> 
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
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
        <div class="styDepTitleLine" style="width:187mm">
          <span class="styDepTitle" style="width:187mm">          
            <xsl:value-of select="$depDocTitle" />  
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$AOVSSData" />
        </xsl:call-template>      
        
        <xsl:call-template name="ShowAOVSS" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
  
  <!-- Template for the Table of Data -->
  <xsl:template name="ShowAOVSS">
    <table id="AOVSSTbl" class="styDepTbl">
      <thead class="styTableThead">
        <!-- Label the Column Headers -->
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">FMV Stock On Date Sale Or Dispose Amount</th>        
          <th class="styDepTblCell" scope="col">Adjusted Basis Stock On Date Sale Or Dispose Amount</th>  
          <th class="styDepTblCell" scope="col">Unreversed Inclusions Amount</th>  
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>    
        <xsl:for-each select="$AOVSSData/GainOrLossMrktToMrktElectGrp">  
          <tr>
            <!-- Define background colors to the rows -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!-- First Column -->
            <td class="styDepTblCell" style="text-align:right;width:62mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="FMVStkOnDtSaleOrDisposAmt" />
              </xsl:call-template>
            </td>  
            <!-- Second Column -->
            <td class="styDepTblCell" style="text-align:right;width:62mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="AdjBasisStkOnDtSaleOrDisposAmt" />
              </xsl:call-template>
            </td>
            <!-- Third Column -->
            <td class="styDepTblCell" style="text-align:right;width:62mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="UnreversedInclusionsAmt" />
              </xsl:call-template>
            </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
</xsl:stylesheet>
