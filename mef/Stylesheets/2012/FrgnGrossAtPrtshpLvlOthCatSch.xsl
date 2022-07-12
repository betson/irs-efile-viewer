<?xml version="1.0" encoding="UTF-8" ?>
<!-- This form by Doug Peterson 6-15-2006 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="WRPPData" select="$RtnDoc/FrgnGrossAtPrtshpLvlOthCatSch" />
  <!--CorporateIncomeTax/Common/Dependencies/ForeignGrossIncomeAtPartnershipLevelOtherCategoriesSchedule.xsd-->
    <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$WRPPData" />
    </xsl:call-template>  
  </xsl:param>

  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="$depDocTitle" />
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Cache-Control" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private" />
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <meta name="Author" content="Chris Sinderson" />
        <meta name="Description" content= "{$depDocTitle}" /> 
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"></xsl:call-template>
        
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
        
        <xsl:call-template name="GlobalStylesDep"/>
      </head>    

      <body class="styBodyClass" >
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:180mm">          
            <xsl:value-of select="$depDocTitle" />  
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$WRPPData" />
        </xsl:call-template>      
        
        <xsl:call-template name="ShowWRPP" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
  
  <!-- Template for the Table of Data -->
  <xsl:template name="ShowWRPP">
    <table id="WRPPTbl" class="styDepTbl">
      <thead class="styTableThead">
        <!-- Label the Column Headers -->
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:130mm">Description</th> 
            <th class="styDepTblCell" scope="col" style="width:57mm">Amount</th>           
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>    
        <xsl:for-each select="$WRPPData/OtherCategories">  
          <tr>
            <!-- Define background colors to the rows -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!-- First Column -->
            <td class="styDepTblCell" style="text-align:left;width:130mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Description" />
              </xsl:call-template>
            </td>  
            <td class="styDepTblCell" style="text-align:right;width:57mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amount" />
              </xsl:call-template>
            </td>  

          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
</xsl:stylesheet>
