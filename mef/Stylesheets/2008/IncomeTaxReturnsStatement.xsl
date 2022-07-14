<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/IncomeTaxReturnsStatement" />

  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
  <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>  
  </xsl:param>
 
  <xsl:template name="IncomeTaxReturnsStatementTemp">
    <table id="IncomeTaxReturnsStatementTemp" class="styDepTblLandscape" style="font-size: 7pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
            <th class="styDepTblCell"  scope="col" style="text-align:center">Filing Requirements Satisfied Statement</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Return Name</th>
                   <th class="styDepTblCell"  scope="col" style="text-align:center">Return Address</th>
     
           <th class="styDepTblCell"  scope="col" style="text-align:center">Return Identifying Number</th>
       
           <th class="styDepTblCell"  scope="col" style="text-align:center">IRS Service Center Where Field</th>
   
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
       <xsl:for-each select="$DependencyData/IncomeTaxReturnsStmt">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
      
      <!-- Filing Rqr Satisfied Statement  -->         
         
          <td class="stydepTblCell" style="width:33mm; text-align:left">
            <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="FilingRqrSatisfiedStatement" />
                </xsl:call-template>
          </td> 
          
          

      
          <!--Return Name -->
          <td class="styDepTblCell" style="width:80mm; text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ReturnName/BusinessNameLine1" />
              </xsl:call-template>            
              <xsl:if test="ReturnName/BusinessNameLine2 != ''">
                <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ReturnName/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>
            </td>
 
             
<!-- Return Address --> 
          <td class="styDepTblCell" style="text-align:left;" >
           <xsl:choose>
                <xsl:when test="USReturnAddress">
                        <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="USReturnAddress" />
                        </xsl:call-template>  
               </xsl:when>
               <xsl:otherwise>
                        <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="ForeignReturnAddress" />
                        </xsl:call-template>  
               </xsl:otherwise>
          </xsl:choose>
          
          </td>

    <!-- EIN -->
          <td class="stydepTblCell" style="width: 21mm; text-align:center;">
            <span style="width:21mm;text-align:center;">
              <!--xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="EIN" />
                </xsl:call-template -->
                
                 <xsl:choose>
            		   <xsl:when test="normalize-space(ReturnEIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="ReturnEIN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"></span>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="MissingReturnEINReason"/>
		            </xsl:call-template>    
		           <span style="width: 2px"></span>
	          </xsl:otherwise>   
          </xsl:choose>
            </span>
          </td>
          
<!-- IRS Service Center Where Filed -->         
         
          <td class="stydepTblCell" style="width:33mm; text-align:left">
            <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IRSServiceCenterWhereFiled" />
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
      <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>
    
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            <span style="width:90mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>               
       
                     <xsl:call-template name="IncomeTaxReturnsStatementTemp" />  
     
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

