<?xml version="1.0" encoding="UTF-8" ?>

 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  

  <xsl:param name="DependencyData" select="$RtnDoc/CodeSectPropDeprecOrAmortzStmt" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
  </xsl:param> 

  <xsl:template name="DependencyTemplate">
    <table class="styDepTblLandscape" style="margin-top:4mm; font-size:6pt; font-family:Verdana">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" colspan="2">
             Code section under which the property is depreciated
          </th>
          <th class="styDepTblCell" scope="col" colspan="2">
             If the property is depreciated under section 168, identify the applicable asset class in Rev. Proc. 87-56, 1987-2 C.B. 674. (if none, state so and explain why)
          </th>
          <th class="styDepTblCell" scope="col" colspan="2">
             Provide the facts supporting the asset class
          </th>
          <th class="styDepTblCell" scope="col" colspan="2">
            Depreciation or amortization method of property, including the applicable Code section (e.g. 200% declining balance method under section 168(b)(1)
          </th>
          <th class="styDepTblCell" scope="col" colspan="2"> 
            Useful Life, Recovery, or Amortization Period 
          </th>
          <th class="styDepTblCell" scope="col" colspan="2">
            Applicable convention of the property 
          </th> 
        </tr>

        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" colspan="2">Method</th>
          <th class="styDepTblCell" scope="col" colspan="2">Method</th>
          <th class="styDepTblCell" scope="col" colspan="2">Method</th>
          <th class="styDepTblCell" scope="col" colspan="2">Method</th>
          <th class="styDepTblCell" scope="col" colspan="2">Method</th>
          <th class="styDepTblCell" scope="col" colspan="2">Method</th>
        </tr>              

        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Present</th>
          <th class="styDepTblCell" scope="col">Proposed</th>
          <th class="styDepTblCell" scope="col">Present</th>
          <th class="styDepTblCell" scope="col">Proposed</th>
          <th class="styDepTblCell" scope="col">Present</th>
          <th class="styDepTblCell" scope="col">Proposed</th>
          <th class="styDepTblCell" scope="col">Present</th>
          <th class="styDepTblCell" scope="col">Proposed</th>
          <th class="styDepTblCell" scope="col">Present</th>
          <th class="styDepTblCell" scope="col">Proposed</th>
          <th class="styDepTblCell" scope="col">Present</th>
          <th class="styDepTblCell" scope="col">Proposed</th>
        </tr> 
      </thead> 
      <tfoot></tfoot>
      <tbody>    

      <xsl:for-each select="$DependencyData/CodeSectPropDeprecOrAmortzInfo">  
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute> 
          <td class="styDepTblCell"> 
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PresentMethod/CodeSection" />
            </xsl:call-template>
          </td>  

          <td class="styDepTblCell">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethod/CodeSection" />
            </xsl:call-template>  
          </td>  

          <td class="styDepTblCell" align="left"> 
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PresentMethod/AssetClass" />
            </xsl:call-template>  
          </td>  

          <td class="styDepTblCell" align="left">  
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethod/AssetClass" />
            </xsl:call-template> 
          </td>  

          <td class="styDepTblCell" align="left">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PresentMethod/AssetClassSuprtFactsPrpsdMthd" />
            </xsl:call-template>  
          </td>

          <td class="styDepTblCell" align="left">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethod/AssetClassSuprtFactsPrpsdMthd" />
            </xsl:call-template> 
          </td>

          <td class="styDepTblCell" align="left"> 
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PresentMethod/DeprecOrAmortzMthdAndCodeSect" />
            </xsl:call-template> 
          </td>  

          <td class="styDepTblCell" align="left">  
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethod/DeprecOrAmortzMthdAndCodeSect" />
            </xsl:call-template>   
          </td>  

          <td class="styDepTblCell" align="left">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PresentMethod/UsefulLifeRecoveryAmortzPeriod" />
            </xsl:call-template>   
          </td>

          <td class="styDepTblCell" align="left">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethod/UsefulLifeRecoveryAmortzPeriod" />
            </xsl:call-template>
          </td>

          <td class="styDepTblCell"> 
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PresentMethod/ApplicableConvention" />
            </xsl:call-template>      
          </td>    

          <td class="styDepTblCell">   
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethod/ApplicableConvention" />
            </xsl:call-template> 
          </td>
        </tr>

      </xsl:for-each>
      </tbody>  
    </table>
  </xsl:template>

  <!-- Main template -->

  <xsl:template match="/">
    <html>
      <head>
         <title>
           <!--Financial Services Income Statement-->
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
         <meta name="Description" content="{$depDocTitle}" />

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
          <span class="styDepTitle" style="padding-right:2mm">
            <xsl:value-of select="$depDocTitle" />
          </span>
        </div>  
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template> 
        <xsl:call-template name="DependencyTemplate"/>   
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>














