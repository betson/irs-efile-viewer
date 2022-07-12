<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/> 
  <xsl:param name="TCCGSData" select="$RtnDoc/TaxCmptMemberCtrlGroupStmt"/>
  <!--  - Form 1120 Schedule O displays as - Tax Computation for each Member of a Controlled Group Statement - -->
  <xsl:template name="ShowTCCGS">  
    <table id="TCCGSTbl" class="styDepTbl" >    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" style="width:45mm;" scope="col">Corporation Name </th>        
          <th class="styDepTblCell" style="width:20mm;" scope="col">Corporation EIN </th>  
          <th class="styDepTblCell" style="width:20mm;" scope="col">Controlled Group Member TIN</th>        
          <th class="styDepTblCell" style="width:34mm;" scope="col">Apportionment Amount ($50,000) Line 2(a)(1) </th>  
          <th class="styDepTblCell" style="width:34mm;" scope="col">Apportionment Amount ($25,000) Line 2(a)(2) </th>  
          <th class="styDepTblCell" style="width:34mm;" scope="col">Apportionment Amount ($9,925,000) Line 2(a)(3) </th>                           
        </tr>
      </thead>
        <tfoot/>
       <tbody>    
        <xsl:for-each select="$TCCGSData/TaxCmptMemberControlledGroup">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>   
            <td class="styDepTblCell" style="width:45mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <xsl:if test="CorporationName/BusinessNameLine2Txt != ''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </xsl:if>
            </td>
            <td class="styDepTblCell" style="width:20mm;text-align:center;" nowrap="yes">
             <xsl:choose>
            <xsl:when test="CorporationEIN">
                       <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                      </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                    </xsl:call-template>
                    </xsl:otherwise>
               </xsl:choose>
              </td>
            <td class="styDepTblCell" style="width:20mm;text-align:center;" nowrap="yes">     
            	<xsl:choose> 
           		<xsl:when test="ControlledGroupMemberSSN">       
		              <xsl:call-template name="PopulateSSN">
		                <xsl:with-param name="TargetNode" select="ControlledGroupMemberSSN"/>
		              </xsl:call-template>    
                   </xsl:when> 
         	<xsl:when test="ControlledGroupMemberEIN">
         	    <xsl:call-template name="PopulateEIN">
	               <xsl:with-param name="TargetNode" select="ControlledGroupMemberEIN"/>
	           </xsl:call-template>
         	</xsl:when>
         	 <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="EINMissingReasonCd"/>
                    </xsl:call-template>
            </xsl:otherwise>
       	</xsl:choose>         
            </td>
            <td class="styDepTblCell" style="width:34mm;text-align:right;">              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ApportionmentLine2a1Amt"/>
              </xsl:call-template>              
            </td>
            <td class="styDepTblCell" style="width:34mm;text-align:right;">              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ApportionmentLine2a2Amt"/>
              </xsl:call-template>              
            </td>
            <td class="styDepTblCell" style="width:34mm;text-align:right;">            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ApportionmentLine2a3Amt"/>
              </xsl:call-template>            
            </td>  
          </tr>      
        </xsl:for-each>
        <tr class="styDepTblHdr">
            <td class="styDepTblCell" colspan="3" style="text-align:right;font-weight:bold;">
            Total Amount
            </td>
            <td class="styDepTblCell" style="width:34mm;text-align:right;font-weight:normal;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$TCCGSData/GroupTotals/ApportionmentLine2a1Amt"/>
              </xsl:call-template>          
            </td> 
            <td class="styDepTblCell" style="width:34mm;text-align:right;font-weight:normal;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$TCCGSData/GroupTotals/ApportionmentLine2a2Amt"/>
              </xsl:call-template>          
            </td>
            <td class="styDepTblCell" style="width:34mm;text-align:right;font-weight:normal;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$TCCGSData/GroupTotals/ApportionmentLine2a3Amt"/>
              </xsl:call-template>          
            </td>
      </tr>
      </tbody>
    </table>
  </xsl:template>    
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$TCCGSData"/></xsl:call-template>  
  </xsl:param>
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
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"/>    
        <div class="styDepTitleLine">
        <span class="styDepTitle"  style="padding-right:2mm;">
            <xsl:value-of select="$depDocTitle"/>
          </span>        
      </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$TCCGSData"/></xsl:call-template>        
        <xsl:call-template name="ShowTCCGS"/>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>