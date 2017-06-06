<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
  <xsl:import href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1118ScheduleIStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS1118ScheduleI"/>
      
  <!-- templates for filling blank rows -->    
  <!-- ////////////////////////////////////////////////  -->  
  <xsl:template name="RowWriterCore">
      <tr>
        <td class="IRS1118ScheduleI_GenericCell" style="width:6mm; font-weight:bold;text-align:center;" scope="row">&#160;</td>
        <td class="IRS1118ScheduleI_GenericCell">  &#160;</td>
        <td class="IRS1118ScheduleI_GenericCell">  &#160;</td>
        <td class="IRS1118ScheduleI_GenericCell">  &#160;</td>
        <td class="IRS1118ScheduleI_GenericCell">  &#160;</td>
        <td class="IRS1118ScheduleI_GenericCell">  &#160;</td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:45mm;border-right-width:0px;">&#160;</td>
      </tr>
  </xsl:template>
  
  <xsl:template name="AddRowsForSchAPartI">
    <xsl:param name="TargetNode"/>
    <tr>
      <td class="IRS1118ScheduleI_GenericCell" style="width: 6mm; text-align:center"><span class="styBoldText"><xsl:value-of select="$TargetNode"></xsl:value-of></span></td>
      <td class="IRS1118ScheduleI_GenericCell" style="text-align: left; width: 35mm"><span style="width: 1px"></span>
      <xsl:if test="$TargetNode = 'A'">
        	<xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6)">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtIncome/ForeignCountry"/>
              </xsl:call-template>
        	</xsl:if>
        </xsl:if>
      </td>
      <td class="IRS1118ScheduleI_GenericCell"><span class="styTableCellPad"></span></td>
      <td class="IRS1118ScheduleI_GenericCell"><span class="styTableCellPad"></span></td>
      <td class="IRS1118ScheduleI_GenericCell"><span class="styTableCellPad"></span></td>
      <td class="IRS1118ScheduleI_GenericCell"><span class="styTableCellPad"></span></td>
      <td class="IRS1118ScheduleI_GenericCell"><span class="styTableCellPad"></span></td>
      <td class="IRS1118ScheduleI_GenericCell" style="width: 45mm; border-right-width: 0px"><span class="styTableCellPad"></span></td>
    </tr>
</xsl:template>
  <!-- /////////////////////////////////////////// -->
  <xsl:template match="/">

<html><a name="JumpMark"></a>
<head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>

  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 1118Schedule I" />
  
  
  
  <!-- javascript include -->
  <!--  Ravi Venigalla 06/28/03 changed javascript path -->
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitNothing"></xsl:call-template>
  <style type="text/css">
    <xsl:if test="not($Print) or $Print=''">      
      <xsl:call-template name="IRS1118ScheduleIStyle"/>
      <xsl:call-template name="AddOnStyle"/>
  </xsl:if> 
  </style>
<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
  <xsl:call-template name="DocumentHeaderLandscape"></xsl:call-template>
  <!-- BEGIN FORM HEADER -->
  <div class="LineContainerLong">
    <!-- Form Name -->
    <div class="IRS1118ScheduleI_FormNumBlock">
       <span style="font-size:9pt;" class="styFormNumber">SCHEDULE I<br/>(Form 1118)</span>
       <xsl:call-template name="SetFormLinkInline">
           <xsl:with-param name="TargetNode" select="$FormData"/>
       </xsl:call-template>
       <br />
      <span style="font-size:6pt;">(Rev. January 2006)</span> 
       <br/>
       <span class="IRS1118ScheduleI_Agency">Department of the Treasury</span>
       <br />
       <span class="IRS1118ScheduleI_Agency">Internal Revenue Service</span>
    </div>

    <!-- Form Title Box -->
    <div class="IRS1118ScheduleI_FormTitleBlock">
      <!-- Form Title -->
      <span class="styMainTitle">Reduction of Oil and Gas Extraction Taxes</span>
      <!-- Form Subtitle -->
      <br /><br/>
      <span style="font-weight:bold">
         <img src="{$ImagePath}/1118SchI_Bullet.gif" width="4" height="7" alt="Right arrow" border="0"/> Attach to Form 1118 
      </span>
      <br/><br/>
      For calendar year  
      <span style="width: 20mm">
      <xsl:call-template name="PopulateReturnHeaderTaxYear" />
      </span>
          , or other tax year beginning
          <span style="width: 20mm">
          <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate" />
      </span>
              , and ending
        <span style="width: 20mm">
          <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate" />
      </span>
    </div>
      <!-- IRS1118ScheduleI_NameBox No. -->
    <div class="IRS1118ScheduleI_FormYearBlock">OMB No. 1545-0122</div>
  </div>
  <!-- Name and Address -->
  <div class="styBB" style="width:256mm;">
    <div class="styNameBox" style="width:206mm;height:8mm;font-size:7pt;">
      Name of corporation<br/>
      <span >
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
      </span>
    </div>
    <div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-weight:bold;font-size:7pt;">
      Employer identification number <br /><br />
      <span style="width:40mm;text-align:left;font-weight:normal;">
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>      
      </span>
    </div>
  </div>

  
  <!-- comment line -->
  <div class="LineContainerLong">
    <span style="font-size:8pt;font-style:italic;">
    Report all amounts in U.S. dollars. Complete a <span style="font-weight:bold;">separate </span>Schedule I for <span style="font-weight:bold;">each</span> applicable category of income.
    </span>
  </div>
  <!-- Part I-->
  <div class="LineContainerLong">
    <div class="IRS1118ScheduleI_PartIndex" style="border-bottom-width:1px;">Part I</div>
    <div class="IRS1118ScheduleI_LineDescLong" style="font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;width:236mm;">
       <span style="font-weight:bold;">
        Foreign Oil and Gas Extraction Income and Taxes
         </span>
    </div>
    <div class="IRS1118ScheduleI_LineDescLong" style="border-right-width:0px;border-top-width:1px;border-bottom-width:1px;width:4mm;text-align:right;" >
           <!-- button display logic -->
          <xsl:call-template name="SetTableToggleButton">
          <xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtIncome"/>
          <xsl:with-param name="containerHeight" select="6"/>
          <xsl:with-param name="containerID" select=" 'Table1' "/>
          </xsl:call-template>
          <!-- end button display logic -->
    </div>

  </div>
  <!-- Part I table columns 1-7 -->

  <div class="IRS1118ScheduleI_TableContainer" style="border-top-width:0px;border-bottom-width:0px;height:69mm;" name="Table1" id="Table1">
  <!-- print logic -->
    <xsl:call-template name="SetInitialState"/>
  <!-- end -->
     <table cellspacing="0" style="font-size:7pt;">
      <thead style="display:table-header-group;">
      <tr>
        <th class="IRS1118ScheduleI_GenericCell" style="width:6mm;height:12mm;background-color:lightgrey;text-align:center;" rowspan="2" scope="col">&#160;</th>
        <th class="IRS1118ScheduleI_GenericCell" style="width:45mm;height:12mm;text-align:center;" rowspan="2" scope="col">
          <span class="styBoldText">1. </span>Name of foreign country (Use a separate line for each country.)
        </th>
        <th class="IRS1118ScheduleI_GenericCell" style="height:4mm;width:205mm;font-size:7pt;font-weight:bold;border-right-width:0px;text-align:center;" colspan="6" scope="colgroup">
          Gross Oil and Gas Extraction Income From Sources Outside the United States and its Possessions
          <span style="font-weight:normal;">(See instructions.)</span>  
        </th>
      </tr>
      <tr>
        <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;" scope="col"> <span class="styBoldText">2.</span> Gross income from extraction of minerals from oil or gas wells</th>
        <th class="IRS1118ScheduleI_GenericCell"  style="text-align:center;" scope="col"> <span class="styBoldText">3. </span>Gross income from sale or exchange of assets used in extraction</th>
        <th class="IRS1118ScheduleI_GenericCell"  style="text-align:center;" scope="col">  <span class="styBoldText">4. </span> Certain dividends from foreign corporations</th>
        <th class="IRS1118ScheduleI_GenericCell"  style="text-align:center;" scope="col">  <span class="styBoldText">5. </span>Constructive distributions under section 951(a)</th>
        <th class="IRS1118ScheduleI_GenericCell"  style="text-align:center;" scope="col">  <span class="styBoldText">6.</span> Other</th>
        <th class="IRS1118ScheduleI_GenericCell" scope="col" style="width:45mm;border-right-width:0px;text-align:center;"> <span class="styBoldText">7. </span>Total (add columns 2 <br/>through 6)</th>
      </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>    
      <xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &lt;7))">     
      <xsl:for-each select="$FormData/ForeignOilGasExtIncome">
      <tr>
        <td class="IRS1118ScheduleI_GenericCell" style="width:6mm;font-weight:bold;text-align:center;" scope="row">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RowID"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="text-align:left;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="ForeignCountry"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="GrossIncomeMineralsExtraction"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="GrossIncomeFromSaleOfAssets"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="DividendsForeignCorporations"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="DistributionsSection951A"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OtherGrossIncome"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:45mm;border-right-width:0px;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalGrossIncome"/>
        </xsl:call-template>  
        </td>
      </tr>  
      </xsl:for-each>     
      </xsl:if>
      <!-- filling the blanks -->
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 1)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">A</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 2)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">B</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 3)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">C</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 4)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">D</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 5)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">E</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 6)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">F</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="not($Print = $Separated) or (count($FormData/ForeignOilGasExtIncome) &lt; 7)  and ($Print = $Separated) ">
      <tr>
        <td class="IRS1118ScheduleI_GenericCell" style="width:51mm;height:4mm;font-weight:bold;text-align:center;" colspan="2" scope="row">
           Totals <span style="font-weight:normal;">(add lines A through F)</span>
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/GrossIncomeMineralsExtraction"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/GrossIncomeFromSaleOfAssets"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/DividendsForeignCorporations"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/DistributionsSection951A"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/OtherGrossIncome"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:45mm;height:4mm;border-right-width:0px;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/TotalGrossIncome"/>
        </xsl:call-template>  
        </td>
      </tr>
       </xsl:if>
    <xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt; 6)">
      <tr>
        <td class="IRS1118ScheduleI_GenericCell" style="width:51mm;height:4mm;font-weight:bold;text-align:center;" colspan="2" scope="row">
          Totals <span style="font-weight:normal;">(add lines A through F)</span>
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>
	   <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>
	   <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>
	   <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>
	   <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;border-right-width:0px;"><span class="styTableCellPad"></span></td>

      </tr>
       </xsl:if>

      </tbody>         
     </table>
  </div>
  <!-- spacer line to accommodate the button -->
  <div class="LineContainerLong">
    <span style="width:256mm;text-align:right;">
           <!-- button display logic -->
          <xsl:call-template name="SetTableToggleButton">
          <xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtIncome"/>
          <xsl:with-param name="containerHeight" select="6"/>
          <xsl:with-param name="containerID" select=" 'Table2' "/>
          </xsl:call-template>
          <!-- end button display logic -->
    </span>
  </div>

  <!-- Part I table columns 8-12 -->

  <div class="IRS1118ScheduleI_TableContainer" style="border-top-width:1px;border-bottom-width:1px;height:67mm;" name="Table2" id="Table2">
  <!-- print logic -->
    <xsl:call-template name="SetInitialState"/>
  <!-- end -->
     <table cellspacing="0" style="font-size:7pt;">
     <thead style="display:table-header-group;">
      <tr>
        <th class="IRS1118ScheduleI_GenericCell" style="width:6mm;height:8mm;background-color:lightgrey;text-align:center;" rowspan="2" scope="col">&#160;</th>
        <th class="IRS1118ScheduleI_GenericCell" style="width:109mm;height:3mm;font-weight:bold;text-align:center;" colspan="3" scope="colgroup">
          Deductions
        </th>
        <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;" rowspan="2"> <span class="styBoldText">11. </span>Taxable income (column 7 minus column 10)</th>
        <th class="IRS1118ScheduleI_GenericCell" style="width:109mm;height:3mm;font-weight:bold;border-right-width:0px;text-align:center;" colspan="3" scope="colgroup">
          Oil and Gas Extraction Taxes <span style="font-weight:normal;text-align:center;">(attach schedule)</span>
        </th>
      </tr>
      <tr>
        <th class="IRS1118ScheduleI_GenericCell" style="height:5mm;width:45mm;text-align:center;" scope="col"> <span class="styBoldText">8. </span>Definitely allocable<br/>deductions</th>
        <th class="IRS1118ScheduleI_GenericCell" style="height:5mm;text-align:center;"  scope="col"> <span class="styBoldText">9.</span> Ratable part of deductions not definitely allocable</th>
        <th class="IRS1118ScheduleI_GenericCell" style="height:5mm;text-align:center;"  scope="col"> <span class="styBoldText">10.</span> Total (add columns 8 and 9)</th>
        <th class="IRS1118ScheduleI_GenericCell" style="height:5mm;text-align:center;"  scope="col"> <span class="styBoldText">12.</span> Paid or accured</th>
        <th class="IRS1118ScheduleI_GenericCell" style="height:5mm;text-align:center;"  scope="col"> <span class="styBoldText">13.</span> Deemed paid</th>
        <th class="IRS1118ScheduleI_GenericCell" style="height:5mm;width:45mm;border-right-width:0px;text-align:center;" scope="col"> <span class="styBoldText">14.</span> Total (add columns 12 and 13)</th>
      </tr>
      </thead>
      <tfoot></tfoot>  
      <tbody style="font-size: 6pt">      
      <xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &lt;7))"> 
      <xsl:for-each select="$FormData/ForeignOilGasExtIncome">
      <tr>
        <td class="IRS1118ScheduleI_GenericCell" style="width:6mm;font-weight:bold;text-align:center;" scope="row">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RowID"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="text-align:right;width:45mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="DefinitelyAllocableDeductions"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="RatableDedNotDefinitelyAllcbl"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalDeductions"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TaxableIncome"/>
        </xsl:call-template>  
 
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <span style="float:left; clear:none">
        <xsl:call-template name="SetFormLinkInline">
	      <xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtIncome/OilGasExtractionTaxPaidAccrued"/>
  	</xsl:call-template>
  	</span>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OilGasExtractionTaxPaidAccrued"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <span style="float:left; clear:none">
        <xsl:call-template name="SetFormLinkInline">
	      <xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtIncome/OilGasExtractionTaxDeemedPaid"/>
  	</xsl:call-template>
  	</span>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OilGasExtractionTaxDeemedPaid"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:45mm;border-right-width:0px;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalOilGasExtractionTaxes"/>
        </xsl:call-template>  
        </td>
      </tr>  
      </xsl:for-each>  
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 1)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">A</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 2)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">B</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 3)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">C</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 4)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">D</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 5)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">E</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="(count($FormData/ForeignOilGasExtIncome) &lt; 6)  or (($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6))">
        <xsl:call-template name="AddRowsForSchAPartI"><xsl:with-param name="TargetNode">F</xsl:with-param></xsl:call-template>
      </xsl:if>
      <xsl:if test="not($Print = $Separated) or (count($FormData/ForeignOilGasExtIncome) &lt; 7)  and ($Print = $Separated) ">

      <!-- filling the blanks -->
      <tr> 
        <td class="IRS1118ScheduleI_GenericCell" style="width:6mm;height:4mm;text-align:left;" scope="row">
         Totals 
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="text-align:right;width:45mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/DefinitelyAllocableDeductions"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/RatableDedNotDefinitelyAllcbl"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TotalDeductions"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TaxableIncome"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/OilGasExtractionTaxPaidAccrued"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/OilGasExtractionTaxDeemedPaid"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:45mm;height:4mm;border-right-width:0px;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TotalOilGasExtractionTaxes"/>
        </xsl:call-template>  
        </td>
      </tr>
      </xsl:if>
       <xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt; 6)">
      <tr>
        <td class="IRS1118ScheduleI_GenericCell" style="width:51mm;height:4mm;font-weight:bold;text-align:center;"  scope="row">
          Totals 
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>
	   <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>
	   <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>
	   <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>
	   <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;"><span class="styTableCellPad"></span></td>

      </tr>
       </xsl:if>


      </tbody>         
     </table>
  </div>
   <!--BEGIN FOOTER-->
      <div style="width:256mm">
        <div style="float: left; clear: none;"><span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 1118.</span></div>        
        <div style="float:right">
          Cat. No. 10237L 
          <span style="width:170px"></span>
          <span class="styBoldText">Schedule I (Form 1118) (Rev. 1-2006)</span>
        </div>      
      </div>     
      <div class="pageEnd"></div>
      <!--END FOOTER-->  
        
      <!--BEGIN HEADER-->
      <div class="styBB" style="width:256mm">
        <div style="float: left; clear: none">Schedule I (Form 1118) (Rev. 1-2006)</div>        
        <div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">2</span>
        </div>      
      </div> 
    <!--END HEADER-->
  <!-- part II header -->
  <div class="LineContainer">
    <div class="IRS1118ScheduleI_PartIndex" style="width:15mm;height:8mm;padding-top:8px;background-color:white;color:black;padding-left:0px;border-top-width:0px;"><span style="background-color:black;color:white;padding-left:5px;padding-right:5px;">Part II</span></div>
    <div class="IRS1118ScheduleI_LineDescLong" style="font-size:8pt;padding-left:4px;padding-top:8px;border-right-width:0px;width:173mm;">
       <span style="font-weight:bold;">
        Reduction Under Section 907(a)
         </span>
    </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex" style="border-top-width:1px;"></div>
      <div class="IRS1118ScheduleI_LineDesc" style="border-top-width:1px;">
      </div>
      <div class="IRS1118ScheduleI_MoneyFieldFiller" style="border-top-width:1px;"></div>
  </div>
   <!-- part II line 1 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">1</div>
      <div class="IRS1118ScheduleI_LineDesc">Foreign oil and gas extraction income. (See <span style="font-weight: bold">Line 1</span> in the instructions below.)
             <span class="DotSpacing">.........</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtractionIncome"/>
      </xsl:call-template>  
      </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex"></div>
      <div class="IRS1118ScheduleI_LineDesc">
      </div>
      <div class="IRS1118ScheduleI_MoneyFieldFiller"></div>
  </div>
   <!-- part II line 2 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">2</div>
      <div class="IRS1118ScheduleI_LineDesc">Multiply line 1 by the highest rate of tax under section 11(b). (See <span style="font-weight: bold">Line 2</span> below.)
             <span class="DotSpacing">.......</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtractionIncmTax"/>
      </xsl:call-template>  
      </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex"></div>
      <div class="IRS1118ScheduleI_LineDesc">
      </div>
      <div class="IRS1118ScheduleI_MoneyFieldFiller"></div>
  </div>
   <!-- part II line 3 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">3</div>
      <div class="IRS1118ScheduleI_LineDesc">Total taxes (from Part I, column 14, "Totals" line)
             <span class="DotSpacing">......................</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TotalOilGasExtractionTaxes"/>
      </xsl:call-template>  
      </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex"></div>
      <div class="IRS1118ScheduleI_LineDesc">
      </div>
      <div class="IRS1118ScheduleI_MoneyFieldFiller"></div>
  </div>
   <!-- part II line 4 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">4</div>
      <div class="IRS1118ScheduleI_LineDesc">Carryover or carryback of disallowed credits. (See section 907(f)--attach schedule.)
        <xsl:call-template name="SetFormLinkInline">
           <xsl:with-param name="TargetNode" select="$FormData/CarryoverDisallowedCredits"/>
       </xsl:call-template>
             <span class="DotSpacing">.....</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CarryoverDisallowedCredits"/>
      </xsl:call-template>  
      </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex"></div>
      <div class="IRS1118ScheduleI_LineDesc">
      </div>
      <div class="IRS1118ScheduleI_MoneyFieldFiller"></div>
  </div>
   <!-- part II line 5 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">5</div>
      <div class="IRS1118ScheduleI_LineDesc">Total taxes before reduction (add line 3 and line 4)
             <span class="DotSpacing">......................</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalTaxesBeforeReduction"/>
      </xsl:call-template>  
      </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex"></div>
      <div class="IRS1118ScheduleI_LineDesc">
      </div>
      <div class="IRS1118ScheduleI_MoneyFieldFiller"></div>
  </div>
   <!-- part II line 6 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">6</div>
      <div class="IRS1118ScheduleI_LineDesc">Reduction (subtract line 2 from line 5; if zero or less, enter -0-). Enter here and on Schedule G,
      </div>
      <div class="IRS1118ScheduleI_MoneyFieldFiller"></div>
  </div>
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex" style="border-bottom-width:1px;"></div>
      <div class="IRS1118ScheduleI_LineDesc" style="border-bottom-width:1px;">line B of the corresponding Form 1118
             <span class="DotSpacing">............................</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField" style="border-bottom-width:1px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Reduction"/>
      </xsl:call-template>  
      </div>
  </div>

<div class="styGenericDiv" style="width: 187mm;text-align: center">
</div>
     <!-- leftover data table -->
  <br />
  <br />
  <br />
        
  <p style="page-break-before:always" /> 
  
  <!-- BEGIN Left Over Table -->  
    <!-- Additonal Data Title Bar and Button -->
  <div class="styLeftOverTitleLine" id="LeftoverData">
    <div class="styLeftOverTitle">
      Additional Data        
    </div>
    <div class="styLeftOverButtonContainer">
      <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
    </div>      
  </div>  
  <table class="styLeftOverTbl">
    <xsl:call-template name="PopulateCommonLeftover">
      <xsl:with-param name="TargetNode" select="$FormData" />
      <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
  </table>
  <!-- END Left Over Table -->  
  
  
  <xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6)">
<br/>
<span class="styRepeatingDataTitle">Form 1118 Schedule I Part I Lines 1 - 7 - Foreign Oil and Gas Extraction Income and Taxes </span>			
<table class="styDepTbl"  style="width: 256mm;font-size: 7pt">
	<thead class="styTableThead">
		<tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:6mm;height:12mm;" rowspan="2" scope="col">&#160;</th>
        <th class="styDepTblCell" style="width:45mm;height:12mm;text-align:center;padding-top: 4mm" rowspan="2" scope="col">
          1. Name of foreign country (Use a separate line for each country.)
        </th>
        <th class="styDepTblCell" style="height:4mm;width:205mm;font-size:7pt;font-weight:bold;border-right-width:0px;text-align:center;" colspan="6" scope="colgroup">
          Gross Oil and Gas Extraction Income From Sources Outside the United States and its Possessions
          <span style="font-weight:normal;">(See instructions.)</span>  
        </th>
      </tr>
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="text-align:center;width: 32mm;" scope="col">2. Gross income from extraction of minerals from oil or gas wells</th>
        <th class="styDepTblCell"  style="text-align:center; width: 32mm" scope="col">3. Gross income from sale or exchange of assets used in extraction</th>
        <th class="styDepTblCell"  style="text-align:center; width: 32mm" scope="col">4. Certain dividends from foreign corporations</th>
        <th class="styDepTblCell"  style="text-align:center; width: 32mm" scope="col">5. Constructive distributions under section 951(a)</th>
        <th class="styDepTblCell"  style="text-align:center; width: 32mm" scope="col">6. Other</th>
        <th class="styDepTblCell" scope="col" style="width:45mm;border-right-width:0px;text-align:center;">7. Total (add columns 2 <br/>through 6)</th>
      </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>    
      <xsl:for-each select="$FormData/ForeignOilGasExtIncome">
      <tr>
              <xsl:attribute name="class">
		         <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
        <td class="styDepTblCell" style="width:6mm;font-weight:bold;text-align:center;" scope="row">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RowID"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align:left;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="ForeignCountry"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="GrossIncomeMineralsExtraction"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="GrossIncomeFromSaleOfAssets"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="DividendsForeignCorporations"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="DistributionsSection951A"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OtherGrossIncome"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="width:45mm;border-right-width:0px;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalGrossIncome"/>
        </xsl:call-template>  
        </td>
      </tr>  
      </xsl:for-each>     
      <tr class="styDepTblHdr">
        <td class="styDepTblCell" style="width:40mm;height:4mm;font-weight:bold;text-align:center;" colspan="2" scope="row">
          Totals <span style="font-weight:normal;">(add lines A through F)</span>
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/GrossIncomeMineralsExtraction"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/GrossIncomeFromSaleOfAssets"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/DividendsForeignCorporations"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/DistributionsSection951A"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/OtherGrossIncome"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="width:45mm;height:4mm;border-right-width:0px;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtIncome/TotalGrossIncome"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
      </tr>
      </tbody>         
     </table>
   </xsl:if>


  <xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilGasExtIncome) &gt;6)">
<br/>
<span class="styRepeatingDataTitle">Form 1118 Schedule I Part I Lines 8 - 14 - Foreign Oil and Gas Extraction Income and Taxes </span>			
<table class="styDepTbl"  style="width: 256mm;font-size: 7pt">
	<thead class="styTableThead">
		<tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:6mm;height:8mm" rowspan="2" scope="col">&#160;</th>
        <th class="styDepTblCell" style="width:109mm;height:3mm;font-weight:bold" colspan="3" scope="colgroup">
          Deductions
        </th>
        <th class="styDepTblCell" style="text-align:center;width: 32mm" rowspan="2">11. Taxable income (column 7 minus column 10)</th>
        <th class="styDepTblCell" style="width:109mm;height:3mm;font-weight:bold" colspan="3" scope="colgroup">
          Oil and Gas Extraction Taxes <span style="font-weight:normal">(attach schedule)</span>
        </th>
      </tr>
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="height:5mm;width:45mm;text-align:center;" scope="col">8. Definitely allocable<br/>deductions</th>
        <th class="styDepTblCell" style="height:5mm;text-align:center;width: 32mm"  scope="col">9. Ratable part of deductions not definitely allocable</th>
        <th class="styDepTblCell" style="height:5mm;text-align:center;width: 32mm"  scope="col">10. Total (add columns 8 and 9)</th>
        <th class="styDepTblCell" style="height:5mm;text-align:center;width: 32mm"  scope="col">12. Paid or accured</th>
        <th class="styDepTblCell" style="height:5mm;text-align:center;width: 32mm"  scope="col">13. Deemed paid</th>
        <th class="styDepTblCell" style="height:5mm;width:45mm;border-right-width:0px;text-align:center;" scope="col">14. Total (add columns 12 and 13)</th>
      </tr>
      </thead>
      <tfoot></tfoot>  
      <tbody sytle="font-size:6pt">      
      <xsl:for-each select="$FormData/ForeignOilGasExtIncome">
      <tr>
      <xsl:attribute name="class">
		         <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
        <td class="styDepTblCell" style="width:6mm;font-weight:bold;text-align:center;" scope="row">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RowID"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align:right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="DefinitelyAllocableDeductions"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="RatableDedNotDefinitelyAllcbl"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalDeductions"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TaxableIncome"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <span style="float: left; clear:none">
	 <xsl:call-template name="SetFormLinkInline">
		<xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtIncome/OilGasExtractionTaxPaidAccrued"/>
  	</xsl:call-template></span>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OilGasExtractionTaxPaidAccrued"/>
        </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <span style="float: left; clear:none">
        <xsl:call-template name="SetFormLinkInline">
	      <xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtIncome/OilGasExtractionTaxDeemedPaid"/>
  	</xsl:call-template></span>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OilGasExtractionTaxDeemedPaid"/>
        </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width:45mm; text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalOilGasExtractionTaxes"/>
        </xsl:call-template>  
        </td>
      </tr>  
      </xsl:for-each>  
      <tr class="styDepTblHdr">
        <td class="styDepTblCell" style="width:51mm;height:4mm;font-weight:bold;text-align:center;" scope="row">
          Totals 
        </td>
         <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/DefinitelyAllocableDeductions"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/RatableDedNotDefinitelyAllcbl"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TotalDeductions"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TaxableIncome"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/OilGasExtractionTaxPaidAccrued"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/OilGasExtractionTaxDeemedPaid"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="width:45mm;height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TotalOilGasExtractionTaxes"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
      </tr>
      </tbody>         
     </table>
     </xsl:if>  
  </body>
</html>

</xsl:template>

<xsl:template name="InitNothing"></xsl:template>
</xsl:stylesheet>


