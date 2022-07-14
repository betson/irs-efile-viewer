<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="AOVSSData" select="$RtnDoc/Section743bBasisAdjStatement"/>
    <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$AOVSSData"/>
    </xsl:call-template>  
  </xsl:param>

  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:value-of select="$depDocTitle"/>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Author" content="Chris Sinderson"/>
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
          <span class="styDepTitle" style="width:98mm">          
            <xsl:value-of select="$depDocTitle"/>  
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$AOVSSData"/>
        </xsl:call-template>      
        
        <xsl:call-template name="ShowAOVSS"/>          
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
          <th class="styDepTblCell" scope="col">Name of the transferee partner</th>        
          <th class="styDepTblCell" scope="col">Identifying number of transferee partner</th>  
          <th class="styDepTblCell" scope="col">Computation of adjustment</th>        
          <th class="styDepTblCell" scope="col">Partnership properties to which the adjustment has been allocated</th>        
        </tr>
      </thead>
      <tfoot/>
      <tbody>    
        <xsl:for-each select="$AOVSSData/Section743bBasisAdjItemGrp">  
          <tr>
            <!-- Define background colors to the rows -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!-- First Column -->
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="MaxSize" select="3"/>
                <xsl:with-param name="TargetNode" select="TransfereePartnerName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="MaxSize" select="3"/>
                <xsl:with-param name="TargetNode" select="TransfereePartnerName/BusinessNameLine2"/>
              </xsl:call-template>

            </td>  
            <!-- Second Column -->
            <td class="styDepTblCell" style="text-align:center;width:33mm;">
              
               <xsl:if test="$AOVSSData/Section743bBasisAdjItemGrp/SSN != '' ">
                <xsl:call-template name="PopulateSSN">
                	<xsl:with-param name="TargetNode" select="SSN"/>
                	 </xsl:call-template>
                </xsl:if>
                <xsl:if test="$AOVSSData/Section743bBasisAdjItemGrp/EIN != '' ">
                <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="EIN"/>
                </xsl:call-template>
                </xsl:if>
              
            </td>
            <!-- Third Column -->
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ComputationAdjustmentTxt"/>
              </xsl:call-template>
            </td>
            <!-- Fourth Column -->
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PartnershipPropExplanationTxt"/>
              </xsl:call-template>
            </td>        
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
</xsl:stylesheet>