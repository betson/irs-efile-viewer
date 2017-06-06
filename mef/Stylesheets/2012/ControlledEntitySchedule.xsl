<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="CCSData" select="$RtnDoc/ControlledEntitySchedule" />
  
  <!-- Template to display Controlled Entity Schedule-->  
  
  <xsl:template name="ShowCES">
    <table id="CES" class="styDepTblLandscape" >
      <thead class="styTableThead">
        <tr class="styDepTblHdr">          
           <th class="styDepTblCell" scope="col" style="width:64mm;">Name of <br/>Controlled Entity </th>        
           <th class="styDepTblCell" scope="col" style="width:63mm;">Income Description </th>  
           <th class="styDepTblCell" scope="col" style="width:32mm;">Income Amount </th>        
 		 <th class="styDepTblCell" scope="col" style="width:32mm;">Loan Amount </th>        
           <th class="styDepTblCell" scope="col" style="width:63mm;">Other Fund <br/>Transfers Description</th>
           <th class="styDepTblCell" scope="col" style="width:32mm;">Other Fund <br/>Transfers Amount </th> 
        </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>    
        <xsl:for-each select="$CCSData/ControlledEntity">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>            
            
             <td class="styDepTblCell" style="text-align:left;width:64mm;font-size:7pt;"> 
             <xsl:call-template name="PopulateText">
              	<xsl:with-param name="TargetNode" select="NameOfControlledEntity/BusinessNameLine1" />
             </xsl:call-template> 
              	<br />
              		<xsl:call-template name="PopulateText">
              			<xsl:with-param name="TargetNode" select="NameOfControlledEntity/BusinessNameLine2" />
              		</xsl:call-template> 
            </td>
      
            <td class="styDepTblCell" style="text-align:left;width:63mm;font-size:7pt;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="IncomeDescription" />
              </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:right;width:32mm;font-size:7pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="IncomeAmount" />
                </xsl:call-template>
            </td>
 
            <td class="styDepTblCell" style="text-align:right;width:32mm;font-size:7pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="LoanAmount" />
                </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:left;width:63mm;font-size:7pt;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="OtherFundTransfersDescription" />
              </xsl:call-template>
            </td>
 
            <td class="styDepTblCell" style="text-align:right;width:32mm;font-size:7pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="OtherFundTransfersAmt" />
                </xsl:call-template>
            </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$CCSData" /></xsl:call-template>  
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
        <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>    
        <div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:80mm">
            <xsl:value-of select="$depDocTitle" />        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$CCSData" /></xsl:call-template>        
        <xsl:call-template name="ShowCES" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







