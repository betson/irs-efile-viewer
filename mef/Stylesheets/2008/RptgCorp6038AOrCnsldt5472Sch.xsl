<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/RptgCorp6038AOrCnsldt5472Sch" />
  <!-- Template to display Reporting corporations under section 6038A or on a consolidated Form 5472 schedule -->
  <xsl:template name="DependencyTemplate">
    <!-- Itemized Other Income Schedule Data -->
    <table id="RCCSTbl" class="styDepTbl" style="font-size:7pt;">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col">Item No.</th-->
           <th class="styDepTblCell" scope="col">Name of the Reporting Corporation</th>
           <th class="styDepTblCell" scope="col" >Street Address</th>
           <th class="styDepTblCell" scope="col" >Employer Identification Number</th>
           <th class="styDepTblCell" scope="col" >Included on Consolidated Form 5472?</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$DependencyData/ReportingCorp6038AOrCnsldt5472">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <!--td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()" /></td-->        
            <td class="styDepTblCell" style="text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName1/BusinessNameLine1" />
              </xsl:call-template>
              <xsl:if test="CorporationName1/BusinessNameLine2 != ''">
                <br /><xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationName1/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>
            </td>
            <td class="styDepTblCell" style="text-align:left">
            <xsl:choose>
	          <xsl:when test="CorporationUSAddress">
	               <xsl:call-template name="PopulateUSAddressTemplate">
	                    <xsl:with-param name="TargetNode" select="CorporationUSAddress"/>
               </xsl:call-template>
	          </xsl:when>
	          <xsl:otherwise>
	               <xsl:call-template name="PopulateForeignAddressTemplate">
	                    <xsl:with-param name="TargetNode" select="CorporationForeignAddress"/>
	               </xsl:call-template>
	          </xsl:otherwise>
	     </xsl:choose>


              <!--<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationAddress/AddressLine1" />
              </xsl:call-template>
              <xsl:if test="CorporationAddress/AddressLine2 != ''"><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationAddress/AddressLine2" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="CorporationAddress/City != ''"><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationAddress/City" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="CorporationAddress/State != ''">, <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationAddress/State" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="CorporationAddress/ZIPCode != ''">-
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationAddress/ZIPCode" />
                </xsl:call-template>
              </xsl:if>-->
            </td>
            <td class="styDepTblCell" style="text-align:center;width:23mm;">
              <xsl:choose>
               <xsl:when test="normalize-space(CorporationEIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="CorporationEIN"/>
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
            <td class="styDepTblCell" style="width:15mm;text-align:center;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="IncludedOnConsolidatedForm5472" />
              </xsl:call-template>
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="IncludedOnConsolidatedForm5472" />
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  
  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
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
         <meta name="Description" content="{$depDocTitle}" />
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>

        
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">

        <xsl:call-template name="DocumentHeaderDependency"  />  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:187mm;"><xsl:value-of select="$depDocTitle" /></span>    
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"></span>
        <!-- Transform Itemized Other Income Schedule -->
        <xsl:call-template name="DependencyTemplate" />
        
        <br />
      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







