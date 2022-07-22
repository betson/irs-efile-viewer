<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
    
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  

  <xsl:param name="AdjLongTermData" select="$RtnDoc/AdjLTContractsSimplifiedK1Sch"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$AdjLongTermData"/></xsl:call-template>  
  </xsl:param>

<!-- Template to display Retained earnings-appropriated schedule Data -->

<!-- count($DependencyData/RetainedEarnings/RetainedEarningLineItem) is rowcount for inner loop; so add 1 to account for additional row in outer loop -->
<xsl:template name="AdjLongTermContractsFromK1SchTemp">
    <table id="AdjLongTermContractsFromK1SchTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Entity Name</th>
          <th class="styDepTblCell" scope="col">1. Year identifier</th>
          <th class="styDepTblCell" scope="col">2. Adjustment from <br/>K-1</th>
          <th class="styDepTblCell" scope="col">3. Net adjustment to income from long-term contracts</th>
        </tr>
       </thead>
        <tfoot/>
        <tbody>
        <xsl:for-each select="$AdjLongTermData/AdjLongTermContractsK1Grp">  
          <tr style="page-break-inside:avoid">
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col" style="text-align:left;font-size: 7pt;">
              <xsl:attribute name="rowspan">
              <xsl:value-of select="count(PYLongTermContractsFromK1Grp/PYScheduleK1YearlyInfoGrp)"/>
              </xsl:attribute>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <xsl:if test="EntityName/BusinessNameLine2Txt">
                <br/>
                <xsl:call-template name="PopulateText">          
                  <xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </xsl:if>
            </td>
            <!-- Test for no data or only one instance of data - if, then fill the cell with the proper color -->
            <xsl:if test="count(PYLongTermContractsFromK1Grp)=0 or count (PYLongTermContractsFromK1Grp)=1">
              <td class="styDepTblCell" scope="col" style="text-align:center;font-size: 7pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PYLongTermContractsFromK1Grp/Yr"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 40mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContractsFromK1Grp/PYScheduleK1YearlyInfoGrp/PYAdjustmentAmt"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 40mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContractsFromK1Grp/PYScheduleK1YearlyInfoGrp/PYNetAdjToIncmAmt"/>
                </xsl:call-template>
              </td>
            </xsl:if>  
            <!-- If there is more than one set of data, show the first set with Row 1 background -->
            <xsl:if test="count(PYLongTermContractsFromK1Grp)&gt;1 or count(PYLongTermContractsFromK1Grp/PYScheduleK1YearlyInfoGrp)&gt;1">                        <!-- If there is more than one instance of data, fill the first cell with dark blue -->
              <td class="styDepTblRow1Cell" scope="col" style="text-align:center;font-size: 7pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PYLongTermContractsFromK1Grp/Yr"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblRow1Cell" scope="col" style="text-align:right;font-size: 7pt; width: 40mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContractsFromK1Grp/PYScheduleK1YearlyInfoGrp/PYAdjustmentAmt"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblRow1Cell" scope="col" style="text-align:right;font-size: 7pt; width: 40mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContractsFromK1Grp/PYScheduleK1YearlyInfoGrp/PYNetAdjToIncmAmt"/>
                </xsl:call-template>
              </td>
            </xsl:if>
          </tr>
          <!-- For Each remaining set of data, make rows with alternating bgcolors -->                                                
          <xsl:for-each select="PYLongTermContractsFromK1Grp">        
            <xsl:if test="position() &gt; 1">
              <tr>
                <!-- Set row background color -->
                <xsl:attribute name="class">
                  <xsl:choose>
                     <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                     <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <td class="styDepTblCell" scope="col" style="text-align:center;font-size: 7pt;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="Yr"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 40mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="PYScheduleK1YearlyInfoGrp/PYAdjustmentAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 40mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="PYScheduleK1YearlyInfoGrp/PYNetAdjToIncmAmt"/>
                  </xsl:call-template>
                </td>
                       
				<xsl:for-each select="PYScheduleK1YearlyInfoGrp">        
					<xsl:if test="position() &gt; 1">
					  <tr>
						<!-- Set row background color -->
						<xsl:attribute name="class">
						  <xsl:choose>
							 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
							 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
						  </xsl:choose>
						</xsl:attribute>
						<td class="styDepTblCell" scope="col" style="text-align:center;font-size: 7pt;">
						<!--  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="Yr"/>
						  </xsl:call-template>-->
						</td>
						<td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 40mm">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="PYAdjustmentAmt"/>
						  </xsl:call-template>
						</td>
						<td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 40mm">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="PYNetAdjToIncmAmt"/>
						  </xsl:call-template>
						</td>
					  </tr>
					</xsl:if>
				  </xsl:for-each>         
		  </tr>
		</xsl:if>
	  </xsl:for-each>         
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
         <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Ravi Venigalla"/>
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
     <!-- NameDisplay - IRS8697 - Schedule of Adjustments to Long-Term Contracts Simplified Schedules  K-1   -->
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>            
          <div class="styDepTitleLineLandscape">
            <span class="styDepTitle">
              <span style="padding-right:5mm;">
                <xsl:value-of select="$depDocTitle"/>
              </span>
            </span>
          </div>

        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$AdjLongTermData"/></xsl:call-template>
         <span style="height:5px;"/>
        <!-- Transform Retained Earnings Appr Schedule -->
        <xsl:call-template name="AdjLongTermContractsFromK1SchTemp"/>
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>