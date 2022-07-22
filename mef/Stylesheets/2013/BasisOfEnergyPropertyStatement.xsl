<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>  
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
    
  <xsl:param name="DependencyData" select="$RtnDoc/BasisOfEnergyPropertyStatement"/>
   
  <xsl:template name="ShowDependencyData">
    <table class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">      
           <th class="styDepTblCell" scope="col" style="width:152mm">2005 Property</th>
           <th class="styDepTblCell" scope="col" style="width:35mm">Amount</th>             
        </tr>
      </thead>
        <tfoot/>
       <tbody>
        <xsl:for-each select="$DependencyData/Property2005">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="width:152mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PropertyDescription"/>
              </xsl:call-template>
            </td> 
            <td class="styDepTblCell" style="width:35mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amount"/>
              </xsl:call-template>
            </td>         
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
    <br/>
    <table class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">      
           <th class="styDepTblCell" scope="col" style="width:152mm">2006 Property</th>
           <th class="styDepTblCell" scope="col" style="width:35mm">Amount</th>             
        </tr>
      </thead>
        <tfoot/>
       <tbody>
        <xsl:for-each select="$DependencyData/Property2006">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="width:152mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PropertyDescription"/>
              </xsl:call-template>
            </td> 
            <td class="styDepTblCell" style="width:35mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amount"/>
              </xsl:call-template>
            </td>         
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
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
          <span class="styDepTitle" style="width:102mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template> 

        <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left">
            <b>2005 Solar/geothermal energy property basis: </b>
          </div>
          <div class="styExplanationLine" style="float:left;text-align:right;width:42mm;"> <br/>         
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/SolarGthrmlEgyPropBasis2005Amt"/>
            </xsl:call-template>                  
          </div>                  
        </div>      
        
        <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left">
            <b>2006 Solar/geothermal energy property basis: </b>
          </div>
          <div class="styExplanationLine" style="float:left;text-align:right;width:42mm;">   <br/>       
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/SolarGthrmlEgyPropBasis2006Amt"/>
            </xsl:call-template>                  
          </div>                  
        </div>

        <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left">
            <b>2006 Qualified fuel cell property basis: </b>
          </div>
          <div class="styExplanationLine" style="float:left;text-align:right;width:42mm;"><br/>          
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/QlfyFuelCellPropBasis2006Amt"/>
            </xsl:call-template>                  
          </div>                  
        </div>      
        
        <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left">
            <b>Kilowatt capacity of qualified fuel cell property: </b>
          </div>
          <div class="styExplanationLine" style="float:left;text-align:right;width:42mm;"> <br/>         
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/CapacityQlfyFuelCellPropQty"/>
            </xsl:call-template>                  
          </div>                  
        </div>
        <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left">
            <b>2006 Qualified microturbine property basis: </b>
          </div>
          <div class="styExplanationLine" style="float:left;text-align:right;width:42mm;"> <br/>         
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/QlfyMicroturbinePropBss2006Amt"/>
            </xsl:call-template>                  
          </div>                  
        </div>      
        
        <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left">
            <b>Killowatt capacity of qualified microturbine property: </b>
          </div>
          <div class="styExplanationLine" style="float:left;text-align:right;width:42mm;"> <br/>         
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/CapQlfyMicroturbinePropQty"/>
            </xsl:call-template>                  
          </div>                  
        </div>







               
        <!--xsl:call-template name="ShowDependencyData" /-->          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>