<?xml version="1.0" encoding="UTF-8"?>
<!-- Last modified on 10/20/2009 by Sandy Cram  Updates made per WSP-091514OTH --><!-- Last modified on 6/28/2010 by Sandy Cram  Updates made per WSP-100548OTH --><!-- Last modified on 8/31/2010 by Kelly Hytrek Updates made per defect 26988 --><!-- Last modified on 9/1/2010 by Kelly Hytrek  Updates made per WSP-101975OTH --><!-- Last modified on 10/25/2010 by Kelly Hytrek  Updates made per defect 27667 --><!-- Last modified on 09/27/2012 by Kelly Hytrek  Updates made per defect 33777 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
        <td class="IRS1118ScheduleI_GenericCell" style="width:6mm; font-weight:bold;text-align:center;" scope="row"><span style="width:1px;" /></td>
        <td class="IRS1118ScheduleI_GenericCell"><span style="width:1px;" /></td>
        <td class="IRS1118ScheduleI_GenericCell"><span style="width:1px;" /></td>
        <td class="IRS1118ScheduleI_GenericCell"><span style="width:1px;" /></td>
        <td class="IRS1118ScheduleI_GenericCell"><span style="width:1px;" /></td>
        <td class="IRS1118ScheduleI_GenericCell"><span style="width:1px;" /></td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:45mm;border-right-width:0px;padding-right:2mm"><span style="width:1px;" /></td>
      </tr>
  </xsl:template>
  <xsl:template name="AddRowsForPartITableI">
    <xsl:param name="TargetNode"/>
    <tr>
      <td class="IRS1118ScheduleI_GenericCell" style="width: 6mm; text-align:center">
        <span class="styBoldText">
          <xsl:value-of select="$TargetNode"/>
        </span>
      </td>
      <td class="IRS1118ScheduleI_GenericCell" style="text-align: left; width: 35mm;">
        <span style="width: 1px"/>
      <xsl:if test="$TargetNode = 'A'">
        	<xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6)">
			<xsl:choose>
				<xsl:when test="($FormData/ForeignOilAndGasIncomeTaxes/ForeignCorporationEIN)">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes/ForeignCorporationEIN"/>
					</xsl:call-template>
				</xsl:when>
			   <xsl:otherwise>
				<xsl:call-template name="PopulateAdditionalDataTableMessage"> 		   
					<xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes/ForeignCorpMissingEINReasonCd"/>
				</xsl:call-template>				
			   </xsl:otherwise>
			</xsl:choose>
        	</xsl:if>
        </xsl:if>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell" style="width: 45mm; border-right-width: 0px;padding-right:4mm">
        <span class="styTableCellPad"/>
      </td>
    </tr>
</xsl:template>
  <xsl:template name="AddRowsForPartITableII">
    <xsl:param name="TargetNode"/>
    <tr>
      <td class="IRS1118ScheduleI_GenericCell" style="width: 6mm; text-align:center">
        <span class="styBoldText">
          <xsl:value-of select="$TargetNode"/>
        </span>
      </td>
      <td class="IRS1118ScheduleI_GenericCell" style="text-align: left; width: 35mm;">
        <span style="width: 1px"/>
      <xsl:if test="$TargetNode = 'A'">
        	<xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6)">
			<xsl:choose>
				<xsl:when test="($FormData/ForeignOilAndGasIncomeTaxes/ForeignCorporationEIN)">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes/ForeignCorporationEIN"/>
					</xsl:call-template>
				</xsl:when>
			   <xsl:otherwise>
				<xsl:call-template name="PopulateAdditionalDataTableMessage"> 		   
					<xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes/ForeignCorpMissingEINReasonCd"/>
				</xsl:call-template>				
			   </xsl:otherwise>
			</xsl:choose>
        	</xsl:if>
        </xsl:if>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell">
        <span class="styTableCellPad"/>
      </td>
      <td class="IRS1118ScheduleI_GenericCell" style="width: 45mm; border-right-width: 0px;padding-right:4mm">
        <span class="styTableCellPad"/>
      </td>
    </tr>
</xsl:template>
  <!-- /////////////////////////////////////////// -->
  <xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
          </xsl:call-template>
        </title>
  <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
  <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1118Schedule I"/>
  <!-- javascript include -->
  <!--  Ravi Venigalla 06/28/03 changed javascript path -->
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
  <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS1118ScheduleIStyle"/>
      <xsl:call-template name="AddOnStyle"/>
  </xsl:if>
  </style>
<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderLandscape"/>
  <!-- BEGIN FORM HEADER -->
  <div class="LineContainerLong">
    <!-- Form Name -->
          <div class="IRS1118ScheduleI_FormNumBlock" style="height:18.5mm;">
       <span style="font-size:9pt;" class="styFormNumber">SCHEDULE I<br/>(Form 1118)</span>
       <xsl:call-template name="SetFormLinkInline">
           <xsl:with-param name="TargetNode" select="$FormData"/>
       </xsl:call-template>
            <br/>
      <span style="font-size:6pt;">(Rev. December, 2018)</span> 
            <br/>
            <span class="IRS1118ScheduleI_Agency" style="padding-bottom:0px;">Department of the Treasury</span>
            <br/>
            <span class="IRS1118ScheduleI_Agency" style="padding-top:0px;">Internal Revenue Service</span>
          </div>
    <!-- Form Title Box -->
          <div class="IRS1118ScheduleI_FormTitleBlock" style="padding-top:3mm;height:18.5mm;">
      <!-- Form Title -->
            <span class="styMainTitle">Reduction of Foreign Oil and Gas Taxes</span>
      <!-- Form Subtitle -->
            <br/>
      <span style="font-weight:bold;;">
         <img src="{$ImagePath}/1118SchI_Bullet.gif" width="4" height="7" alt="Right arrow" border="0"/> Go to <a href="http://www.irs.gov/Form1118" title="Link to IRS.gov"> <i>www.irs.gov/Form1118</i></a> for the latest information.
      </span>
      <br/>
      <span style="font-weight:bold;;">
         <img src="{$ImagePath}/1118SchI_Bullet.gif" width="4" height="7" alt="Right arrow" border="0"/> Attach to Form 1118
      </span>
      <br/>
      For calendar year  
      <span style="width: 20mm">
              <xsl:call-template name="PopulateReturnHeaderTaxYear"/>
      </span>
          , or other tax year beginning
          <span style="width: 20mm">
              <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
      </span>
              , and ending
        <span style="width: 20mm">
              <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
      </span>
    </div>
      <!-- IRS1118ScheduleI_NameBox No. -->
          <div class="IRS1118ScheduleI_FormYearBlock" style="height:18.5mm;">OMB No. 1545-0123</div>
  </div>
  <!-- Name and Address -->
  <div class="styBB" style="width:256mm;">
    <div class="styNameBox" style="width:206mm;height:9mm;font-size:7pt;">
      Name of corporation<br/>
            <span>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
              </xsl:call-template>
      </span>
    </div>
    <div class="styEINBox" style="width:50mm;height:9mm;padding-left:2mm;font-weight:bold;font-size:7pt;">
      Employer identification number <br/>
            <br/>
			<span style="width:40mm;text-align:center;font-weight:normal;">
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
            </span>
    </div>
 </div>
  <!--BEGIN CATEGORY OF INCOME SECTION -->
  <div class="styBB" style="width:256mm;">
    Use a separate Schedule I (Form 1118) for each applicable category of income (see instructions).
    <br/>
	<!-- Lines a-c before Part I -->
	<div style="width:249mm;">
		<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">a</div>
			<div class="styLNDesc" style="width:200mm;height:4mm;">
                Separate Category (Enter code—see instructions.)
				<!-- dotted line -->
				<span class="styDotLn" style="float:none;padding-left:2mm">................................</span>
				<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
			</div>
			<span style="float:left;padding-right:0mm;">
				<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;padding-bottom:0px;text-align:center;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormData/SeparateCategoryCd"/>
					</xsl:call-template>
				</span>
			</span>
	</div>
	<div style="width:249mm;">
		<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">b</div>
			<div class="styLNDesc" style="width:200mm;height:4mm;">
                If code 901j is entered on line a, enter the country code for the sanctioned country (see instructions)
				<!-- dotted line -->
				<span class="styDotLn" style="float:none;padding-left:2mm">................</span>
				<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
			</div>
			<span style="float:left;padding-right:0mm;">
				<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;padding-bottom:0px;text-align:center;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
					</xsl:call-template>
				</span>
			</span>
	</div>
	<div style="width:249mm;">
		<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">c</div>
			<div class="styLNDesc" style="width:200mm;height:4mm;">
                If code RBT is entered on line a, enter the country code for the treaty country (see instructions)
				<!-- dotted line -->
				<span class="styDotLn" style="float:none;padding-left:2mm">..................</span>
				<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
			</div>
			<span style="float:left;padding-right:0mm;">
				<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;padding-bottom:0px;text-align:center;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormData/TreatyCountryCd"/>
					</xsl:call-template>
				</span>
			</span>
	</div>
  </div>
  <!-- comment line -->
  <div class="LineContainerLong">
          <span style="font-size:8pt;font-style:italic;padding-left:4mm;">
    Report all amounts in U.S. dollars.
          </span>
  </div>
    <!-- Part I-->
  <div class="LineContainerLong">
    <div class="IRS1118ScheduleI_PartIndex" style="border-bottom-width:1px;">Part I</div>
    <div class="IRS1118ScheduleI_LineDescLong" 
    style="font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;width:236mm;">
       <span style="font-weight:bold;">
        Combined Foreign Oil and Gas Income and Taxes
         </span>
    </div>
       <div class="IRS1118ScheduleI_LineDescLong" 
          style="border-right-width:0px;border-top-width:1px;border-bottom-width:1px;width:4mm;text-align:right;">
           <!-- button display logic -->
          <xsl:call-template name="SetDynamicTableToggleButton">
          <xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes"/>
          <xsl:with-param name="containerHeight" select="6"/>
          <xsl:with-param name="containerID" select=" 'Table1' "/>
          </xsl:call-template>
          <!-- end button display logic -->
       </div>
  </div>
  <!-- Part I table columns 1-7 -->
  <div class="IRS1118ScheduleI_TableContainer" style="border-top-width:0px;border-bottom-width:0px;height:60mm;" name="Table1" id="Table1">
  <!-- print logic -->
    <xsl:call-template name="SetInitialState"/>
  <!-- end -->
     <table cellspacing="0" style="font-size:7pt;">
      <thead style="display:table-header-group;">
      <tr>
        <th class="IRS1118ScheduleI_GenericCell" style="width:6mm;height:14mm;background-color:lightgrey;text-align:center;" rowspan="2" scope="col">
        <span style="width:1px;" /></th>
        <th class="IRS1118ScheduleI_GenericCell" style="width:45mm;height:14mm;text-align:center;padding-top:2mm;padding-left:2mm;
        padding-right:2mm" rowspan="2" scope="col">
          <b>1(a). </b>EIN or Reference ID number of the foreign corporation (see instructions)
        </th>
        <th class="IRS1118ScheduleI_GenericCell" style="width:45mm;height:14mm;text-align:center;padding-top:2mm;padding-left:3mm;
        padding-right:3mm" rowspan="2" scope="col">
          <b>1(b). </b>Name of foreign country (Use a separate line for each country.)*
        </th>
        <th class="IRS1118ScheduleI_GenericCell" style="height:4mm;width:80mm;font-size:7pt;font-weight:bold;border-right-width:0px;text-align:center;" 
        colspan="6" scope="col">
          Gross Foreign Oil and Gas Income From Sources Outside the United States and its Possessions
          <span style="font-weight:normal;">(see instructions)</span>  
        </th>
        </tr>
           <tr>
                <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;height:10mm;" scope="col">
                  <span class="styBoldText">2.</span> Gross foreign oil and gas extraction income</th>
                <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;height:10mm" scope="col">
                  <span class="styBoldText">3. </span> Gross foreign oil related income </th>
                <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;height:10mm" scope="col">
                  <span class="styBoldText">4. </span> Certain dividends from foreign corporations</th>
                <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;height:10mm" scope="col">
                  <span class="styBoldText">5. </span> Inclusions under sections 951(a)(1) and 951A</th>
                <th class="IRS1118ScheduleI_GenericCell" style="border-right-width:1px;text-align:center;height:10mm" scope="col">
                  <span class="styBoldText">6.</span> Other</th>
                <th class="IRS1118ScheduleI_GenericCell" style="border-right-width:0px;text-align:center;height:10mm;" scope="col" >
                  <span class="styBoldText">7. </span> Total (add columns 2 <br/>through 6)</th>
           </tr>
            </thead>
            <tfoot/>
      <tbody>    
      <xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($FormData/ForeignOilAndGasIncomeTaxes) &lt;7))">     
      <xsl:for-each select="$FormData/ForeignOilAndGasIncomeTaxes">
      <tr>
        <td class="IRS1118ScheduleI_GenericCell" style="width:6mm;font-weight:bold;text-align:center;" scope="row">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RowId"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="text-align:left;width:45mm;">
			<xsl:choose>
				<xsl:when test="(ForeignCorporationEIN)">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
					</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
					      <xsl:with-param name="TargetNode" select="$FormData/ForeignEntityReferenceIdNum"/>
						</xsl:call-template>
				</xsl:when>
			   <xsl:otherwise>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignCorpMissingEINReasonCd"/>
					</xsl:call-template>
			   </xsl:otherwise>
			</xsl:choose>
			<br/>
			<xsl:for-each select="ForeignEntityIdentificationGrp">
				<xsl:variable name="pos" select="position()"/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum[$pos&gt;0]"/>
					</xsl:call-template>
					<br/>
			</xsl:for-each>		
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="text-align:left;width:45mm;">
			<xsl:choose>
				<xsl:when test="(ForeignCountryOrUSPossessionCd)">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
					</xsl:call-template>
				</xsl:when>
			   <xsl:otherwise>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="Section863bIncomeCd"/>
					</xsl:call-template>
			   </xsl:otherwise>
			</xsl:choose>
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="GroFrgnOilGasExtractionIncmAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="GroForeignOilRelatedIncomeAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="DividendsPaidFrgnCorpAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="InclusionsSect951a1Or951AAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OtherGrossIncomeAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:40mm;border-right-width:0px;padding-right:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalGrossIncomeAmt"/>
        </xsl:call-template>  
        </td>
      </tr>  
      </xsl:for-each>     
      </xsl:if>
      <!-- filling in the blanks Table 1 -->
      <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 1)  or (($Print = $Separated) and 
      (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableI">
                  <xsl:with-param name="TargetNode">A</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 2)  or (($Print = $Separated) and 
              (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableI">
                  <xsl:with-param name="TargetNode">B</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 3)  or (($Print = $Separated) and 
              (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableI">
                  <xsl:with-param name="TargetNode">C</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 4)  or (($Print = $Separated) and 
              (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableI">
                  <xsl:with-param name="TargetNode">D</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 5)  or (($Print = $Separated) and 
              (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableI">
                  <xsl:with-param name="TargetNode">E</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 6)  or (($Print = $Separated) and 
              (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableI">
                  <xsl:with-param name="TargetNode">F</xsl:with-param>
                </xsl:call-template>
      </xsl:if>
      <xsl:if test="not($Print = $Separated) or (count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 7)  and ($Print = $Separated) ">
      <tr>
        <td class="IRS1118ScheduleI_GenericCell" style="width:51mm;height:4mm;font-weight:bold;text-align:center;" colspan="3" scope="row">
           Totals <span style="font-weight:normal;">(add lines A through F)</span>
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/GroFrgnOilGasExtractionIncmAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/GroForeignOilRelatedIncomeAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/DividendsPaidFrgnCorpAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/InclusionsSect951a1Or951AAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/OtherGrossIncomeAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:40mm;height:4mm;border-right-width:0px;padding-right:4mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/TotalGrossIncomeAmt"/>
        </xsl:call-template>  
        </td>
      </tr>
       </xsl:if>
    <xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilAndGasIncomeTaxes) &gt; 6)">
      <tr>
        <td class="IRS1118ScheduleI_GenericCell" style="width:51mm;height:4mm;font-weight:bold;text-align:center;" colspan="3" scope="row">
          Totals <span style="font-weight:normal;">(add lines A through F)</span>
        </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;border-right-width:0px;padding-right:3mm">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
      </tbody>         
     </table>
  </div>
  <!-- End First Table Code -->
  <div class="styBB" style="width:256mm;padding-left:5mm">* For section 863(b) income, use a single line (see instructions). </div>
  <!-- spacer line to accommodate the button -->
  <div class="LineContainerLong">
    <span style="width:256mm;text-align:right;">
           <!-- button display logic -->
          <xsl:call-template name="SetDynamicTableToggleButton">
          <xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes"/>
          <xsl:with-param name="containerHeight" select="6"/>
          <xsl:with-param name="containerID" select=" 'Table2' "/>
          </xsl:call-template>
          <!-- end button display logic -->
    </span>
  </div>
  <!-- Part I table columns 8-14 -->
  <div class="IRS1118ScheduleI_TableContainer" style="border-top-width:1px;border-bottom-width:1px;height:61mm;" name="Table2" id="Table2">
  <!-- print logic -->
    <xsl:call-template name="SetInitialState"/>
  <!-- end -->
     <table cellspacing="0" style="font-size:7pt;">
     <thead style="display:table-header-group;">
      <tr>
        <th class="IRS1118ScheduleI_GenericCell" style="width:6mm;height:14mm;background-color:lightgrey;text-align:center;" rowspan="2" scope="col">
        <span style="width:1px;" />
        </th>
        <th class="IRS1118ScheduleI_GenericCell" style="width:109mm;height:4mm;font-weight:bold;text-align:center;" 
        colspan="3" scope="col">
          Deductions
        </th>
        <th class="IRS1118ScheduleI_GenericCell" style="height:4mm;font-weight:bold;text-align:center;border-bottom:0px" colspan="1" scope="col">
        </th>
        <th class="IRS1118ScheduleI_GenericCell" 
        style="width:104mm;height:4mm;font-weight:bold;border-right-width:0px;text-align:center;" colspan="3" scope="col">
          Foreign Oil and Gas Taxes <span style="font-weight:normal;text-align:center;">(attach schedule)</span>
        </th>
      </tr>
          <tr>
                <th class="IRS1118ScheduleI_GenericCell" style="height:10mm;width:41mm;text-align:center;" scope="col">
                  <span class="styBoldText">8. </span> Allocable deductions</th>
                <th class="IRS1118ScheduleI_GenericCell" style="height:10mm;width:37mm;text-align:center;" scope="col">
                  <span class="styBoldText">9.</span> Apportioned deductions</th>
                <th class="IRS1118ScheduleI_GenericCell" style="height:10mm;width:37mm;text-align:center;" scope="col">
                  <span class="styBoldText">10.</span> Total (add columns 8 and 9)</th>
                <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;height:10mm;width:37mm" scope="col">
                  <b>11.</b> Taxable income (column 7 minus column 10)
                </th>
                <th class="IRS1118ScheduleI_GenericCell" style="height:10mm;width:34mm;text-align:center;" scope="col">
                  <span class="styBoldText">12.</span> Paid or accrued</th>
                <th class="IRS1118ScheduleI_GenericCell" style="height:10mm;width:35mm;text-align:center;" scope="col">
                  <span class="styBoldText">13.</span> Deemed paid</th>
                <th class="IRS1118ScheduleI_GenericCell" style="height:10mm;width:35mm;border-right-width:0px;text-align:center;" scope="col">
                  <span class="styBoldText">14.</span> Total (add columns 12 and 13)</th>
          </tr>
     </thead>
            <tfoot/>
      <tbody style="font-size: 6pt">      
      <xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($FormData/ForeignOilAndGasIncomeTaxes) &lt;7))"> 
      <xsl:for-each select="$FormData/ForeignOilAndGasIncomeTaxes">
      <tr>
        <td class="IRS1118ScheduleI_GenericCell" style="width:6mm;font-weight:bold;text-align:center" scope="row">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RowId"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="text-align:right;width:41mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="DefinitelyAllocableDedAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="ApportionedShareDeductionAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalAllocableDeductionsAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TaxableIncomeAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <span style="float:left; clear:none">
        <xsl:call-template name="SetFormLinkInline">
	      <xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes/OilGasExtractionTxsPaidAccrAmt"/>
  	</xsl:call-template>
  	</span>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OilGasExtractionTxsPaidAccrAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <span style="float:left; clear:none">
        <xsl:call-template name="SetFormLinkInline">
	      <xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes/OilGasExtractionTxsDeemedPdAmt"/>
  	</xsl:call-template>
  	</span>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OilGasExtractionTxsDeemedPdAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:45mm;border-right-width:0px;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalOilGasExtractionTaxesAmt"/>
        </xsl:call-template>  
        </td>
      </tr>  
      </xsl:for-each>  
      </xsl:if>
      <!-- filling in the blanks -->
      <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 1)  or 
      (($Print = $Separated) and (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableII">
                  <xsl:with-param name="TargetNode">A</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 2)  or (($Print = $Separated) and
               (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableII">
                  <xsl:with-param name="TargetNode">B</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 3)  or (($Print = $Separated) and 
              (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableII">
                  <xsl:with-param name="TargetNode">C</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 4)  or (($Print = $Separated) and 
              (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableII">
                  <xsl:with-param name="TargetNode">D</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 5)  or (($Print = $Separated) and 
              (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableII">
                  <xsl:with-param name="TargetNode">E</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="(count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 6)  or (($Print = $Separated) and 
              (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6))">
                <xsl:call-template name="AddRowsForPartITableII">
                  <xsl:with-param name="TargetNode">F</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
      <xsl:if test="not($Print = $Separated) or (count($FormData/ForeignOilAndGasIncomeTaxes) &lt; 7)  and ($Print = $Separated) ">
      <tr> 
        <td class="IRS1118ScheduleI_GenericCell" style="width:6mm;height:4mm;text-align:left;font-weight:bold;font-size:7pt" scope="row">
         Totals 
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="text-align:right;width:45mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/DefinitelyAllocableDedAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/ApportionedShareDeductionAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TotalAllocableDeductionsAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TaxableIncomeAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/OilGasExtractionTxsPaidAccrAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/OilGasExtractionTxsDeemedPdAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:45mm;height:4mm;border-right-width:0px;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TotalOilGasExtractionTaxesAmt"/>
        </xsl:call-template>  
        </td>
      </tr>
      </xsl:if>
       <xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilAndGasIncomeTaxes) &gt; 6)">
      <tr>
                  <td class="IRS1118ScheduleI_GenericCell" style="width:15mm;height:4mm;font-weight:bold;text-align:center;font-size:7pt;" scope="row">
					  Totals 
				  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="IRS1118ScheduleI_GenericCell" style="height:4mm;border-right-width:0px;padding-right:3mm">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
      </tbody>         
     </table>
  </div>
   <!--BEGIN FOOTER-->
      <div style="width:256mm">
          <div style="float: left; clear: none;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 1118.</span>
          </div>
        <div style="float:right">
          Cat. No. 10237L 
          <span style="width:170px"/>
          <span class="styBoldText" style="padding-right:2mm">Schedule I (Form 1118) (Rev. 12-2018)</span>
        </div>      
      </div>
      <p style="page-break-before:always"/>
      <!--END FOOTER-->  
      <!--BEGIN HEADER-->
      <div class="styBB" style="width:256mm">
        <div style="float: left; clear: none">Schedule I (Form 1118) (Rev. 12-2018)</div>        
        <div style="float:right;padding-right:4mm">
          Page <span class="styBoldText" style="font-size: 8pt">2</span>
        </div>      
      </div> 
    <!--END HEADER-->
  <!-- part II header -->
  <div class="LineContainer">
          <div class="IRS1118ScheduleI_PartIndex" style="width:15mm;height:8mm;padding-top:8px;
          background-color:white;color:black;padding-left:0px;border-top-width:0px;">
            <span style="background-color:black;color:white;padding-left:5px;padding-right:5px;">Part II</span>
          </div>
    <div class="IRS1118ScheduleI_LineDescLong" style="font-size:8pt;padding-left:4px;padding-top:8px;border-right-width:0px;width:173mm;">
       <span style="font-weight:bold;">
        Reduction Under Section 907(a)
         </span>
    </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex" style="border-top-width:1px;"/>
          <div class="IRS1118ScheduleI_LineDesc" style="border-top-width:1px;"/>
          <div class="IRS1118ScheduleI_MoneyFieldFiller" style="border-top-width:1px;"/>
  </div>
   <!-- part II line 1 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">1</div>
      <div class="IRS1118ScheduleI_LineDesc">Combined foreign oil and gas income. (See the instructions for Part II line 1 below.)
             <span class="DotSpacing">.........</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CombForeignOilAndGasIncomeAmt"/>
      </xsl:call-template>  
      </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex"/>
          <div class="IRS1118ScheduleI_LineDesc"/>
          <div class="IRS1118ScheduleI_MoneyFieldFiller"/>
  </div>
   <!-- part II line 2 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">2</div>
      <div class="IRS1118ScheduleI_LineDesc">Multiply line 1 by the highest rate of tax under section 11(b). (See the instructions for Part II line 2
      </div>
      <div class="IRS1118ScheduleI_MoneyFieldFiller"/>      
      <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex"/>
      <div class="IRS1118ScheduleI_LineDesc">below.)
             <span class="DotSpacing">..........................................</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField">      
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/HighestRateTaxCalcSect11bAmt"/>
        </xsl:call-template>  
      </div>        
      </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex"/>
          <div class="IRS1118ScheduleI_LineDesc"/>
          <div class="IRS1118ScheduleI_MoneyFieldFiller"/>
  </div>
   <!-- part II line 3 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">3</div>
      <div class="IRS1118ScheduleI_LineDesc">Total taxes (from Part I, column 14, "Totals" line)
             <span class="DotSpacing">......................</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TotalOilGasExtractionTaxesAmt"/>
      </xsl:call-template>  
      </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex"/>
          <div class="IRS1118ScheduleI_LineDesc"/>
          <div class="IRS1118ScheduleI_MoneyFieldFiller"/>
  </div>
   <!-- part II line 4 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">4</div>
      <div class="IRS1118ScheduleI_LineDesc">Reduction (subtract line 2 from line 3; if zero or less, enter -0-). Enter here and on Schedule G,
      </div>
          <div class="IRS1118ScheduleI_MoneyFieldFiller"/>
  </div>
   <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex" style="border-bottom-width:1px;"/>
      <div class="IRS1118ScheduleI_LineDesc" style="border-bottom-width:1px;">line B of the corresponding Form 1118
             <span class="DotSpacing">............................</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField" style="border-bottom-width:1px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ReductionForeignOilGasTaxesAmt"/>
      </xsl:call-template>  
      </div>
  </div>
  <!-- part III header -->
  <div class="LineContainer">
          <div class="IRS1118ScheduleI_PartIndex" style="width:16mm;height:8mm;padding-top:8px;background-color:white;color:black;padding-left:0px;border-top-width:0px;">
            <span style="background-color:black;color:white;padding-left:5px;padding-right:5px;">Part III</span>
          </div>
    <div class="IRS1118ScheduleI_LineDescLong" style="font-size:8pt;padding-left:4px;padding-top:8px;border-right-width:0px;width:172mm;">
       <span style="font-weight:bold;">
        Foreign Oil and Gas Taxes Available For Use in the Current Tax Year
         </span>
    </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex" style="border-top-width:1px;"/>
          <div class="IRS1118ScheduleI_LineDesc" style="border-top-width:1px;"/>
          <div class="IRS1118ScheduleI_MoneyFieldFiller" style="border-top-width:1px;"/>
  </div>
   <!-- part III line 1 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">1</div>
      <div class="IRS1118ScheduleI_LineDesc">Excess section 907(a) limitation. Subtract Schedule I, Part II, line 3 from line 2. If zero 
      </div>
      <div class="IRS1118ScheduleI_MoneyFieldFiller"/>      
      <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex"/>
      <div class="IRS1118ScheduleI_LineDesc">or less, enter -0- and do not complete the remainder of Part III
             <span class="DotSpacing">................</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ExcessSection907aLimitationAmt"/>
      </xsl:call-template>  
      </div>        
      </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex"/>
          <div class="IRS1118ScheduleI_LineDesc"/>
          <div class="IRS1118ScheduleI_MoneyFieldFiller"/>
  </div>
   <!-- part III line 2 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex">2</div>
      <div class="IRS1118ScheduleI_LineDesc">Enter the sum of any carryover of foreign oil and gas tax to the current year. Attach a
      </div>
      <div class="IRS1118ScheduleI_MoneyFieldFiller"/>      
      <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex"/>
      <div class="IRS1118ScheduleI_LineDesc">schedule showing the computation in detail
        <xsl:call-template name="SetFormLinkInline">
           <xsl:with-param name="TargetNode" select="$FormData/TotCYCarryoverFrgnOilAndTxAmt"/>
       </xsl:call-template>
             <span class="DotSpacing">.........................</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField">      
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotCYCarryoverFrgnOilAndTxAmt"/>
        </xsl:call-template>  
      </div>        
      </div>
  </div>
   <!-- spacer line-->
   <div class="LineContainer">
          <div class="IRS1118ScheduleI_LineIndex"/>
          <div class="IRS1118ScheduleI_LineDesc"/>
          <div class="IRS1118ScheduleI_MoneyFieldFiller"/>
  </div>
   <!-- part III line 3 -->
   <div class="LineContainer">
      <div class="IRS1118ScheduleI_LineIndex" style="border-bottom-width:1px;">3</div>
      <div class="IRS1118ScheduleI_LineDesc" style="border-bottom-width:1px;">Enter the smaller of lines 1 and 2 here and include on Schedule B, Part II, line 5
             <span class="DotSpacing">........</span>  
      </div>
      <div class="IRS1118ScheduleI_MoneyField" style="border-bottom-width:1px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SmllrCYForeignOilandGasTxsAmt"/>
      </xsl:call-template>  
      </div>
  </div>
     <div class="styGenericDiv" style="width: 187mm;text-align: center"/>
     <!-- leftover data table -->
        <br/>
        <br/>
        <br/>
        <p style="page-break-before:always"/>
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
            <xsl:with-param name="TargetNode" select="$FormData"/>
      <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
  </table>
  <!-- END Left Over Table -->  
  <xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6)">
<br/>
<span class="styRepeatingDataTitle">Form 1118 Schedule I Part I Lines 1 - 7 - Combined Foreign Oil and Gas Income and Taxes </span>			
<table class="styDepTbl" style="width: 256mm;font-size: 7pt">
	<thead class="styTableThead">
		<tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:6mm;height:12mm;" rowspan="2" scope="col">
			<span style="width:1px;" /></th>
        <th class="IRS1118ScheduleI_GenericCell" style="width:45mm;height:14mm;text-align:center;padding-top:2mm;padding-left:2mm;
        padding-right:2mm" rowspan="2" scope="col">
          <b>1(a). </b>EIN or Reference ID number (see instructions)*
        </th>
        <th class="IRS1118ScheduleI_GenericCell" style="width:45mm;height:14mm;text-align:center;padding-top:2mm;padding-left:3mm;
        padding-right:3mm" rowspan="2" scope="col">
          <b>1(b). </b>Name of foreign country (Use a separate line for each country.)
        </th>
        <th class="IRS1118ScheduleI_GenericCell" style="height:4mm;width:80mm;font-size:7pt;font-weight:bold;border-right-width:0px;text-align:center;" 
        colspan="6" scope="col">
          Gross Foreign Oil and Gas Income From Sources Outside the United States and its Possessions
          <span style="font-weight:normal;">(see instructions)</span>  
        </th>
      </tr>
        <tr class="styDepTblHdr">
            <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;height:10mm;" scope="col">
              <span class="styBoldText">2.</span> Gross foreign oil and gas extraction income</th>
            <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;height:10mm" scope="col">
              <span class="styBoldText">3. </span> Gross foreign oil related income </th>
            <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;height:10mm" scope="col">
              <span class="styBoldText">4. </span> Certain dividends from foreign corporations</th>
            <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;height:10mm" scope="col">
              <span class="styBoldText">5. </span> Inclusions under sections 951(a)(1) and 951A</th>
            <th class="IRS1118ScheduleI_GenericCell" style="text-align:center;height:10mm" scope="col">
              <span class="styBoldText">6.</span> Other</th>
            <th class="IRS1118ScheduleI_GenericCell" scope="col" style="width:40mm;border-right-width:0px;text-align:center;height:10mm;">
              <span class="styBoldText">7. </span> Total (add columns 2 <br/>through 6)</th>
        </tr>
      </thead>
        <tfoot/>
    <tbody>    
      <xsl:for-each select="$FormData/ForeignOilAndGasIncomeTaxes">
		<tr>
          <xsl:attribute name="class">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">styDepTblRow1
				</xsl:when>
				<xsl:otherwise>styDepTblRow2
				</xsl:otherwise>
			</xsl:choose>
		  </xsl:attribute>
        <td class="IRS1118ScheduleI_GenericCell" style="width:6mm;font-weight:bold;text-align:center;" scope="row">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RowId"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="text-align:left;width:45mm;">
			<xsl:choose>
				<xsl:when test="(ForeignCorporationEIN)">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
					</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
					      <xsl:with-param name="TargetNode" select="$FormData/ForeignEntityReferenceIdNum"/>
						</xsl:call-template>
				</xsl:when>
			   <xsl:otherwise>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignCorpMissingEINReasonCd"/>
					</xsl:call-template>
			   </xsl:otherwise>
			</xsl:choose>
			<br/>
			<xsl:for-each select="ForeignEntityIdentificationGrp">
				<xsl:variable name="pos" select="position()"/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum[$pos&gt;0]"/>
					</xsl:call-template>
					<br/>
			</xsl:for-each>		
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="text-align:left;width:45mm;">
			<xsl:choose>
				<xsl:when test="(ForeignCountryOrUSPossessionCd)">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
					</xsl:call-template>
				</xsl:when>
			   <xsl:otherwise>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="Section863bIncomeCd"/>
					</xsl:call-template>
			   </xsl:otherwise>
			</xsl:choose>
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="GroFrgnOilGasExtractionIncmAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="GroForeignOilRelatedIncomeAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="DividendsPaidFrgnCorpAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="InclusionsSect951a1Or951AAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OtherGrossIncomeAmt"/>
        </xsl:call-template>  
        </td>
        <td class="IRS1118ScheduleI_GenericCell" style="width:40mm;border-right-width:0px;padding-right:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalGrossIncomeAmt"/>
        </xsl:call-template>  
        </td>
      </tr>  
      </xsl:for-each>     
      <tr class="styDepTblHdr">
        <td class="styDepTblCell" style="width:40mm;height:4mm;font-weight:bold;text-align:center;" colspan="3" scope="row">
          Totals <span style="font-weight:normal;">(add lines A through F)</span>
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/GroFrgnOilGasExtractionIncmAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/GroForeignOilRelatedIncomeAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/DividendsPaidFrgnCorpAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/InclusionsSect951a1Or951AAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/OtherGrossIncomeAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="width:45mm;height:4mm;border-right-width:0px; padding-right:4mm; text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/TotalGrossIncomeAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
      </tr>
      </tbody>         
     </table>
   </xsl:if>
  <xsl:if test="($Print = $Separated) and (count($FormData/ForeignOilAndGasIncomeTaxes) &gt;6)">
<br/>
<span class="styRepeatingDataTitle">Form 1118 Schedule I Part I Lines 8 - 14 - Foreign Oil and Gas Extraction Income and Taxes </span>			
<table class="styDepTbl" style="width: 256mm;font-size: 7pt">
	<thead class="styTableThead">
		<tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:6mm;height:8mm" rowspan="2" scope="col"><span style="width:1px;" /></th>
        <th class="styDepTblCell" style="width:96mm;height:3mm;font-weight:bold" colspan="3" scope="col">
          Deductions
        </th>
        <th class="IRS1118ScheduleI_GenericCell" style="height:4mm;font-weight:bold;text-align:center;border-bottom:0px" colspan="1" scope="col">
        </th>
        <th class="styDepTblCell" style="width:122mm;height:3mm;font-weight:bold" colspan="3" scope="col">
          Foreign Oil and Gas Taxes <span style="font-weight:normal">(attach schedule)</span>
        </th>
      </tr>
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="height:5mm;width:32mm;text-align:center;" scope="col">8. Definitely allocable<br/>deductions</th>
        <th class="styDepTblCell" style="height:5mm;text-align:center;width: 32mm" scope="col">9. Apportioned deductions not definitely allocable</th>
        <th class="styDepTblCell" style="height:5mm;text-align:center;width: 32mm" scope="col">10. Total (add columns 8 and 9)</th>
        <th class="styDepTblCell" style="height 10mm;width: 32mm;text-align:center;border-top:0px" rowspan="2">11. Taxable income (column 7 minus column 10)</th>
        <th class="styDepTblCell" style="height:5mm;text-align:center;width: 45mm" scope="col">12. Paid or accured</th>
        <th class="styDepTblCell" style="height:5mm;text-align:center;width: 45mm" scope="col">13. Deemed paid</th>
        <th class="styDepTblCell" style="height:5mm;width:32mm;border-right-width:0px;text-align:center;" scope="col">14. Total (add columns 12 and 13)</th>
      </tr>
      </thead>
            <tfoot/>
      <tbody sytle="font-size:7pt">      
      <xsl:for-each select="$FormData/ForeignOilAndGasIncomeTaxes">
      <tr>
                  <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
        <td class="styDepTblCell" style="width:6mm;font-weight:bold;text-align:center;" scope="row">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RowId"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align:right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="DefinitelyAllocableDedAmt"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="ApportionedShareDeductionAmt"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalAllocableDeductionsAmt"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TaxableIncomeAmt"/>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <span style="float: left; clear:none">
	 <xsl:call-template name="SetFormLinkInline">
		<xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes/OilGasExtractionTxsPaidAccrAmt"/>
                      </xsl:call-template>
                    </span>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OilGasExtractionTxsPaidAccrAmt"/>
        </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align: right">
        <span style="float: left; clear:none">
        <xsl:call-template name="SetFormLinkInline">
	      <xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes/OilGasExtractionTxsDeemedPdAmt"/>
                      </xsl:call-template>
                    </span>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OilGasExtractionTxsDeemedPdAmt"/>
        </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width:32mm; text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalOilGasExtractionTaxesAmt"/>
        </xsl:call-template>  
        </td>
      </tr>  
      </xsl:for-each>  
      <tr class="styDepTblHdr">
                <td class="styDepTblCell" style="width:6mm;height:4mm;font-weight:bold;text-align:center;font-size:7pt;" scope="row">
          Totals 
        </td>
         <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/DefinitelyAllocableDedAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/ApportionedShareDeductionAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TotalAllocableDeductionsAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TaxableIncomeAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:5mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/OilGasExtractionTxsPaidAccrAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="height:5mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/OilGasExtractionTxsDeemedPdAmt"/>
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
        </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="width:32mm;height:4mm;text-align: right">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalsFrgnOilGasExtAndDedTaxes/TotalOilGasExtractionTaxesAmt"/>
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
</xsl:stylesheet>