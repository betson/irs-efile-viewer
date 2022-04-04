<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1118ScheduleJStyle.xsl"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS1118ScheduleJ"/>
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
        <meta name="Description" content="IRS Form 1118 Schedule J"/>
        <!-- this line is to be taken out -->
  <!-- javascript include -->
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
  <style type="text/css">
          <!--HINTS: Part I line 2c, Part I line 9c and Part II line c repeated by row... Part I - IV column (v) display in repeated table four times -->
  <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS1118ScheduleJStyle"/>
      <xsl:call-template name="AddOnStyle"/>
  </xsl:if>
  </style>
<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass" style="width:187mm">
        <xsl:call-template name="DocumentHeader"/>
<!-- BEGIN FORM HEADER -->
    <div class="styBB" style="width:187mm;">
	<div class="styFNBox" style="width:26mm;height:30mm;border-right-width:.5mm;">
      <span class="styFormNumber" style="font-size:10pt;">Schedule J 
	  </span>
            <br/>
			<div class="styFormNumber" style="font-size: 9pt;">(Form 1118)</div>
            <br/>
            <!--Push Pin image of form Tile left box -->
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData"/>
            </xsl:call-template>
            <span style="width:3px;"/>
            <!--Pen and ink image -->
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">Form 1118 Schedule J, Top Left Form Title - US Loss Allocation Under Notice 89-3 Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/@uSLossAllocUnderNotice89Cd"/>
            </xsl:call-template>
            <br/>
            <div style="font-size:6pt;padding-top:2mm;padding-bottom:7mm;height:4mm;">(Rev. December, 2018)</div>
            <span class="styAgency" style="text-align:center;">Department of the Treasury</span>
            <br/>
            <span class="styAgency" style="text-align:center">Internal Revenue Service</span>
	</div>
  <!-- Form Title Box -->
    <div class="styFTBox" style="width:129.5mm;height:30mm;">
    		<span class="styMainTitle" style="height:8mm;">Adjustments to Separate Limitation Income (Loss) Categories for Determining Numerators of 
    		Limitation Fractions, Year-End Recharacterization Balances, and Overall Foreign and Domestic Loss Account Balances
             </span>
                <br/>
			For calendar year 
           <span style="width:10mm;border-bottom: 1 solid black">
              <xsl:call-template name="PopulateReturnHeaderTaxYear"/>
          </span>
            , or other tax year beginning 
            <span style="width:18mm;border-bottom: 1 solid black;text-align:left;">
              <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
            </span>  ,<br/> and ending  
            <span style="width:18mm;border-bottom: 1 solid black;text-align:left;">
              <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
           </span>
            <br/>
            <span class="styBoldText" style="font-size:6pt;">
             <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>Attach to Form 1118.
            </span>
    </div>
    <!-- OMB No. -->
		<div class="styTYBox" 
		 style="width:29.5mm;height:30mm;border-left-width:.5mm;padding-top:15mm;padding-bottom:1mm;border-bottom-width:0px;text-align:center;
		 float:left;"> OMB No. 1545-0123
		</div>
	</div>
<!-- Name and Address -->
<div class="styBB" style="width:187mm;">
 <div class="styNameBox" style="width:143mm;height:9mm;font-weight:normal;font-size:7pt;">
 <!-- <div class="styINBox" style="width:186mm;height:8mm;border-right-width:0px;border-bottom-width:0px;"> -->
     Name of corporation<br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
            </xsl:call-template>
          </div>
          <!--EIN-->
     <div class="styEINDateAssets" style="width:43mm;height:9mm;border-top-width:0px;border-bottom-width:0px;">
            <span style="font-weight:bold">Employer identification number<br/>
              <br/>
            </span>
     <div class="styBoldText">
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
    </div>    
  </div>
</div>
<!-- end form number and name section -->
<!-- Part I-->
<div class="styBB" style="width:187mm;border-top-width:0px; ">
  <div class="styTitleName" style="height:4.7mm;border-bottom-width:1px;">Part I</div>
	<div class="styTitleDesc" style="height:auto;font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;">
        <b>Adjustments to Separate Limitation Income or (Losses) in Determining Numerators of Limitation Fractions </b> 
            <span class="styNormalText">(see instructions)</span>
	</div>
</div>
<!-- If the Separate Print Solution is ON and there exists any data for the repeating element more than once, -->
        <!-- display an EMPTY table.  Check if the record count of Part I Line 2c or Count of Part I Line 9c or Count of Part II Line c is greater than 1 -->
		<xsl:if test="($Print = $Separated) and                 
			( (count($FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/OtherIncomeAmt) &gt; 1) or
				(count($FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt) &gt; 1) or
				(count($FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt) &gt; 1) or
				(count($FormData/AdjSepLmtOtherIncome) &gt; 1) )">
          <!-- Part I empty table for separated foramt-->
          <div class="IRS1118ScheduleJ_TableContainer" style="width:187mm;border-top-width:0px;border-bottom-width:0px;page-break-after:always;display:block" 
				  id="adjSepLimInc">
            <table cellspacing="0" style="font-size:7pt;">
              <thead style="display:table-row-group;font-weight:normal;text-align:center;">
                <tr>
                  <th class="IRS1118ScheduleJ_GenericCell" style=" width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col"/>
                  <th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(i)</span>
                    <br/>Section 951A income
	        	      </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(ii)</span>
                    <br/>Foreign branch income
				  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(iii)</span>
                    <br/>Passive category income
	        	      </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(iv)</span>
                    <br/>General category income
				  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;border-right-width:1px;font-size:7pt;font-weight:normal;text-align:center;" 
					  scope="col">
                    <span class="styBoldText">(v)</span>
                    <br/>Other income* <!--<xsl:number value="position()" format="1"/>-->
				  </th>
					<th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;border-right-width:0px;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
					   <span class="styBoldText">(vi)</span>
					   <br/>U.S. income
					</th>
				</tr>
			  </thead>
              <tfoot/>
			<tbody>
                <!-- Part I, line 1 for empty table for separated format-->
     	        <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Income or (loss) before adjustments</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;" valign="bottom">
                    <!--See Additional Data tabel message -->
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
					  <xsl:with-param name="TargetNode" 
					  select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt"/>
                      <xsl:with-param name="ShortMessage" select=" 'true' "/>
					</xsl:call-template>
                    <span class="styTableCellPad"/>
					</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px; " valign="bottom">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px; " valign="bottom">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part I, Line 2 for empty table for separated format-->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Allocation of separate limitation losses:</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px"></td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;background-color:lightgrey;border-right-width:0px;
						border-width-bottom:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;background-color:lightgrey;border-width-bottom:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part I,  line 2a for empty table for separated format-->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Section 951A income </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part I, line 2b for empty table for separated format-->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                    <span class="styTableCellPad"/><span style="width:16px;"></span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part I,  line 2c for empty table for separated format-->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                    <span class="styTableCellPad"/><span style="width:16px;"></span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part I, line 2d for empty table for separated format-->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                    <span class="styTableCellPad"/><span style="width:16px;"></span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part I, line 2e for empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-bottom-width:0px;font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                    <span class="styTableCellPad"/><span style="width:16px;"></span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 3 empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Subtotal-</span> Combine lines 1 through 2c.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-top-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
				  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 4 empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Allocation of overall foreign losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                </tr>
                <!--Part I, Line 5 empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Allocation of domestic losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 6 empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">6</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row">
                    <span style="font-size:10px;font-weight:bold;">Subtotal-</span>
                    <span style="font-size:10px;">Combine lines 3 through 5.</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 7 empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">7</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Recapture of overall foreign losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 8 empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">8</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span><b>Subtotal-</b> Combine lines 6 and 7.</span></td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 9 empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">9</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Recharacterization of separate limitation income:</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px"></td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;background-color:lightgrey;border-right-width:0px;
						border-width-bottom:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;background-color:lightgrey;border-width-bottom:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 9a empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-top-width:0px;background-color:lightgrey;border-right-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 9b empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
				  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 9c empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-top-width:0px;background-color:lightgrey;border-right-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 9d empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
				  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 9e empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; ">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, Line 10 empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" valign="top">10</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Recapture of overall domestic losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                </tr>
                <!--Part I, Line 11 empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" valign="top">11</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;border-bottom-width:1px;">
                    <span style="font-weight:bold;">Numerator of Limitation Fraction-</span>Combine lines 8 through 10. 
                    Enter each result here and on Schedule B, Part II, line 7, of corresponding Form 1118. 
                    of corresponding Schedule B.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:1px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:1px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:1px;" valign="bottom">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:1px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:1px;" valign="bottom">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;background-color:lightgrey; border-right-width:0px;border-bottom-width:1px;" 
					  valign="bottom">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
			  </tbody>
			</table>
				<div style="width:187mm">
				    <div style="float: left; clear: none;">
						<span style="padding-right:0 mm;"><b>* Important:</b> See <i><b>Computer-Generated Schedule J</b></i>	in instructions.</span>
				    </div>
				</div>
				<div class="styFixedUnderline" style="border-bottom-width:2px;width:187mm;"/>
				<!-- Page Break and Footer-->
				
					<div style="width:187mm;clear:both;padding-top:0.4mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
						<div style="width:40mm;text-align:center;" class="styGenericDiv">Cat. No. 10309U</div>
						<div style="float:right;" class="styGenericDiv"><b>Schedule J (Form 1118) (Rev. 12-2018)</b></div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					
					
					<div style="width:187mm;padding-top:1mm;float:left">
					   Schedule J (Form 1118) (Rev. 12-2018)
						<span style="width:15mm;float:right;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
					</div>	
					
				<!-- END Page Header -->
                <!-- Part II title -->
			<table cellspacing="0" style="font-size:7pt;">
			  <tbody>
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" 
						 style="padding-top:0px;padding-bottom:0px;border-right-width:0px;border-top-width:2px;
                   font-weight:bold;font-size:8pt;width:187mm;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part II</div>
                    <span style="width:3mm;padding-top:1mm;"/> 
                      Year-End Balances of Future Separate Limitation Income That Must Be Recharacterized<br/>
                    <span style="padding-left:4mm;font-weight:bold">(section 904(f)(5)(C))</span>
                  </td>
                </tr>
                <!-- Part II Empty Table Header for separated format -->
                <tr>
                  <th class="IRS1118ScheduleJ_GenericCell" style=" width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col"/>
                  <th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(i)</span>
                    <br/>Section 951A income
	        	      </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(ii)</span>
                    <br/>Foreign branch income
				  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(iii)</span>
                    <br/>Passive category income
	        	      </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(iv)</span>
                    <br/>General category income
				  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;border-right-width:1px;font-size:7pt;font-weight:normal;text-align:center;" 
					  scope="col">
                    <span class="styBoldText">(v)</span>
                    <br/>Other income* <!--<xsl:number value="position()" format="1"/>-->
				  </th>
					<th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;border-right-width:0px;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
					   <span class="styBoldText">(vi)</span>
					   <br/>U.S. income
					</th>
				</tr>
                <!-- End Part II Empty Table Header for separated format -->
                <!--Part II, Line a empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;" valign="bottom">
                    <!--See Additional Data tabel message -->
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
					  <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt"/>
                      <xsl:with-param name="ShortMessage" select=" 'true' "/>
					</xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
				  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>  
                <!--Part II, Line b empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey">
                    <span style="width:4px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px; background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part II, Line c empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
				  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>  
                <!--Part II, Line d empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">General category income </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;background-color:lightgrey">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px; background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part II, Line e empty table for separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row" style="border-bottom-width:0px;">e</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;border-bottom-width:0px;" scope="row">Other income*</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-bottom-width:0px; ">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-bottom-width:0px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-bottom-width:0px;font-size:10px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-bottom-width:0px;border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part III title -->
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" 
                  style="width:187mm;border-top-width:2px;border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part III
                    </div>
                    <span style="width:3mm;"/> 
                        Overall Foreign Loss Account Balances (section 904(f)(1))  
                      <span style="padding-left:3mm;">
						<span style="font-style:italic;font-weight:normal;">Complete for <b>each </b>
                          separate limitation income category.</span>
                      </span>
                  </td>
                </tr>
                <!-- Part III, line 1 empty line in separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" valign="bottom" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" valign="bottom" scope="row">Beginning balance</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <!--See Additional Data tabel message -->
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
					  <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt"/>
                      <xsl:with-param name="ShortMessage" select=" 'true' "/>
					</xsl:call-template>
                    <span class="styTableCellPad"/>
                    <!--<span style="width:16px;"/>-->
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part III, line 2 empty line in separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year additions</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part III, line 3 empty line in separated format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year reductions (other than recapture)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part III, line 4 empty line in separated format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year recapture (from Part I, line 7)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part III, line 5 empty line in separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="border-bottom-width:0px;padding-left:2mm;" valign="top">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;border-bottom-width:0px;" scope="row">
                    <span style="font-weight:bold;">Ending balance-</span>Combine lines 1 through 4.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size;10px;border-right-width:1px;border-bottom-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size;10px;border-right-width:1px;border-bottom-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part IV title -->
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" style="width:187mm;padding-top:0px;padding-bottom:0px;border-top-width:2px;
                   border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part IV</div>
                    <span style="width:3mm;"/> 
                      Overall Domestic Loss Account Balances (section 904(g)(1))
                  </td>
                </tr>
                <!-- Part IV, line 1 empty line in separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Beginning balance</td>
                  <!--Column (i) -->
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <!--See Additional Data tabel message -->
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
					  <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt"/>
                      <xsl:with-param name="ShortMessage" select=" 'true' "/>
					</xsl:call-template>
                    <span class="styTableCellPad"/>
                    <!--<span style="width:16px;"/>-->
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <!-- Part IV, line 2 empty line in separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year additions</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part IV, line 3 empty line in separated format -->
                <tr>
                  <!-- new7-->
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year reductions (other than recapture)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <span class="styTableCellPad"/>(<span style="width:16px;">)</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part IV, line 4 empty line in separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Subtotal-</span>Combine lines 1 through 3.
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part IV, line 5 empty line in separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year recapture (from Part I, line 10)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part IV, line 6 empty line in separated format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">6</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Ending balance-</span>Subtract line 5 from line 4.
                    </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
              </tbody>
            </table>
				<div style="width:187mm">
				    <div style="float: left; clear: none;">
						<span style="padding-right:0 mm"><b>* Important:</b> See <i><b>Computer-Generated Schedule J</b></i>	in instructions.</span>
				    </div>
					  <span style="width:42mm;"/>						
					  <span class="styBoldText">Schedule J (Form 1118) (Rev. 12-2018)</span>
				</div>
					<div class="pageEnd"/>
          </div>
        </xsl:if>
        <!-- If the Separate Print Option is OFF OR if the Separate Print Option is ON and there is 0 or 1 data -->
        <!-- for each repeating element, print the table with data inline.-->
        <xsl:if test=" ($Print != $Separated) or
            ( ($Print = $Separated) and
            ( (count($FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/OtherIncomeAmt) &lt; 2) and
             (count($FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt) &lt; 2) and
             (count($FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt) &lt; 2) and
             (count($FormData/AdjSepLmtOtherIncome) &lt; 2) ) )">
          <!-- Part I  table 1 This is the primary table I think for inline format-->
          <div class="IRS1118ScheduleJ_TableContainer" 
			  style="width:187mm; border-top-width:0px;border-bottom-width:0px;page-break-after:always;display:block" id="adjSpLmInc">
            <!--Part I table for inline format -->
            <table cellspacing="0" style="font-size:7pt;">
              <thead style="display:table-row-group;font-weight:normal;text-align:center;">
                <tr>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col">
                  <span style="width:1px;" /></th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(i)</span>
                    <br/>Section 951A income
	            </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(ii)</span>
                    <br/>Foreign branch income
	          </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(iii)</span>
                    <br/>Passive category income
	            </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(iv)</span>
                    <br/>General category income
	          </th>
                  <th class="IRS1118ScheduleJ_GenericCell" 
					    style="width:32mm;height:10mm;border-right-width:1px;font-size:7pt;font-weight:normal;text-align:center" scope="col">
                    <span class="styBoldText">(v)</span>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]"/>
                    </xsl:call-template>
                    <br/>Other income* <!--<xsl:number value="position()" format="1"/>-->
                  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" 
						style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;border-right-width:0px;" scope="col">
                    <span class="styBoldText">(vi)</span>
                    <br/>U.S. income
	                        <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome"/>
                      <xsl:with-param name="Style">width:10mm;text-align:right;padding-left:16mm</xsl:with-param>
                    </xsl:call-template>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--Part I, line 1 for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Income or (loss) before adjustments</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px; " valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 2 for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Allocation of separate limitation losses:</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px"></td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;background-color:lightgrey;border-right-width:0px;
						border-width-bottom:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;background-color:lightgrey;border-width-bottom:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, line 2a for inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtForeignBranchIncome/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtPassiveCategoryIncm/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 2b for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtForeignBranchIncome/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtPassiveCategoryIncm/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px"/>
                </tr>
                <!--Part I, line 2c for inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:9.5px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtForeignBranchIncome/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtPassiveCategoryIncm/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 2d for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtForeignBranchIncome/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtPassiveCategoryIncm/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px"/>
                </tr>
                <!--Part I, line 2e for inline format  -->
                <!--Need to show the row e even when there is no data -->
                <xsl:if test="not($FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt)">
                  <tr>
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-top-width:1px;font-size:10px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                      <span class="styTableCellPad"/>
                    </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                  </tr>
                </xsl:if>
                <!-- Part I Line 2e repeating lines -->
                <!-- Tracks the number of rows repeating for e to determine the color that row 3 would start. -->
                <xsl:variable name="twoICounter" select="count($FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt)"/>
                <xsl:for-each select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                    Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                    find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                  ///////////////////////////////////////////////////////////////////////////////////-->
                  <tr>
                    <!-- If the position of the repeating e row is odd, then the current row is set to styDepTblRow1. -->
                    <!-- Otherwise, the current row is set to styDepTblRow2.                                          -->
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtForeignBranchIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtPassiveCategoryIncm/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; border-right-width:1px;border-width:2px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
                        select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px"/>
                  </tr>
                </xsl:for-each>
                <!-- End Part I Line 2e repeating lines -->
                <!--Part I, line 3 for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Subtotal-</span> Combine lines 1 through 2e.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;border-top-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtUSIncome/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 4 for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Allocation of overall foreign losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px;border-right-width:0px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 5 for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Allocation of domestic losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 6 for inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">6</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row">
                    <span style="font-size:10px;font-weight:bold;">Subtotal-</span>
                    <span style="font-size:10px;">Combine lines 3 through 5.</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 7 for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">7</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Recapture of overall foreign losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 8 for inline format -->
                <!-- Tracks the number of rows repeating for e to determine the color that the row 8 would start. -->
                <xsl:variable name="sevenICount" select="count($FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt)"/>
                <xsl:for-each select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                </xsl:for-each>
                <!-- end repeating rows -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">8</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span><b>Subtotal-</b> Combine lines 6 and 7.</span></td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 9 for inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">9</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Recharacterization of separate limitation income:</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px"></td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;background-color:lightgrey;border-right-width:0px">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!--Part I, line 9a for inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtForeignBranchIncome/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtPassiveCategoryIncm/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-bottom-width:1px;border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 9b for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtForeignBranchIncome/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtPassiveCategoryIncm/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-bottom-width:1px;border-right-width:0px"/>
                </tr>
                <!--Part I, line 9c for inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtForeignBranchIncome/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtPassiveCategoryIncm/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-bottom-width:1px;border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 9d for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtForeignBranchIncome/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtPassiveCategoryIncm/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:9.5px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px"/>
                </tr>
                <!--Part I, line 9e for inline format -->
                <xsl:if test="not($FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt)">
                  <tr>
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgreyborder-bottom-width:1px;"/>
                  </tr>
                </xsl:if>
                <xsl:for-each select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt">
                  <xsl:variable name="pos" select="position()"/>
                  <!-- Part I Line 9e repeating table -->
                  <!--///////////////////////////////////////////////////////////////////////////////////
                          Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                          find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                  <tr>
                    <!-- If the position of the repeating e row is odd, then the current row is set to styDepTblRow1. -->
                    <!-- Otherwise, the current row is set to styDepTblRow2.                                          -->
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; " valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; " valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:9.5px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/RecharacterizationSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px"/>
                  </tr>
                </xsl:for-each>
                <!-- End Part I Line 9e repeating table -->
                <!--Part I, line 10 for inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" valign="top">10</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Recapture of overall domestic losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <!--Pen and ink image -->
                    <span style="padding-right:2mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 General Limitation Income Column (i) - Allocation of domestic losses 
						  Indicator
                      </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtSection951AIncome/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                   </span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <!--Pen and ink image -->
                    <span style="padding-right:2mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Passive Income Colun (ii) - Allocation of domestic losses Indicator
                      </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtForeignBranchIncome/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <!--Pen and ink image -->
                    <span style="padding-right:2mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 General Limitation Income Column (i) - Allocation of domestic losses 
						  Indicator
                      </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtPassiveCategoryIncm/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                   </span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <!--Pen and ink image -->
                    <span style="padding-right:2mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Passive Income Colun (ii) - Allocation of domestic losses Indicator
                      </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtGeneralCategoryIncm/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <!--Pen and ink image -->
                   <span style="padding-right:2mm">
                   <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (iii) - Allocation of domestic losses Indicator
                      </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtOtherIncome[1]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9px;border-width:2px;" valign="bottom">
                    <!--Pen and ink image -->
                   <span style="padding-right:2mm">
                   <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (iv) - Allocation of domestic losses Indicator
                      </xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <br/>
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 11 for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="border-bottom-width:2px;" valign="top">11</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;border-bottom-width:2px;">
                    <span style="font-weight:bold;">Numerator of Limitation Fraction-</span>Combine lines 8 through 10. 
						Enter each result here and on Schedule B, Part II, line 7, of corresponding Form 1118. </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:2px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px;border-bottom-width:2px;"/>
                </tr>
            </tbody>
        </table>
				<div style="width:187mm">
				    <div style="float: left; clear: none;">
						<span style="padding-right:0 mm;"><b>* Important:</b> See <i><b>Computer-Generated Schedule J</b></i>	in instructions.</span>
				    </div>
				</div>
				<div class="styFixedUnderline" style="border-bottom-width:2px;width:187mm;"/>
				<!-- Page Break and Footer-->
				
					<div style="width:187mm;clear:both;padding-top:0.4mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
						<div style="width:40mm;text-align:center;" class="styGenericDiv">Cat. No. 10309U</div>
						<div style="float:right;" class="styGenericDiv"><b>Schedule J (Form 1118) (Rev. 12-2018)</b></div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					
					
					<div style="width:187mm;padding-top:1mm;float:left">
					   Schedule J (Form 1118) (Rev. 12-2018)
						<span style="width:15mm;float:right;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
					</div>					
				<!-- END Page Header -->
                <!-- Part II Title for inline format -->
		<table cellspacing="0" style="font-size:7pt;">
		  <tbody>
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" 
						  style="padding-top:0px;padding-bottom:0px;border-right-width:0px;border-top-width:2px;
                   font-weight:bold;font-size:8pt;width:187mm;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part II</div>
                    <span style="width:3mm;padding-top:1mm;"/> 
                      Year-End Balances of Future Separate Limitation Income That Must Be Recharacterized<br/>
                    <span style="padding-left:4mm;font-weight:bold">(section 904(f)(5)(C))</span>
                  </td>
                </tr>
                <!-- Part II Header for inline format -->
				 <thead style="display:table-row-group;font-weight:normal;text-align:center;">
					<tr>
					  <th class="IRS1118ScheduleJ_GenericCell" style="width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col">
					  <span style="width:1px;" /></th>
					  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
						<span class="styBoldText">(i)</span>
						<br/>Section 951A income
					  </th>
					  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
						<span class="styBoldText">(ii)</span>
						<br/>Foreign branch income
					  </th>
					  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
						<span class="styBoldText">(iii)</span>
						<br/>Passive category income
					  </th>
					  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
						<span class="styBoldText">(iv)</span>
						<br/>General category income
					  </th>
					  <th class="IRS1118ScheduleJ_GenericCell" 
							style="width:32mm;height:10mm;border-right-width:1px;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
						<span class="styBoldText">(v)</span>
						<xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]"/>	
						</xsl:call-template>
						<br/>Other income* <!--<xsl:number value="position()" format="1"/>-->
					  </th>
					  <th class="IRS1118ScheduleJ_GenericCell" 
							style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;border-right-width:0px;" scope="col">
						<span class="styBoldText">(vi)</span>
						<br/>U.S. income
								<xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome"/>
						  <xsl:with-param name="Style">width:10mm;text-align:right;padding-left:16mm</xsl:with-param>
						</xsl:call-template>
					  </th>
					</tr>
				 </thead>
				 <!-- End Part II Header for inline format -->
                <!--Part II line a for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part II line b for inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Foreign branch income </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part II line c for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part II line d for inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">General category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                  <!-- This is just a space between the greyed out cell and the next cell.  No data, just a break in the paragraph for readability sake. -->
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part II line e for inline format  repeating rows -->
                <!-- blank lines, row e,  if no data -->
                <xsl:if test="not($FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt)">
                  <tr>
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;">
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;">
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/PassiveCategoryIncomeAmt/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/GeneralCategoryIncomeAmt/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:0px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
					<td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                  </tr>
                </xsl:if>
                <!-- Part II Line e repeating table -->
                <xsl:for-each select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                  <tr>
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
                        select="$FormData/AdjSepLmtSection951AIncome/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
                        select="$FormData/AdjSepLmtForeignBranchIncome/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
                        select="$FormData/AdjSepLmtPassiveCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
                        select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1 solid black;background-color:lightgrey; ">
                      <span class="styTableCellPad"/>                      
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                  </tr>
                </xsl:for-each>
                <!-- End Part II Line e repeating table -->
                <!--Part III Title in inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" style="width:187mm;padding-top:0px;padding-bottom:0px;border-top-width:2px;
                   border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4mm;">Part III</div>
                    <span style="width:3mm;"/> 
                        Overall Foreign Loss Account Balances (section 904(f)(1))  
                    <span style="font-style:italic;font-weight:normal;">
                      <span style="padding-left:3mm;">
                        Complete for <span style="font-weight:bold;">each </span>
                        separate limitation income category.</span>
                    </span>
                  </td>
                </tr>
                <!--part III, Line 1 inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Beginning balance</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--part III, Line 2 inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year additions</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--part III, Line 3 inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year reductions (other than recapture)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--part III, Line 4 inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year recapture (from Part I, line 7)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--part III, Line 5 inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="border-bottom-width:0px;padding-left:2mm;" valign="top">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;border-bottom-width:0px;" scope="row">
                    <span style="font-weight:bold;">Ending balance-</span>Combine lines 1 through 4.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" 
                  style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm//OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;border-bottom-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part IV title for inline format -->
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" style="width:187mm;padding-top:0px;padding-bottom:0px;border-top-width:2px;
                   border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part IV</div>
                    <span style="width:3mm;"/> 
                      Overall Domestic Loss Account Balances (section 904(g)(1))
                  </td>
                </tr>
                <!--Part IV, Line 1 for inline format  -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Beginning balance</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part IV, Line 2 for inline format   -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year additions</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part IV, Line 3 for inline format   -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year reductions (other than recapture)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part IV, Line 4 for inline format   -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Subtotal-</span>Combine lines 1 through 3.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part IV, Line 5 for inline format   -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year recapture (from Part I, line 10)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/ OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"
                       select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part IV, Line 6 for inline format   -->
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">6</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Ending balance-</span>Subtract line 5
                      from line 4.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
              </tbody>
            </table>
				<div style="width:187mm">
					<div style="float: left; clear: none;">
						<span style="padding-right:0 mm"><b>* Important:</b> See <i><b>Computer-Generated Schedule J</b></i>	in instructions.</span>
					</div>
						  <span style="width:42mm;"/>
						  <span class="styBoldText">Schedule J (Form 1118) (Rev. 12-2018)</span>
				</div>
				<div class="pageEnd"/>
          </div>
        </xsl:if>
  <!-- If the Separate Print Option is OFF, repeat table for the repeating column v. -->
  <!-- the repeating columns of column v is displayed below -->
  <!-- first column v -->
  <xsl:if test="($Print != $Separated) and count($FormData/AdjSepLmtOtherIncome) &gt; 1">
    <xsl:for-each select="$FormData/AdjSepLmtOtherIncome">
      <xsl:variable name="pos" select="position()"/>
            <xsl:if test="$pos mod 4 = 2">
        <!-- //////////////////////////////////////////////////////////////////////////////////////////
              Repeat the Whole Table Here - Column v displayed as many times as required at four per page
          ///////////////////////////////////////////////////////////////////////////////////////// -->
              <br/>
              <span class="styRepeatingDataTitle" style="width:187mm;">Form 1118 Schedule J, Parts I - II Column (v) Other Income (Continue)</span>
              <!-- Part I Title for repeating Column (v) for inline format -->
              <div class="styBB" style="width:187mm;border-top-width:1px;">
                   <div class="styTitleName" style="height:4.7mm;border-bottom-width:1px;">Part I</div>
                   <div class="styTitleDesc" style="height:auto;font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;">
                       <b>Adjustments to Separate Limitation Income or (Losses) in Determining Numerators of Limitation Fractions </b>
                  <span class="styNormalText">(see instructions.)</span>
                  </div>
              </div>
              <!-- Part I Table for repeating Column (v) for inline format-->
              <div class="IRS1118ScheduleJ_TableContainer" style="width:187mm;border-top-width:0px;border-bottom-width:0px;page-break-after:always;display:block" 
              id="adSeLmIn">
                <table cellspacing="0" style="font-size:7pt;">
                  <thead style="display:table-row-group;font-weight:normal;text-align:center;">
                    <tr>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col">
                      <span style="width:1px;" /></th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position()" format="2"/>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +1" format="2"/>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +2" format="2"/>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;
                      text-align:center;border-right-width:0px;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +3" format="2"/>
                      </th>
                    </tr>
                  </thead>
                  <tfoot/>
                  <tbody>
                    <!-- Part I, Line 1 for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" valign="top" style="padding-left:2mm;">1</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Income or (loss) before adjustments</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/TotIncmOrLossBfrAdjustmentsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/TotIncmOrLossBfrAdjustmentsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/TotIncmOrLossBfrAdjustmentsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/TotIncmOrLossBfrAdjustmentsAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 2 for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="width:99mm;font-size:10px;border-right-width:0px;" colspan="5" scope="row">
                      Allocation of separate limitation losses:</td>
                    </tr>
                    <!-- Part I, Line 2a for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Section 951A income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 2b for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 2c for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Passive category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 2d for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 2e for repeating Column (v) repeating row for inline format-->
                    <xsl:for-each select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt">
                      <xsl:variable name="rowpos" select="position()"/>
                      <!--///////////////////////////////////////////////////////////////////////////////////
                          Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                          find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                          ///////////////////////////////////////////////////////////////////////////////////-->
                      <tr>
                        <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                        <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
									select="$FormData/AdjSepLmtOtherIncome[$pos]/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
									select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
									select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
									select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <!-- end repeating rows -->
                    <!-- Part I, Line 3 for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span style="font-weight:bold;">Subtotal-</span> Combine lines 1 through 2e.</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/TotIncomeOrLossCYAllocationAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/TotIncomeOrLossCYAllocationAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/TotIncomeOrLossCYAllocationAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/TotIncomeOrLossCYAllocationAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 4 for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Allocation of overall foreign losses</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-right-width:0px;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 5 for repeating Column (v)  for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">5</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Allocation of domestic losses</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/DomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/DomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/DomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/DomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 6 for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">6</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span style="font-weight:bold;">Subtotal-</span>Combine lines 3 through 5.</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/AdjustedIncmLossAndAllocnCYAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AdjustedIncmLossAndAllocnCYAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AdjustedIncmLossAndAllocnCYAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="ont-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AdjustedIncmLossAndAllocnCYAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 7 for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">7</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Recapture of overall foreign losses</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/RcptrOverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RcptrOverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RcptrOverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RcptrOverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 8 for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">8</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span><b>Subtotal-</b> Combine lines 6 and 7.</span></td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/AdjIncmLossAndLmtIncmAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AdjIncmLossAndLmtIncmAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AdjIncmLossAndLmtIncmAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AdjIncmLossAndLmtIncmAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 9 for repeating Column (v) repeating row for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">9</td>
                      <td class="IRS1118ScheduleJ_DescCell" colspan="10" scope="row" style="width:99mm;font-size:10px;border-right-width:0px;">
                      Recharacterization of separate limitation income:</td>
                    </tr>
                    <!-- Part I, Line 9a for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
								   select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 9b for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 9c for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
								   select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 9d for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <xsl:for-each select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt">
                      <xsl:variable name="rowpos" select="position()"/>
                      <!--///////////////////////////////////////////////////////////////////////////////////
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                      <!-- Part I, Line 9e for repeating Column (v) repeating row for inline format-->
                      <tr>
                        <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                        <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Other income*</td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 
									select="$FormData/AdjSepLmtOtherIncome[$pos]/RecharacterizationSepLmtIncm/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 
									select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RecharacterizationSepLmtIncm/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 
									select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RecharacterizationSepLmtIncm/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 
									select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RecharacterizationSepLmtIncm/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <!-- end repeating rows -->
                    <!-- Part I, Line 10 for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" valign="top">10</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Recapture of overall domestic losses</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <!--Pen and ink image -->
                        <span style="padding-right:2mm">
                        <xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (iii) - Allocation of domestic losses Indicator
                          </xsl:with-param>
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                        </xsl:call-template>
                        </span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/RcptrOverallDomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <!--Pen and ink image -->
                        <span style="padding-right:2mm">
                        <xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (iii) - Allocation of domestic losses Indicator
                          </xsl:with-param>
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                        </xsl:call-template>
                        </span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RcptrOverallDomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <!--Pen and ink image -->
                        <span style="padding-right:2mm">
                        <xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (iii) - Allocation of domestic losses Indicator
                          </xsl:with-param>
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                        </xsl:call-template>
                        </span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RcptrOverallDomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <!--Pen and ink image -->
                        <span style="padding-right:2mm">
                        <xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (iii) - Allocation of domestic losses Indicator
                          </xsl:with-param>
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                        </xsl:call-template>
                       </span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RcptrOverallDomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 11 for repeating Column (iii) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" valign="top" scope="row">11</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;border-bottom-width:1px;" scope="row">
                        <span style="font-weight:bold;">Numerator of Limitation Fraction-</span>Combine lines 8 through 10.  
                        Enter each result here and on Schedule B, Part II, line 7, of corresponding Form 1118. 
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/NumLimitationFractionAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/NumLimitationFractionAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/NumLimitationFractionAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/NumLimitationFractionAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part II title for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
                      style="width:187mm;padding-top:0px;padding-bottom:0px;border-right-width:0px;border-top-width:1px;font-weight:bold;
                      font-size:8pt;padding-left:0px;height:8mm;">
                        <div class="styTitleName" style="height:4.7mm;">Part II</div>
                        <span style="width:3mm;"/> 
                            Year-End Balances of Future Separate Limitation Income That Must Be Recharacterized<br/>
                        <span style="padding-left:4mm;font-weight:bold">(section 904(f)(5)(C))</span>
                      </td>
                    </tr>
                    <!-- Part II, Line a for repeating Column v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part II, Line b for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part II, Line c for repeating Column v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part II, Line d for repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part II, Line e for repeating Column (v) Repeating row for inline format-->
                    <xsl:for-each select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt">
                      <xsl:variable name="rowpos" select="position()"/>
                      <!--//////////////////////////////////////////////////////////////////////////////
                          Note:  there are no repeating rows in this section
                        ///////////////////////////////////////////////////////////////////////////////////-->
                      <tr>
                        <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                        <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Other income*</td>
                        <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;background-color:lightgrey;">
                          <span class="styTableCellPad"/>
                          <span style="width:16px;"/>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;background-color:lightgrey;">
                          <span class="styTableCellPad"/>
                          <span style="width:16px;"/>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;background-color:lightgrey;">
                          <span class="styTableCellPad"/>
                          <span style="width:16px;"/>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" 
							style="font-size:10px;border-bottom-width:1px;border-right-width:0px;background-color:lightgrey;">
                          <span class="styTableCellPad"/>
                          <span style="width:16px;"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                    </tbody>
                    </table>
                    </div>
                    <!-- end repeating rows -->
              <br/>
              <span class="styRepeatingDataTitle" style="width:187mm;">Form 1118 Schedule J, Parts III - IV Column (v) Other Income (Continue)</span>
              <div class="IRS1118ScheduleJ_TableContainer" style="width:187mm;border-top-width:0px;border-bottom-width:0px;page-break-after:always;display:block" 
              id="adSeLmIn">
                <table cellspacing="0" style="font-size:7pt;">
                     <!--Part III title for Repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
                      style="width:187mm;border-top-width:1px;border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                        <div class="styTitleName" style="height:4.7mm;">Part III
                        </div>
                        <span style="width:3mm;"/> 
                          Overall Foreign Loss Account Balances (section 904(f)(1)) 
                        <span style="padding-left:3mm;">
                          <span style="font-style:italic;font-weight:normal;">Complete for <b>each </b>
                            separate limitation income category.</span>
                        </span>
                      </td>
                    </tr>
              <tbody>
                    <!-- Part III, Line 1 for Repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Beginning balance</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part III, Line 2 for Repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year additions</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part III, Line 3 for Repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year reductions (other than recapture)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part III, Line 4 for Repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year recapture (from Part I, line 7)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part III, Line 5 for Repeating Column v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">5</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span style="font-weight:bold;">Ending balance-</span>Combine lines 1 through 4.</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Title for Repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
                      style="width:187mm;border-top-width:1px;border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                        <div class="styTitleName" style="height:4.7mm;">Part IV</div>
                        <span style="width:3mm;"/> 
                           Overall Domestic Loss Account Balances (section 904(g)(1)) 
                      </td>
                    </tr>
                    <!--Part IV Line 1 for Repeating Column (v) -->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Beginning balance</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Line 2 for Repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year additions</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Line 3 for Repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year reductions (other than recapture)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Line 4 for Repeating Column v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span style="font-weight:bold;">Subtotal-</span>Combine lines 1 through 3.</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Line 5 for Repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">5</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year recapture (from Part I, line 10)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
							   select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Line 6 for Repeating Column (v) for inline format-->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">6</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span style="font-weight:bold;">Ending balance-</span>Subtract line 5 from line 4</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-right-width:0px;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </tbody>
                </table>
					<div style="width:187mm">
					  <div style="float: left; clear: none;">
							<span style="padding-right:0 mm"><b>* Important:</b> See <i><b>Computer-Generated Schedule J</b></i>	in instructions.</span>
						</div>
							<span style="width:42mm;"/>
							<span class="styBoldText">Schedule J (Form 1118) (Rev. 12-2018)</span>
					</div>
						<div class="pageEnd"/>
              </div>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
        <!-- end display repeating column iii -->
        <!-- This footer was removed 20151102 and placed at the end of each Part IV (Regular, Inline, and Separated) -->
        <!--BEGIN FOOTER--><!--
        <div style="width:187mm">
          <div style="float: left; clear: none;">
            <span class="styBoldText">* Important: </span>
            <span class="styItalicText">See <span class="styBoldText">Computer-Generated Schedule J </span>
            </span> in instructions.
          </div>
          <span style="width:13mm;"/>
              Cat. No. 10309U <span style="width:29px;"/>
          <span class="styBoldText">Schedule J (Form 1118) (Rev. 01-2009)</span>
        </div>
        <div class="pageEnd"/>-->
        <!--END FOOTER-->
<!-- BEGIN Left Over Table -->  
  <!-- Additonal Data Title Bar and Button -->
  <div class="styLeftOverTitleLine" id="LeftoverData">
    <div class="styLeftOverTitle">
      Additional Data        
    </div>
    <div class="styLeftOverButtonContainer">
      <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
    </div>      
  </div>
        <!-- ADDITIONAL DATA TABLE -->
  <table class="styLeftOverTbl">
    <xsl:call-template name="PopulateCommonLeftover">
        <xsl:with-param name="TargetNode" select="$FormData"/>
        <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
    <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Form 1118 Schedule J, Top Left Form Title - US Loss Allocation Under Notice 89-3 Indicator
        </xsl:with-param>
        <xsl:with-param name="TargetNode" select="$FormData/@uSLossAllocUnderNotice89Cd"/>
        <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
    <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Form 1118 Schedule J, Line 10 General Limitation Income Column (i) - Allocation of domestic losses Indicator
        </xsl:with-param>
        <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
        <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
    <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Form 1118 Schedule J, Line 10 Passive Income Column (ii) - Allocation of domestic losses Indicator</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
        <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
    <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Form 1118 Schedule J, Line 10 Other Income Column (iii) - Allocation of domestic losses Indicator</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
	    <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
  </table>  
<!-- END Left Over Table header -->  
        <!--Begin Blue or Separate format table -->
        <!-- If the Separate Print Option is OFF OR if the Separate Print Option is ON and there is 0 or 1 data -->
        <!-- for each repeating element, print the table with data inline.                                      -->
        <!-- Changed re Defect 48050 20170525 gdy -->
        <xsl:if test="
                         ($Print = $Separated) and
                         ( (count($FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/OtherIncomeAmt) &gt; 1) or
                            (count($FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt) &gt; 1) or
                           (count($FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt) &gt; 1) or
                           (count($FormData/AdjSepLmtOtherIncome) &gt; 1) ) ">
          <!-- Part I  table 1 This is the Blue or Separate format table-->
          <div class="IRS1118ScheduleJ_TableContainer" 
				style="width:187mm; border-top-width:0px;border-bottom-width:0px;page-break-after:always;display:block" id="adjSpLmInc">
            <!--Part I table for Blue or Separate format table -->
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead style="display:table-row-group;font-weight:normal;text-align:center;">
                <tr class="styDepTblHdr">
                  <!-- The color of the current row is dependent on the number of rows in 2e and 9e.   -->
                  <!-- Therefore, if the sum of the number of data for 2e and 9e is odd, set current to-->
                  <!-- styDepTblRow1. Otherwise, set it to styDepTblRow2.                              -->
                  <th class="IRS1118ScheduleJ_DescCell" colspan="8" scope="col" 
					  style="padding-top:0px;padding-bottom:0px;border-right-width:0px;border-top-width:2px;
								font-weight:bold;font-size:8pt;width:187mm;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part I</div>
                    <span class="styBoldText">
                       Adjustments to Separate Limitation Income or (Losses) in Determining Numerators of Limitation Fractions 
                    </span>
                    <span class="styNormalText">(see instructions.)</span>
                  </th>
                </tr>
                <tr class="styDepTblHdr">
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col">
                  <span style="width:1px;" /></th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(i)</span>
                    <br/>Section 951A income
	            </th>
					  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(ii)</span>
                    <br/>Foreign branch income
	          </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(iii)</span>
                    <br/>Passive category income
	            </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(iv)</span>
                    <br/>General category income
	          </th>
                  <th class="IRS1118ScheduleJ_GenericCell" 
					  style="width:32mm;height:10mm;border-right-width:1px;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(v)</span>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]"/>
                    </xsl:call-template>
                    <br/>Other income* <xsl:number value="position()" format="1"/>
                  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" 
						style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;border-right-width:0px;" scope="col">
                    <span class="styBoldText">(vi)</span>
                    <br/>U.S. income
	                        <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome"/>
                      <xsl:with-param name="Style">width:10mm;text-align:right;padding-left:16mm</xsl:with-param>
                    </xsl:call-template>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--Part I, line 1 for Blue or Separate format table-->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Income or (loss) before adjustments</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px; " valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="width:32mm;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px; " valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/TotIncmOrLossBfrAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 2 for Blue or Separate format table-->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="width:99mm;font-size:10px;border-right-width:0px;" colspan="7" scope="row">
                  Allocation of separate limitation losses:</td>
                </tr>
                <!--Part I, line 2a for Blue or Separate format table  -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtPassiveCategoryIncm/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-top-width:1px;background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 2b for Blue or Separate format table -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtPassiveCategoryIncm/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 2c for Blue or Separate format table  -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtPassiveCategoryIncm/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 2d for Blue or Separate format table -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtPassiveCategoryIncm/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 2e for Blue or Separate format table  -->
                <!--Need to show the row e even when there is no data -->
                <xsl:if test="not($FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt)">
                  <tr class="styDepTblRow1">
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-top-width:1px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;background-color:lightgrey;"/>)
                    </td>
                  </tr>
                </xsl:if>
                <!-- Tracks the number of rows repeating for e to determine the color that row 3 would start. -->
                <xsl:variable name="twoICounter" select="count($FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt)"/>
                <xsl:for-each select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                    Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                    find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                  ///////////////////////////////////////////////////////////////////////////////////-->
                  <tr>
                    <xsl:choose>
                      <xsl:when test="position() mod 2 = 1">
                        <xsl:attribute name="class">styDepTblRow1</xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="class">styDepTblRow2</xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                    <!-- If the position of the repeating e row is odd, then the current row is set to styDepTblRow1. -->
                    <!-- Otherwise, the current row is set to styDepTblRow2.                                          -->
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtSection951AIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtForeignBranchIncome/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; border-right-width:1px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
                        select="$FormData/AdjSepLmtPassiveCategoryIncm/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; border-right-width:1px;border-width:2px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                  </tr>
                </xsl:for-each>
                <!--Part I, line 3 for Blue or Separate format table -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Subtotal-</span> Combine lines 1 through 2e.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;border-top-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/TotIncomeOrLossCYAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 4 for Blue or Separate format table -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Allocation of overall foreign losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 5 for Blue or Separate format table -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Allocation of domestic losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 6 for Blue or Separate format table  -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">6</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row">
                    <span style="font-size:10px;font-weight:bold;">Subtotal-</span>
                    <span style="font-size:10px;">Combine lines 3 through 5.</span>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/AdjustedIncmLossAndAllocnCYAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 7 for Blue or Separate format table -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">7</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Recapture of overall foreign losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/RcptrOverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 8 for Blue or Separate format table -->
                <!-- Tracks the number of rows repeating for e to determine the color that the row 8 would start. -->
                <xsl:variable name="sevenICount" select="count($FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt)"/>
                <xsl:for-each select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                </xsl:for-each>
                <!-- end repeating rows -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">8</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span><b>Subtotal-</b> Combine lines 6 and 7.</span></td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/AdjIncmLossAndLmtIncmAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 9 for Blue or Separate format table  -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">9</td>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="7" style="width:99mm;font-size:10px;border-right-width:0px;" scope="row">
                  Recharacterization of separate limitation income:</td>
                </tr>
                <!--Part I, line 9a for Blue or Separate format table  -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtPassiveCategoryIncm/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtOtherIncome[1]/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-top-width:1px;background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 9b for Blue or Separate format table -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtPassiveCategoryIncm/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtOtherIncome[1]/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 9c for Blue or Separate format table  -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode"
						 select="$FormData/AdjSepLmtPassiveCategoryIncm/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtOtherIncome[1]/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 9d for Blue or Separate format table -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtPassiveCategoryIncm/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtOtherIncome[1]/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
                <!--Part I, line 9e for Blue or Separate format table -->
                <xsl:if test="not($FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt)">
                  <tr class="styDepTblRow1">
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell">
                      <span class="styTableCellPad"/><span style="width:16px;"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell">
                      <span class="styTableCellPad"/><span style="width:16px;"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell">
                      <span class="styTableCellPad"/><span style="width:16px;"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell">
                      <span class="styTableCellPad"/><span style="width:16px;"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell">
                      <span class="styTableCellPad"/><span style="width:16px;background-color:lightgrey;"/>
                    </td>
                  </tr>
                </xsl:if> 
                <xsl:for-each select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                          Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                          find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                  <tr>
                    <xsl:choose>
                      <xsl:when test="position() mod 2 = 1">
                        <xsl:attribute name="class">styDepTblRow1</xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="class">styDepTblRow2</xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                    <!-- If the position of the repeating e row is odd, then the current row is set to styDepTblRow1. -->
                    <!-- Otherwise, the current row is set to styDepTblRow2.                                          -->
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtForeignBranchIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtPassiveCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtOtherIncome[1]/RecharacterizationSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                  </tr>
                </xsl:for-each>
                <!--Part I, line 10 for Blue or Separate format table  -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" valign="top">10</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Recapture of overall domestic losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <!--Pen and ink image -->
                    <span style="padding-right:2mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 General Limitation Income Column (i) - Allocation of domestic losses 	
						  Indicator
                      </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtSection951AIncome/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <!--Pen and ink image -->
                   <span style="padding-right:2mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Passive Income Colun (ii) - Allocation of domestic losses 
						  Indicator
					  </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <!--Pen and ink image -->
                   <span style="padding-right:2mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Passive Income Colun (ii) - Allocation of domestic losses 
						  Indicator
					  </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtPassiveCategoryIncm/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <!--Pen and ink image -->
                   <span style="padding-right:2mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Passive Income Colun (ii) - Allocation of domestic losses 
						  Indicator
					  </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <!--Pen and ink image -->
                    <span style="padding-right:2mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (iii) - Allocation of domestic losses Indicator
						  </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtOtherIncome[1]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                    <!--Pen and ink image -->
                   <span style="padding-right:2mm">
                   <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (iv) - Allocation of domestic losses Indicator
						</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <br/>
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Part I, line 11 for Blue or Separate format table -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="border-bottom-width:0px;" valign="top">11</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;border-bottom-width:0px;">
                    <span style="font-weight:bold;">Numerator of Limitation Fraction-</span>Combine lines 8 through 10. Enter each result here and on Schedule B, 
						Part II, line 7, of corresponding Form 1118. 
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:0px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:0px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:0px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-bottom-width:0px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey; border-right-width:0px;" valign="bottom"/>
                </tr>
                <!-- Part II Title for Blue or Separate format table -->
                <!-- Part II Title for Blue or Separate format table header -->
                <tr class="styDepTblHdr">
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" 
					  style="padding-top:0px;padding-bottom:0px;border-right-width:0px;border-top-width:2px;
					            font-weight:bold;font-size:8pt;width:187mm;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part II</div>
                    <span style="width:3mm;padding-top:1mm;"/> 
                      Year-End Balances of Future Separate Limitation Income That Must Be Recharacterized<br/>
                    <span style="padding-left:4mm;font-weight:bold">(section 904(f)(5)(C))</span>
                  </td>
                </tr>
                <tr class="styDepTblHdr">
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col">
                  <span style="width:1px;" /></th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(i)</span>
                    <br/>Section 951A income
	            </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(ii)</span>
                    <br/>Foreign branch income
	          </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(iii)</span>
                    <br/>Passive category income
	            </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(iv)</span>
                    <br/>General category income
	          </th>
                  <th class="IRS1118ScheduleJ_GenericCell" 
					  style="width:32mm;height:10mm;border-right-width:1px;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(v)</span>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]"/>
                    </xsl:call-template>
                    <br/>Other income* <xsl:number value="position()" format="1"/>
                  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" 
						style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;border-right-width:0px;" scope="col">
                    <span class="styBoldText">(vi)</span>
                    <br/>U.S. income
	                        <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome"/>
                      <xsl:with-param name="Style">width:10mm;text-align:right;padding-left:16mm</xsl:with-param>
                    </xsl:call-template>
                  </th>
                </tr>
                <!-- End Part II Title for Blue or Separate format table header -->
                <!--Part II line a for Blue or Separate format table -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtPassiveCategoryIncm/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtOtherIncome[1]/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part II line b for Blue or Separate format table  -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtPassiveCategoryIncm/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtOtherIncome[1]/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px; background-color:lightgrey;"/>
                </tr>
                <!--Part II line c for Blue or Separate format table -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;background-color:lightgrey;" valign="bottom">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtOtherIncome[1]/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part II line d for Blue or Separate format table  -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">General category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtPassiveCategoryIncm/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtOtherIncome[1]/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                    </xsl:call-template>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                  </td>
                </tr>
                <!--Part II line e for Blue or Separate format table  repeating rows -->
                <!-- blank lines, row e,  if no data -->
                <xsl:if test="not($FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt)">
                  <tr>
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;">
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;">
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;border-bottom-width:0px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:for-each select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                  <!-- ********************************************************************
						  Note that columns (i) and (ii) do NOT repeat for row e on this table.  Per UWR 211899
						********************************************************************-->
                  <tr>
                    <xsl:choose>
                      <xsl:when test="position() mod 2 = 1">
                        <xsl:attribute name="class">styDepTblRow1</xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="class">styDepTblRow2</xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtSection951AIncome/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtForeignBranchIncome/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtPassiveCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt[$pos]"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
                  </tr>
                </xsl:for-each>
                <!-- end repeating rows -->
                <!--Part III Title in Blue or Separate format table -->
                <tr class="styDepTblHdr">
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" style="width:187mm;padding-top:0px;padding-bottom:0px;border-top-width:2px;
                   border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part III</div>
                    <span style="width:3mm;"/> 
                        Overall Foreign Loss Account Balances (section 904(f)(1))  
                    <span style="font-style:italic;font-weight:normal;">
                      <br/>
                      <span style="padding-left:3mm;">
                        Complete for <span style="font-weight:bold;">each </span>
                        separate limitation income category.</span>
                    </span>
                  </td>
                </tr>
                <!--part III, Line 1 Blue or Separate format table -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Beginning balance</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--part III, Line 2 Blue or Separate format table  -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year additions</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--part III, Line 3 Blue or Separate format table  -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year reductions (other than recapture)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--part III, Line 4 Blue or Separate format table -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year recapture (from Part I, line 7)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--part III, Line 5 Blue or Separate format table  -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="border-bottom-width:0px;padding-left:2mm;" valign="top">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;border-bottom-width:0px;" scope="row">
                    <span style="font-weight:bold;">Ending balance-</span>Combine lines 1 through 4.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                <!-- Part IV title for Blue or Separate format table -->
                <tr class="styDepTblHdr">
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" style="width:187mm;padding-top:0px;padding-bottom:0px;border-top-width:2px;
                   border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part IV</div>
                    <span style="width:3mm;"/> 
                      Overall Domestic Loss Account Balances (section 904(g)(1))
                  </td>
                </tr>
                <!--Part IV, Line 1 for Blue or Separate format table  -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Beginning balance</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part IV, Line 2 for Blue or Separate format table   -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year additions</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part IV, Line 3 for Blue or Separate format table   -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year reductions (other than recapture)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part IV, Line 4 for Blue or Separate format table   -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Subtotal-</span>Combine lines 1 through 3.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part IV, Line 5 for Blue or Separate format table   -->
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year recapture (from Part I, line 10)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/ OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/ OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                <!--Part IV, Line 6 for Blue or Separate format table   -->
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">6</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Ending balance-</span>Subtract line 5
                      from line 4.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtForeignBranchIncome/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCategoryIncm/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </xsl:if>
        <!-- If the Separate Print Option is OFF, repeat table for the repeating column v. -->
        <!-- the repeating columns of column iii is displayed below -->
        <!-- first column v -->
        <xsl:if test="($Print = $Separated) and count($FormData/AdjSepLmtOtherIncome) &gt; 1">
          <xsl:for-each select="$FormData/AdjSepLmtOtherIncome">
            <xsl:variable name="pos" select="position()"/>
            <xsl:if test="$pos mod 4 = 2">
              <!-- //////////////////////////////////////////////////////////////////////////////////////////
              Repeat the Whole Table Here - Column v displayed as many times as required at four per page
          ///////////////////////////////////////////////////////////////////////////////////////// -->
              <br/>
              <span class="styRepeatingDataTitle" style="width:187mm;">Form 1118 Schedule J, Parts I - II Column (v) Other Income (Continue)</span>
              <!-- Part I Table for repeating Column (iii) for Blue or Separate format table-->
              <div class="IRS1118ScheduleJ_TableContainer" 
				  style="width:187mm;border-top-width:0px;border-bottom-width:0px;page-break-after:always;display:block" id="adSeLmIn">
                <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
                <thead style="display:table-row-group;font-weight:normal;text-align:center;">
                    <tr class="styDepTblHdr">
                      <th class="IRS1118ScheduleJ_DescCell" colspan="6" scope="col" 
						  style="padding-top:0px;padding-bottom:0px;border-right-width:0px;border-top-width:2px;
                       font-weight:bold;font-size:8pt;width:187mm;padding-left:0px;height:8mm;">
                        <div class="styTitleName" style="height:4.7mm;">Part I</div>
                        <span class="styBoldText">
                             Adjustments to Separate Limitation Income or (Losses) in Determining Numerators of Limitation Fractions 
                            </span>
                        <span class="styNormalText">(see instructions.)</span>
                      </th>
                    </tr>
                    <tr class="styDepTblHdr">
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col">
                      <span style="width:1px;" /></th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position()" format="2"/>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +1" format="2"/>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +2" format="2"/>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;border-right-width:0px;" 
                      scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +3" format="2"/>
                      </th>
                    </tr>
                  </thead>
                  <tfoot/>
                  <tbody>
                    <!-- Part I, Line 1 for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" valign="top" style="padding-left:2mm;">1</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Income or (loss) before adjustments</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/TotIncmOrLossBfrAdjustmentsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/TotIncmOrLossBfrAdjustmentsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/TotIncmOrLossBfrAdjustmentsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/TotIncmOrLossBfrAdjustmentsAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 2 for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="width:99mm;font-size:10px;border-right-width:0px;" colspan="5" scope="row">
                      Allocation of separate limitation losses:</td>
                    </tr>
                    <!-- Part I, Line 2a for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Section 951A income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 2b for repeating Column (V) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AllocationCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 2c for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Passive category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AllocationCYSeparateLmtLosses/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 2d for repeating Column (V) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AllocationCYSeparateLmtLosses/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 2e for repeating Column (v) repeating row for Blue or Separate format table-->
                    <xsl:for-each select="$FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/OtherIncomeAmt">
                      <xsl:variable name="rowpos" select="position()"/>
                      <!--///////////////////////////////////////////////////////////////////////////////////
                          Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                          find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                          ///////////////////////////////////////////////////////////////////////////////////-->
                      <tr>
                        <xsl:choose>
                          <xsl:when test="position() mod 2 = 1">
                            <xsl:attribute name="class">styDepTblRow1</xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="class">styDepTblRow2</xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                        <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:1px;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtOtherIncome[$pos]/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:1px;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:1px;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:1px;border-right-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AllocationCYSeparateLmtLosses/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <!-- end repeating rows -->
                    <!-- Part I, Line 3 for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span style="font-weight:bold;">Subtotal-</span> Combine lines 1 through 2e.</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/TotIncomeOrLossCYAllocationAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/TotIncomeOrLossCYAllocationAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/TotIncomeOrLossCYAllocationAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/TotIncomeOrLossCYAllocationAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 4 for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Allocation of overall foreign losses</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-right-width:0px;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 5 for repeating Column (v)  for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">5</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Allocation of domestic losses</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/DomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/DomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/DomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/DomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 6 for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">6</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span style="font-weight:bold;">Subtotal-</span>Combine lines 3 through 5.</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/AdjustedIncmLossAndAllocnCYAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AdjustedIncmLossAndAllocnCYAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AdjustedIncmLossAndAllocnCYAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="ont-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AdjustedIncmLossAndAllocnCYAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 7 for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">7</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Recapture of overall foreign losses</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/RcptrOverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RcptrOverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RcptrOverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RcptrOverallForeignLossesAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 8 for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">8</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span><b>Subtotal-</b> Combine lines 6 and 7.</span></td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/AdjIncmLossAndLmtIncmAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/AdjIncmLossAndLmtIncmAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/AdjIncmLossAndLmtIncmAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/AdjIncmLossAndLmtIncmAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 9 for repeating Column (v) repeating row for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">9</td>
                      <td class="IRS1118ScheduleJ_DescCell" colspan="10" scope="row" style="width:99mm;font-size:10px;border-right-width:0px;">
                      Recharacterization of separate limitation income:</td>
                    </tr>
                    <!-- Part I, Line 9a for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RecharacterizationSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 9b for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 9c for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RecharacterizationSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 9d for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RecharacterizationSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                      <!-- Part I, Line 9e for repeating Column (v) repeating row for Blue or Separate format table-->
                    <xsl:for-each select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt">
                      <xsl:variable name="rowpos" select="position()"/>
                      <!--///////////////////////////////////////////////////////////////////////////////////
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                      <tr>
                        <xsl:choose>
                          <xsl:when test="position() mod 2 = 1">
                            <xsl:attribute name="class">styDepTblRow1</xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="class">styDepTblRow2</xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                        <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Other income*</td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:1px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtOtherIncome[$pos]/RecharacterizationSepLmtIncm/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:1px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RecharacterizationSepLmtIncm/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:1px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RecharacterizationSepLmtIncm/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:1px;border-right-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 
								select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RecharacterizationSepLmtIncm/OtherIncomeAmt[$rowpos]"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <!-- end repeating rows -->
                    <!-- Part I, Line 10 for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" valign="top">10</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Recapture of overall domestic losses</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <!--Pen and ink image -->
                        <span style="padding-right:2mm">
                        <xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (v) - Allocation of domestic losses Indicator
                          </xsl:with-param>
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                        </xsl:call-template>
                        </span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/RcptrOverallDomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <!--Pen and ink image -->
                        <span style="padding-right:2mm">
                        <xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (v) - Allocation of domestic losses Indicato
                          r</xsl:with-param>
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                        </xsl:call-template>
                        </span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/RcptrOverallDomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <!--Pen and ink image -->
                        <span style="padding-right:2mm">
                        <xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (v) - Allocation of domestic losses Indicator
                          </xsl:with-param>
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                        </xsl:call-template>
                        </span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/RcptrOverallDomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <!--Pen and ink image -->
                       <span style="padding-right:2mm">
                        <xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Form 1118 Schedule J, Schedule J Line 10 Other Income Column (v) - Allocation of domestic losses Indicator
                          </xsl:with-param>
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                        </xsl:call-template>
                        </span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RcptrOverallDomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part I, Line 11 for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" valign="top" scope="row">11</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;border-bottom-width:1px;" scope="row">
                        <span style="font-weight:bold;">Numerator of Limitation Fraction-</span>Combine lines 8 through 10.  
                        Enter each result here and on Schedule B, Part II, line 7, of corresponding Form 1118. </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/NumLimitationFractionAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/NumLimitationFractionAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/NumLimitationFractionAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/NumLimitationFractionAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part II title for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblHdr">
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
                      style="width:187mm;padding-top:0px;padding-bottom:0px;border-right-width:0px;
								border-top-width:1px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                        <div class="styTitleName" style="height:4.7mm;">Part II</div>
                        <span style="width:3mm;"/> 
                            Year-End Balances of Future Separate Limitation Income That Must Be Recharacterized<br/>
                        <span style="padding-left:4mm;font-weight:normal">(section 904(f)(5)(C))</span>
                      </td>
                    </tr>
                    <!-- Part II, Line a for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/EOYBalancesOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part II, Line b for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part II, Line c for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/EOYBalancesOfFutureSepLmtIncm/PassiveCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part II, Line d for repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos]/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part II, Line e for repeating Column (v) Repeating row for Blue or Separate format table-->
                    <xsl:for-each select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt">
                      <xsl:variable name="rowpos" select="position()"/>
                      <!--//////////////////////////////////////////////////////////////////////////////
                          Note:  there are no repeating rows in this section
                        ///////////////////////////////////////////////////////////////////////////////////-->
                      <tr>
                        <xsl:choose>
                          <xsl:when test="position() mod 2 = 1">
                            <xsl:attribute name="class">styDepTblRow1</xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="class">styDepTblRow2</xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                        <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Other income*</td>
                        <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;;background-color:lightgrey;">
                          <span class="styTableCellPad"/>
                          <span style="width:16px;"/>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;background-color:lightgrey;">
                          <span class="styTableCellPad"/>
                          <span style="width:16px;"/>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;background-color:lightgrey;">
                          <span class="styTableCellPad"/>
                          <span style="width:16px;"/>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-right-width:0px;background-color:lightgrey;">
                          <span class="styTableCellPad"/>
                          <span style="width:16px;"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                    </tbody>
                    </table>
                    </div>
                    <!-- end repeating rows -->
              <br/>
				<span class="styRepeatingDataTitle" style="width:187mm;">Form 1118 Schedule J, Parts III - IV Column (v) Other Income (Continue)</span>
					<div class="IRS1118ScheduleJ_TableContainer" style="width:187mm;border-top-width:0px;border-bottom-width:0px;page-break-after:always;
					display:block" id="adSeLmIn">
                <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
                    <!-- Part III title for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblHdr">
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
                      style="width:187mm;border-top-width:1px;border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                        <div class="styTitleName" style="height:4.7mm;">Part III</div>
                        <span style="width:3mm;"/> 
                          Overall Foreign Loss Account Balances (section 904(f)(1))
                        <span style="padding-left:3mm;">
                          <span style="font-style:italic;font-weight:normal;">Complete for <b>each </b>
                            separate limitation income category.</span>
                        </span>
                      </td>
                    </tr>
                    <tbody>
                    <!-- Part III, Line 1 for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Beginning balance</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part III, Line 2 for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year additions</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part III, Line 3 for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year reductions (other than recapture)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part III, Line 4 for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year recapture (from Part I, line 7)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!-- Part III, Line 5 for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">5</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span style="font-weight:bold;">Ending balance-</span>Combine lines 1 through 4.</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallForeignLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Title for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblHdr">
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
                      style="width:187mm;padding-top:0px;padding-bottom:0px;border-top-width:1px;
                                border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                        <div class="styTitleName" style="height:4.7mm;">Part IV</div>
                        <span style="width:3mm;"/> 
                           Overall Domestic Loss Account Balances (section 904(g)(1)) 
                      </td>
                    </tr>
                    <!--Part IV Line 1 for Repeating Column (v) -->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Beginning balance</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallDomLossAcctBalances/BeginningBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Line 2 for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year additions</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallDomLossAcctBalances/CurrentYearAdditionsAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Line 3 for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year reductions (other than recapture)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallDomLossAcctBalances/CurrentYearReductionsAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Line 4 for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span style="font-weight:bold;">Subtotal-</span>Combine lines 1 through 3.</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Line 5 for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">5</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year recapture (from Part I, line 10)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    <!--Part IV Line 6 for Repeating Column (v) for Blue or Separate format table-->
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">6</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">
                        <span style="font-weight:bold;">Ending balance-</span>Subtract line 5 from line 4</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;border-right-width:0px;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/OverallDomLossAcctBalances/EndingBalanceAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
        <!-- end display repeating column iii -->
   </body>
</html>
</xsl:template>
</xsl:stylesheet>