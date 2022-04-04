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
          <!--HINTS: Part I line 2e, Part I line 9e and Part II line e repeated by row... Part I - IV column (v) display in 
			repeated table four times -->
  <!--<xsl:if test="not($Print) or $Print=''">-->
      <xsl:call-template name="IRS1118ScheduleJStyle"/>
      <xsl:call-template name="AddOnStyle"/>
  <!--</xsl:if>-->
  </style>
<xsl:call-template name="GlobalStylesForm"/>
</head>
<!--<body class="styBodyClass" style="width:256mm">
        <xsl:call-template name="DocumentHeader"/>-->
<body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderLandscape"/>
<!-- BEGIN FORM HEADER -->
    <div class="styBB" style="width:256mm;">
	<div class="styFNBox" style="width:40mm;height:26mm;border-right-width:.5mm;">
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
              <xsl:with-param name="Desc">Form 1118 Schedule J, Top Left Form Title - US Loss Allocation Under Notice 89-3 Indicator
				  </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/@uSLossAllocUnderNotice89Cd"/>
            </xsl:call-template>
            <br/>
            <div style="font-size:6pt;padding-top:0mm;padding-bottom:7mm;height:4mm;">(Rev. December 2020)</div>
            <span class="styAgency" style="text-align:center;">Department of the Treasury</span>
            <br/>
            <span class="styAgency" style="text-align:center">Internal Revenue Service</span>
	</div>
  <!-- Form Title Box -->
    <div class="styFTBox" style="width:170mm;height:26mm;">
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
		 style="width:45mm;height:26mm;border-left-width:.5mm;padding-top:12mm;padding-bottom:1mm;border-bottom-width:0px;text-align:center;
		 float:left;"> OMB No. 1545-0123
		</div>
	</div>
<!-- Name and Address -->
<div class="styBB" style="width:256mm;">
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
<div class="styBB" style="width:256mm;border-top-width:0px; ">
  <div class="styTitleName" style="height:4.7mm;border-bottom-width:1px;">Part I</div>
	<div class="styTitleDesc" style="height:auto;font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;">
        <b>Adjustments to Separate Limitation Income or (Losses) in Determining Numerators of Limitation Fractions </b> 
            <span class="styNormalText">(see instructions)</span>
	</div>
</div>
<!-- If the Separate Print Solution is ON and there exists any data for the repeating element more than once, -->
        <!-- display an EMPTY table.  Check if the record count of Part I Line 2c or Count of Part I Line 9c or Count of Part II Line c is 
			greater than 1 -->
		<xsl:if test="($Print = $Separated) and                 
			( (count($FormData/AdjSepLmtGeneralCategoryIncm/AllocationCYSeparateLmtLosses/OtherIncomeAmt) &gt; 1) or
				(count($FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt) &gt; 1) or
				(count($FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/OtherIncomeAmt) &gt; 1) or
				(count($FormData/AdjSepLmtOtherIncome) &gt; 1) )">
          <!-- Part I empty table for separated foramt-->
          <div class="IRS1118ScheduleJ_TableContainer" style="width:256mm;border-top-width:0px;border-bottom-width:0px;page-break-after:always;display:block" 
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
                    <br/>Other income*(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>)
                     <!--<xsl:number value="position()" format="1"/>-->
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
                    <!--See Additional Data table message -->
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
					  <xsl:with-param name="TargetNode" 
					  select="$FormData/AdjSepLmtSection951AIncome/TotIncmOrLossBfrAdjustmentsAmt"/>
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
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" 
					  scope="row">Other income*(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>)</td>
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

                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>

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

                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" 
					  scope="row">Other income*(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>)</td>

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

                <tr>


                    <span style="font-weight:bold;">Numerator of Limitation Fraction-</span>Combine lines 8 through 10. 


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


                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>


				<div style="width:256mm">
				    <div style="float: left; clear: none;">


						</span>
				    </div>
				</div>
				<div class="styFixedUnderline" style="border-bottom-width:2px;width:256mm;"/>
				<!-- Page Break and Footer-->
				
					<div style="width:256mm;clear:both;padding-top:0.4mm;" class="pageend">

						 see the Instructions for Form 1118.</div>

						<div style="float:right;" class="styGenericDiv"><b>Schedule J (Form 1118) (Rev. 12-2020)</b></div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					
					
					<div style="width:256mm;padding-top:1mm;float:left">
					   Schedule J (Form 1118) (Rev. 12-2020)
						<span style="width:15mm;float:right;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>

					
				<!-- END Page Header -->



                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" 

                   font-weight:bold;font-size:8pt;width:256mm;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part II</div>
                    <span style="width:3mm;padding-top:1mm;"/> 
                      Year-End Balances of Future Separate Limitation Income That Must Be Recharacterized<br/>

                  </td>
                </tr>

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
                    <br/>Other income*(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>)
				  </th>
					<th class="IRS1118ScheduleJ_GenericCell" style="height:10mm;border-right-width:0px;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
					   <span class="styBoldText">(vi)</span>
					   <br/>U.S. income
					</th>
				</tr>


                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>

                    <!--See Additional Data tabel message -->
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
					  <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome"/>
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

                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>

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

                <tr>


					  scope="row">Other income*(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>

                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-bottom-width:0px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
tyle="border-right-width:1px;font-size:10px;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
				  </td>
     <<< merge needed >>>
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
             <!--Part I, Line 9d empty table for separated <<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" 


                    </div>
                    <span style="width:3mm;"/> 
                        Overall Foreign Loss Account Balances (section 904(f)(1))  
                      <span style="padding-left:3mm;">

 </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="backgro<<< merge needed >>>
                  </td>
                </tr>

                <tr>
/spa<<< merge needed >>>

                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <!--See Additional Data tabel message -->
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
					  <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome"/>
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
px;"/>
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
                  </td>
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
"styGenericDiv"><b>Schedule <<< merge needed >>>
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
g-top:1mm;float:left">
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" style="width:256mm;padding-top:0px;padding-bottom:0px;border-top-width:2px;
                   border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part IV</div>
                    <span style="width:3mm;"/> 
                      Overall Domestic Loss Account Balances (section 904(g)(1))
                  </td>
                </tr>
					   Schedule J (Form 1118) (Rev. 12-2020)
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Beginning balance</td>
						<span styl<<< merge needed >>>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    <!--See Additional Data tabel message -->
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
					  <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtSection951AIncome"/>
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
ells<<< merge needed >>>
                <tr>

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

                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
e:7pt;font-weight:normal;text-al<<< merge needed >>>
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
t">(<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">6</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">

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

				<div style="width:256mm">
				    <div style="float: left; clear: none;">
th>
							in instructions.
						</span>
				    </div>
                  <th class<<< merge needed >>>
mpty<<< merge needed >>>
				</div>
				<div class="styFixedUnderline" style="border-bottom-width:2px;width:256mm;"/>
                    <span style="width:4px;"/>
					<div class="pageEnd"/>
          </div>
        </xsl:if>
        <!-- If the Separate Print Option is OFF OR if the Separate Print Option is ON and there is 0 or 1 data -->
                  </td>
                  <td class="IRS1118ScheduleJ_<<< merge needed >>>

duleJ_GenericCell" style="bo<<< merge needed >>>
  <<< merge needed >>>

 <<< merge needed >>>

scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font<<< merge needed >>>

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

                    <span class="styBoldText">(v)</span>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]"/>
                    </xsl:call-template>
>
								(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
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
                    <span cla<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Income or (loss) before adjustments</td>

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
lass<<< merge needed >>>
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

                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
               <div class="styTitleName" style="height:4.7mm;">Part<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
</td>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                  <td class="IRS1118ScheduleJ_GenericCell<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
="IRS1118ScheduleJ_GenericCe<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
rt III, line 2 empty line in separated format -->
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                <tr>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                  <td class="IRS11<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px"/>
                </tr>
         <<< merge <<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Passive category income</td>
J_Ge<<< merge needed >>>
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
 <span class="styTableCellPad"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                    <span style="width:1<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
        <span style="width:16px;"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                  </td>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>

                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
J_GenericCell" s<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
th:16px;"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                  </td>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:9.5px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
           <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px"/>
                </tr>
tMessage" select=" 'true' <<< merge needed >>>
                <!--Need to show the row e even when there is no data -->
                <xsl:if test="not($FormData/AllocationSepLmtLossOthIncmGrp)">
                  <tr>
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;">
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
tions</td>
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                  <td<<< merge needed >>>
                      <span class="styTableCellPad"/>(<span style="width:16px;"/>)
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;">
                      <span class="styTableCellPad"/>
                    </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                  </tr>
                </xsl:if>
Ce<<< merge needed >>>
                <!-- Tracks the number of rows repeating for e to determine the color that row 3 would start. -->
                <xsl:variable name="twoICounter" select="count($FormData/AllocationSepLmtLossOthIncmGrp)"/>
                <xsl:for-each select="$FormData/AllocationSepLmtLossOthIncmGrp">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                    Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                    find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                  ///////////////////////////////////////////////////////////////////////////////////-->
                  <tr>
                    <!-- If the position of the repeating e row is odd, then the current row is set to styDepTblRow1. -->
                    <!-- Otherwise, the current row is set to styDepTblRow2.                                          -->

                    <td class="styTableCell" style="text-align:left;padding-left:1mm">
"/>
								(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
					</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
                  </td>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
              <<< merge needed >>>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
e 4.
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
                    </td>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; border-right-width:1px;border-width:2px;" valign="bottom">
						<!--<xsl:for-each select="OtherIncomeAmt">
							<xsl:variable name="pos1" select="position()"/>-->
							<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="OtherIncomeAmt"/>
							</xsl:call-template>
							<!--<br/>
						</xsl:for-each>-->
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px"/>
                  </tr>
                </xsl:for-each>
     <<< merge needed >>>

                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Subtotal-</span> Combine lines 1 through 2e.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
 <span class="styTableCellPa<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
ze:10px;">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
               <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;border-top-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
ass="styTableCellPad"/>
                    </xsl:call-template>
                  </td>
                </tr>
                    <s<<< merge neede<<< merge needed >>>
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

                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/OverallForeignLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
1px;font-size:10px;">
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
    <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                    <span s<<< merge needed >>>
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
s<<< merge needed >>>
                <!-- Tracks the number of rows repeating for e to determine the color that the row 8 would start. -->

                <xsl:for-each select="$FormData/AdjSepLmtGeneralCategoryIncm/RecharacterizationSepLmtIncm/OtherIncomeAmt">
                  <xsl:variable name="pos" select="position()"/>
span class="styTableCellPad"/>
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                    <span style="width:16px;"/>
    <<< merge needed >>>
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
ncome
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
	          </th>
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
     <<< merge needed >>>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
therIncome/OtherIncomeDesc"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
	<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
t<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-bottom-width:1px;border-right-width:0px;background-color:lightgrey;"/>
                </tr>
tegoryIncm<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
;" vali<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
</td>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_G<<< merge needed >>>
                </tr>
               <span class="styTabl<<<<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
ound-color:lightgrey<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
idth:2px;font-size:10px;" valign="bottom">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-bottom-width:1px;border-right-width:0px;background-color:lightgrey;"/>
                </tr>
       <<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
me="TargetNode" 
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/A<<< merge needed >>>
                    </xsl:call-template>
                  </td>
tiv<<< merge needed >>>
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
:call-template>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                  </td>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px"/>
                </tr>
 <<< merge needed >>>
                <xsl:if test="not($FormData/RchrctrztnSepLmtOtherIncmGrp)">
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
<<< merge needed >>>
                  </tr>
                </xsl:if>

                <xsl:for-each select="$FormData/RchrctrztnSepLmtOtherIncmGrp">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                          Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                          find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                  <tr>
                    <!-- If the position of the repeating e row is odd, then the current row is set to styDepTblRow1. -->
                    <!-- Otherwise, the current row is set to styDepTblRow2.                                          -->
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="styTableCell" style="text-align:left;padding-left:1mm">
tegoryIncm/AllocationCYSepar<<< merge needed >>>
						<span class="styUnderlineText" 
						style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
						style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
						style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
						style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
							</xsl:call-template>)
						</span>
					</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; " valign="bottom">
                      <xsl:call-template name="PopulateAmount">
>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                    <xsl:call-template name="PopulateNegativeNumber">
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; " valign="bottom">
                      <xsl:call-template name="PopulateAmount">
        <<< merge needed >>>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">

                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; border-right-width:1px;border-width:2px;" valign="bottom">
						<!--<xsl:for-each select="OtherIncomeAmt">
							<xsl:variable name="pos1" select="position()"/>-->
							<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="OtherIncomeAmt"/>
							</xsl:call-template>
							<!--<br/>
						</xsl:for-each>-->

                    <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;border-right-width:0px"/>
                  </tr>
                </xsl:for-each>
ow">c</td>
         <<< merge needed >>>
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
    <<< merge needed >>>
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
"/>
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
 <<< merge needed >>>
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
eneral category income </td>
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
                  <td cla<<< me<<< merge needed >>>
                <tr>
reignBranchIncome/AllocationCYSep<<< merge needed >>>
 </td>
                    <span style="font-weight:bold;">Numerator of Limitation Fraction-</span>Combine lines 8 through 10. 
                  <t<<< merge needed >>>
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
18ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/NumLimitationFractionAmt"/>
                    </xsl:call-template>
                  </td>
        <<< merge needed >>>
                </tr>
                <tr>
      <<< merge needed >>>
<<< merge needed >>>
				<div style="width:256mm">
				    <div style="float: left; clear: none;">

							in instructions.
						</span>
				    </div>
				</div>
				<div class="styFixedUnderline" style="border-bottom-width:2px;width:256mm;"/>
:call-template><<< merge needed >>>
				<!-- Page Break and Footer-->
				
					<div style="width:256mm;clear:both;padding-top:0.4mm;" class="pageend">

						 see the Instructions for Form 1118.</div>
>
						<div style="float:right;" class="styGenericDiv"><b>Schedule J (Form 1118) (Rev. 12-2020)</b></div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					
					
					<div style="width:256mm;padding-top:1mm;float:left">
					   Schedule J (Form 1118) (Rev. 12-2020)
						<span style="width:15mm;float:right;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
					</div>
				<!-- END Page Header -->
                <tr>
   <<< merge needed >>>
lect="$FormData/AdjSepLmtGen<<< merge needed ><<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" 
						  style="padding-top:0px;padding-bottom:0px;border-right-width:0px;border-top-width:2px;
                   font-weight:bold;font-size:8pt;width:256mm;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part II</div>
                    <span style="width:3mm;padding-top:1mm;"/> 
                      Year-End Balances of Future Separate Limitation Income That Must Be Recharacterized<br/>
emplate name="PopulateAmount"><<< merge needed >>>
                  </td>
                </tr>
>
                  <td c<<< merge needed >>>

getNode" select="$For<<< merge needed >>>
Data/AdjSepLmtUSIncome/OverallForeignLossesAmt"/>
					  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    </x<<< merge needed <<< merge needed >>>
              <xs<<< merge needed >>>
					  </th>
					  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">

bottom">
					  </th>
					  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <xsl:call-template name="Popul<<< merge needed >>>
heduleJ_GenericCell" style="font-size:9.5px;" valign="bottom">
					  </th>
					  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <xsl<<< me<<< merge needed >>>
              <!--Part I, line 6 for inline format  -->
					  </th>
					  <th class="IRS1118ScheduleJ_GenericCell" 
            <<< merge needed >>>
 style="font-s<<< merge needed >>>


AndAllocnCYAmt"/>
						</xsl:call-template>
         <<< merge needed >>>
								(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
					  </th>
					  <th class="IRS1118ScheduleJ_GenericCell" 
elec<<< merge needed >>>






						</xsl:call-template>
					  </th>

foreign losses</td>
                  <t<<< merge needed >>>
ect="$FormData/AdjSepLmtSecti<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
<td class="IRS1118Schedu<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
  </tr>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
<<< merge n<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
//////
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                        Note<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
adding-left:2m<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
IRS1118S<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
ass="styTableCellPad"/>
                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
              <<< merge needed >>>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
x;"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                  </td>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                  <td clas<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
              <span s<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>

                <tr>
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">General category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
$FormData<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
eAmt"/><<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
<<< merge needed >>><<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>

                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
cheduleJ_Gene<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
c<<< merge needed >>>
                <!-- blank lines, row e,  if no data -->
                <xsl:if test="not($FormData/EOYBalanceSepLmtOtherIncmGrp)">
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
ttom">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                    <xsl:call-template name="PopulateAmount">
                    </xsl:call-template>
                  </td>
                      <xsl:with-param na<<< merge needed >>>
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
  <t<<< merge needed >>>
                  </tr>
                </xsl:if>
align="bottom">
                <xsl:for-each select="$FormData/EOYBalanceSepLmtOtherIncmGrp">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                  <tr>
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    <td class="styTableCell" style="text-align:left;padding-left:1mm">
  <<< merge needed >>>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
					</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 

                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
eCategoryIncm/RecharacterizationSepLmtIncm/ForeignBranchIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
                        select="PassiveCategoryIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
                    </xsl:c<<< merge needed >>>
                      </xsl:call-template>
                    </td>
        <xsl:call-template name="PopulateA<<< merge needed >>>
						<!--<xsl:for-each select="OtherIncomeAmt">
							<xsl:variable name="pos1" select="position()"/>-->
							<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="OtherIncomeAmt"/>
							</xsl:call-template>
							<!--<br/>
						</xsl:for-each>-->
                    </td>
aracterizationSepL<<< merge needed >>>
                  </tr>
                </xsl:for-each>
    <xsl:call-template name="PopulateAmount">
                      <<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" style="width:256mm;padding-top:0px;padding-bottom:0px;border-top-width:2px;
                   border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
      </td>
                    <span style="width:3mm;"/> 
                        Overall Foreign Loss Account Balances (section 904(f)(1))  
                    <span style="font-style:italic;font-weight:normal;">
                      <span style="padding-left:3mm;">
                        Complete for <span style="font-weight:bold;">each </span>
                        separate limitation income category.</span>
                    </span>
                  </td>
                </tr>
                  <td class="IRS1118ScheduleJ<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Beginning balance</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
 for inline format  -->
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                <t<<< merge needed ><<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
       <td class="IRS1118ScheduleJ_DescCell" s<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
yIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                    </xsl:call<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year additions</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
ode" select="$FormDat<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
In<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
 <<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year reductions (other than recapture)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
"font-size:10px;" valign="bottom">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                    <xsl:call-template name="PopulateAmount">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      <xsl:with-pa<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
epLmtSection951AIncome/RecharacterizationSepLmtIncm/GeneralCat<<< merge need<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year recapture (from Part I, line 7)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
Cell" style="font-size:10px;border-right-width:1px;" valig<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
IRS1118S<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
cheduleJ_GenericCell">
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="border-bottom-width:0px;padding-left:2mm;" valign="top">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;border-bottom-width:0px;" scope="row">
                    <span style="font-weight:bold;">Ending balance-</span>Combine lines 1 through 4.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                     <<< merge needed >>>
                    </xsl:call-template>
                  </td>

Cell" style="border-widt<<< merge needed >>>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
bottom-width:1px;"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
hen the current row is set <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>

                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
lat<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" style="width:256mm;padding-top:0px;padding-bottom:0px;border-top-width:2px;
                   border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part IV</div>
                    <span style="width:3mm;"/> 
                      Overall Domestic Loss Account Balances (section 904(g)(1))
                  </td>
                </tr>

                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Beginning balance</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
ame="TargetNode" select="Section951AIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
    <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                    <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
me="TargetNode" select="PassiveCategoryIn<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
tic losses<<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year additions</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
< difference resolved - line(s) deleted ><<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"
    </xsl:call-template>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
              <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
/xsl<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>

                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year reductions (other than recapture)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
Data/AdjSepLmtOtherIncome[1]<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
PopulateNegativeNumber">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      <xsl:with<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>

                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Subtotal-</span>Combine lines 1 through 3.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
IndexCell" scope="row" <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                    </xsl:call-template>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
 <<< mer<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year recapture (from Part I, line 10)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
             <td class="IRS1118Schedu<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
th-param name="TargetNod<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
tructions.
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
	<<< merge needed >>>
                <tr>
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">6</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Ending balance-</span>Subtract line 5
                      from line 4.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
/b></div>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
					</div>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
					<br/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
					<div class=<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
              </tbody>
            </table>

				<div style="width:256mm">
idth:3mm;padding-top:1mm;"/> 
           <<< merge needed >>>
							in instructions.
						</span>
					</div>
styBoldText">(ii)</span>
						<br/>Foreign branch income
				</div>
				<div class="styFixedUnderline" style="border-bottom-width:2px;width:256mm;"/>
					  </th>
					  <th clas<<< merge needed >>>
          </div>
        </xsl:if>

e[1]"/>	
						</xsl:call-template<<< merge needed >>>

templ<<< merge needed >>>

            <xsl:if test="$pos mod 4 = 2">

              Repeat the Whole Table Here - Column v displayed as many times as required at four per page
          ///////////////////////////////////////////////////////////////////////////////////////// -->
              <br/>
              <span class="styRepeatingDataTitle" style="width:256mm;">Form 1118 Schedule J, Parts I - II Column (v) Other Income (Continue)</span>
:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome"/>
						  <xsl:wit<<< merge needed >>>


                     <<<< me<<< merge needed >>>


              </div>
ulateAmount">
              <div class="IRS1118ScheduleJ_TableContainer" style="width:256mm;border-top-width:0px;border-bottom-width:0px;page-break-after:always;display:block" 
              id="adSeLmIn">
                <table cellspacing="0" style="font-size:7pt;">
                     <<< merge needed >>>
                    <tr>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col">
                      <span style="width:1px;" /></th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;
sOfFutureSepLmtIncm/Section951AIncomeAmt"/>
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position()" format="2"/>
							<br/>(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;
       <<< merge needed ><<< merge needed >>>
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +1" format="2"/>
							<br/>(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +2" format="2"/>
							<br/>(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;
                      <xsl:wi<<< merge needed >>>
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +3" format="2"/>
							<br/>(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
                      </th>
                    </tr>
                  </thead>
                  <tfoot/>
                  <tbody>
              </xsl:call-te<<< merge needed >>>
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

                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="width:99mm;font-size:10px;border-right-width:0px;" colspan="5" scope="row">
                      Allocation of separate limitation losses:</td>
                    </tr>

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
leJ_G<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
d class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="botto<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                    </tr>
cheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
                </tr<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
on951AIncome/EOYBalancesOfFutureSepLmtIncm/GeneralCategoryIncomeAmt<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
               <xsl:with-par<<< merge <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
ine format  repeating rows -->
                        </xsl:call-template>
                      </td>
                    </tr>
                <!-- blank lines, row e,  if no data -->
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
                <xsl:if t<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
Pad"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
                      <span style="width:16px;"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    </td>
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
ncesOfFutureSepLmtIncm/OtherInco<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
 <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
/////////////////////////////-->
                        </xsl:call-template>
                      </td>
                    </tr>
   <<< merge needed >>>
						Please note that the programming for INLINE is the next set of instructions.-->
                    <xsl:for-each select="$FormData/AllocationSepLmtLossOthIncmGrp">
                      <xsl:variable name="rowpos" select="position()"/>
						<tr>
						  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
						  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other Income*
							<br/>
							(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
								</xsl:call-template>)
							</span>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode" 
									  select="OtherIncomeAmt[$pos]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 1]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 2]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 3]"/>
							</xsl:call-template>
						  </td>
						</tr>
					</xsl:for-each>
xsl:call-<<< merge needed >>>

                      <xsl:variable name="rowpos" select="position()"/>
                      <!--///////////////////////////////////////////////////////////////////////////////////
                          Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                          find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                          ///////////////////////////////////////////////////////////////////////////////////-->
                      <tr>
                        <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
									<<< merge needed >>>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
         <xsl:call-template name="PopulateAmount">
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
        <<< merge needed >>>
                          </xsl:call-template>
                        </td>

                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" 
           <xsl:call-template name="PopulateAmount"><<< merge nee<<< merge ne<<< merge needed >>>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <!-- end repeating rows -->
6mm;padding-top:0px;padding-bottom:0px;border-top-wid<<< merge needed >>>
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
      <div class="styTitleName" style="height<<< merge needed >>>
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
d >>>
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
c;font-weight:normal;">
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
         <<< merge needed >>>
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
         Comple<<< merge needed >>>
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">9</td>
                      <td class="IRS1118ScheduleJ_DescCell" colspan="10" scope="row" style="width:99mm;font-size:10px;border-right-width:0px;">
                      Recharacterization of separate limitation income:</td>
                    </tr>

                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
" style="font-size:10px" valign="bottom">
                        </xsl:call-template>
                      </td>
                    </tr>
                    <xsl:call-template name="PopulateAmou<<< merge needed >>>
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
name="<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
  </xsl:call-template>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                  </td>
                        </xsl:call-template>
                      </td>
                    </tr>
                  <td class="IRS1118Schedul<<< merge needed >>>
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
otto<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
s="IRS1118ScheduleJ_Ge<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                    </tr>
l:call-template name="Popu<<< merge needed >>>
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
GenericCell" style="border-rig<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
    <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                    </tr>
                border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
						Please note that the programming for INLINE is the next set of instructions.-->
                    <xsl:for-each select="$FormData/RchrctrztnSepLmtOtherIncmGrp">
                      <xsl:variable name="rowpos2" select="position()"/>
						<tr>
						  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
						  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other Income*
							<br/>
							(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
								</xsl:call-template>)
							</span>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode" 
									  select="OtherIncomeAmt[$pos]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 1]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 2]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 3]"/>
							</xsl:call-template>
						  </td>
						</tr>
					</xsl:for-each>
        <<< merge needed >>>
                      <xsl:variable name="rowpos" select="position()"/>
                      <!--///////////////////////////////////////////////////////////////////////////////////
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->

                      <tr>
                        <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                        <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Other income*</td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 
ericCell" style="font<<< merge needed >>>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 

                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 

                          </xsl:call-template>
                        </td>
                        <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                          <xsl:call-template name="PopulateNegativeNumber">
                            <xsl:with-param name="TargetNode" 
ze:10px" valign="bottom">
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <!-- end repeating rows -->
                    <xsl:call-template name="Po<<< merge needed >>>
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
ncome/OverallDomLossAcctBalanc<<< merge needed >>>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RcptrOverallDomesticLossesAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
gn="bottom">
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" valign="top" scope="row">11</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;border-bottom-width:1px;" scope="row">
                        <span style="font-weight:bold;">Numerator of Limitation Fraction-</span>Combine lines 8 through 10.  
                    <xsl:call-template <<< merge needed >>>
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
s="IRS1118ScheduleJ_Gene<<< merge needed >>>
                    <tr>
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
>
 <<< merge needed >>>
                        <div class="styTitleName" style="height:4.7mm;">Part II</div>
                        <span style="width:3mm;"/> 
                            Year-End Balances of Future Separate Limitation Income That Must Be Recharacterized<br/>

                      </td>
                    </tr>
    <xsl:with-param na<<< merge needed >>>
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

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
/tr>
                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
    <<< merge needed >>>
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

                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
       <x<<< merge needed >>>
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

                    <tr>
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
           select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallDomLossAcctBalances/CurrentYearRec<<< merge needed >>>
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

						Please note that the programming for INLINE is the next set of instructions.-->
                    <xsl:for-each select="$FormData/EOYBalanceSepLmtOtherIncmGrp">
                      <xsl:variable name="rowpos2" select="position()"/>
						<tr>
						  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
						  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other Income*
							<br/>
							(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
								</xsl:call-template>)
							</span>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode" 
									  select="OtherIncomeAmt[$pos]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 1]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 2]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 3]"/>
							</xsl:call-template>
						  </td>
						</tr>
					</xsl:for-each>

            </td>
                      <xsl:variable name="rowpos" select="position()"/>
                  <td class="IRS1118ScheduleJ_Gener!-- If the Separate Print Option is OFF, repeat table for the repeating column v. -->
  <!-- the repeating columns of column v is displayed below -->
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
  <!-- first column v -->
  <xsl:if test="($Print != $Separated) and count($FormData/AdjSepLmtOtherIncome) &gt; 1">
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
    <xsl:for-each select="$FormData/AdjSepLmtOtherIncome">
              <div class="IRS1118ScheduleJ_TableContainer" style="width:256mm;border-top-width:0px;border-bottom-width:0px;page-break-after:always;display:block" 
              id="adSeLmIn">
                <table cellspacing="0" style="font-size:7pt;">
      <xsl:variable name="pos" select="position()"/>
                    <tr>
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
                      style="width:256mm;border-top-width:1px;border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
            <xsl:if test="$pos mod 4 = 2">
        <!-- //////////////////////////////////////////////////////////////////////////////////////////
                        <span style="width:3mm;"/> 
              Repeat the Whole Table Here - Column v displayed as many times as required at four per page
                        <span style="padding-left:3mm;">
                          <span style="font-style:italic;font-weight:normal;">Complete for <b>each </b>
                            separate limitation income category.</span>
                        </span>
                      </td>
                    </tr>
              <tbody>
          ///////////////////////////////////////////////////////////////////////////////////////// -->
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Beginning balance</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
              <br/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
              <span class="styRepeatingDataTitle" style="width:256mm;">Form 1118 Schedule J, Parts I - II Column (v) Other Income (Continue)</span>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
              <!-- Part I Title for repeating Column (v) for inline format -->
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
              <div class="styBB" style="width:256mm;border-top-width:1px;">
                        </xsl:call-template>
                      </td>
                    </tr>
                   <div class="styTitleName" style="height:4.7mm;border-bottom-width:1px;">Part I</div>
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year additions</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                   <div class="styTitleDesc" style="height:auto;font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;">
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                       <b>Adjustments to Separate Limitation Income or (Losses) in Determining Numerators of Limitation Fractions </b>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                  <span class="styNormalText">(see instructions.)</span>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                  </div>
                        </xsl:call-template>
                      </td>
                    </tr>
              </div>
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year reductions (other than recapture)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
              <!-- Part I Table for repeating Column (v) for inline format-->
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
              <div class="IRS1118ScheduleJ_TableContainer" style="width:256mm;border-top-width:0px;border-bottom-width:0px;page-break-after:always;display:block" 
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
              id="adSeLmIn">
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
                <table cellspacing="0" style="font-size:7pt;">
                        </xsl:call-template>
                      </td>
                    </tr>
                  <thead style="display:table-row-group;font-weight:normal;text-align:center;">
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year recapture (from Part I, line 7)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
                    <tr>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col">
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
                      <span style="width:1px;" /></th>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;
                        </xsl:call-template>
                      </td>
                    </tr>
						  text-align:center;" scope="col">
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
                        <spa<<< merge needed >>>
                    <tr>
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
                      style="width:256mm;border-top-width:1px;border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
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
<<< merge needed >>>
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
"PopulateTlineText" 
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
								style="padding-left:2mm; text-align:left;">
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
									<xsl:call-template name="PopulateText">
                        </xsl:call-template>
                      </td>
                    </tr>
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/OtherIncomeDesc"/>
                    <tr>
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year reductions (other than recapture)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
									</xsl:call-template>)
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								</span>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
                      </th>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;
                        </xsl:call-template>
                      </td>
                    </tr>
                      text-align:center;border-right-width:0px;" scope="col">
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
                        <span class="styBoldText">(v)</span>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                        <br/>Other income* <xsl:number value="position() +3" format="2<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                    </tr>
Populate<<< merge needed >>>
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
"><<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"

                        </xsl:call-template>
                      </td>
                    </tr>
left:2mm;">1</td>
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
                      <td class="IRS111<<< m<<< merge needed >>>
:call-template>
                      </td>
<<< merge needed >>>
ont-size:10px;border-right-width:0px;" valig<<< merge needed >>>
							</span>

                <xsl:call-template name="PopulateNegativeNumber">
                <<< merge needed >>>
					</div>
				<div class="styFixedUnderline" style="border-bottom-width:2px;width:256mm;"/>
    </td>
                      <td class="IRS1118ScheduleJ_GenericCel<<< merge needed >>>
              </div>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
        <!-- end display repeating column iii -->

 class="IRS1118Schedu<<< merge needed >>>

                    </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                      parateLmtLosses/GeneralCategoryIncomeAmt"/>
                        </xsl:call-template>
          </div>
                      </td>
                    </tr>
                    <!-- Part I, Line 2e for repeating Column (v) for regular format.
						Please note that the programming for INLINE is the next set of instructions.-->
                    <xsl:for-each select="$FormData/AllocationSepLmtLossOthIncmGrp">
                      <xsl:variable name="rowpos" select="position()"/>
						<tr>

l-template name="PopulateText">
		<<< merge needed >>>

    </div>



  </div>
l:with-param <<< merge needed >>>
<xsl:with-param name="TargetNode"
	<<< merge needed >>>
                   <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-widt<<< merge needed >>>
        <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
    <xsl:call-template name="PopulateLeftoverRow">

        </xsl:with-param>

        <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
    <xsl:call-template name="PopulateLeftoverRow">

        </xsl:with-param>

        <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
    <xsl:call-template name="PopulateLeftoverRow">


        <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>
    <xsl:call-template name="PopulateLeftoverRow">



    </xsl:call-template>



        <!-- If the Separate Print Option is OFF OR if the Separate Print Option is ON and there is 0 or 1 data -->










    </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style=<<< merge needed >>>
              <thead style="display:table-row-group;font-weight:normal;text-align:center;">
                <tr class="styDepTblHdr">
          </xsl:call-template>
        <<< merge needed >>>
S1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bott<<< merge needed >>>
ne 6 for repeating Column (v) for inline format-->
					  style="padding-top:0px;padding-bottom:0px;border-right-width:0px;border-top-width:2px;
                    <tr>
    <<< merge needed >>>
                        <span style="width:3mm;"/> 
epLmtOther<<< merge needed >>>
eduleJ_DescCell" scope="row" style="font-size:10px;">
                    </span>
                    <<< merge needed >>>
                  </th>
                </tr>
                <tr class="styDepTblHdr">
  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
					  scope="col">
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style<<< merge needed >>>
                  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" 
					  scope="col">

                    <br/>Section 951A income
				  </th>
             <td clas<<< merge needed >>>

                    <span class="styBoldText">(ii)</span>
                    <br/>Foreign branch income
				  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" 
					  scope="col">
    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <br/>Passive category income
				  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" 
					  scope="col">
                        <xsl:c<<< merge needed >>>
                    <br/>General category income
				  </th>
                  <th class="IRS1118ScheduleJ_GenericCell" 
					  style="width:32mm;height:10mm;border-right-width:1px;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                    <span class="styBoldText">(v)</span>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]"/>
                    </xsl:call-template>

								(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
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
+ 3]/R<<< merge needed >>>
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

                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
			<xsl:call-template name="PopulateTex<<< merge needed >>>

                </tr>
ll-template name="Popul<<< merge needed >>>
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
t:2mm; text-align:left;">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
								<xsl:call-template name="PopulateText">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
									<ss="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-top-width:1px;background-color:lightgrey;"/>
                </tr>
							<xsl:call-template name="PopulateNegativeNumber">
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  <xsl:with-param name="TargetNode"
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
									  select="OtherIncomeAmt[$pos + 2]"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							</xsl:call-template>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  </td>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
							<xsl:call-template name="PopulateNegativeNumber">
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  <xsl:with-param name="TargetNode"
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
									  select="OtherIncomeAmt[$pos + 3]"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
							</xsl:call-template>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						  </td>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
						</tr>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
					</xsl:for-each>
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                    <xsl:for-each select="$FormData/AdjSepLmtSection951AIncome/RecharacterizationSepLmtIncm/OtherIncomeAmt">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      <xsl:variable name="rowpos" select="position()"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                      <!--///////////////////////////////////////////////////////////////////////////////////
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
                        ///////////////////////////////////////////////////////////////////////////////////-->
                <!--Need to show the row e even when there is no data -->
                <xsl:if test="not($FormData/AllocationSepLmtLossOthIncmGrp)">
                  <tr class="styDepTblRow1">
                    <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                      <!-- Part I, Line 9e for repeating Column (v) repeating row for inline format-->
								(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
					</td>
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
                      <tr>
                        <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">e</td>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Tracks the number of rows repeating for e to determine the color that row 3 would start. -->
                <xsl:variable name="twoICounter" select="count($FormData/AllocationSepLmtLossOthIncmGrp)"/>
                <xsl:for-each select="$FormData/AllocationSepLmtLossOthIncmGrp">
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
                        <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;"><<< merge needed >>>
								(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
					</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
							select="Section951AIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
							select="ForeignBranchIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; border-right-width:1px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
                        select="PassiveCategoryIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
							select="GeneralCategoryIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; border-right-width:1px;border-width:2px;" valign="bottom">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="OtherIncomeAmt"/>
						</xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                  </tr>
                </xsl:for-each>

                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Subtotal-</span> Combine lines 1 through 2e.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;border-top-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
LinkToLeftoverDataTableInline">
                    </xsl:call-template>
                  </td>
                </tr>
                       <<< merge needed >>>
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

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/DomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
:2mm">
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
                        <xsl:call-template name="LinkToLeftoverDataTableInline">
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
                          <xsl:with-param name="Desc">Fo<<< merge needed >>>
                <!-- Tracks the number of rows repeating for e to determine the color that the row 8 would start. -->

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

                <tr class="styDepTblRow1">


                        <!--Pen and ink image -->
                </tr>
<<< merge needed >>>
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
 <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
e" 
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                          select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
  <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-top-width:1px;background-color:lightgrey;"/>
                </tr>
f Limitation Fraction-</span>Combine lines <<< merge needed >>>
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
     <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
               <td class="IRS1118Sc<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
Part II, Line a for r<<< merge needed >>>
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                        </xs<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-width:2px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode"
              <td class="IRS1118ScheduleJ_DescCell" scope="row" style="f<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
ont-size:10px;" valign="botto<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>
select="$Fo<<< merge needed <<< merge needed >>>
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
rgetNode" 
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
								  select="$FormData/AdjSepLmtOtherIncome[$pos]/EOYBalancesOfFutureSepLmtIncm/GeneralCat<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-width:2px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
           <td class="IRS1118ScheduleJ_Ge<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                </tr>

                <xsl:if test="not($FormData/RchrctrztnSepLmtOtherIncmGrp)">
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
l" style="font-size:10px;" scope="row">Other Income*
                    </td>
                  </tr>
                </xsl:if>
							<br/>
                <xsl:for-each select="$FormData/RchrctrztnSepLmtOtherIncmGrp">
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
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*<br/>
						(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
						<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
							</xsl:call-template>)
						</span>
					</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
							select="Section951AIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
							select="ForeignBranchIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; border-right-width:1px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
                        select="PassiveCategoryIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateNegativeNumber">
                        <xsl:with-param name="TargetNode" 
							select="GeneralCategoryIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px; border-right-width:1px;border-width:2px;" valign="bottom">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="OtherIncomeAmt"/>
							</xsl:call-template>
					</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                  </tr>
                </xsl:for-each>
							(identify <img src="{$ImagePat<<< merge needed >>>
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" valign="top">10</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Recapture of overall domestic losses</td>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
                    <!--Pen and ink image -->
                    <span style="padding-right:2mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">

						  Indicator
                      </xsl:with-param>
                      <xsl:with-param name="TargetNode" 
td>
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
	<<< merge needed >>>
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
1118ScheduleJ_SubIndexCell" scope="row">e</td<<< merge needed >>>
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
td>
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
   <<< merge needed >>>
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/RcptrOverallDomesticLossesAmt/@allocationDomesticLossesCd"/>
                    </xsl:call-template>
                    </span>
                    <br/>
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtUSIncome/RcptrOverallDomesticLossesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
ass="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:1<<< merge needed >>>
                <tr class="styDepTblRow1">
eCellPad"/>
                          <span style="width:16px;"/>
      <<< merge needed >>>
/>
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
                      <<< merge needed >>>
                </tr>

"font-size:10px;border-bottom-width:1px;border-<<< merge needed >>>
                <tr class="styDepTblHdr">
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" 
					  style="padding-top:0px;padding-bottom:0px;border-right-width:0px;border-top-width:2px;

                    <div class="styTitleName" style="height:4.7mm;">Part II</div>
                    <span style="width:3mm;padding-top:1mm;"/> 
                      Year-End Balances of Future Separate Limitation Income That Must Be Recharacterized<br/>
bl<<< merge needed >>>
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

						(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
						<span class="styUnderlineText" 
						style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">

							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
						style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">

							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
						style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
            </xsl:for-each>
							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
						style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
                    </tbody>
							</xsl:call-template>)
						</span>
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
                    </table>
                  <<< merge needed >>>
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
 rows -->
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
              <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
peatin<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
V Column (v) Other Income (Continue)</span>
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Foreign branch income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
              <div cl<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey">
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
-width:0px;border-bottom-width:0px;page-break-after:<<< merge ne<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
dSeLmIn">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                <table cellsp<<< merge needed >>>
                    </xsl:call-template>
                  </td>
        <!--Part III tit<<< merge needed >>>
                </tr>

                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                  <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
lass="IRS1118Schedu<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
 style="height:4.7mm;">Part III
                    </xsl:call-template>
                  </td>
                        </div>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
           <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
all Foreign Loss Account Balances (section 904(f)(1)) 
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
                        <span style="padding-left:3mm;">
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">General category income</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                          <span style="font-styl<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="background-color:lightgrey;"/>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
IRS1118ScheduleJ_DescCell<<< merge needed >>>
                    </xsl:call-template>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                  </td>
                </tr>
ont-size:10px;" valign="bottom">
                <!-- blank lines, row e,  if no data -->
                <xsl:if test="not($FormData/EOYBalanceSepLmtOtherIncmGrp)">
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
                        <xsl:call-template name="PopulateAmount">
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
      <<< merge needed >>>
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
                  </tr>
                </xsl:if>
de" 
                <xsl:for-each select="$FormData/EOYBalanceSepLmtOtherIncmGrp">
                  <xsl:variable name="pos" select="position()"/>
                  <!--///////////////////////////////////////////////////////////////////////////////////
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 2]/OverallForeignLossAcctBalances/BeginningBalanceAmt"/>
    <<< merge needed >>>

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
                    <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other income*<br/>
						(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
						<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
							</xsl:call-template>
						</span>
						<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
							</xsl:call-template>)
						</span>
					</td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="Section951AIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="ForeignBranchIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
 name="P<<< merge needed >>>
                      </xsl:call-template>
                    </td>
                    <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" 
							select="GeneralCategoryIncomeAmt"/>
                      </xsl:call-template>
                    </td>
oreignLossAcctBalances/BeginningBalanceAmt"/>
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="OtherIncomeAmt"/>
						</xsl:call-template>
                    </td>
                   <<< merge needed >>>
                      <span class="styTableCellPad"/>
                      <span style="width:16px;"/>
                    </td>
                  </tr>
                </xsl:for-each>
                <!-- end repeating rows -->

                <tr class="styDepTblHdr">
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" style="width:256mm;padding-top:0px;padding-bottom:0px;border-top-width:2px;
                   border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
 for inline format-->
                    <span style="width:3mm;"/> 
                        Overall Foreign Loss Account Balances (section 904(f)(1))  
                    <span style="font-style:italic;font-weight:normal;">
                    <tr>
                      <span style="padding-left:3mm;">
                        Complete for <span style="font-weight:bold;">each </span>
                        separate limitation income category.</span>
                    </span>
                  </td>
                </tr>
                      <td class="IRS1118ScheduleJ_<<< merge needed >>>
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Beginning balance</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
pos]/OverallForeignLossAcctBalances/CurrentYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
                    <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
         <xsl:with-param name="TargetNode" 
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
							  select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OverallFo<<< merge needed >>>
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year additions</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
        <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 
						  select="$FormData/AdjSepLmtOtherIncome<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
xsl:call-template name="P<<< merge needed >>>
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year reductions (other than recapture)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
getNode" 
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
							  select="$FormData/AdjSepLmtOtherIncome[$pos+ 3]/Ov<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" 
         <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>

                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year recapture (from Part I, line 7)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="b<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
<xsl:<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
entYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
                        </xsl:call-template><<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
lForeignLossAcctBalances/CurrentYearReductionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
          <<< merge needed >>>
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="border-bottom-width:0px;padding-left:2mm;" valign="top">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;border-bottom-width:0px;" scope="row">
                    <span style="font-weight:bold;">Ending balance-</span>Combine lines 1 through 4.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
       </td>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <td class="IRS1118ScheduleJ_GenericCell" <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                </td>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:1px;border-bottom-width:0px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                    </tr>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;">
                    <span class="styTableCellPad"/>
                    <span style="width:16px;"/>
                  </td>
                </tr>
                    <!-- Part III, Line 4<<< merge needed >>>
                <tr class="styDepTblHdr">
                  <td class="IRS1118ScheduleJ_DescCell" colspan="8" scope="row" style="width:256mm;padding-top:0px;padding-bottom:0px;border-top-width:2px;
                   border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
                    <div class="styTitleName" style="height:4.7mm;">Part IV</div>
                    <span style="width:3mm;"/> 
                      Overall Domestic Loss Account Balances (section 904(g)(1))
                  </td>
                </tr>
        </xsl:c<<< merge needed >>>
                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Beginning balance</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                       </xsl:call-t<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
verallDomLossAcctBalances/BeginningBalanceAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
              <<< merge <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
epeating Column (v) for inlin<<< merge needed >>>
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year additions</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
ntYearAdditionsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                        </xsl:call-templat<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
ont-size:10px;" valign=<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
with-par<<< merge neede<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>

                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px" scope="row">Current year reductions (other than recapture)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
ame="TargetNode" 
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
							  select="$<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
pulateNegativeNumber">
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">
   <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateNegativeNumber">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
ct="$FormData/AdjSepLmtOtherIncome[$pos]/OverallDomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Subtotal-</span>Combine lines 1 through 3.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
          <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
DomLossAcctBalances/AdjustmentsSubtotalAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                        </xsl:call-template<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>

                <tr class="styDepTblRow1">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">5</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Current year recapture (from Part I, line 10)</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
a/AdjSepLmtOtherIncome[$pos + 1]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                   <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
ome[$pos + 3]/OverallDomLossAcctBalances/CurrentYearRecaptureAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
              <<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>
                </tr>
yle="width:112mm;"/>
                <tr class="styDepTblRow2">
                  <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">6</td>
                  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">
                    <span style="font-weight:bold;">Ending balance-</span>Subtract line 5
                      from line 4.</td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
							<span class="styBoldText">Schedule J<<< merge needed >>>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">

                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
of data for 2e and 9e is odd, set current to-->
                    </xsl:call-template>
                  </td>
                  <td class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:10px;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                  <!-- styDepTblRow1<<< merge needed >>>
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

                 <span clas<<< merge needed >>>

ol">
					  <span class="styBoldText">(i)</span>
                    <br/>Section<<< merge needed >>>
            <xsl:if test="$pos mod 4 = 2">

              Repeat the Whole Table Here - Column v displayed as many times as required at four per page
          ///////////////////////////////////////////////////////////////////////////////////////// -->
              <br/>
              <span class="styRepeatingDataTitle" style="width:256mm;">Form 1118 Schedule J, Parts I - II Column (v) Other Income (Continue)</span>
yC<<< merge needed >>>

                <table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm">
 <xsl:call-template naor Blue or Separate format table  -->
                    <tr class="styDepTblHdr">
                <tr class="st<<< merge needed >>>
						  style="padding-top:0px;padding-bottom:0px;border-right-width:0px;border-top-width:2px;

me[1]/AllocationCYSeparateLmtLosses/Section951AIncomeAmt"<<< merge need<<< merge needed >>>
                        <span style="width:3mm;"/> 

style="backg<<< merge needed >>>

!--Part I, line 2c for Blue or<<< merge needed >>>
                      </th>
                    </tr>
                    <tr class="styDepTblHdr">
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:58mm;height:10mm;font-weight:normal;text-align:center;" colspan="2" scope="col">
                      <span style="width:1px;" /></th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position()" format="2"/>
							<br/>(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +1" format="2"/>
							<br/>(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 1]/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
                      </th>
                      <th class="IRS1118ScheduleJ_GenericCell" style="width:32mm;height:10mm;font-size:7pt;font-weight:normal;text-align:center;" scope="col">
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +2" format="2"/>
							<br/>(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 2]/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
                      </th>
    <xsl:with-param name="T<<< merge needed >>>
        <xsl:with-param name<<< merge needed >>>
                        <span class="styBoldText">(v)</span>
                        <br/>Other income* <xsl:number value="position() +3" format="2"/>
							<br/>(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/SanctionedCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/TreatyCountryCd"/>
									</xsl:call-template>
								</span>
								<span class="styUnderlineText" 
								style="padding-left:2mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/OtherIncomeDesc"/>
									</xsl:call-template>)
								</span>
                      </th>
                    </tr>
                  </thead>
                  <tfoot/>
                  <tbody>

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

                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="width:99mm;font-size:10px;border-right-width:0px;" colspan="5" scope="row">
                      Allocation of separate limitation losses:</td>
                    </tr>
</x<<< merge needed >>>
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
yle="border-width:1px;font-s<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
xsl:with-param name="TargetNode" 
                        </xsl:call-template>
                      </td>
                    </tr>
						  select="$FormData/AdjSepLmtGeneralCategoryIncm/All<<< merge needed >>>
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
                      select="$FormData/AdjSepLmtOtherIncome[1]/AllocationCYSe<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								<span class="styUnderlineText" 
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
								style="padding-left:2m<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                    </tr>

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
ll-templat<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                    </tr>
elect="count($FormData/AllocationSepLmtLossOthIncmGrp)"/>
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
         <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 
    <xsl:attribute <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                    </tr>
yle="padding-left:2mm; text-align:left;">
                      <!--///////////////////////////////////////////////////////////////////////////////////
                          Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                          find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                          ///////////////////////////////////////////////////////////////////////////////////-->
                    <xsl:for-each select="$FormData/AllocationSepLmtLossOthIncmGrp">
                      <xsl:variable name="rowpos" select="position()"/>
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
						  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other Income*
							<br/>
							(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
								</xsl:call-template>)
							</span>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode" 
									  select="OtherIncomeAmt[$pos]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 1]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 2]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 3]"/>
							</xsl:call-template>
						  </td>
						</tr>
					</xsl:for-each>
                    <!-- end repeating rows -->
									<xsl:call-template name="PopulateText">
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
										<xsl<<< m<<< merge needed >>>
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
class="I<<< merge needed >>>
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
Node" select="$FormData/AdjSepLmtSecti<<<<< merge needed<<< merge needed >>>
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

                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">9</td>
                      <td class="IRS1118ScheduleJ_DescCell" colspan="10" scope="row" style="width:99mm;font-size:10px;border-right-width:0px;">
                      Recharacterization of separate limitation income:</td>
                    </tr>

                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
rd<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
er">
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                      <xsl:with-param name="TargetNode" select="$FormData/A<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                    </tr>
    <<< merge needed >>>
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
yle="font-siz<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
/span>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
      <td class="IRS<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                    </tr>
nericCell" <<< merge needed >>>
                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
te<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
 name="Tar<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                    </tr>
ryIncm/RcptrOverallForeignLossesAmt<<< merge needed >>>
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
ating for<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
             <tr class="styDepTblRow2">
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
      <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
me/AdjIncmLossAndLmtIncmAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
   <<< merge needed >>>
                      <!--///////////////////////////////////////////////////////////////////////////////////
                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to
                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.
                        ///////////////////////////////////////////////////////////////////////////////////-->
                    <xsl:for-each select="$FormData/RchrctrztnSepLmtOtherIncmGrp">
                      <xsl:variable name="rowpos" select="position()"/>
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
						  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other Income*
							<br/>
							(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
								</xsl:call-template>)
							</span>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode" 
									  select="OtherIncomeAmt[$pos]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 1]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 2]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 3]"/>
							</xsl:call-template>
						  </td>
						</tr>
					</xsl:for-each>
                    <!-- end repeating rows -->

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
           <xsl:call-t<<< merge needed >>>
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

                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" valign="top" scope="row">11</td>
                      <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;border-bottom-width:1px;" scope="row">
                        <span style="font-weight:bold;">Numerator of Limitation Fraction-</span>Combine lines 8 through 10.  
dth:0px;" s<<< merge needed >>>
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

                    <tr class="styDepTblHdr">
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
class="IRS1118ScheduleJ_GenericCell" style="bord<<< m<<< merge needed >>>

                        <div class="styTitleName" style="height:4.7mm;">Part II</div>
                        <span style="width:3mm;"/> 
                            Year-End Balances of Future Separate Limitation Income That Must Be Recharacterized<br/>
class="IRS1118ScheduleJ_GenericCell" style="border-right-width:1px;font-size:<<< merge needed >>>
                      </td>
                    </tr>
         <td<<< merge needed >>>
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">a</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Section 951A income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

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

                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">b</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Foreign branch income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
t="$FormData/AdjSepLmtOtherIncome[1]/<<< merge needed >>>
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

                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">c</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Passive category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
ign="<<< merge needed >>>
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

                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_SubIndexCell" scope="row">d</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">General category income</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 

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
x;border-right-width:1px;" valign="bottom<<< merge needed >>>
                    <xsl:for-each select="$FormData/EOYBalanceSepLmtOtherIncmGrp">
                      <xsl:variable name="rowpos" select="position()"/>
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
						  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other Income*
							<br/>
							(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>
								</xsl:call-template>
							</span>
							<span class="styUnderlineText" 
							style="padding-left:2mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
								</xsl:call-template>)
							</span>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode" 
									  select="OtherIncomeAmt[$pos]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 1]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 2]"/>
							</xsl:call-template>
						  </td>
						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
							<xsl:call-template name="PopulateNegativeNumber">
							  <xsl:with-param name="TargetNode"
									  select="OtherIncomeAmt[$pos + 3]"/>
							</xsl:call-template>
						  </td>
						</tr>
					</xsl:for-each>
                    </tbody>
                    </table>
                    </div>
                    <!-- end repeating rows -->
              <br/>


                <table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm">
tyDepTb<<< merge needed >>>
                    <tr class="styDepTblHdr">
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
                      style="width:256mm;border-top-width:1px;border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">
;" valign="bottom">
                        <span style="width:3mm;"/> 
                    <xsl:call-template name="PopulateAmount">
                        <span style="padding-left:3mm;">
                          <span style="font-style:italic;font-weight:normal;">Complete for <b>each </b>
                            separate limitation income category.</span>
                        </span>
                      </td>
                    </tr>
       <<< merge needed >>>
      </xsl:call-template>
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">1</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Beginning balance</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
               <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
--Part I, line 9e fo<<<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                    </tr>

                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year additions</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
     <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
therIncmGrp)"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
      <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
attribute>
                        </xsl:call-template>
                      </td>
                    </tr>
                      </xsl:when>
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year reductions (other than recapture)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                      <<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
neText" 
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
							style="padding-left:2mm; text-align:left;">
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
							<xsl:call-template na<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                    </tr>

                    <tr class="styDepTblRow2">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year recapture (from Part I, line 7)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
      <td class="IRS1118ScheduleJ_GenericCell" st<<< merge needed >>><<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">

                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">

                        </xsl:call-template>
                      </td>
                    </tr>
                  <td class="IRS1118ScheduleJ_GenericCell" valign="bottom" style="font-size:10px;">
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
                    <!--Pen and ink image -->
                    <tr class="styDepTblHdr">
                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 
      <<< merge needed >>>
           <span style="padding-right:2mm">
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
               <<< merge needed >>>
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
bleInline">
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                 <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
>
                        </xsl:call-template>
                      </td>
                    </tr>
                    </xsl:call-template>
                    <tr class="styDepTblRow1">
                      <td class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">3</td>
                      <td class="IRS1118ScheduleJ_DescCell" scope="row" style="font-size:10px;">Current year reductions (other than recapture)</td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                    </span>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                    <xsl:call-template name="PopulateAmount">
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtGeneralCate<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateNegativeNumber">
                    <xsl:call-<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                    </tr>

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
  </td>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
                  <td class="IRS1118<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">

                        </xsl:call-template>
                      </td>
                    </tr>
Cd"/>
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
    <<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">
118ScheduleJ_DescCell" scope="row" style="f<<< merge needed >>>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">
                        <xsl:call-template name="PopulateAmount">

                        </xsl:call-template>
                      </td>
                    </tr>
       </xsl:call-templa<<< merge needed >>>
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
e:10px;border-bottom-width:0px;">
       <<< merge needed >>>


   <<< merge needed >>>
RS1118ScheduleJ_DescCell" colspan="8" scope="row" 

					  style="padding-top:0px;padding-b<<< merge needed >>>
padding-top:1mm;"/> 

                   <<< merge needed >>>
"IRS1118ScheduleJ_GenericCell" style="width:58mm;height:10mm;font-weight:n<<< merge needed >>>
nter;" scope="col">

    <<< merge needed >>>
            <<< merge needed >>>
    <span class="styBoldText">(iii)</span>

                    <br<<< merge needed >>>
nericCell" 

					  style="width:32mm;height:10mm;<<< merge needed >>>
e[1]"/>

                    </xsl:call-tem<<< merge needed >>>
Targ<<< merge needed >>>
$FormData/AdjSepLmtOtherIncome/SanctionedCountryCd"/>

	<<< merge needed >>>
>

						</span>

						<span class="styUnderlineText" 

						style="p<<< merge needed >>>
         </th>

             <<< merge needed >>>
   <xsl:call-template name="SetFormLinkInline">

            <<< merge needed >>>
        </xsl:call-<<< merge needed >>>
              <td class="IRS1118ScheduleJ_SubI<<< merge needed >>>
    <<< merge needed >>>
eignBranchIncome/EOYBalancesOfFutureS<<< merge needed >>>
                     <xsl:with-param name="TargetNode" 

						  select="$FormData/AdjSepLmtPa<<< merge needed >>>
					  sele<<< merge needed >><<< merge needed >>>
                <td class="IRS1118ScheduleJ_GenericCell" style="border-right-wi<<< merge needed >>>
heduleJ_DescCell" style="font-size:10px" sco<<< merge needed >>>
ign<<< merge needed >>>
mount">

                      <xsl:with-param<<< merge needed >>>
  select="$FormData/AdjSepLmtGeneralCategoryIncm/EOYBalancesOfFutureSepLmtIncm/ForeignBranchIncomeAmt"/>

                <<< merge needed >>>
etNode" 

						  se<<< merge needed >>>
olor:lightgrey;"/>

                </tr>

        <<< merge needed >>>
come</td>

                  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:<<< merge needed >>>
PassiveCategory<<< merge needed >>>
             <xsl:with-param<<< merge needed >>>
cCell" style="font-size:10px;" valign="botto<<< merge needed >>>
:call-template>

      <<< merge needed >>>
ect="$FormData/<<< merge needed >>>
  </tr>

                <!--Part II line d for Blue or Separate format table  -->

   <<< merge needed >>>
eral category income</td>

          <<< merge needed >>><<< merge needed >>>
e name="PopulateAmount">

                      <xsl:with<<< merge needed >>>
d<<< merge needed >>>
LmtForeignBranchIncom<<< merge needed >>>
/EOYBalancesOfFutureSepL<<< merge needed >>>
tIncm/GeneralCategoryIncomeAmt"/><<< merge <<< merge needed >>>
              <xsl:with-param name="T<<< merge needed >>><<< merge needed >>>
CategoryIncomeAmt"/>

                    </xsl:call-template>

 <<< merge needed >>>
uleJ_GenericCell" style="backg<<< merge neede<<< merge needed >>>
tom">

                    <xsl:call-template name="PopulateAmount">

                      <xsl:with-param name="TargetNode" 

						  se<<< merge needed <<< merge needed >>>
eneralCategoryIncomeAmt"/>

             <<< mer<<< merge needed >>>
                  <td class="IRS1118ScheduleJ_GenericCell" style="b<<< merge needed >>>
 

							select="PassiveCategoryIncomeAmt"/>

  <<< merge needed >>>
plate>

                    </td>

                    <td cla<<< merge needed >>>


                <tr class="s<<< merge needed >>>
                  <xs<<< merge needed >>>
                  <xsl:with-param name="Target<<< merge needed >>>
lateAmount">

                      <xsl:with-param name="TargetNode" 

						select="$FormData/AdjSepLmtSection951AIncome<<<<<< merge needed >>>
name="TargetNode" 

						select="$FormData/AdjSepLmtPassiveCategoryIncm/OverallFore<<< merge needed >>>
="PopulateAmount">

                      <xsl:with-param n<<< merge needed >>>
te name="PopulateAmount">

                      <xsl:with-param name="TargetNo<<< merge needed >>>
-width:0px;background-color:lightgrey;"/>

             <<< merge needed >>>
ss="IRS1118ScheduleJ<<< merge needed >>>
mber">

                      <<<< merge need<<< merge needed >>>
"/>

                    </xsl:call-template>
<<< merg<<< merge needed >>>
  </xsl:call-template>

                  </td>

                 <<< merge needed >>>
eJ_IndexCell" scope="row" style="padding-left:2mm;" valign="top">4</td>
<<< merge needed >>>
rRecapture<<< merge needed >>>
   </xsl:call-template>

                  </td>

                  <td class="IRS1118Schedule<<< merge needed >>>
         <td class="IRS1118ScheduleJ_GenericCell" style="font-size<<< merge needed >>>
       <<< merge needed >>>
rgetNode" select="$FormData/AdjSepLmtOtherIncome[1]/OverallForeignLossAcctBalances/CurrentYearRecaptureAmt"/>

            <<< merge needed >>>
2mm;">1</td>

               <<< merge needed >>>
epLmtGeneralCategory<<< merge needed<<< merge needed >>>
             </xsl:call-template>

   <<< merge needed >>>
e name="PopulateNegativeNumber">

       <<< merge needed >>>
               <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">

   <<< m<<< merge needed >>>
ight<<< merge needed >>>
order-right-width:0px;back<<< merge needed >>>
e="font-size:<<< merge needed >>>
         </xsl:call-template>

                  </td>

                  <t<<< merge needed ><<< merge needed >>>
siveCategoryIncm/ OverallDomLossAcctBalances/CurrentYearRecaptureA<<< merge nee<<< merge needed >>>
cheduleJ_GenericCell" style="border-right-width:0px;background-color:lightgrey;"/>

                </tr>

     <<< merge needed >>>
:bold;">Ending balance-</span>Subtract li<<< merge needed >>>
anceAmt"/>

                    </xsl:cal<<< merge needed >>>
TargetNode" select="$FormData/AdjSepLmtForeignBranchInc<<< merge needed >>>
                   </xsl:call-temp<<< merge needed >>>
mplate>

                  </td>

                  <td class="IR<<< merge needed >>>
mplate>

<<< merge needed >>>
/xsl:if>

        <!-- If the Separate Print Opti<<< merge needed >>>
therIncome) &gt; 1">

          <xsl:for-each select="$FormData/<<< merge needed >>>
s required at four per page

          <<< merge needed >>>
/span>

              <!-- Part I Table for repeating Column (iii) f<<< merge needed >>>
       <<< merge needed >>>
left:0px;height:8mm;">

                      <<< merge needed >>>
yBol<<< merge needed >>>
cCe<<< merge needed >>>
djSe<<< merge needed >>>
						</span>

								<span class="styUnderlineText" 

								style="padding-left:2mm; text-align:left<<< merge needed >>>
m; te<<< merge needed >>>
late name="PopulateTe<<< merge needed >>>
tyle<<< merge needed >>>
ng<<< merge needed >>>
e:10px;" scope="row">Income or (loss) before adjustments</td>

   <<< m<<< merge needed >>>
               <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos + 3]/T<<< merge needed >>>
                  </<<< merge needed >>>
 class="IRS1118ScheduleJ_IndexCell" scope="row" style="padding-left:2mm;">2</td>

                      <td class="IR<<< merge needed >>>
                 Allocation of separate limi<<< merge needed >>>
hedu<<< merge needed >>>
all-<<< merge needed >>>
:0px;" valign="bottom">

                        <xsl:call-templa<<< merge neede<<< merge needed >>>
onCYSeparateLmtLosses/ForeignBranchIncomeAmt"/>

                   <<< merge needed >>>
        <<< merge needed >>>
                  <xsl:call-template <<< merge needed >>>
tegoryIncomeAmt"/>

                        </xsl:call-template>

                     <<< merge<<< merge needed >>>
exCe<<< merge needed >>>


							(identify <img src="{$ImagePath<<< merge needed >>>
name="TargetNode" select="SeparateCategoryCd"/>

								</xsl:call-tem<<< merge needed >>>
							style="padding-left:2mm; text-align<<< merge needed >>>
>

					<<< merge needed >>>
ext">

									<xsl:with-param name="Targe<<< merge needed >>>
 name="PopulateT<<< <<< merge needed >>>
ate><<< merge needed >>>
 + 1]"/>

							</xsl:call-template>

						  </td>

						  <td <<< merge needed >>>
 na<<< merge needed >>>
>

							  <xsl:with-param<<< merge needed >>>
ine 3 for repeating Column (v) for Blue or Separate format table--><<< merge needed >>>
" scope<<< merge needed >>>
font-size:10px;" valign="bottom">

                      <<< merge needed >>>
OtherIncome[$p<<< merge needed >>>
                    <xsl<<< merge needed >>>
ell" style="font-size:10px;" v<<< merge needed >>>
                   <td class="I<<< merge needed >>>
mt"/>

                      <<< mer<<< merge needed >>>
                 <xsl:with-param name="TargetNode" select="$FormData/AdjSepLmtOtherIncome[$pos]/OverallForeignLossesAmt"/>

                        </xsl:ca<<< merge needed >>><<< merge needed >>>
        <xsl:call-templ<<< merge needed >>>
size:1<<< merge needed >>>
/td>

                    </tr>

                    <!-- Part I, Line 5 for repeating Column (v)  for Blue or Separate format table-->

           <<< merge needed >>>
sl:call-template>

       <<< merge needed >>>
valign=<<< merge needed >>>
"PopulateNegativeNumber">

                          <xsl:with-param name="TargetN<<< merge needed >>>
getNode" select=<<< merge needed >>>
      </td>

                    </tr>

 <<< merge needed >>>
                  <<< merge needed >>>
e="font-size:10px;"><<< merge needed >>>
="bottom">

         <<< merge needed >>>
e:10px;"<<< merge needed >>>
     <td class="IRS1118ScheduleJ_GenericCe<<< merge needed >>>
            </xsl:call-template>

                      </td>

                      <td class=<<< merge needed >>>
rgetNode" select="$FormData/Adj<<< merge needed >>>
             <!-- Part I, Line 8 fo<<< merge needed >>>
 select="$FormData/AdjSepLmt<<< merge needed >>>
      <xsl:call-template name="Popula<<< mer<<< merge needed >>>
]/AdjIncmLossAndLmtIncmAmt"/>

                        </xsl:call-templat<<< merge needed >>>
     <<< merge needed >>>
acterization of separate limitation income:</td>

                    </tr>

                    <!-- P<<< merge ne<<< merge needed >>>
mount">

                          <xsl:with-param name="TargetNode" 

							  select="$FormData<<< merge needed >>>
          <td class="IRS1118ScheduleJ_Ge<<< merge needed >>>
ericCell<<< merge needed >>>
om">

            <<< merge needed >>>
mplate name="PopulateAmount">

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

                      <!--///////////////////////////////////////////////////////////////////////////////////

                        Note that the repeating rows are assumed to be filled in full by the corresponding columns - otherwise there is no way to

                        find out how they line up.  Hence the number of repetition are assumed to be the SAME for all columns.

                        ///////////////////////////////////////////////////////////////////////////////////-->

                    <xsl:for-each select="$FormData/RchrctrztnSepLmtOtherIncmGrp">

                      <xsl:variable name="rowpos" select="position()"/>

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

						  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other Income*

							<br/>

							(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>

							<span class="styUnderlineText" 

							style="padding-left:2mm; text-align:left;">

								<xsl:call-template name="PopulateText">

									<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>

								</xsl:call-template>

							</span>

							<span class="styUnderlineText" 

							style="padding-left:2mm; text-align:left;">

								<xsl:call-template name="PopulateText">

									<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>

								</xsl:call-template>

							</span>

							<span class="styUnderlineText" 

							style="padding-left:2mm; text-align:left;">

								<xsl:call-template name="PopulateText">

									<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>

								</xsl:call-template>

							</span>

							<span class="styUnderlineText" 

							style="padding-left:2mm; text-align:left;">

								<xsl:call-template name="PopulateText">

									<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>

								</xsl:call-template>)

							</span>

						  </td>

						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">

							<xsl:call-template name="PopulateNegativeNumber">

							  <xsl:with-param name="TargetNode" 

									  select="OtherIncomeAmt[$pos]"/>

							</xsl:call-template>

						  </td>

						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">

							<xsl:call-template name="PopulateNegativeNumber">

							  <xsl:with-param name="TargetNode"

									  select="OtherIncomeAmt[$pos + 1]"/>

							</xsl:call-template>

						  </td>

						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">

							<xsl:call-template name="PopulateNegativeNumber">

							  <xsl:with-param name="TargetNode"

									  select="OtherIncomeAmt[$pos + 2]"/>

							</xsl:call-template>

						  </td>

						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">

							<xsl:call-template name="PopulateNegativeNumber">

							  <xsl:with-param name="TargetNode"

									  select="OtherIncomeAmt[$pos + 3]"/>

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

<<< merge needed >>>
<<< difference resolved - line(s) deleted >>>
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

                      style="width:256mm;padding-top:0px;padding-bottom:0px;border-right-width:0px;

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

                    <xsl:for-each select="$FormData/EOYBalanceSepLmtOtherIncmGrp">

                      <xsl:variable name="rowpos" select="position()"/>

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

						  <td class="IRS1118ScheduleJ_DescCell" style="font-size:10px;" scope="row">Other Income*

							<br/>

							(identify <img src="{$ImagePath}\1118SchJ_Bullet.gif" alt="Right arrow" border="0"/>

							<span class="styUnderlineText" 

							style="padding-left:2mm; text-align:left;">

								<xsl:call-template name="PopulateText">

									<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>

								</xsl:call-template>

							</span>

							<span class="styUnderlineText" 

							style="padding-left:2mm; text-align:left;">

								<xsl:call-template name="PopulateText">

									<xsl:with-param name="TargetNode" select="SanctionedCountryCd"/>

								</xsl:call-template>

							</span>

							<span class="styUnderlineText" 

							style="padding-left:2mm; text-align:left;">

								<xsl:call-template name="PopulateText">

									<xsl:with-param name="TargetNode" select="TreatyCountryCd"/>

								</xsl:call-template>

							</span>

							<span class="styUnderlineText" 

							style="padding-left:2mm; text-align:left;">

								<xsl:call-template name="PopulateText">

									<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>

								</xsl:call-template>)

							</span>

						  </td>

						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">

							<xsl:call-template name="PopulateNegativeNumber">

							  <xsl:with-param name="TargetNode" 

									  select="OtherIncomeAmt[$pos]"/>

							</xsl:call-template>

						  </td>

						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">

							<xsl:call-template name="PopulateNegativeNumber">

							  <xsl:with-param name="TargetNode"

									  select="OtherIncomeAmt[$pos + 1]"/>

							</xsl:call-template>

						  </td>

						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;" valign="bottom">

							<xsl:call-template name="PopulateNegativeNumber">

							  <xsl:with-param name="TargetNode"

									  select="OtherIncomeAmt[$pos + 2]"/>

							</xsl:call-template>

						  </td>

						  <td class="IRS1118ScheduleJ_GenericCell" style="font-size:10px;border-right-width:0px;" valign="bottom">

							<xsl:call-template name="PopulateNegativeNumber">

							  <xsl:with-param name="TargetNode"

									  select="OtherIncomeAmt[$pos + 3]"/>

							</xsl:call-template>

						  </td>

						</tr>

					</xsl:for-each>

                    </tbody>

                    </table>

                    </div>

                    <!-- end repeating rows -->

              <br/>

				<span class="styRepeatingDataTitle" style="width:256mm;">Form 1118 Schedule J, Parts III - IV Column (v) Other Income (Continue)</span>

					<div>

                <table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm">

                    <!-- Part III title for Repeating Column (v) for Blue or Separate format table-->

                    <tr class="styDepTblHdr">

                      <td class="IRS1118ScheduleJ_DescCell" colspan="6" scope="row" 

                      style="width:256mm;border-top-width:1px;border-right-width:0px;font-weight:bold;font-size:8pt;padding-left:0px;height:8mm;">

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

                      style="width:256mm;padding-top:0px;padding-bottom:0px;border-top-width:1px;

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