<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  <!-- IRS e-file Partnership Income Tax Schema - Schedule K-1 (1065) Section 59(e)(2) Expenditures Statement -->
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>  
  <xsl:param name="DependencyData" select="$RtnDoc/Section59e2ExpendituresStmt2"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
    <xsl:with-param name="TargetNode" select="$DependencyData"/>
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
         <meta name="Description" content="{$depDocTitle}"/>      
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript">
        </script>
        <xsl:call-template name="InitJS">
        </xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
      </head>
      <body class="styBodyClass">    
        <xsl:call-template name="DocumentHeaderDependency">
        </xsl:call-template>
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width: 180mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
           <!--Adding template for common left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
 <!--Section 59(e)(2) Expenditures Information Data -->
    <table class="styDepTbl">
      <thead class="styTableThead">
    <tr class="styDepTblHdr">
     <th class="styDepTblCell" style="width:70mm">Sect59e2 Expenditure Desc</th>       
     <th class="styDepTblCell" style="width:60mm">Property Information Txt</th>
<th class="styDepTblCell" style="width:57mm">Qualified Expenditures Amt</th>        
        </tr>
      </thead>
        <tfoot/>
       <tbody>
        <xsl:for-each select="$DependencyData/Section59e2ExpendituresGrp">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="width:70mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Sect59e2ExpenditureDesc"/>
              </xsl:call-template>                  
            </td>
            <td class="styDepTblCell" style="width:60mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PropertyInformationTxt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width:57mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="QualifiedExpendituresAmt"/>
              </xsl:call-template>
            </td>            
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
       <br/>               
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>