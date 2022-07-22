<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="DependencyData" select="$RtnDoc/IncmInclusionsOrGrossUpSectSch" />

<xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
</xsl:param>

<!-- Template to display AllowedLossUnderTempRegsStmt -->
<xsl:template name="IncmInclusionsOrGrossUpSectSchTemp">
    <table id="IncmInclusionsOrGrossUpSectSchTbl" class="styDepTblLandscape" style="font-size: 6pt;font-family:'verdana' ">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="width:47mm">Name</th>
           <th class="styDepTblCell"  scope="col" style="width:47mm">Type of Entity</th>
           <th class="styDepTblCell"  scope="col" style="width:20mm">EIN</th>    
           <th class="styDepTblCell"  scope="col" style="width:25mm">Temporary Difference Amount</th>    
           <th class="styDepTblCell"  scope="col" style="width:25mm" >Permanent Difference Amount</th>
           <th class="styDepTblCell"  scope="col" style="width:25mm">Income (Loss) per Tax Return Amount</th>
    
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/IncmInclusionsGrossUpSectInfo">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
           <td class="styDepTblCell" style="text-align:left;width:47mm" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1" />
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">          
              <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left;width:47mm;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="TypeOfEntity" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:center;width:20mm" >
          <xsl:choose>
            <xsl:when test="EIN">
                       <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="EIN" />
                      </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="MissingEINReason" />
                    </xsl:call-template>
                    </xsl:otherwise>
               </xsl:choose>
          </td>
     
         <td class="styDepTblCell" style="text-align:right;width:25mm;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmount" />
            </xsl:call-template>
          </td>
       <td class="styDepTblCell" style="text-align:right;width:25mm;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="PermanentDifferenceAmount" />
            </xsl:call-template>
          </td>
         <td class="styDepTblCell" style="text-align:right;width:25mm;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmount" />
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
       <meta name="Author" content="Polina Zhuravlev: zhuravle@us.ibm.com" />
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

      <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>
      
      <div class="styDepTitleLineLandscape">
        <span class="styDepTitle">
          <span style="width:100mm;">        
            <xsl:value-of select="$depDocTitle" />
          </span>        
        </span>
      </div>
        
      <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
      </xsl:call-template>
        
      <xsl:call-template name="IncmInclusionsOrGrossUpSectSchTemp" />
      <br/>                      
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>







