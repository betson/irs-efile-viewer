<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="AIGFDData" select="$RtnDoc/AddnlInfoGrossForeignDivSch" />
  
  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$AIGFDData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template  -->
  <xsl:template match="/" >
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
         <meta name="Author" content="Chris Sinderson" />
         <meta name="Description" content="{$depDocTitle}" />
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        
        <style type="text/css">
        </style>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
    </head>    
    <body class="styBodyClass">
      <xsl:call-template name="DocumentHeaderDependencyLandscape" />  
      <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            <span style="width:155mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$AIGFDData"/></xsl:call-template>
        <span style="height:5px;"></span>
        <xsl:call-template name="ShowAIGFD" />
      </body>
    </html>
  </xsl:template>

  <!-- Template to display Additional Information for Gross Foreign Dividends Schedule -->
  <xsl:template name="ShowAIGFD">
    <table id="AIGFDTbl" class="styDepTblLandscape" style="font-size:7pt;">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:50mm;">Name</th>
           <th class="styDepTblCell" scope="col" style="width:20mm;">EIN</th>
           <th class="styDepTblCell" scope="col" style="width:50mm;">Class of voting stock</th>
           <th class="styDepTblCell"  scope="col" style="width:16mm;">Percentage of the class</th>
           <th class="styDepTblCell" scope="col" style="width:30mm;">Income (Loss) per Income Statement Amount</th>
           <th class="styDepTblCell" scope="col" style="width:30mm;">Temporary Difference Amount</th>
           <th class="styDepTblCell" scope="col" style="width:30mm;">Permanent Difference Amount</th>
           <th class="styDepTblCell" scope="col" style="width:30mm;">Income (Loss) per Tax Return Amount</th>
          </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$AIGFDData/AddnlInfoGrossForeignDiv">
          <tr>
          <!-- Assign alternate rows the different colors -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
        
            <!-- Column 1 -->
            <td class="styDepTblCell" style="text-align:left;width:50mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1" />
              </xsl:call-template>
              <xsl:if test="Name/BusinessNameLine2"><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>
            </td>
             <!-- Column 2 -->
            <td class="styDepTblCell" style="text-align:left;width:20mm;">
                         
               <xsl:choose>
               <xsl:when test="normalize-space(EIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="EIN"/>
                       </xsl:call-template>  
                     <span style="width: 2px"></span>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="MissingEINReason"/>
		            </xsl:call-template>    
		           <span style="width: 2px"></span>
	          </xsl:otherwise>   
          </xsl:choose>
            </td>
            <!-- Column 3 -->
            <td class="styDepTblCell" style="text-align:left;width:50mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ClassOfVotingStock" />
              </xsl:call-template>
            </td>
		<!-- Column 4 -->            
            <td class="styDepTblCell" style="text-align:center;width:16mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PercentageOfClass" />
              </xsl:call-template>
            </td>
            <!-- Column 5 -->
            <td class="styDepTblCell" style="text-align:right;width:30mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmount" />
              </xsl:call-template>          
            </td>
            <!-- Column 6 -->
            <td class="styDepTblCell" style="text-align:right;width:30mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmount" />
              </xsl:call-template>          
            </td>
            <!-- Column 7 -->
            <td class="styDepTblCell" style="text-align:right;width:30mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PermanentDifferenceAmount" />
              </xsl:call-template>          
            </td>
            <!-- Column 8 -->
            <td class="styDepTblCell" style="text-align:right;width:30mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmount" />
              </xsl:call-template>          
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
</xsl:stylesheet>







