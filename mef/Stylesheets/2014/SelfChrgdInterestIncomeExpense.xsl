<?xml version="1.0" encoding="UTF-8"?>
<!-- This form by Doug Peterson 6-19-2006 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <!--IRS e-file Partnership Income Tax Schema - Self Charged Interest Income Expense-->
  <xsl:param name="DependencyData" select="$RtnDoc/SelfChrgdInterestIncomeExpense"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
    <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>
  <!-- Main template Defined-->
  <xsl:template name="SelfChrgdInterestIncomeExpenseTemp">
    <table id="SelfChrgdInterestIncomeExpenseTbl" class="styDepTbl" style="font-size:7pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:150mm">Activity Related to Self Charge Interest</th>
           <th class="styDepTblCell" scope="col" style="width:34mm">Interest Income or Expense with Respect to Each Activity</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/SelfChargedInterestGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:left;width:150mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ActivityExplanationTxt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:34mm">
            <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="TargetNode" select="Amt"/>
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
         <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Venkata Boggavarapu :: boggav@us.ibm.com"/>
         <meta name="Description" content="{$depDocTitle}"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript">
        </script>
        <xsl:call-template name="InitJS">
        </xsl:call-template>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle">
    </xsl:call-template>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass">
      <xsl:call-template name="DocumentHeaderDependency">
      </xsl:call-template>  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:107mm;">
            <xsl:value-of select="$depDocTitle"/>
            </span>  
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>        
        <div style="height:20px;">
        </div>          
        <xsl:call-template name="SelfChrgdInterestIncomeExpenseTemp"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>