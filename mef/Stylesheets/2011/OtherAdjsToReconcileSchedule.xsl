<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" /> 
   <xsl:param name="DependencyData" select="$RtnDoc/OtherAdjsToReconcileSchedule" />
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  <xsl:template name="OtherAdjustmentsToReconcileSchTable2">
  <!-- Updated 9/22/2011 RLW -->
    <table  class="styDepTbl" style="font-size: 7pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center;width:57mm;">Name</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center;width:25mm;">EIN</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center;width:42mm;">Nature of Adjustment </th>
           <th class="styDepTblCell"  scope="col" style="text-align:center;width:32mm;">Net Income Part I Before Adjustment</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center;width:32mm;">Net Income Included Part 1 Amount</th>
        </tr>
      </thead>      
      <tbody>                   
       <xsl:for-each select="$DependencyData/OtherAdjsToReconcileInfo">     
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
           <!-- Name -->
          <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1" />
              </xsl:call-template>            
              <xsl:if test="Name/BusinessNameLine2 != ''">
                <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>
            </td>
    <!-- EIN -->
          <td class="stydepTblCell" style="text-align:center;">
            <span style="width:21mm;text-align:center;">
                 <xsl:choose>
            		   <xsl:when test="normalize-space(EIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="EIN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"></span>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="MissingEINReason"/>
		            </xsl:call-template>    
		           <span style="width: 2px"></span>
	          </xsl:otherwise>   
          </xsl:choose>
            </span>
          </td>
<!--NatureOfAdjustment -->         
          <td class="stydepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NatureOfAdjustment" />
                </xsl:call-template>
          </td> 
<!-- NetIncomePart1BeforeAdj  -->         
          <td class="stydepTblCell" style="text-align:right;">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NetIncomePart1BeforeAdj" />
                </xsl:call-template>
          </td> 
<!-- NetIncomeIncludedPartIAmt  -->         
          <td class="stydepTblCell" style="text-align:right;">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NetIncomeIncludedPartIAmt" />
                </xsl:call-template>
          </td> 
         </tr>
      </xsl:for-each>
      </tbody>
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
         <meta name="Author" content="Trin Xue" />
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
            <span style="width:90mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div><xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" />
        </xsl:call-template>               
       <xsl:call-template name="OtherAdjustmentsToReconcileSchTable2" />  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

