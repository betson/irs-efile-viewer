<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="FormData" select="$RtnDoc/Category3FilerStatement" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$FormData" /></xsl:call-template>  
  </xsl:param>
  
    <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="ShowData">
      <table id="DataTbl" class="styDepTbl" style="font-size: 8pt">
        <thead class="styTableThead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width: 35mm">Amount<br/>Of<br/>Indebtedness</th>
            <th class="styDepTblCell" scope="col" style="width: 25mm">Type<br/>Of<br/>Indebtedness</th>
            <th class="styDepTblCell" scope="col" style="width: 65mm">Name</th>
            <th class="styDepTblCell" scope="col" style="width: 40mm">Address </th>
            <th class="styDepTblCell" scope="col" style="width: 20mm">Identifying Number</th>
           <th class="styDepTblCell" scope="col" style="width: 20mm;text-align:center">Number Of Shares</th>                                 
          </tr>      
        </thead>
        <xsl:for-each select="$FormData/Category3FilerInfo">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="text-align:right;width: 35mm" valign="top">
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="AmountOfIndebtedness" /></xsl:call-template>             
            </td>
            <td class="styDepTblCell" style="text-align:left; width: 25mm" valign="top">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TypeOfIndebtedness" /></xsl:call-template>             
            </td>
            
            <td class="styDepTblCell" style="text-align:left;font-family:verdana;font-size:6pt;" valign="top" >            
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Name/BusinessNameLine1" /></xsl:call-template>             
              <xsl:if test="Name/BusinessNameLine1 != '' and Name/BusinessNameLine2 != ''"><br/></xsl:if>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Name/BusinessNameLine2" /></xsl:call-template>             
            </td>
            
            <td class="styDepTblCell" style="text-align:left; width:40mm;font-size:6pt;" valign="top" >
               <xsl:if test="USAddress != ''">
                    <xsl:call-template name="PopulateUSAddressTemplate"><xsl:with-param name="TargetNode" select="USAddress" /></xsl:call-template>
              </xsl:if>             
              
               <xsl:if test="ForeignAddress != ''">
                    <xsl:call-template name="PopulateForeignAddressTemplate"><xsl:with-param name="TargetNode" select="ForeignAddress" /></xsl:call-template>
              </xsl:if>             
              
            </td>                      
            <td class="styDepTblCell" style="text-align:center;width:20mm" valign="top">
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
        		</xsl:choose></td>
            <td class="styDepTblCell" style="text-align:center;width:20mm" valign="top" >
              <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="MaxSize" select="10" />
              <xsl:with-param name="TargetNode" select="NumberOfShares" /></xsl:call-template>             
            </td>                              
          </tr>
        </xsl:for-each>
     </table>    
  </xsl:template>

  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title>
           <!--Category 3 Filer Statement-->
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
         <meta name="Author" content="Jessica Lee - jesslee@us.ibm.com" />
         <!--meta name="Description" content="Category 3 Filer Statement" /-->
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
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
        <div class="styDepTitleLine">
          <div class="styDepTitle" style="width:82mm">
            <xsl:value-of select="$depDocTitle" />
            <!--TY 2003 Category 3 Filer Statement-->
          </div>
        </div>        
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$FormData"/></xsl:call-template>    
                
        <xsl:call-template name="ShowData" />  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







