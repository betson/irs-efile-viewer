<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/F1098RecpntNmTINAddrStatement" />
    
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/" >
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
         <meta name="Description" content="{$depDocTitle}" />
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        
        <style type="text/css">
        </style>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
    </head>    
    <body class="styBodyClass">
      <xsl:call-template name="DocumentHeaderDependency" />  
      <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:187mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
           <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <span style="height:5px;"></span>
        <xsl:call-template name="F1098RecpntNmTINAddrStmt" />
      </body>
    </html>
  </xsl:template>

  <!-- Template to display Additional Information for Recipient Name Address Statement -->
  <xsl:template name="F1098RecpntNmTINAddrStmt">
    <table id="F1098RecpntNmTINAddrStmtTbl" class="styDepTbl">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:50mm;text-align:center;">
             Name Of Person Who Received 1098</th>
           <th class="styDepTblCell" scope="col" style="width:30mm;text-align:center;">Identifying Number</th>
           <th class="styDepTblCell" scope="col" style="width:70mm;text-align:center;">Address</th>
           </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$DependencyData/F1098RecpntNmTINAddrStmt">
          <tr>
          <!-- Assign alternate rows the different colors -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!-- Column 1 -->
 			<!-- Name of Person Who Received Form 1098 -->
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfRecipient" />
                <xsl:with-param name="BackupName">Form1098RecpntNmTINAddrStmtNameOfRecipient</xsl:with-param>
              </xsl:call-template>
            </td>
            <!-- Column 2 -->
            <td class="styDepTblCell" style="text-align:center;">
               <xsl:choose>
                  <xsl:when test="IdentifyingNumberEIN">
 				<!-- US Address -->
                     <xsl:call-template name="PopulateEIN">
                        <xsl:with-param name="TargetNode" select="IdentifyingNumberEIN" />
                     </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
 				<!-- Foreign Address -->
                     <xsl:call-template name="PopulateSSN">
                        <xsl:with-param name="TargetNode" select="IdentifyingNumberSSN" />
                     </xsl:call-template>
                  </xsl:otherwise>
               </xsl:choose>
            </td>
            <!-- Column 3 -->
            <td class="styDepTblCell" style="text-align:left;">
               <xsl:choose>
                  <xsl:when test="USAddress">
 				<!-- US Address -->
                     <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="USAddress" />
                     </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
 				<!-- Foreign Address -->
                     <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="ForeignAddress" />
                     </xsl:call-template>
                  </xsl:otherwise>
               </xsl:choose>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
</xsl:stylesheet>







