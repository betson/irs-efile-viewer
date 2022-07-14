<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/Owned50PercentVotingStockStmt2"/>
  
  <!-- Template to display Owned 50 Percent Voting Stock of Domestic Corporation Statement2 -->
  <xsl:template name="DependencyTemplate">  
    <table id="O50VTbl" class="styDepTbl">    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" scope="col" style="width:51mm;">Name </th>        
          <th class="styDepTblCell" scope="col" style="width:52mm;">Address </th>  
          <th class="styDepTblCell" scope="col" style="width:24mm;">EIN </th>        
          <th class="styDepTblCell" scope="col" style="width:24mm;">Percentage owned </th>
          <th class="styDepTblCell" scope="col" style="width:36mm;">100% Owned Sub Ql Election </th>                            
        </tr>
      </thead>
        <tfoot/>
        
       <tbody>    
        <xsl:for-each select="$DependencyData/Owned50PercentVotingStock">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>  
            
            <td class="styDepTblCell" style="text-align:center;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ShareholderName/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="ShareholderName/BusinessNameLine2 != ''">
                <br/><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="ShareholderName/BusinessNameLine2"/>
                  </xsl:call-template>
              </xsl:if>            
            </td>
            
            <td class="styDepTblCell" style="text-align:center;text-align:left;">
            <xsl:choose>
              <xsl:when test="USAddress">
               <xsl:call-template name="PopulateUSAddressTemplate">
                    <xsl:with-param name="TargetNode" select="USAddress"/>
               </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
               <xsl:call-template name="PopulateForeignAddressTemplate">
                    <xsl:with-param name="TargetNode" select="ForeignAddress"/>
               </xsl:call-template>
             </xsl:otherwise>
            </xsl:choose>
<!--
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Address/AddressLine1" />
              </xsl:call-template>
              <xsl:if test="Address/AddressLine2 != ''">
                <br /><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="Address/AddressLine2" />                      </xsl:call-template>
                  </xsl:if>
              <xsl:if test="Address/City != ''"><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Address/City" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="Address/State != ''">, <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Address/State" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="Address/ZIPCode != ''">- 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Address/ZIPCode" />
                </xsl:call-template>
              </xsl:if>-->
            </td>
            
            <td class="styDepTblCell" style="text-align:cente;">
             <xsl:choose>
            <xsl:when test="EIN">
                       <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="EIN"/>
                      </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                    </xsl:call-template>
                    </xsl:otherwise>
               </xsl:choose>
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">          
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="OwnedRt"/>
              </xsl:call-template>            
            </td>
            
            <td class="styDepTblCell" style="text-align:center;">
            	<xsl:call-template name="PopulateSpan">
              		<xsl:with-param name="TargetNode" select="Owned100PercentSubQlElectInd"/>
            	</xsl:call-template>
            	<input type="checkbox" class="styCkbox">
              		<xsl:call-template name="PopulateYesCheckbox">
                		<xsl:with-param name="TargetNode" select="Owned100PercentSubQlElectInd"/>
              		</xsl:call-template>
            	</input>
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
          <span class="styDepTitle" style="width:142mm;">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>        
              
        <xsl:call-template name="DependencyTemplate"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>