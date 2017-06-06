<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="OVDCSData" select="$RtnDoc/Owned50PercentVotingStockStmt"/>
  
  <!-- Template to display Itemized Owned 50 Percent Voting Stock of Domestic Corporation Statement-->
  <xsl:template name="ShowOVDCS">  
    <table id="OVDCSTbl" class="styDepTbl" style="font-size:7pt;">    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" scope="col" style="width:45mm">Corporation Name </th>        
          <th class="styDepTblCell" scope="col" style="width:20mm">Corporation EIN </th>  
          <th class="styDepTblCell" scope="col" style="width:45mm">Name </th>        
          <th class="styDepTblCell" scope="col" style="width:20mm">EIN </th>  
          <th class="styDepTblCell" scope="col" style="width:22mm">Percentage owned  </th>  
          <th class="styDepTblCell" scope="col" style="width:35mm">Taxable income or (loss) before NOL </th>                              
        </tr>
      </thead>
        <tfoot/>
        
       <tbody>    
        <xsl:for-each select="$OVDCSData/Owned50PercentVotingStock">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>  
            
            <td class="styDepTblCell" style="text-align:left;width:45mm">
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
            
            <td class="styDepTblCell" style="text-align:center;width:20mm;">
              <xsl:choose>
               <xsl:when test="normalize-space(CorporationEIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"/>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
		            </xsl:call-template>    
		           <span style="width: 2px"/>
	          </xsl:otherwise>   
          </xsl:choose>
            </td>
            
            <td class="styDepTblCell" style="text-align:left;width:45mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="BusinessName/BusinessNameLine2 != ''">
                <br/><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
                  </xsl:call-template>
              </xsl:if>            
            </td>
            
            <td class="styDepTblCell" style="text-align:center;width:20mm">
                <xsl:choose>
               <xsl:when test="normalize-space(EIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="EIN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"/>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="EINMissingReasonCd"/>
		            </xsl:call-template>    
		           <span style="width: 2px"/>
	          </xsl:otherwise>   
          </xsl:choose>

            </td>
            
            <td class="styDepTblCell" style="text-align:right;width:35mm">              
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="VotingStockOwnedPct"/>
              </xsl:call-template>              
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableIncomeLossBfrNOLDedAmt"/>
              </xsl:call-template>              
            </td>  
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>    
  
  
  
  <!-- VERTICAL TABLE STYLE COMMENTED  

  <xsl:template name="ShowOVDCS">
    
    <xsl:for-each select="$OVDCSData/Owned50PercentVotingStock">
      <table id="OVDCSTbl" class="styDepTbl">    
        
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
            Name
          </th>
          <td class="styDepTblCell" style="text-align:center;text-align:left;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1" />
            </xsl:call-template>
            <xsl:if test="Name/BusinessNameLine2 != ''">
              <br /><xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2" />
                </xsl:call-template>
            </xsl:if>            
          </td>
        </tr>        
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            EIN
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="EIN" />
            </xsl:call-template>
          </td>
        </tr>
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Percentage owned
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PercentageOwned" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Taxable income or (loss) before NOL
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxableIncomeOrLossBeforeNOL" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
    -->    
    
    
      <!-- Removed in 2002 Schema update  
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Special deductions
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="SpecialDeductions" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        -->
      
      <!--      
      </table>
      <br/>        
    </xsl:for-each>    
  </xsl:template>
  -->
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$OVDCSData"/></xsl:call-template>  
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
          <span class="styDepTitle" style="width:144mm">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$OVDCSData"/></xsl:call-template>        
                
        <xsl:call-template name="ShowOVDCS"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>