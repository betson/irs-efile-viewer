<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/MultipleBuildingProjectSch" />
      <xsl:template name="DependencyTemplate">
    <table id="MBPSTbl" class="styDepTblLandscape" style="font-size:7.5pt;">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col">Item No.</th-->
           <th class="styDepTblCell" scope="col">Name of Project and Each Building</th>
           <th class="styDepTblCell" scope="col">Address of Project and Each Building</th>
           <th class="styDepTblCell" scope="col" style="width:30mm;">Building Identification Number for Each Building in the Project
            </th>
           <th class="styDepTblCell" scope="col" style="width:40mm;">Aggregate Credit Dollar Amount for the Project</th>
           <th class="styDepTblCell" scope="col" style="width:40mm;">Credit Allocated to Each Building in the Project</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$DependencyData/Schedule">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <!--td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()" /></td-->        
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfProjectAndEachBuilding"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:choose>
          		<xsl:when test="USAddressOfProjAndEachBldg">
               		<xsl:call-template name="PopulateUSAddressTemplate">
                    		<xsl:with-param name="TargetNode" select="USAddressOfProjAndEachBldg"/>
              		 </xsl:call-template>
          		</xsl:when>
          		<xsl:otherwise>
               		<xsl:call-template name="PopulateForeignAddressTemplate">
                    		<xsl:with-param name="TargetNode" select="FRGNAddressOfProjAndEachBldg"/>
               		</xsl:call-template>
         		 </xsl:otherwise>
     		</xsl:choose>
            </td>
            <td class="styDepTblCell" style="text-align:left;width:30mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BuildingIdNumForEachBuilding" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:40mm;" nowrap="nowrap">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ProjectAggregateCrDollarAmount" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:40mm;" nowrap="nowrap">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CreditAllocatedToEachBuilding" />
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
   
    <xsl:template name="GetClass">
    <xsl:attribute name="class">
      <xsl:choose>
         <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
         <xsl:otherwise>styDepTblRow2</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

  
  
  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
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

        <xsl:call-template name="DocumentHeaderDependencyLandscape" />
        <div class="styDepTitleLineLandscape">

          <span class="styDepTitle">
            <span style="width:97mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"></span>
        <xsl:call-template name="DependencyTemplate" >
        </xsl:call-template>  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







