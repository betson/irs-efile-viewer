<?xml version="1.0" encoding="UTF-8"?>
<!-- Last modified on 1/15/2014 by Robert Jones for IBM Defect 36171 Left justify data, Wanted vertical lines in which I rejected -->
<!-- Last modified on 5/21/2015 by Robert Jones for UWR 123023 IE11 Upgrade Fixes-->
<!-- Last modified on 1/15/2014 by Robert Jones for IBM Defect 44889 508 JAWS reading out of order -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:param name="DependencyData" select="$RtnDoc/AffiliatedGroupSchedule"/>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
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
         <meta name="Description" content="{$depDocTitle}"/>
         
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass">  
        <xsl:call-template name="DocumentHeaderDependency"/>
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for common left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
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
<xsl:for-each select="$DependencyData/AffiliatedScheduleGrp">

<tr>
<td class="styDepTblCell" style="width:187mm">
<xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>

        <!--Displaying Dependencies-->        
        <div class="styTopSectionLine">
        
       <div style="float:left;clear:none;">
       <span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:9pt;">Affiliated Group Business Name:</span></div>  
            <div class="styExplanationLine" style=" text-align:left;">
          <xsl:if test="BusinessName/BusinessNameLine1 != ''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
              </xsl:call-template><br/>
              </xsl:if>
              <xsl:if test="BusinessName/BusinessNameLine2 != ''">
               <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
              </xsl:call-template><br/>
              </xsl:if>
              </div>
            </div>
               
               
        <div class="styTopSectionLine">
      
            <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Address. Either US or Foreign Type:</span>
            </div>  
        <div class="styExplanationLine" style="text-align:left;">
        <xsl:if test="USAddress/AddressLine1 != ''">
        <div style="float: left; clear: none">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
              </xsl:call-template> 
              </div> 
            </xsl:if>
            <xsl:if test="USAddress/AddressLine1 != ''">
            <br/>
            </xsl:if> 
            <xsl:if test="USAddress/AddressLine2 != ''">    
            <div style="float: left; clear: none">        
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
              </xsl:call-template><br/>
              </div>
            </xsl:if>
            <br/>
            <xsl:if test="USAddress/City != ''">  
                  <div style="float: left; clear: none">     
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="USAddress/City"/>
              </xsl:call-template>,
              <span style="width: 1px"/>
               </div>
            </xsl:if> 
            <xsl:if test="USAddress/State != ''">  
            <div style="float: left; clear: none">             
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="USAddress/State"/>
              </xsl:call-template>
              <span style="width: 5px"/> 
              </div>
            </xsl:if>        
            <div style="float: left; clear: none">     
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
            </xsl:call-template>    
            </div> 
            
          <!-- foreign Address -->
            <xsl:if test="ForeignAddress/AddressLine1 != ''">
            <div style="float: left; clear: none">   
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
              </xsl:call-template> 
              </div> 
            </xsl:if>  
            <br/>      
            <xsl:if test="ForeignAddress/AddressLine2 != ''">    
            <div style="float: left; clear: none"> 
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
              </xsl:call-template>
              </div> 
              </xsl:if>  
            <br/>
            <xsl:if test="ForeignAddress/City != ''">    
                  <div style="float: left; clear: none">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
              </xsl:call-template>, 
              </div> 
            </xsl:if>   
            <br/>
             <xsl:if test="ForeignAddress/ProvinceOrState != ''">  
                  <div style="float: left; clear: none">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
              </xsl:call-template>
              <span style="width: 3px"/> 
              </div>
            </xsl:if>     
            
             <div style="float: left; clear: none">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
            </xsl:call-template>
            <span style="width: 2px"/> 
           </div>
             <div style="float: left; clear: none">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
            </xsl:call-template>     
            </div>
        </div>
        </div> 
       
         
        <div class="styTopSectionLine">
          
            <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">EIN:</span>
            </div>  
          <div class="styExplanationLine" style="text-align:left;">
                 <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="EIN"/>
              </xsl:call-template>
              </div>
            </div>
            
            
            
         <div class="styTopSectionLine">
         <div style="float:left;clear:none;">
     <span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Electing Organization Checkbox:</span>
     </div>  
          <div class="styExplanationLine" style="text-align:left;">
            <div style="float:left;clear:none;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="ElectingOrganizationInd"/>
              <xsl:with-param name="BackupName">IRS1065ScheduleKTotalForeignTaxesPaid</xsl:with-param>
             </xsl:call-template>
           </input> 
</div>
             </div>
          </div>
             <br></br>
             
        <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Total Grassroots Lobbying:</span>
            </div>  
<div style="float:left;clear:none;width:44mm;text-align:left">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalGrassrootsLobbyAmt"/>
              </xsl:call-template>
            </div>
       
                
<br></br>
<div class="styTopSectionLine">
       
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Total Direct Lobbying:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">
          
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalDirectLobbyAmt"/>
              </xsl:call-template>
            </div>
          </div>
                

<div class="styTopSectionLine">
        
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Total Lobbying Expenditures:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalLobbyExpenditureAmt"/>
              </xsl:call-template>
            </div>
          </div>
                 

<div class="styTopSectionLine">
          
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Other Exempt Purpose Expenditures:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OtherExemptPurposeExpendAmt"/>
              </xsl:call-template>
            </div>
          </div>
              

        <div class="styTopSectionLine">
        
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Total Exempt Purpose Expenditures:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalExemptPurposeExpendAmt"/>
              </xsl:call-template>
            </div>
          </div>
           

    <div class="styTopSectionLine">
          
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Lobbying Nontaxable Amount:</span></div> 
<div style="float:left;clear:none;width:44mm;text-align:left">
 
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="LobbyNontxAmt"/>
              </xsl:call-template>
            </div>
          </div>
              
              
                
         <div class="styTopSectionLine">
         
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Grassroots Nontaxable Amount:</span></div> 
<div style="float:left;clear:none;width:44mm;text-align:left">
 
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="GrassrootsNontxAmt"/>
              </xsl:call-template>
            </div>
          </div>
              
         
                  
           <div class="styTopSectionLine">
       
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Tot Lobbying Grassroot Minus Non Tx:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="  TotalLobbyGrssrootMnsNontxAmt"/>
              </xsl:call-template>
            </div>
          </div>
              
                
     
     <div class="styTopSectionLine">
        
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Tot Lobby Expend Mns Lobbying Non Tx:</span></div> 
<div style="float:left;clear:none;width:44mm;text-align:left">
 
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotLbbyExpendMnsLobbyNontxAmt"/>
              </xsl:call-template>
            </div>
          </div>
                  
          
           <div class="styTopSectionLine">
         
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl" style="font-weight:bold;text-align:left;font-size:10pt;">Share Of Excess Lobbying:</span></div>  
<div style="float:left;clear:none;width:44mm;text-align:left">

             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ShareExcessLobbyExpendAmt"/>
              </xsl:call-template>
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