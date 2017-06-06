<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="TCCGSData" select="$RtnDoc/TaxCmptMemberCtrlGroupStmt"/>
  
  <!-- Template to display Itemized Tax Computation for each member of a Controlled Group Statement -->
  <xsl:template name="ShowTCCGS">  
    <table id="TCCGSTbl" class="styDepTbl" style="font-size:8pt">    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" scope="col">Corporation Name </th>        
          <th class="styDepTblCell" scope="col">Corporation EIN </th>  
          <th class="styDepTblCell" scope="col">Controlled group member TIN</th>        
          <th class="styDepTblCell" scope="col">Apportionment amount ($50,000) Line 2(a)(1) </th>  
          <th class="styDepTblCell" scope="col">Apportionment amount ($25,000) Line 2(a)(2) </th>  
          <th class="styDepTblCell" scope="col">Apportionment amount ($9,925,000) Line 2(a)(3) </th>                           
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
            
            <td class="styDepTblCell" style="text-align:left;" width="275mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
              </xsl:call-template>
            
              <xsl:if test="CorporationName/BusinessNameLine2 != ''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </td>
           
            <td class="styDepTblCell" style="text-align:center;">
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
            

            <td class="styDepTblCell" style="text-align:center;" width="90mm">     
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
            
            <td class="styDepTblCell" style="text-align:right;">              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ApportionmentLine2a1Amt"/>
              </xsl:call-template>              
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ApportionmentLine2a2Amt"/>
              </xsl:call-template>              
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ApportionmentLine2a3Amt"/>
              </xsl:call-template>            
            </td>  
          </tr>      
        </xsl:for-each>
        
        <tr class="styDepTblHdr">
            <td class="styDepTblCell" colspan="3" style="text-align:right;font-weight:bold;">
            Total amount
            </td>
            <td class="styDepTblCell" style="text-align:right;font-weight:normal">
              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$TCCGSData/GroupTotals/ApportionmentLine2a1Amt"/>
              </xsl:call-template>          
            </td>
            
            <td class="styDepTblCell" style="text-align:right;font-weight:normal">
              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$TCCGSData/GroupTotals/ApportionmentLine2a2Amt"/>
              </xsl:call-template>          
            </td>
            
            <td class="styDepTblCell" style="text-align:right;font-weight:normal">
              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$TCCGSData/GroupTotals/ApportionmentLine2a3Amt"/>
              </xsl:call-template>          
            </td>

      </tr>

      </tbody>
    </table>
  </xsl:template>    
  
  
  
  <!-- VERTICAL TABLE STYLE COMMENTED  
  
  <xsl:template name="ShowTCCGS">
    
    <xsl:for-each select="$TCCGSData/TaxCmptMemberControlledGroup">
      <table id="TCCGSTbl" class="styDepTbl">
        
         <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row"  style="width:40%;text-align:right;">Item No.</th>
          <td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>
        </tr>        
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Corporation Name
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1" />
            </xsl:call-template>
          
            <xsl:if test="CorporationName/BusinessNameLine2 != ''">
              <br />
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2" />
              </xsl:call-template>
            </xsl:if>
          </td>  
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Corporation EIN
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CorporationEIN" />
            </xsl:call-template>
          </td>
        </tr>  
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Controlled group member TIN
          </th>
          <td class="styDepTblCell" style="text-align:left;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ControlledGroupMemberTIN" />
              </xsl:call-template>            
          </td>
        </tr>        
        
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Apportionment amount ($50,000) Line 2(a)(1)
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ApportionmentAmountLine2a1" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Apportionment amount ($25,000) Line 2(a)(2)
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ApportionmentAmountLine2a2" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
                   
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Apportionment amount ($9,925,000) Line 2(a)(3)
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ApportionmentAmountLine2a3" />
              </xsl:call-template>
            </span>
          </td>
        </tr>        
      </table>
      <br/>        
    </xsl:for-each>    
      
  </xsl:template>
  -->
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$TCCGSData"/></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
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
          <span class="styDepTitle" style="width:92mm">
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