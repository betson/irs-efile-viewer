<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/><xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8825Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8825Data" select="$RtnDoc/IRS8825"/>
  <xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
	<html lang="EN-US">
	  <head>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<title>
		  <xsl:call-template name="FormTitle">
			<xsl:with-param name="RootElement" select="local-name($Form8825Data)"/>
		  </xsl:call-template>
		</title>
		<!--   No Browser Caching  -->
		<meta http-equiv="Pragma" content="no-cache"/>
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<meta http-equiv="Expires" content="0"/>
		<!-- No Proxy Caching -->
		<meta http-equiv="Cache-Control" content="private"/>
		<!-- Define Character Set -->
		<meta http-equiv="Content-RentalTypeDesc" content="text/html; charset=ISO-8859-1"/>
		<meta name="Description" content="IRS Form 8825"/>
		<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
		<xsl:call-template name="InitJS"/>
		<style type="text/css">
		  <!-- Form 8825 CSS Styles are located in the template called below -->
		  <!--<xsl:if test="not($Print) or $Print=''">--> 					
			<xsl:call-template name="IRS8825Style"/>
			<xsl:call-template name="AddOnStyle"/>
		  <!--</xsl:if>-->
		</style>
		<xsl:call-template name="GlobalStylesForm"/>
	  </head>
	  <!-- Form Design: Line 1 to Line 17 repeat this is the reason why page 2 do not exist for electronic filing -->
	  <!-- Form Design: Since Line 2 to Line 17 repeat as a GROUP it is redundant for Line 15 to display "See additional Data table" --> 
	  <body class="styBodyClass" style="width:187mm">
		<form name="Form8825">
		  <xsl:call-template name="DocumentHeader"/>
			<!-- BEGIN WARNING LINE -->
			<!-- END WARNING LINE -->
			<!-- Begin Form Number and Name -->
			<div class="styBB" style="width:187mm; height: 20mm; border-bottom-width:1.5px">
			  <div class="styFNBox" style="width:31mm; font-size: 7pt; height: 20mm; border-right-width:1.5px;">
				<div style="height:14mm;">
				  Form <span class="styFormNumber">8825</span>
				  (Rev. November 2018)
				</div>
				<div class="styAgency" style="height:6mm;">
				  Department of the Treasury
				  <br/>
				  Internal Revenue Service
				</div>
			  </div>
			  <div class="styFTBox" style="width:125mm;">
				<div class="styMainTitle">Rental Real Estate Income and Expenses of a<br/>
				  Partnership or an S Corporation
				</div>
				<div class="styFST" style="margin-left:3mm;font-weight:bold">
				  <div class="styFST" style="width:125mm;padding-top:1.5mm;border:0px;">
					<img src="{$ImagePath}/8825_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
					Attach to Form 1065, or Form 1120S.
				  </div>
				  <div class="styFST" style="padding-top:1.5mm;border:0px;">
					<img src="{$ImagePath}/8825_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
					Go to 
					<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8825" title="Link to IRS.gov">
					  <i>www.irs.gov/Form8825</i>
					</a>
					for the latest information.							
				  </div>
				</div>
			  </div>
			  <div class="styTYBox" style="width:31mm; height:20mm; border-left-width:1.5px;">
				<div class="styOMB" style="height:20mm; padding-top:7mm; padding-left:2mm; text-align:left;">
				  OMB No. 1545-0123
				</div>
			  </div>
			</div>
			<!-- End Form Number and Name section -->
			<!-- Begin Names and Identifying number section -->
			<div class="styBB" style="width:187mm; height:9mm; border-bottom-width:1px;">
			  <div class="styNameBox" style="width:131mm; height:9mm;f ont-size:7pt;">
				Name
				<br/>
				<!-- Choice between 1120, 1065, 1041 and 1040 Return Header Filer info -->
				<xsl:call-template name="PopulateFilerName">
				  <xsl:with-param name="TargetNode" select="$Form8825Data"/>
				</xsl:call-template>	
			  </div>
			  <div class="styEINBox" style="width:46mm; font-size:7pt; padding-left:1mm;">
				<div style="height:4mm;">
				  Employer identification number
				</div>
				<div style="text-align:left; padding-top:1.5mm; height:5mm; font-weight:normal;">
				  <!-- Choice between 1120, 1065, 1041, and 1040 Return Header Filer info -->
				  <xsl:call-template name="PopulateFilerTIN">
					<xsl:with-param name="TargetNode" select="$Form8825Data"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!-- ******************************************************************************** -->
			<!-- Lines 1 - 16 -->
			<xsl:if test="$Form8825Data/RentalIncomeExpensesGrp">
			  <!-- If the Print parameter is not Separated, or there are fewer elements than the container height -->
			  <xsl:if test="(($Print != $Separated) or (count($Form8825Data/RentalIncomeExpensesGrp) &lt;= 4)) and ((count($Form8825Data/RentalIncomeExpensesGrp) &gt; 0))">
				<div class="styGenericDiv" style="width:187mm;">
				  <xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp">
					<xsl:variable name="pos" select="position()"/>
					<xsl:if test="position() mod 4 = 1">
					  <xsl:variable name="conID" select="concat('RentTableID', $pos)"/>
					  <xsl:variable name="imgID" select="concat('RentImgID', $pos)"/>
					  <xsl:variable name="btnID" select="concat('RentBtnID', $pos)"/>
					  <xsl:variable name="OtherRowCount" select="(count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp) + 
						count($Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp) + 
						count($Form8825Data/RentalIncomeExpensesGrp[$pos+2]/OtherRentalRealEstExpenseGrp) + 
						count($Form8825Data/RentalIncomeExpensesGrp[$pos+3]/OtherRentalRealEstExpenseGrp))"/>
					  <!--the top border of the repeating table will not show in the second table if border-top-width = 0-->
					  <!-- BEGIN Line 1, A - Z  repeating table with five columns -->
					  <div class="styBB" style="width:187mm; clear:both; float:none; border-bottom-width:1px; border-top-width:1px solid black;">
						<table class="styTable" cellspacing="0" cellname="TYTable" id="TYTable" summary="Rental real estate location, type, rental vs personal days" >
					      <thead>
					        <!-- BEGIN Line 1 description -->
						    <tr style="height:8mm;">
							  <th class="styTableCellHeader" style="width:8mm; text-align:center; vertical-align:top; font-size:7pt; border-right:1 solid black; border-bottom:0;" rowspan="2" colspan="1" scope="col">1</th>
							  <th class="styTableCellHeader" style="width:182mm; border-right-width: 0px; font-weight:normal; font-size:7pt; text-align:left; padding-left:1mm" colspan="4" scope="col">
							    Show the type and address of each property. For each rental real estate property listed, report the number of days rented at fair rental value and days with personal use.
							    See instructions. See page 2 to list additional properties.
							  </th>
						    </tr>
						    <!-- BEGIN Line 1 Column headings -->
						    <tr>
							  <th class="styTableCellHeader" style="width:82mm; font-size:7pt; border-bottom:0; border-right:1 solid black;" scope="col">
								<span style="font-weight:normal; text-align:left; padding-left:1mm;">
								  Physical address of each property &#8212; street, city, state, ZIP code 
								</span>
							  </th>
							  <th class="styTableCellHeader" style="width:36mm; font-size:7pt; border-bottom:0; border-right:1 solid black;">
								<span style="font-weight:normal;" scope="col">Type&#8212;Enter code 1&#8212; 8; see page 2 for list </span>
							  </th>
							  <th class="styTableCellHeader" style="width:32mm; font-size:7pt; border-bottom:0; border-right:1 solid black;">
								<span style="font-weight:normal;" scope="col">Fair Rental Days </span>
							  </th>
							  <th class="styTableCellHeader" style="width:36mm; font-size:7pt; border-bottom:0; border-right-width:0;">
								<span style="font-weight:normal;" scope="col">Personal Use Days </span>
							  </th>
						    </tr>
					      </thead>
					      <tfoot/>
					      <xsl:if test="($Print != $Separated) or (count($Form8825Data/RentalAddressGrp) &lt;= 4) ">
						    <xsl:for-each select="$Form8825Data/RentalAddressGrp">
							  <xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
								<tbody>
								  <!-- BEGIN Repeating Line A -Z -->
								  <tr style="height:8mm; font-size:7pt;">
									<xsl:variable name="index" select="position()"/>
									<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:0; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
									  <xsl:if test="(position() mod 4 = 0)">
										<xsl:attribute name="style">width:5mm;border-right:1 solid black;text-align:left;padding-left:3.5mm;border-bottom:0;</xsl:attribute>
									  </xsl:if>
									  <xsl:call-template name="AddPositionNumber"/>
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:0; border-right:1 solid black; text-align:left;" valign="bottom">
									  <xsl:if test="(position() mod 4 = 0)">
										<xsl:attribute name="style">width:82mm;border-right:1 solid black;text-align:left;border-bottom:0;</xsl:attribute>
									  </xsl:if>
									  <xsl:choose>
										<xsl:when test="USAddress">
										  <xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp[$index]/USAddress"/>
										  </xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
										  <xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp[$index]/ForeignAddress"/>
										  </xsl:call-template>
										</xsl:otherwise>
									  </xsl:choose>
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0; border-right:1 solid black; text-align:center;" valign="bottom">
									  <xsl:if test="(position() mod 4 = 0)">
										<xsl:attribute name="style">width:32mm;border-right:1 solid black;text-align:center;border-bottom:0;</xsl:attribute>
									  </xsl:if>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp[$index]/RentalTypeDesc"/>
									  </xsl:call-template>
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0; border-right:1 solid black; text-align:center;" valign="bottom">
									  <xsl:if test="(position() mod 4 = 0)">
										<xsl:attribute name="style">width:32mm;border-right:1 solid black;text-align:center;border-bottom:0;</xsl:attribute>
									  </xsl:if>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp[$index]/FairRentalDaysCnt"/>
									  </xsl:call-template>
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; text-align:center; border-right-width:0px; border-bottom:0;" valign="bottom">
									  <xsl:if test="(position() mod 4 = 0)">
										<xsl:attribute name="style">text-align:center;border-right-width:0px;border-bottom:0;</xsl:attribute>
									  </xsl:if>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp[$index]/PersonalUseDaysCnt"/>
									  </xsl:call-template>
									  <span class="styTableCellPad"/>
									</td>
								  </tr>
								  <!-- BEGIN Blank line Start with A-->
								  <xsl:if test="position()=last() and (count($Form8825Data/RentalAddressGrp) mod 4 &gt; 0) and (count($Form8825Data/RentalAddressGrp) &gt; 4)">
								    <!-- BEGIN Blank line Start with B-->
									<xsl:if test="(count($Form8825Data/RentalAddressGrp) mod 4 = 1)">
									  <tr style="height:8mm;font-size:7pt;">
										<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:0 solid black; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
										  <span class="styBoldText">
											<xsl:number value="position() + 1" format="A"/>
										  </span>
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:0 solid black; border-right:1 solid black; text-align:left;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0 solid black; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0 solid black; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0 solid black; text-align:center; border-right-width:0px;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
									  </tr>
									  <!-- BEGIN Blank line Start with B-->
									  <tr style="height:8mm;font-size:7pt;">
										<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:0 solid black; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
										  <span class="styBoldText">
											<xsl:number value="position() + 2" format="A"/>
										  </span>
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:0 solid black; border-right:1 solid black; text-align:left;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0 solid black; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0 solid black; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0 solid black; text-align:center; border-right-width:0px;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
									  </tr>
									  <!-- BEGIN Blank line Start with C-->
									  <tr style="height:8mm;font-size:7pt;">
										<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
										  <span class="styBoldText">
											<xsl:number value="position() + 3" format="A"/>
										  </span>
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:82mm; border-right:1 solid black; text-align:left;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; text-align:center; border-right-width:0px" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
									  </tr>
									</xsl:if>
									<!-- BEGIN Blank line Start with C-->
									<xsl:if test="(count($Form8825Data/RentalAddressGrp) mod 4 = 2)">
									  <tr style="height:8mm;font-size:7pt;">
										<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:1 solid black; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
										  <span class="styBoldText">
											<xsl:number value="position() + 1" format="A"/>
										  </span>
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:1 solid black; border-right:1 solid black; text-align:left;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1 solid black; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1 solid black; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1 solid black; text-align:center; border-right-width:0px;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
									  </tr>
									  <!-- BEGIN Blank line Start with C-->
									  <tr style="height:8mm; font-size:7pt;">
										<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
										  <span class="styBoldText">
											<xsl:number value="position() + 2" format="A"/>
										  </span>
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:82mm; border-right:1 solid black; text-align:left;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; text-align:center; border-right-width:0px;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
									  </tr>
									</xsl:if>
									<!-- BEGIN Blank line Start with D-->
									<xsl:if test="(count($Form8825Data/RentalAddressGrp) mod 4 = 3)">
									  <tr style="height:8mm;font-size:7pt;">
										<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
										  <span class="styBoldText">
											<xsl:number value="position() + 1" format="A"/>
										  </span>
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:82mm; border-right:1 solid black; text-align:left;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right-width:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1 solid black; text-align:center;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
										<td class="styForm8825TableCellNoBorder" style="width:32mm; text-align:center; border-right-width:0px;" valign="bottom">
										  <span class="styTableCellPad"/>
										</td>
									  </tr>
									</xsl:if>
								  </xsl:if>
								</tbody>
							  </xsl:if>
						    </xsl:for-each>
					      </xsl:if>
					      <!-- BEGIN BLANK Row A  for separate  -->
					      <xsl:if test="count($Form8825Data/RentalAddressGrp) &lt; 1 or (($Print = $Separated) and (count($Form8825Data/RentalAddressGrp) &gt; 4)) ">

						    <tr style="height:10mm; font-size:7pt">
							  <td style="width:5mm; border-right:1px solid black;border-top:1px solid black;text-align:left;padding-left:3.5mm;">
							    <span class="styBoldText"> A </span>
								<span class="styTableCellPad"/>
							  </td>
							  <xsl:choose>
								<xsl:when test="($Print = $Separated)">
								  <td style="width:82mm;text-align:left;border-right:1px solid black;border-top:1px solid black;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
									  <xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								  </td>
								</xsl:when>
								<xsl:otherwise>
								  <td style="width:82mm;text-align:left;border-right:1px solid black;border-top:1px solid black;">
									<span class="styTableCellPad"/>
								  </td>
								</xsl:otherwise>
							  </xsl:choose>
							  <td style="width:32mm;text-align:left;border-right:1px solid black;border-top:1px solid black;">
								<span class="styTableCellPad"/>
							  </td>
							  <td style="width:32mm;text-align:left;border-right:1px solid black;border-top:1px solid black;">
								<span class="styTableCellPad"/>
							  </td>
							  <td style="width:32mm;text-align:left;border-top:1px solid black;">
								<span class="styTableCellPad"/>
							  </td>
						    </tr>

					      </xsl:if>
					      <!-- BEGIN BLANK Row B -->
					      <xsl:if test="count($Form8825Data/RentalAddressGrp) &lt; 2 or (($Print = $Separated) and (count($Form8825Data/RentalAddressGrp) &gt; 4)) ">

					      		<tr style="height:10mm; font-size:7pt;">
									<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:0; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
								<span class="styBoldText"> B </span>
								<span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:0; border-right:1 solid black; text-align:left;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0; border-right:1 solid black; text-align:center;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0; border-right:1 solid black; text-align:center;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; text-align:center; border-right-width:0px; border-bottom:0;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
								  </tr>

					      </xsl:if>
					      <!-- BEGIN BLANK Row C -->
					      <xsl:if test="count($Form8825Data/RentalAddressGrp) &lt; 3 or (($Print = $Separated) and (count($Form8825Data/RentalAddressGrp) &gt; 4)) ">

					      		<tr style="height:10mm; font-size:7pt;">
									<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:0; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
								<span class="styBoldText"> C </span>
								<span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:0; border-right:1 solid black; text-align:left;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0; border-right:1 solid black; text-align:center;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0; border-right:1 solid black; text-align:center;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; text-align:center; border-right-width:0px; border-bottom:0;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
								  </tr>

					      </xsl:if>
					      <!-- BEGIN BLANK Row D -->
					      <xsl:if test="count($Form8825Data/RentalAddressGrp) &lt; 4 or (($Print = $Separated) and (count($Form8825Data/RentalAddressGrp) &gt; 4)) ">
					      
					      		<tr style="height:10mm; font-size:7pt;">
									<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:0; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
								<span class="styBoldText"> D </span>
								<span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:0; border-right:1 solid black; text-align:left;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0; border-right:1 solid black; text-align:center;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:0; border-right:1 solid black; text-align:center;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
									<td class="styForm8825TableCellNoBorder" style="width:32mm; text-align:center; border-right-width:0px; border-bottom:0;" valign="bottom">
									  <span class="styTableCellPad"/>
									</td>
								  </tr>

					      </xsl:if>
				        </table>
			          </div>
			          <!-- BEGIN Line 2 -17 -->
					  <table class="styTable" cellspacing="0" style="border-color:black; border-top-width:2 solid black;" summary="Rental real estate properties income and expenses">
						<thead class="styTableThead">
						  <!--BEGIN Line Heading PROPERTIES-->
						  <tr>
							<th style="width:75mm; border:none; border-right-width:1px;border-top-width:1px solid black;" scope="col">  </th>
							<th style="width:7mm; height:5mm; border:none;" scope="col">
							  <span class="styTableCellPad"/>
							</th>
							<th class="styTableCellHeader" style="width:105mm; font-size:8pt; border-left-width:1px; border-right-width:0px;" colspan="4" scope="col">
						      Properties
							</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <!-- BEGIN Line Header-->
						  <tr>
						  	<th style="width:68mm; border:none; font-size:7pt; text-align:left; padding-left:8.25mm; font-weight:medium;" scope="col">
							  <span class="styBoldText">Rental Real Estate Income</span>
							</th>
							<th class="styForm8825TableCellSmallRB " style="width:5mm; border-left-width:0px; border-right-width: 0px;" scope="col">
							  <span class="styTableCellPad"/>
							</th>
							<xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp">
							  <xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
								<td class="styTableCellSmall" style="text-align: center;border-left-width: 1px;border-right-width: 0px;">
								  <xsl:call-template name="AddPositionNumber"/>
								  <span class="styTableCellPad"/>
								</td>
							  </xsl:if>
							</xsl:for-each>
							<xsl:if test="count($Form8825Data/RentalIncomeExpensesGrp[position() &gt;= $pos  and position() &lt; $pos+4]) = 1">
							  <xsl:choose>
								<xsl:when test="count($Form8825Data/RentalIncomeExpensesGrp) &lt; 2">
								  <td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
									<span class="styBoldText"> B </span>
									<span class="styTableCellPad"/>
								  </td>
								  <td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
									<span class="styBoldText"> C </span>
									<span class="styTableCellPad"/>
								  </td>
								  <td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
									<span class="styBoldText"> D </span>
									<span class="styTableCellPad"/>
								  </td>
								</xsl:when>
							    <xsl:otherwise>
								  <td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
								    <span class="styTableCellPad"/>
								  </td>
								  <td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
								    <span class="styTableCellPad"/>
								  </td>
								  <td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
								    <span class="styTableCellPad"/>
								  </td>
							    </xsl:otherwise>
							  </xsl:choose>
							</xsl:if>
							<xsl:if test="count($Form8825Data/RentalIncomeExpensesGrp[position() &gt;= $pos  and position() &lt; $pos+4]) = 2">
							  <xsl:choose>
								<xsl:when test="count($Form8825Data/RentalIncomeExpensesGrp) &lt; 3">
								  <td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
									<span class="styBoldText"> C </span>
									<span class="styTableCellPad"/>
								  </td>
								  <td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
									<span class="styBoldText"> D </span>
									<span class="styTableCellPad"/>
								  </td>
								</xsl:when>
								<xsl:otherwise>
								  <td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
									<span class="styTableCellPad"/>
							      </td>
								  <td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
									<span class="styTableCellPad"/>
								  </td>
								</xsl:otherwise>
							  </xsl:choose>
							</xsl:if>
							<xsl:if test="count($Form8825Data/RentalIncomeExpensesGrp[position() &gt;= $pos  and position() &lt; $pos+4]) = 3">
							  <xsl:choose>
								<xsl:when test="count($Form8825Data/RentalIncomeExpensesGrp) &lt; 4">
								  <td class="styTableCellSmall" style="text-align:center; border-left-width: 1px; border-right-width: 0px;">
									<span class="styBoldText"> D </span>
									<span class="styTableCellPad"/>
								  </td>
								</xsl:when>
							    <xsl:otherwise>
								  <td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
									<span class="styTableCellPad"/>
								  </td>
								</xsl:otherwise>
							  </xsl:choose>
							</xsl:if>
						  </tr>
						  <!-- BEGIN Line 2 -->						  
						  <tr>
							<td style="border:none;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm; font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">2</div>
								<div class="styGenericDiv" style="width:65mm;font-size:7pt;">
								  <span style="float:left">Gross rent</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB " style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">2</td>
							<td class="styTableCellSmall" style="font-size:6pt; vertical-align:bottom; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GrossRentsAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width: 0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/GrossRentsAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width: 0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/GrossRentsAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width: 0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/GrossRentsAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 3 -->
						  <tr>
							<td style="border:none;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt;width:7.75mm; text-align:left;padding-left:2mm;">3</div>
								<div class="styGenericDiv" style="width:65mm;font-size:7pt;">
								  <span style="float:left">Advertising</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB " style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px">3	</td>
							<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom; border-left-width:1px; border-right-width: 0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AdvertisingAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/AdvertisingAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/AdvertisingAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/AdvertisingAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 4 -->
						  <tr>
							<td style="border:none;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">4</div>
								<div class="styGenericDiv" style="width:65mm;font-size:7pt;">
								  <span style="float:left">Auto and travel</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB " style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">4</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AutoAndTravelAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/AutoAndTravelAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/AutoAndTravelAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/AutoAndTravelAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 5 -->
						  <tr>
							<td style="border:none;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm; font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">5</div>
								<div class="styGenericDiv" style="width:65mm;font-size:7pt;">
								  <span style="float:left">Cleaning and maintenance</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB " style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">5</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CleaningAndMaintenanceAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/CleaningAndMaintenanceAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/CleaningAndMaintenanceAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/CleaningAndMaintenanceAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 6 -->
						  <tr>
							<td style="border:none; font-size:7pt;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm; font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">6</div>
								<div class="styGenericDiv" style="width:65mm;">
								  <span style="float:left">Commissions</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px">6 </td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/CommissionsAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/CommissionsAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/CommissionsAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 7 -->
						  <tr>
							<td style="border:none; font-size:7pt;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm; font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">7</div>
								<div class="styGenericDiv" style="width:65mm;">
								  <span style="float:left">Insurance</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">7 </td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InsuranceAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/InsuranceAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/InsuranceAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/InsuranceAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 8 -->
						  <tr>
							<td style="border:none; font-size:7pt;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm; font-weight:bold; font-size:7pt; width:7.75mm; text-align:left; padding-left:2mm;">8</div>
								<div class="styGenericDiv" style="width:65mm; font-size:7pt;">
								  <span style="float:left;">Legal and other professional fees</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
							    </div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">8 </td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LegalAndProfessionalServiceAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/LegalAndProfessionalServiceAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/LegalAndProfessionalServiceAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/LegalAndProfessionalServiceAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 9 -->
						  <tr>
						    <td style="border:none; font-size:7pt;" scope="row">
							  <div>
							    <div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">9</div>
							    <div class="styGenericDiv" style="width:65mm;">
								  <span style="float:left;">Interest (see instructions)</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
							    </div>
							  </div>
						    </td>
						    <td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">9 </td>
						    <td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px;border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
							    <xsl:with-param name="TargetNode" select="InterestAmt"/>
							  </xsl:call-template>
						    </td>
						    <td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px;border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
							    <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/InterestAmt"/>
							  </xsl:call-template>
						    </td>
						    <td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px;border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
							    <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/InterestAmt"/>
							  </xsl:call-template>
						    </td>
						    <td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px;border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
							    <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/InterestAmt"/>
							  </xsl:call-template>
						    </td>
						  </tr>
						  <!-- BEGIN Line 10 -->
						  <tr>
							<td style="border:none;font-size:7pt;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm; font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">10</div>
								<div class="styGenericDiv" style="width:65mm;">
								  <span style="float:left">Repairs</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">10 </td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RepairsAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/RepairsAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/RepairsAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/RepairsAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 11-->
						  <tr>
							<td style="border:none;font-size:7pt;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm; font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">11</div>
								<div class="styGenericDiv" style="width:65mm;">
								  <span style="float:left">Taxes</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">11 </td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TaxesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/TaxesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/TaxesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/TaxesAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 12 -->
						  <tr>
							<td style="border:none;font-size:7pt;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm; font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">12</div>
								<div class="styGenericDiv" style="width:65mm;">
								  <span style="float:left">Utilities</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">12 </td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="UtilitiesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/UtilitiesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/UtilitiesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px;border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/UtilitiesAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 13 -->
						  <tr>	
							<td style="border:none;font-size:7pt;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm; font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">13</div>
								  <div class="styGenericDiv" style="width:65mm;">
									<span style="float:left">Wages and salaries</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
								  </div>
								</div>
							</td>
							<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">13 </td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="WagesAndSalariesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/WagesAndSalariesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/WagesAndSalariesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/WagesAndSalariesAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN New Line 14 -->
						  <tr>
							<td style="border:none;font-size:7pt;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:4mm; font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">14 </div>
								<div class="styGenericDiv" style="width:65mm;">
								  <span style="float:left">Depreciation (see instructions)</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">14 </td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <span style="text-align:left;padding-bottom:0mm;">
								<xsl:call-template name="SetFormLinkInline">
								  <xsl:with-param name="TargetNode" select="DepreciationAmt"/>
								</xsl:call-template>
							  </span>                    
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <span style="text-align:left; padding-bottom:0mm;">
								<xsl:call-template name="SetFormLinkInline">
								  <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/DepreciationAmt"/>
								</xsl:call-template>
							  </span>      
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/DepreciationAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <span style="text-align:left; padding-bottom:0mm;">
								<xsl:call-template name="SetFormLinkInline">
								  <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/DepreciationAmt"/>
								</xsl:call-template>
							  </span>      
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/DepreciationAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <span style="text-align:left; padding-bottom:0mm;">
								<xsl:call-template name="SetFormLinkInline">
								  <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/DepreciationAmt"/>
								</xsl:call-template>
							  </span>      
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/DepreciationAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 15 - A repeating Line-->
						   <!-- Form Design: Since Line 1 to Line 17 repeat as a GROUP it is redundant for Line 15 to display "See additional Data table" --> 
						  <!--  RowCount gives the total count of all the 'Other' s-->
						  <!--  Removed sum -->
						  <xsl:variable name="RowCount" select="(count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp) + 
							count($Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp) + 
							count($Form8825Data/RentalIncomeExpensesGrp[$pos+2]/OtherRentalRealEstExpenseGrp) + 
							count($Form8825Data/RentalIncomeExpensesGrp[$pos+3]/OtherRentalRealEstExpenseGrp))"/>
						  <!-- EMPTY rows -->
						  <!-- This "if loop" puts empty rows when there are no 'Other' elements-->
						  <xsl:if test="$RowCount=0">
							<xsl:choose>
							  <xsl:when test="position() mod 4=1">
								<td style="border:1 solid black; font-size:7pt; border-right-width:0px; border-top-width:0px; border-left-width:0px; border-bottom-width:1px" scope="row">
								  <div class="styGenericDiv" style="width:4mm; font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>
								  <div class="styGenericDiv">
								    Other (list)
								    <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
								    <span class="" style="width:45mm;border-bottom:1 solid black;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
									  </xsl:call-template>											
								    </span>
								    <span class="styTableCellPad"/>
								  </div>
								</td>
								<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">15 </td>
								<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width 0px;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
								  <span class="styTableCellPad"/>
								</td>														
							  </xsl:when>
							  <xsl:otherwise>
							    <td style="border:none; font-size:7pt;" scope="row">
								  <div class="styGenericDiv" style="width:8mm; font-weight:bold;"/>
								  <span class="styBB" style="width:29mm;">
								    <xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
									</xsl:call-template>
								  </span>
								  <span class="styTableCellPad"/>
								</td>
							  </xsl:otherwise>
							</xsl:choose>
						  </xsl:if>
						  <!-- Declare Variable -->
						  <xsl:variable name="FirstCol">
							<xsl:value-of select="count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp) "/>
						  </xsl:variable>
						  <xsl:variable name="SecondCol">
							<xsl:value-of select="count($Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp) "/>
						  </xsl:variable>
						  <xsl:variable name="ThirdCol">
						    <xsl:value-of select="count($Form8825Data/RentalIncomeExpensesGrp[$pos+2]/OtherRentalRealEstExpenseGrp) "/>
						  </xsl:variable>
						  <xsl:variable name="FourthCol">
							<xsl:value-of select="count($Form8825Data/RentalIncomeExpensesGrp[$pos+3]/OtherRentalRealEstExpenseGrp) "/>
						  </xsl:variable>
						  <!-- BEGIN Column A Loop-->
						  <xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp">
							<tr>
							  <xsl:choose>
								<xsl:when test="position()=1">
								  <td style="border:none; font-size:7pt;" scope="row">
									<xsl:if test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
									  <xsl:attribute name="style">border:1 solid black; font-size:7pt; border-right-width:0px; border-top-width:0px; border-left-width:0px; border-bottom-width:1px;</xsl:attribute>
									</xsl:if>
									<div class="styGenericDiv" style="width:4mm; font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15 </div>
									<div class="styGenericDiv">
									  Other (list)
									  <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
									  <span style="width:4px;"/>
									  <xsl:choose>
										<xsl:when test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
										  <span style="width:45mm;">
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
											</xsl:call-template>
										  </span>
										</xsl:when>
									    <xsl:otherwise>
										  <span style="width:45mm; border-bottom:1 solid black;">
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
											</xsl:call-template>
										  </span>
										</xsl:otherwise>
									  </xsl:choose>
									</div>
								  </td>
								  <td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; vertical-align:center; border-right-width:0px;">
									<xsl:attribute name="rowspan">
									  <xsl:value-of select="$RowCount"></xsl:value-of>
									</xsl:attribute>
									<span style="padding-left:.8mm;">15</span>
									<span class="styTableCellPad"/>
								  </td>
								</xsl:when>
								<xsl:otherwise>
								  <td style="border:none; font-size:7pt;" scope="row">
									<xsl:choose>
									  <xsl:when test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
										<xsl:attribute name="style">border:1 solid black; font-size:7pt; border-right-width:0px;border-top-width:0px; border-left-width:0px; border-bottom-width:1px</xsl:attribute>
										<span class="styTableCellPad" style="float:left; width:8mm;">&#160;</span>
										<span class="styFixedUnderline" style="width:62mm; border-bottom-width:0px;">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
										  </xsl:call-template>
										</span>
									  </xsl:when>
									  <xsl:otherwise>
										<span class="styTableCellPad" style="float:left; width:8mm;">&#160;</span>
										<span class="styFixedUnderline" style="width:62mm;">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
										  </xsl:call-template>
										</span>
										<span class="styTableCellPad"/>
									  </xsl:otherwise>
									</xsl:choose>
								  </td>
								</xsl:otherwise>
							  </xsl:choose>
							  <td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;" scope="row">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="OtherExpenseAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCellSmall" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCellSmall" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCellSmall" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							</tr>
						  </xsl:for-each>
						  <!-- BEGIN Column B Loop-->
						  <xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp">
							<tr>
							  <xsl:choose>
								<xsl:when test="(position()=1) and (count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp)=0)">
								  <td style="border:none; font-size:7pt;" scope="row">
									<xsl:if test="position()=last() and (($ThirdCol+$FourthCol) = 0)">
									  <xsl:attribute name="style">border:1 solid black; font-size:7pt; border-right-width:0px; border-top-width:0px; border-left-width:0px; border-bottom-width:1px</xsl:attribute>
									</xsl:if>
									<div class="styGenericDiv" style="width:5mm; font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>
									<div class="styGenericDiv">
									  Other (list) 
									  <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
									  <span style="width:4px;"/>
									  <xsl:choose>
										<xsl:when test="position()=last() and (($ThirdCol+$FourthCol) = 0)">
										  <span style="width:45mm;">
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
											</xsl:call-template>
										  </span>
										</xsl:when>
										<xsl:otherwise>
										  <span style="width:45mm; border-bottom:1 solid black;">
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
											</xsl:call-template>
										  </span>
										</xsl:otherwise>
									  </xsl:choose>
									</div>
								  </td>
								  <td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold;">
									<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"> </xsl:value-of></xsl:attribute>
									<span style="text:align:right;">15</span>
									<span class="styTableCellPad"/>
								  </td>
								</xsl:when>
								<xsl:otherwise>
								  <td style="border:none;font-size:7pt;" scope="row">
									<xsl:choose>
									  <xsl:when test="position()=last() and ($ThirdCol+$FourthCol) = 0">
										<xsl:attribute name="style">border:1 solid black; font-size:7pt; border-right-width:0px; border-top-width:0px; border-left-width:0px; border-bottom-width:1px</xsl:attribute>										  <span class="styTableCellPad" style="float:left; width:8mm;">&#160;</span>
										<span class="styFixedUnderline" style="width:62mm; border-bottom:0px solid black;">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
										  </xsl:call-template>
										</span>
									  </xsl:when>
									  <xsl:otherwise>
										<span class="styTableCellPad" style="float:left; width:8mm;">&#160;</span>
										<span class="styFixedUnderline" style="width:62mm;">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
										  </xsl:call-template>
										</span>
										<span class="styTableCellPad"/>
									  </xsl:otherwise>
									</xsl:choose>
								  </td>
								</xsl:otherwise>
							  </xsl:choose>
							  <td class="styTableCellSmall" scope="row" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;" scope="row">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="OtherExpenseAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCellSmall" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCellSmall" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							</tr>
						  </xsl:for-each>
						  <!-- BEGIN Column C Loop-->
						  <xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp[$pos+2]/OtherRentalRealEstExpenseGrp">
							<tr>
							  <xsl:choose>
								<xsl:when test="(position()=1) and ( (count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp) +                 count($Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp) )=0)">
								  <td style="border:none; font-size:7pt;" scope="row">
									<xsl:if test="position()=last() and (($FourthCol) = 0)">
									  <xsl:attribute name="style">border:1 solid black; font-size:7pt; border-right-width:0px; border-top-width:0px; border-left-width:0px; border-bottom-width:1px</xsl:attribute>
									</xsl:if>
									<div class="styGenericDiv" style="width:5mm; font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15 </div>
									<div class="styGenericDiv">
									  Other (list) 
									  <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
									  <span style="width:4px;"/>
									  <xsl:choose>
										<xsl:when test="position()=last() and (($FourthCol) = 0)">
										  <span style="width:45mm;">
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
											</xsl:call-template>
										  </span>
										</xsl:when>
										<xsl:otherwise>
										  <span style="width:45mm; border-bottom:1 solid black;">
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
											</xsl:call-template>
										  </span>
										</xsl:otherwise>
									  </xsl:choose>
									</div>
								  </td>
								  <td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold;">
									<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"> </xsl:value-of></xsl:attribute>
									<span style="text:align:right;">15</span>
									<span class="styTableCellPad"/>
								  </td>
								</xsl:when>
								<xsl:otherwise>
								  <td style="border:none; font-size:7pt;" scope="row">
									<xsl:choose>
									  <xsl:when test="position()=last() and (($FourthCol) = 0)">
										<xsl:attribute name="style">border:1 solid black; font-size:7pt; border-right-width:0px; border-top-width:0px; border-left-width:0px; border-bottom-width:1px</xsl:attribute>										  <span class="styTableCellPad" style="float:left; width:8mm;">&#160;</span>
										<span class="styFixedUnderline" style="width:62mm; border-bottom:0px solid black;">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
										  </xsl:call-template>
										</span>
									  </xsl:when>
									  <xsl:otherwise>
										<span class="styTableCellPad" style="float:left; width:8mm;">&#160;</span>
										<span class="styFixedUnderline" style="width:62mm;">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
										  </xsl:call-template>
										</span>
										<span class="styTableCellPad"/>
									  </xsl:otherwise>
									</xsl:choose>
								  </td>
								</xsl:otherwise>
							  </xsl:choose>
							  <td class="styTableCellSmall" scope="row" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCellSmall" scope="row" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;" scope="row">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="OtherExpenseAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCellSmall" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							</tr>
						  </xsl:for-each>
						  <!-- BEGIN Column D Loop-->
						  <xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp[$pos+3]/OtherRentalRealEstExpenseGrp">
							<tr>
							  <xsl:choose>
								<xsl:when test="(position()=1) and 
								  ( (count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp) + 
								  count($Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp) + 
								  count($Form8825Data/RentalIncomeExpensesGrp[$pos+2]/OtherRentalRealEstExpenseGrp) )=0)">
								  <td style="border:none; font-size:7pt;" scope="row">
									<xsl:if test="position()=last()">
									  <xsl:attribute name="style">border:1 solid black; font-size:7pt; border-right-width:0px; border-top-width:0px; border-left-width:0px; border-bottom-width:1px</xsl:attribute>
									</xsl:if>
									<div class="styGenericDiv" style="width:5mm; font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>
									<div class="styGenericDiv">
									  Other (list) 
									  <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
									  <span style="width:4px;"/>
									  <xsl:choose>
										<xsl:when test="position()=last()">
										  <span style="width:45mm;">
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
											</xsl:call-template>
										  </span>
										</xsl:when>
										<xsl:otherwise>
										  <span style="width:45mm; border-bottom:1 solid black;">
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
											</xsl:call-template>
										  </span>
										</xsl:otherwise>
									  </xsl:choose>
									</div>
								  </td>
								  <td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold;">
									<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"/></xsl:attribute>
									<span style="text-align:right;">15</span>
									<span class="styTableCellPad"/>
								  </td>
								</xsl:when>
								<xsl:otherwise>
								  <td style="border:none; font-size:7pt;" scope="row">
									<xsl:choose>
									  <xsl:when test="position()=last()">
										<xsl:attribute name="style">border:1 solid black; font-size:7pt; border-right-width:0px;border-top-width:0px; border-left-width:0px; border-bottom-width:1px;</xsl:attribute>   
										<span class="styTableCellPad" style="float:left; width:8mm;">&#160;</span>
										<span class="styFixedUnderline" style="width:62mm; border-bottom:0px solid black;">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
										  </xsl:call-template>
										</span>
									  </xsl:when>
									  <xsl:otherwise>
										<span class="styTableCellPad" style="float:left; width:8mm;">&#160;</span>
										<span class="styFixedUnderline" style="width:62mm;">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
										  </xsl:call-template>
										</span>
										<span class="styTableCellPad"/>
									  </xsl:otherwise>
									</xsl:choose>
								  </td>
								</xsl:otherwise>
							  </xsl:choose>
							  <td class="styTableCellSmall" scope="row" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCellSmall" scope="row" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCellSmall" scope="row" style="border-left-width:1px; border-right-width:0px;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;" scope="row">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="OtherExpenseAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
						  </xsl:for-each>
						  <!-- End of row 15-->
						  <!-- BEGIN Line 16-->
						  <tr>
						    <td style="border:none; font-size:7pt;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:7.75mm; font-weight:bold; padding-left:.75mm;">16</div>
								<div class="styGenericDiv" style="width:65mm;">
								  Total expenses for each property. Add lines 3 <br/>
								  <span style="float:left">through 15</span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right; padding-right:1mm;">............</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">16 </td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <br/>
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotalExpensesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <br/>
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/TotalExpensesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <br/>
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/TotalExpensesAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <br/>
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/TotalExpensesAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						  <!-- BEGIN Line 17-->
						  <tr>
							<td style="border:none; font-size:7pt;" scope="row">
							  <div>
								<div class="styGenericDiv" style="width:7.75mm; font-weight:bold; padding-left:.75mm;">17</div>
								<div class="styGenericDiv" style="width:65mm;">
								  Income or (Loss) from each property. Subtract line<br/>
								  <span style="float:left">16 from line 2 </span>
								  <!--Dotted Line-->
								  <div class="styDotLn" style="float:right; padding-right:1mm;">...........</div>
								</div>
							  </div>
							</td>
							<td class="styForm8825TableCellSmallRB" style="width:5mm; font-size:7pt; font-weight:bold; border-right-width:0px;">17 </td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-bottom-width:1px; border-right-width:0px;">
							  <br/>
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IncomeOrLossAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <br/>
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/IncomeOrLossAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <br/>
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/IncomeOrLossAmt"/>
							  </xsl:call-template>
							</td>
							<td class="styTableCellSmall" style="font-size:6pt; border-left-width:1px; border-right-width:0px;">
							  <br/>
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/IncomeOrLossAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						</tbody>
					  </table>
					</xsl:if>
				  </xsl:for-each>
				</div>
			  </xsl:if>
			</xsl:if>
			<!--When there is no data -->
			<!-- Begin empty rows -->
			<!-- If the Print parameter is Separated and the number of elements is greater than the container size, then -->
			<!-- display a message in the first row directing the user to the additional data table -->
			<!-- ************************************************ -->
			<xsl:if test="not($Form8825Data/RentalIncomeExpensesGrp) or (($Print = $Separated) and (count($Form8825Data/RentalIncomeExpensesGrp) &gt; 4)) ">
			  <!-- ************************************************ -->
			  <div class="styBB" style="width:187mm; clear:both; float:none; border-top:1 solid black;">
				<table class="styTable" cellspacing="0" cellname="TYTable" id="TYTable" summary="Table for displaying the kind and location of each property">
				  <thead>
					<tr style="border-bottom:1 solid black; height:8mm;">
					  <th class="styTableCellHeader" style="width:8mm; text-align:center; vertical-align:top; font-size:7pt; border-right:1 solid black; border-bottom:0 solid black;" rowspan="2" colspan="1" scope="col">1</th>
					  <th class="styTableCellHeader" style="width:182mm; border-right-width:0px; font-weight:normal; font-size:7pt; text-align:left; padding-left:1mm" colspan="4" scope="col">
						Show the type and address of each property. For each rental real estate property listed, report the number of days rented at fair rental value and days with personal use.
						See instructions. See page 2 to list additional properties.
					  </th>
					</tr>
					<tr>
					  <th class="styTableCellHeader" style="width:82mm; font-size:7pt; border-bottom:0 solid black; border-right:1 solid black;" scope="col">
						<span style="font-weight:normal; text-align:left; padding-left:1mm;">
						  Physical address of each property &#8212; street, city, state, ZIP code 
						</span>
					  </th>
					  <th class="styTableCellHeader" style="width:36mm; font-size:7pt; border-bottom:0 solid black; border-right:1 solid black;">
						<span style="font-weight:normal;" scope="col">Type&#8212;Enter code 1&#8212; 8; see page 2 for list </span>
					  </th>
					  <th class="styTableCellHeader" style="width:32mm; font-size:7pt; border-bottom:0 solid black; border-right:1 solid black;">
						<span style="font-weight:normal;" scope="col">Fair Rental Days </span>
					  </th>
					  <th class="styTableCellHeader" style="width:36mm; font-size:7pt; border-bottom:0 solid black; border-right-width:0;">
						<span style="font-weight:normal;" scope="col">Personal Use Days </span>
					  </th>
					</tr>
				  </thead>
				  <tfoot/>
				  <tbody>
					<!-- BEGIN Line 1 -->
					<!-- If the Print parameter is not set to be Separated, or there are fewer elements than the container height -->
					<xsl:if test="($Print != $Separated) or (count($Form8825Data/RentalAddressGrp) &lt;= 4) ">
					  <xsl:for-each select="$Form8825Data/RentalAddressGrp">
						<tr style="height:8mm; font-size:7pt;">
						  <td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:1 solid black; border-right:1 solid black; text-align:left; padding-left:3.5mm;">
							<xsl:if test="(position() = count($Form8825Data/RentalAddressGrp)) and (count($Form8825Data/RentalAddressGrp) &gt;= 4)">
							  <xsl:attribute name="style">width:5mm; border-right:1 solid black; text-align:left; padding-left:3.5mm;</xsl:attribute>
						    </xsl:if>
							<xsl:call-template name="AddPositionNumber"/>
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:1 solid black; border-right:1 solid black; text-align:left;" valign="bottom">
							<xsl:if test="(position() = count($Form8825Data/RentalAddressGrp)) and (count($Form8825Data/RentalAddressGrp) &gt;= 4)">
							  <xsl:attribute name="style">width:82mm; border-right:1 solid black; text-align:left;</xsl:attribute>
							</xsl:if>
							<xsl:choose>
							  <xsl:when test="USAddress">
								<xsl:call-template name="PopulateUSAddressTemplate">
								  <xsl:with-param name="TargetNode" select="USAddress"/>
							    </xsl:call-template>
							  </xsl:when>
							  <xsl:otherwise>
								<xsl:call-template name="PopulateForeignAddressTemplate">
								  <xsl:with-param name="TargetNode" select="ForeignAddress"/>
								</xsl:call-template>
							  </xsl:otherwise>
							</xsl:choose>
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styForm8825TableCellNoBorder" style="width:32mm;border-bottom:1 solid black;border-right:1 solid black;text-align:center;" valign="bottom">
							<xsl:if test="(position() = count($Form8825Data/RentalAddressGrp)) and (count($Form8825Data/RentalAddressGrp) &gt;= 4)">
							  <xsl:attribute name="style">width:32mm; border-right:1 solid black; text-align:center;</xsl:attribute>
							</xsl:if>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="RentalTypeDesc"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1 solid black; border-right:1 solid black; text-align:center;" valign="bottom">
							<xsl:if test="(position() = count($Form8825Data/RentalAddressGrp)) and (count($Form8825Data/RentalAddressGrp) &gt;= 4)">
							  <xsl:attribute name="style">width:32mm;border-right:1 solid black;text-align:center;</xsl:attribute>
							</xsl:if>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="FairRentalDaysCnt"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1 solid black; text-align:center;" valign="bottom">
							<xsl:if test="(position() = count($Form8825Data/RentalAddressGrp)) and (count($Form8825Data/RentalAddressGrp) &gt;= 4)">
							  <xsl:attribute name="style">text-align:center;</xsl:attribute>
							</xsl:if>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="PersonalUseDaysCnt"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<!-- If no element in table is populated with data, setting width to 182mm in the first blank row will force the table lines to extend to the right side of the page.-->
					<!-- If the Print parameter is Separated and the number of rows is more than 4, display a message in the -->
					<!-- first blank row directing the user to the additional data table -->
					<xsl:if test="count($Form8825Data/RentalAddressGrp) &lt; 1 or (($Print = $Separated) and (count($Form8825Data/RentalAddressGrp) &gt; 4)) ">
					  <tr style="height:6mm;font-size:7pt;">
						<td class="styForm8825TableCellNoBorder" style="width:5mm;border-right:1 solid black;border-bottom:0 solid black;text-align:left;padding-left:3.5mm;">
						  <span class="styBoldText"> A </span>
						  <span class="styTableCellPad"/>
						</td>
						<xsl:choose>
						  <xsl:when test="($Print = $Separated)">
							<td class="styForm8825TableCellNoBorder" style="width:82mm;text-align:left;border-right:1 solid black;border-bottom:0 solid black;">
							  <xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styForm8825TableCellNoBorder" style="width:82mm;text-align:left;border-right:1 solid black;border-bottom:0;">
														<span class="styTableCellPad"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left;border-right:1 solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left;border-right:1 solid black;border-bottom:0">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left;border-right-width:0px;border-bottom:0">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8825Data/RentalAddressGrp) &lt; 2 or (($Print = $Separated) and (count($Form8825Data/RentalAddressGrp) &gt; 4)) ">
										<tr style="height:6mm;font-size:7pt;">
											<td class="styForm8825TableCellNoBorder" style="width:5mm;text-align:left;padding-left:3.5mm;border-right:1 solid black;border-bottom:0;">
												<span class="styBoldText"> B </span>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:82mm;text-align:left;border-right:1 solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left;border-right:1 solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left;border-right:1 solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left;border-right-width:0px;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8825Data/RentalAddressGrp) &lt; 3 or (($Print = $Separated) and (count($Form8825Data/RentalAddressGrp) &gt; 4)) ">
										<tr style="height:6mm;font-size:7pt;">
											<td class="styForm8825TableCellNoBorder" style="width:5mm;text-align:left;padding-left:3.5mm;border-right:1 solid black;border-bottom:0;">
												<span class="styBoldText"> C </span>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:82mm;text-align:left;border-right:1 solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left;border-right:1 solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left;border-right:1 solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left; border-right-width:0px;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8825Data/RentalAddressGrp) &lt; 4 or (($Print = $Separated) and (count($Form8825Data/RentalAddressGrp) &gt; 4)) ">
										<tr style="height:6mm;font-size:7pt;">
											<td class="styForm8825TableCellNoBorder" 
											style="width:5mm;text-align:left;padding-left:3.5mm;border-bottom-width:0px;padding-top:2mm;">
												<span class="styBoldText"> D </span>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:82mm;text-align:left;border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left;border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" style="width:32mm;text-align:left;border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8825TableCellNoBorder" 
											style="width:32mm;text-align:left;border-bottom-width:0px;border-right-width:0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
							<!--Set initial height of the Kind and Location of each property table-->
						</div>
					<!-- ************************************************ -->
						<div class="styGenericDiv" style="clear:both;float:none;width:187mm;">
							<table cellspacing="0" class="styTable" style="border-color:black;border" summary="Table for displaying the rental real estate properties there income and expenses">
								<thead class="styTableThead">
									<tr>
										<th style="width:80mm;border:none;border-right-width: 1px;" scope="col">  </th>
										<th style="width:7mm;height:5mm;border: black solid 1px; border-left-width:0px; border-top-width:0px;border-bottom-width:0px;" scope="col">
											<span class="styTableCellPad"/>
										</th>
										<th class="styTableCellHeader" style="width:100mm;font-size:8pt;border-left-width: 0px;border-right-width: 0px;" colspan="4" scope="col">
										  Properties
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<tr style="border-right-width: 0;">
										<th style="width:68mm;border:none;font-size:7pt;text-align:left;padding-left:8.25mm;font-weight:medium;" scope="col">
											<span class="styBoldText">Rental Real Estate Income</span>
										</th>
										<th class="styForm8825TableCellSmallRB " style="width:5mm;border-left-width: 0px;" scope="col">
											<span class="styTableCellPad"/>
										</th>
										<td class="styTableCellSmall" style="text-align:center;">
											<span class="styBoldText"> A </span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="text-align:center;">
											<span class="styBoldText"> B </span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="text-align:center;">
											<span class="styBoldText"> C </span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="text-align:center;border-right-width: 0;">
											<span class="styBoldText"> D </span>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 2 -->
									<tr style="border:none;height:4mm">
										<td style="border:none;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">2</div>
												<div class="styGenericDiv" style="width:71mm;font-size:7pt;">
													<span style="float:left">Gross rents</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">2<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;float:left;height:4mm;">
											<xsl:if test="($Print = $Separated)">
												<span style="float:left;">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp"/>
														<xsl:with-param name="ShortMessage" select="'true'"/>
													</xsl:call-template>
												</span>
											</xsl:if>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 3 -->
									<tr>
										<td style="border:none;" scope="row">
											<div>
												<br/>
												<span class="styBoldText;" style="font-size:7pt;text-align:left;padding-left:8mm;font-weight:bold;">Rental Real Estate Expenses</span>
												<br/>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">3</div>
												<div class="styGenericDiv" style="width:71mm;font-size:7pt;">
													<span style="float:left">Advertising</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">
											<br/>3<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 4 -->
									<tr>
										<td style="border:none;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">4</div>
												<div class="styGenericDiv" style="width:71mm;font-size:7pt;">
													<span style="float:left">Auto and travel</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">4<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!--line 5 -->
									<tr>
										<td style="border:none;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">5</div>
												<div class="styGenericDiv" style="width:71mm;font-size:7pt;">
													<span style="float:left">Cleaning and maintenance</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">5<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 6 -->
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">6</div>
												<div class="styGenericDiv" style="width:71mm;">
													<span style="float:left">Commissions</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">6<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 7 -->
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">7</div>
												<div class="styGenericDiv" style="width:71mm;">
													<span style="float:left">Insurance</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">7<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 8 -->
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">8</div>
												<div class="styGenericDiv" style="width:71mm;font-size:7pt;">
													<span style="float:left">Legal and other professional fees</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">8<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 9 -->
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">9</div>
												<div class="styGenericDiv" style="width:71mm;">
													<span style="float:left">Interest</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">9<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 10 -->
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">10</div>
												<div class="styGenericDiv" style="width:71mm;">
													<span style="float:left">Repairs</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">10<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 11 -->
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">11</div>
												<div class="styGenericDiv" style="width:71mm;">
													<span style="float:left">Taxes</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">11<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 12 -->
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">12</div>
												<div class="styGenericDiv" style="width:71mm;">
													<span style="float:left">Utilities</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">12<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 13 -->
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">13</div>
												<div class="styGenericDiv" style="width:71mm;">
													<span style="float:left">Wages and salaries</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">13<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 14 -->
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">14</div>
												<div class="styGenericDiv" style="width:71mm;">
													<span style="float:left">Depreciation (see instructions)</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
												</div>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
										  14<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span style="text-align:left;padding-bottom:0mm;"></span>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span style="text-align:left;padding-bottom:0mm;"></span>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<span style="text-align:left;padding-bottom:0mm;"></span>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<span style="text-align:left;padding-bottom:0mm;"></span>
										</td>
									</tr>
									<!--Row 15 Empty -->
									<!-- Form Design: Since Line 2 to Line 17 repeat as a GROUP it is redundant for Line 15 to display "See additional Data table" --> 
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>
											<div class="styGenericDiv">Other (list)
												<img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
												<span style="width:4px;"/>
											</div>
											<div style="width:48.5mm;border-bottom:1 solid black;">
												<br/>
												<!--<xsl:if test="($Print = $Separated)">
													<span style="float:left;">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$Form8825Data"/>
														</xsl:call-template>
													</span>
												</xsl:if>-->
												<span style="width:4px;"/>
											</div>
										</td>
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;vertical-align: center;" rowspan="3">
											<span style="padding-right:1mm">15</span>
										</td>
										<td class="styTableCellSmall">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div class="styGenericDiv" style="width:7.75mm;font-weight:bold;">
                      </div>
											<div class="styGenericDiv" style="width:71mm;font-weight:bold;border-bottom:1 solid black;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" scope="row">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;" scope="row">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div class="styGenericDiv" style="width:7.75mm;font-weight:bold;">
                      </div>
											<div class="styGenericDiv" style="width:71mm;font-weight:bold;border-bottom:1 solid black;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" scope="row">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" scope="row">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;" scope="row">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-right-width: 0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- End of row 15-->
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:7.75mm;font-weight:bold;padding-left:.75mm">16</div>
												<div class="styGenericDiv" style="width:71mm;">
												  Total expenses for each property. Add lines 3 <br/>
													<span style="float:left">through 15</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
												</div>
											</div>
										</td>
										<!-- line 16 -->
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">16<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<br/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<br/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<br/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="border:none;font-size:7pt;" scope="row">
											<div>
												<div class="styGenericDiv" style="width:7.75mm;font-weight:bold;padding-left:.75mm">17</div>
												<div class="styGenericDiv" style="width:71mm;">
                          Income or (Loss) from each property. Subtract line<br/>
													<span style="float:left">16 from line 2 </span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
												</div>
											</div>
										</td>
										<!-- line 17 -->
										<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">17<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<br/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<br/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;">
											<br/>
										</td>
										<td class="styTableCellSmall" style="font-size:6pt;border-right-width: 0;">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<!--/div-->
						</div>
					</xsl:if>
					<!-- ************************************************ -->
					<!-- ************************************************ -->
					<!-- End empty rows-->
					<!-- Begin the right amount boxes outside of table above -->
					<!-- line 18a -->
					<div class="styGenericDiv" style="clear:both;float:none;width:187mm;">
						<div class="styLNLeftNumBox">18a</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left">Total gross rents.  Add gross rents from line 2, columns A through H</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
						</div>
						<div class="styLNRightNumBox">18a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/TotalGrossRentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 18b -->
					<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="text-align: right; padding-right: 2mm;">b</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left">Total expenses.  Add total expenses from line 16, columns A through H</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
						</div>
						<div class="styLNRightNumBox">18b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form8825Data/TotalExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 19 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:139mm;">
              Net gain (loss) from Form 4797, Part II, line 17, from the disposition of property from rental real estate
              <br/>
							<span style="float:left">activities</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...............................</div>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">19</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/NetGainLossFrom4797Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 20 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">20a</div>
						<div class="styLNDesc" style="width:139mm;">
            Net income (loss) from rental real estate activities from partnerships, estates, and trusts in which this<br/>
							<span style="float:left">partnership or S corporation is a partner or beneficiary (from Schedule K-1)</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">20a</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8825Data/RealEstateNetIncomeLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="text-align:right; padding-right:2mm;">b</div>
						<div class="styLNDesc" style="width:139mm;">
							Identify below the partnerships, estates, or trusts from which net income (loss) is shown on line 20a.<br/>
							Attach a schedule if more space is needed:  
							<span style="width:290px;"/>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm; background-color:lightgrey; height:8mm; border-color:black; border-right-width:1px;"/>
					</div>
					<!-- Line 20b Table -->
					<!-- HINTs: Due to IE11automatic height adjustment is not working properly therefore, each row height is manually set at 13mm for maximum amount of data display to resolve defect 48225 -->
					<div class="styForm8825TableContainer" style="padding-left:8mm; border-bottom-width:0px;" id="PSTPctn">
						<table class="styTable" style="float:none; font-size: 7pt;" cellspacing="0" 
						summary="Table for partnerships, estates or trusts from which net income or loss is shown on line 20a">
							<thead class="styTableThead">
								<tr>
									<th class="styTablesCells" scope="col" style="width:69mm; text-align:left;">
										<span class="styBoldText">(1)</span>
										<span style="font-weight:normal;"> Name </span>
									</th>
									<th class="styTablesCells" scope="col" style="width:6mm;">
										<span style="width:4px;">  </span>
									</th>
									<th class="styTablesCells" scope="col" style="width:46.5mm;">
										<span class="styBoldText">(2)</span>
										<span style="font-weight:normal; font-size:7pt;"> Employer identification number</span>
									</th>
									<th class="styTablesCells" scope="col" style="width:35mm; padding-left:17.5mm; padding-top:0px; padding-bottom:0px; height:4mm;">
										<div class="styLNRightNumBoxNBB" style="width:8.25mm; background-color:lightgrey; border-right-width:1px; height:100%; "/>
									</th>
								   <!--<xsl:choose>
									 <xsl:when test="count($Form8825Data/IdentifyPartnershipEstateTrGrp) &lt; 1 or ($Print = $Separated) ">
										<th class="styTablesCells" scope="col" style="width:35mm; padding-left:17.5mm; padding-top:0px; padding-bottom:0px;">
											<div class="styLNRightNumBoxNBB" style="width:8.25mm; background-color:lightgrey; height:8mm; border-color:black; border-right-width:1px;"/>
										</th>
									 </xsl:when>
									 <xsl:otherwise>
										<th class="styTablesCells" scope="col" style="width:35mm; padding-left:16.5mm; padding-top:0px; padding-bottom:0px;">
											<div class="styLNRightNumBoxNBB" style="width:8.25mm; height:8mm; background-color:lightgrey; border-color:black; border-right-width:1px;"/>
										</th>
									 </xsl:otherwise>
								   </xsl:choose>-->
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- If the Print parameter is not set to be Separated, or there are fewer elements than the container height -->
								<xsl:if test="($Print != $Separated) or (count($Form8825Data/IdentifyPartnershipEstateTrGrp) &lt;= 3) ">
									<xsl:for-each select="$Form8825Data/IdentifyPartnershipEstateTrGrp">
										<tr>
											<td class="styTablesCells" scope="row" style="width:69mm; height:13mm; border-bottom:1px solid black; ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test=" BusinessName/BusinessNameLine2Txt !=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTablesCells" scope="row" style="width:6mm;"></td>
											<td class="styTablesCells" scope="row" style="width:46.5mm; border-bottom:1px solid black; text-align:left; padding-left:6mm;">
												<xsl:choose>
													<xsl:when test="normalize-space(EIN)">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
														<span style="width: 2px"/>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTablesCells" scope="row" style="width:35mm; padding-left:17.5mm; padding-top:0px; padding-bottom:0px; height:13mm;">
												<div class="styLNRightNumBoxNBB" style="width:8.25mm; height:13mm; background-color:lightgrey; border-right-width:1px; padding-top:0px; padding-bottom:0px;">
												</div>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--empty rows for separated data -->
								<!--Filler rows when elements do not exist-->
								<!-- If the Print parameter is Separated and the number of elements is greater than the container -->
								<!-- height, then display a message in the first row directing the user to the additional data table -->
								<xsl:if test="count($Form8825Data/IdentifyPartnershipEstateTrGrp) &lt; 1 or (($Print = $Separated) and (count($Form8825Data/IdentifyPartnershipEstateTrGrp) &gt; 3)) ">
									<tr style="">
										<td class="styTablesCells" scope="row" style="width 69mm; border-bottom:1px solid black; ">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8825Data/IdentifyPartnershipEstateTrGrp"/>
											</xsl:call-template>
											<span style="width:4px;"/>
										</td>
										<td class="styTablesCells" scope="row" style="width:6mm;">
											<span style="width:4px;">  </span>
										</td>
										<td class="styTablesCells" scope="row" style="width:46.5mm; border-bottom:1px solid black; text-align:center;">
											<span style="width:4px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTablesCells" scope="row" style="width: 35mm; padding-left:17.5mm; padding-top:0px; padding-bottom:0px; height:4mm;">
											<div class="styLNRightNumBoxNBB" style="width:8.25mm; background-color:lightgrey; border-right-width:1px; height:100%;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8825Data/IdentifyPartnershipEstateTrGrp) &lt; 2 or (($Print = $Separated) and (count($Form8825Data/IdentifyPartnershipEstateTrGrp) &gt; 3)) ">
									<tr>
										<td class="styTablesCells" scope="row" style="width:69mm; border-bottom:1px solid black;">
											<span style="width:4px;"/>
										</td>
										<td class="styTablesCells" scope="row" style="width:6mm;">
											<span style="width:4px;">  </span>
										</td>
										<td class="styTablesCells" scope="row" style="width:46.5mm; border-bottom:1px solid black; text-align:center;">
											<span style="width:4px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTablesCells" scope="row" style="width:35mm; padding-left:17.5mm; padding-top:0px; padding-bottom:0px; height:4mm;">
											<div class="styLNRightNumBoxNBB" style="width:8.25mm; background-color:lightgrey; height:7mm; border-right-width:1px; height:100%;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8825Data/IdentifyPartnershipEstateTrGrp) &lt; 3 or (($Print = $Separated) and (count($Form8825Data/IdentifyPartnershipEstateTrGrp) &gt; 3)) ">
									<tr style="height:4mm;">
										<td class="styTablesCells" scope="row" style="width:69mm; border-bottom:1px solid black;">
											<span style="width:4px;"/>
										</td>
										<td class="styTablesCells" scope="row" style="width:6mm;">
											<span style="width:4px;">  </span>
										</td>
										<td class="styTablesCells" scope="row" style="width:46.5mm; border-bottom:1px solid black;text-align:center;">
											<span style="width:4px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTablesCells" scope="row" style="width: 35mm; padding-left:17.5mm; padding-top:0px; padding-bottom:0px; height:4mm">
											<div class="styLNRightNumBoxNBB" style="width:8.25mm; background-color:lightgrey; border-right-width:1px; height:100%;"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- line 21 -->
					<div class="styBB" style="clear:both; float:none; width:187mm; height:10mm; border-bottom-width:1.5px;">
						<div style="width:187mm;clear:both;">
							<div class="styLNLeftNumBox" style="height:9.5mm;">21</div>
							<div class="styLNDesc" style="width:139mm;">
								Net rental real estate income (loss). Combine lines 18a through 20a.  Enter the result here and on:          
								<span style="padding-left:3.5mm;"><li> <span class="styBoldText"> Form 1065 or 1120S:</span> Schedule K, line 2 </li>
								  <!--<li> <span class="styBoldText"> Form 1065-B:</span> Part I, line 4 </li>-->
								</span>
							</div>
							<div style="float:right;width:40mm;">
								<div class="styLNRightNumBox" style="width:8mm; height:4.75mm;">21</div>
								<div class="styLNAmountBox" style="width:32mm; height:4.75mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8825Data/NetIncomeLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" 
								style="width:8mm; background-color:lightgrey; border-right-width:0px; height:5.25mm; border-bottom-width:1.5px;"/>
								<div class="styLNAmountBoxNBB" 
								style="width:32mm; background-color:lightgrey; border-left-width:0px; height:5.25mm; border-bottom-width:1.5px;"/>
							</div>
						</div>
					</div>
					<!-- End the amount boxes -->
					<!-- capturing the page bottom info -->
					<div style="width:187mm;">
						<div style="width:105mm; float:left; clear:none;">
							<span class="styBoldText"> For Paperwork Reduction Act Notice, see instructions. </span>
						</div>
						<div style="width:40mm; float:left; clear:none;">Cat. No. 10136Z</div>
						<div style="width:40mm; float:left; clear:none;">
							<span style="width:40px;"/>
							  Form <span class="styBoldText">8825</span> (11-2018)
						</div>
					</div>
					<br/>
					<p style="page-break-before:always"/>
          			<br class="pageEnd"/>
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
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8825Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- ================================================== -->
					<!--SEPARATED DATA -->
					<!-- ================================================== -->
					<xsl:if test="($Print = $Separated) and (count($Form8825Data/RentalAddressGrp) &gt;4) ">
						<div class="styGenericDiv" style="width:187mm;">
							<xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp">
								<xsl:variable name="pos" select="position()"/>
								<xsl:if test="position() mod 4 = 1">
									<xsl:variable name="conID" select="concat('RentTableID', $pos)"/>
									<xsl:variable name="imgID" select="concat('RentImgID', $pos)"/>
									<xsl:variable name="btnID" select="concat('RentBtnID', $pos)"/>
									<xsl:variable name="OtherRowCount" select="(count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp)            + count($Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp)           + count($Form8825Data/RentalIncomeExpensesGrp[$pos+2]/OtherRentalRealEstExpenseGrp)            + count($Form8825Data/RentalIncomeExpensesGrp[$pos+3]/OtherRentalRealEstExpenseGrp))"/>
									<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
									<span class="styRepeatingDataTitle">
										<br/>Form 8825, Line 1 - Show the kind and location of each property:
            </span>
									<table class="styDepTbl" style="font-size:7pt;">
										<thead class="styTableThead">
											<tr class="styDepTblHdr" style="border-bottom:1px solid black">
												<th class="styTableCellHeader" style="width:5mm; text-align:left; padding-left:3.5mm; font-size:7pt; border-right:1px solid black;" rowspan="2" colspan="1" scope="col">1</th>
												<th class="styTableCellHeader" style="width:182mm; border-right-width: 0px; font-weight:normal; font-size:7pt; text-align:left;" colspan="4" scope="col">
                   Show the type and address of each property. For each rental real estate property
				  listed, report the number of days rented at fair rental value and days with personal use.
				  See instructions. See page 2 to list additional properties.</th>
											</tr>
											<tr class="styDepTblHdr">
												<th class="styTableCellHeader" style="width:82mm; font-size:7pt; border-bottom:1px solid black; border-right:1px solid black;" scope="col">(i)<br/>
													<span style="font-weight:normal;">Physical address of each property — street, city, state, ZIP code </span>
												</th>
												<th class="styTableCellHeader" style="width:32mm; font-size:7pt; border-bottom:1px solid black; border-right:1px solid black;" scope="col">(ii)<br/>
													<span style="font-weight:normal;">Type — Enter code 1-8; see page 2 for list </span>
												</th>
												<th class="styTableCellHeader" style="width:32mm; font-size:7pt; border-bottom:1px solid black; border-right:1px solid black;" scope="col">(iii)<br/>
													<span style="font-weight:normal;">Fair Rental Days </span>
												</th>
												<th class="styTableCellHeader" style="width:36mm; font-size:7pt; border-bottom:1px solid black; border-right-width:0;" scope="col">(iv)<br/>
													<span style="font-weight:normal;">Personal Use Days </span>
												</th>
											</tr>
										</thead>
										<tfoot/>
										<xsl:for-each select="$Form8825Data/RentalAddressGrp">
											<xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
												<tbody>
													<!-- Line 1 -->
													<tr style="height:8mm; font-size:7pt;">
														<xsl:attribute name="class">
														<xsl:choose>
														<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
														<xsl:otherwise>styDepTblRow2</xsl:otherwise>
														</xsl:choose>
														</xsl:attribute>
														<xsl:variable name="index" select="position()"/>
														<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:1px solid black; border-right:1px solid black; text-align:left; padding-left:3.5mm;">
															<xsl:if test="(position() mod 4 = 0)">
																<xsl:attribute name="style">width:5mm; border-right:1px solid black; text-align:left; padding-left:3.5mm;</xsl:attribute>
															</xsl:if>
															<xsl:call-template name="AddPositionNumber"/>
															<span class="styTableCellPad"/>
														</td>
														<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:1px solid black; border-right:1px solid black; text-align:left;" valign="bottom">
															<xsl:if test="(position() mod 4 = 0)">
																<xsl:attribute name="style">width:82mm; border-right:1px solid black; text-align:left;</xsl:attribute>
															</xsl:if>
															<xsl:choose>
																<xsl:when test="USAddress">
																	<xsl:call-template name="PopulateUSAddressTemplate">
																		<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp[$index]/USAddress"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="PopulateForeignAddressTemplate">
																		<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp[$index]/ForeignAddress"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
															<span class="styTableCellPad"/>
														</td>
														<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1px solid black; border-right:1px solid black; text-align:center;" valign="bottom">
															<xsl:if test="(position() mod 4 = 0)">
																<xsl:attribute name="style">width:32mm; border-right:1px solid black; text-align:center;</xsl:attribute>
															</xsl:if>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp[$index]/RentalTypeDesc"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1px solid black; border-right:1px solid black; text-align:center;" valign="bottom">
															<xsl:if test="(position() mod 4 = 0)">
																<xsl:attribute name="style">width:32mm; border-right:1px solid black; text-align:center;</xsl:attribute>
															</xsl:if>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp[$index]/FairRentalDaysCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1px solid black; text-align:center;" valign="bottom">
															<xsl:if test="(position() mod 4 = 0)">
																<xsl:attribute name="style">text-align:center;</xsl:attribute>
															</xsl:if>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8825Data/RentalAddressGrp[$index]/PersonalUseDaysCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
													</tr>
													<xsl:if test="position()=last() and (count($Form8825Data/RentalAddressGrp) mod 4 &gt; 0)">
														<xsl:if test="(count($Form8825Data/RentalAddressGrp) mod 4 = 1)">
															<tr style="height:8mm; font-size:7pt;">
																<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
																<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:1px solid black; border-right:1px solid black; text-align:left; padding-left:3.5mm;">
																	<span class="styBoldText">
																		<xsl:number value="position() + 1" format="A"/>
																	</span>
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:1px solid black; border-right:1px solid black; text-align:left;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1px solid black; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1px solid black; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
															</tr>
															<tr style="height:8mm; font-size:7pt;">
																<xsl:attribute name="class">styDepTblRow1</xsl:attribute>
																<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:1px solid black; border-right:1px solid black; text-align:left; padding-left:3.5mm;">
																	<span class="styBoldText">
																		<xsl:number value="position() + 2" format="A"/>
																	</span>
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:1px solid black; border-right:1px solid black; text-align:left;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1px solid black; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1px solid black; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
															</tr>
															<tr style="height:8mm; font-size:7pt;">
																<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
																<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-right:1px solid black; text-align:left; padding-left:3.5mm;">
																	<span class="styBoldText">
																		<xsl:number value="position() + 3" format="A"/>
																	</span>
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:82mm; border-right:1px solid black; text-align:left;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
															</tr>
														</xsl:if>
														<xsl:if test="(count($Form8825Data/RentalAddressGrp) mod 4 = 2)">
															<tr style="height:8mm; font-size:7pt;">
																<xsl:attribute name="class">styDepTblRow1</xsl:attribute>
																<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-bottom:1px solid black; border-right:1px solid black; text-align:left; padding-left:3.5mm;">
																	<span class="styBoldText">
																		<xsl:number value="position() + 1" format="A"/>
																	</span>
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:82mm; border-bottom:1px solid black; border-right:1px solid black; text-align:left;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1 solid black; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1 solid black; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-bottom:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
															</tr>
															<tr style="height:8mm; font-size:7pt;">
																<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
																<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-right:1px solid black; text-align:left; padding-left:3.5mm;">
																	<span class="styBoldText">
																		<xsl:number value="position() + 2" format="A"/>
																	</span>
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:82mm; border-right:1px solid black; text-align:left;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
															</tr>
														</xsl:if>
														<xsl:if test="(count($Form8825Data/RentalAddressGrp) mod 4 = 3)">
															<tr style="height:8mm; font-size:7pt;">
																<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
																<td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm; border-right:1px solid black; text-align:left; padding-left:3.5mm;">
																	<span class="styBoldText">
																		<xsl:number value="position() + 1" format="A"/>
																	</span>
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:82mm; border-right:1px solid black; text-align:left;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; border-right:1px solid black; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
																<td class="styForm8825TableCellNoBorder" style="width:32mm; text-align:center;" valign="bottom">
																	<span class="styTableCellPad"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</tbody>
											</xsl:if>
										</xsl:for-each>
									</table>
									<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
									<span class="styRepeatingDataTitle">
										<br/>Form 8825, Lines 2 through 17:
            </span>
									<table class="styDepTbl" style="font-size:7pt">
										<thead class="styTableThead">
											<!-- Header row -->
											<tr class="styDepTblHdr">
												<th style="width:65mm; border:none; border-right-width:1px;" scope="col">  </th>
												<th style="width:7mm; height:5mm; border:none;" scope="col">
													<span class="styTableCellPad"/>
												</th>
												<th class="styTableCellHeader" 
												style="width:100mm; font-size:8pt; border-left-width:1px; border-right-width:0px;" colspan="4" scope="col">
												  Properties
												</th>
											</tr>
										</thead>
										<tfoot/>
										<tbody>
											<tr class="styDepTblHdr">
												<th style="width:80mm; border:none; font-size:7pt; text-align:left; padding-left:8.25mm; font-weight:medium;" scope="col">
													<span class="styBoldText">Rental Real Estate Income</span>
												</th>
												<th class="styForm8825TableCellSmallRB " style="width:5mm; border-left-width:0px; border-right-width:0px;" scope="col">
													<span class="styTableCellPad"/>
												</th>
												<xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp">
													<xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
														<td class="styTableCellSmall" style="text-align:center; border-left-width:1px; border-right-width:0px;">
															<xsl:call-template name="AddPositionNumber"/>
															<span class="styTableCellPad"/>
														</td>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="count($Form8825Data/RentalIncomeExpensesGrp[position() &gt;= $pos  and position() &lt; $pos+4]) = 1">
													<xsl:choose>
														<xsl:when test="count($Form8825Data/RentalIncomeExpensesGrp) &lt; 2">
															<td class="styTableCellSmall" style="text-align:center; border-left-width:1px; border-right-width:0px;">
																<span class="styBoldText"> B </span>
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
																<span class="styBoldText"> C </span>
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
																<span class="styBoldText"> D </span>
																<span class="styTableCellPad"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
																<span class="styTableCellPad"/>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="count($Form8825Data/RentalIncomeExpensesGrp[position() &gt;= $pos  and position() &lt; $pos+4]) = 2">
													<xsl:choose>
														<xsl:when test="count($Form8825Data/RentalIncomeExpensesGrp) &lt; 3">
															<td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
																<span class="styBoldText"> C </span>
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
																<span class="styBoldText"> D </span>
																<span class="styTableCellPad"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
																<span class="styTableCellPad"/>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="count($Form8825Data/RentalIncomeExpensesGrp[position() &gt;= $pos  and position() &lt; $pos+4]) = 3">
													<xsl:choose>
														<xsl:when test="count($Form8825Data/RentalIncomeExpensesGrp) &lt; 4">
															<td class="styTableCellSmall" style="text-align:center;border-left-width: 1px;border-right-width: 0px;">
																<span class="styBoldText"> D </span>
																<span class="styTableCellPad"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
																<span class="styTableCellPad"/>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
											</tr>
											<!-- line 2 -->
											<tr class="styDepTblRow1">
												<td style="border:none;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold;font-size:7pt;width:7.75mm;text-align:left;padding-left:2mm;">
															2</div>
														<div class="styGenericDiv" style="width:65mm;font-size:7pt;">
															<span style="float:left">Gross rents</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;              font-weight:bold;border-right-width: 0px;">
													2
												</td>
												<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;              border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossRentsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/GrossRentsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/GrossRentsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/GrossRentsAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 3 -->
											<tr class="styDepTblRow2">
												<td style="border:none;" scope="row">
													<div>
														<br/>
														<span class="styBoldText;" style="font-size:7pt;text-align:left;padding-left:8mm;font-weight:bold;">Rental Real Estate Expenses</span>
														<br/>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">3</div>
														<div class="styGenericDiv" style="width:65mm;font-size:7pt;">
															<span style="float:left">Advertising</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													<br/>3
												</td>
												<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;              border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AdvertisingAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;              border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/AdvertisingAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;              border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/AdvertisingAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;              border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/AdvertisingAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 4 -->
											<tr class="styDepTblRow1">
												<td style="border:none;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">4</div>
														<div class="styGenericDiv" style="width:65mm;font-size:7pt;">
															<span style="float:left">Auto and travel</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													4
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AutoAndTravelAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/AutoAndTravelAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/AutoAndTravelAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/AutoAndTravelAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!--line 5 -->
											<tr class="styDepTblRow2">
												<td style="border:none;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">5</div>
														<div class="styGenericDiv" style="width:65mm;font-size:7pt;">
															<span style="float:left">Cleaning and maintenance</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													5
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CleaningAndMaintenanceAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/CleaningAndMaintenanceAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/CleaningAndMaintenanceAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/CleaningAndMaintenanceAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 6 -->
											<tr class="styDepTblRow1">
												<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">6</div>
														<div class="styGenericDiv" style="width:65mm;">
															<span style="float:left">Commissions</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													6
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CommissionsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/CommissionsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/CommissionsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/CommissionsAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 7 -->
											<tr class="styDepTblRow2">
												<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">7</div>
														<div class="styGenericDiv" style="width:65mm;">
															<span style="float:left">Insurance</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													7
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="InsuranceAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/InsuranceAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/InsuranceAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/InsuranceAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 8 -->
											<tr class="styDepTblRow1">
												<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">8</div>
														<div class="styGenericDiv" style="width:65mm;font-size:7pt;">
															<span style="float:left">Legal and other professional fees</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													8
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="LegalAndOtherProfessionalFeesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/LegalAndOtherProfessionalFeesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/LegalAndOtherProfessionalFeesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/LegalAndOtherProfessionalFeesAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 9 -->
											<tr class="styDepTblRow2">
												<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">9</div>
														<div class="styGenericDiv" style="width:65mm;">
															<span style="float:left">Interest</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													9
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="InterestAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/InterestAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/InterestAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/InterestAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 10 -->
											<tr class="styDepTblRow1">
												<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">10</div>
														<div class="styGenericDiv" style="width:65mm;">
															<span style="float:left">Repairs</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													10
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="RepairsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/RepairsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/RepairsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/RepairsAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 11 -->
											<tr class="styDepTblRow2">
												<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">11</div>
														<div class="styGenericDiv" style="width:65mm;">
															<span style="float:left">Taxes</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													11
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/TaxesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/TaxesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/TaxesAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 12 -->
											<tr class="styDepTblRow1">
												<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">12</div>
														<div class="styGenericDiv" style="width:65mm;">
															<span style="float:left">Utilities</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													12
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="UtilitiesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/UtilitiesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/UtilitiesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/UtilitiesAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 13 -->
											<tr class="styDepTblRow2">
												<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">13</div>
														<div class="styGenericDiv" style="width:65mm;">
															<span style="float:left">Wages and salaries</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													13
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="WagesAndSalariesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/WagesAndSalariesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/WagesAndSalariesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/WagesAndSalariesAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 14 -->
											<tr class="styDepTblRow1">
												<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">14</div>
														<div class="styGenericDiv" style="width:65mm;">
															<span style="float:left">Depreciation (see instructions)</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
														</div>
													</div>
												</td>
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
                  14
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<!-- Form to Form Link -->
													<span style="text-align:left;padding-bottom:0mm;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp/DepreciationAmt"/>
														</xsl:call-template>
													</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp/DepreciationAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<!-- Form to Form Link -->
													<span style="text-align:left;padding-bottom:0mm;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/DepreciationAmt"/>
														</xsl:call-template>
													</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/DepreciationAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<!-- Form to Form Link -->
													<span style="text-align:left;padding-bottom:0mm;border-left-width: 1px;border-right-width: 0px;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/DepreciationAmt"/>
														</xsl:call-template>
													</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/DepreciationAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<!-- Form to Form Link -->
													<span style="text-align:left;padding-bottom:0mm;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/DepreciationAmt"/>
														</xsl:call-template>
													</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/DepreciationAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!--Row 15 Begins-->
											<!--  RowCount gives the total count of all the 'Other' s-->
											<!--  Removed sum -->
											<xsl:variable name="RowCount" select="(count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp)                   + count($Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp)                   + count($Form8825Data/RentalIncomeExpensesGrp[$pos+2]/OtherRentalRealEstExpenseGrp)                    +count($Form8825Data/RentalIncomeExpensesGrp[$pos+3]/OtherRentalRealEstExpenseGrp))"/>
											<!-- EMPTY rows -->
											<!-- This "if loop" puts empty rows when there are no 'Other' elements-->
											<xsl:if test="$RowCount=0">
												<xsl:choose>
													<xsl:when test="position() mod 4=1">
													<td style="border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px" scope="row">
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>
														<div class="styGenericDiv">
					   Other (list)
					  <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
															<span class="" style="width:45mm;border-bottom:1 solid black;">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																</xsl:call-template>
															</span>
														</div>
													</td>
													<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													15
													</td>
													<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>														

														</xsl:when>
													<xsl:otherwise>
														<td style="border:none;font-size:7pt;" scope="row">
															<div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
															<span class="styBB" style="width:29mm;">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																</xsl:call-template>
															</span>
															<span class="styTableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<xsl:variable name="FirstCol">
												<xsl:value-of select="count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp) "/>
											</xsl:variable>
											<xsl:variable name="SecondCol">
												<xsl:value-of select="count($Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp) "/>
											</xsl:variable>
											<xsl:variable name="ThirdCol">
												<xsl:value-of select="count($Form8825Data/RentalIncomeExpensesGrp[$pos+2]/OtherRentalRealEstExpenseGrp) "/>
											</xsl:variable>
											<xsl:variable name="FourthCol">
												<xsl:value-of select="count($Form8825Data/RentalIncomeExpensesGrp[$pos+3]/OtherRentalRealEstExpenseGrp) "/>
											</xsl:variable>
											<!-- For column A-->
											<xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp">
												<tr class="styDepTblRow2">
													<xsl:choose>
														<xsl:when test="position()=1">
															<td style="border:none;font-size:7pt;" scope="row">
																<xsl:if test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
																	<xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;
																		border-top-width:0px;border-left-width:0px;border-bottom-width:1px
																		</xsl:attribute>
																</xsl:if>
																<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:3.5mm;">
																	15</div>
																<div class="styGenericDiv" style="width:68mm;">
                               Other (list)
                              <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
																	<span style="width:4px;"/>
																	<xsl:choose>
																		<xsl:when test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
																			<span style="width:45mm;text-align:left;">
																				<xsl:call-template name="PopulateText">
																					<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																				</xsl:call-template>
																			</span>
																		</xsl:when>
																		<xsl:otherwise>
																			<span style="width:45mm;border-bottom:1 solid black;text-align:left;">
																				<xsl:call-template name="PopulateText">
																					<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																				</xsl:call-template>
																			</span>
																		</xsl:otherwise>
																	</xsl:choose>
																</div>
															</td>
															<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;                 font-weight:bold;vertical-align:middle;text-align:center;border-right-width: 0px;">
																<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount">
																	</xsl:value-of></xsl:attribute>
																<span>15</span>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border:none;font-size:7pt;" scope="row">
																<xsl:choose>
																	<xsl:when test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
																		<xsl:attribute name="style">
																			border:1 solid black;font-size:7pt;border-right-width:0px;
																			border-top-width:0px;border-left-width:0px;border-bottom-width:1px
																			</xsl:attribute>
																		<span class="styTableCellPad" style="float:left;width:8mm;">&#160;</span>
																		<span class="styFixedUnderline" style="width:62mm;border-bottom-width:0px;text-align:left;">
																			<xsl:call-template name="PopulateText">
																				<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																			</xsl:call-template>
																		</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<span class="styTableCellPad" style="float:left;width:8mm;">&#160;</span>
																		<span class="styFixedUnderline" style="width:62mm;text-align:left;">
																			<xsl:call-template name="PopulateText">
																				<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																			</xsl:call-template>
																		</span>
																		<span class="styTableCellPad"/>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:otherwise>
													</xsl:choose>
													<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;" scope="row">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="OtherExpenseAmt"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:for-each>
											<!-- For Column B-->
											<xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp">
												<tr class="styDepTblRow2">
													<xsl:choose>
														<xsl:when test="(position()=1) and (count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp)=0)">
															<td style="border:none;font-size:7pt;" scope="row">
																<xsl:if test="position()=last() and (($ThirdCol+$FourthCol) = 0)">
																	<xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;
																		border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
																</xsl:if>
																<div class="styGenericDiv" style="width:5mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>
																<div class="styGenericDiv">
                               Other (list) 
                              <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
																	<span style="width:4px;"/>
																	<xsl:choose>
																		<xsl:when test="position()=last() and (($ThirdCol+$FourthCol) = 0)">
																			<span style="width:45mm;text-align:left;">
																				<xsl:call-template name="PopulateText">
																					<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																				</xsl:call-template>
																			</span>
																		</xsl:when>
																		<xsl:otherwise>
																			<span style="width:45mm;border-bottom:1 solid black;text-align:left;">
																				<xsl:call-template name="PopulateText">
																					<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																				</xsl:call-template>
																			</span>
																		</xsl:otherwise>
																	</xsl:choose>
																</div>
															</td>
															<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
																<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"> </xsl:value-of></xsl:attribute>
																<span style="text:align:right;">15</span>
																<span class="styTableCellPad"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border:none;font-size:7pt;" scope="row">
																<xsl:choose>
																	<xsl:when test="position()=last() and ($ThirdCol+$FourthCol) = 0">
																		<xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;
																		border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
																		<span class="styTableCellPad" style="float:left;width:8mm;">&#160;</span>
																		<span class="styFixedUnderline" style="width:62mm;border-bottom-width: 0px;text-align:left;">
																			<xsl:call-template name="PopulateText">
																				<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																			</xsl:call-template>
																		</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<span class="styTableCellPad" style="float:left;width:8mm;">&#160;</span>
																		<span class="styFixedUnderline" style="width:62mm;text-align:left;">
																			<xsl:call-template name="PopulateText">
																				<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																			</xsl:call-template>
																		</span>
																		<span class="styTableCellPad"/>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:otherwise>
													</xsl:choose>
													<td class="styTableCellSmall" scope="row" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;" scope="row">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="OtherExpenseAmt"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:for-each>
											<!--For Column C -->
											<xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp[$pos+2]/OtherRentalRealEstExpenseGrp">
												<tr class="styDepTblRow2">
													<xsl:choose>
														<xsl:when test="(position()=1) and ( (count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp) +                count($Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp) )=0)">
															<td style="border:none;font-size:7pt;" scope="row">
																<xsl:if test="position()=last() and (($FourthCol) = 0)">
																	<xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;
																	border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
																</xsl:if>
																<div class="styGenericDiv" style="width:5mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">
																	15</div>
																<div class="styGenericDiv">
                               Other (list) 
                              <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
																	<span style="width:4px;"/>
																	<xsl:choose>
																		<xsl:when test="position()=last() and (($FourthCol) = 0)">
																			<span style="width:45mm;text-align:left;">
																				<xsl:call-template name="PopulateText">
																					<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																				</xsl:call-template>
																			</span>
																		</xsl:when>
																		<xsl:otherwise>
																			<span style="width:45mm;border-bottom:1 solid black;text-align:left;">
																				<xsl:call-template name="PopulateText">
																					<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																				</xsl:call-template>
																			</span>
																		</xsl:otherwise>
																	</xsl:choose>
																</div>
															</td>
															<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
																<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"> </xsl:value-of></xsl:attribute>
																<span style="text:align:right;">15</span>
																<span class="styTableCellPad"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border:none;font-size:7pt;" scope="row">
																<xsl:choose>
																	<xsl:when test="position()=last() and (($FourthCol) = 0)">
																		<xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;
																		border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
																		<span class="styTableCellPad" style="float:left;width:8mm;">&#160;</span>
																		<span class="styFixedUnderline" style="width:62mm;border-bottom-width: 0px;text-align:left;">
																			<xsl:call-template name="PopulateText">
																				<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																			</xsl:call-template>
																		</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<span class="styTableCellPad" style="float:left;width:8mm;">&#160;</span>
																		<span class="styFixedUnderline" style="width:62mm;text-align:left;">
																			<xsl:call-template name="PopulateText">
																				<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																			</xsl:call-template>
																		</span>
																		<span class="styTableCellPad"/>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:otherwise>
													</xsl:choose>
													<td class="styTableCellSmall" scope="row" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" scope="row" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;" scope="row">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="OtherExpenseAmt"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellSmall" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:for-each>
											<!-- For Column D-->
											<xsl:for-each select="$Form8825Data/RentalIncomeExpensesGrp[$pos+3]/OtherRentalRealEstExpenseGrp">
												<tr class="styDepTblRow2">
													<xsl:choose>
														<xsl:when test="(position()=1) and ( (count($Form8825Data/RentalIncomeExpensesGrp[$pos]/OtherRentalRealEstExpenseGrp) +                count($Form8825Data/RentalIncomeExpensesGrp[$pos+1]/OtherRentalRealEstExpenseGrp) +                count($Form8825Data/RentalIncomeExpensesGrp[$pos+2]/OtherRentalRealEstExpenseGrp) )=0)">
															<td style="border:none;font-size:7pt;" scope="row">
																<xsl:if test="position()=last()">
																	<xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;
																	border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
																</xsl:if>
																<div class="styGenericDiv" style="width:5mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">																	15</div>
																<div class="styGenericDiv">
																   Other (list) 
																  <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
																	<span style="width:4px;"/>
																	<xsl:choose>
																		<xsl:when test="position()=last()">
																			<span style="width:45mm;text-align:left;">
																				<xsl:call-template name="PopulateText">
																					<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																				</xsl:call-template>
																			</span>
																		</xsl:when>
																		<xsl:otherwise>
																			<span style="width:45mm;border-bottom:1 solid black;text-align:left;">
																				<xsl:call-template name="PopulateText">
																					<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																				</xsl:call-template>
																			</span>
																		</xsl:otherwise>
																	</xsl:choose>
																</div>
															</td>
															<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
																<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"/></xsl:attribute>
																<span style="text:align:right;">15</span>
																<span class="styTableCellPad"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border:none;font-size:7pt;" scope="row">
																<xsl:choose>
																	<xsl:when test="position()=last()">
																		<xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;
																			border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
																		<span class="styTableCellPad" style="float:left;width:8mm;">&#160;</span>
																		<span class="styFixedUnderline" style="width:62mm;border-bottom-width: 0px;text-align:left;">
																			<xsl:call-template name="PopulateText">
																				<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																			</xsl:call-template>
																		</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<span class="styTableCellPad" style="float:left;width:8mm;">&#160;</span>
																		<span class="styFixedUnderline" style="width:62mm;text-align:left;">
																			<xsl:call-template name="PopulateText">
																				<xsl:with-param name="TargetNode" select="OtherExpenseTxt"/>
																			</xsl:call-template>
																		</span>
																		<span class="styTableCellPad"/>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:otherwise>
													</xsl:choose>
													<td class="styTableCellSmall" scope="row" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" scope="row" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" scope="row" style="border-left-width: 1px;border-right-width: 0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;" scope="row">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="OtherExpenseAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
											<!-- End of row 15-->
											<!-- line 16 -->
											<tr class="styDepTblRow1">
											<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">16</div>
														<div class="styGenericDiv" style="width:65mm;">
															<span style="float:left">Total expenses for each property.</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
														</div>
													</div>
												</td>
												<!-- line 16 -->
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													16
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalExpensesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/TotalExpensesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/TotalExpensesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/TotalExpensesAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- line 17 -->
											<tr class="styDepTblRow2">
												<td style="border:none;font-size:7pt;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">17</div>
														<div class="styGenericDiv" style="width:65mm;">
															<span style="float:left">Income or (Loss) from each property.</span>
															<!--Dotted Line-->
															<div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
														</div>
													</div>
												</td>
												
												<td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-right-width: 0px;">
													17
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width:1px;              border-bottom-width:1px;border-right-width: 0px;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="IncomeOrLossAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 1]/IncomeOrLossAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 2]/IncomeOrLossAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:6pt;border-left-width: 1px;border-right-width: 0px;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpensesGrp[$pos + 3]/IncomeOrLossAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<!--/div-->
								</xsl:if>
							</xsl:for-each>
						</div>
					</xsl:if>
					<!-- Additional Data Table for separated data from Line 20b -->
					<xsl:if test="($Print = $Separated) and (count($Form8825Data/IdentifyPartnershipEstateTrGrp) &gt;3) ">
						<span class="styRepeatingDataTitle">
							<br/>Form 8825, Line 20b - Identify below the partnerships, estates, or trusts from which net income (loss) is shown on line 20a:
            </span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:100mm;" scope="col">(1) Name</th>
									<th class="styDepTblCell" scope="col">(2) Employer identification number</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form8825Data/IdentifyPartnershipEstateTrGrp">
									<tr>
										<!--Define background colors to the rows -->
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test=" BusinessName/BusinessNameLine2Txt !='' ">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="text-align:center;padding-left:5mm;">
		<xsl:choose>
													<xsl:when test="normalize-space(EIN)">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
														<span style="width: 2px"/>
													</xsl:otherwise>
												</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Line 20b separated data -->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="AddPositionNumber">
		<span class="styBoldText">
			<xsl:number value="position()" format="A"/>
		</span>
	</xsl:template>
</xsl:stylesheet>