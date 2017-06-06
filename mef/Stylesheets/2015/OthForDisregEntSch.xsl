<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 
   <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
   <xsl:include href="AddOnTable.xsl"/>  

 <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>  
  
    
  <xsl:param name="DependencyData" select="$RtnDoc/OthForDisregEntSch"/>
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
   <xsl:with-param name="TargetNode" select="$DependencyData"/>
   </xsl:call-template>  
   </xsl:param>
  <!-- Template to display OtherForeignDisregardedEntitySchedule  -->
  
  <xsl:template name="OtherForeignDisregardedEntitySchedule">
    <!-- OtherForeignDisregardedEntitySchedule -->
    <table class="styDepTbl">

      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:51mm">Name</th>        
           <th class="styDepTblCell" scope="col" style="width:16mm">EIN</th>
           <th class="styDepTblCell" scope="col" style="width:30mm">Net Income (Loss) Amount</th>
           <th class="styDepTblCell" scope="col" style="width:30mm">Total Assets</th>
           <th class="styDepTblCell" scope="col" style="width:30mm">Total Liabilities</th>
           <th class="styDepTblCell" scope="col" style="width:30mm">Net Amounts</th>            
        </tr>
      </thead>
        <tfoot/>
       <tbody>
        <xsl:for-each select="$DependencyData/PrtshpOthFrgnDisregardedEntGrp">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="width:51mm;text-align:left;font-size:7pt">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <xsl:if test="BusinessName/BusinessNameLine2Txt !=''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                </xsl:call-template>
            </xsl:if>                
            </td>
            <td class="styDepTblCell" style="width:20mm;text-align:center;font-size:7pt">
            <xsl:if test="EIN">
                   <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="EIN"/>
                    </xsl:call-template>
              </xsl:if>
            <xsl:if test="MissingEINReasonCd">
                   <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                    </xsl:call-template>
              </xsl:if>
            </td> 
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="NetIncomeLossAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalAssetsAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalLiabilitiesAmt"/>
              </xsl:call-template>
            </td>  
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="NetAmt"/>
              </xsl:call-template>
            </td>                                  
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  
 
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <title><xsl:value-of select="$depDocTitle"/></title>

         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
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
          <span class="styDepTitle" style="width:118mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>      
              </div>
	          <div class="styTopSectionLine">
	            <xsl:call-template name="SetFormLinkInline">
	              <xsl:with-param name="TargetNode" select="$DependencyData"/>
	            </xsl:call-template>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
              <xsl:with-param name="TargetNode" select="$DependencyData"/>
        	<xsl:with-param name="NoGap" select="'true'"/>
        </xsl:call-template>                
        <xsl:call-template name="OtherForeignDisregardedEntitySchedule"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>