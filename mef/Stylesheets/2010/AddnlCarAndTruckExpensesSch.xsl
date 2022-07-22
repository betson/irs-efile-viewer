<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:param name="DependencyData" select="$RtnDoc/AddnlCarAndTruckExpensesSch" />
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
  <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>  
  </xsl:param>
  <xsl:template name="AddnlCarAndTruckExpensesSchTemp">
    <table id="AddnlCarAndTruckExpensesSchTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center">Vehicle Placed In Service Date</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Business Miles</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Commuting Miles</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Other Miles</th>
               <th class="styDepTblCell"  scope="col" style="text-align:center">Available For Off Duty Hours </th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Another Vehicle </th>
       
           <th class="styDepTblCell"  scope="col" style="text-align:center">Evidence To Support Deduction</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Evidence Written</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
       <xsl:for-each select="$DependencyData/AddnlCarAndTruckExpenses">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!-- Date Vehicle Placed In Service --> 
          <td class="styDepTblCell" style="width:25mm;text-align:center;">
              <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDT" />
              </xsl:call-template>            
            </td>
          <!-- BusinessMiles -->
          <td class="styDepTblCell" style="width:27mm;text-align:right;" >
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessMiles" />
                </xsl:call-template>              
          </td>
          <!-- CommutingMiles -->
          <td class="stydepTblCell" style="width:27mm;text-align:right;">
          	<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CommutingMiles" />
                </xsl:call-template>
          </td>
          <!-- OtherMiles-->
          <td class="styDepTblCell" style="width:27mm;text-align:right;">          
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="OtherMiles" />
              </xsl:call-template>            
                </td>
                
                <!-- AvailableForOffDutyHoursInd -->
          <td class="stydepTblCell" style="text-align:center;">  
                 <xsl:if test="AvailableForOffDutyHoursInd">
              <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
                </xsl:call-template>        
                   </xsl:if>    
                   <xsl:if test="AvailableForOffDutyHoursInd">
                  <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
                </xsl:call-template>     
                </xsl:if>      
          </td>
                 <!-- AnotherVehicleInd--> 
           <td class="styDepTblCell" style="text-align:center;">   
             <xsl:if test="AnotherVehicleInd">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
                </xsl:call-template>     
                </xsl:if>     
                  <xsl:if test="AnotherVehicleInd">
                  <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
                </xsl:call-template>     
                </xsl:if>     
            </td>
	  
	  <!-- EvidenceToSupportDeductionInd -->
          <td class="stydepTblCell" style="text-align:center;">     
              <xsl:if test="EvidenceToSupportDeductionInd">
            <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
                </xsl:call-template>     
                      </xsl:if>      
                     <xsl:if test="EvidenceToSupportDeductionInd">
                  <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
                </xsl:call-template>     
                </xsl:if>        
          </td>
           <!-- AnotherVehicleInd -->
          <td class="stydepTblCell" style="text-align:center;"> 
                   <xsl:if test="EvidenceWrittenInd">
            <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="EvidenceWrittenInd" />
                </xsl:call-template>      
                      </xsl:if>      
                      <xsl:if test="EvidenceWrittenInd">
                  <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="EvidenceWrittenInd" />
                </xsl:call-template>     
                </xsl:if>         
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
      <xsl:call-template name="DocumentHeaderDependency">
      </xsl:call-template>
    
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:150mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
        </xsl:call-template>                
        <xsl:call-template name="AddnlCarAndTruckExpensesSchTemp" />    
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

