<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
    
  <xsl:param name="DependencyData" select="$RtnDoc/AssigneeRailroadTrackMilesStmt" />
  <!-- The name of the dependency Assignee Railroad Track Miles Statement -->
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="AssignRRTrkMls">
    <table id="DeMinimisExceptionElectionTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="padding-top:10mm;">Name</th>
           <th class="styDepTblCell"  scope="col" style="padding-top:10mm;">EIN</th>
           <th class="styDepTblCell"  scope="col" style="padding-top:10mm;">Mileage</th>
           <th class="styDepTblCell"  scope="col">Total number of miles of the assignors eligible railroad track</th>
           <th class="styDepTblCell"  scope="col">Total number of miles of eligible railroad track assigned by the assignor</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/AssigneeRailroadTrackMiles">
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
            <xsl:choose>
              <xsl:when test="Name/BusinessNameLine1Txt !=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1Txt" />
                </xsl:call-template>
                <xsl:if test="Name/BusinessNameLine2Txt !=''">
                <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2Txt" />
                  </xsl:call-template>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name" />
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>    
          </td>          
          <td class="styDepTblCell" style="text-align:center;width:21mm" >
                 <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="EIN" />
                </xsl:call-template>
          </td>

          <td class="styDepTblCell" style="text-align:center;width:33mm" >
                 <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Mileage" />
                </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:center;width:33mm" >
                 <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotAssignorsEligibleRlrdTrack" />
                </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:center;width:33mm" >
               <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="TargetNode" select="TotRlrdTrackAssignedByAssignor" />
               </xsl:call-template>
          </td>
      
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
    
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
         <meta name="Author" content="Venkata Boggavarapu:: boggav@us.ibm.com" />
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
            <span style="width:110mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>

        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
        <xsl:call-template name="AssignRRTrkMls" />          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







