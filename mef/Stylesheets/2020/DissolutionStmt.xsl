<?xml version="1.0" encoding="UTF-8"?>
<!-- By Robert Jones 09/14/2006 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>  
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
    
  <xsl:param name="DependencyData" select="$RtnDoc/DissolutionStmt"/>
  
  <!-- Template to display Additional Information For Each Equity Schedule -->
  
  <xsl:template name="ShowDependencyData">
    <!-- Additional Information For Each Equity Schedule Data -->
    <table class="styDepTbl" style="font-size:6pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:53mm">Dissolution Name</th>        
           <th class="styDepTblCell" scope="col" style="width:53mm">Dissolution Address</th>
           <th class="styDepTblCell" scope="col" style="width:49mm">Explanation</th>        
           <th class="styDepTblCell" scope="col" style="width:32mm">Dissolution Amount</th>
              
        </tr>
      </thead>
        <tfoot/>
       <tbody>
        <xsl:for-each select="$DependencyData/DissolutionInformationGrp">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="text-align:left">
             <xsl:if test="BusinessName/BusinessNameLine1Txt != ''">
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
                  </xsl:call-template>
              </xsl:if>
              
              <xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
               <br/> <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
              </xsl:if>

              
               <xsl:if test="PersonNm != ''">
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="PersonNm"/>
                  </xsl:call-template>
              </xsl:if>
            </td>
            
<td class="styDepTblCell" style="text-align:left">
                <xsl:if test="USAddress!= ''">
                <xsl:call-template name="PopulateUSAddressTemplate">
                    <xsl:with-param name="TargetNode" select="USAddress"/>
                  </xsl:call-template>
              </xsl:if>
              <xsl:if test="ForeignAddress!= ''">
                <xsl:call-template name="PopulateForeignAddressTemplate">
                    <xsl:with-param name="TargetNode" select="ForeignAddress"/>
                  </xsl:call-template>
              </xsl:if>

            </td>

                <td class="styDepTblCell" style="text-align:left">
               
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
                  </xsl:call-template>
              </td>
              
              <td class="styDepTblCell" style="text-align:right">
               <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DissolutionAmt"/>
                  </xsl:call-template>
              </td>


            <!--
            <td class="styDepTblCell" style="width:44mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Name"/>
              </xsl:call-template>                  
            </td>
            <td class="styDepTblCell" style="width:44mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="EntityType"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell"  style="width:15mm;text-align:center">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="EIN"/>
              </xsl:call-template>
            </td>    
            <td class="styDepTblCell" style="width:21mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmount"/>
              </xsl:call-template>
            </td>   
            <td class="styDepTblCell" style="width:21mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmount"/>
              </xsl:call-template>
            </td>  
            <td class="styDepTblCell" style="width:21mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PermanentDifferenceAmount"/>
              </xsl:call-template>
            </td>  
            <td class="styDepTblCell" style="width:21mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmount"/>
              </xsl:call-template>
            </td>  
            -->       
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
          <span class="styDepTitle" style="width:74mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>                
        <xsl:call-template name="ShowDependencyData"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>