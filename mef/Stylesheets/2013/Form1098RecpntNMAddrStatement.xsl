<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/Form1098RecpntNMAddrStatement" />
    
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/" >
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
            <span style="width:162mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
           <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <span style="height:5px;"></span>
        <xsl:call-template name="Form1098RecNameAddr" />
      </body>
    </html>
  </xsl:template>

  <!-- Template to display Additional Information for Recipient Name Address Statement -->
  <xsl:template name="Form1098RecNameAddr">
    <table id="Form1098RecNameAddrTbl" class="styDepTbl">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:58mm;width:auto;text-align:center;">
             Name Of Person Who Received 1098</th>
           <th class="styDepTblCell" scope="col" style="width:58mm;width:auto;text-align:center;">Address</th>
           </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$DependencyData/Form1098RecpntNMAddrStmt">
          <tr>
          <!-- Assign alternate rows the different colors -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!-- Column 1 -->
            <td class="styDepTblCell" style="text-align:left;width:58mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfPersonWhoReceived1098" />
                <xsl:with-param name="BackupName">Form1098RecpntNMAddrStmtNameOfPersonWhoReceived1098</xsl:with-param>
              </xsl:call-template>
            </td>
            <!-- Column 2 -->
            <td class="styDepTblCell" style="text-align:left;width:58mm;">
               <xsl:choose>
                  <xsl:when test="USAddress">
                     <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="USAddress" />
                     </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
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







