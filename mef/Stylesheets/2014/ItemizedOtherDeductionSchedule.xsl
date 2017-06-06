<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="IODSData" select="$RtnDoc/ItemizedOtherDeductionSchedule"/>
  
  <!-- Template to display Itemized Charitable Contribution Statement  -->
  
  <xsl:template name="ShowIODS">    
    <table id="IODSTbl" class="styDepTblLandscape" style="font-size:7pt;">    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
           <th class="styDepTblCell" scope="col">Corporation Name </th>        
           <th class="styDepTblCell" scope="col">Corporation EIN </th>  
           <th class="styDepTblCell" scope="col">Description </th>        
           <th class="styDepTblCell" scope="col">Amount</th>  
           <th class="styDepTblCell" scope="col">Partnership Name</th>        
           <th class="styDepTblCell" scope="col">Partnership EIN </th>
            <th class="styDepTblCell" scope="col">Partnership Address  </th>
              <th class="styDepTblCell" scope="col">Partnership Amount  </th>
       
        </tr>
      </thead>
        <tfoot/>
        
       <tbody>    
        <xsl:for-each select="$IODSData/ItemizedOtherDeduction">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>  
            
            <td class="styDepTblCell" style="text-align:left;">
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
              <!-- xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="CorporationEIN" />
              </xsl:call-template -->
              
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
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Desc"/>
              </xsl:call-template>
            </td>        
        
            <td class="styDepTblCell" style="text-align:right;width:30mm;" nowrap="yes">            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amt"/>
              </xsl:call-template>            
            </td>                
        
        
            <td class="styDepTblCell" style="text-align:center;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="PartnershipName/BusinessNameLine2 != ''">
                <br/><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine2"/>
                  </xsl:call-template>
              </xsl:if>            
            </td>
        
            <td class="styDepTblCell" style="text-align:center;width:20mm;">
              <!-- xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="PartnershipEIN" />
              </xsl:call-template -->
              
             <xsl:choose>
               <xsl:when test="normalize-space(PartnershipEIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="PartnershipEIN"/>
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
            <td class="styDepTblCell" style="text-align:center;text-align:left;">
            <xsl:choose>
	          <xsl:when test="PartnershipUSAddress">
	               <xsl:call-template name="PopulateUSAddressTemplate">
	                    <xsl:with-param name="TargetNode" select="PartnershipUSAddress"/>
	               </xsl:call-template>
	          </xsl:when>
	          <xsl:otherwise>
	               <xsl:call-template name="PopulateForeignAddressTemplate">
	                    <xsl:with-param name="TargetNode" select="PartnershipForeignAddress"/>
	               </xsl:call-template>
	          </xsl:otherwise>
	     </xsl:choose>
          <!--    <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PartnershipAddress/AddressLine1" />
              </xsl:call-template>
              <xsl:if test="PartnershipAddress/AddressLine2 != ''">
                <br /><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="PartnershipAddress/AddressLine2" />                      </xsl:call-template>
                  </xsl:if>
              <xsl:if test="PartnershipAddress/City != ''"><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PartnershipAddress/City" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="PartnershipAddress/State != ''">, <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PartnershipAddress/State" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="PartnershipAddress/ZIPCode != ''"><span style="width:7px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PartnershipAddress/ZIPCode" />
                </xsl:call-template>
              </xsl:if>-->
            </td>
             <td class="styDepTblCell" style="text-align:right;width:30mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PartnershipAmt"/>
              </xsl:call-template>
            </td>
  
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>  
  
  
  <!-- VERTICAL TABLE STYLE COMMENTED

  
  <xsl:template name="ShowIODS">
    
    <xsl:for-each select="$IODSData/ItemizedOtherDeduction">
      <table id="IODSTbl" class="styDepTbl">    
        
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
            Description
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Description" />
            </xsl:call-template>
          </td>
        </tr>        
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Amount
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Amount" />
              </xsl:call-template>
            </span>
          </td>
        </tr>        
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Name of partnership
          </th>
          <td class="styDepTblCell" style="text-align:center;text-align:left;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine1" />
            </xsl:call-template>
            <xsl:if test="PartnershipName/BusinessNameLine2 != ''">
              <br /><xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine2" />
                </xsl:call-template>
            </xsl:if>            
          </td>
        </tr>        
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Partnership EIN
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PartnershipEIN" />
            </xsl:call-template>
          </td>
        </tr>
                
        
        <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Partnership address          
        </th>
        <td class="styDepTblCell" style="text-align:center;text-align:left;" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="PartnershipAddress/AddressLine1" />
          </xsl:call-template>
          <xsl:if test="PartnershipAddress/AddressLine2 != ''">
            <br /><xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PartnershipAddress/AddressLine2" />                      </xsl:call-template>
              </xsl:if>
          <xsl:if test="PartnershipAddress/City != ''"><br />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PartnershipAddress/City" />
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="PartnershipAddress/State != ''">, <br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PartnershipAddress/State" />
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="PartnershipAddress/ZIPCode != ''">- 
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PartnershipAddress/ZIPCode" />
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
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$IODSData"/></xsl:call-template>  
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
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>    
        <div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:100mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$IODSData"/></xsl:call-template>        
              
        <xsl:call-template name="ShowIODS"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>