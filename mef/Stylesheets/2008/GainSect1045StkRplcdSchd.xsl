<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="DependencyData" select="$RtnDoc/GainSect1045StkRplcdSchd" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="GainSection1045StkReplScheduleTemp">
    <table id="GainSection1045StkReplScheduledTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
<!--          <th class="styTblCell" scope="col">Item No.</th>       -->

				<th class="styDepTblCell"  scope="col" style="width: 50mm;">Replacement Qualified Small Business Stock</th>
           		<th class="styDepTblCell"  scope="col" style="width: 50mm">Computation Adjustment</th>
           		<th class="styDepTblCell"  scope="col" style="width: 32mm">Date Replacement Stock Acquired</th>

        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/GainSection1045StkReplSchedule">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
<!--          <td class="styDepTblCell" style="text-align:center;" >


            <xsl:value-of select="position()" />
          </td> -->
         			<td class="styDepTblCell" style="text-align:left;" >
            			<xsl:call-template name="PopulateText">          
                		       <xsl:with-param name="TargetNode" select="RplcQualifiedSmallBusinessStk" />
           			    </xsl:call-template>
         			</td>   
         			<td class="styDepTblCell" style="text-align:left;" >
            			<xsl:call-template name="PopulateText">          
                 			<xsl:with-param name="TargetNode" select="ComputationOfAdjustment" />
            			</xsl:call-template>
          		    </td>         
         			<td class="styDepTblCell" style="text-align:left;" >
            			<xsl:call-template name="PopulateText">          
                		       <xsl:with-param name="TargetNode" select="DateRplcStkAcquired" />
           			    </xsl:call-template>
         			</td>            
 
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>


  
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
    
      <body class="styBodyClass">
      
      <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>        
    
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:86mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
        
         <div class="styTopSectionLine" style="width:187mm;"></div>
        <!-- Transform Controlled Foreign Partnership Reporting Statement -->
        <xsl:call-template name="GainSection1045StkReplScheduleTemp" />    

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







