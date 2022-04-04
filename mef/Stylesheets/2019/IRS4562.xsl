<?xml version="1.0" encoding="UTF-8"?>
<!-- Check out draft copy  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS4562Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest  version  -->
  <xsl:param name="IRS4562Data" select="$RtnDoc/IRS4562"/>
   <!-- TEMPLATE 1 - ADD ROWS to PART I -->
  <xsl:template name="AddRowsPartI">
	<xsl:param name="NumOfRows"/>
	<xsl:param name="EPCount"/>
	<xsl:if test="$EPCount &lt; $NumOfRows">
	  <tr>
		<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width: 91mm; padding-left:3mm;">
		  <xsl:if test="$EPCount=0"></xsl:if>
		  <span style="width:1px"/>
		</td>
		<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:32mm; text-align:right">
		  <span style="width:1px"/>
		</td>
		<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; width:32mm; text-align:right">
		  <span style="width:1px"/>
		</td>
		<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:1px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:32mm; background-color:lightgrey">
		  <span style="width:1px"/>
		</td>
	  </tr>
	  <xsl:call-template name="AddRowsPartI">
		<xsl:with-param name="EPCount" select="$EPCount + 1"/>
		<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
	  </xsl:call-template>
	</xsl:if>
  </xsl:template>
  <!-- TEMPLATE 2 - ADD ROWS to PART III, Empty table for separated format (for line 19a and 20a)-->
  <xsl:template name="AddRowsPartIII">
	<xsl:param name="Classification"/>
	<tr>
	  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
		<span class="styLN" style="font-weight:bold">
		  <!-- Part III, Section B column A -->
		  <xsl:if test="$Classification = 3">19a</xsl:if>
		  <xsl:if test="$Classification = 5 or $Classification = 12">
		    <span style="width=3.5mm; padding-left:3mm"/>b </xsl:if>
		  <xsl:if test="$Classification = 7 or $Classification = 30">
			<span style="width=3.5mm; padding-left:3mm"/>c </xsl:if>
		  <xsl:if test="$Classification = 10 or $Classification = 40">
			<span style="width=3.5mm; padding-left:3mm"/>d </xsl:if>
		  <xsl:if test="$Classification = 15">
			<span style="width=3.5mm; padding-left:3mm"/>e </xsl:if>
		  <xsl:if test="$Classification = 20">
			<span style="width=3.5mm; padding-left:3mm"/>f </xsl:if>
		  <xsl:if test="$Classification = 25">
			<span style="width=3.5mm; padding-left:3mm"/>g </xsl:if>		
		  <xsl:if test="$Classification = 1">20a</xsl:if>
		  <span style="width: 3px"/>
		</span>
		<!-- Part III, Section C column A -->
		<xsl:if test="$Classification = 1">Class life</xsl:if>
		<xsl:if test="$Classification = 12">12-year</xsl:if>
		<xsl:if test="$Classification = 30">30-year</xsl:if>
		<xsl:if test="$Classification = 40">40-year</xsl:if>
		<xsl:if test="$Classification != 1 and $Classification != 12 and $Classification != 30 and $Classification != 40">
		  <xsl:value-of select="$Classification"/>-year property
        </xsl:if>
		<span class="styIRS4562TableCellPad"/>
	  </td>
	  <td class="styIRS4562TableCellB">
		<xsl:if test="$Classification != 3 or $Classification != 1">
		  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey</xsl:attribute>
		</xsl:if>
		<xsl:if test="$Classification = 3 or $Classification = 1">
		  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; background-color:lightgrey</xsl:attribute>
		</xsl:if>
		<xsl:if test="$Classification = 40">
		  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px</xsl:attribute>
		</xsl:if>
		<span class="styIRS4562TableCellPad"/>
	  </td>
	  <td class="styIRS4562TableCellC">
		<xsl:if test="$Classification != 1">
		  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right;</xsl:attribute>
		</xsl:if>
		<xsl:if test="$Classification = 1">
		  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right;</xsl:attribute>
		</xsl:if>
		<xsl:if test="$Classification = 40">
		  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right;</xsl:attribute>
		</xsl:if>
		<span class="styIRS4562TableCellPad"/>
	  </td>
	  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
		<xsl:if test="$Classification = 25">25 yrs.</xsl:if>
		<xsl:if test="$Classification = 12">12 yrs.</xsl:if>
		<xsl:if test="$Classification = 30">30 yrs.</xsl:if>
		<xsl:if test="$Classification = 40">40 yrs.</xsl:if>
		<span class="styIRS4562TableCellPad"/>
	  </td>
	  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
		<xsl:if test="$Classification = 30 or $Classification = 40">MM</xsl:if>
		<span class="styIRS4562TableCellPad"/>
	  </td>
	  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
		<xsl:if test="$Classification = 25 or $Classification = 1 or $Classification = 12 or $Classification = 30 or $Classification = 40">S/L</xsl:if>
		<span class="styIRS4562TableCellPad"/>
	  </td>
	  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
		<span class="styIRS4562TableCellPad"/>
	  </td>
	</tr>
  </xsl:template>
  <!--TEMPLATE 3A -->
  <xsl:template name="AddRowsLine26and27">
	<xsl:param name="Line"/>
	<xsl:param name="NumOfRows"/>
	<xsl:param name="BPCount"/>
	<xsl:param name="FirstCall"/>
	<xsl:if test="$BPCount &lt; $NumOfRows">
	  <tr>
		<xsl:choose>
		  <xsl:when test="$FirstCall = 'true'">
			<td class="styTableCell" style="border-color:black; width:29mm; font-size:6pt">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt; text-align right">%<span class="styIRS4562TableCellPad"/></td>
			<td class="styTableCell" style="border-color:black; width:24mm; font-size: 6pt; text-align right">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:26mm; font-size:6pt; text-align:right">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:9mm; font-size:6pt; text-align:right">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:left;">
			  <xsl:if test="$Line = 27">S/L -</xsl:if>
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<xsl:choose>
			  <xsl:when test="$Line = 27">
				<td class="styTableCell">
				  <!-- If this row is the last row of the table, put bottom border to the cell. Otherwise, don't put the bottom border on the cell.-->
				  <xsl:choose>
					<xsl:when test="($BPCount + 1) = $NumOfRows">
					  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; width:24mm; font-size:6pt; background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
					  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:24mm; font-size:6pt; background-color:lightgrey;</xsl:attribute>
					</xsl:otherwise>
				  </xsl:choose>
				  <span class="styIRS4562TableCellPad"/>
				</td>
			  </xsl:when>
			  <xsl:otherwise>
				<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt; border-right-width:0px;">
				  <span class="styIRS4562TableCellPad"/>
				</td>
			  </xsl:otherwise>
			</xsl:choose>
		  </xsl:when>
		  <xsl:otherwise>
			<td class="styTableCell" style="border-color:black; width:29mm; font-size:6pt">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt; text-align:right">%<span class="styIRS4562TableCellPad"/></td>
			<td class="styTableCell" style="border-color:black; width:24mm; font-size 6pt; text-align:right">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:26mm; font-size:6pt; text-align:right">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:9mm; font-size:6pt; text-align:right">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:left;">
			  <xsl:if test="$Line = 27">S/L -</xsl:if>
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt">
			  <span class="styIRS4562TableCellPad"/>
			</td>
			<xsl:choose>
			  <xsl:when test="$Line = 27">
				<td class="styTableCell">
				  <!-- If this row is the last row of the table, put bottom border to the cell. Otherwise, don't put the bottom border on the cell.-->
				  <xsl:choose>
					<xsl:when test="($BPCount + 1) = $NumOfRows">
					  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; width:24mm; font-size:6pt; background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
					  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:24mm; font-size:6pt; background-color:lightgrey;</xsl:attribute>
					</xsl:otherwise>
				  </xsl:choose>
				  <span class="styIRS4562TableCellPad"/>
				</td>
			  </xsl:when>
			  <xsl:otherwise>
				<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt; border-right-width:0px;">
				  <span class="styIRS4562TableCellPad"/>
				</td>
			  </xsl:otherwise>
			</xsl:choose>
		  </xsl:otherwise>
		</xsl:choose>
	  </tr>
	  <!--TEMPLATE 3B -->
	  <xsl:call-template name="AddRowsLine26and27">
		<xsl:with-param name="Line" select="$Line"/>
		<xsl:with-param name="BPCount" select="$BPCount + 1"/>
		<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
		<xsl:with-param name="FirstCall">false</xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
  </xsl:template>
	<!--TEMPLATE 4 -->
	<xsl:template name="AddRowsPartVI">
	  <xsl:param name="NumOfRows"/>
	  <xsl:param name="ACount"/>
	  <xsl:if test="$ACount &lt; $NumOfRows">
		<tr>
		  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:44mm">
			<span class="styIRS4562TableCellPad"/>
		  </td>
		  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:23mm">
			<span class="styIRS4562TableCellPad"/>
		  </td>
		  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:36mm">
			<span class="styIRS4562TableCellPad"/>
		  </td>
		  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:23mm">
			<span class="styIRS4562TableCellPad"/>
		  </td>
		  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:17mm">
			<span class="styIRS4562TableCellPad"/>
		  </td>
		  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; width:44mm">
			<span class="styIRS4562TableCellPad"/>
		  </td>
		</tr>
		<xsl:call-template name="AddRowsPartVI">
		  <xsl:with-param name="ACount" select="$ACount + 1"/>
			<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
		</xsl:call-template>
	  </xsl:if>
	</xsl:template>
	<!-- FORM TEMPLATE BEGIN -->
	<xsl:template match="/">
	  <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
		  <head>
			<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
			<title>
			  <xsl:call-template name="FormTitle">
				<xsl:with-param name="RootElement" select="local-name($IRS4562Data)"/>
			  </xsl:call-template>
			</title>
			<meta http-equiv="Pragma" content="no-cache"/>
			<meta http-equiv="Cache-Control" content="no-cache"/>
			<meta http-equiv="Expires" content="0"/>
			<meta http-equiv="Cache-Control" content="private"/>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
			<meta name="Description" content="IRS Form 4562"/>
			<META name="GENERATOR" content="IBM WebSphere Studio"/>
			<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
			<xsl:call-template name="InitJS"/>
			<style type="text/css">
			  <!--  remember to remove commented out print   -->
			  <xsl:if test="not($Print) or $Print=''">
				<xsl:call-template name="IRS4562Style"/>
				<xsl:call-template name="AddOnStyle"/>
			  </xsl:if>				
			</style>
			<xsl:call-template name="GlobalStylesForm"/>
		  </head>
		  <body class="styBodyClass">
			<form name="IRS4562">
			  <!--   BEGIN WARNING LINE  -->
			  <xsl:call-template name="DocumentHeader"/>
			  <!--   END WARNING LINE   -->
			  <!--   BEGIN FORM HEADER   -->
			  <div class="styTBB" >
				<div class="styFNBox" style="width:31mm; border-right-width:1px; height:22mm; border-right-width:2px">
				  <div style="padding-top:1mm; padding-left:2mm">
					Form<span class="styFormNumber"> 4562 </span>
				  </div>
				  <div>
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data"/>
				    </xsl:call-template>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Form 4562, Top Left Margin - Note </xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/@section179ExpnsDedSummaryCd"/>
					  <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
				    </xsl:call-template>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Form 4562, Top Left Margin - Note 2</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/@extnsUnderAnnouncementCd"/>
					  <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
				    </xsl:call-template>
				  </div>
				  <span class="styAgency" style="padding-top:2.5mm;">Department of the Treasury</span>
				  <div class="styAgency">Internal Revenue Service   (99)</div>
			    </div>
				<div class="styFTBox" style="width:125mm;">
				  <div class="styMainTitle" style=";padding-top:1mm;">Depreciation and Amortization</div>
				  <div class="styFMT" style="font-size:9pt; padding-top:1mm;">(Including Information on Listed Property)</div>
                  <br/>							
				  <div class="styFBT" style=" font-size:7pt;">
					<img src="{$ImagePath}/4562_Bullet_Lg.gif" alt="Right Pointing arrow"/> Attach to your tax return. 
				  </div>
				  <div class="styFBT" style=" font-size:7pt;">
					<img src="{$ImagePath}/4562_Bullet_Lg.gif" alt="Right Pointing arrow"/>
					<span  style="font-size:6pt; padding-top:0mm">&#160;
					  Go to
					  <span style="width:.5mm"/> 
					</span> 
					<a style="text-decoration:none; color:black;" href="http://www.irs.gov/form4562" title="Link to IRS.gov">
					  <i>www.irs.gov/Form4562</i>
					</a>
					for instructions and the latest information.
				  </div>
				</div>
				<div class="styTYBox" style="width:30mm; height:22mm; border-left-width:2px">
				  <div class="styOMB" style="height:4mm; width:30mm;">OMB No. 1545-0172</div>
				  <div class="styTY">20<span class="styTYColor">19</span></div>
				  <div class="stySequence" style="">Attachment<br/>Sequence No. <b>179</b></div>
				</div>
			  </div>
			  <!--   END FORM HEADER   -->
			  <!--   BEGIN TAXPAYER INFO   -->
			  <!--   BEGIN NAME   -->
			  <!--   HINTS: Due to the original choice of coding as a table therefore, the width is not equal to 187mm-->
			  <table style="width:187mm; clear:all;" cellspacing="0">
				<tr style="border:solid black 1;">
				  <td class="styNameBox" style="width:99mm; font-size:7pt;">
					Name(s) shown on return<br/>
					<span style="font-size:6.5pt;">				
					  <!--Choice for 1120 (Parent/Subsidiary), 1040, 1040NR and 1041 Return Header Filer info-->
					  <xsl:call-template name="PopulateFilerName">
						<xsl:with-param name="TargetNode" select="$IRS4562Data"/>
					  </xsl:call-template>
					</span> 	
				  </td>
				  <td class="styNameBox" style="width:58mm; font-size:7pt;">
					Business or activity to which this form relates
					<br/><br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/BusinessOrActivityTxt"/>
					</xsl:call-template>
				  </td>
				  <td class="styEINBox" style="width:28mm; font-size:7pt;">
					Identifying number						                
					<br/>
					<span style="font-size:7pt; font-weight:normal; text-align:left">
					  <br/>
					  <!-- Choice for 1120 (Parent/Subsidiary), 1041, 1040 and 1040NR Return Header Filer info  -->
					  <xsl:call-template name="PopulateFilerTIN">
						<xsl:with-param name="TargetNode" select="$IRS4562Data"/>
					  </xsl:call-template> 
					</span>
				  </td>
				</tr>
			  </table>
			  <!--  END NAME   -->
			  <!--   BEGIN PART I   -->
			  <!--   BEGIN PART I HEADER   -->
			  <div  style="width:187mm; border-top: 1px black solid; height:4mm">
				<div class="styPartName">Part I</div>
				<div class="styPartDesc" >
				  <span style="width:10px;"/>Election To Expense Certain Property Under Section 179<br/>
				</div>
			  </div>
			  <div class="styBB" style="width:187mm; border-top: 0px black solid; height:4mm">
				<div class="styPartDesc" >
				  <span style="width:60px;"/>
				  Note: 
				  <span class="styNormalText">
					If you have any listed property, complete Part V before you complete Part I.
				  </span>
				</div>
			  </div>
			  <!--   END PART I HEADER   -->
			  <!--   BEGIN LINE 1   -->
			  <!-- Schedule H line 1 -->
			  <div style="width:187mm;clear:all;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm">1</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
                    Maximum amount (see instructions)    
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn"> .......................</div>
				  <div class="styLNRightNumBox">1 </div>
				  <div class="styLNAmountBox">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/MaximumDollarLimitationAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 1   -->
			  <!--   BEGIN LINE 2   -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm;">2</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					Total cost of section 179 property placed in service (see instructions)
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">.............</div>
				  <div class="styLNRightNumBox">2 </div>
				  <div class="styLNAmountBox">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/TotalCostOfSection179PropAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 2   -->
			  <!--   BEGIN LINE 3  -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm;">3</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					Threshold cost of section 179 property before reduction in limitation (see instructions)   
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">.......</div>
				  <div class="styLNRightNumBox">3 </div>
				  <div class="styLNAmountBox">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/ThresholdCostOfSect179PropAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 3   -->
			  <!--   BEGIN LINE 4   -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm;">4</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
                    Reduction in limitation. Subtract line 3 from line 2. If zero or less, enter -0-    
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">...........</div>
				  <div class="styLNRightNumBox">4 </div>
				  <div class="styLNAmountBox">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/ReductionInLimitationAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 4   -->
			  <!--   BEGIN LINE 5   -->
			  <!--  line 5 A-->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm;">5</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					Dollar limitation for tax year. Subtract line 4 from line 1. If zero or less, enter -0-. If married filing separately,
				  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn"></div>
				  <div class="styLNRightNumBox" style="border-bottom-width:0px;"></div>
				  <div class="styLNAmountBox" style="border-bottom-width:0px;"></div>
				</div>
			  </div>
			  <!-- end 5A -->
			  <!--  line 5B -->
			  <div style="width:187mm">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm;"/>
				  <div class="styGenericDiv" style="height:4mm;padding-top:.5mm; padding-bottom:.5mm;">see instructions </div>
				</div> 
				<div style="float:right;">
				  <div class="styDotLn">.............................</div>
				  <div class="styLNRightNumBox" style="border-bottom-width:0px;">5 </div>
				  <div class="styLNAmountBox" style="border-bottom-width:0px;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/DollarLimitationForTaxYearAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!-- end line 5B -->
			  <!--   END LINE 5   -->
			  <!--   START LINE 6 Table with Column A, B, and C -->
			  <div class="styIRS4562TableContainer" id="DPctn">
				<!--print logic-->
				<xsl:call-template name="SetInitialState"/>
				<!--end-->
				<table class="styIRS4562Table" cellspacing="0">
				  <thead class="styTableThead">
					<tr>
					  <th scope="col" class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:px; border-top-width:1px; border-bottom-width:1px; width:91mm; text-align:center;">
						<span style="float:left; padding-left:3mm; font-weight:bold;">6</span>
						<b>(a)</b> Description of property
					  </th>
					  <th scope="col" class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:32mm; text-align:center">
						<b>(b)</b> Cost (business use only)
					  </th>
					  <th scope="col" class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:1px; width:32mm; text-align:center">
						<b>(c)</b> Elected cost
					  </th>
					  <th scope="col" class="styIRS4562TableCellD" style="vertical-align:top; border-color:black; border-left-width:1px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px; width:32mm; background-color:lightgrey;">
						<xsl:if test="not((count($IRS4562Data/ElectedProperty) &gt; 2) and ($Print = $Separated))">
						  <span style="width:7mm; text-align:right; float:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
							  <xsl:with-param name="TargetNode" select="$IRS4562Data/ElectedProperty"/>
							  <xsl:with-param name="containerHeight" select="2"/>
							  <xsl:with-param name="headerHeight" select="1"/>
							  <xsl:with-param name="containerID" select=" 'DPctn' "/>
							</xsl:call-template>
						  </span>
					    </xsl:if>
						<span style="width: 1px"/>
					  </th>
					</tr>
				  </thead>
				  <tfoot/>
				  <tbody>
					<xsl:if test="not((count($IRS4562Data/ElectedProperty) &gt; 2) and ($Print = $Separated))">
					  <xsl:for-each select="$IRS4562Data/ElectedProperty">
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:91mm; padding-left:3mm;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="PropertyDesc"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:32mm; text-align:right; padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="CostForBusinessUseOnlyAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; width:32mm; text-align:right; padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="ElectedCostAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS4562TableCellD">
							<xsl:choose>
							  <xsl:when test="(count($IRS4562Data/ElectedProperty) &gt; 2)">
								<xsl:attribute name="style">border-color:black; border-left-width:1px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:27.8mm; background-color:lightgrey</xsl:attribute>
							  </xsl:when>
							  <xsl:otherwise>
							    <xsl:attribute name="style">border-color:black; border-left-width:1px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:32mm; background-color:lightgrey</xsl:attribute>
							  </xsl:otherwise>
							</xsl:choose>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<xsl:call-template name="AddRowsPartI">
					  <xsl:with-param name="NumOfRows" select="2"/>
					  <xsl:with-param name="EPCount" select="count($IRS4562Data/ElectedProperty)"/>
					</xsl:call-template>
					<!-- If the separate repeating data tag is set, put up blank rows -->
					<xsl:if test="(count($IRS4562Data/ElectedProperty) &gt; 2) and ($Print = $Separated)">
					  <tr>
						<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:91mm; padding-left:3mm;">
						  <xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$IRS4562Data/ElectedProperty"/>
						  </xsl:call-template>
						  <span style="width: 1px"/>
						</td>
						<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:32mm; text-align:right">
						  <span style="width: 1px"/>
						</td>
						<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:32mm; text-align:right;">
						  <span style="width: 1px"/>
						</td>
						<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:1px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:32mm; background-color:lightgrey;">
						  <span style="width: 1px"/>
						</td>
					  </tr>
					  <tr>
					    <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width: 91mm">
						  <span style="width: 1px"/>
					    </td>
					    <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:32mm; text-align:right;">
						  <span style="width: 1px"/>
					    </td>
					    <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:1px; width:32mm; text-align:right;">
						  <span style="width: 1px"/>
					    </td>
					    <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:1px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; width:32mm; background-color:lightgrey;">
						  <span style="width: 1px"/>
					    </td>
					  </tr>
				    </xsl:if>
				  </tbody>
			    </table>
			  </div>
			  <!-- Line 6 bottom scroll bar-->
			  <xsl:call-template name="SetInitialDynamicTableHeight">
				<xsl:with-param name="TargetNode" select="$IRS4562Data/ElectedProperty"/>
				<xsl:with-param name="containerHeight" select="2"/>
				<xsl:with-param name="headerHeight" select="1"/>
				<xsl:with-param name="containerID" select=" 'DPctn' "/>
			  </xsl:call-template>
			  <!--   END Line 6, Column A, B, and C -->
			  <!--   BEGIN LINE 7 -->					
			  <div class="styIRS4562LineItem" style="vertical-align:top; margin:0px; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-bottom-width:0px; border-top-width:0px; float:none; clear:both;">
				<span class="styIRS4562LNLeftNumBox" style="padding-left:3mm; padding-top:1mm">7</span>
				<span class="styIRS4562LNDesc" style="width: 111mm; padding-left:4mm; padding-top:1mm">
				  Listed property. Enter the amount from line 29.
				  <span class="styDotLn" style="float:right; padding-right:2mm;">...........</span>
    			</span>
				<span class="styLNRightNumBox" style="border-right:1px solid black;">7</span>
				<div class="styIRS4562LNAmountBox" style="border-left:0; width:32mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$IRS4562Data/TotalSection179ExpenseAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styIRS4562LNAmountBox" style="width:32mm; border-top-color:lightgrey; background-color:lightgrey; border-bottom-width:0px; height:4mm"/>
			  </div>
			  <!--   END LINE 7   -->
			  <!--   BEGIN LINE 8   -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm">8</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
                    Total elected cost of section 179 property. Add amounts in column (c), lines 6 and 7    
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">........</div>
				  <div class="styLNRightNumBox" style="width:8mm">8 </div>
				  <div class="styLNAmountBox">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/TotalElectedCostSect179PropAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 8   -->
			  <!--   BEGIN LINE 9   -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm">9</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					Tentative deduction. Enter the <b>smaller</b> of line 5 or line 8    
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">.................</div>
				  <div class="styLNRightNumBox">9 </div>
				  <div class="styLNAmountBox">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/TentativeDeductionAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 9   -->
			  <!--   BEGIN LINE 10   -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm;">10</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					Carryover of disallowed deduction from line 13 of your 2018 Form 4562.     
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">............</div>
				  <div class="styLNRightNumBox">10 </div>
				  <div class="styLNAmountBox">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/DisallowedDeductionCyovAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 10   -->
			  <!--   BEGIN LINE 11   -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm;">11</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					Business income limitation. Enter the smaller of business income (not less than zero) or line 5. See 
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn"></div>
				  <div class="styLNRightNumBox" style="border-bottom-width:0px;"></div>
				  <div class="styLNAmountBox" style="border-bottom-width:0px;"></div>
				</div>
			  </div>
			  <!-- end 11A -->
			  <!--  line 11B -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm;"/>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">instructions. </div>
			    </div>
			    <div style="float:right;">
				  <div class="styDotLn">..............................</div>
				  <div class="styLNRightNumBox">11 </div>
				  <div class="styLNAmountBox">
				    <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/BusinessIncomeLimitationAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 11   -->
			  <!--   BEGIN LINE 12   -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm;">12</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
			        Section 179 expense deduction. Add lines 9 and 10, but don't enter more than line 11
   					<xsl:call-template name="LinkToLeftoverDataTableInline">
				      <xsl:with-param name="Desc">Line 12 - Section 179 Expense Deduction Note</xsl:with-param>
				      <xsl:with-param name="TargetNode" select="$IRS4562Data/Section179ExpenseDeductionAmt/@section179ExpnsDedSummaryCd"/>
				      <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
					</xsl:call-template>
				  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">......</div>
				  <div class="styLNRightNumBox" style="border-bottom-width:0px;">12 </div>
				  <div class="styLNAmountBox" style="border-bottom-width:0px;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/Section179ExpenseDeductionAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 12   -->
			  <!--   BEGIN LINE 13   -->
			  <div class="styIRS4562LineItem">
				<div class="styLNLeftNumBox" style="height:4mm; width:7mm">13</div>
				<span class="styIRS4562LNDesc" style="width: 107mm;">
				  Carryover of disallowed deduction to 2020. Add lines 9 and 10, less line 12
                  <div style="float:right;">
					<!--<div class="styDotLn"> .. </div>-->										
					<img src="{$ImagePath}/4562_Bullet_Lg.gif" alt="Right Pointing arrow"/>	
					<span style="width:1mm"/>
				  </div>
				</span>
				<span class="styLNRightNumBox" style="border-top-width:1px; border-bottom-width:0px;">13</span>
				<div class="styIRS4562LNAmountBox" style="border-top-width:1px; border-bottom-width:0px; width:32mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$IRS4562Data/NextYearCarryoverAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styIRS4562LNAmountBox" style="background-color:lightgrey; border-bottom-width:0px; border-top-width:1px; width:32mm;"/>
			  </div>
			  <!--   END LINE 13   -->
			  <!--   BEGIN NOTE HEADER   -->
			  <div class="styIRS4562NoteHdr" style="clear:all;">
				<span style="width:186mm;">
				  <span class="styIRS4562NoteHdrTitle">
					<span style="width:1px;"/>Note: 
					<span style="font-weight:normal">
					  Don't use Part II or Part III below for listed property.  Instead, use Part V.	
					</span>
                  </span>
				</span>
              </div>
			  <!--   END NOTE HEADER   -->
			  <!--   BEGIN PART II HEADER   -->
			  <div class="styBB" style="width:187mm; border-top: 0px black solid;">
				<div class="styPartName">Part II</div>
				<div class="styPartDesc">Special Depreciation Allowance and Other Depreciation (Don't 
				  <span class="styNormalText" style="font-size:7pt; padding-left:.1mm;">include listed property. See instructions.<span style="font-weight:bold">)</span></span>
				</div>
			  </div>
			  <!--   END PART II HEADER   -->
			  <!--   BEGIN LINE 14   -->
			  <div style="width:187mm;clear:all;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm;">14</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					Special depreciation allowance for qualified property (other than listed property) placed in service during the 
				  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn"></div>
				  <div class="styLNRightNumBox" style="border-bottom-width:0px;"></div>
				  <div class="styLNAmountBox" style="border-bottom-width:0px;"></div>
				</div>
			  </div>
			  <!-- end 14A -->
			  <!--  line 14B -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm;"/>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					tax year. See instructions. 
				  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">..........................</div>
				  <div class="styLNRightNumBox">14</div>
				  <div class="styLNAmountBox">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/SpecialAllowanceAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 14   -->
			  <!--   BEGIN LINE 15  -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					Property subject to section 168(f)(1) election
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/Section168f1ElectedPropertyAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">...................</div>
				  <div class="styLNRightNumBox" style="height:4.5mm;">15 </div>
				  <div class="styLNAmountBox"  style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/Section168f1ElectedPropertyAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 15   -->
			  <!--   BEGIN LINE 16  -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm;">16</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
				    Other depreciation (including ACRS)
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">.......................</div>
				  <div class="styLNRightNumBox" style="border-bottom-width:0px;">16 </div>
				  <div class="styLNAmountBox" style="border-bottom-width:0px;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/OtherDepreciationAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 16   -->
			  <!--   BEGIN PART III HEADER   -->
			  <div class="styBB" style="width:187mm; border-top: 1px black solid;">
				<div class="styPartName">Part III</div>
				<div class="styPartDesc">
				  <span style="width:5px;"/>MACRS Depreciation (Don't
				  <span class="styNormalText">include listed property. </span><span style="width:1mm;"/>
				  <span class="styNormalText"> See instructions.</span>)
				</div>
			  </div>
			  <!--   END PART III HEADER   -->
			  <div class="styIRS4562Section" style="clear:all;">Section A </div>
			  <!--   BEGIN LINE 17  -->
			  <div style="width:187mm; clear:all;">
			    <div style="float:left;">
				<div class="styLNLeftNumBox" style="height:4mm;">17</div>
				<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
				  MACRS deductions for assets placed in service in tax years beginning before 2019
				</div>
			  </div>
			    <div style="float:right;">
				  <div class="styDotLn">.........</div>
				  <div class="styLNRightNumBox">17</div>
				  <div class="styLNAmountBox">
				    <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/MACRSDedForAstInSrvcBfrPYAmt"/>
				    </xsl:call-template>
				  </div>
			    </div>
			  </div>
			  <!--   END LINE 17  -->
			  <!--   BEGIN LINE 18   -->
			  <!--  line 18 -->
			  <div style="width:187mm; height:10mm">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm;">18</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					If you are electing to group any assets placed in service during the tax year into one or more general asset<br/> accounts, check here
					<!--Dotted Line-->
					<span class="styFormTDotLnDesc" style="letter-spacing:4mm; font-weight:bold; text-align:right">...................</span>
					<img src="{$ImagePath}/4562_Bullet_Lg.gif" alt="Right Pointing Arrow"/>
					<span style="width:1mm;"/>
					<input type="checkbox" alt="General Asset Account Election Indicator" class="styIRS4562Ckbox">
					  <xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralAssetAccountElectionInd"/>
						<xsl:with-param name="BackupName">GeneralAssetAccountElection</xsl:with-param>
					  </xsl:call-template>
					</input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralAssetAccountElectionInd"/>
						<xsl:with-param name="BackupName">GeneralAssetAccountElectionLabel</xsl:with-param>
					  </xsl:call-template>
					</label>
				  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn"> </div>
				  <div class="styLNRightNumBox" style="border-bottom-width:0px; background-color: lightgrey; height:10mm;"> </div>
				  <div class="styLNAmountBox" style="border-bottom-width:0px; background-color:lightgrey; border-left-width:0px; height:10mm;"> </div>
				</div>
			  </div>
			  <!-- END LINE 18   -->
			  <div class="styIRS4562Section" style="float:none; clear:both; border-top-width:1px; border-bottom-width:0px; font-weight:bold; padding-left:10mm; font-size:7pt">
				Section B&#151;Assets Placed in Service During 2019 Tax Year Using the General Depreciation System
				<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem"/>
				</xsl:call-template>
				<span style="width:33mm;"/>
				<xsl:choose>
				  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty)&gt;1">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty"/>
					  <xsl:with-param name="containerHeight" select="1"/>
					  <xsl:with-param name="containerID" select=" 'GDctn' "/>
					  <xsl:with-param name="imageID" select=" 'GDimg' "/>
					  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty)&gt;1">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty"/>
					  <xsl:with-param name="containerHeight" select="1"/>
					  <xsl:with-param name="containerID" select=" 'GDctn' "/>
					  <xsl:with-param name="imageID" select=" 'GDimg' "/>
					  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty)&gt;1">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty"/>
					  <xsl:with-param name="containerHeight" select="1"/>
					  <xsl:with-param name="containerID" select=" 'GDctn' "/>
					  <xsl:with-param name="imageID" select=" 'GDimg' "/>
					  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty)&gt;1">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty"/>
					  <xsl:with-param name="containerHeight" select="1"/>
					  <xsl:with-param name="containerID" select=" 'GDctn' "/>
					  <xsl:with-param name="imageID" select=" 'GDimg' "/>
					  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty)&gt;1">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty"/>
						<xsl:with-param name="containerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'GDctn' "/>
						<xsl:with-param name="imageID" select=" 'GDimg' "/>
						<xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					  </xsl:call-template>
				  </xsl:when>
				  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty)&gt;1">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty"/>
					  <xsl:with-param name="containerHeight" select="1"/>
					  <xsl:with-param name="containerID" select=" 'GDctn' "/>
					  <xsl:with-param name="imageID" select=" 'GDimg' "/>
					  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty)&gt;1">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty"/>
					  <xsl:with-param name="containerHeight" select="1"/>
					  <xsl:with-param name="containerID" select=" 'GDctn' "/>
					  <xsl:with-param name="imageID" select=" 'GDimg' "/>
					  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty)&gt;2">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty"/>
					  <xsl:with-param name="containerHeight" select="2"/>
					  <xsl:with-param name="containerID" select=" 'GDctn' "/>
					  <xsl:with-param name="imageID" select=" 'GDimg' "/>
					  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp)&gt;2">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp"/>
					  <xsl:with-param name="containerHeight" select="2"/>
					  <xsl:with-param name="containerID" select=" 'GDctn' "/>
					  <xsl:with-param name="imageID" select=" 'GDimg' "/>
					  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify)&gt;2">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify"/>
					  <xsl:with-param name="containerHeight" select="2"/>
					  <xsl:with-param name="containerID" select=" 'GDctn' "/>
					  <xsl:with-param name="imageID" select=" 'GDimg' "/>
					  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:when test="count($IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty)&gt;1">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty"/>
					  <xsl:with-param name="containerHeight" select="1"/>
					  <xsl:with-param name="containerID" select=" 'GDctn' "/>
					  <xsl:with-param name="imageID" select=" 'GDimg' "/>
					  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
					</xsl:call-template>
				  </xsl:when>
				</xsl:choose>
			  </div>
<!--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Line 19 START &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
<!--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Line 19 START &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
			  <!--  BEGIN SECTION B, Line 19 TABLE  -->
			  <div class="styIRS4562TableContainer" style="height:100%" id="GDctn">
				<!--print logic-->
				<xsl:call-template name="SetInitialState"/>
				<!--end-->
				<table class="styIRS4562Table" cellspacing="0">
				  <thead class="styTableThead">
					<tr scope="col">
					  <th scope="col" class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center">
					    <b>(a)</b> Classification of property
					  </th>
					  <th scope="col" class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center">
						<b>(b)</b> Month and <br/>year placed in <br/>service
					  </th>
					  <th scope="col" class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center">
					    <b>(c)</b> Basis for depreciation<br/>(business/investment use<br/>only&#151;see instructions)
					  </th>
					  <th scope="col" class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
						<b>(d)</b> Recovery<br/>period
					  </th>
					  <th scope="col" class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
						<b>(e)</b> Convention
					  </th>
					  <th scope="col" class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
						<b>(f)</b> Method
					  </th>
					  <th scope="col" class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px; text-align:center">
						<b>(g)</b>Depreciation deduction
					  </th>
					</tr>
				  </thead>
				  <tfoot/>
				  <tbody>
				    <!--  3-YEARS PROPERTY -->
					<xsl:choose>
					  <xsl:when test="not(((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or 
					    (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or 
					    (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or 
					    (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or 
					    (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or 
					    (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or 
					    (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or 
                        (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or 
                        (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or 
                        (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or 
                        (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
						  <xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty">
						    <tr>
							  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							    <xsl:if test="position()=1">
								  <span class="styLN" style="text-align:right; font-weight:bold;">19a</span>
								  3-year property
							    </xsl:if>
							    <xsl:if test="position()!=1">
								  <span class="styLN" style="margin-left:3.25mm; font-weight:bold;">a</span>
								  3-year property
							    </xsl:if>
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellB">
							    <xsl:if test="position()=1">
								  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; background-color:lightgrey</xsl:attribute>
							    </xsl:if>
							    <xsl:if test="position() != 1">
								  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey</xsl:attribute>
							    </xsl:if>
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							    <xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							    </xsl:call-template>
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							    <xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="RecoveryPrd"/>
							    </xsl:call-template>
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							    <xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							    </xsl:call-template>
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							    <xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
							    </xsl:call-template>
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px;">
							    <xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							    </xsl:call-template>
							    <span class="styIRS4562TableCellPad"/>
							  </td>
						    </tr>
						  </xsl:for-each>
						  <xsl:if test="not($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty)">
						    <tr>
							  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							    <span class="styLN" style="text-align:right; font-weight:bold;">19a</span>
                                3-year property
                                <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; background-color:lightgrey;">
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							    <span class="styIRS4562TableCellPad"/>
							  </td>
							  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px;">
							    <span class="styIRS4562TableCellPad"/>
							  </td>
						    </tr>
						  </xsl:if>
					  </xsl:when>
					  <xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &lt;1">
						<xsl:call-template name="AddRowsPartIII">
						  <xsl:with-param name="Classification" select="3"/>
						</xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>
					    <tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styLN" style="font-weight:bold">19a<span style="width:3px"/></span>
							3-year property
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB">
							<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; background-color:lightgrey;</xsl:attribute>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; text-align:right">
							See Add'l Data
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:otherwise>
					</xsl:choose>
					<!-- 5-YEARS PROPERTY -->
					<xsl:if test="not(((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or
				      (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or   
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty">
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							<span class="styLN" style="margin-left:3.25mm; font-weight:bold">b</span>
							5-year property
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey;">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="RecoveryPrd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<xsl:if test="(count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &lt; 1) or 
					  (((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or   
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or    
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or     
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or     
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or     
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or           
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
				      <xsl:call-template name="AddRowsPartIII">
						<xsl:with-param name="Classification" select="5"/>
					  </xsl:call-template>
					</xsl:if>
					<!-- 7-YEARS PROPERTY -->
					<xsl:if test="not(((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or   
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or   
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or    
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or     
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or          
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or       
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or    
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty">
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styLN" style="margin-left:3.25mm; font-weight:bold">c</span>
                            7-year property
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color: lightgrey">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="RecoveryPrd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<xsl:if test="(count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &lt;1) or 
					  (((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or    
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or     
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or     
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or    
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or   
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or     
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or    
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or    
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:call-template name="AddRowsPartIII">
					    <xsl:with-param name="Classification" select="7"/>
					  </xsl:call-template>
					</xsl:if>
					<!-- 10-YEARS PROPERTY -->
					<xsl:if test="not(((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty">
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							<span class="styLN" style="margin-left:3.25mm; font-weight:bold">d</span>
						    10-year property
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="RecoveryPrd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							</xsl:call-template>
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<xsl:if test="(count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &lt;1) or 
					  (((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					    <xsl:call-template name="AddRowsPartIII">
					      <xsl:with-param name="Classification" select="10"/>
						</xsl:call-template>
					</xsl:if>
					<!-- 15-YEARS PROPERTY -->
					<xsl:if test="not(((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty">
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styLN" style="margin-left:3.25mm; font-weight:bold">e</span>
						    15-year property
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="RecoveryPrd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width 0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<xsl:if test="(count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &lt;1) or 
					  (((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or  
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:call-template name="AddRowsPartIII">
						<xsl:with-param name="Classification" select="15"/>
					  </xsl:call-template>
					</xsl:if>
					<!-- 20-YEARS PROPERTY -->
					<xsl:if test="not(((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty">
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styLN" style="margin-left:3.25mm; font-weight:bold">f</span>
                            20-year property
                            <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
			  			  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="RecoveryPrd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<xsl:if test="(count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &lt;1) or 				
					  (((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or 
                      (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or 
                      (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or                            	
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or                            	
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:call-template name="AddRowsPartIII">
						<xsl:with-param name="Classification" select="20"/>
					  </xsl:call-template>
					</xsl:if>
					<!-- 25-YEARS PROPERTY -->
					<xsl:if test="not(((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or                            	
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty">
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styLN" style="margin-left:3.25mm; font-weight:bold">g</span>
							25-year property
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
						    <xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    25 yrs.
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    S/L
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<xsl:if test="(count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &lt;1) or 
					  (((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:call-template name="AddRowsPartIII">
						<xsl:with-param name="Classification" select="25"/>
					  </xsl:call-template>
					</xsl:if>
					<!-- H Residential Rental Property  -->
					<xsl:variable name="ResidentialRowCount" select="count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty)"/>
					<xsl:if test="not(((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty">
						<tr>
						  <xsl:if test="position()=1">
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:if test="$ResidentialRowCount &lt;2">
								<xsl:attribute name="rowspan">2</xsl:attribute>
							  </xsl:if>
							  <xsl:if test="$ResidentialRowCount &gt;1">
								<xsl:attribute name="rowspan"><xsl:value-of select="$ResidentialRowCount"/></xsl:attribute>
							  </xsl:if>
							  <span class="styLN" style="margin-left: 3.25mm; font-weight: bold">h</span>
							  Residential rental<br/>
							  <span style="width: 10mm; margin-left: 5.5mm;">property</span>
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </xsl:if>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="MonthAndYearPlacedInServiceDt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                            27.5 yrs.
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    MM
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    S/L
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<xsl:if test="($ResidentialRowCount &lt;2) or (((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:if test="($ResidentialRowCount = 0) or (((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or                             
					    (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or                             
						(count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or                            
						(count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or                             
						(count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or                             
						(count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or                            
						(count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or                             
						(count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or                            
					    (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or                            
						(count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or                            
						(count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
						<tr>
						  <td class="styIRS4562TableCellA" rowspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styLN" style="margin-left:3.25mm; font-weight:bold">h</span>
							Residential rental<br/>
							<span style="width: 10mm; margin-left: 5.5mm;">property</span>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align: right">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    27.5 yrs.
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    MM
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    S/L
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
						<tr>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    27.5 yrs.
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    MM
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    S/L
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px;">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:if>
					  <xsl:if test="count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty)=1">
						<tr>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    27.5 yrs.
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    MM
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    S/L
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:if>
					</xsl:if>
					<!-- i Nonresidential real property  -->
					<xsl:variable name="Nonresidential1RowCount" select="count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp)"/>
					<xsl:variable name="Nonresidential2RowCount" select="count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify)"/>
					<xsl:variable name="NonresidentialTotalRowCount" select="$Nonresidential1RowCount +  $Nonresidential2RowCount"/>
					<xsl:if test="not(((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp">
						<tr>
						  <xsl:if test="position()=1">
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:if test="($NonresidentialTotalRowCount)&lt;2">
								<xsl:attribute name="rowspan">2</xsl:attribute>
							  </xsl:if>
							  <xsl:if test="($NonresidentialTotalRowCount)&gt;1">
								<xsl:if test="$Nonresidential2RowCount &lt;1">
								  <xsl:attribute name="rowspan"><xsl:value-of select="$NonresidentialTotalRowCount +1"/></xsl:attribute>
								</xsl:if>
								<xsl:if test="$Nonresidential2RowCount &gt; 0">
								  <xsl:attribute name="rowspan"><xsl:value-of select="$NonresidentialTotalRowCount"/></xsl:attribute>
								</xsl:if>
							  </xsl:if>
							  <span class="styLN" style="margin-left:3.25mm; font-weight:bold">i</span>
							  Nonresidential real<br/>
							  <span style="width:10mm; margin-left:5.5mm;">property</span>
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </xsl:if>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="MonthAndYearPlacedInServiceDt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    39 yrs.
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    MM
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    S/L
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					  <xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify">
						<tr>
						  <xsl:if test="$Nonresidential1RowCount=0">
							<xsl:if test="position()=1">
							  <tr>
								<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
								  <xsl:attribute name="rowspan"><xsl:value-of select="$Nonresidential2RowCount+1"/></xsl:attribute>
								  <span class="styLN" style="margin-left: 3.25mm; font-weight: bold">i</span>
								  Nonresidential real<br/>
								  <span style="width: 10mm; margin-left: 5.5mm;">property</span>
								  <span class="styIRS4562TableCellPad"/>
								</td>
								<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width: px; border-top-width:1px; border-bottom-width:0px">
								  <span class="styIRS4562TableCellPad"/>
								</td>
								<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
								  <span class="styIRS4562TableCellPad"/>
								</td>
								<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
								  39 yrs.<span class="styIRS4562TableCellPad"/>
								</td>
								<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
								  MM<span class="styIRS4562TableCellPad"/>
								</td>
								<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
								  S/L<span class="styIRS4562TableCellPad"/>
								</td>
								<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
								  <span class="styIRS4562TableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
						  </xsl:if>
						  <td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="MonthAndYearPlacedInServiceDt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="RecoveryPrd"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    MM
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    S/L
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							</xsl:call-template>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<xsl:if test="((count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) + 
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify))) = 0) or 
					  (((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or                             
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or                            
					  (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
					  <tr>
						<td class="styIRS4562TableCellA" rowspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  <span class="styLN" style="margin-left:3.25mm; font-weight:bold">i</span>
						  Nonresidential real<br/>
						  <span style="width:10mm; margin-left:5.5mm;">property</span>
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  39 yrs.
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  MM
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  S/L
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
						  <span class="styIRS4562TableCellPad"/>
						</td>
					  </tr>
					  <!-- begin another row -->
					  <tr>
						<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  MM
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  S/L
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
						  <span class="styIRS4562TableCellPad"/>
						</td>
					  </tr>
					</xsl:if>
					<xsl:if test="$Nonresidential2RowCount = 0 and $Nonresidential1RowCount != 0">
					  <tr>
						<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  MM
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						  S/L
						  <span class="styIRS4562TableCellPad"/>
						</td>
						<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
						  <span class="styIRS4562TableCellPad"/>
						</td>
					  </tr>
					</xsl:if>
				  </tbody>
				</table>
				<xsl:if test="$Print != $Separated">
				  <xsl:call-template name="SetInitialDynamicTableHeight">
					<xsl:with-param name="TargetNode" select="$IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty"/>
					<xsl:with-param name="containerHeight" select="1"/>
					<xsl:with-param name="containerID" select=" 'GDctn' "/>									
				  </xsl:call-template>
				</xsl:if>					
			  </div>
			  <!--   END SECTION B, Line19 TABLE   -->
<!--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Line 19 END &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
<!--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Line 19 END &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->

<!--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Line 20 START &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
<!--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Line 20 START &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
			  <!--  BEGIN SECTION B TABLE  -->
			  <div class="styIRS4562TableContainer"  id="SecBLine20">
				<!--print logic-->
				<xsl:call-template name="SetInitialState"/>
				<!--end-->
				<table class="styIRS4562Table" cellspacing="0">
				  <thead class="styTableThead">
					<tr scope="col">
					  <td style="border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px; font-weight:bold; text-align:center;" colspan="7">
                        Section C&#151;Assets Placed in Service During 2019 Tax Year Using the Alternative Depreciation System
						<xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="$IRS4562Data/AlternativeDepreciationSystem"/>
						</xsl:call-template>									
						<xsl:if test="not( ( (count($IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty) +
						  count($IRS4562Data/AlternativeDepreciationSystem/ADS12YearProperty) +
						  count($IRS4562Data/AlternativeDepreciationSystem/ADS40YearProperty)) &gt; 3) and ($Print = $Separated))">
						  <span style="float:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
							  <xsl:with-param name="TargetNode" select="$IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty"/>
							  <xsl:with-param name="containerHeight" select="3"/>
							  <xsl:with-param name="containerID" select=" 'SecBLine20' "/>
							  <xsl:with-param name="imageID" select=" 'GDimg' "/>
							  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
							</xsl:call-template>
						  </span>
						</xsl:if>
					  </td>
					</tr>
				  </thead>
				  <tfoot/>
				  <tbody>
				    <!-- BEGIN CLASS LIFE of Line 20a -->
					<xsl:choose>
					  <xsl:when test="not( ( (count($IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty) +
						count($IRS4562Data/AlternativeDepreciationSystem/ADS12YearProperty) +
						count($IRS4562Data/AlternativeDepreciationSystem/ADS40YearProperty)) &gt; 3) and ($Print = $Separated))">
						<xsl:for-each select="$IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty">
						  <tr>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							  <xsl:if test="position()=1">
								<span class="styLN" style="text-align:right; font-weight:bold;">20a</span>
								Class life
							  </xsl:if>
							  <xsl:if test="position()!=1">
								<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">a</span>
								Class life
							  </xsl:if>
							</td>
							<td class="styIRS4562TableCellB">
							  <xsl:if test="position()=1">
								<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; background-color: lightgrey</xsl:attribute>
							  </xsl:if>
							  <xsl:if test="position() != 1">
								<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color: lightgrey</xsl:attribute>
							  </xsl:if>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<!--???? DO NOT update border bottom width to 1px; the last repeating border line is thick????-->
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align: right">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  S/L
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:for-each>
						<xsl:if test="(count($IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty) &lt;1)">
						  <xsl:call-template name="AddRowsPartIII">
							<xsl:with-param name="Classification" select="1"/>
						  </xsl:call-template>
						</xsl:if>
						<!--  BEGIN 20b 12-YEAR -->
						<xsl:for-each select="$IRS4562Data/AlternativeDepreciationSystem/ADS12YearProperty">
						  <tr>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styLN" style="margin-left:3.25mm; font-weight:bold">b</span>
								12-year
								<span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey;">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						      12 yrs.
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							  S/L
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:for-each>
						<xsl:if test="count($IRS4562Data/AlternativeDepreciationSystem/ADS12YearProperty) &lt;1">
						  <xsl:call-template name="AddRowsPartIII">
							<xsl:with-param name="Classification" select="12"/>
						  </xsl:call-template>
						</xsl:if>
						<!--  BEGIN 20c 30-YEAR -->
						<xsl:for-each select="$IRS4562Data/AlternativeDepreciationSystem/ADS30YearProperty">
						  <tr>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styLN" style="margin-left:3.25mm; font-weight:bold">c</span>
								30-year
								<span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MonthAndYearPlacedInServiceDt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						      30 yrs.
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<!--Column E-->
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  MM
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							  S/L
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:for-each>
						<xsl:if test="count($IRS4562Data/AlternativeDepreciationSystem/ADS30YearProperty) &lt;1">
						  <xsl:call-template name="AddRowsPartIII">
							<xsl:with-param name="Classification" select="30"/>
						  </xsl:call-template>
						</xsl:if>
						<!--  BEGIN 20d 40-YEAR  -->
						<xsl:for-each select="$IRS4562Data/AlternativeDepreciationSystem/ADS40YearProperty">
						  <tr>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styLN" style="margin-left:3.25mm;font-weight:bold;">d</span>
							  40-year
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MonthAndYearPlacedInServiceDt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							  <xsl:call-template name="PopulateAmount">
							    <xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  40 yrs.
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  MM
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  S/L
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:for-each>
						<xsl:if test="count($IRS4562Data/AlternativeDepreciationSystem/ADS40YearProperty) &lt;1">
						  <xsl:call-template name="AddRowsPartIII">
							<xsl:with-param name="Classification" select="40"/>
						  </xsl:call-template>
						</xsl:if>
					  </xsl:when>
					  <xsl:otherwise>
					   <!-- BEGIN Blank 20a Class Life --> 
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styLN" style="font-weight:bold">20a       
							  <span style="width: 3px"/>
							</span>												
							Class life
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB">
							<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; background-color:lightgrey</xsl:attribute>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							See Add'l Data
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
							S/L
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
						<!-- BEGIN Blank 20b 12-Year --> 
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styLN" style="font-weight:bold">
							  <span style="width=3.5mm; padding-left:3mm"/>b
							  <span style="width: 3px"/>
							</span>
						    12-year
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB">
							<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey</xsl:attribute>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align: right,">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    12 yrs.
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							S/L
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
						<!-- BEGIN Blank 20c 30-Year --> 
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							<span class="styLN" style="font-weight:bold">
							  <span style="width=3.5mm; padding-left:3mm"/>c
							  <span style="width: 3px"/>
							</span>
						    30-year
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB">
							<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey</xsl:attribute>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align: right,">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    30 yrs.
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    MM
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							S/L
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
						<!-- BEGIN Blank 20d 40-Year -->
						<tr>
						  <td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
							<span class="styLN" style="font-weight: bold">
							  <span style="width=3.5mm;padding-left:3mm"/>d
							  <span style="width: 3px"/>
							</span>
						    40-year
						    <span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellB">
							<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;</xsl:attribute>
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							40 yrs.
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
						    MM
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							S/L
							<span class="styIRS4562TableCellPad"/>
						  </td>
						  <td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px;">
							<span class="styIRS4562TableCellPad"/>
						  </td>
						</tr>
					  </xsl:otherwise>
					</xsl:choose>
				  </tbody>
				</table>
			  </div>
			  <xsl:if test="not( ( (count($IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty) +
				count($IRS4562Data/AlternativeDepreciationSystem/ADS12YearProperty) +
				count($IRS4562Data/AlternativeDepreciationSystem/ADS40YearProperty)) &gt; 3) and ($Print = $Separated))">											 
				<xsl:call-template name="SetInitialDynamicTableHeight">
				  <xsl:with-param name="TargetNode" select="$IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty"/>
				  <xsl:with-param name="containerHeight" select="3"/>
				  <xsl:with-param name="containerID" select=" 'SecBLine20' "/>
				  <xsl:with-param name="imageID" select=" 'GDimg' "/>
				  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
				</xsl:call-template>
			  </xsl:if>
			  <!--   END SECTION B TABLE   -->
<!--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Line 20 END &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
<!--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Line 20 END &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
<!--<p style="page-break-before:always"/>-->
			  <!--   BEGIN PART IV HEADER   -->
			  <div class="styBB" style="width:187mm; border-top:1px black solid;height:4.5mm;">
				<div class="styPartName">Part IV</div>
				<div class="styPartDesc">
				  <span style="width:16px;"/>Summary <span class="styNormalText">  (See instructions.)</span>
			    </div>
			  </div>
			  <!--   END PART IV HEADER   -->
			  <!--   BEGIN LINE 21 of Part IV -->
			  <div style="width:187mm; clear:all;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm; width:6mm;">21</div>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					Listed property. Enter amount from line 28
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">.....................</div>
				  <div class="styLNRightNumBox">21 </div>
				  <div class="styLNAmountBox">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/TotalListedDepreciationAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!-- BEGIN LINE 22 of Part IV  -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm; width:5mm;">22</div>
				  <div class="styIRS4562LNDesc" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm; width:140mm;">
					<b>Total.</b> Add amounts from line 12, lines 14 through 17, lines 19 and 20 in column (g), and line 21. 
					Enter here
                  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn"> </div>
				  <div class="styLNRightNumBox" style="border-bottom-width:0px"></div>
				  <div class="styLNAmountBox" style="border-bottom-width:0px"></div>
				</div>
			  </div>
			  <!-- BEGIN LINE 22 2nd row of Part IV  -->
			  <div style="width:187mm;">
				<div style="float:left;">
				  <div class="styLNLeftNumBox" style="height:4mm; width:6mm"/>
				  <div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
					and on the appropriate lines of your return.  Partnerships and S corporations&#151;see instructions
				  </div>
				</div>
				<div style="float:right;">
				  <div class="styDotLn">.....</div>
				  <div class="styLNRightNumBox" style="border-bottom-width:0px">22 </div>
				  <div class="styLNAmountBox" style="border-bottom-width:0px">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/TotalDepreciationAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			  </div>
			  <!--   END LINE 22   -->
			  <!-- BEGIN LINE 23 of Part IV -->
			  <div class="styIRS4562LineItem" style="float:none; clear:all;">
			    <div class="styLNLeftNumBox" style="height:4mm; width:5mm;">23</div>
				  <span class="styIRS4562LNDesc" style="width:109mm">
					For assets shown above and placed in service during the current year, enter the portion of the basis attributable to section 263A costs
					<span class="styDotLn" style="float:right; padding-right:2mm;">.........</span>
  				  </span>
				  <span class="styLNRightNumBox" style="padding-top:4mm; border-top-width:1px; border-bottom-width:0px; height:7.5mm">23</span>
				  <div class="styIRS4562LNAmountBox" style="border-top-width:1px; border-bottom-width:0px; height:7.5mm; padding-top:4mm; width:32mm; font-size:7pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/Section263ACurrentYearCostAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="background-color:lightgrey; border-bottom-width:0px; border-top:1px solid black; height:7.5mm; width:32mm;"/>
				</div>
				<!--   END LINE 23   -->
				<!--BEGIN FOOTER of Page 1-->
				<div style="width:187mm; border-color:black; border-style:solid; border-right-width:0px; border-left-width:0px; border-top-width:2px; border-bottom-width:0px">
				  <div style="float:left; clear:none;">
					<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
					<span style="padding-left:8mm; width:71mm;"> Cat. No. 12906N </span>
					Form <span class="styBoldText" style="font-size:8pt">4562</span> (2019)
				  </div>
				</div>
				<!--END FOOTER of Page 1-->
				<p style="page-break-before:always"/>
				<!--BEGIN HEADER of Page 2-->
				<div class="styBB" style="width:187mm;">
				  <div style="float:left; clear:none;">Form 4562 (2019)</div>
				  <div style="float:right;">
					Page <span class="styBoldText" style="font-size:8pt;">2</span>
				  </div>
				</div>
				<!--END HEADER-->
				<!-- BEGIN PART V HEADER   -->
				<div class="styBB" style="width:187mm; border-top:1px black solid; height:16mm;">
				  <div class="styPartName">Part V</div>
				  <div class="styPartDesc">
					<span style="width:187mm; font-weight:normal;">
					  <b>Listed Property </b>(Include automobiles, certain other vehicles, certain aircraft, and property used for entertainment, <br/> recreation, or amusement.)
					</span>
				  </div>
				  <br/>
				  <br/>
				  <span style="padding-top:1mm">
					<div class="styPartName" style="background-color:white;"></div>
				   	<div >
					  <span style="width:170mm; font-size:8pt; padding-left:3mm">
					    <b>Note:</b>For any vehicle for which you are using the standard mileage rate or deducting lease expense, complete <b>only</b>
					  </span>
					</div>
				  </span>
				  <div class="styPartName" style="background-color:white;"></div>
				  <div class="styPartDesc">
					<span style="width:187mm; font-weight:normal;">
					  24a, 24b, columns (a) through (c) of Section A, all of Section B, and Section C if applicable.
					</span>
				  </div>
				</div>
				<!--   END PART V HEADER   -->
				<div class="styIRS4562Section" style="text-align:left; font-weight:normal; border-top-width:0px; clear:all;">
				  <b>Section A&#151;Depreciation and Other Information (Caution:</b> See the instructions for limits for passenger automobiles.<b>)</b>
				</div>
				<!--   BEGIN LINE 24a of section a Part V -->
				<span class="styIRS4562LNDesc" style="width:106mm;">
				  <b>24a&#160;</b>
				  <span style="font-family:arial;"> Do you have evidence to support the business/investment use claimed?</span>
				  <span style="width:2px;"/>
				<span>
				  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceToSupportDeductionInd"/>
				  </xsl:call-template>
				  <input type="checkbox" alt="Have Evidence To Support Claims Indicator Yes" class="styIRS4562Ckbox">
					<xsl:call-template name="PopulateYesCheckbox">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceToSupportDeductionInd"/>
					  <xsl:with-param name="BackupName">HaveEvidenceToSupportClaimsYes</xsl:with-param>
					</xsl:call-template>
				  </input>
				</span>
				<span style="font-size: 6pt">
				  <b>
					<label>
					  <xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceToSupportDeductionInd"/>
						<xsl:with-param name="BackupName">HaveEvidenceToSupportClaimsYesLabel</xsl:with-param>
					  </xsl:call-template>Yes
					</label>
				  </b>
				</span>
				<span>
				  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceToSupportDeductionInd"/>
				  </xsl:call-template>
				  <input type="checkbox"  alt="Have Evidence To Support Claims Indicator No" class="styIRS4562Ckbox">
					<xsl:call-template name="PopulateNoCheckbox">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceToSupportDeductionInd"/>
					  <xsl:with-param name="BackupName">HaveEvidenceToSupportClaimsNo</xsl:with-param>
					</xsl:call-template>
				  </input>
				</span>
				<span style="font-size:6pt">
				  <b>
					<label>
					  <xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceToSupportDeductionInd"/>
						<xsl:with-param name="BackupName">HaveEvidenceToSupportClaimsNoLabel</xsl:with-param>
					  </xsl:call-template>No
					</label>
				  </b>
				</span>
			  </span>
			  <span class="styIRS4562LNDesc" style="width:79mm; border-style:solid; border-color:black; border-left-width:1px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; padding-left:1mm;">
			    <b>24b</b> If "Yes," is the evidence written?
				<xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceWrittenInd"/>
				</xsl:call-template>
				<input type="checkbox" alt="Is Evidence Written Indicator Yes" class="styIRS4562Ckbox">
				  <xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceWrittenInd"/>
					<xsl:with-param name="BackupName">IsEvidenceWrittenYes</xsl:with-param>
				  </xsl:call-template>
				</input>
				<span style="font-size:6pt">
				  <b>
					<label>
					  <xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceWrittenInd"/>
						<xsl:with-param name="BackupName">IsEvidenceWrittenYesLabel</xsl:with-param>
					  </xsl:call-template>Yes
					</label>
				  </b>
				</span>
				<span>
				  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceWrittenInd"/>
				  </xsl:call-template>
				  <span style="width:2mm"/>
				  <input type="checkbox" alt="Is Evidence Written Indicator No" class="styIRS4562Ckbox">
					<xsl:call-template name="PopulateNoCheckbox">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceWrittenInd"/>
					  <xsl:with-param name="BackupName">IsEvidenceWrittenNo</xsl:with-param>
					</xsl:call-template>
				  </input>
				</span>
				<b>
				  <label>
					<xsl:call-template name="PopulateLabelNo">
					  <xsl:with-param name="TargetNode" select="$IRS4562Data/EvidenceWrittenInd"/>
					  <xsl:with-param name="BackupName">IsEvidenceWrittenNoLabel</xsl:with-param>
					</xsl:call-template>No
				  </label>
				</b>
				<span style="width:5.5mm;"/>
				<span style="float:right; width:6mm;background-color:yellow;"/>
				<xsl:call-template name="SetDynamicTableToggleButton">
				  <xsl:with-param name="TargetNode" select="$IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty"/>
				  <xsl:with-param name="containerHeight" select="1"/>
				  <xsl:with-param name="containerID" select=" 'BUctn' "/>
				  <xsl:with-param name="imageID" select=" 'GDimg' "/>
				  <xsl:with-param name="buttonID" select=" 'GDbtn' "/>
				</xsl:call-template>
			  </span>			
			  <!--	</div>-->
			  <!--   END LINE 24a   -->
			  <!-- This tracks the number of data elements for line 26 and 27 plus the number of constant rows. -->
			  <!-- 3 is the number of constant rows. -->
			  <xsl:variable name="tableRowCount" select="3 + 
					count($IRS4562Data/MoreThanHalfBusinessUseProp) + count($IRS4562Data/
					LessThanHalfBusinessUseProp)"/>
					<!--  BEGIN SECTION A TABLE  -->
					<div class="styIRS4562SectionATableContainer" id="BUctn" style="height:auto;">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr scope="col">
									<th scope="col" class="styTableCellHeader" style="border-color:black;border-top-width:1px;width:28mm;text-align:center;font-size:6pt;font-weight:normal;">
										<b>(a)</b>
										<br/>Type of property (list<br/>vehicles first)</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black;border-top-width:1px;width:17mm;text-align:center;font-size:6pt;font-weight:normal;">
										<b>(b)</b>
										<br/>Date placed in<br/>service</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black;border-top-width:1px;width:16mm;text-align:center;font-size:6pt;font-weight:normal;">
										<b>(c)</b>
										<br/>Business/<br/>investment<br/>use<br/>percentage</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black;border-top-width:1px;width:20mm;font-size:6pt;font-weight:normal">
										<b>(d)</b>
										<br/>Cost or other<br/>basis</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black;border-top-width:1px;width:20mm;font-size:6pt;font-weight:normal">
										<b>(e)</b>
										<br/>Basis for depreciation<br/>(business/investment<br/>use only)</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black;border-top-width:1px;width:9mm;font-size:6pt;font-weight:normal;">
										<b>(f)</b>
										<br/>Recovery<br/>period</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black;border-top-width:1px;width:17mm;text-align:center;font-size:6pt;font-weight:normal;">
										<b>(g)</b>
										<br/>Method/<br/>Convention</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black;border-top-width:1px;width:24mm;text-align:center;font-size:6pt;font-weight:normal;">
										<b>(h)</b>
										<br/>Depreciation/<br/>deduction</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black;border-top-width:1px;border-right-width:0px;width:24mm;text-align:center;font-size:6pt;font-weight:normal;">
										<b>(i)</b>
										<br/>Elected<br/>section 179<br/>cost</th>
								</tr>
							</thead>
							<tfoot/>							
							<tbody>
							<!-- Line 25  -->
							<tr>
							  <td class="styIRS4562OtherCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px" colspan="7">
								<div style="width:139mm; height:6mm; ">
								  <span style="width:7mm; font-weight:bold; text-align:top; padding-bottom:3mm;">25 </span>											
								  <span style="width:125mm;">Special depreciation allowance for qualified listed property placed in service during the tax year 						
									<span style="float:left;">  and used more than 50% in a qualified business use. See instructions. </span>
								    <span class="styDotLn" style="float:right; padding-right:1mm;">........</span>									
								  </span>								  
								  <span class="styTableCell" style="float:right; border-color:black; border-left-width:1px; border-right-width:0px; border-bottom-width:0px; width:7mm; font-size:7pt; ">
								    <span style="padding-top:4mm;">
								      <b>25</b>
								    </span>
								  </span>
								</div>
							  </td>
								<!--NOTE: When table contract the amount display that amount is not bottom aligned but when table expanded then the amount is bottom aligned.-->
								<td class="styTableCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-bottom-width:0px; width:24mm; font-size:6pt; padding-top:5mm">
								  <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS4562Data/TotalSpecialDeprecAllwncAmt"/>
								  </xsl:call-template>
								  <span class="styIRS4562TableCellPad"/>
								</td>
								<td class="styTableCell" style="border-color:black; border-left-width:0px; border-right-width:0px; border-bottom-width:0px; width:24mm; background-color: lightgrey">
								  <span style="width: 1px"/>
								</td>
							  </tr>
							  <!-- Line 26 -->
								<tr>
									<td class="styIRS4562OtherCell" style="border-color:black; border-left-width 0px; border-right-width:0px; border-top-width:1px; border-bottom-width:1px;" colspan="9">
										<b>26</b> Property used more than 50% in a qualified business use: 
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="not((count($IRS4562Data/MoreThanHalfBusinessUseProp) &gt; 3) and ($Print=$Separated))">
										<xsl:for-each select="$IRS4562Data/MoreThanHalfBusinessUseProp">
											<tr>
												<td class="styTableCell" style="width:28mm; font-size: 6pt; border-color:black; text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td nowrap="true" class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:center;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="PlacedInServiceDt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt; text-align:right">
												<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<!--  EXCEPTION: Amount data in a tabular table is right and bottom aligned but when table is contracted the amount display like is it not bottomed aligned, but when table expanded the amount is bottom aligned -->
												<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; padding-top:1mm; text-align:right">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<!-- EXCEPTION: Amount data in a tabular table is right and bottom aligned but when table is contracted the amount display like is it not bottomed aligned, but when table expanded the amount is bottom aligned -->
												<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; padding-top:1mm; text-align:right">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styTableCell" style="border-color:black; width:9mm; font-size:6pt; text-align:center">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
													</xsl:call-template>
													<span style="width:.5px;"/>
												</td>
												<td class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:center">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DeprecMthdAndConventionTypeCd"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<!--  EXCEPTION: Amount data in a tabular table is right and bottom aligned but when table is contracted the amount display like is it not bottomed aligned, but when table expanded the amount is bottom aligned -->
												<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt; padding-top:1mm; text-align:right;">
													<xsl:call-template name="PopulateAmount"> 
														<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<!--  EXCEPTION: Amount data in a tabular table is right and bottom aligned but when table is contracted the amount display like is it not bottomed aligned, but when table expanded the amount is bottom aligned -->
												<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt; border-right-width:0px; padding-top:1mm; text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ElectedSection179CostAmt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styTableCell" style="border-color:black; width:28mm; font-size:6pt">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4562Data/MoreThanHalfBusinessUseProp"/>
												</xsl:call-template>
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; text-align:center; width:17mm; font-size:6pt;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt; text-align:right">
												<span class="styIRS4562TableCellPad"/>%</td>
											<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:9mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:left;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt; border-right-width:0px;">
												<span class="styIRS4562TableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styTableCell" style="border-color:black; width:28mm; font-size:6pt">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; text-align:center; width:17mm; font-size:6pt;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt; text-align:right">
												<span class="styIRS4562TableCellPad"/>%</td>
											<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:9mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:left;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt; border-right-width:0px;">
												<span class="styIRS4562TableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styTableCell" style="border-color:black; width:29mm; font-size:6pt">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; text-align:center; width:16mm; font-size:6pt;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>%</td>
											<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:9mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:left;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt; border-right-width:0px;">
												<span class="styIRS4562TableCellPad"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="count($IRS4562Data/MoreThanHalfBusinessUseProp) &lt; 3">
									<xsl:call-template name="AddRowsLine26and27">
										<xsl:with-param name="Line" select="26"/>
										<xsl:with-param name="NumOfRows" select="3"/>
										<xsl:with-param name="BPCount" select="count($IRS4562Data/MoreThanHalfBusinessUseProp)"/>
									</xsl:call-template>
								</xsl:if>
								<tr>
									<td class="styIRS4562OtherCell" style="border-color:black; border-right-width:0px; border-bottom-width:1px;" colspan="9">
										<b>27</b> Property used 50% or less in a qualified business use: 
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="(not((count($IRS4562Data/LessThanHalfBusinessUseProp) &gt; 3) and ($Print=$Separated))) and ($IRS4562Data/LessThanHalfBusinessUseProp!='')">
										<xsl:for-each select="$IRS4562Data/LessThanHalfBusinessUseProp">
											<tr>
												<td class="styTableCell" style="border-color:black; text-align:left; width:28mm; font-size:6pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td nowrap="true" class="styTableCell" style="border-color:black; text-align:center; width:17mm; font-size:6pt">
														<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="PlacedInServiceDt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt; text-align:right">
												 <xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<!-- EXCEPTION: Amount data in a tabular table is right and bottom aligned but when table is contracted the amount display like is it not bottomed aligned, but when table expanded the amount is bottom aligned -->
												<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<!-- EXCEPTION: Amount data in a tabular table is right and bottom aligned but when table is contracted the amount display like is it not bottomed aligned, but when table expanded the amount is bottom aligned -->
												<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right;  padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styTableCell" style="border-color:black; width:9mm; font-size:6pt; text-align:center">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
													</xsl:call-template>
													<span style="width:.5px;"/>
												</td>
												<!-- Line 27 column g-->
												<td class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:center;">S/L-
         <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DepreciationConventionAndPreCd"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<!-- EXCEPTION: Amount data in a tabular table is right and bottom aligned but when table is contracted the amount display like is it not bottomed aligned, but when table expanded the amount is bottom aligned -->
												<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styTableCell">
													<!-- If this row is the last row of the table, put bottom border to the cell. Otherwise, don't the bottom border on the cell.-->
													<xsl:choose>
														<xsl:when test="( position() = last() ) and ( position() &gt;= 3 )">
															<xsl:attribute name="style">border-color:black; border-bottom-width:0px; border-right-width:0px; width:24mm; font-size:6pt; background-color: lightgrey</xsl:attribute>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="style">border-color:black; border-bottom-width:0px; border-right-width:0px; width:24mm; font-size:6pt; background-color: lightgrey</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="(count($IRS4562Data/LessThanHalfBusinessUseProp) &lt; 3)">
											<xsl:call-template name="AddRowsLine26and27">
												<xsl:with-param name="Line" select="27"/>
												<xsl:with-param name="NumOfRows" select="3"/>
												<xsl:with-param name="BPCount" select="count($IRS4562Data/LessThanHalfBusinessUseProp)"/>
												<xsl:with-param name="FirstCall">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:when test="($IRS4562Data/LessThanHalfBusinessUseProp='') or (not($IRS4562Data/LessThanHalfBusinessUseProp))">
										<xsl:call-template name="AddRowsLine26and27">
											<xsl:with-param name="Line" select="27"/>
											<xsl:with-param name="NumOfRows" select="3"/>
											<xsl:with-param name="BPCount" select="0"/>
											<xsl:with-param name="FirstCall">true</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styTableCell" style="border-color:black; width:28mm; font-size:6pt;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" 
													select="$IRS4562Data/LessThanHalfBusinessUseProp"/>
												</xsl:call-template>
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:center; border-color:black; width:17mm; font-size:6pt;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>%</td>
											<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:righ">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:9mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:left;">
												<span class="styIRS4562TableCellPad"/>S/L –</td>
											<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell">
												<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:24mm; font-size:6pt; background-color:lightgrey</xsl:attribute>
												<span class="styIRS4562TableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styTableCell" style="border-color:black; width:28mm; font-size:6pt;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:center; border-color:black; width:17mm; font-size:6pt;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>%</td>
											<td class="styTableCell" style="border-color:black; width:24mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:26mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:9mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:left;">
												<span class="styIRS4562TableCellPad"/>S/L –</td>
											<td class="styTableCell" style="border-color: black; width:24mm; font-size: 6pt">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell">
												<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:24mm; font-size:6pt; background-color:lightgrey</xsl:attribute>
												<span class="styIRS4562TableCellPad"/>
											</td>
										</tr>
										<tr>
											<td class="styTableCell" style="border-color:black; width:28mm; font-size:6pt">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:center; border-color:black; width:17mm; font-size:6pt">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:16mm; font-size:6pt; text-align:right">
												<span class="styIRS4562TableCellPad"/>%</td>
											<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:20mm; font-size:6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:9mm; font-size 6pt; text-align:right;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width:17mm; font-size:6pt; text-align:left;">
												<span class="styIRS4562TableCellPad"/>S/L –</td>
											<td class="styTableCell" style="border-color:black; width:24mm; font-size 6pt;">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styTableCell">
												<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:24mm; font-size:6pt; background-color:lightgrey</xsl:attribute>
												<span class="styIRS4562TableCellPad"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="$tableRowCount"/>
						<xsl:with-param name="containerHeight" select="9"/>
						<xsl:with-param name="containerID" select=" 'BUctn' "/>
					</xsl:call-template>
					<!--   END SECTION A TABLE   -->
					<!--   BEGIN LINE 28 -->
					<div class="styIRS4562LineItem" style="float:none; width:187mm; border: 0px solid black">
						<div class="styLNLeftNumBox" style="height:4mm; width:6mm;">28</div>
						<span class="styIRS4562LNDesc" style="width:115mm; padding-left 0; margin-left 0;">
							Add amounts in column (h), lines 25 through 27. Enter here and on line 21, page 1
			    		</span>    						
						<span style="float:right; clear:none;">						
							<span class="styLNRightNumBox" style="height:4mm;">28</span>
							<div class="styIRS4562LNAmountBox" style="width:28.5mm; padding-right:1mm; font-size:6.3pt; height:4mm;">
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS4562Data/TotalListedDepreciationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS4562LNAmountBox" style="border-top-width:1px; width:26mm; border-left:1px solid black; border-bottom-width:1px; border-top-width:1px; height:4mm; background-color:lightgray"/>
						</span>
					</div>
					<!--   END LINE 28   -->
					<!--   BEGIN LINE 29   -->
					<div class="styIRS4562LineItem">
				<div class="styLNLeftNumBox" style="height:4mm; width:5mm;">29</div>
						<span class="styIRS4562LNDesc" style="width:143.5mm;">
						Add amounts in column (i), line 26. Enter here and on line 7, page 1
						<span class="styDotLn" style="float:right; padding-right:2mm;">.............</span>
 						</span>
						<span class="styLNRightNumBox" style="border-bottom-width:0px;">29</span>
						<div class="styIRS4562LNAmountBox" style="width:28mm; border-bottom-width:0px; border-top-width:0px; padding-left:2.5mm; font-size:6.3pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS4562Data/TotalSection179ExpenseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 29   -->
					<div class="styIRS4562Section" style="border-top-width:1px; border-bottom-width:0px; clear:all;">Section B&#151;Information on Use of Vehicles</div>
					<div class="styIRS4562LineItem">
						Complete this section for vehicles used by a sole proprietor, partner, or other "more than 5% owner," or related person. If you provided vehicles to 
						your employees, first answer the questions in Section C to see if you meet an exception to completing this section for those vehicles.
					</div>
					<xsl:if test="not((count($IRS4562Data/VehicleUsage) &gt; 6) and $Print=$Separated)">
						<xsl:for-each select="$IRS4562Data/VehicleUsage">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="(position() mod 6)=1">
							<!--@@@@@Removed this attribute " height: 60.5Fline 37  mm; from Style @@@@@@@-->
								<div class="styIRS4562TableContainer" style="overflow:hidden; border-bottom-width:0px; clear:all;" id="GDctn">
									<!--print logic-->
									<xsl:call-template name="SetInitialState"/>
									<!--end-->
									<table class="styIRS4562Table" cellspacing="0">
										<thead class="styTableThead"/>
										<tfoot/>
										<tbody>
											<!-- get here -->
											<tr scope="col">
												<th scope="col" class="styIRS4562TableCellA" rowspan="2" style="padding-top:4mm;border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:55mm;">
													<div class="styLNLeftNumBox" style="height:4mm; width:6mm;">30</div>
														Total business/investment miles driven during the year (<b>don't</b> include 
														<span style="float:left;padding-left:6mm;"> commuting miles)</span>
													    <!--Dotted Line-->
														<span class="styDotLn" style="float:right;">......</span>
												</th>
												<th scope="col" class="styIRS4562TableCellA" colspan="2" style="width:22mm;border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
													<b>(a)</b>
													<br/>Vehicle <xsl:value-of select="position()"/>
												</th>
												<th scope="col" class="styIRS4562TableCellB" colspan="2" style="width:22mm;border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
													<b>(b)</b>
													<br/>Vehicle <xsl:value-of select="position()+1"/>
												</th>
												<th scope="col" class="styIRS4562TableCellC" colspan="2" style="width:22mm;border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
													<b>(c)</b>
													<br/>Vehicle <xsl:value-of select="position()+2"/>
												</th>
												<th scope="col" class="styIRS4562TableCellD" colspan="2" style="width:22mm;border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
													<b>(d)</b>
													<br/>Vehicle <xsl:value-of select="position()+3"/>
												</th>
												<th scope="col" class="styIRS4562TableCellE" colspan="2" style="width:22mm;border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
													<b>(e)</b>
													<br/>Vehicle <xsl:value-of select="position()+4"/>
												</th>
												<th scope="col" class="styIRS4562TableCellF" colspan="2" style="width:22mm;border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
													<b>(f)</b>
													<br/>Vehicle <xsl:value-of select="position()+5"/>
												</th>
											</tr>
											<!--  Line 30   -->
											<tr>
												<!-- Known Issue: Business Miles Count is a 12 digits text but per customer request to display with comma separating 3 digits -->
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 31  -->
											<!-- Commuting Miles Count is a 12 digits integer is numeric not an amount -->
											<tr>
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; width:55mm;">
		<!--												<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-bottom:2px">31</div>-->
                                                 <b>&#160;31&#160;</b>  Total commuting miles driven during 
													 <span style="float:left;padding-left:6mm;">  the year</span>
													    <!--Dotted Line-->
														<span class="styDotLn" style="float:right;">.........</span>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center; font-size:6.5pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center; font-size:6.5pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 32  -->
											<tr>
												<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:55mm;">
													<div class="styLNLeftNumBox" style="height:4mm; width:6mm; padding-top:1px;">32</div>
                                                         Total other personal (noncommuting) miles driven
														<span class="styDotLn" style="float:right;">........</span>
                                                </td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px; text-align:center; font-size:6.5pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center; font-size:6.5pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 33  -->
											<tr>
												<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:55mm;">
													<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-top:1px">33</div>
                                                      Total miles driven during the year. Add lines 30 through 32
														<span class="styDotLn" style="float:right;">....</span>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; text-align:center; font-size:6.5pt; padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!--  Yes and No Boxes -->
											<tr>
												<td class="styIRS4562TableCellA" valign="bottom" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:55mm;">
												<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 34  -->
											<tr>
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; width:55mm;">
													<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-top:1px">34</div>
                                                     Was the vehicle available for personal use during off-duty hours?
                                                     <!--Dotted Line ok -->
												<span class="styDotLn" style="float:right;">...</span>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-right-width: 0px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 35  -->
											<tr>
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; width: 55mm;">
													<div class="styLNLeftNumBox" style="height:8mm;width:6mm;padding-top:1px">35</div>
                                                    Was the vehicle used primarily by a more than 5% owner or related person?
                                                <!--Dotted Line ok -->
													<span class="styDotLn" style="float:right;">.........</span>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm;">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm;">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm;">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm;">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm;">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm;">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-right-width: 0px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 36  -->
											<tr>
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 55mm;">
												<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-top:1px">36</div>

											<!--	<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-top:1px">36</div>-->
<!--                                                       <b>&#160;36&#160;</b> 
-->
											 Is another vehicle available for personal use?
                                                 <!--Dotted Line ok -->
						            		<span class="styDotLn" style="float:right;">.......</span>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm;">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 1px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-right-width: 0px; border-bottom-width: 1px">
													<span style="font-weight: normal;padding-top:2mm">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="(count($IRS4562Data/VehicleUsage)=0) or ((count($IRS4562Data/VehicleUsage) &gt; 6) and $Print=$Separated)">
						<div class="styIRS4562TableContainer" style=" height: auto; border-bottom-width: 0px" id="GDctn">
							<!--print logic-->
							<!-- start here -->
							<xsl:call-template name="SetInitialState"/>
							<!--end-->
							<table class="styIRS4562Table" cellspacing="0">
								<thead class="styTableThead"/>
								<tfoot/>
								<tbody>
									<tr>
										<th scope="col" class="styIRS4562TableCellA" rowspan="2" 
										style="border-color: black; border-left-width: 0px;padding-top:4mm; 
										border-right-width: 1px; border-top-width: 1px;
										 border-bottom-width:0px; width: 122mm">
										<span style="padding-left:2mm"/>
											<span class="styIRS4562LNLeftNumBox" style="padding-top:2mm; height:7mm">30</span>
											<span style="padding-top:5mm"/>
											Total business/investment miles driven during the year<br/><span style="padding-left:2mm"/> (<b>don't </b>
                                            include commuting miles)
											<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
										</th>
										<th scope="col" class="styIRS4562TableCellA" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: center; font-size: 7pt;padding-top:2mm;">
											<b>(a)</b>
											<br/>Vehicle 1<br/><br/></th>
										<th scope="col" class="styIRS4562TableCellB" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: center; font-size: 7pt;padding-top:2mm;">
											<b>(b)</b>
											<br/>Vehicle 2<br/><br/></th>
										<th scope="col" class="styIRS4562TableCellC" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: center; font-size: 7pt;padding-top:2mm;">
											<b>(c)</b>
											<br/>Vehicle 3<br/><br/></th>
										<th scope="col" class="styIRS4562TableCellD" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; font-size: 7pt;padding-top:2mm;">
											<b>(d)</b>
											<br/>Vehicle 4<br/><br/></th>
										<th scope="col" class="styIRS4562TableCellE" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; font-size: 7pt;padding-top:2mm;">
											<b>(e)</b>
											<br/>Vehicle 5<br/><br/></th>
										<th scope="col" class="styIRS4562TableCellF" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px; text-align: center; font-size: 7pt;padding-top:2mm;">
											<b>(f)</b>
											<br/>Vehicle 6<br/><br/></th>
									</tr>
									<!--  Line 30   -->
									<tr>
										<td class="styIRS4562TableCellSmall2" colspan="2" 
										style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage"/>
												<xsl:with-param name="ShortMessage">true</xsl:with-param>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2"
										 colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
									<!-- Line 31  -->
									<tr>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; width:122mm">
											<span class="styIRS4562LNLeftNumBox" style="padding-top:0">31</span>
											<span style="padding-left:2mm"/>
											Total commuting miles driven during the year
											<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
									<!-- Line 32  -->
									<tr>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; width:122mm">
											<span class="styIRS4562LNLeftNumBox" style="padding-top:0">32</span>
                                            <span style="padding-left:2mm"/>
                                            Total other personal(noncommuting) miles driven
                                            <span class="styDotLn" style="float:right;padding-right:1mm;">...</span> 
                                        </td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
									<!-- Line 33  -->
									<tr>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; width: 122mm;">
											<span class="styIRS4562LNLeftNumBox" style="padding-top:0">33</span>
                                             <span style="padding-left:2mm"/>
                                             Total miles driven during the year. Add lines 30 <br/><span style="padding-left:2mm"/> through 32                                               
                                            <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
                                            </td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
									<!-- Line 34, Yes and No Boxes -->
									<tr>
										<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:122mm">
											<span class="styIRS4562LNLeftNumBox" style="padding-top:1mm;">34</span>
                                            <span style="padding-left:2mm;padding-top:3.5mm;"/>
                                               Was the vehicle available for personal use
                                            </td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>Yes</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>No</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>Yes</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family: verdana">
											<b>No</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>Yes</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>No</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>Yes</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>No</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>Yes</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>No</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>Yes</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellSmall" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; font-size:7pt; font-family:verdana">
											<b>No</b>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
									<!-- Line 34  -->
									<tr>
										<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:122mm;padding-top:0">
		        							<span style="width:19px"/> during off-duty hours?
		        							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
                                     		<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-right-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
									<!-- Line 35  -->
									<tr>
										<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width 0px; border-bottom-width:0px; width:122mm">
											<span class="styIRS4562LNLeftNumBox" style="padding-top:0;">35</span>
                                            <span style="padding-left:2mm;"/>
                                                    Was the vehicle used primarily by a more than 5% <br/><span style="padding-left:3mm;"/>owner or related person?
                                               <span class="styDotLn" style="float:right; padding-right:1mm;">...........</span>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-right-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
									<!-- Line 36  -->
									<tr>
										<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:122mm">
											<span class="styIRS4562LNLeftNumBox" style="padding-top:0;">36</span>
                                                 <span style="padding-left:2mm;"/>
                                                 Is another vehicle available for personal use?
                                                <span class="styDotLn" style="float:right; padding-right:1mm;">....</span> 
                                      		</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellYesNo" style="border-right-width:0px; border-bottom-width:0px;">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:if>
					<div class="styIRS4562Section" style="float:none; clear:both; border-top-width:1px; border-bottom-width:0px;">
						Section C&#151;Questions for Employers Who Provide Vehicles for Use by Their Employees
					</div>
					<div class="styIRS4562LineItem" style="float:none; clear:both; border-bottom-width:1px">
						Answer these questions to determine if you meet an exception to completing Section B for vehicles used by employees who 
						<b>aren't</b> more than 5% owners or related persons. See instructions.
					</div>
					<!-- START OF PART V SECTION C TABLE -->
					<table cellpadding="0" cellspacing="0" border="0" style="width:187mm; border:0px; padding 0px; margin 0px; font-size:7pt; font-family:Verdana, sans-serif;">
						<!-- Section C table -->
						<tbody>
							<tr style="width:187mm;">
								<!-- Line 37 -->
								<td valign="top" width="6mm">
									<span class="styIRS4562LNLeftNumBox" style="width:6mm; padding-top:2mm; padding-right:2mm;">37</span>
								</td>
								<td valign="top" width="176mm">
									<div class="styLNDesc" style="width:157mm; height:4.5mm; padding-top:2mm; font-size:7pt;">
										<span style="width:.1mm;"/>
											Do you maintain a written policy statement that prohibits all personal use of vehicles, including commuting, by your 
										<span style="float:left; clear:none; padding-left:1mm;">employees? </span>
										<span class="styDotLn" style="float:right; padding-right:1mm; ">..................................</span>
									</div>
								</td>
								<td width="14mm">
									<table cellspacing="0" cellpadding="0" border="0" width="14mm">
										<!-- Line 37 Y/N table -->
										<tbody>
											<tr>
												<td width="7mm">
													<span class="styIRS4562YesNoBox" style="font-weight:bold; height:5mm;">Yes</span>
												</td>
												<td width="7mm">
													<span class="styIRS4562YesNoBox" style="font-weight:bold; height:5mm;">No</span>
												</td>
											</tr>
											<tr>
												<td width="7mm">
													<!--  Yes box (37) -->
													<span class="styIRS4562YesNoBox">
														<span style="width:1px"/>
														<span style="font-weight:normal; height:8mm;">
															<xsl:call-template name="PopulateYesBoxText">
																<xsl:with-param name="TargetNode" select="$IRS4562Data/PolicyNoPrsnlOrCmmtngUseInd"/>
															</xsl:call-template>
														</span>
														<span style="width:1px"/>
													</span>
												</td>
												<td width="7mm">
													<!--  No box (37)  -->
													<span class="styIRS4562YesNoBox">
														<span style="width:1px"/>
														<span style="font-weight:normal; height:8mm;">
															<xsl:call-template name="PopulateNoBoxText">
																<xsl:with-param name="TargetNode" select="$IRS4562Data/PolicyNoPrsnlOrCmmtngUseInd"/>
															</xsl:call-template>
														</span>
														<span style="width:1px"/>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<!-- Line 38 -->
								<td valign="top">
									<span class="styIRS4562LNLeftNumBox">38</span>
								</td>
								<td valign="top" width="176mm">
									<span class="styIRS4562LNDesc" style="width:157mm; height:4.5mm; font-size:7pt;">
										Do you maintain a written policy statement that prohibits personal use of vehicles, except commuting, by your employees?
									    <span style="float:left; clear:none;">
										See the instructions for vehicles used by corporate officers, directors, or 1% or more owners 
										</span>										
									    <span class="styDotLn" style="float:right; padding-right:2mm;">.........</span>
									</span>
								</td>
								<td width="14mm">
									<table cellspacing="0" cellpadding="0" border="0" width="14mm">
										<!-- Line 38 Y/N table -->
										<tbody>
											<tr>
												<td width="7mm">
													<!--  Yes box (38) -->
													<span class="styIRS4562YesNoBox" style="height:7mm; padding-top:3mm;">
														<span style="width:1mm"/>
														<span style="font-weight:normal">
															<xsl:call-template name="PopulateYesBoxText">
																<xsl:with-param name="TargetNode" select="$IRS4562Data/PolicyNoPrsnlExcCmmtngUseInd"/>
															</xsl:call-template>
														</span>
														<span style="width:1px"/>
													</span>
												</td>
												<td width="7mm">
													<!--  No box (38)  -->
													<span class="styIRS4562YesNoBox" style="height:7mm; padding-top:3mm;">
														<span style="width:1mm"/>
														<span style="font-weight:normal">
															<xsl:call-template name="PopulateNoBoxText">
																<xsl:with-param name="TargetNode" select="$IRS4562Data/PolicyNoPrsnlExcCmmtngUseInd"/>
															</xsl:call-template>
														</span>
														<span style="width:1px"/>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<!-- Line 39 -->
								<td valign="top">
									<span class="styIRS4562LNLeftNumBox">39</span>
								</td>
								<td valign="top" width="176mm">
									<div class="styLNDesc" style="width:157mm; height:4.5mm; font-size:7pt;">
										<span style="float:left; clear:none; padding-left:1mm;">Do you treat all use of vehicles by employees as personal use?</span>
										<span class="styDotLn" style="float:right; padding-right:1mm;">...................</span>
									</div>
								</td>
								<td width="14mm">
									<table cellspacing="0" cellpadding="0" border="0" width="14mm">
										<!-- Line 39 Y/N table -->
										<tbody>
											<tr>
												<td width="7mm">
													<!--  Yes box (39) -->
													<span class="styIRS4562YesNoBox" style="height:5mm">
														<span style="width:1mm;"/>
														<span style="font-weight:normal;">
															<xsl:call-template name="PopulateYesBoxText">
																<xsl:with-param name="TargetNode" select="$IRS4562Data/TreatAllVehUseAsPrsnlUseInd"/>
															</xsl:call-template>
														</span>
														<span style="width:1px;"/>
													</span>
												</td>
												<td width="7mm">
													<!--  No box (39)  -->
													<span class="styIRS4562YesNoBox" style="height:5mm">
														<span style="width:1mm;"/>
														<span style="font-weight:normal;">
															<xsl:call-template name="PopulateNoBoxText">
																<xsl:with-param name="TargetNode" select="$IRS4562Data/TreatAllVehUseAsPrsnlUseInd"/>
															</xsl:call-template>
														</span>
														<span style="width:1px;"/>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<!-- Line 40 -->
								<td valign="top">
									<span class="styIRS4562LNLeftNumBox">40</span>
								</td>
								<td valign="top" width="176mm">
									<div class="styLNDesc" style="width:157mm; height:4.5mm; font-size:7pt; ">
										<span style="width:.1mm;"/> 
										Do you provide more than five vehicles to your employees, obtain information from your employees about the use of the 
										<span style="float:left; clear:none; padding-left:1mm;">vehicles, and retain the information received? </span>
										<span class="styDotLn" style="float:right; padding-right:1mm;">.......................</span>
									</div>
								</td>
								<td width="14mm">
									<table cellspacing="0" cellpadding="0" border="0" width="14mm">
										<!-- Line 40 Y/N table -->
										<tbody>
											<tr>
												<td width="7mm">
													<!--  Yes box (40) -->
													<span class="styIRS4562YesNoBox" style="height:7mm; padding-top:3mm;">
														<span style="width:1mm;"/>
														<span style="font-weight:normal;">
															<xsl:call-template name="PopulateYesBoxText">
																<xsl:with-param name="TargetNode" select="$IRS4562Data/ProvideOverNumVehAndHaveRecInd"/>
															</xsl:call-template>
														</span>
														<span style="width:1px;"/>
													</span>
												</td>
												<td width="7mm">
													<!--  No box (40)  -->
													<span class="styIRS4562YesNoBox" style="height:7mm; padding-top:3mm;">
														<span style="width:1mm;"/>
														<span style="font-weight:normal;">
															<xsl:call-template name="PopulateNoBoxText">
																<xsl:with-param name="TargetNode" select="$IRS4562Data/ProvideOverNumVehAndHaveRecInd"/>
															</xsl:call-template>
														</span>
														<span style="width:1px;"/>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<!-- Line 41 -->
								<td valign="top">
									<span class="styIRS4562LNLeftNumBox">41</span>
								</td>
								<td valign="top" width="176mm">
									<div class="styLNDesc" style="width:157mm; height:4.5mm; font-size:7pt; ">
										<span style="float:left; clear:none; padding-left:1mm;">
											Do you meet the requirements concerning qualified automobile demonstration use?  See instructions.
										</span>
										<span class="styDotLn" style="float:right; padding-right:1mm;">.......</span>
									</div>
								</td>
								<td width="14mm">
									<table cellspacing="0" cellpadding="0" border="0" width="14mm">
										<!-- Line 41 Y/N table -->
										<tbody>
											<tr>
												<td width="7mm">
													<!--  Yes box  -->
													<span class="styIRS4562YesNoBox" style="height:4.5mm; border-bottom-width:0px;">
														<span style="width:1mm;"/>
														<span style="font-weight:normal;">
															<xsl:call-template name="PopulateYesBoxText">
																<xsl:with-param name="TargetNode" select="$IRS4562Data/MeetRqrForAutoDemoUseInd"/>
															</xsl:call-template>
														</span>
														<span style="width:1px;"/>
													</span>
												</td>
												<td width="7mm">
													<!--  No box  -->
													<span class="styIRS4562YesNoBox" style="height:4.5mm; border-bottom-width:0px;">
														<span style="width:1mm;"/>
														<span style="font-weight:normal;">
															<xsl:call-template name="PopulateNoBoxText">
																<xsl:with-param name="TargetNode" select="$IRS4562Data/MeetRqrForAutoDemoUseInd"/>
															</xsl:call-template>
														</span>
														<span style="width:1px;"/>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<!-- Note line -->
								<td valign="top" width="3mm">
								</td>
								<td valign="top" width="176mm">
									<span class="styIRS4562LNDesc" style="font-size:7pt;">
										<span style="font-weight:bold;">Note: &#160; </span>
										<span style="text-decoration:italic;"> 
											If your answer to 37, 38, 39, 40, or 41 is "Yes," don't complete Section B for the covered vehicles.
										</span>
									</span>
								</td>
								<td width="14mm">
									<table cellspacing="0" cellpadding="0" border="0" width="14mm">
										<!-- Note line (gray) Y/N table -->
										<tbody>
											<tr>
												<td>
												<div class="styIRS4562LNAmountBox" style="width:22mm; background-color:lightgrey; border-left:1px solid black; border-top-width:1px; border-bottom-width:0px; height:4mm;"/>
												</td>
												<!--  No box  -->
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- END OF PART V SECTION C TABLE -->
					<!--   BEGIN PART VI HEADER   -->
					<div class="styBB" style="width:187mm; border-top:1px black solid; border-bottom:0 solid black; ">
						<div class="styPartName">Part VI</div>
						<div class="styPartDesc" style="width:173mm;">
							<span style="width:16px;"/>Amortization
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS4562Data/AmortizationInfo"/>
							</xsl:call-template>
							<div style="float:right; clear:none; vertical-align:top;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$IRS4562Data/AmortizationInfo/AmortizationInfoTable"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'ATctn' "/>
									<xsl:with-param name="imageID" select=" 'ATimg' "/>
									<xsl:with-param name="buttonID" select=" 'ATbtn' "/>
								</xsl:call-template>
							</div>	
						</div>
					</div>
					<!--   END PART VI HEADER   -->
					<!--  BEGIN PART VI TABLE  -->
					<div class="styIRS4562TableContainer" style="height:auto; clear:all;" id="ATctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styIRS4562Table" cellspacing="0">
							<thead class="styTableThead">
								<tr scope="col">
									<th scope="col" class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:40mm; text-align:center;">
										<b>(a)</b>
										<br/>Description of costs
									</th>
									<th scope="col" class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:23mm; text-align:center;">
										<b>(b)</b>
										<br/>Date amortization<br/>begins
									</th>
									<th scope="col" class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:31mm; text-align:center;">
										<b>(c)</b>
										<br/>Amortizable<br/>amount</th>
									<th scope="col" class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:43mm;">
										<b>(d)</b>
										<br/>Code<br/>section
									</th>
									<th scope="col" class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:19mm;">
										<b>(e)</b>
										<br/>Amortization<br/>period or<br/>percentage
									</th>
									<th scope="col" class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:1px; width:31mm;">
										<b>(f)</b>
										<br/>Amortization for<br/>this year
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<tr>
									<td class="styIRS4562OtherCell" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; " colspan="6">
										<span class="styIRS4562LNLeftNumBox">42</span>
										<span class="styLNDesc" style="padding-left:2mm;"> Amortization of costs that begins during your 2019 tax year (see instructions):</span>
										<span class="styIRS4562TableCellPad"/>
									</td>
								</tr>
								<xsl:if test="not((count($IRS4562Data/AmortizationInfo/AmortizationInfoTable) &gt; 2) and ($Print = $Separated))">
									<xsl:for-each select="$IRS4562Data/AmortizationInfo/AmortizationInfoTable">
										<tr>
											<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:40mm;">
												<span class="styLN">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CostDesc"/>
													</xsl:call-template>
												</span>
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellB" style="text-align:center; border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:23mm;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AmortizationBeginDt"/>
												</xsl:call-template>
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:31mm; text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmortizableAmt"/>
												</xsl:call-template>
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:43mm; text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CodeSectionTxt"/>
												</xsl:call-template>
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; width:19mm; text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AmortizationPeriodOrPctTxt"/>
												</xsl:call-template>
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px; width:31mm; text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmortizationThisYearAmt"/>
												</xsl:call-template>
												<span class="styIRS4562TableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($IRS4562Data/AmortizationInfo/AmortizationInfoTable) &lt;2">
									<xsl:call-template name="AddRowsPartVI">
										<xsl:with-param name="NumOfRows" select="2"/>
										<xsl:with-param name="ACount" select="count($IRS4562Data/AmortizationInfo/AmortizationInfoTable)"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($IRS4562Data/AmortizationInfo/AmortizationInfoTable) &gt; 2) and ($Print = $Separated)">
									<tr>
										<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:40mm;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4562Data/AmortizationInfo/AmortizationInfoTable"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:23mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:31mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:43mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; width:19mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:0px; width:31mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
									<tr>
										<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:40mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:23mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:31mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:43mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:19mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:1px; width:31mm;">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="$tableRowCount"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'ATctn' "/>
					</xsl:call-template>	
					</div>
					<!--   END PART VI TABLE   -->
					<!--   BEGIN LINE 43   -->
					<div class="styIRS4562LineItem" style="float:none; clear:both;">
						<span class="styIRS4562LNLeftNumBox" style="height:4.5mm; padding-top:1mm;">43</span>
						<div class="styLNDesc" style="width:128.8mm; height 4.5mm; padding-top:1mm;">
						<span style="float:left; clear:none; padding-left:3mm;">Amortization of costs that began before your 2019 tax year</span>
						<span class="styDotLn" style="float:right; padding-right:2mm;">............</span>
					</div>
						<span class="styLNRightNumBox"  style="height:4.5mm; padding-top:1mm;">43</span>
						<div class="styIRS4562LNAmountBox" style="width:47mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS4562Data/AmortizationCostsBeforeTYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 43   -->
					<!--   BEGIN LINE 44   -->
					<div class="styIRS4562LineItem" style="border-style:solid; border-color:black; border-bottom-width:2px; border-top-width:0px; border-left-width:0px; border-right-width:0px;">
						<span class="styIRS4562LNLeftNumBox" style="height:4.5mm; padding-top:1mm;">44</span>
						<div class="styLNDesc" style="width:128.8mm; height:4.5mm; padding-top:1mm;">
							<span style="float:left; clear:none; padding-left:3mm;">
								<b>Total. </b>Add amounts in column (f). See the instructions for where to report</span>
							<span class="styDotLn" style="float:right; padding-right:2mm;">.......</span>
						</div>
						<span class="styLNRightNumBox" style="border-bottom-width:0px; height:4.5mm; padding-top:1mm;">44</span>
						<div class="styIRS4562LNAmountBox" style="width:47mm; border-bottom-width:0px; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS4562Data/TotalAmortizationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 44   -->
					<!--   BEGIN FORM FOOTER  -->
					<div style="width:187mm; clear:both;">
						<div style="width:90mm; font-weight:bold;" class="styGenericDiv"/>
						<div style="width:55mm; text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">4562</span> (2019)</div>
					</div>
					<!--   END FORM FOOTER   -->
					<br/>
					<p style="page-break-before:always"/>
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
          Additional Data        
        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$IRS4562Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 4562, Top Left Margin - Note</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS4562Data/@section179ExpnsDedSummaryCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 4562, Top Left Margin - Note2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS4562Data/@extnsUnderAnnouncementCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 12 - Section 179 Expense Deduction Note</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS4562Data/Section179ExpenseDeductionAmt/@section179ExpnsDedSummaryCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<span style="height:2mm"/>
					<!-- Repeating vertical table for Part I, Line 6 -->
					<xsl:if test="(count($IRS4562Data/ElectedProperty) &gt; 2) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4562, Part I, Line 6:</span>
								<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="font-size:7pt;">
									<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:91mm; text-align:center;">
										<span style="float:left; padding-left:3mm; font-weight:bold;">6</span>
										<b>(a)</b> Description of property</th>
									<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:35mm; text-align:center; padding-left:10mm;">
										<b>(b)</b> Cost (business use only)</th>
									<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:29mm; text-align:center; padding-left:10mm;">
										<b>(c)</b> Elected cost</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS4562Data/ElectedProperty">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:91mm; padding-left:3mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:44mm; text-align:right; padding-left:10mm; padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostForBusinessUseOnlyAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:29mm; text-align:right; padding-left:10mm; padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ElectedCostAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Repeating vertical table for Part III, Line 19 -->
					<xsl:if test="(((count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &gt; 1) or                             (count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &gt; 1) or                             (count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &gt; 1) or                            (count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &gt; 1) or                             (count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &gt; 1) or                             (count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &gt; 1) or                            (count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty) &gt; 1) or                             (count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty) &gt; 2) or                            (count($IRS4562Data/GeneralDepreciationSystem/GDSNonResidentialRealProperty) &gt; 1) or                            (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) &gt; 1) or                            (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify) &gt; 1)) and $Print = $Separated)">
						<span style="height:2mm;"/>	
						<span class="styRepeatingDataTitle">Form 4562, Part III, Line 19, Section B&#151;Assets Placed in Service During 2019 Tax Year Using the General Depreciation System:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:8pt;">
							<thead class="styTableThead">
								<tr scope="col" class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: center">
										<b>(a)</b> Classification of property</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: center">
										<b>(b)</b> Month and <br/>year placed in <br/>service</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: center">
										<b>(c)</b> Basis for depreciation<br/>(business/investment use<br/>only&#151;see instructions)</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
										<b>(d)</b> Recovery<br/>period</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
										<b>(e)</b> Convention</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
										<b>(f)</b> Method</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px;text-align: center">
										<b>(g)</b>Depreciation deduction</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  3-year property  -->
								<xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
											<xsl:if test="position()=1">
												<span class="styLN" style="text-align: right; font-weight: bold">19a</span>
                                                     3-year property
                                              </xsl:if>
											<xsl:if test="position()!=1">
												<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">a</span>
                                                  3-year property
                                              </xsl:if>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB">
											<xsl:if test="position()=1">
												<xsl:attribute name="style">border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; background-color: lightgrey</xsl:attribute>
											</xsl:if>
											<xsl:if test="position() != 1">
												<xsl:attribute name="style">border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; background-color: lightgrey</xsl:attribute>
											</xsl:if>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) &lt;1">
									<!-- here1 -->
									<xsl:call-template name="AddRowsPartIII">
										<xsl:with-param name="Classification" select="3"/>
									</xsl:call-template>
								</xsl:if>
								<!-- 5-year property  -->
								<xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty">
									<tr>
										<xsl:choose>
											<xsl:when test="count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) mod 2 = 1">
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
											<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">b</span>
                                            5-year property
                                         <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; background-color: lightgrey">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) &lt; 1">
									<xsl:call-template name="AddRowsPartIII">
										<xsl:with-param name="Classification" select="5"/>
									</xsl:call-template>
								</xsl:if>
								<!-- 7-year property  -->
								<xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty">
									<tr>
										<xsl:choose>
											<xsl:when test="(count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) + count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty)) mod 2 = 1">
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">c</span>
                                           7-year property
                                           <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; background-color: lightgrey">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) &lt;1">
									<xsl:call-template name="AddRowsPartIII">
										<xsl:with-param name="Classification" select="7"/>
									</xsl:call-template>
								</xsl:if>
								<!-- 10-year property  -->
								<xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty">
									<tr>
										<xsl:choose>
											<xsl:when test="(count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) + count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) + count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty)) mod 2 = 1">
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
											<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">d</span>
                                            10-year property
                                         <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px;background-color: lightgrey">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) &lt;1">
									<xsl:call-template name="AddRowsPartIII">
										<xsl:with-param name="Classification" select="10"/>
									</xsl:call-template>
								</xsl:if>
								<!-- 15-year property  -->
								<xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty">
									<tr>
										<xsl:choose>
											<xsl:when test="(count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) +                                       count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty)) mod 2 = 1">
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">e</span>
                                         15-year property
                                           <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; background-color: lightgrey">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) &lt;1">
									<xsl:call-template name="AddRowsPartIII">
										<xsl:with-param name="Classification" select="15"/>
									</xsl:call-template>
								</xsl:if>
								<!-- 20-year property  -->
								<xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty">
									<tr>
										<xsl:choose>
											<xsl:when test="(count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) +                                       count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty)) mod 2 = 1">
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">f</span>
                                              20-year property
                                          <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; background-color: lightgrey">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationMethodCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) &lt;1">
									<xsl:call-template name="AddRowsPartIII">
										<xsl:with-param name="Classification" select="20"/>
									</xsl:call-template>
								</xsl:if>
								<!-- 25-year property  -->
								<xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty">
									<tr>
										<xsl:choose>
											<xsl:when test="(count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) +                                       count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty)) mod 2 = 1">
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">g</span>
                                           25-year property
                                          <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; background-color: lightgrey">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                       25 yrs.
                                          <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                              S/L
                                        <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty)=0">
									<tr>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">g</span>
                                        25-year property
                                        <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; background-color: lightgrey">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                             25 yrs.
                                            <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                        S/L
                                         <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Residential rental property  -->
								<xsl:variable name="ResidentialRowCount" select="count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty)"/>
								<xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;text-align:left;">
												<!-- Define background colors to the rows, since the previous row had rows within rows, it is necessary to color the first column differently than the rest of the rows. -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) +                                       count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) +                                       count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty)) mod 2 = 1">styDepTblRow2Cell</xsl:when><xsl:otherwise>styDepTblRow1Cell</xsl:otherwise></xsl:choose></xsl:attribute>
												<xsl:if test="$ResidentialRowCount &lt;2">
													<xsl:attribute name="rowspan">2</xsl:attribute>
												</xsl:if>
												<xsl:if test="$ResidentialRowCount &gt;1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$ResidentialRowCount"/></xsl:attribute>
												</xsl:if>
												<span class="styLN" style="margin-left: 2.5mm; font-weight: bold">h</span>
                                               Residential rental<br/>
												<span style="width: 10mm; margin-left: 5.5mm;">property</span>
												<span class="styIRS4562TableCellPad"/>
											</td>
										</xsl:if>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthAndYearPlacedInServiceDt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                          27.5 yrs.
                                              <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                          MM
                                        <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                          S/L
                                        <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="$ResidentialRowCount &lt;2">
									<xsl:if test="$ResidentialRowCount = 0">
										<tr class="styDepTblRow1">
											<td class="styIRS4562TableCellA" rowspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align:left;">
												<span class="styLN" style="margin-left: 2.5mm; font-weight: bold">h</span>
                                                Residential rental<br/>
												<span style="width: 10mm; margin-left: 5.5mm;">property</span>
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                              27.5 yrs.
                                               <span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                             MM
                                               <span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                               S/L
                                                 <span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
												<span class="styIRS4562TableCellPad"/>
											</td>
										</tr>
										<tr class="styDepTblRow2">
											<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                              27.5 yrs.
                                                <span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                               MM
                                                 <span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                                S/L
                                            <span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px;">
												<span class="styIRS4562TableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($IRS4562Data/GeneralDepreciationSystem/GDSResidentialRentalProperty)=1">
										<tr class="styDepTblRow2">
											<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
												<span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                           27.5 yrs.
                                             <span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                         MM
                                        <span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                               S/L
                                         <span class="styIRS4562TableCellPad"/>
											</td>
											<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
												<span class="styIRS4562TableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
								<!-- Nonresidential real property  -->
								<xsl:variable name="Nonresidential1RowCount" select="count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp)"/>
								<xsl:variable name="Nonresidential2RowCount" select="count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify)"/>
								<xsl:variable name="NonresidentialTotalRowCount" select="$Nonresidential1RowCount +  $Nonresidential2RowCount"/>
								<xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;text-align:left;">
												<!-- Define background colors to the rows, since the previous row had rows within rows, it is necessary to color the first column differently than the rest of the rows. -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(count($IRS4562Data/GeneralDepreciationSystem/GDS3YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS5YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS7YearProperty) +                                       count($IRS4562Data/GeneralDepreciationSystem/GDS10YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS15YearProperty) +                                        count($IRS4562Data/GeneralDepreciationSystem/GDS20YearProperty) +                                       count($IRS4562Data/GeneralDepreciationSystem/GDS25YearProperty)) mod 2 = 1">styDepTblRow1Cell</xsl:when><xsl:otherwise>styDepTblRow2Cell</xsl:otherwise></xsl:choose></xsl:attribute>
												<xsl:if test="($NonresidentialTotalRowCount)&lt;2">
													<xsl:attribute name="rowspan">2</xsl:attribute>
												</xsl:if>
												<xsl:if test="($NonresidentialTotalRowCount)&gt;1">
													<xsl:if test="$Nonresidential2RowCount &lt;1">
														<xsl:attribute name="rowspan"><xsl:value-of select="$NonresidentialTotalRowCount +1"/></xsl:attribute>
													</xsl:if>
													<xsl:if test="$Nonresidential2RowCount &gt; 0">
														<xsl:attribute name="rowspan"><xsl:value-of select="$NonresidentialTotalRowCount"/></xsl:attribute>
													</xsl:if>
												</xsl:if>
												<span class="styLN" style="margin-left: 2.5mm; font-weight: bold">i</span>
                                                  Nonresidential real<br/>
												<span style="width: 10mm; margin-left: 5.5mm;">property</span>
												<span class="styIRS4562TableCellPad"/>
											</td>
										</xsl:if>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthAndYearPlacedInServiceDt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                              39 yrs.
                                            <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                          MM
                                             <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                              S/L
                                               <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="$IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify">
									<tr>
										<xsl:choose>
											<xsl:when test="(count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp)) mod 2 = 1">
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<!-- Define background colors to the rows -->
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="$Nonresidential1RowCount=0">
											<xsl:if test="position()=1">
												<tr>
													<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
														<xsl:attribute name="rowspan"><xsl:value-of select="$Nonresidential2RowCount+1"/></xsl:attribute>
														<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">i</span>
                                                        Nonresidential real<br/>
														<span style="width: 10mm; margin-left: 5.5mm;">property</span>
														<span class="styIRS4562TableCellPad"/>
													</td>
													<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
														<span class="styIRS4562TableCellPad"/>
													</td>
													<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
														<span class="styIRS4562TableCellPad"/>
													</td>
													<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">39 yrs.<span class="styIRS4562TableCellPad"/>
													</td>
													<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">MM<span class="styIRS4562TableCellPad"/>
													</td>
													<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">S/L<span class="styIRS4562TableCellPad"/>
													</td>
													<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
														<span class="styIRS4562TableCellPad"/>
													</td>
												</tr>
											</xsl:if>
										</xsl:if>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthAndYearPlacedInServiceDt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
                                       MM
                                       <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                            S/L
                                         <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="((count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealProp) + (count($IRS4562Data/GeneralDepreciationSystem/GDSNonRsdntlRealPropSpecify))) = 0)">
									<tr>
										<td class="styIRS4562TableCellA" rowspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">i</span>
                                                Nonresidential real<br/>
											<span style="width: 10mm; margin-left: 5.5mm;">property</span>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                         39 yrs.
                                            <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                         MM
                                             <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                          S/L
                                         <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
									<tr>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                        MM
                                      <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                         S/L
                                            <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="$Nonresidential2RowCount = 0 and $Nonresidential1RowCount != 0">
									<tr>
										<td class="styIRS4562TableCellB" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: right">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                        MM
                                        <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px">
                                              S/L
                                          <span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px">
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<!-- END SRD  -->
					</xsl:if>
					<!-- Repeating vertical table for Part III, Line 20a - d in separate format -->
					<xsl:if test="((count($IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty) &gt; 1) or                            		
					  (count($IRS4562Data/AlternativeDepreciationSystem/ADS12YearProperty) &gt; 1) or                            
					  (count($IRS4562Data/AlternativeDepreciationSystem/ADS40YearProperty) &gt; 1)) and ($Print = $Separated)">
					  <br/>
					  <span class="styRepeatingDataTitle">
					    Form 4562, Part III, Line 20, Section C&#151;Assets Placed in Service During 2019 Tax Year Using the Alternative Depreciation System:
					  </span>
					  <!--	<span class="styBB" style="border-bottom-width:0px">	-->
					  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
						  <tr scope="col" class="styDepTblHdr">
							<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							  <b>(a)</b> Classification of property
							</th>
							<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							  <b>(b)</b> Month and <br/>year placed in <br/>service
							</th>
							<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							  <b>(c)</b> Basis for depreciation<br/>(business/investment use<br/>only&#151;see instructions)</th>
							<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							  <b>(d)</b> Recovery<br/>period
							</th>
							<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							  <b>(e)</b> Convention
							</th>
							<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							  <b>(f)</b> Method
							</th>
							<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px; text-align:center">
							  <b>(g)</b>Depreciation deduction
							</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						<!--  Class life Part III, line 20a  -->
						<xsl:for-each select="$IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty">
						  <tr>
							<!-- Define background colors to the rows -->
							<xsl:attribute name="class">
							  <xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							  </xsl:choose>
							</xsl:attribute>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							  <xsl:if test="position()=1">
								<span class="styLN" style="text-align: right; font-weight: bold;">20a</span>
                                Class life
                              </xsl:if>
							  <xsl:if test="position()!=1">
								<span class="styLN" style="margin-left: 3.25mm; font-weight: bold">a</span>
                                Class life
                              </xsl:if>
							</td>
							<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey;">
							  <!--<xsl:if test="position()=1">
								<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; background-color:lightgrey</xsl:attribute>
							  </xsl:if>
							  <xsl:if test="position() != 1">
								<xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color lightgrey</xsl:attribute>
							  </xsl:if>-->
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              S/L
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:for-each>
						<xsl:if test="count($IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty)=0">
						  <tr>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styLN" style="text-align: right; font-weight: bold">20a</span>
                              Class life
                            </td>
							<td class="styIRS4562TableCellB">
							  <xsl:attribute name="style">border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; background-color:lightgrey</xsl:attribute>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              S/L
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!--  12-year Part III, line 20b -->
						<xsl:for-each select="$IRS4562Data/AlternativeDepreciationSystem/ADS12YearProperty">
						  <tr>
							<xsl:choose>
							  <xsl:when test="(count($IRS4562Data/AlternativeDepreciationSystem/ADS12YearProperty)) mod 2 = 1">
								<!-- Define background colors to the rows -->
								<xsl:attribute name="class">
								  <xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
									<xsl:otherwise>styDepTblRow1</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
							  </xsl:when>
							  <xsl:otherwise>
								<!-- Define background colors to the rows -->
								<xsl:attribute name="class">
								  <xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
							  </xsl:otherwise>
							</xsl:choose>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styLN" style="margin-left: 3.25mm; font-weight: bold">b</span>
                              12-year
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey;">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              12 yrs.
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              S/L
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:for-each>
						<xsl:if test="count($IRS4562Data/AlternativeDepreciationSystem/ADS12YearProperty)=0">
						  <tr>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width 1px; border-bottom-width:0px">
						      <span class="styLN" style="margin-left: 3.25mm; font-weight: bold">b</span>
                              12-year
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey;">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right;">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              12 yrs.
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              S/L
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!--  30-year Part III, line 20c -->
						<xsl:for-each select="$IRS4562Data/AlternativeDepreciationSystem/ADS30YearProperty">
						  <tr>
							<xsl:choose>
							  <xsl:when test="(count($IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty)) mod 2 = 1">
								<!-- Define background colors to the rows -->
								<xsl:attribute name="class">
								  <xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
									<xsl:otherwise>styDepTblRow1</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
							  </xsl:when>
							  <xsl:otherwise>
								<!-- Define background colors to the rows -->
								<xsl:attribute name="class">
								  <xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
							  </xsl:otherwise>
							</xsl:choose>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styLN" style="margin-left: 3.25mm; font-weight: bold">c</span>
                              30-year
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MonthAndYearPlacedInServiceDt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              30 yrs.
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  MM
							  <!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DepreciationConventionCd"/>
							  </xsl:call-template>-->
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              S/L
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:for-each>
						<xsl:if test="count($IRS4562Data/AlternativeDepreciationSystem/ADS30YearProperty)=0">
						  <tr>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width 1px; border-bottom-width:0px">
						      <span class="styLN" style="margin-left: 3.25mm; font-weight: bold">c</span>
                              30-year
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:0px; border-bottom-width:0px; background-color:lightgrey;">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right;">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              30 yrs.
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  MM
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              S/L
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!--  40-year Part III, line 20d   -->
						<xsl:for-each select="$IRS4562Data/AlternativeDepreciationSystem/ADS40YearProperty">
						  <tr>
							<xsl:choose>
							  <xsl:when test="(count($IRS4562Data/AlternativeDepreciationSystem/ADSClassLifeProperty) +                                         count($IRS4562Data/AlternativeDepreciationSystem/ADS12YearProperty)) mod 2 = 1">
							    <!-- Define background colors to the rows -->
							    <xsl:attribute name="class">
								  <xsl:choose>
								    <xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
								    <xsl:otherwise>styDepTblRow1</xsl:otherwise>
								  </xsl:choose>
							    </xsl:attribute>
							  </xsl:when>
							  <xsl:otherwise>
								<!-- Define background colors to the rows -->
								<xsl:attribute name="class">
								  <xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
							  </xsl:otherwise>
							</xsl:choose>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styLN" style="margin-left: 3.25mm; font-weight: bold">d</span>
                              40-year
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MonthAndYearPlacedInServiceDt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              40 yrs.
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width 0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              MM
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              S/L
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
							  </xsl:call-template>
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:for-each>
						<xsl:if test="count($IRS4562Data/AlternativeDepreciationSystem/ADS40YearProperty)=0">
						  <tr>
							<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px;">
							  <span class="styLN" style="margin-left:3.25mm; font-weight:bold">d</span>
                              40-year
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:center;">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; text-align:right">
							  <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              40 yrs.
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              MM
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px">
                              S/L
                              <span class="styIRS4562TableCellPad"/>
							</td>
							<td class="styIRS4562TableCellG" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px">
							  <span class="styIRS4562TableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
					  </tbody>
					</table>
					<!--</span>-->	
				  </xsl:if>
				  <!-- Repeating vertical table for Part V, Line 26 -->
					<xsl:if test="(count($IRS4562Data/MoreThanHalfBusinessUseProp) &gt; 3) and ($Print = $Separated)">
					
						<span class="styRepeatingDataTitle">Form 4562, Part V, Line 26, Property used more than 50% in a qualified business use: </span>
						<table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="overflow-y: hide; margin: 0px; padding: 0px;">
							<thead class="styTableThead">
								<tr scope="col" class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:29mm; text-align: center; font-size: 6pt">
										<b>(a)</b>
										<br/>Type of property (list<br/>vehicles first)</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:16mm; text-align: center; font-size: 6pt">
										<b>(b)</b>
										<br/>Date placed in<br/>service</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:16mm; text-align: center; font-size: 6pt">
										<b>(c)</b>
										<br/>Business/<br/>investment<br/>use<br/>percentage</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:24mm; font-size: 6pt">
										<b>(d)</b>
										<br/>Cost or other<br/>basis</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:26mm; font-size: 6pt">
										<b>(e)</b>
										<br/>Basis for depreciation<br/>(business/investment<br/>use only)</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:9mm; font-size: 6pt">
										<b>(f)</b>
										<br/>Recovery<br/>period</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:17mm; text-align: center; font-size: 6pt">
										<b>(g)</b>
										<br/>Method/<br/>Convention</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:24mm; text-align: center; font-size: 6pt">
										<b>(h)</b>
										<br/>Depreciation/<br/>deduction</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px; width:24mm; text-align: center; font-size: 6pt">
										<b>(i)</b>
										<br/>Elected<br/>section 179<br/>cost</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS4562Data/MoreThanHalfBusinessUseProp">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:29mm; font-size: 6pt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style="text-align: center; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:16mm; font-size: 6pt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="PlacedInServiceDt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:16mm; font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:24mm; font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:26mm; font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:9mm; font-size: 6pt; text-align: right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
											</xsl:call-template>
											<span style="width:.5px;"/>
											<!--span class="styIRS4562TableCellPad"></span-->
										</td>
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:17mm; font-size: 6pt; text-align: center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DeprecMthdAndConventionTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellH" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:24mm; font-size: 6pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellI" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px; width:24mm; font-size: 6pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ElectedSection179CostAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Repeating vertical table for Part V, Line 27 -->
					<xsl:if test="(count($IRS4562Data/LessThanHalfBusinessUseProp) &gt; 3) and ($Print = $Separated)">
						<br/>
						<span class="styRepeatingDataTitle">Form 4562, Part V, Line 27, Property used 50% or less in a qualified business use:</span>
						<table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="overflow-y: hide; margin: 0px; padding: 0px;">
							<thead class="styTableThead">
								<tr scope="col" class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:29mm; text-align: center; font-size: 6pt">
										<b>(a)</b>
										<br/>Type of property (list<br/>vehicles first)</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:16mm; text-align: center; font-size: 6pt">
										<b>(b)</b>
										<br/>Date placed in<br/>service</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:16mm; text-align: center; font-size: 6pt">
										<b>(c)</b>
										<br/>Business/<br/>investment<br/>use<br/>percentage</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:24mm; font-size: 6pt">
										<b>(d)</b>
										<br/>Cost or other<br/>basis</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:26mm; font-size: 6pt">
										<b>(e)</b>
										<br/>Basis for depreciation<br/>(business/investment<br/>use only)</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:9mm; font-size: 6pt">
										<b>(f)</b>
										<br/>Recovery<br/>period</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:17mm; text-align: center; font-size: 6pt">
										<b>(g)</b>
										<br/>Method/<br/>Convention</th>
									<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:24mm; text-align: center; font-size: 6pt">
										<b>(h)</b>
										<br/>Depreciation/<br/>deduction</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS4562Data/LessThanHalfBusinessUseProp">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:29mm; font-size: 6pt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellB" style=" text-align: center; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:16mm; font-size: 6pt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="PlacedInServiceDt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellC" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:16mm; font-size: 6pt; text-align: right;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellD" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:24mm; font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellE" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:26mm; font-size: 6pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BasisForDepreciationAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellF" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:9mm; font-size: 6pt; text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecoveryPrd"/>
											</xsl:call-template>
											<span style="width:.5px;"/>
											<!--span class="styIRS4562TableCellPad"></span-->
										</td>
										<!-- Line 27 column g repeating-->
										<td class="styIRS4562TableCellG" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:17mm; font-size: 6pt; text-align: center;">S/L-
                                            <xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DepreciationConventionAndPreCd"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
										<td class="styIRS4562TableCellH" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:24mm; font-size: 6pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
											</xsl:call-template>
											<span class="styIRS4562TableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Repeating vertical table for Part V, Line 30-36 -->
					<xsl:if test="(count($IRS4562Data/VehicleUsage) &gt; 6) and ($Print = $Separated)">
						<br/>
						<span class="styRepeatingDataTitle">Form 4562, Part V, Lines 30-36, Section B—Information on Use of Vehicles:</span>
						<xsl:for-each select="$IRS4562Data/VehicleUsage">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="(position() mod 6)=1">
								<xsl:if test="position() &gt; 6">
									<br/>
								</xsl:if>
								<div class="styIRS4562TableContainer" style="overflow:hidden; height: 60.5Fline 37  mm; border-bottom-width: 0px" id="GDctn">
									<!--print logic-->
									<xsl:call-template name="SetInitialState"/>
									<!--end-->
									<table class="styDepTbl" cellspacing="0">
										<thead class="styTableThead">
											<tr scope="col" class="styDepTblHdr">
												<th scope="col" class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; width: 122mm">
													<span class="styIRS4562TableCellPad"/>
												</th>
												<th scope="col" class="styDepTblCell" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center; font-size: 7pt">
													<b>(a)</b>
													<br/>Vehicle <xsl:value-of select="position()"/>
												</th>
												<th scope="col" class="styDepTblCell" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center; font-size: 7pt">
													<b>(b)</b>
													<br/>Vehicle <xsl:value-of select="position() + 1"/>
												</th>
												<th scope="col" class="styDepTblCell" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center; font-size: 7pt">
													<b>(c)</b>
													<br/>Vehicle <xsl:value-of select="position() + 2"/>
												</th>
												<th scope="col" class="styDepTblCell" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; font-size: 7pt">
													<b>(d)</b>
													<br/>Vehicle <xsl:value-of select="position() + 3"/>
												</th>
												<th scope="col" class="styDepTblCell" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; font-size: 7pt">
													<b>(e)</b>
													<br/>Vehicle <xsl:value-of select="position() + 4"/>
												</th>
												<th scope="col" class="styDepTblCell" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: center; font-size: 7pt">
													<b>(f)</b>
													<br/>Vehicle <xsl:value-of select="position() + 5"/>
												</th>
											</tr>
										</thead>
										<tfoot/>
										<tbody>
											<!--  Line 30   -->
											<tr class="styDepTblRow1">
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 122mm">
													<span class="styLN" style="text-align: center; font-weight: bold; width: 4.5mm;">30</span>
                                                     Total business/investment miles driven<br/>
													<span style="width: 5mm"/>during the year (<b>don't </b>
                                                         include commuting<br/>
													<span style="width: 5mm"/>miles&#151;See page 2 of the instructions)
                                                      </td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/BusinessMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 31  -->
											<tr class="styDepTblRow2">
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:122mm">
														<span class="styLN" style="text-align: center; font-weight: bold; width: 4.5mm;">31</span>
                                                            Total commuting miles driven during the year
                                                              <span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/CommutingMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 32  -->
											<tr class="styDepTblRow1">
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:122mm">
													<span class="styLN" style="text-align: center; font-weight: bold; width: 4.5mm;">32</span>
                                                      Total other personal (noncommuting) miles driven
                                                         <span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/OtherPersonalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 33  -->
											<tr class="styDepTblRow2">
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 122mm">
													<span class="styLN" style="text-align: center; font-weight: bold; width: 4.5mm;">33</span>
                                                       Total miles driven during the year.  Add lines 30 <span style="padding-left:9.5mm"/> through  32
                                                         <span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellSmall2" colspan="2" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/TotalMilesCnt"/>
													</xsl:call-template>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!--  Yes and No Boxes -->
											<tr class="styDepTblHdr">
												<td class="styIRS4562TableCellA" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 122mm;">
													<!--<span style="width: 5mm;"></span>Add lines 30 through 32-->
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>Yes</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styDepTblCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; font-size: 7pt;font-family: verdana">
													<b>No</b>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 34  -->
											<tr class="styDepTblRow1">
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 122mm">
													<span class="styLN" style="text-align: center; font-weight: bold; width: 4.5mm;">34</span>
                                                       Was the vehicle available for personal use during off-<span style="padding-left:5mm"/>duty hours?
                                                   <span style="width: 5mm"/>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-right-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/VehicleAvailableOffDutyHrsInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 35  -->
											<tr class="styDepTblRow2">
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 122mm">
														<span class="styLN" style="text-align: center; font-weight: bold; width: 4.5mm;">35</span>
                                                        Was the vehicle used primarily by a more than 5%  <span style="padding-left:7mm"/>owner or related person?
                                                           <span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-right-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/UsedPrimarilyByOwnerInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
											<!-- Line 36  -->
											<tr class="styDepTblRow1">
												<td class="styIRS4562TableCellA" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; width: 122mm;">
													<span class="styLN" style="text-align: center; font-weight: bold; width: 4.5mm;">36</span>
                                                      Is another vehicle available for personal use?
                                                        <span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 1]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 2]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 3]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 4]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
												<td class="styIRS4562TableCellYesNo" style="border-right-width: 0px; border-bottom-width: 0px">
													<span style="font-weight: normal">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS4562Data/VehicleUsage[$pos + 5]/AnotherVehicleForPrsnlUseInd"/>
														</xsl:call-template>
													</span>
													<span class="styIRS4562TableCellPad"/>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- Repeating vertical table for Part VI, Line 42 -->
					<xsl:if test="(count($IRS4562Data/AmortizationInfo/AmortizationInfoTable) &gt; 2) and ($Print = $Separated)">
						<br/>
						<span class="styRepeatingDataTitle">Form 4562, Part VI, Line 42, Amortization of costs that begins during your 2019 tax year (see instructions):</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr scope="col" class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:40mm; text-align:center;">
										<b>(a)</b>
										<br/>Description of costs</th>
									<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:23mm; text-align:center;">
										<b>(b)</b>
										<br/>Date amortization<br/>begins</th>
									<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:36mm; text-align:center;">
										<b>(c)</b>
										<br/>Amortizable<br/>amount</th>
									<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:23mm;">
										<b>(d)</b>
										<br/>Code<br/>section</th>
									<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:1px; width:17mm;">
										<b>(e)</b>
										<br/>Amortization<br/>period or<br/>percentage</th>
									<th scope="col" class="styDepTblCell" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:1px; width:44mm;">
										<b>(f)</b>
										<br/>Amortization for<br/>this year</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS4562Data/AmortizationInfo/AmortizationInfoTable">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styIRS4562TableCellA" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:40mm; height:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CostDesc"/>
											</xsl:call-template>
										<!--<span class="styIRS4562TableCellPad"/>-->
										</td>
										<td class="styIRS4562TableCellB" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:23mm; text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AmortizationBeginDt"/>
											</xsl:call-template>
											<!--<span class="styIRS4562TableCellPad"/>-->
										</td>
										<td class="styIRS4562TableCellC" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:31mm; text-align:right; padding-top:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmortizableAmt"/>
											</xsl:call-template>
										<!--	<span class="styIRS4562TableCellPad"/>-->
										</td>
										<td class="styIRS4562TableCellD" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:43mm; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CodeSectionTxt"/>
											</xsl:call-template>
											<!--<span class="styIRS4562TableCellPad"/>-->
										</td>
										<td class="styIRS4562TableCellE" style="border-color:black; border-left-width:0px; border-right-width:1px; border-top-width:1px; border-bottom-width:0px; width:19mm; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AmortizationPeriodOrPctTxt"/>
											</xsl:call-template>
											<!--<span class="styIRS4562TableCellPad"/>-->
										</td>
										<td class="styIRS4562TableCellF" style="border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:1px; border-bottom-width:0px; width:31mm; text-align:right; padding-top:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmortizationThisYearAmt"/>
											</xsl:call-template>
										<!--	<span class="styIRS4562TableCellPad"/>-->
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($IRS4562Data/AmortizationInfo/AmortizationInfoTable) &lt;2">
									<xsl:call-template name="AddRowsPartVI">
										<xsl:with-param name="NumOfRows" select="2"/>
										<xsl:with-param name="ACount" select="count($IRS4562Data/AmortizationInfo/AmortizationInfoTable)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
