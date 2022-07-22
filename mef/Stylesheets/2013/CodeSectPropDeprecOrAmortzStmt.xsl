<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/CodeSectPropDeprecOrAmortzStmt"/>
<!--  - Code 3115 displays as - Code Section Under Which Property Is Depreciated or Amortized Statement - -->
	<xsl:template name="ShowDependencyData">		
		<table id="DependencyDataTbl" class="styDepTblLandscape"  style="font-size: 6pt;">
			<thead class="styTableThead">
		<tr class="styDepTblHdr">
        <th class="styDepTblCell" scope="col" colspan="2" style="width:80mm;padding-top:3mm;">
		Code Under Which the Property is Depreciated
          </th>
          <th class="styDepTblCell" scope="col" colspan="2" style="width:80mm;padding-top:3mm;">
             If the Property is Depreciated Under Section 168, Identify the Applicable Asset Class in Rev. Proc. 87-56, 1987-2 C.B. 674. (If None, State So and Explain Why)
          </th>
          <th class="styDepTblCell" scope="col" colspan="2" style="width:80mm;padding-top:3mm;">
             Provide the Facts Supporting the Asset Class
          </th>     
        </tr>
			<tr class="styDepTblHdr">
			<th class="styDepTblCell" scope="col" colspan="2" style="width:80mm;padding-top:1mm;">Method</th>
			  <th class="styDepTblCell" scope="col" colspan="2" style="width:80mm;padding-top:1mm;">Method</th>
			  <th class="styDepTblCell" scope="col" colspan="2" style="width:80mm;padding-top:1mm;">Method</th>
			  </tr>
		<tr class="styDepTblHdr">
		<th class="styDepTblCell" scope="col" style="width:40mm;">Present</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Proposed</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Present</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Proposed</th>
          <th class="styDepTblCell" scope="col"  style="width:40mm;">Present</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Proposed</th>			
			</tr>
		 </thead> 
      <tfoot/>
      <tbody>  
				<xsl:for-each select="$DependencyData/CdSectPropDeprecAmortzInfoTxt"> 
			<tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
			<td class="styDepTblCell" align="left" style="width:40mm;"> 
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PresentMethodGrp/CodeSectionTxt"/>
            </xsl:call-template>
          </td>  
          <td class="styDepTblCell" align="left" style="width:40mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethodGrp/CodeSectionTxt"/>
            </xsl:call-template>  
          </td>  
          <td class="styDepTblCell" align="left" style="width:40mm;"> 
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PresentMethodGrp/AssetClassTxt"/>
            </xsl:call-template>  
          </td>  
          <td class="styDepTblCell" align="left" style="width:40mm;">  
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethodGrp/AssetClassTxt"/>
            </xsl:call-template> 
          </td>  
          <td class="styDepTblCell" align="left" style="width:40mm;">
            <xsl:call-template name="PopulateText">
             <xsl:with-param name="TargetNode" select="PresentMethodGrp/AstClSuprtFactsUndPrpsdMthdTxt"/>
            </xsl:call-template>  
          </td>
          <td class="styDepTblCell" align="left" style="width:40mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethodGrp/AstClSuprtFactsUndPrpsdMthdTxt"/>
            </xsl:call-template> 
          </td>
				</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Template to display table items -->
	<xsl:template name="ShowDependencyData1">
		<!-- Itemized Other Income Schedule Data -->
		<table id="DependencyDataTbl1" class="styDepTblLandscape" style="font-size: 6pt">
		<thead class="styTableThead">
		<tr class="styDepTblHdr">
	<th class="styDepTblCell" scope="col" colspan="2" style="width:80mm;padding-top:1mm;">
            Depreciation or Amortization Method of Property, Including the Applicable Code Section (e.g. 200% Declining Balance Method Under Section 168(b)(1)
          </th>
          <th class="styDepTblCell" scope="col" colspan="2" style="width:80mm;padding-top:1mm;"> 
            Useful Life, Recovery, or Amortization Period 
          </th>
          <th class="styDepTblCell" scope="col" colspan="2" style="width:80mm;padding-top:1mm;">
            Applicable Convention of the Property 
          </th>  
			</tr>
		<tr class="styDepTblHdr">
		 <th class="styDepTblCell" scope="col" colspan="2" style="width:100mm;padding-top:1mm;">Method</th>
          <th class="styDepTblCell" scope="col" colspan="2" style="width:100mm;padding-top:1mm;">Method</th>
          <th class="styDepTblCell" scope="col" colspan="2" style="width:20mm;padding-top:1mm;">Method</th>
        </tr>    
		<tr class="styDepTblHdr">
			<th class="styDepTblCell" scope="col" style="width:50mm;">Present</th>
          <th class="styDepTblCell" scope="col" style="width:50mm;">Proposed</th>
          <th class="styDepTblCell" scope="col" style="width:50mm;">Present</th>
          <th class="styDepTblCell" scope="col" style="width:50mm;">Proposed</th>
          <th class="styDepTblCell" scope="col" style="width:10mm;">Present</th>
          <th class="styDepTblCell" scope="col" style="width:10mm;">Proposed</th>
		</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/CdSectPropDeprecAmortzInfoTxt"> 
			<tr>
			<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
			<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
			    <td class="styDepTblCell" align="left" style="width:50mm;">  
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethodGrp/DeprecOrAmortzMthdAndCdSectTxt"/>
            </xsl:call-template>   
          </td>  
          <td class="styDepTblCell" align="left" style="width:50mm;">  
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethodGrp/DeprecOrAmortzMthdAndCdSectTxt"/>
            </xsl:call-template>   
          </td> 
           <td class="styDepTblCell" align="left" style="width:50mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PresentMethodGrp/UsefulLifeRecoveryAmortzPrdTxt"/>
            </xsl:call-template>   
          </td>
          <td class="styDepTblCell" align="left" style="width:50mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethodGrp/UsefulLifeRecoveryAmortzPrdTxt"/>
            </xsl:call-template>
          </td>    
         <td class="styDepTblCell" style="width:10mm;"> 
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PresentMethodGrp/ApplicableConventionCd"/>
            </xsl:call-template>      
          </td>    
          <td class="styDepTblCell" style="width:10mm;">   
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ProposedMethodGrp/ApplicableConventionCd"/>
            </xsl:call-template> 
          </td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:param name="depDocTitle">	
	<!--Financial Services Income Statement-->
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
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
			<body class="styBodyClass" style="width:187mm">
				<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
				 <div class="styDepTitleLineLandscape">
          <span class="styDepTitle" style="padding-right:2mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div> 
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="ShowDependencyData"/>
				<br/>
				<br/>
				<xsl:call-template name="ShowDependencyData1"/>
				<br/>
				<br/>	
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
