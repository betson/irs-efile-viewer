<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS990PFStyle.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="FormData" select="$RtnDoc/IRS990PF" />

<xsl:template name="PopulateAdditionalRows">
  <xsl:param name="RowCounter" />
  <xsl:if test="$RowCounter &lt;25">
    <tr>
      <td class="styTableCell" style="text-align:left; width: 15mm"><span class="styTableCellPad"></span></td>
      <td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 173mm">
      <xsl:if test="($Print=$Separated) and (count($FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps) &gt;24) and ($RowCounter=1)">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/RlnOfActyToAccomOfExemptPrps/RlnOfActyToAccomOfExemptPrps/RelationshipStatement"/>
                        </xsl:call-template>
                      </xsl:if>
      <span class="styTableCellPad"></span></td>      
    </tr>
    <xsl:call-template name="PopulateAdditionalRows">
      <xsl:with-param name="RowCounter" select="$RowCounter + 1"></xsl:with-param>
    </xsl:call-template>
  </xsl:if> 
</xsl:template>

<xsl:template name="PopulateAdditionalRows2">
  <xsl:param name="RowCounter" />
  <xsl:if test="$RowCounter &lt;17">
    <tr>
      <td class="styTableCell" style="text-align:left; width: 15mm"><span class="styTableCellPad"></span></td>
      <td class="styTableCell" style="text-align:left; width: 32mm; font-size: 6pt">
      <xsl:if test="($Print=$Separated) and (count($FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule) &gt;16) and $RowCounter=1">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/TransferSchedule/AmountInvolved"/>
                        </xsl:call-template>
                    </xsl:if>
      <span class="styTableCellPad"></span></td>
      <td class="styTableCell" style="text-align:left; width: 55mm"><span class="styTableCellPad"></span></td>
      <td class="styTableCell" style="text-align:left; width: 85mm; border-right-width: 0px"><span class="styTableCellPad"></span></td>     
    </tr>
    <xsl:call-template name="PopulateAdditionalRows2">
      <xsl:with-param name="RowCounter" select="$RowCounter + 1"></xsl:with-param>
    </xsl:call-template>
  </xsl:if> 
</xsl:template>

<xsl:template name="PopulateAdditionalRows3">
  <xsl:param name="RowCounter" />
  <xsl:if test="$RowCounter &lt;6">
    <tr>
      <td class="styTableCell" style="text-align:left; width: 70mm">
      <xsl:if test="($Print=$Separated) and (count($FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule) &gt;5) and ($RowCounter=1)">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/TrnsfrTrRlnWithNoncharitableEO/RelationshipSchedule/NameOfOrganization/BusinessNameLine1"/>
                        </xsl:call-template>
                    </xsl:if>
      <span class="styTableCellPad"></span></td>
      <td class="styTableCell" style="text-align:left; width: 47mm"><span class="styTableCellPad"></span></td>
      <td class="styTableCell" style="text-align:left; width: 70mm; border-right-width: 0px"><span class="styTableCellPad"></span></td>     
    </tr>
    <xsl:call-template name="PopulateAdditionalRows3">
      <xsl:with-param name="RowCounter" select="$RowCounter + 1"></xsl:with-param>
    </xsl:call-template>
  </xsl:if> 
</xsl:template>

<xsl:template name="AddRowsLine1">
  <xsl:param name="RowCount" />
  <xsl:if test="$RowCount &lt;4">
    <tr>
      <td class="styLNAmountBox" style="width: 53mm; border-left-width: 0px; text-align:left">
      <xsl:if test="$RowCount=0 and $Print=$Separated">
      <xsl:if test="$FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee/PersonName != ''">
        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee/PersonName"/>
                        </xsl:call-template>
                        </xsl:if>
                      <xsl:if test="$FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee/BusinessName != ''">
        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/OfcrDirTrusteesOrKeyEmployee/BusinessName"/>
                        </xsl:call-template>
                        </xsl:if>
                      </xsl:if><span class="styTableCellPad"></span>
                    </td>
      <td class="styLNAmountBox" rowspan="2"><span class="styTableCellPad"></span></td>
      <td class="styLNAmountBox" rowspan="2"><span class="styTableCellPad"></span></td>
      <td class="styLNAmountBox" rowspan="2" style="width: 38mm"><span class="styTableCellPad"></span></td>
      <td class="styLNAmountBox" rowspan="2" style="border-right-width:0px"><span class="styTableCellPad"></span></td>      
    </tr>
    <tr>
      <td class="styLNAmountBox" style="width: 53mm; border-left-width: 0px"><span class="styTableCellPad"></span></td>   
    </tr>
    <xsl:call-template name="AddRowsLine1">
      <xsl:with-param name="RowCount" select="$RowCount + 1"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="AddRowsLine2">
  <xsl:param name="RowCount" />
  <xsl:if test="$RowCount &lt;5">
    <tr>
      <td class="styLNAmountBox" style="width: 59mm; border-left-width: 0px; text-align: left">
      <xsl:if test="$RowCount = 0">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/CompOfHighestPaidEmplNONE"></xsl:with-param>
        </xsl:call-template>
        </xsl:if><span style="width: 1px"></span>
      </td>
      <td class="styLNAmountBox" rowspan="2"><span class="styTableCellPad"></span></td>
      <td class="styLNAmountBox" rowspan="2"><span class="styTableCellPad"></span></td>
      <td class="styLNAmountBox" rowspan="2"><span class="styTableCellPad"></span></td>
      <td class="styLNAmountBox" rowspan="2" style="border-right-width:0px"><span class="styTableCellPad"></span></td>      
    </tr>
    <tr>
      <td class="styLNAmountBox" style="width: 59mm; border-left-width: 0px"><span class="styTableCellPad"></span></td>   
    </tr>
    <xsl:call-template name="AddRowsLine2">
      <xsl:with-param name="RowCount" select="$RowCount + 1"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="AddRowsLine3">
  <xsl:param name="RowCount" />
  <xsl:if test="$RowCount &lt;5">
    <tr>
      <td class="styLNAmountBox" style="text-align: left; width: 91mm; border-left-width: 0px">
        <xsl:if test="$RowCount = 0">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$FormData/OfcrDirTrusteesKeyEmployeeInfo/CompOfHghstPaidCntrctNONE"></xsl:with-param>
        </xsl:call-template>
        </xsl:if><span style="width: 1px"></span>
      </td>
      <td class="styLNAmountBox" rowspan="2" style="width: 64mm"><span class="styTableCellPad"></span></td>
      <td class="styLNAmountBox" rowspan="2" style="border-right-width:0px"><span class="styTableCellPad"></span></td>      
    </tr>
    <tr>
      <td class="styLNAmountBox" style="width: 91mm; border-left-width: 0px"><span class="styTableCellPad"></span></td>
    </tr>
    <xsl:call-template name="AddRowsLine3">
      <xsl:with-param name="RowCount" select="$RowCount + 1"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="AdditionalRowsCapitalGains1">
    <xsl:param name="RowCount" />
    <xsl:if test="$RowCount &lt; 6">
      <tr>
        <td class="styLNLeftLtrBox">
          <xsl:if test="(count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo)=0) or ((count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt;5) and ($Print = $Separated))">
            <xsl:if test="$RowCount = 1">
              <xsl:attribute name="style">width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm</xsl:attribute>
              1a
             </xsl:if>
             <xsl:if test="($RowCount != 1) and ($Print != $Separated)">
              <xsl:attribute name="style">width: 8mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 7mm</xsl:attribute>
              <xsl:call-template name="GenerateLetter2"><xsl:with-param name="RowCount" select="$RowCount" /></xsl:call-template>
             </xsl:if>
           </xsl:if>
           <xsl:if test="count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo)!=0 and $RowCount != 1">
               <xsl:attribute name="style">border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm</xsl:attribute>
               <xsl:call-template name="GenerateLetter2"><xsl:with-param name="RowCount" select="$RowCount" /></xsl:call-template>
           </xsl:if>
         </td>
         <td class="styTableCell" style="width: 105mm;text-align: left">
           <xsl:if test="($RowCount = 1) and (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt;5) and ($Print = $Separated)">
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo"/>
            </xsl:call-template>
           </xsl:if>
           <span class="styTableCellPad" />
        </td>
        <td class="styTableCell" style="width: 24mm"><span class="styTableCellPad"></span></td>     
        <td class="styTableCell" style="width: 25mm"><span class="styTableCellPad"></span></td>     
        <td class="styTableCell" style="width: 25mm; border-right-width:0px"><span class="styTableCellPad"></span></td>     
      </tr>
      <xsl:if test="$RowCount=0">
        <xsl:call-template name="AdditionalRowsCapitalGains1">
            <xsl:with-param name="RowCount" select="$RowCount + 2" />
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="$RowCount!= 0">
        <xsl:call-template name="AdditionalRowsCapitalGains1">
            <xsl:with-param name="RowCount" select="$RowCount + 1" />
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
</xsl:template>

<xsl:template name="AdditionalRowsCapitalGains2">
    <xsl:param name="RowCount" />
    <xsl:if test="$RowCount &lt;6">
            <tr>
      <td class="styLNLeftLtrBox" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-left: 5mm"><xsl:call-template name="GenerateLetter2"><xsl:with-param name="RowCount" select="$RowCount" /></xsl:call-template></td>
      <td class="styTableCell" style="width: 39mm; text-align: left">
      <xsl:if test="($RowCount = 1) and (count($FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo) &gt;5) and ($Print = $Separated)">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/CapitalGainsAndLosses/CapitalGainsAndLossesInfo"/>
                        </xsl:call-template>
      </xsl:if><span class="styTableCellPad" />
          </td>
      <td class="styTableCell" style="width: 45mm"><span class="styTableCellPad"></span></td>     
      <td class="styTableCell" style="width: 45mm"><span class="styTableCellPad"></span></td>     
      <td class="styTableCell" style="width: 50mm; border-right-width:0px"><span class="styTableCellPad"></span></td>     
    </tr>
    <xsl:call-template name="AdditionalRowsCapitalGains2">
        <xsl:with-param name="RowCount" select="$RowCount + 1" />
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="GenerateLetter">
  <xsl:if test="position()=1">a</xsl:if>
  <xsl:if test="position()=2">b</xsl:if>
  <xsl:if test="position()=3">c</xsl:if>
  <xsl:if test="position()=4">d</xsl:if>
  <xsl:if test="position()=5">e</xsl:if>
  <xsl:if test="position() &gt;5"><span style="width: 1.5mm" /></xsl:if>
</xsl:template>

<xsl:template name="GenerateLetter2">
  <xsl:param name="RowCount" />
  <xsl:if test="$RowCount=1">a</xsl:if>
  <xsl:if test="$RowCount=2">b</xsl:if>
  <xsl:if test="$RowCount=3">c</xsl:if>
  <xsl:if test="$RowCount=4">d</xsl:if>
  <xsl:if test="$RowCount=5">e</xsl:if>
  <xsl:if test="$RowCount=6">f</xsl:if>
</xsl:template>

<xsl:template name="GenerateLetter3">
  <xsl:if test="position()=1">a</xsl:if>
  <xsl:if test="position()=2">b</xsl:if>
  <xsl:if test="position()=3">c</xsl:if>
  <xsl:if test="position()=4">d</xsl:if>
  <xsl:if test="position()=5">e</xsl:if>
  <xsl:if test="position()=6">f</xsl:if>
  <xsl:if test="position() &gt;6"><span style="width: 1.5mm" /></xsl:if>
</xsl:template>

<xsl:template name="RowsAtoF">
<xsl:param name="RowCount" />
<xsl:param name="Letters" />
          <xsl:if test="$RowCount &lt;$Letters">
              <tr>
      <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 71mm">
         <span class="styBoldText" style="padding-left: 4.5mm"><xsl:call-template name="GenerateLetter2"><xsl:with-param name="RowCount" select="$RowCount" /></xsl:call-template></span><span style="width: 1mm"></span><span class="styIRS990PFUnderlinedText" style="width: 52mm">
         <xsl:if test="($RowCount = 1) and (count($FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII) != 0) and ($Print = $Separated)">
           <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$FormData/AnalysisIncomeProducingActy/ProgramServiceRevenuePartVII"/>
                      </xsl:call-template>
                      </xsl:if>
                    </span></td>
      <td class="styTableCellSmall" style="width: 20mm"><span class="styTableCellPad"></span></td>      
      <td class="styTableCellSmall" style="width: 25mm"><span class="styTableCellPad"></span></td>
      <td class="styTableCellSmall" style="width: 25mm"><span class="styTableCellPad"></span></td>
      <td class="styTableCellSmall" style="width: 25mm"><span class="styTableCellPad"></span></td>      
      <td class="styTableCellSmall" style="border-right-width:0px; width: 25mm"><span class="styTableCellPad"></span></td>      
    </tr>
    <xsl:call-template name="RowsAtoF"><xsl:with-param name="RowCount" select="$RowCount + 1" /><xsl:with-param name="Letters" select="$Letters" /></xsl:call-template>
          </xsl:if>
</xsl:template>
<xsl:template match="/">

<html>
<head>

<title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Cache-Control" content="private"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="Description" content="IRS Form 990-PF"/>
<META name="GENERATOR" content="IBM WebSphere Studio"/>



<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
<xsl:call-template name="InitJS"></xsl:call-template>
<style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="IRS990PFStyle"></xsl:call-template>  
    <xsl:call-template name="AddOnStyle"></xsl:call-template> 
  </xsl:if>
</style>

<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
<form name="IRS990PF">


<!--END HEADER-->

<!--  Part XV  -->
<div style="width:187mm;border-top-width: 1px" class="styBB">
  <div class="styPartName">Part XV</div>
  <div class="styPartDesc" style="width: 160mm">
    Supplementary Information<span class="styNormalText"> (continued) </span>
  </div>
  <div style="float:right">      
          <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear" />              
              <xsl:with-param name="containerHeight" select="9" />
              <xsl:with-param name="headerHeight" select="3" />
              <xsl:with-param name="containerID" select="'Paidctn'" />
          </xsl:call-template>          
        </div>
</div>

<div class="styTableContainerNBB" style="width: 187mm; border-bottom-width: 0px" id="Paidctn">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
  <thead>
    <tr scope="col">
      <th class="styTableCellHeader" colspan="5" style="text-align: left; height: 4mm; width: 187mm; border-right-width: 0px"><span class="styPartDesc" style="padding-left: 0px">3 Grants and Contributions Paid During the Year or Approved for Future Payment</span> 
      </th>
    </tr>
    <tr>
      <th class="styTableCellHeader" style="height: 4mm; width: 55mm">
        <span class="styNormalText">
          Recipient
        </span>
      </th>
      <th class="styTableCellHeader" rowspan="2" style="height: 4mm; width: 40mm">
        <span class="styNormalText">
          If recipient is an individual,<br/>
          show any relationship to<br/>
          any foundation manager<br/>
          or substantial contributor<br/>
        </span>
      </th>
      <th class="styTableCellHeader" rowspan="2" style="height: 4mm; width: 20mm">
        <span class="styNormalText">
          Foundation<br/>
          status of<br/>
          recipient
        </span>
      </th>
      <th class="styTableCellHeader" rowspan="2" style="height: 4mm; width: 40mm">
        <span class="styNormalText">
          Purpose of grant or<br/>
          contribution
        </span>
      </th>
      <th class="styTableCellHeader" rowspan="2" style="height: 4mm; width: 32mm; border-right-width: 0px">
        <span class="styNormalText">
          Amount
        </span>
      </th>
    </tr>
    <tr>
      <th class="styTableCellHeader" style="height: 4mm; width: 55mm">
        <span class="styNormalText">
          Name and address (home or business)
        </span>
      </th>
    </tr>
  </thead>
  <tfoot></tfoot>
  <tbody valign="top">
    <tr>
      <td class="styTableCell" style="border-bottom-width: 0px; text-align:left; width: 55mm">
         <span class="styBoldText">a</span><span style="width: 2mm"></span>
         <span class="styItalicText">Paid during the year</span> 
       </td>
      <td class="styTableCell" style="border-bottom-width: 0px; width: 40mm"><span class="styTableCellPad"></span></td>     
      <td class="styTableCell" style="border-bottom-width: 0px; text-align: center; width: 20mm"><span class="styTableCellPad"></span></td>     
      <td class="styTableCell" style="border-bottom-width: 0px; text-align: center; width: 45mm"><span class="styTableCellPad"></span></td>
      <td class="styTableCell" style="border-bottom-width: 0px; width: 32; border-right-width: 0px"><span class="styTableCellPad"></span></td>    
    </tr>
    <xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($FormData/SupplementaryInformation/GrantOrContriPaidDuringYear) &lt;5))">
    <xsl:for-each select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear">
    <tr style="border-bottom-width: 0px">
      <td class="styTableCell" style="text-align:left; width: 55mm">
        <xsl:if test="count(RecipientPersonName) &gt;0">
          <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RecipientPersonName" />
                </xsl:call-template>
               </xsl:if>
              <xsl:if test="count(RecipientBusinessName/BusinessNameLine1) &gt;0">
                <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1" />
                </xsl:call-template>
               </xsl:if>
               <xsl:if test="count(RecipientBusinessName/BusinessNameLine2) &gt;0"><br/>
                <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2" />
                </xsl:call-template>
               </xsl:if>
               <xsl:if test="count(RecipientUSAddress) &gt;0"><br />
                <xsl:call-template name="PopulateUSAddressTemplate">
              <xsl:with-param name="TargetNode" select="RecipientUSAddress" />
                </xsl:call-template>
               </xsl:if>
                <xsl:if test="count(RecipientForeignAddress) &gt;0"><br />
                <xsl:call-template name="PopulateForeignAddressTemplate">
              <xsl:with-param name="TargetNode" select="RecipientForeignAddress" />
                </xsl:call-template>
               </xsl:if>
       </td>
      <td class="styTableCell" style="text-align: left; width: 40mm">
          <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RecipientRelationship" />
                </xsl:call-template>
           </td>      
      <td class="styTableCell" style="text-align: left; width: 20mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RecipientFoundationStatus" />
                </xsl:call-template>
           </td>      
      <td class="styTableCell" style="text-align: left; width: 45mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PurposeOfGrantOrContribution" />
                </xsl:call-template>
            </td>
      <td class="styTableCell" style="text-align: right; width: 32mm; border-right-width: 0px">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="Amount" />
                </xsl:call-template>
           </td>    
    </tr>
    </xsl:for-each>
    </xsl:if>
    <xsl:if test="(count($FormData/SupplementaryInformation/GrantOrContriPaidDuringYear) &lt;1) or (($Print = $Separated) and (count($FormData/SupplementaryInformation/GrantOrContriPaidDuringYear) &gt;4))">
    <tr style="height: 126mm">
      <td class="styTableCell" style="text-align:left; width: 55mm">
         <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear/RecipientPersonName"/>
                      </xsl:call-template>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear/RecipientBusinessName"/>
                      </xsl:call-template></td>
      <td class="styTableCell" style="text-align: left; width: 40mm"><span style="width: 1px" /></td>     
      <td class="styTableCell" style="text-align: left; width: 20mm"><span style="width: 1px" /></td>     
      <td class="styTableCell" style="text-align: left; width: 45mm"><span style="width: 1px" /></td>
      <td class="styTableCell" style="text-align: right; width: 32mm; border-right-width: 0px"><span style="width: 1px" /></td>   
    </tr>   
    </xsl:if>
    <tr>
      <td class="styTableCell" style="text-align: left; width: 155mm; padding-left: 4mm" colspan="4"> <span class="styBoldText">Total <span class="styDotLn" style="float:none; clear:none">..................................</span><img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/><span style="width: 1.5mm"></span> 3a</span></td>
      <td class="styTableCell" style="width: 32mm; border-right-width: 0px">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/TotGrantOrContriPaidDuringYear" />
                </xsl:call-template>
           </td>
    </tr>
  </tbody>
</table>
</div>
<xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriPaidDuringYear"/>
            <xsl:with-param name="containerHeight" select="9"/>
            <xsl:with-param name="containerID" select=" 'Paidctn' "/>
 </xsl:call-template>
 
 <div class="styGenericDiv" style="width: 187mm">
       <div style="float:right">      
          <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture" />              
              <xsl:with-param name="containerHeight" select="5" />
              <xsl:with-param name="headerHeight" select="2" />
              <xsl:with-param name="containerID" select="'Futurectn'" />
          </xsl:call-template>          
        </div>
</div>

<div class="styTableContainerNBB" style="width: 187mm; border-bottom-width: 0px" id="Futurectn">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
      <thead></thead>
  <tfoot></tfoot>
  <tbody valign="top">
  <tr>
      <td class="styTableCell" style="border-bottom-width: 0px; text-align:left;  width: 55mm">
       <span class="styBoldText">b</span><span style="width: 2mm"></span>
       <span class="styItalicText">Approved for future payment</span> 
       </td>
       <td class="styTableCell" style="border-bottom-width: 0px; width: 40mm"><span class="styTableCellPad"></span></td>      
        <td class="styTableCell" style="border-bottom-width: 0px; width: 20mm"><span class="styTableCellPad"></span></td>     
    <td class="styTableCell" style="border-bottom-width: 0px; width: 40mm"><span class="styTableCellPad"></span></td>
    <td class="styTableCell" style="border-bottom-width: 0px; border-right-width: 0px"><span class="styTableCellPad"></span></td>
    </tr>
    <xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($FormData/SupplementaryInformation/GrantOrContriApprovedForFuture) &lt;4))">
  <xsl:for-each select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture">
  <tr>
              <td class="styTableCell" style="text-align:left;  width: 55mm">
       <xsl:if test="count(RecipientPersonName) &gt;0">
          <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RecipientPersonName" />
                </xsl:call-template>
               </xsl:if>
              <xsl:if test="count(RecipientBusinessName/BusinessNameLine1) &gt;0">
                <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1" />
                </xsl:call-template>
               </xsl:if>
               <xsl:if test="count(RecipientBusinessName/BusinessNameLine2) &gt;0"><br/>
                <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2" />
                </xsl:call-template>
               </xsl:if>
               <xsl:if test="count(RecipientUSAddress) &gt;0"><br />
                <xsl:call-template name="PopulateUSAddressTemplate">
              <xsl:with-param name="TargetNode" select="RecipientUSAddress" />
                </xsl:call-template>
               </xsl:if>
                <xsl:if test="count(RecipientForeignAddress) &gt;0"><br />
                <xsl:call-template name="PopulateForeignAddressTemplate">
              <xsl:with-param name="TargetNode" select="RecipientForeignAddress" />
                </xsl:call-template>
               </xsl:if>
          </td>
      <td class="styTableCell" style="text-align: left; width: 40mm">
          <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RecipientRelationship" />
                </xsl:call-template>
            </td>     
      <td class="styTableCell" style="text-align: left; width: 20mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RecipientFoundationStatus" />
                </xsl:call-template>
           </td>      
      <td class="styTableCell" style="text-align: left; width: 40mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PurposeOfGrantOrContribution" />
                </xsl:call-template>
           </td>
      <td class="styTableCell" style="width: 32mm; border-right-width: 0px">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="Amount" />
                </xsl:call-template>
           </td>    
    </tr>
    </xsl:for-each>
    </xsl:if>
    <xsl:if test="(count($FormData/SupplementaryInformation/GrantOrContriApprovedForFuture) &lt;1) or ((count($FormData/SupplementaryInformation/GrantOrContriApprovedForFuture) &gt;3) and ($Print = $Separated))">
    <tr style="height: 80mm">
          <td class="styTableCell" style="width: 55mm; text-align: left">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture/RecipientPersonName"/>
                      </xsl:call-template>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture/RecipientBusinessName"/>
                      </xsl:call-template>
                    </td>
      <td class="styTableCell" style="width: 40mm"><span class="styTableCellPad"></span></td>     
      <td class="styTableCell" style="width: 20mm"><span class="styTableCellPad"></span></td>     
      <td class="styTableCell" style="width: 40mm"><span class="styTableCellPad"></span></td>
      <td class="styTableCell" style="width: 32mm; border-right-width: 0px"><span class="styTableCellPad"></span></td>    
    </tr>
    </xsl:if>
    <tr>
      <td class="styTableCell" style="text-align: left; width: 155mm;padding-left: 4mm" colspan="4"> <span class="styBoldText">Total <span class="styDotLn" style="float:none; clear:none">..................................</span><img src="{$ImagePath}/990PF_Bullet_Md.gif" alt="bullet"/><span style="width: 1.5mm"></span> 3b</span></td>
      <td class="styTableCell" style="width: 32mm; border-right-width: 0px">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/TotGrantOrContriApprovedFuture" />
                </xsl:call-template>
           </td>
    </tr>
  </tbody>
</table>
</div>
<xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/SupplementaryInformation/GrantOrContriApprovedForFuture"/>
            <xsl:with-param name="containerHeight" select="5"/>
            <xsl:with-param name="containerID" select=" 'Futurectn' "/>
 </xsl:call-template>
 

</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
