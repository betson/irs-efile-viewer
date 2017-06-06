<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="NARCSData" select="$RtnDoc/NamesAddrRentPayersOthCompStmt" />
  
  <!-- Template to display Itemized Charitable Contribution Statement -->
  <xsl:template name="ShowNARCS">  
    <table id="NARCSTbl" class="styDepTbl" >    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" scope="col">Property description </th>        
          <th class="styDepTblCell" scope="col">Person's name </th>  
          <th class="styDepTblCell" scope="col">Person's address</th>                            
        </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>    
        <xsl:for-each select="$NARCSData/PropertyAndPerson">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PropertyDescription" />
              </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PersonName" />
              </xsl:call-template>
            </td>
               
            <!-- Address --> 
	          <td class="styDepTblCell" style="text-align:left;" >
	           <xsl:choose>
	                <xsl:when test="PersonUSAddress">
	                        <xsl:call-template name="PopulateUSAddressTemplate">
	                        <xsl:with-param name="TargetNode" select="PersonUSAddress" />
	                        </xsl:call-template>  
	               </xsl:when>
	               <xsl:otherwise>
	                        <xsl:call-template name="PopulateForeignAddressTemplate">
	                        <xsl:with-param name="TargetNode" select="PersonForeignAddress" />
	                        </xsl:call-template>  
	               </xsl:otherwise>
	          </xsl:choose>
	          
          </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>    
  
  
  
  <!-- VERTICAL TABLE STYLE COMMENTED
    
  <xsl:template name="ShowNARCS">    
    <xsl:for-each select="$NARCSData/PropertyAndPerson">
      <table id="NARCSTbl" class="styDepTbl">    
        
         <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row"  style="width:40%;text-align:right;">Item No.</th>
          <td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>
        </tr>        
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Property description
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PropertyDescription" />
            </xsl:call-template>
          </td>
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Person's name
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PersonName" />
            </xsl:call-template>
          </td>
        </tr>        
                
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Person's address          
          </th>
        <td class="styDepTblCell" style="text-align:center;text-align:left;" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="PersonAddress/AddressLine1" />
          </xsl:call-template>
          <xsl:if test="PersonAddress/AddressLine2 != ''">
            <br /><xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PersonAddress/AddressLine2" />                      </xsl:call-template>
              </xsl:if>
          <xsl:if test="PersonAddress/City != ''"><br />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PersonAddress/City" />
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="PersonAddress/State != ''">, <br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PersonAddress/State" />
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="PersonAddress/ZIPCode != ''">- 
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PersonAddress/ZIPCode" />
            </xsl:call-template>
          </xsl:if>
        </td>
      </tr>         
        
      </table>
      <br/>        
    </xsl:for-each>    
  </xsl:template>  
-->  

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$NARCSData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
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
         <meta name="Author" content="Ravi Venigalla" />
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
      <body class="styBodyClass" >
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:125mm">
            <xsl:value-of select="$depDocTitle" />        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$NARCSData" /></xsl:call-template>        
                
        <xsl:call-template name="ShowNARCS" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







