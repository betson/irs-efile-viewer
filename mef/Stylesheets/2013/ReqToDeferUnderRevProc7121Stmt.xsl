<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="Form3115Deps44Data" select="$RtnDoc/ReqToDeferUnderRevProc7121Stmt" />
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$Form3115Deps44Data" />
    </xsl:call-template>  
  </xsl:param>
      
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
          <div class="styDepTitle" style="width:80mm">
            <xsl:value-of select="$depDocTitle" />
            <!--TY 2003 Request to Defer Advance Payment Under Rev Proc 71-21 Statement-->    
          </div>
        </div>        
        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$Form3115Deps44Data"/>
        </xsl:call-template>    
        
        <xsl:call-template name="ShowForm3115Deps44" />          
        
      </body>
    </html>
  </xsl:template>
  
    <!-- Template for the Table of Data -->
  <xsl:template name="ShowForm3115Deps44">
    <table id="Form3115Deps44Tbl" class="styDepTbl">
      <thead class="styTableThead">
        <!-- Label the Column Headers -->
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Explanation whether the obligation to provide parts or materials is incidental to an agreement providing for the performance of personal services.</th>        
          <th class="styDepTblCell" scope="col">Explanation of Contingent Service Contracts</th>  
          <th class="styDepTblCell" scope="col">Description of the Method</th>        
          <th class="styDepTblCell" scope="col">Explanation of how the method to determine the amount of gross receipts each year will be no less than the amount included in gross receipts for purposes of its books and records </th>        
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>    
        <xsl:for-each select="$Form3115Deps44Data/ReqToDeferUnderRevProc7121Info">  
          <tr>
            <!-- Define background colors to the rows -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!-- First Column -->
            <td class="styDepTblCell" style="text-align:left;width:50mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ObligProvPartsOrMaterialsExpln" />
              </xsl:call-template>
            </td>  
            <!-- Second Column -->
            <td class="styDepTblCell" style="text-align:left;width:50mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ExplnOfContingentSrvcContracts" />
              </xsl:call-template>
            </td>
            <!-- Third Column -->
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DescriptionOfMethod" />
              </xsl:call-template>
            </td>
            <!-- Fourth Column -->
            <td class="styDepTblCell" style="text-align:left;width:50mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="MethodToDetermineAmountExpln" />
              </xsl:call-template>
            </td>        
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
</xsl:stylesheet>







