<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/TransfersFrmControlledEntities"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>  

  <xsl:template name="TransFrmCntrlEntScheduleTemp">
    <table id="TransFrmCntrlEntTbl" class="styDepTbl" style="font-size: 6pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="font-size:10 pt;">Name</th>
          <th class="styDepTblCell" scope="col" style="font-size:8 pt;">US / <br/> Foreign Address</th>
          <th class="styDepTblCell" scope="col" style="font-size:10 pt;">EIN</th>
          <th class="styDepTblCell" scope="col" style="font-size:10 pt;">Description</th>
          <th class="styDepTblCell" scope="col" style="font-size:10 pt;">Amount</th>
 <!--         <th class="styDepTblCell"  scope="col" style="font-size:10 pt;">Total</th> -->
        </tr>
      </thead>
      
      <xsl:for-each select="$DependencyData/TransfersFromControlledEntGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:left;width:22mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <xsl:if test="BusinessName/BusinessNameLine2Txt  != ' ' ">
                <br/><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </xsl:if>
            </td>
          <td class="styDepTblCell" style="text-align:right;width:28mm;">
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
            </td>
           <td class="styDepTblCell" style="text-align:right;width:14mm">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="EIN"/>
            </xsl:call-template>
          </td>          
          <td class="styDepTblCell" style="text-align:left;width:24mm">
            <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="Desc"/>
            </xsl:call-template>             
          </td>          
          <td class="styDepTblCell" style="text-align:right;width:16mm">
            <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="TargetNode" select="Amt"/>
            </xsl:call-template>
         </td>          
         </tr>
       </xsl:for-each>
         
          <tr class="styDepTblHdr">
            <td class="styDepTblCell" colspan="2" style="text-align:left;font-size:10pt;font-weight:bold;width:30mm">
            Total
            </td>
            
            <td class="styDepTblCell" style="text-align:right;width:20mm">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="WhiteFont">true</xsl:with-param>
            <xsl:with-param name="TargetNode" select="Dummy1"/>
            </xsl:call-template>
          </td>   

            <td class="styDepTblCell" style="text-align:right;width:20mm">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="WhiteFont">true</xsl:with-param>
            <xsl:with-param name="TargetNode" select="Dummy2"/>
            </xsl:call-template>
          </td>   
        
         <td class="styDepTblCell" style="text-align:right;width:16mm">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="WhiteFont">true</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$DependencyData/TotalAmt"/>
            </xsl:call-template>
          </td>   
       </tr>
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
      <meta name="Author" content="Beju Ekperigin"/>
      <meta name="Desc" content="{$depDocTitle}"/>
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
        <span class="styDepTitle">
          <span style="width:70mm;"><xsl:value-of select="$depDocTitle"/></span>
        </span>
      </div>
      <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
      </xsl:call-template>      
      <xsl:call-template name="TransFrmCntrlEntScheduleTemp"/>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>