<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/BadDebtStatement2"/>
  <xsl:param name="depDocTitle">
    <!--1040 Sch-D Dependency  - Difference In Gross Proceeds Reported Statement  -->
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
   <xsl:template name="BadDebtStatement2GrpTemp">  
    <table id="BadDebtStatement2Grp" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center">Description Of The Debt</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Date Debt Became Due</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Debtor Business Name</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Business Or Family Relationship </th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Efforts Made To Collect Debt</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Determine If Debt Was Worthless:</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
       <xsl:for-each select="$DependencyData/BadDebtStatement2Grp">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="width:50mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DescriptionOfTheDebt" />
              </xsl:call-template>            
            </td>
          <td class="styDepTblCell" style="width:27mm;text-align:right;" >
			  <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="Amt" /></xsl:call-template>  
          </td>
          <td class="stydepTblCell" style="width:30mm;text-align:center;">
          	<xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="DateDebtBecameDue" />
                </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:50mm;text-align:left;"> 
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DebtorBusinessName/BusinessNameLine1Txt" />
              </xsl:call-template>     
          <br/>
                 <xsl:if test="DebtorBusinessName/BusinessNameLine2Txt">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DebtorBusinessName/BusinessNameLine2Txt" />
              </xsl:call-template>     
                       </xsl:if>    
                </td>
          <td class="stydepTblCell" style="text-align:left;width:27mm;">  
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessOrFamilyRelationship" />
                </xsl:call-template>      
                        </td>
            <td class="stydepTblCell" style="text-align:left;width:27mm;">         
                  <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="EffortsMadeToCollectDebt" />
                </xsl:call-template>     
          </td>
           <td class="stydepTblCell" style="text-align:left;width:27mm;">         
                  <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="WhyDcsnWasMadeDebtWasWorthless" />
                </xsl:call-template>     
          </td>
        </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
    <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
      <xsl:call-template name="DocumentHeaderDependency">
      </xsl:call-template>  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:150mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
        </xsl:call-template>                
        <xsl:call-template name="BadDebtStatement2GrpTemp" />    
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
