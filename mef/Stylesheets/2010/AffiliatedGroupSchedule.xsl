<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/AffiliatedGroupSchedule" />
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
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
         <meta name="Description" content="{$depDocTitle}" />
         
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"></xsl:call-template>
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass">  
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width: 80mm">
            <xsl:value-of select="$depDocTitle" />
          </span>
        </div>
        <!--Adding template for common left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
<table class="styDepTbl">

<!--********************************************************-->
<!--
<thead class="styTableThead">        
            <tr class="styDepTblHdr">           
               <th class="styDepTblCell" scope="col" nowrap="nowrap">Business Name</th>

<th class="styDepTblCell" scope="col" nowrap="nowrap">Address US</th>

<th class="styDepTblCell" scope="col" nowrap="nowrap">Foreign Address</th>

<th class="styDepTblCell" scope="col" nowrap="nowrap">EIN</th> 


<th class="styDepTblCell" scope="col" nowrap="nowrap">Electing Org</th> 

<th class="styDepTblCell" scope="col" nowrap="nowrap">Total Grassroots Lobbying</th> 

<th class="styDepTblCell" scope="col" nowrap="nowrap">Total Direct Lobbying</th> 

<th class="styDepTblCell" scope="col" nowrap="nowrap">Total Lobbying Expenditures</th> 

<th class="styDepTblCell" scope="col" nowrap="nowrap">Other Exempt Purpose Expenditures</th> 

<th class="styDepTblCell" scope="col" nowrap="nowrap">Total Exempt Purpose Expenditures</th> 

<th class="styDepTblCell" scope="col" nowrap="nowrap">Lobbying Nontaxable Amount</th> 

<th class="styDepTblCell" scope="col" nowrap="nowrap">Grassroots Nontaxable Amount</th> 

<th class="styDepTblCell" scope="col" nowrap="nowrap">Tot Lobbying Grassroot Minus Non tx</th> 

<th class="styDepTblCell" scope="col" nowrap="nowrap">Tot Lobby Expend Mns Lobbying Non tx</th> 

<th class="styDepTblCell" scope="col" nowrap="nowrap">Share Of Excess Lobbying Expendtrs</th>

            </tr>
          </thead>  
          <tfoot></tfoot>
          <tbody>    
-->
<xsl:for-each select="$DependencyData/AffiliatedSchedule">

<tr>
<td class="styDepTblCell" style = "width:187mm">
<xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>

        <!--Displaying Dependencies-->        
        <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Affiliated Group Business Name:</span></div>  
            <div class="styExplanationLine">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
            </div>
          </div>
        </div> 
        
        
        
         <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;"></span></div>  
            <div class="styExplanationLine">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
          </div>
        </div> 
        
        
        
        <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Address. Either US or Foreign Type:</span></div>  

        <div class="styExplanationLine">

        <xsl:if test="AddressUS/AddressLine1 != ''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="AddressUS/AddressLine1" />
              </xsl:call-template> 
            </xsl:if>
            <xsl:if test="AddressUS/AddressLine1 != ''"><br/></xsl:if> 
            <xsl:if test="AddressUS/AddressLine2 != ''">            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="AddressUS/AddressLine2" />
              </xsl:call-template><br/>
            </xsl:if>
            <xsl:if test="AddressUS/City != ''">             
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="AddressUS/City" />
              </xsl:call-template>, 
            </xsl:if> 
            <xsl:if test="AddressUS/State != ''">            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="AddressUS/State" />
              </xsl:call-template><span style="width: 4px"></span> 
            </xsl:if>             
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="AddressUS/ZIPCode" />
            </xsl:call-template>     
          <!-- foreign Address -->
            <xsl:if test="ForeignAddress/AddressLine1 != ''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1" />
              </xsl:call-template><br/> 
            </xsl:if>        
            <xsl:if test="ForeignAddress/AddressLine2 != ''">    
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2" />
              </xsl:call-template><br/>
            </xsl:if>  
            <xsl:if test="ForeignAddress/City != ''">          
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/City" />
              </xsl:call-template>, 
            </xsl:if>   
            <xsl:if test="ForeignAddress/ProvinceOrState != ''">          
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState" />
              </xsl:call-template>, 
            </xsl:if>            
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ForeignAddress/Country" />
            </xsl:call-template> 
            <span style="width: 4mm"></span>    
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode" />
            </xsl:call-template>     
        </div>
        </div> 
        </div>
         
        <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">EIN:</span></div>  
            <div class="styExplanationLine">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="EIN"/>
              </xsl:call-template>
            </div>
          </div>
        </div>  
        
        <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Electing Organization Checkbox:</span></div>  
            <div class="styExplanationLine">
            <input type="checkbox" class="styCkbox">
             <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="ElectingOrg"/>
              <xsl:with-param name="BackupName">IRS1065ScheduleKTotalForeignTaxesPaid</xsl:with-param>
             </xsl:call-template>
           </input> 

             </div>
          </div>
        </div>            


<div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Total Grassroots Lobbying:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalGrassrootsLobbying"/>
              </xsl:call-template>
            </div>
          </div>
        </div>            

<div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Total Direct Lobbying:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">
          
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalDirectLobbying"/>
              </xsl:call-template>
            </div>
          </div>
        </div>            

<div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Total Lobbying Expenditures:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalLobbyingExpenditures"/>
              </xsl:call-template>
            </div>
          </div>
        </div>            

<div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Other Exempt Purpose Expenditures:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OtherExemptPurposeExpenditures"/>
              </xsl:call-template>
            </div>
          </div>
        </div>            

        <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Total Exempt Purpose Expenditures:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalExemptPurposeExpenditures"/>
              </xsl:call-template>
            </div>
          </div>
        </div>            

    <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Lobbying Nontaxable Amount:</span></div> 
<div style="float:left;clear:none;width:44mm;text-align:left">
 
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="LobbyingNontaxableAmount"/>
              </xsl:call-template>
            </div>
          </div>
        </div>            
              
                
         <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Grassroots Nontaxable Amount:</span></div> 
<div style="float:left;clear:none;width:44mm;text-align:left">
 
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="GrassrootsNontaxableAmount"/>
              </xsl:call-template>
            </div>
          </div>
        </div>            
         
                  
           <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Tot Lobbying Grassroot Minus Non Tx:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="  TotLobbyingGrassrootMinusNontx"/>
              </xsl:call-template>
            </div>
          </div>
        </div>         
                
     
     <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Tot Lobby Expend Mns Lobbying Non Tx:</span></div> 
<div style="float:left;clear:none;width:44mm;text-align:left">
 
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotLobbyExpendMnsLobbyingNontx"/>
              </xsl:call-template>
            </div>
          </div>
        </div>               
          
           <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Share Of Excess Lobbying:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ShareOfExcessLobbyingExpendtrs"/>
              </xsl:call-template>
            </div>
          </div>
        </div>               

    <!-->      
          <div class="styTopSectionLine">
          <div style="float: left; clear: none">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:right;font-size:10pt;">Expenditures:</span></div>  
            <div class="styExplanationLine">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Expenditures"/>
              </xsl:call-template>
            </div>
          </div>
        </div>               
     -->   
     </td>
     </tr>
          </xsl:for-each>
         <!-- </tbody>-->
           </table>
      </body> 
      </html>   
  </xsl:template>
</xsl:stylesheet>
