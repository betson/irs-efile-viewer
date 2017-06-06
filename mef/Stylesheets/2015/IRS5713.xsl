<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS5713Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form5713Data" select="$RtnDoc/IRS5713"/>
  <!-- Last Updated 10/25/2011 (RLW) -->
  <!-- populateEINFieldTemplate Part 1, line 8 Column 2 for inline table for foreign TIN-->
  <xsl:template name="populateEINFieldTemplate">
	<xsl:param name="TargetNode"/>
	<!--  *******************************************************************************  -->
	<xsl:choose>
	  <xsl:when test="$TargetNode/ForeignCorporationEIN">
		<xsl:call-template name="PopulateEIN">
		  <xsl:with-param name="TargetNode" select="$TargetNode/ForeignCorporationEIN"/>
		</xsl:call-template>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="PopulateText">
		  <xsl:with-param name="TargetNode" select="$TargetNode/ForeignCorpMissingEINReasonCd"/>
	    </xsl:call-template>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!-- This template is used to display a row in additional data tables (dependency style table). -->
  <!-- Data element type is BoycottDetailsType Part 1, Line 8 column 2 for blue table-->
  <xsl:template name="BoycottDetailsTypeDepTblRow">
    <!--Define background colors to the rows -->
	<xsl:attribute name="class">
	  <xsl:choose>
	    <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
		<xsl:otherwise>styDepTblRow2</xsl:otherwise>
	  </xsl:choose>
	</xsl:attribute>
	<td class="styDepTblCell" style="text-align:center;">
	  <span style="float:left;">
		<span style="font-weight:bold;">
		  <xsl:number value="position()" format="a"/>
		</span>
		<span style="width:3mm;"/>
		<xsl:call-template name="PopulateText">
		  <xsl:with-param name="TargetNode" select="CountryCd"/>
		</xsl:call-template>
	  </span>
	</td>
	<!-- Part I, line 8 column 2 for blue table not foreign TIN -->      
	<td class="styDepTblCell" style="text-align:left">
	  <xsl:choose>
		<xsl:when test="PersonInvolvedSSN!=''">
		  <xsl:call-template name="PopulateSSN">
			<xsl:with-param name="TargetNode" select="PersonInvolvedSSN"/>
		  </xsl:call-template>
		</xsl:when>
		<xsl:when test="PersonInvolvedEIN!=''">
		  <xsl:call-template name="PopulateEIN">
			<xsl:with-param name="TargetNode" select="PersonInvolvedEIN"/>
		  </xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
		  </xsl:call-template>
		</xsl:otherwise>
	  </xsl:choose>
	  <xsl:if test="ForeignCorporationName!=''">
		<br/>
		<xsl:call-template name="PopulateText">
		  <xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
		</xsl:call-template>
		<xsl:if test="ForeignCorporationName/BusinessNameLine2Txt!=''">
		  <br/>
		  <xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
		  </xsl:call-template>
		</xsl:if>
	  </xsl:if>
	  <br/>
	  <xsl:call-template name="populateEINFieldTemplate">
		<xsl:with-param name="TargetNode" select="."/>
	  </xsl:call-template>
	</td>
	<td class="styDepTblCell" style="text-align:center;">
	    <xsl:choose>
						<xsl:when test="PrincipalBusinessActivityCd!=''">
								  <xsl:call-template name="PopulateText">
		                        	<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
		                          </xsl:call-template>						
						</xsl:when>
						<xsl:otherwise>
								  <xsl:call-template name="PopulateText">
		                        	<xsl:with-param name="TargetNode" select="InactivePrincipalBusActyCd"/>
		                          </xsl:call-template>		
						</xsl:otherwise>
		</xsl:choose>
	</td>
	<td class="styDepTblCell" style="text-align:left;">
	  <xsl:call-template name="PopulateText">
		<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
	  </xsl:call-template>
	</td>
	<td class="styDepTblCell">
	  	  <xsl:call-template name="PopulateText">
		<xsl:with-param name="TargetNode" select="PrincipalProductCodeDesc"/>
	  </xsl:call-template>	  
	</td>
  </xsl:template>
  <xsl:template match="/"><xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
	<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	  <title>
		<xsl:call-template name="FormTitle">
		  <xsl:with-param name="RootElement" select="local-name($Form5713Data)"/>
		</xsl:call-template>
	  </title>
	  <meta http-equiv="Pragma" content="no-cache"/>
	  <meta http-equiv="Cache-Control" content="no-cache"/>
	  <meta http-equiv="Expires" content="0"/>
	  <meta http-equiv="Cache-Control" content="private"/>
	  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	  <meta name="Description" content="IRS Form 5713"/>
	  <META name="GENERATOR" content="IBM WebSphere Studio"/>
	  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
	  <xsl:call-template name="InitJS"/>
	  <style type="text/css">
	  <!--Note: If internet blocker is on then none of the table will display properly, so allow blocker then the table will display
            L2b Table: form display 6 data rows + table header =7 before scroll button will display;
	        Part I, L8 Table: form display 15 data rows before scroll bar will display after 15 data rows;
            Part I, L9 Table; form display 8 data rows before scroll bar will display after 8 data rows;
            Part I, L10 Table: form display 8 data rows before scroll bar will display after 8 data rows; 
            Part II, L13b Table: form display 16 data rows and no scroll bar will display becz table is at the end of the form.
	        L2c and 2d: Business Analyst, Stephanie Taylor, approved for deviation from paper form by increase box width and height border to allow maximum of data to be display. 
	  -->
		<!--Print Statement -->
		<xsl:if test="not($Print) or $Print=''">
		  <xsl:call-template name="IRS5713Style"/>
		  <xsl:call-template name="AddOnStyle"/>
	    </xsl:if>
	  </style>
	  <xsl:call-template name="GlobalStylesForm"/>
	</head>
	<body class="styBodyClass" style="width:187mm;">
	  <!-- Placed table header, footer and body tags in Part II table; Jan. 30, 2004  -->
	  <form name="Form5713">
		<xsl:call-template name="DocumentHeader"/>
		<!-- Form Number  -->
		<div style="width:187mm;">
		  <div class="styFNBox" style="width:34mm;height:21.5mm;">
		    <div>
			  <span style="padding-top:1mm;">Form<span style="width:6px;"/>
			</span><!--Where is this open tag???-->
			  <span class="styFormNumber">5713</span>
			  <span style="width:20px;"/>
			</div>
			<div class="styAgency" style="width:25mm;">(Rev. December 2010)
			  <xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$Form5713Data"/>
			  </xsl:call-template>
			</div>
			<div>
			  <div style="width:30mm;"/>
				<span class="styAgency">Department of the Treasury</span>
				<div class="styAgency">Internal Revenue Service</div>
			</div>
		  </div>
		  <!-- Form Title -->
		  <div class="styFTBox" style="width:105mm;">
			<div class="styMainTitle" style="padding-top:1mm">International Boycott Report</div>
			<div class="styFBT" style="font-size: 7pt;">
			  For the tax year beginning 
			  <span class="styFixedUnderline" style="width:50mm;font-weight:normal;float:none;padding-bottom:0;">
				<xsl:call-template name="PopulateMonthDayYear">
				  <xsl:with-param name="TargetNode" select="$Form5713Data/TaxYearBeginDt"/>
				</xsl:call-template>
			  </span>, <br/>and ending
			  <span class="styFixedUnderline" style="width:50mm;float:none;font-weight:normal;padding-bottom:0;">
				<xsl:call-template name="PopulateMonthDayYear">
				  <xsl:with-param name="TargetNode" select="$Form5713Data/TaxYearEndDt"/>
				</xsl:call-template>
			  </span> .
			</div>
			<div class="styFBT">
			  <img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing large arrowhead image" width="4"/> 
			    Controlled groups, see instructions.
			</div>
		  </div>
		  <!-- Form Header RHS -->
		  <div class="styTYBox" style="width:46mm;height:21.5mm;">
			<span class="styBB" style="width:46mm;height:3mm;font-size:7pt;">
			  <span style="width:6px;"/>OMB No.1545-0216 </span>
			  <span class="styBB" style="width:46mm;font-size:7pt;font-weight:bold;text-align:left;padding-top:1mm;padding-bottom:1mm;">
				<span style="width:6px;"/>Attachment<span style="width:6px;"/>
				<span style="width:110px;padding-left:1.5mm;">Sequence No. 123</span>
			  </span>
			  <span style="width:46mm;font-size:7pt;text-align:left;padding-left:1mm;padding-top:1mm;padding-bottom:1mm;">
				<b>Paper filers must file in<br/> duplicate </b>(see <b>When and Where<br/> to File</b> in the instructions)
				<span style="width:6px;">
			  </span>
			</span>
  		  </div>
		</div>
		<!-- Name and Address -->
		<div class="styBB" style="width:187mm;border-top-width:1px">
					  <div class="styNameBox" style="font-family:verdana;font-size:7pt;width:136mm;min-height:8mm;height:auto;">
						  Name
		    <br/>
			<!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
			<xsl:if test="$Form5713Data/NameLine1Txt!=''">
		      <br/>
              <xsl:call-template name="PopulateText">
			    <xsl:with-param name="TargetNode" select="$Form5713Data/NameLine1Txt"/>
			  </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form5713Data/BusinessName/BusinessNameLine1Txt!=''">
              <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form5713Data/BusinessName/BusinessNameLine1Txt"/>
			  </xsl:call-template>
			  <br/>
			  <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form5713Data/BusinessName/BusinessNameLine2Txt"/>
			  </xsl:call-template>
            </xsl:if>
			<xsl:if test="$Form5713Data/NameLine1Txt=''">
              <xsl:choose>
			    <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
			      <br/>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
			        <xsl:with-param name="TargetNode">Name</xsl:with-param>
			      </xsl:call-template>
			    </xsl:when>
			    <xsl:otherwise>
			      <xsl:call-template name="PopulateReturnHeaderFiler">
			        <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
			      </xsl:call-template>
			      <br/>
			      <xsl:call-template name="PopulateReturnHeaderFiler">
				    <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
			      </xsl:call-template>				  
			    </xsl:otherwise>
			  </xsl:choose>
            </xsl:if>
			<xsl:if test="$Form5713Data/BusinessName=''">
              <xsl:choose>
			    <xsl:when test="$RtnHdrData/ReturnTypeCd='1120'">
				  <xsl:call-template name="PopulateReturnHeaderFiler">
				    <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
			      </xsl:call-template>
			      <br/>
			      <xsl:call-template name="PopulateReturnHeaderFiler">
				    <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
			      </xsl:call-template>
			    </xsl:when>
			    <xsl:otherwise>
			      <br/>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
			        <xsl:with-param name="TargetNode">Name</xsl:with-param>
			      </xsl:call-template>
			    </xsl:otherwise>
			  </xsl:choose>
            </xsl:if>	  
		</div>
		<!-- EIN -->
		<div class="styEINBox" style="font-family:verdana;font-size:7pt;width:47mm;height:4mm;font-weight:bold;padding-left:2mm;">
		  Identifying number
		  <br/>
		  <span style="font-weight:normal;">
		  <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
		  <xsl:if test="$Form5713Data/SSN!=''">
		    <br/>
            <xsl:call-template name="PopulateSSN">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/SSN"/>
			</xsl:call-template>
          </xsl:if>
          <xsl:if test="$Form5713Data/EIN!=''">
            <br/>
            <xsl:call-template name="PopulateEIN">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/EIN"/>
			</xsl:call-template>
          </xsl:if>
          <xsl:if test="$Form5713Data/MissingEINReasonCd!=''">
            <br/>
            <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/MissingEINReasonCd"/>
			</xsl:call-template>
          </xsl:if>
          <xsl:if test="$Form5713Data/SSN=''">
            <xsl:choose>
			  <xsl:when test="$RtnHdrData/ReturnTypeCd='1120'">
			    <br/>
				<xsl:call-template name="PopulateReturnHeaderFiler">
				  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
				</xsl:call-template>
			  </xsl:when>
			  <xsl:otherwise>
			    <br/>
				<xsl:call-template name="PopulateReturnHeaderFiler">
				  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
				</xsl:call-template>
			  </xsl:otherwise>
			</xsl:choose>
          </xsl:if>
          <xsl:if test="$Form5713Data/EIN=''">
            <xsl:choose>
			  <xsl:when test="$RtnHdrData/ReturnTypeCd='1120'">
			    <br/>
				<xsl:call-template name="PopulateReturnHeaderFiler">
				  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
				</xsl:call-template>
			  </xsl:when>
			  <xsl:otherwise>
			    <br/>
				<xsl:call-template name="PopulateReturnHeaderFiler">
				  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
				</xsl:call-template>
			  </xsl:otherwise>
			</xsl:choose>
          </xsl:if>
		</span>
	  </div>
	</div>  
	<!-- Number, Street, and Room or Suite No. -->
	  <div class="styBB" style="width:187mm;">
						<div style="font-family:verdana;font-size:7pt;width:140mm;min-height:8mm;height:auto;">
		  Number, street, and room or suite no. If a P.O. box, see instructions.
		  <br/>
		  <xsl:if test="$Form5713Data/USAddress/AddressLine1Txt">
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/USAddress/AddressLine1Txt"/>
			</xsl:call-template>
		  </xsl:if>
		  <xsl:if test="$Form5713Data/USAddress/AddressLine2Txt">
			<br/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/USAddress/AddressLine2Txt"/>
			</xsl:call-template>
		  </xsl:if>
		</div>
	  </div>
	  <!--City or Town, State, and Zip -->
	  <div class="styBB" style="width:187mm;">
		<div style="font-family:verdana;font-size:7pt;width:140mm;height:8mm;">City or town, state, and ZIP code
		  <br/>
		  <xsl:if test="$Form5713Data/USAddress/CityNm">
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/USAddress/CityNm"/>
			</xsl:call-template>,
		  </xsl:if>
		  <xsl:if test="$Form5713Data/USAddress/StateAbbreviationCd">
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/USAddress/StateAbbreviationCd"/>
			</xsl:call-template>
		  </xsl:if>
		  <span style="width:4px;"/>
		  <xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$Form5713Data/USAddress/ZIPCd"/>
		  </xsl:call-template>
		</div>
	  </div>
	  <!-- Service center where Return is filed -->
	  <div class="styBB" style="width:187mm;">
		<div style="font-family:verdana;font-size:7pt;width:140mm;height:8mm;">Address of service center where your tax return is filed
		  <br/>
		  <xsl:if test="$Form5713Data/ServiceCenterWhereRetFiledCd">
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/ServiceCenterWhereRetFiledCd"/>
			</xsl:call-template>
		  </xsl:if>
		</div>
	  </div>
	  <!-- Filer type -->
	  <div class="styBB" style="width:187mm;height:8mm;">
		<div style="font-family:verdana;font-size:7pt;width:140mm;">Type of filer (check one):
          <span style="width:6px;"/>
		</div>
		<div style="font-family:verdana;font-size:7pt;width:187mm;padding-left:3mm">
		  <!-- Individual checkbox -->
		  <input type="checkbox" name="Checkbox" class="styckbox">
			<xsl:call-template name="PopulateCheckbox">
		  	  <xsl:with-param name="TargetNode" select="$Form5713Data/IndividualInd"/>
		  	  <xsl:with-param name="BackupName">IRS5713IndividualFileType</xsl:with-param>
			</xsl:call-template>
		  </input>
		  <span style="width:1mm;"/>
		  <label>
			<xsl:call-template name="PopulateLabel">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/IndividualInd"/>
			  <xsl:with-param name="BackupName">IRS5713IndividualFileType</xsl:with-param>
			</xsl:call-template>
			<span style="width:3mm;text-align:right;">Individual</span>
		  </label>
		  <span style="width:15mm;"/>
		  <!--Partnership  checkbox -->
		  <input type="checkbox" name="Checkbox" class="styckbox">
			<xsl:call-template name="PopulateCheckbox">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipInd"/>
			  <xsl:with-param name="BackupName">IRS5713PartnershipFileType</xsl:with-param>
			</xsl:call-template>
		  </input>
		  <span style="width:1mm;"/>
		  <label>
			<xsl:call-template name="PopulateLabel">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipInd"/>
			  <xsl:with-param name="BackupName">IRS5713PartnershipFileType</xsl:with-param>
			</xsl:call-template>
			<span style="width:3mm;text-align:right;">Partnership</span>
		  </label>
		  <span style="width:15mm;"/>
		  <!--Corporation  checkbox -->
		  <input type="checkbox" name="Checkbox" class="styckbox">
			<xsl:call-template name="PopulateCheckbox">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/CorporationInd"/>
			  <xsl:with-param name="BackupName">IRS5713CorporationFileType</xsl:with-param>
			</xsl:call-template>
		  </input>
		  <span style="width:1mm;"/>
		  <label>
			<xsl:call-template name="PopulateLabel">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/CorporationInd"/>
			  <xsl:with-param name="BackupName">IRS5713CorporationFileType</xsl:with-param>
			</xsl:call-template>
			<span style="width:3mm;text-align:right;">Corporation</span>
		  </label>
		  <span style="width:15mm;"/>
		  <!--Trust  checkbox -->
		  <input type="checkbox" name="Checkbox" class="styckbox">
			<xsl:call-template name="PopulateCheckbox">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/TrustInd"/>
			  <xsl:with-param name="BackupName">IRS5713TrustFileType</xsl:with-param>
			</xsl:call-template>
		  </input>
		  <span style="width:1mm;"/>
		  <label>
			<xsl:call-template name="PopulateLabel">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/TrustInd"/>
			  <xsl:with-param name="BackupName">IRS5713TrustFileType</xsl:with-param>
			</xsl:call-template>
			<span style="width:3mm;text-align:right;">Trust</span>
		  </label>
		  <span style="width:15mm;"/>
		  <!--Estate  checkbox -->
		  <input type="checkbox" name="Checkbox" class="styckbox">
			<xsl:call-template name="PopulateCheckbox">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/EstateInd"/>
			  <xsl:with-param name="BackupName">IRS5713EstateFileType</xsl:with-param>
			</xsl:call-template>
		  </input>
		  <span style="width:1mm;"/>
		  <label>
			<xsl:call-template name="PopulateLabel">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/EstateInd"/>
			  <xsl:with-param name="BackupName">IRS5713EstateFileType</xsl:with-param>
			</xsl:call-template>
			<span style="width:3mm;text-align:right;">Estate</span>
		  </label>
		  <span style="width:13mm;"/>
		  <!-- Other  checkbox -->
		  <input type="checkbox" name="Checkbox" class="styckbox">
			<xsl:call-template name="PopulateCheckbox">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/OtherInd"/>
			  <xsl:with-param name="BackupName">IRS5713OtherFileType</xsl:with-param>
			</xsl:call-template>
		  </input>
		  <span style="width:1mm;"/>
		  <label>
			<xsl:call-template name="PopulateLabel">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/OtherInd"/>
			  <xsl:with-param name="BackupName">IRS5713OtherFileType</xsl:with-param>
			</xsl:call-template>
			<span style="width:3mm;text-align:right;">Other</span>
		  </label>
		</div>
	  </div>
	  <!-- L1 -->
	  <div class="styBB" style="width:187mm;">
	    <div class="styLNLeftNumBox">1</div>
	    <div class="styLNDesc" style="width:137mm;"><b>Individuals &#8211; </b>
	      Enter adjusted gross income from your tax return (see instructions)
	    </div>
	    <div class="styLNAmountBox" style="width:42mm;border-bottom-width:0px;">
	      <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form5713Data/AdjustedGrossIncomeAmt"/>
		  </xsl:call-template>
		</div>
	  </div>
	  <!-- L2 -->
	  <div style="width:187mm;">
		<div class="styLNLeftNumBox">2</div>
		<div class="styLNDesc" style="width:147mm;font-weight:bold;">Partnerships and corporations:</div>
		<!--Line 2a -->
		<div style="width:187mm;">
		  <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
		  <div class="styLNDesc" style="width:179mm;">
		    Partnerships &#8211; Enter each partner's name and identifying number.
		  </div>
		</div>
		<!--L2b -->
		<div style="width:187mm;">
		  <div class="styLNLeftLtrBox">b</div>
		  <div class="styLNDesc" style="width:179mm;height:auto;">
		  Corporations &#8211;  Enter the name and employer identification number of each member of the controlled group (as defined in section 993(a)(3)). Do not list members included in the consolidated return; instead, attach a copy of Form 851. List all other members of the controlled group not included in the consolidated return.
		    <br/>
		    <b>If you list any corporations below or if you attach Form 851, you must designate a common tax year. Enter on line 4b the name and employer identification number of the corporation whose tax year is designated.
		    </b>
			<!--Table expand/collapse toggle button-->
			<span class="styGenericDiv" style="float:right;clear:none;width:4mm;text-align:left;">
			  <xsl:call-template name="SetDynamicTableToggleButton">
				<xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipAndCorporationGrp"/>
										<xsl:with-param name="containerHeight" select="6"/>
										<xsl:with-param name="headerHeight" select="1"/>
				<xsl:with-param name="containerID" select=" 'TPctn1' "/>
			  </xsl:call-template>
			</span>
			<!--Table expand/collapse toggle button end-->
		  </div>
		</div>
	  </div>
	  <!-- Line 2b Table (Inline Print Table) 
			This table will have a scroll bar display if data exceed 6 row of data-->
	  <div class="styTableContainerNBB" id="TPctn1" style="border-bottom-width:0px;">
		<!-- Show table in expanded form -->
		<xsl:call-template name="SetInitialState"/>
		<!-- end -->
		<!-- Used <b></b> tags for bold font since local style overwriting ( "font-weight:bold;" ) did not work with cells in this table-->
		<table cellspacing="0" summary="Employer name and identification number display table for Line 2 - partnerships and corporations" style="width:180mm;clear:both;border-style:solid;border-color:black;border-bottom:none;border-left:none;border-right:none;border-top:none;">
		  <thead class="styTableThead">
			<tr>
			  <th class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:bold;width:140mm;text-align:center;border-style:solid;border-right-width:1px;border-bottom:none;border-left:none;border-top:none;border-color:black;">
				<b>Name</b>
			  </th>
			  <th class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:bold;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom:none;border-left:none;border-top:none;border-color:black;">
				<b>Identifying number</b>
			  </th>
			</tr>
		  </thead>
		  <tfoot/>
		  <tbody>
			<xsl:if test="($Print != $Separated) or (count($Form5713Data/PartnershipAndCorporationGrp) &lt;= 6)">
			  <xsl:for-each select="$Form5713Data/PartnershipAndCorporationGrp">
				<tr>
				  <td class="styTableCell" scope="col" style="float:right;font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;text-align:left;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;">
					<!--  *****************************************************************************************  -->
					<xsl:choose>
					  <xsl:when test="BusinessName">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
						</xsl:call-template>													
						<!-- For reguler push pen -->
						<xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipAndCorporationGrp"/>
						</xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>
       	                <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameLine1Txt"/>
						</xsl:call-template>
					  </xsl:otherwise>
					</xsl:choose>
					<!--  ********************************************************************************************  -->
				  </td>
				  <td class="styTableCell" scope="col" style="padding-top:0mm;font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;border-top:none;border-color:black">
					<xsl:choose>
					  <xsl:when test="normalize-space(EIN)">
						<xsl:call-template name="PopulateEIN">
						  <xsl:with-param name="TargetNode" select="EIN"/>
						</xsl:call-template>
						<span style="width: 2px"/>
					  </xsl:when>
					  <xsl:when test="normalize-space(SSN)">
						<xsl:call-template name="PopulateSSN">
						  <xsl:with-param name="TargetNode" select="SSN"/>
						</xsl:call-template>
						<span style="width: 2px"/>
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
			</xsl:if>
			<!-- Begin L2b Empty (Develop each row) Row 1-->
			<xsl:if test="count($Form5713Data/PartnershipAndCorporationGrp)&lt; 1  or ((count($Form5713Data/PartnershipAndCorporationGrp) &gt; 6) and ($Print = $Separated))">
			  <tr>
				<td class="styTableCell" scope="col" style="float:right;font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;text-align:left;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black;">
                  <!-- Will Populate "See Additional Data Message on 1st line" -->
                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                    <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipAndCorporationGrp"/>
                  </xsl:call-template>
				  <span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" scope="col" style="padding-top:0mm;font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black">
				  <span class="styTableCellPad"/>
				</td>
			  </tr>
			  </xsl:if>
			  <!-- Begin L2b Empty Row 2-->
			  <xsl:if test="count($Form5713Data/PartnershipAndCorporationGrp)&lt; 2  or ((count($Form5713Data/PartnershipAndCorporationGrp) &gt; 6) and ($Print = $Separated))">
			    <tr>
				  <td class="styTableCell" scope="col" style="float:right;font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;       text-align:left;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black;height:5mm;">
					<span class="styTableCellPad"/>
				  </td>
				  <td class="styTableCell" scope="col" style="padding-top:0mm;font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;       text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black">
					<span class="styTableCellPad"/>
				  </td>
				</tr>
			  </xsl:if>
			  <!-- Begin L2b Empty Row 3-->
			  <xsl:if test="count($Form5713Data/PartnershipAndCorporationGrp)&lt; 3  or ((count($Form5713Data/PartnershipAndCorporationGrp) &gt; 6) and ($Print = $Separated))">
				<tr>
				  <td class="styTableCell" scope="col" style="float:right;font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;       text-align:left;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black;height:5mm;">
					<span class="styTableCellPad"/>
				  </td>
				  <td class="styTableCell" scope="col" style="padding-top:0mm;font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;       text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black">
					<span class="styTableCellPad"/>
				  </td>
				</tr>
			  </xsl:if>
			  <!-- Begin L2b Empty Row 4-->
			  <xsl:if test="count($Form5713Data/PartnershipAndCorporationGrp)&lt; 4  or ((count($Form5713Data/PartnershipAndCorporationGrp) &gt; 6) and ($Print = $Separated))">
				<tr>
				  <td class="styTableCell" scope="col" style="float:right;font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;       text-align:left;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black;height:5mm;">
					<span class="styTableCellPad"/>
				  </td>
				  <td class="styTableCell" scope="col" style="padding-top:0mm;font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;       text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black">
					<span class="styTableCellPad"/>
				  </td>
				</tr>
			  </xsl:if>
			  <!-- Begin L2b Empty Row 5-->
			  <xsl:if test="count($Form5713Data/PartnershipAndCorporationGrp)&lt; 5  or ((count($Form5713Data/PartnershipAndCorporationGrp) &gt; 6) and ($Print = $Separated))">
				<tr>
				  <td class="styTableCell" scope="col" style="float:right;font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;       text-align:left;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black;height:5mm;">
					<span class="styTableCellPad"/>
				  </td>
				  <td class="styTableCell" scope="col" style="padding-top:0mm;font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;       text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black">
					<span class="styTableCellPad"/>
				  </td>
				</tr>
			  </xsl:if>
			  <!-- Begin L2b Empty Row 6-->
			  <xsl:if test="count($Form5713Data/PartnershipAndCorporationGrp)&lt; 6  or ((count($Form5713Data/PartnershipAndCorporationGrp) &gt; 6) and ($Print = $Separated))">
				<tr>
				  <td class="styTableCell" scope="col" style="float:right;font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;       text-align:left;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black;height:5mm;">
					<span class="styTableCellPad"/>
				  </td>
				  <td class="styTableCell" scope="col" style="padding-top:0mm;font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;       text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;       border-top:none;border-color:black">
					<span class="styTableCellPad"/>
				  </td>
				</tr>
			  </xsl:if>				
			</tbody>
		  </table>
		</div>
		<xsl:call-template name="SetInitialDynamicTableHeight">
		  <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipAndCorporationGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="1"/>
		  <xsl:with-param name="containerID" select=" 'TPctn1' "/>
		</xsl:call-template>
		<!-- Text Line after L2b Table -->
		<div style="width:187mm;">
		  <div class="styGenericDiv" style="width:171.3mm;margin-left:4mm;height:0.3mm;padding-top:2mm;">
			<span style="float:left;margin-left:3mm;">If more space is needed, attach additional sheets and check this box</span> 
			<!--Dotted Line-->
			<span class="styDotLn" style="float:left;margin-left:2mm;font-weight:bold;">....................</span>
		  </div>
		  <div class="styGenericDiv" style="width:12mm;float:right;clear:none;text-align:right;">
			<span style="width:1mm;">
			  <img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="bullet image pointing to right" width="4"/>
			</span>
			<label>
			  <xsl:call-template name="PopulateLabel">
				<xsl:with-param name="TargetNode" select="$Form5713Data/AdditionalSpaceRequiredInd"/>
				<xsl:with-param name="BackupName">IRS5713AdditionalCorpInfoIncluded</xsl:with-param>
			  </xsl:call-template>
			  <span style="width:2mm;text-align:right;"/>
			</label>
			<input type="checkbox" class="styckbox" name="Checkbox">
			  <xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form5713Data/AdditionalSpaceRequiredInd"/>
				<xsl:with-param name="BackupName">IRS5713AdditionalCorpInfoIncluded</xsl:with-param>
			  </xsl:call-template>
			</input>
		  </div>
		</div>
		<!--L2c left hand coding technique-->
		<!--Note: Per Business Analyst (Stephanie Taylor) approval to increase height of the code and description box to allow the maximum data to be display properly. -->
		<div style="width:187mm;">
		  <div style="width:107mm;float:left;"/>
		  <div class="styLNCtrNumBox" style="width:24mm;margin-left:107mm;border-top-width:1px;border-right-width:0px;">Code</div>
		  <div class="styLNCtrNumBox" style="width:56mm;border-top-width:1px;border-right-width:0px;">Description</div>
		</div>
		<div style="width:187mm;">
		  <div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
		  <div class="styLNDesc" style="width:99mm;">Enter principal business activity code and description (see instructions)</div>
		  <div class="styLNCtrNumBox" style="width:24mm;height:7mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-weight:normal;">
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/PrincipalBusinessActivityCd"/>
			</xsl:call-template>
			<xsl:if test="$Form5713Data/InactivePrincipalBusActyCd !=' '">
			  <span style="font-weight:normal;">
			    <xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$Form5713Data/InactivePrincipalBusActyCd"/>
				</xsl:call-template>
			  </span>
			</xsl:if>
		  </div>
		  <div class="styLNCtrNumBox" style="width:56mm;height:7mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-weight:normal;text-align:left;       padding-left:1mm;">
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$Form5713Data/PrincipalBusinessActivityDesc"/>
			</xsl:call-template>
		  </div>
		</div>
		<!--L2d -->
		<!--Note: Per Business Analyst (Stephanie Taylor) approval to increase height of the code and description box to allow the maximum data to be display properly. -->
		<div class="styBB" style="width:187mm;">
		  <div class="styLNLeftLtrBox">d</div>
			<div class="styLNDesc" style="width:99mm;">IC-DISCs &#8211; Enter principal product or service code and description (see instructions)</div>
			<div class="styLNCtrNumBox" style="width:24mm;height:7mm;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;font-weight:normal;">
			  <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form5713Data/PrincipalProductCodeDesc"/>
			  </xsl:call-template>
			</div>
			<div class="styLNCtrNumBox" style="width:56mm;height:7mm;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;font-weight:normal;text-align:left;padding-left:1mm;">
			  <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form5713Data/PrincipalProductDesc"/>
			  </xsl:call-template>
			</div>
		  </div>
		  <!--L3-->
		  <div style="width:187mm;">
			<div class="styLNLeftNumBox">3</div>
			<div class="styLNDesc" style="width:141mm;">
			  <span style="font-weight:bold;">Partnerships &#8211; </span>Each partnership filing Form 5713 must give the following information:</div>
			</div>
           <!--L3a-->					
		   <div style="width:187mm;">
			<div class="styLNLeftLtrBox">a</div>
			  <div class="styLNDesc" style="width:141mm;">
				<span style="float:left;">Partnership's total assets (see instructions) </span>
				<!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.....................</span>
			  </div>
			  <div class="styLNCtrNumBox" style="width:37mm;height:5mm;border-top-width:0px;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;text-align:right;font-weight:normal;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipsTotalAssetAmt"/>
				</xsl:call-template>
			  </div>
			</div>
            <!--L3b-->			
			<div class="styBB" style="width:187mm;">
			  <div class="styLNLeftLtrBox">b</div>
			  <div class="styLNDesc" style="width:141mm;">
				<span style="float:left;">Partnership's ordinary income (see instructions) </span>
				<!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...................</span>
			  </div>
			  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;border-left-width:1px;border-bottom-width:0px;text-align:right;font-weight:normal;">
				<xsl:call-template name="PopulateAmount">
			  	  <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipsOrdinaryIncomeAmt"/>
				</xsl:call-template>
			  </div>
			</div>
			<!--L4-->
			<div style="width:187mm;">
			  <div class="styLNLeftNumBox">4</div>
			  <div class="styLNDesc" style="width:147mm;">
				<span style="font-weight:bold;">Corporations &#8211; </span>
				Each corporation filing Form 5713 must give the following information:
			  </div>
			</div>
			<!--L4a-->
			<div style="width:187mm;">
			  <div class="styLNLeftLtrBox">a</div>
			  <div class="styLNDesc" style="width:141mm;">Type of form filed (Form 1120, 1120-FSC, 1120-IC-DISC, 1120-L, 1120-PC, etc.) 
				<!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.........</span>
			  </div>
			  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;font-weight:normal;">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$Form5713Data/FormFiledTypeCd"/>
				</xsl:call-template>
			  </div>
			</div>
            <!--L4b-->				
			<div style="width:187mm;">
			  <div class="styLNLeftLtrBox">b</div>
			  <div class="styLNDesc" style="width:142mm;">Common tax year election (see instructions)</div>
			</div>
			<!--L4b (1) -->
			<div style="width:187mm;">
			  <div class="styLNLeftLtrBox"/>
			  <div class="styLNDesc" style="width:5mm;font-weight:bold;">(1)</div>
			  <div class="styLNDesc" style="width:36mm;font-weight:normal;">Name of corporation
			   	<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form5713Data/CorporationName"/>
				</xsl:call-template> <span style="width:1mm;"/> 	
			  <img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing arrowhead image" width="4"/>
			  </div>		  
              <div class="styLNDesc" style="width:132mm;font-weight:normal;min-height:4mm;height:auto;padding-bottom:0px;">
                 <span class="styFixedUnderline" style="width:137mm;float:none;padding-bottom:0px;">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form5713Data/CorporationName/BusinessNameLine1Txt"/>
				  </xsl:call-template>
				  <xsl:choose>
							<xsl:when test="$Form5713Data/CorporationName/BusinessNameLine2Txt!=''">						
								<br/>
								<xsl:call-template name="PopulateText">
								   <xsl:with-param name="TargetNode" select="$Form5713Data/CorporationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
				            </xsl:when>
				  </xsl:choose>
				</span>
              </div>
			  <!--L4b (2) -->
			  <div class="styLNLeftLtrBox"/>
			  <div class="styLNDesc" style="width:5mm;font-weight:bold;">(2)</div>
			  <div class="styLNDesc" style="width:136mm;font-weight:normal;">
				<span style="float:left;">Employer identification number </span> 
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.......................</span>
			  </div>
			  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;     font-weight:normal;">
				<xsl:call-template name="PopulateEIN">
				  <xsl:with-param name="TargetNode" select="$Form5713Data/EmployerIdentificationNum"/>
				</xsl:call-template>
				<xsl:if test="$Form5713Data/CorporationMissingEINReasonCd !=' '">
				  <span style="font-weight:normal;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form5713Data/CorporationMissingEINReasonCd"/>
					 </xsl:call-template>
				  </span>
				</xsl:if>
			  </div>
			  <!--L4b (3) -->
			  <div style="width:187mm;">
				<div class="styLNLeftLtrBox"/>
				<div class="styLNDesc" style="width:5mm;font-weight:bold;">(3)</div>
				<div class="styLNDesc" style="width:174mm;font-weight:normal;">Common tax year beginning 
				  <span class="styFixedUnderline" style="width:59mm;float:none;padding-bottom:0;text-align:center">
				    <xsl:call-template name="PopulateMonthDayYear">
					  <xsl:with-param name="TargetNode" select="$Form5713Data/CommonTaxYearBeginDt"/>
				    </xsl:call-template>
				  </span>
					, and ending 
				  <span class="styFixedUnderline" style="width:59mm;float:none;padding-bottom:0;text-align:center;">
					<xsl:call-template name="PopulateMonthDayYear">
					  <xsl:with-param name="TargetNode" select="$Form5713Data/CommonTaxYearEndDt"/>
					</xsl:call-template>
				  </span>.
				</div>
			  </div>
			  <!--L4c-->
			  <div class="styLNLeftLtrBox" style="height:4mm;">c</div>
			  <div class="styLNDesc" style="width:141mm;height:3mm;padding-bottom:0px;">Corporations filing this form enter:</div>
			  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;padding-bottom:0px;"/>
			</div>
			<!--L4c(1)-->
			<div style="width:187mm;">
			  <div class="styLNLeftLtrBox"/>
			  <div class="styLNDesc" style="width:5mm;font-weight:bold;">(1)</div>
			  <div class="styLNDesc" style="width:136mm;font-weight:normal;">
				<span style="float:left;">Total assets (see instructions) </span> 
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.......................</span>
			  </div>
			  <div class="styLNCtrNumBox" style="width:37mm;height:5mm;border-top-width:0px;border-right-width:0px;text-align:right;font-weight:normal;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form5713Data/TotalAssetsAmt"/>
				</xsl:call-template>
			  </div>
			</div>
			<!--L4c(2)-->
			<div class="styBB" style="width:187mm;">
			  <div class="styLNLeftLtrBox"/>
			  <div class="styLNDesc" style="width:5mm;font-weight:bold;">(2)</div>
			  <div class="styLNDesc" style="width:136mm;font-weight:normal;">
				<span style="float:left;">Taxable income before net operating loss and special deductions (see instructions) </span> 
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">......</span>
			  </div>
			  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;text-align:right;font-weight:normal;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form5713Data/TaxableIncomeLossBfrNOLDedAmt"/>
				</xsl:call-template>
			  </div>
			</div>
			<!--L5-->
			<div class="styBB" style="width:187mm;bottom-border:1px;">
			  <div class="styLNLeftNumBox" style="padding-left:1mm;height:3mm;">5</div>
			  <div class="styLNDesc" style="width:141mm;">
			  	<span style="float:left;"><b>Estates or trusts </b> -Enter total income (Form 1041, page 1)</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">................</span>
			  </div>
			  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;text-align:right;font-weight:normal;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form5713Data/TotalEstateOrTrustIncomeAmt"/>
				</xsl:call-template>
			  </div>
			</div>
			<!--L6-->
			<div style="width:187mm;bottom-border:1px;">
			  <div class="styLNLeftNumBox" style="padding-left:1mm;height:3mm;">6</div>
			  <div class="styLNDesc" style="width:177mm;height:4mm;">
				Enter the total amount (before reduction for boycott participation or cooperation) of the following tax benefits (see instructions):</div>
			  </div>
			  <!--L6a-->
			  <div style="width:187mm;">
				<div class="styLNLeftLtrBox">a</div>
				<div class="styLNDesc" style="width:141mm;">
				  <span style="float:left;">Foreign tax credit </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">............................</span>
				</div>
				<div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;text-align:right;font-weight:normal;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form5713Data/ForeignTaxCreditAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			  <!--L6b-->
			  <div style="width:187mm;">
				<div class="styLNLeftLtrBox">b</div>
				<div class="styLNDesc" style="width:141mm;">
				  <span style="float:left;">Deferral of earnings of controlled foreign corporations </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">..................</span>
				</div>
				<div class="styLNCtrNumBox" style="width:37mm;height:5mm;border-top-width:0px;border-right-width:0px;text-align:right;font-weight:normal;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form5713Data/DeferralEarnCtrlFrgnCorpAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			  <!--L6c-->
			  <div style="width:187mm;">
				<div class="styLNLeftLtrBox">c</div>
				<div class="styLNDesc" style="width:141mm;">
				  <span style="float:left;">Deferral of IC-DISC income </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.........................</span>
				</div>
				<div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;text-align:right;font-weight:normal;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form5713Data/DeferralICDISCIncomeAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			  <!--L6d-->
			  <div style="width:187mm;">
				<div class="styLNLeftLtrBox">d</div>
				<div class="styLNDesc" style="width:141mm;">
				  <span style="float:left;">FSC exempt foreign trade income </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">........................</span>
				</div>
				<div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;   text-align:right;font-weight:normal;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form5713Data/FSCExemptForeignTradeIncomeAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			  <!--L6e-->
					<div class="styBB" style="width:187mm;float:none;">
				<div class="styLNLeftLtrBox">e</div>
				<div class="styLNDesc" style="width:141mm;">
				  <span style="float:left;">Foreign trade income qualifying for the extraterritorial income exclusion </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...........</span>
				</div>
				<div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;text-align:right;font-weight:normal;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form5713Data/ExtraterritorialExclIncomeAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			  <!-- Implementing the signature section in table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt; float:none; clear:both;page-break-inside:avoid;">
				<tr>
							<td rowspan="3" style="width:15mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">Please Sign Here</td>
				  <td colspan="5" style="padding-left:1mm;padding-bottom:1mm;padding-left:2mm">Under penalties of perjury, I declare that I have examined this report, including accompanying schedules and statements, and to the best of my
knowledge and belief, it is true, correct, and complete. </td>
				</tr>
				<tr>
							<td rowspan="2" style="border-bottom:1px solid black;padding-left:2mm;">
					<img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Big Right Arrow"/>
				  </td>
							<td style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;border-right:1px solid black;">
					<xsl:call-template name="PopulateReturnHeaderOfficer">
					  <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
					</xsl:call-template>
					<span style="width:1px;"/>
				  </td>
							<td style="width:20mm;border-bottom:1px solid black;vertical-align:bottom;padding-left:1mm;">
					<xsl:call-template name="PopulateReturnHeaderOfficer">
					  <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
					</xsl:call-template>
				  </td>
							<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
					<img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Big Right Arrow"/>
				  </td>
							<td style="width:50mm;border-bottom:1px solid black;vertical-align:bottom;">
					<xsl:call-template name="PopulateReturnHeaderOfficer">
					  <xsl:with-param name="TargetNode">Title</xsl:with-param>
					</xsl:call-template>
				  </td>
				</tr>
				<tr>
							<td style="border-bottom:1px solid black;vertical-align:top;font-weight:bold;">Signature</td>
							<td style="border-bottom:1px solid black;vertical-align:top;padding-left:1mm;font-weight:bold;">Date</td>
							<td style="border-bottom:1px solid black;vertical-align:top;font-weight:bold;">Title</td>
				</tr>
			  </table>
			  <!-- End Signature Section -->
			  <div class="pageEnd" style="width:187mm;">
				<div style="float:left">
				  <span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
				</div>
				<div style="float:right">
                  Cat. No. 12030E
                  <span style="width:15mm"/>
                  Form <span class="styBoldText" style="font-size:8pt">5713</span> (Rev. 12-2010)
                </div>
			  </div>
			  <!--Page 2 start-->
					<div class="styBB" style="width:187mm; float:none; clear:both;">
				Form 5713 (Rev. 12-2010)<span style="width:140mm;"/>
				Page <span style="font-weight:bold;font-size:8pt;">2</span>
			  </div>
			  <!-- L7a -->
			  <div style="width:187mm;">
				<div class="styLNLeftNumBox">7a</div>
				<div class="styLNDesc" style="width:168mm;">
				  Are you a U.S. shareholder (as defined in section 951(b)) of any foreign corporation (including a FSC that does not use the 
				  <span style="float:left;">administrative pricing rules) that had operations reportable under section 999(a)? </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">..............</span>
				</div>
			  <div style="width:10.5mm;">
					<div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:4mm;font-weight:bold;border-bottom-width:1px;">Yes</div>
					<div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:4mm;font-weight:bold;border-bottom-width:1px;">No</div>
					<div class="styLNAmountBox" style="width:5.2mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
					  <xsl:call-template name="PopulateYesBoxText">
						<xsl:with-param name="TargetNode" select="$Form5713Data/ShrFrgnCorpReportableOprInd"/>
					  </xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="width:5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
					  <xsl:call-template name="PopulateNoBoxText">
						<xsl:with-param name="TargetNode" select="$Form5713Data/ShrFrgnCorpReportableOprInd"/>
					  </xsl:call-template>
					</div>
				</div>
			  </div>
			  <!--L7b-->
			  <div style="width:187mm;">
				<div class="styLNLeftLtrBox">b</div>
				<div class="styLNDesc" style="width:168mm;">If the answer to question 7a is "Yes," is any foreign corporation a controlled foreign corporation (as defined in
section 957(a))? </div>
						<div class="styLNAmountBox" style="width:5.2mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
				  <xsl:call-template name="PopulateYesBoxText">
					<xsl:with-param name="TargetNode" select="$Form5713Data/FrgnCorpControlledFrgnCorpInd"/>
				  </xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
					<xsl:call-template name="PopulateNoBoxText">
					  <xsl:with-param name="TargetNode" select="$Form5713Data/FrgnCorpControlledFrgnCorpInd"/>
					</xsl:call-template>
				  </div>
				</div>
				<!--L7c-->
				<div style="width:187mm;">
				  <div class="styLNLeftLtrBox">c</div>
				  <div class="styLNDesc" style="width:168mm;">
					<span style="float:left;">Do you own any stock of an IC-DISC? </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.............................</span>
				  </div>
						<div class="styLNAmountBox" style="width:5.2mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
					<xsl:call-template name="PopulateYesBoxText">
					  <xsl:with-param name="TargetNode" select="$Form5713Data/OwnICDISCStockInd"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
					<xsl:call-template name="PopulateNoBoxText">
					  <xsl:with-param name="TargetNode" select="$Form5713Data/OwnICDISCStockInd"/>
					</xsl:call-template>
				  </div>
				</div>
				<!--L7d-->
				<div style="width:187mm;">
				  <div class="styLNLeftLtrBox">d</div>
				  <div class="styLNDesc" style="width:168mm;">
					<span style="float:left;">Do you claim any foreign tax credit? </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.............................</span>
				  </div>
						<div class="styLNAmountBox" style="width:5.2mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
					<xsl:call-template name="PopulateYesBoxText">
					  <xsl:with-param name="TargetNode" select="$Form5713Data/ClaimForeignTaxCreditInd"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
					<xsl:call-template name="PopulateNoBoxText">
					  <xsl:with-param name="TargetNode" select="$Form5713Data/ClaimForeignTaxCreditInd"/>
					</xsl:call-template>
				  </div>
				</div>
				<!--L7e-->
				<div style="width:187mm;">
				  <div class="styLNLeftLtrBox">e</div>
				  <div class="styLNDesc" style="width:168mm;">Do you control (within the meaning of section 304(c)) any corporation (other than a corporation included in this report) that has 
					<span style="float:left;">operations reportable under section 999(a)? </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...........................</span>
				  </div>
						<div class="styLNAmountBox" style="width:5.2mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
					<xsl:call-template name="PopulateYesBoxText">
					  <xsl:with-param name="TargetNode" select="$Form5713Data/ControlCorpReportableOprInd"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
					<xsl:call-template name="PopulateNoBoxText">
					  <xsl:with-param name="TargetNode" select="$Form5713Data/ControlCorpReportableOprInd"/>
					</xsl:call-template>
				  </div>
				</div>
				<!--L7e "If" line-->
				<div style="width:187mm;">
				  <div class="styLNLeftLtrBox"/>
					<div class="styLNDesc" style="width:168mm;">If "Yes," did that corporation participate in or cooperate with an international boycott at any time during its tax year that ends 
					  <span style="float:left;">with or within your tax year? </span>
					  <!--Dotted Line-->
					  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...............................</span>
					</div>
						<div class="styLNAmountBox" style="width:5.2mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
					  <xsl:call-template name="PopulateYesBoxText">
						<xsl:with-param name="TargetNode" select="$Form5713Data/CorporationParticipateByctInd"/>
					  </xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
					  <xsl:call-template name="PopulateNoBoxText">
						<xsl:with-param name="TargetNode" select="$Form5713Data/CorporationParticipateByctInd"/>
					  </xsl:call-template>
					</div>
				  </div>
				  <!--L7f-->
				  <div style="width:187mm;">
					<div class="styLNLeftLtrBox">f</div>
					  <div class="styLNDesc" style="width:168mm;">
					    Are you controlled (within the meaning of section 304(c)) by any person (other than a person included in this report) who has 
						<span style="float:left;">operations reportable under section 999(a)? </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...........................</span>
					  </div>
						<div class="styLNAmountBox" style="width:5.2mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/ControlledPrsnReportableOprInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/ControlledPrsnReportableOprInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!--L7f "If" line-->
					<div style="width:187mm;">
					  <div class="styLNLeftLtrBox"/>
					  <div class="styLNDesc" style="width:168mm;">
					    If "Yes," did that person participate in or cooperate with an international boycott at any time during its tax year that ends with 
                        <span style="float:left;">or within your tax year? </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.................................</span>
					  </div>
						<div class="styLNAmountBox" style="width:5.2mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/PersonParticipateBoycottInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/PersonParticipateBoycottInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!--Line 7g -->
					<div style="width:187mm;">
					  <div class="styLNLeftLtrBox">g</div>
					  <div class="styLNDesc" style="width:168mm;">
					    <span style="float:left;">Are you treated under section 671 as the owner of a trust that has reportable operations under section 999(a)? </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.....</span>
					  </div>
						<div class="styLNAmountBox" style="width:5.2mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/OwnerTrustReportableOprInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/OwnerTrustReportableOprInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!--Line 7h -->
					<div style="width:187mm;">
					  <div class="styLNLeftLtrBox">h</div>
					  <div class="styLNDesc" style="width:168mm;">
						<span style="float:left;">Are you a partner in a partnership that has reportable operations under section 999(a)? </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.............</span>
					  </div>
						<div class="styLNAmountBox" style="width:5.2mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipReportableOprInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipReportableOprInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!--Line 7i -->
					<div style="width:187mm;">
				      <div class="styLNLeftLtrBox">i</div>
					  <div class="styLNDesc" style="width:168mm;">
						<span style="float:left;">
						  Are you a foreign sales corporation (FSC) (as defined in section 922(a), as in effect before its repeal)?
						</span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">........</span>
					  </div>
						<div class="styLNAmountBox" style="width:5.2mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/ForeignSalesCorporationInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/ForeignSalesCorporationInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!--Line 7j -->
					<div class="styBB" style="width:187mm;">
					  <div class="styLNLeftLtrBox">j</div>
					  <div class="styLNDesc" style="width:168mm;">
						<span style="float:left;">
						  Are you excluding extraterritorial income (defined in section 114(e), as in effect before its repeal) from gross income? 
						</span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...</span>
					  </div>
						<div class="styLNAmountBox" style="width:5.2mm;padding-top:0mm;padding-bottom:0mm;border-bottom:0px;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/ExtraterritorialExclGroIncmInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:0px;float:left;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/ExtraterritorialExclGroIncmInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!-- Part I -->
					<div class="styBB" style="width:187mm;border-top-width:0px;">
					  <span class="styPartName">Part I</span>
					  <span style="font-family:verdana;font-size:8pt;font-weight:bold;"> Operations in or Related to a Boycotting Country</span>
					  <span style="font-family:verdana;font-size:8pt;font-weight:normal;"> (see instructions)</span>
					</div>
					<!-- L8 -->
					<div style="width:187mm;">
					  <div class="styLNLeftNumBox">8</div>
						<div class="styLNDesc" style="width:168mm;">
						  <b>Boycott of Israel &#8211; </b>Did you have any operations in or related to any country (or with the government, a company, or a national
						  of that country) associated in carrying out the boycott of Israel which is on the list maintained by the Secretary of the Treasury 
						  <span style="float:left;">under section 999(a)(3)? (See <b>Boycotting Countries</b> in the instructions.) </span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">..................</span>
						</div>
						<div style="width:10.5mm;">
							<div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:4mm;font-weight:bold;border-bottom-width:1px;">Yes</div>
							<div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:4mm;font-weight:bold;border-bottom-width:1px;">No</div>
							<div class="styLNAmountBox" style="width:5.2mm;height:6mm;padding-top:2mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
							  <xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form5713Data/OperationsCountryByctIsraelInd"/>
							  </xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:5mm;height:6mm;padding-top:2mm;padding-bottom:0mm;float:left;">
							  <xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form5713Data/OperationsCountryByctIsraelInd"/>
							  </xsl:call-template>
							</div>
						</div>
					  </div>
					  <!-- L8 "If" line-->
					  <div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:162mm;">
						  If "Yes," complete the following table. If more space is needed, attach additional sheets using the exact format and check this <br />
						  <span style="float:left;">box </span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">......................................</span>
						</div>
						<div class="styGenericDiv" style="width:10mm;padding-top:2mm;float:left;text-align:right;">
						  <span style="margin-right:2mm;">
							<img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing large arrowhead image" width="4"/>
						  </span>
						  <label>
							<xsl:call-template name="PopulateLabel">
							  <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoNonlistByctIsraelInd"/>
							  <xsl:with-param name="BackupName">IRS5713AddnlInfoNonlistedByctIsrael</xsl:with-param>							  
							</xsl:call-template>
						  </label>
						  <input type="checkbox" class="styckbox" name="Checkbox">
							<xsl:call-template name="PopulateCheckbox">
							  <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoNonlistByctIsraelInd"/>
							  <xsl:with-param name="BackupName">IRS5713AddnlInfoNonlistedByctIsrael</xsl:with-param>
							</xsl:call-template>
						  </input>
						</div>
						<!--Part I Table expand/collapse toggle button-->
						<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 8">
						  <span class="styGenericDiv" style="padding-top:3mm;float:right;clear:none;width:7mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
							  <xsl:with-param name="TargetNode" select="$Form5713Data/OprInCtryBoycottingIsrael"/>
							  <xsl:with-param name="containerHeight" select="15"/>
							  <xsl:with-param name="headerHeight" select="3"/>
							  <xsl:with-param name="containerID" select=" 'TPctn2' "/>
							</xsl:call-template>
						  </span>
						</xsl:if>
						<!--Table expand/collapse toggle button end-->
					  </div>
					  <!-- Part I, L8 Table : maximum line to display is 15 before scroll bar will display-->
					<div class="styTableContainer" id="TPctn2" style="float:none; clear:both;">
					    <!-- Show table in expanded form -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" summary="Nonlisted countries boycotting Israel" style="width:180mm;clear:both;float:none">
						  <thead class="styTableThead">
							<tr>
							  <th class="styTableCell" scope="col" rowspan="2" style="width:26mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;left-margin:3mm;">Name of country</th>
							  <th class="styTableCell" scope="col" rowspan="2" style="width:60mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Identifying number of person having operations</th>
							  <th class="styTableCell" scope="col" colspan="2" style="width:60mm;text-align:center;font-size:7pt;border-color:black;">Principal business activity</th>
							  <th class="styTableCell" scope="col" rowspan="2" style="width:41mm;text-align:center;font-size:7pt;border-color:black;border-right:none;border-bottom:none;">IC-DISCs only-Enter product code</th>
							</tr>
							<tr>
							  <th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Code</th>
							  <th class="styTableCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Description</th>
							</tr>
							<tr>
							  <th class="styTableCell" scope="col" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">(1)</th>
							  <th class="styTableCell" scope="col" style="width:60mm;text-align:center;font-size:7pt;border-color:black;">(2)</th>
							  <th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-size:7pt;border-color:black;">(3)</th>
							  <th class="styTableCell" scope="col" style="left-margin:0mm;width:40mm;text-align:center;font-size:7pt;border-color:black;">(4)</th>
							  <th class="styTableCell" scope="col" style="width:41mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">(5)</th>
							</tr>
						  </thead>
						<tfoot/>
						<tbody>
						<!--Part I L8 table when data display for inline print -->
						  <xsl:if test="($Print != $Separated) or (count($Form5713Data/OprInCtryBoycottingIsrael) &lt;= 15) ">
							<xsl:for-each select="$Form5713Data/OprInCtryBoycottingIsrael">
							  <tr>
							    <!-- Column 1 -->
								<td class="styTableCell">
								  <xsl:attribute name="style">
								    <xsl:choose>
								      <xsl:when test="position()=last()">
								      width:26mm;text-align:center;font-size:7pt;border-color:black; 
								      </xsl:when>
								      <xsl:otherwise>width:26mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
								    </xsl:choose>
								  </xsl:attribute>
								  <span style="float:left;">
									<!--<xsl:if test="position()&lt;= 15">-->
									  <span style="font-weight:bold;">
										<xsl:number value="position()" format="a"/>
									  </span>
									<!--</xsl:if>-->
									<span style="width:3mm;"/>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="CountryCd"/>
									</xsl:call-template>
								  </span>
								</td>
								<!-- Column 2 -->
								<td class="styTableCell">
								  <xsl:attribute name="style">
								    <xsl:choose>
								      <xsl:when test="position()=last()">
								        width:60mm;text-align:left;font-size:7pt;border-color:black; 
								      </xsl:when>
								      <xsl:otherwise>width:60mm;text-align:left;font-size:7pt;border-color:black</xsl:otherwise>
								    </xsl:choose>
								  </xsl:attribute>
								  <xsl:choose>
									<xsl:when test="PersonInvolvedSSN!=''">
								  	  <xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="PersonInvolvedSSN"/>
									  </xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
									  <xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="PersonInvolvedEIN"/>
									  </xsl:call-template>
									</xsl:otherwise>
								  </xsl:choose>
								  <xsl:if test="MissingEINReasonCd !=' '">
									<span style="font-weight:normal;">
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
									  </xsl:call-template>
									</span>
								  </xsl:if>
								  <xsl:if test="ForeignCorporationName!=''">
									<br/>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="ForeignCorporationName/BusinessNameLine2Txt!=''">
									  <br/>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
									  </xsl:call-template>
									</xsl:if>
									</xsl:if>
									<br/>
									<xsl:call-template name="populateEINFieldTemplate">
									  <xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								  </td>
								  <!-- Column 3 -->
								  <td class="styTableCell">
									<xsl:attribute name="style">
									  <xsl:choose>
									    <xsl:when test="position()=last()">
									      width:20mm;text-align:center;font-size:7pt;border-color:black; 
									    </xsl:when>
									    <xsl:otherwise>width:20mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
									  </xsl:choose></xsl:attribute>
									  <xsl:choose>
										<xsl:when test="InactivePrincipalBusActyCd!=''">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="InactivePrincipalBusActyCd"/>
										  </xsl:call-template>
										</xsl:when>
										<xsl:when test="PrincipalBusinessActivityCd!=''">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
										  </xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignCorpMissingEINReasonCd"/>
										  </xsl:call-template>
										</xsl:otherwise>
									  </xsl:choose>
									</td>
									<!-- Column 4 -->
									<td class="styTableCell">
									  <xsl:attribute name="style">
									    <xsl:choose>
									      <xsl:when test="position()=last()">
									        width:44mm;text-align:left;font-size:7pt;border-color:black; 
									      </xsl:when>
									      <xsl:otherwise>width:44mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
									    </xsl:choose>
									  </xsl:attribute>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
									  </xsl:call-template>
									</td>
									<!-- Column 5 -->
									<td class="styTableCell">
									  <xsl:attribute name="style">
									    <xsl:choose>
									      <xsl:when test="position()=last()">					
									        width:30mm;text-align:left;font-size:7pt;border-color:black;border-right:none; 
									      </xsl:when>
									      <xsl:otherwise>width:30mm;text-align:left;font-size:7pt;border-color:black;border-right:none; </xsl:otherwise>
									    </xsl:choose>
									  </xsl:attribute>
									  <span style="width:1px;"/>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="PrincipalProductCodeDesc"/>
									  </xsl:call-template>
									</td>
								  </tr>
								</xsl:for-each>
							  </xsl:if>
							  <!--Building blank row 1 for Part I L8 table -->
							  <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 1 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">a</span>
								  <xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form5713Data/OprInCtryBoycottingIsrael"/>
									<xsl:with-param name="ShortMessage" select="'true'"/>
								  </xsl:call-template>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 2 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 2 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">b</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 3 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 3 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">c</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 4 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 4 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">d</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 5 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 5 or         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">e</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 6 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 6 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">f</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 7 for Part I L8 table -->
						    <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 7 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">g</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 8 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 8 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
							    <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">h</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 9 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 9 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">i</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 10 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 10 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">j</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 11 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 11 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">k</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 12 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 12 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">l</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 13 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 13 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">m</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 14 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 14 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">n</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Building blank row 15 for Part I L8 table -->
							<xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 15 or          (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span style="float:left;font-weight:bold">o</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
						  </tbody>
						</table>
					  </div>
					  <xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5713Data/OprInCtryBoycottingIsrael"/>
						<xsl:with-param name="containerHeight" select="15"/>
						<xsl:with-param name="headerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'TPctn2' "/>
					  </xsl:call-template>
					  <!--Page Footer-->
					  <div class="pageEnd" style="width:187mm">
						<div style="float:right;">
						  <span style="width:80px;"/>  
							Form <span class="styBoldText"> 5713</span> (Rev. 12-2010)
						</div>
					  </div>
					  <!--END Page Footer-->
					  <!--Page 3 start-->
					<div class="styTBB" style="width:187mm;float:none; clear:both;">
						Form 5713 (Rev. 12-2010)<span style="width:140mm;"/>
						Page <span style="font-weight:bold;font-size:8pt;">3</span>
					  </div>
					<div style="width:187mm;">
					  <div class="styLNLeftNumBox" style="height:4mm;"/>
					  <div class="styLNDesc" style="width:168mm;height:4mm;"/>
					  <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:4mm;font-weight:bold;border-bottom-width:1px;">Yes</div>
					  <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:4mm;font-weight:bold;border-bottom-width:1px;">No</div>
					</div>
					<!-- L9 -->
					<div style="width:187mm;">
					  <div class="styLNLeftNumBox">9</div>
					  <div class="styLNDesc" style="width:168mm;height:4mm;">
						<b>Nonlisted countries boycotting Israel &#8211; </b>
						Did you have operations in any nonlisted country which you know or have reason to know requires participation in or cooperation with an international boycott directed against Israel?</div>
						<div class="styLNAmountBox" style="width:5.2mm;height:6mm;padding-top:3mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						  <xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$Form5713Data/OprNonlistedCtryByctIsraelInd"/>
						  </xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:5mm;height:6mm; padding-top:3mm;padding-bottom:0mm;float:left;">
						  <xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$Form5713Data/OprNonlistedCtryByctIsraelInd"/>
						  </xsl:call-template>
						</div>
					  </div>
					 <!-- L9 "If" line-->
					  <div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:162mm;">
						  If "Yes," complete the following table. If more space is needed, attach additional sheets using the exact format and check this <br />
						  <span style="float:left;">box </span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">......................................</span>
						</div>
						<div class="styGenericDiv" style="width:10mm;padding-top:3mm;float:left;text-align:right;">
						  <span style="margin-right:2mm;">
							<img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing large arrowhead image" width="4"/>
						  </span>
						  <label>
							<xsl:call-template name="PopulateLabel">
							  <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoNonlistByctIsraelInd"/>
							  <xsl:with-param name="BackupName">IRS5713AddnlInfoNonlistedByctIsrael</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="for"><xsl:value-of select="1"/></xsl:attribute>
						  </label>
						  <input type="checkbox" class="styckbox" name="Checkbox">
							<xsl:call-template name="PopulateCheckbox">
							  <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoNonlistByctIsraelInd"/>
							  <xsl:with-param name="BackupName">IRS5713AddnlInfoNonlistedByctIsrael</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="id"><xsl:value-of select="1"/></xsl:attribute>
						  </input>
						</div>
						<!--Part I Table expand/collapse toggle button-->
						<xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8">
						  <span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;padding-top:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonlistedCtryByctIsrael"/>
							  <xsl:with-param name="containerHeight" select="8"/>
									<xsl:with-param name="headerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'TPctn3' "/>
							</xsl:call-template>
						  </span>
						</xsl:if>
						<!--Table expand/collapse toggle button end-->
					  </div>
					  <!-- *******************************************************************  -->
					  <!--Part I, Line 9 Table will display 8 row of data before scroll bar will display -->
					  <div class="styTableContainer" id="TPctn3">
					  <!-- Show table in expanded form -->
					  <xsl:call-template name="SetInitialState"/>
						<table cellspacing="0" summary="Nonlisted countries boycotting Israel" style="width:182mm;clear:both;float:none;">
						<thead class="styTableThead">
						  <tr>
							<th class="styTableCell" scope="col" rowspan="2" style="width:26mm;text-align:center;font-size:7pt;         border-color:black;border-bottom:none;left-margin:3mm;">Name of country</th>
							<th class="styTableCell" scope="col" rowspan="2" style="width:60mm;text-align:center;font-size:7pt;     border-color:black;border-bottom:none;">
							  Identifying number of person having operations
							</th>
							<th class="styTableCell" scope="col" colspan="2" style="width:60mm;text-align:center;font-size:7pt;        border-color:black;">
							  Principal business activity
							</th>
							<th class="styTableCell" scope="col" rowspan="2" style="width:41mm;text-align:center;font-size:7pt;      border-color:black;border-bottom:none;border-right:none;">
							  IC-DISCs only-Enter product code
							</th>
						  </tr>
						<tr>
						  <th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Code</th>
						  <th class="styTableCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Description</th>
						</tr>
						<tr>
						  <th class="styTableCell" scope="col" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">(1)</th>
						  <th class="styTableCell" scope="col" style="width:60mm;text-align:center;font-size:7pt;border-color:black;">(2)</th>
						  <th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-size:7pt;border-color:black;">(3)</th>
						  <th class="styTableCell" scope="col" style="left-margin:0mm;width:40mm;text-align:center;font-size:7pt;border-color:black;">(4)</th>
						  <th class="styTableCell" scope="col" style="width:41mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">(5)</th>
						</tr>
					  </thead>
					  <tfoot/>
					  <tbody>
						<xsl:if test="($Print != $Separated) or (count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt;= 8) ">
						  <xsl:for-each select="$Form5713Data/OprInNonlistedCtryByctIsrael">
							<tr>
							  <td class="styTableCell">
								<xsl:attribute name="style">
								  <xsl:choose>
								    <xsl:when test="position()=last()">
								      width:26mm;text-align:center;font-size:7pt;border-color:black; 
								    </xsl:when>
								    <xsl:otherwise>width:26mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
								<span style="float:left;">
								  <!--<xsl:if test="position()&lt;=8">-->
									<span style="font-weight:bold;">
									  <xsl:number value="position()" format="a"/>
									</span>
								  <!--</xsl:if>-->
								  <span style="width:3mm;"/>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="CountryCd"/>
									</xsl:call-template>
								  </span>
								</td>
								<td class="styTableCell">
								  <xsl:attribute name="style">
								    <xsl:choose>
								      <xsl:when test="position()=last()">
								        width:60mm;text-align:left;font-size:7pt;border-color:black; 
								      </xsl:when>
								      <xsl:otherwise>width:60mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
								    </xsl:choose>
								  </xsl:attribute>
								  <xsl:choose>
									<xsl:when test="PersonInvolvedSSN!=''">
									  <xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="PersonInvolvedSSN"/>
									  </xsl:call-template>
									</xsl:when>
									<xsl:when test="PersonInvolvedEIN!=''">
									  <xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="PersonInvolvedEIN"/>
									  </xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
									  </xsl:call-template>
									</xsl:otherwise>
								  </xsl:choose>
								  <xsl:if test="ForeignCorporationName!=''">
									<br/>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="ForeignCorporationName/BusinessNameLine2Txt!=''">
									  <br/>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
									  </xsl:call-template>
									</xsl:if>
								  </xsl:if>
								  <br/>
								  <xsl:call-template name="populateEINFieldTemplate">
									<xsl:with-param name="TargetNode" select="."/>
								  </xsl:call-template>
								</td>
								<td class="styTableCell">
								  <xsl:attribute name="style">
								    <xsl:choose>
								      <xsl:when test="position()=last()">
								        width:20mm;text-align:center;font-size:7pt;border-color:black; 
								      </xsl:when>
								      <xsl:otherwise>width:20mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
								    </xsl:choose>
								  </xsl:attribute>
								  <xsl:choose>
									<xsl:when test="InactivePrincipalBusActyCd!=''">
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="InactivePrincipalBusActyCd"/>
									  </xsl:call-template>
									</xsl:when>
									<xsl:when test="PrincipalBusinessActivityCd!=''">
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
									  </xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignCorpMissingEINReasonCd"/>
									  </xsl:call-template>
									</xsl:otherwise>
								  </xsl:choose>
								</td>
								<td class="styTableCell">
								  <xsl:attribute name="style">
								    <xsl:choose>
									  <xsl:when test="position()=last()">
									    width:44mm;text-align:left;font-size:7pt;border-color:black; 
									  </xsl:when>
									  <xsl:otherwise>width:44mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
									</xsl:choose>
								  </xsl:attribute>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
								  </xsl:call-template>
								</td>
								<td class="styTableCell">
								  <xsl:attribute name="style">
									<xsl:choose>
									  <xsl:when test="position()=last()">
									    width:26mm;text-align:center;font-size:7pt;border-color:black;border-right-width:0px;
									  </xsl:when>
									  <xsl:otherwise>
										width:26mm;text-align:center;font-size:7pt;border-color:black;border-right-width:0px;								
									  </xsl:otherwise>
									</xsl:choose>
								  </xsl:attribute>
								  <span style="float:left;">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="PrincipalProductCodeDesc"/>									
									</xsl:call-template>
								  </span>
								</td>
                              </tr>
							</xsl:for-each>
						  </xsl:if>
						  <!--Build blank row 1 for Line 9 table -->
						  <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 1 or        (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
						    <tr>
							  <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								<span style="float:left;font-weight:bold;">a</span>
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
								  <xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonlistedCtryByctIsrael"/>
								  <xsl:with-param name="ShortMessage" select="'true'"/>
								</xsl:call-template>
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								<span class="styTableCellPad"/>
							  </td>
							</tr>
						  </xsl:if>
						  <!--Build blank row 2 for Line 9 table -->
						  <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 2 or        (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
							<tr>
							  <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								<span style="float:left;font-weight:bold;">b</span>
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								<span class="styTableCellPad"/>
							  </td>
							  <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								<span class="styTableCellPad"/>
							  </td>
							</tr>
							</xsl:if>
							<!--Build blank row 3 for Line 9 table -->
							<xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 3 or        (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">c</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 4 for Line 9 table -->
							<xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 4 or        (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">d</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 5 for Line 9 table -->
							<xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 5 or        (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">e</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 6 for Line 9 table -->
						    <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 6 or        (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">f</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 7 for Line 9 table -->
							<xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 7 or        (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">g</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 8 for Line 9 table -->
							<xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 8 or        (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span style="float:left;font-weight:bold;">h</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
						  </tbody>
						</table>
					  </div>
					  <xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonlistedCtryByctIsrael"/>
						<xsl:with-param name="containerHeight" select="8"/>
						<xsl:with-param name="headerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'TPctn3' "/>
					  </xsl:call-template>
					  <!-- Part I, Line 10 -->
					  <div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:168mm;"/>
						<div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:4mm;font-weight:bold;border-bottom-width:1px;">Yes</div>
						<div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:4mm;font-weight:bold;border-bottom-width:1px;">No</div>
					  </div>
					  <div style="width:187mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:168mm;">
						  <b>Boycotts other than the boycott of Israel &#8211; </b>
						  Did you have operations in any other country which you know or have reason to know requires participation in or cooperation with an international boycott other than the boycott of Israel?
						</div>
						<div class="styLNAmountBox" style="width:5.2mm;height:6mm;padding-top:3mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						  <xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$Form5713Data/OperationsNonIsraelByctCtryInd"/>
						  </xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:5mm;height:6mm;padding-top:3mm;padding-bottom:0mm;float:left;">
						  <xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$Form5713Data/OperationsNonIsraelByctCtryInd"/>
						  </xsl:call-template>
						</div>
					  </div>
					  <!-- *************************************************************  -->
					  <!-- Part 1, L10 "If" line-->
					  <div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:162mm;">
						  If "Yes," complete the following table. If more space is needed, attach additional sheets using the exact format and check this <br />
						  <span style="float:left;">box </span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">......................................</span>
						</div>
						<div class="styGenericDiv" style="width:10mm;padding-top:3mm;float:left;text-align:right;">
						  <span style="margin-right:2mm;">
							<img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing large arrowhead image" width="4"/>
						  </span>
						  <label>
							<xsl:call-template name="PopulateLabel">
							  <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoOprNonIsrlByctCtryInd"/>
							  <xsl:with-param name="BackupName">IRS5713AddnlInfoOprNonIsraelByctCtry</xsl:with-param>
							</xsl:call-template>
						  </label>
						  <input type="checkbox" class="styckbox" name="Checkbox">
							<xsl:call-template name="PopulateCheckbox">
							  <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoOprNonIsrlByctCtryInd"/>
							  <xsl:with-param name="BackupName">IRS5713AddnlInfoOprNonIsraelByctCtry</xsl:with-param>
							</xsl:call-template>
						  </input>
						</div>
						<!--Part I, line 10 Table expand/collapse toggle button-->
						<xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8">
						  <span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;padding-top:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonIsraelBoycottingCtry"/>
							  <xsl:with-param name="containerHeight" select="8"/>
							  <xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" 'TPctn6' "/>
							</xsl:call-template>
						  </span>
						</xsl:if>
						<!--Table expand/collapse toggle button end-->
					  </div>
				  <!--Part I, L10 Table will display 8 row data before a scroll will display -->
					  <div class="styTableContainer" id="TPctn6">
					  <!-- Show table in expanded form -->
					    <xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" summary="Boycotts other than the boycott of Israel" style="width:182mm;clear:both;float:none;">
						  <thead class="styTableThead">
							<tr>
							  <th class="styTableCell" scope="col" style="width:26mm;text-align:center;font-size:7pt;border-color:black;left-margin:3mm;" rowspan="2">								Name of country<br/>
								<b>(1)</b>
							  </th>
							  <th class="styTableCell" scope="col" style="width:60mm;text-align:center;font-size:7pt;border-color:black;" rowspan="2">
							    Identifying number of person having operations<br/>
								<b>(2)</b>
							  </th>
							  <th class="styTableCell" scope="col" style="left-margin:0mm;width:60mm;text-align:center;font-size:7pt;border-color:black;" colspan="2">
								<b>Principal business activity</b>
							  </th>
							  <th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;" rowspan="2">								IC-DISCs only-Enter product code<br/>
							   <b>(5)</b>
							  </th>
							</tr>
						    <tr>
							  <th class="styTableCell" scope="col" style="font-size:7pt;border-color:black;width:16.25mm;text-align:center;height:5mm;">Code<br/>
								<b>(3)</b>
							  </th>
							  <th class="styTableCell" scope="col" style="width:43.25mm;font-size:7pt;border-color:black;text-align:center;height:5mm;">Description<br/>
								<b>(4)</b>
							  </th>
							</tr>
						  </thead>
						<tfoot/>
						<tbody>
						  <xsl:if test="($Print != $Separated) or (count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt;= 8) ">
							<xsl:for-each select="$Form5713Data/OprInNonIsraelBoycottingCtry">
							  <tr>
								<td class="styTableCell">
								  <xsl:attribute name="style">
								    <xsl:choose>
								      <xsl:when test="position()=last()">
								        width:26mm;text-align:left;font-size:7pt;border-color:black; 
								      </xsl:when>
								      <xsl:otherwise>width:26mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
								    </xsl:choose>
								  </xsl:attribute>
								  <span style="float:left;">
									<!--<xsl:if test="position()&lt;9">-->
									  <span style="font-weight:bold;">
										<xsl:number value="position()" format="a"/>
									  </span>
									<!--</xsl:if>-->
									<span style="width:3mm;"/>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="CountryCd"/>
									</xsl:call-template>
								  </span>
								</td>
								<td class="styTableCell">
								  <xsl:attribute name="style">
								    <xsl:choose>
								      <xsl:when test="position()=last()">
								        width:60mm;text-align:left;font-size:7pt;border-color:black; 
								      </xsl:when>
								      <xsl:otherwise>width:60mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
								    </xsl:choose>
								  </xsl:attribute>
								  <xsl:choose>
									<xsl:when test="PersonInvolvedSSN!=''">
									  <xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="PersonInvolvedSSN"/>
									  </xsl:call-template>
									</xsl:when>
									<xsl:when test="PersonInvolvedEIN!=''">
									  <xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="PersonInvolvedEIN"/>
									  </xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
									  </xsl:call-template>
									</xsl:otherwise>
								  </xsl:choose>
								  <xsl:if test="ForeignCorporationName!=''">
									<br/>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="ForeignCorporationName/BusinessNameLine2Txt!=''">
									  <br/>
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
									  </xsl:call-template>
									</xsl:if>
								  </xsl:if>
									<br/>
									<xsl:call-template name="populateEINFieldTemplate">
									  <xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								  </td>
								  <td class="styTableCell">
									<xsl:attribute name="style">
									  <xsl:choose>
									    <xsl:when test="position()=last()">
									      width:16.25mm;text-align:center;font-size:7pt;border-color:black; 
									    </xsl:when>
									    <xsl:otherwise>width:16.25mm;text-align:center;font-size:7pt;border-color:black; </xsl:otherwise>
									  </xsl:choose>
									</xsl:attribute>
									<xsl:choose>
									  <xsl:when test="InactivePrincipalBusActyCd!=''">
										<xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" select="InactivePrincipalBusActyCd"/>
										</xsl:call-template>
									  </xsl:when>
									  <xsl:when test="PrincipalBusinessActivityCd!=''">
										<xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
										</xsl:call-template>
									  </xsl:when>
									  <xsl:otherwise>
										<xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" select="ForeignCorpMissingEINReasonCd"/>
										</xsl:call-template>
									  </xsl:otherwise>
									</xsl:choose>
								  </td>
								  <td class="styTableCell">
									<xsl:attribute name="style">
									  <xsl:choose>
									    <xsl:when test="position()=last()">
									      width:43.25mm;text-align:left;font-size:7pt;border-color:black; 
                                        </xsl:when>
                                        <xsl:otherwise>width:43.25mm;text-align:left;font-size:7pt;border-color:black </xsl:otherwise>
                                      </xsl:choose>
                                    </xsl:attribute>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
									</xsl:call-template>
								  </td>
								  <td class="styTableCell">
									<xsl:attribute name="style">
									  <xsl:choose>
										<xsl:when test="position()=last()">
										  width:26mm;text-align:center;font-size:7pt;border-color:black; border-right-width:0px
										</xsl:when>
										<xsl:otherwise>
										  width:26mm;text-align:center;font-size:7pt;border-color:black;border-right-width:0px
										</xsl:otherwise>
									  </xsl:choose>
									</xsl:attribute>
									<span style="float:left;">
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="PrincipalProductCodeDesc"/>
										</xsl:call-template>
									</span>
								  </td>
								</tr>
							  </xsl:for-each>
							</xsl:if>
							<!--Build blank row 1 for L10 Table -->
							<xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 1 or          (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">a</span>
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
									  <xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonIsraelBoycottingCtry"/>
									  <xsl:with-param name="ShortMessage" select="'true'"/>
									</xsl:call-template>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 2 for L10 Table -->
							<xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 2 or          (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">b</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 3 for L10 Table -->
							<xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 3 or          (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">c</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 4 for L10 Table -->
						    <xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 4 or          (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">d</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 5 for L10 Table -->
							<xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 5 or          (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">e</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 6 for L10 Table -->
							<xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 6 or         (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">f</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 7 for L10 Table -->
							<xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 7 or          (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
								  <span style="float:left;font-weight:bold;">g</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
							<!--Build blank row 8 for L10 Table -->
							<xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 8 or          (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
							  <tr>
								<td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span style="float:left;font-weight:bold;;">h</span>
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
								<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none; border-bottom-width: 0px">
								  <span class="styTableCellPad"/>
								</td>
							  </tr>
							</xsl:if>
						  </tbody>
						</table>
					  </div>
					  <xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonIsraelBoycottingCtry"/>
						<xsl:with-param name="containerHeight" select="8"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'TPctn6' "/>
					  </xsl:call-template>
					  <!-- L11 -->
					  <div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:168mm;"/>
						<div class="styIRS5713LNYesNoBox" style="width:5.2mm;height:4mm;font-weight:bold;border-bottom-width:1px;">Yes</div>
						<div class="styIRS5713LNYesNoBox" style="width:5mm;height:4mm;font-weight:bold;border-bottom-width:1px;">No</div>
					  </div>
					  <div style="width:187mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:168mm;">
						  <span style="float:left;">Were you requested to participate in or cooperate with an international boycott? 
							<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form5713Data/ReqParticipateBoycottInd"/>
						  </xsl:call-template>
						  </span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...............</span>						  
						</div>
						<div class="styLNAmountBox" style="width:5.2mm;height:5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						  <xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$Form5713Data/ReqParticipateBoycottInd"/>
						  </xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:5mm;height:5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
						  <xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$Form5713Data/ReqParticipateBoycottInd"/>
						  </xsl:call-template>
						</div>
					  </div>
					  <!-- L11 "If" line-->
					  <div class="styBB" style="width:187mm;">
					    <div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:168mm;">  
						  If "Yes," attach a copy (in English) of any and all such requests received during your tax year. If the request was in a form other 	than a written request, attach a separate sheet explaining the nature and form of any and all such requests. (See instructions.)
						</div>
						<div class="styShadingCell" style="width:5.25mm;height:7.5mm;"/>
						<div class="styShadingCell" style="width:5.25mm;height:7.5mm;"/>
					  </div>
					  <!-- L12 -->
					  <div style="width:187mm;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:168mm;">
						  <span style="float:left;">Did you participate in or cooperate with an international boycott? 
							<xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form5713Data/ParticipateBoycottInd"/>
						    </xsl:call-template>
						  </span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...................</span>	
						</div>
						<div class="styLNAmountBox" style="width:5.2mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						  <xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$Form5713Data/ParticipateBoycottInd"/>
						  </xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:5mm;padding-top:0mm;padding-bottom:0mm;float:left;">
						  <xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$Form5713Data/ParticipateBoycottInd"/>
						  </xsl:call-template>
						</div>
					  </div>
					  <!-- L12 "If" line-->
					  <div class="styBB" style="width:187mm;height:10mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:179mm;">
						  If "Yes," attach a copy (in English) of any and all boycott clauses agreed to, and attach a general statement of the agreement. 
						  If the agreement was in a form other than a written agreement, attach a separate sheet explaining the nature and form of any 
						  and all such agreements. (See instructions.)
					    </div>
					  </div>
					<div class="styBB" style="width:187mm;float:none; clear:both;height:8mm;">
						<div class="styLNLeftNumBox">Note: <span style="width:1mm;"/></div>
						<div class="styLNDesc" style="width:176mm;padding-left:2mm;">
						  <i>If the answer to either question 11 or 12 is "Yes," you must complete the rest of Form 5713. If you answered "Yes" to question 12, you must complete Schedules A and C or B and C (Form 5713).</i>
						</div>
					  </div>
					  <!--Page Footer-->
					  <div class="pageEnd" style="width:187mm">
						<div style="float:right;">
						  <span style="width:80px;"/>  
							Form <span class="styBoldText"> 5713</span> (Rev. 12-2010)
						</div>
					  </div>
					  <!--END Page Footer-->
					  <!--Page 4 start-->
					<div class="styBB" style="width:187mm;float:none; clear:both;">
                        Form 5713 (Rev. 12-2010)<span style="width:140mm;"/>
                        Page <span style="font-weight:bold;font-size:8pt;">4</span>
					  </div>
					  <div class="styBB" style="width:187mm;border-top-width:0px">
						<div class="styLNDesc" style="width:155mm;height:8mm;">
						  <span class="styPartName">Part II</span>
						  <span style="font-family:verdana;font-size:8pt;font-weight:bold;"> 
						    Requests for and Acts of Participation in or Cooperation With an International Boycott </span>
						</div>
						<div class="styIRS5713LNYesNoBox" style="width:14.75mm;height:4mm;font-weight:bold;border-bottom-width:1px;">Requests</div>
						<div class="styIRS5713LNYesNoBox" style="width:16.75mm;height:4mm;font-weight:bold;border-bottom-width:1px;">Agreements</div>
						<div class="styIRS5713LNYesNoBox" style="width:7.5mm;height:4mm;font-weight:bold;border-bottom-width:0px;">Yes</div>
						<div class="styIRS5713LNYesNoBox" style="width:7.5mm;height:4mm;font-weight:bold;border-bottom-width:0px;">No</div>
						<div class="styIRS5713LNYesNoBox" style="width:7.5mm;height:4mm;font-weight:bold;border-bottom-width:0px;">Yes</div>
						<div class="styIRS5713LNYesNoBox" style="width:7.5mm;height:4mm;font-weight:bold;border-bottom-width:0px;">No</div>
					  </div>
					  <!-- Part II, L13a -->
					  <div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox">13a</div>
						<div class="styLNDesc" style="width:147mm;">Did you receive requests to enter into, or did you enter into, any agreement (see instructions):</div>
						<div class="styShadingCell" style="width:7.5mm;height:4.5mm;"/>
						<div class="styShadingCell" style="width:7.5mm;height:4.5mm;"/>
						<div class="styShadingCell" style="width:7.5mm;height:4.5mm;"/>
						<div class="styShadingCell" style="width:9.5mm;height:4.5mm;"/>
					  </div>
					  <!-- Part II, L13a(1) -->
					  <div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:5mm;"/>
						<div class="styLNLeftLtrBox" style="height:4.5mm;">(1)</div>
						<div class="styLNDesc" style="width:142mm;height:4mm;">
						  As a condition of doing business directly or indirectly within a country or with the government, a company, or a national of a country to &#8211; </div>
						<div class="styLNAmountBox" style="height:8mm;border-top-width:0px;width:7.5mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:8mm;border-top-width:0px;width:7.5mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:8mm;border-top-width:0px;width:7.5mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:8mm;border-top-width:0px;width:7.5mm;border-bottom-width:0px"/>
						<br/>
					  </div>
					  <!-- Part II, L13a(1)(a) -->
					  <div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:5mm;"/>
						  <div class="styLNLeftLtrBox" style="height:4.5mm;">
						</div>
					  <div class="styLNDesc" style="width:5mm;font-weight:bold;">(a)</div>
					  <div style="width:137mm;font-weight:normal;" class="styLNDesc">
					    Refrain from doing business with or in a country which is the object of an international boycott or 
					    <span style="float:left;">with the government, companies, or nationals of that country? </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.............</span>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:3mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/ReqRefrainDoingBusByctCtryInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:3mm;padding-bottom:0mm;float:left;text-align:center;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/ReqRefrainDoingBusByctCtryInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:3mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/AgrRefrainDoingBusByctCtryInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:8.5mm;height:7.5mm;padding-top:3mm;padding-bottom:0mm;float:left;text-align:center;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/AgrRefrainDoingBusByctCtryInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!-- Part II, L13a(1)(b) -->
					<div style="width:187mm;">
					  <div class="styLNLeftLtrBox" style="height:4.5mm;width:5mm;"/>
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
					  </div>
					  <div class="styLNDesc" style="width:5mm;font-weight:bold;">(b)</div>
					  <div style="width:137mm;font-weight:normal;" class="styLNDesc">
					    Refrain from doing business with any U.S. person engaged in trade in a country which is the object of an 		
						<span style="float:left;">international boycott or with the government, companies, or nationals of that country? </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">......</span>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/ReqRefrainDoingBusUSPrsnInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/ReqRefrainDoingBusUSPrsnInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/AgreeRefrainDoingBusUSPrsnInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:8.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/AgreeRefrainDoingBusUSPrsnInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!-- Part II, L13a(1)(c) -->
					<div style="width:187mm;">
					  <div class="styLNLeftLtrBox" style="height:4.5mm;width:5mm;"/>
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
					  </div>
					  <div class="styLNDesc" style="width:5mm;font-weight:bold;">(c)</div>
					  <div class="styLNDesc" style="width:137mm;font-weight:normal;">
					    Refrain from doing business with any company whose ownership or management is made up, in whole or in 
					    part, of individuals of a particular nationality, race, or religion, or to remove (or refrain from selecting) 
						<span style="float:left;">corporate directors who are individuals of a particular nationality, race, or religion? </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.......</span>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:11mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/RequestRefrainDoingBusCoRNOInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:11mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/RequestRefrainDoingBusCoRNOInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:11mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/AgreeRefrainDoingBusCoRNOInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:8.5mm;height:11mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/AgreeRefrainDoingBusCoRNOInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!-- Part II, L13a(1)(d) -->
					<div style="width:187mm;">
					  <div class="styLNLeftLtrBox" style="height:4.5mm;width:5mm;"/>
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
					  </div>
					  <div class="styLNDesc" style="width:5mm;font-weight:bold;">(d)</div>
					  <div style="width:137mm;font-weight:normal;" class="styLNDesc">
                        <span style="float:left;">Refrain from employing individuals of a particular nationality, race, or religion? </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">........</span>					  
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:5.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/RequestRefrainEmplgIndivRNOInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:5.5mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/RequestRefrainEmplgIndivRNOInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:5.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/AgreeRefrainEmplgIndivRNOInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:8.5mm;height:5.5mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/AgreeRefrainEmplgIndivRNOInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!-- Part II, L13a(2) -->
					<div class="styBB" style="width:187mm;">
					  <div class="styLNLeftLtrBox" style="height:4.5mm;width:5mm;"/>
					  <div class="styLNLeftLtrBox" style="height:4.5mm;">(2)</div>
					  <div class="styLNDesc" style="width:142mm;height:4mm;">
					    As a condition of the sale of a product to the government, a company, or a national of a country, to refrain 
					    from shipping or insuring products on a carrier owned, leased, or operated by a person who does not
					    <span style="float:left;">participate in or cooperate with an international boycott? </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.................</span> 
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:10.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:none;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/RequestRefrainShippingProdInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:10.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:none;float:left;text-align:center;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/RequestRefrainShippingProdInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:7.5mm;height:10.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:none;float:left;clear:none;text-align:center;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/AgreeRefrainShippingProdInd"/>
						</xsl:call-template>
					  </div>
					  <div class="styLNAmountBox" style="width:8.5mm;height:10.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:none;float:left;text-align:center;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form5713Data/AgreeRefrainShippingProdInd"/>
						</xsl:call-template>
					  </div>
					</div>
					<!-- Part II, L13b -->
					<div class="styBB" style="width:187mm;">
					  <div class="styLNLeftLtrBox" style="padding-left:4mm;float:left;clear:none;">b</div>
					  <div class="styLNDesc" style="width:163mm;height:7mm;">
						<b>Requests and agreements &#8211; </b>
						if the answer to any part of 13a is "Yes," complete the following table.  If more space is needed,
							<span style="float:left;">attach additional sheets using the exact format and check this box </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:left;font-weight:bold;padding-left:1mm;">..................</span>  
					  </div>
					  <div class="styGenericDiv" style="height:4mm;width:10mm;padding-top:2mm;">
						<span style="margin-left:1mm;margin-right:1mm;">
						  <img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing large arrowhead image" width="4"/>
						</span>
						<label>
						  <xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$Form5713Data/AddnlByctReqAndAgrmtIncldInd"/>
							<xsl:with-param name="BackupName">IRS5713AddnlByctRequestAndAgrmtIncld</xsl:with-param>
						  </xsl:call-template>
						</label>
						<input type="checkbox" class="styckbox" name="Checkbox">
						  <xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form5713Data/AddnlByctReqAndAgrmtIncldInd"/>
							<xsl:with-param name="BackupName">IRS5713AddnlByctRequestAndAgrmtIncld</xsl:with-param>							
						  </xsl:call-template>
						</input>
					  </div>
					  <!--Table expand/collapse toggle button -->
					  <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16">
						  <span class="styGenericDiv" style="float:none;clear:none;padding-top:3mm;width:2mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
							  <xsl:with-param name="TargetNode" select="$Form5713Data/BoycottRequestsAndAgreements"/>
							  <xsl:with-param name="containerHeight" select="16"/>
							  <xsl:with-param name="headerHeight" select="3"/>
							  <xsl:with-param name="containerID" select=" 'TPctn7' "/>
							</xsl:call-template>
						  </span>
					  </xsl:if>
					  <!--Table expand/collapse toggle button end-->
					</div>
					<!-- Part II, L13b Table will display 16 row of data and no scroll bar becz it is a table at the end of the form -->
					<div class="styTableContainerNBB" id="TPctn7">
					<!-- Show table in expanded form -->
					  <xsl:call-template name="SetInitialState"/>
					  <!-- end -->
					  <table cellspacing="0" summary="Requests and Agreements" style="width:187mm;height:87mm;clear:both;float:none;">
						<thead class="styTableThead">
						  <tr>
							<th rowspan="3" class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;left-margin:3mm;" scope="col">Name of country</th>
							<th rowspan="3" class="styTableCell" style="width:50mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;" scope="col">Identifying number of person receiving the request or having the agreement</th>
							<th rowspan="2" colspan="2" class="styTableCell" style="width:41mm;padding-bottom:0mm;padding-top:0mm;left-margin:0mm;text-align:center;font-size:7pt;border-color:black;" scope="col">Principal business activity</th>
							<th rowspan="3" class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;" scope="col">IC-DISCs only-Enter product code</th>
							<th colspan="4" class="styTableCell" style="width:64mm;text-align:center;font-size:7pt;border-color:black;border-right:none;" scope="col">Type of cooperation or participation</th>
						  </tr>
						  <tr>
							<th colspan="2" class="styTableCell" style="width:32mm;text-align:center;font-size:7pt;border-color:black;border-right-width:1px;" scope="col">Number of requests</th>
							<th colspan="2" class="styTableCell" style="width:32mm;text-align:center;padding-left:5mm;font-size:7pt;border-color:black;border-bottom-width:1px;border-right:none;" scope="col">Number of agreements</th>
						  </tr>
						  <tr>
							<th class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;" scope="col">Code</th>
							<th class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;" scope="col">Description</th>
							<th class="styTableCell" style="width:24mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;" scope="col">Total</th>
							<th class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;" scope="col">Code</th>
							<th class="styTableCell" style="width:24mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;" scope="col">Total</th>
							<th class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;border-right:none;border-color:black;border-bottom:none;" scope="col">Code</th>
						  </tr>
						  <tr>
							<th class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;" scope="col">(1)</th>
							<th class="styTableCell" style="width:50mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;" scope="col">(2)</th>
							<th class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;" scope="col">(3)</th>
							<th class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;" scope="col">(4)</th>
							<th class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;" scope="col">(5)</th>
							<th class="styTableCell" style="width:24mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;" scope="col">(6)</th>
							<th class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;" scope="col">(7)</th>
							<th class="styTableCell" style="width:24mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;" scope="col">(8)</th>
							<th class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;font-weight:bold;border-right:none;border-color:black;" scope="col">(9)</th>
						  </tr>
						</thead>
					  <tfoot/>
					  <tbody>
						<xsl:if test="($Print != $Separated) or (count($Form5713Data/BoycottRequestsAndAgreements) &lt;= 16) ">
						  <xsl:for-each select="$Form5713Data/BoycottRequestsAndAgreements">
							<tr>
							  <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
								<!--<xsl:if test="position()&lt;=16">-->
								  <span style="font-weight:bold;">
									<xsl:number value="position()" format="a"/>
								  </span>
								<!--</xsl:if>-->
								<span style="width:2mm;"/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CountryCd"/>
								</xsl:call-template>
							  </td>
							  <!--Inline: Part II, line 13b table, column 2 *****-->
							  <td class="styTableCell" style="width:50mm;text-align:left;font-size:7pt;border-color:black;">
								<xsl:choose>
								  <xsl:when test="PersonInvolvedSSN!=''">
									<xsl:call-template name="PopulateSSN">
									  <xsl:with-param name="TargetNode" select="PersonInvolvedSSN"/>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:when test="PersonInvolvedEIN!=''">
									<xsl:call-template name="PopulateEIN">
									  <xsl:with-param name="TargetNode" select="PersonInvolvedEIN"/>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:otherwise>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
									</xsl:call-template>
								  </xsl:otherwise>
								</xsl:choose>
								<xsl:if test="ForeignCorporationName!=''">
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
								  </xsl:call-template>
								  <xsl:if test="ForeignCorporationName/BusinessNameLine2Txt!=''">
									<br/>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								  </xsl:if>
								</xsl:if>
								<br/>
								<xsl:call-template name="populateEINFieldTemplate">
								  <xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;border-style:solid;border-width:1px;border-top:none;border-left:none;border-color:black;border-width-right:1px;">
							  <xsl:choose>
							   <xsl:when test="PrincipalBusinessActivityCd">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
								</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="InactivePrincipalBusActyCd"/>
								</xsl:call-template>
								</xsl:otherwise>
								</xsl:choose>
							  </td>
							  <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-style:solid;border-width:1px;border-top:none;border-left:none;border-color:black;border-width-right:1px;">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-style:solid;border-width:1px;border-top:none;border-left:none;border-color:black;border-right-width:1px">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="PrincipalProductCodeDesc"/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;" nowrap="nowrap">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="MaxSize" select="12"/>
								  <xsl:with-param name="TargetNode" select="BoycottRequestCnt"/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;border-color:black;" nowrap="nowrap">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="NumberBoycottRequestCd"/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;border-width-right:1px;" nowrap="nowrap">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="MaxSize" select="12"/>
								  <xsl:with-param name="TargetNode" select="BoycottAgrmtCnt"/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;border-color:black;border-bottom-width:1px;border-right:none;" nowrap="nowrap">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="NumberBoycottAgrmtCd"/>
								</xsl:call-template>
							  </td>
							</tr>
						  </xsl:for-each>
						</xsl:if>
						<!-- Build blank row 1 for L13b Table ?????-->
					    <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 1 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">a</span>
							</td>
							<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;border-color:black;">
							  <xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$Form5713Data/BoycottRequestsAndAgreements"/>
							  </xsl:call-template>
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 2 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 2 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">b</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 3 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 3 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">c</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 4 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 4 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">d</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 5 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 5 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">e</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 6 for L13b Table -->
					    <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 6 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">f</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 7 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 7 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">g</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 8 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 8 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">h</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 9 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 9 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">i</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 10 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 10 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">j</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 11 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 11 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">k</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 12 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 12 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">l</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 13 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 13 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">m</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 14 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 14 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">n</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 15 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt;15 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">o</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
						<!-- Build blank row 16 for L13b Table -->
						<xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt;16 or          (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
						  <tr>
							<td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad" style="float:left;font-weight:bold;">p</span>
							</td>
							<td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;">
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
							  <span class="styTableCellPad"/>
							</td>
						  </tr>
						</xsl:if>
					  </tbody>
					</table>
				  </div>
				  <xsl:call-template name="SetInitialDynamicTableHeight">
					<xsl:with-param name="TargetNode" select="$Form5713Data/BoycottRequestsAndAgreements"/>
					<xsl:with-param name="containerHeight" select="16"/>
					<xsl:with-param name="headerHeight" select="3"/>
					<xsl:with-param name="containerID" select=" 'TPctn7' "/>
				  </xsl:call-template>
				  <!--Page Footer-->
				  <div class="pageEnd" style="width:187mm">
					<div style="float:right;">
					  <span style="width:80px;"/>  
                      Form <span class="styBoldText"> 5713</span> (Rev. 12-2010)
                    </div>
				  </div>
				  <!--END Page Footer-->
				  <br/>
				  <!-- BEGIN Left Over Table -->
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
					  <xsl:with-param name="TargetNode" select="$Form5713Data"/>
					  <xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				  </table>
				  <!-- END Left Over Table -->
				  <!-- Additonal Data Table for separated data from Line 2b (Third table) -->
				  <xsl:if test="($Print = $Separated) and       (count($Form5713Data/PartnershipAndCorporationGrp) &gt; 6) ">
					<span class="styRepeatingDataTitle">
					  <br/>Form 5713, Line 2b - Corporations:
                    </span>
					  <table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col">Name</th>
							<th class="styDepTblCell" scope="col">Identifying Number</th>
						  </tr>
						</thead>
						<tbody>
						  <xsl:for-each select="$Form5713Data/PartnershipAndCorporationGrp">
							<tr>
	                        <!--Define background colors to the rows -->
                           	  <xsl:attribute name="class">
                           	    <xsl:choose>
								  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							  </xsl:attribute>
							  <td class="styDepTblCell" style="width:140mm;text-align:left;">
								<xsl:choose>
								  <xsl:when test="BusinessName">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>													
									<!-- For reguler push pen -->
									<xsl:call-template name="SetFormLinkInline">
									  <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipAndCorporationGrp"/>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:otherwise>
       	                            <xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="NameLine1Txt"/>
									</xsl:call-template>
								  </xsl:otherwise>
								</xsl:choose>
							  </td>
							  <td class="styDepTblCell" style="width:40mm;text-align:center">
								<xsl:choose>
								  <xsl:when test="normalize-space(EIN)">
									<xsl:call-template name="PopulateEIN">
									  <xsl:with-param name="TargetNode" select="EIN"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								  </xsl:when>
								  <xsl:when test="normalize-space(SSN)">
									<xsl:call-template name="PopulateSSN">
									  <xsl:with-param name="TargetNode" select="SSN"/>
									</xsl:call-template>
									<span style="width: 2px"/>
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
					<!-- End Line 2b separated data -->
				    <!-- Additonal Data Table for separated data from Part I, Line 8 -->
					<xsl:if test="($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt;14) ">
					  <span class="styRepeatingDataTitle">
						<br/>Form 5713, Part I, Line 8 - Boycott of Israel:
					  </span>
					  <table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:26mm;text-align:center;border-bottom:none;left-margin:3mm;">Name of country</th>
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:60mm;text-align:center;border-bottom:none;">Identifying number of person having operations</th>
							<th class="styDepTblCell" scope="col" colspan="2" style="width:60mm;text-align:center;border-color:black;">Principal business activity</th>
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:41mm;text-align:center;border-bottom:none;">IC-DISCs only-Enter product code</th>
						  </tr>
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-bottom:none;">Code</th>
							<th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-bottom:none;">Description</th>
						  </tr>
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:26mm;text-align:center;border-top:none">(1)</th>
							<th class="styDepTblCell" scope="col" style="width:60mm;text-align:center;border-top:none">(2)</th>
							<th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-top:none">(3)</th>
							<th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-top:none">(4)</th>
							<th class="styDepTblCell" scope="col" style="width:41mm;text-align:center;border-top:none;">(5)</th>
						  </tr>
						</thead>
						<tbody>
						  <xsl:for-each select="$Form5713Data/OprInCtryBoycottingIsrael">
							<tr>
							<!--Define background colors to the rows -->
                              <xsl:attribute name="class">
                                <xsl:choose>
								  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							  </xsl:attribute>
							  <td class="styTableCell">
								<xsl:attribute name="style">
								  <xsl:choose>
								    <xsl:when test="position()=last()">
								      width:26mm;text-align:center;font-size:7pt;border-color:black; 
								    </xsl:when>
								    <xsl:otherwise>width:26mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
								<span style="float:left;">
								  <!--<xsl:if test="position()&lt;= 15">-->
									<span style="font-weight:bold;">
									  <xsl:number value="position()" format="a"/>
									</span>
								  <!--</xsl:if>-->
								  <span style="width:3mm;"/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CountryCd"/>
								  </xsl:call-template>
								</span>
							  </td>
							  <td class="styTableCell">
								<xsl:attribute name="style">
								  <xsl:choose>
								    <xsl:when test="position()=last()">
								      width:60mm;text-align:left;font-size:7pt;border-color:black; 
								    </xsl:when>
								    <xsl:otherwise>width:60mm;text-align:left;font-size:7pt;border-color:black</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
								<xsl:choose>
								  <xsl:when test="PersonInvolvedSSN!=''">
									<xsl:call-template name="PopulateSSN">
									  <xsl:with-param name="TargetNode" select="PersonInvolvedSSN"/>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
									  <xsl:with-param name="TargetNode" select="PersonInvolvedEIN"/>
									</xsl:call-template>
								  </xsl:otherwise>
								</xsl:choose>
								<xsl:if test="MissingEINReasonCd !=' '">
								  <span style="font-weight:normal;">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
									</xsl:call-template>
								  </span>
								</xsl:if>
								<xsl:if test="ForeignCorporationName!=''">
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
								  </xsl:call-template>
								  <xsl:if test="ForeignCorporationName/BusinessNameLine2Txt!=''">
									<br/>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								  </xsl:if>
								</xsl:if>
								<br/>
								<xsl:call-template name="populateEINFieldTemplate">
								  <xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCell">
								<xsl:attribute name="style">
								  <xsl:choose>
								    <xsl:when test="position()=last()">
								      width:20mm;text-align:center;font-size:7pt;border-color:black; 
								    </xsl:when>
								    <xsl:otherwise>width:20mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
								<xsl:choose>
								  <xsl:when test="InactivePrincipalBusActyCd!=''">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="InactivePrincipalBusActyCd"/>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:when test="PrincipalBusinessActivityCd!=''">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:otherwise>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="ForeignCorpMissingEINReasonCd"/>
									</xsl:call-template>
								  </xsl:otherwise>
								</xsl:choose>
							  </td>
							  <td class="styTableCell">
								<xsl:attribute name="style">
								  <xsl:choose>
								    <xsl:when test="position()=last()">
								      width:44mm;text-align:left;font-size:7pt;border-color:black; 
								    </xsl:when>
								    <xsl:otherwise>width:44mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCell">
								<xsl:attribute name="style">
								  <xsl:choose>
								    <xsl:when test="position()=last()">				
								      width:30mm;text-align:left;font-size:7pt;border-color:black;border-right:none; 
								    </xsl:when>
								    <xsl:otherwise>width:30mm;text-align:left;font-size:7pt;border-color:black;border-right:none;</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
								<span style="width:1px;"/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="PrincipalProductCodeDesc"/>
								</xsl:call-template>
							  </td>
							</tr>
						  </xsl:for-each>
						</tbody>
					  </table>
					</xsl:if>
					<!-- End Part I Line 8 separated data -->
					<!-- Additonal Data Table for separated data from Part I Line 9 -->
					<xsl:if test="($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8) ">
					  <span class="styRepeatingDataTitle">
						<br/>Form 5713, Part I, Line 9 - Nonlisted countries boycotting Israel:
					  </span>
					  <table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:26mm;text-align:center;border-bottom:none;left-margin:3mm;">Name of country</th>
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:60mm;text-align:center;border-bottom:none;">Identifying number of person having operations</th>
							<th class="styDepTblCell" scope="col" colspan="2" style="width:60mm;text-align:center;border-color:black;">Principal business activity</th>
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:41mm;text-align:center;border-bottom:none;">IC-DISCs only-Enter product code</th>
						  </tr>
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-bottom:none;">Code</th>
							<th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-bottom:none;">Description</th>
						  </tr>
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:26mm;text-align:center;border-top:none">(1)</th>
							<th class="styDepTblCell" scope="col" style="width:60mm;text-align:center;border-top:none">(2)</th>
							<th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-top:none">(3)</th>
							<th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-top:none">(4)</th>
							<th class="styDepTblCell" scope="col" style="width:41mm;text-align:center;border-top:none;">(5)</th>
						  </tr>
						</thead>
					  <tbody>
					  <xsl:for-each select="$Form5713Data/OprInNonlistedCtryByctIsrael">
						<tr>
						<!--Define background colors to the rows -->
                          <xsl:attribute name="class">
                            <xsl:choose>
							  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
							  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
							</xsl:choose>
						  </xsl:attribute>	
						  <td class="styTableCell">
							<xsl:attribute name="style">
							  <xsl:choose>
							    <xsl:when test="position()=last()">
							      width:26mm;text-align:center;font-size:7pt;border-color:black; 
							    </xsl:when>
							    <xsl:otherwise>width:26mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
							  </xsl:choose>
							</xsl:attribute>
							<span style="float:left;">
							  <!--<xsl:if test="position()&lt;=8">-->
								<span style="font-weight:bold;">
								  <xsl:number value="position()" format="a"/>
								</span>
							  <!--</xsl:if>-->
							  <span style="width:3mm;"/>
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="CountryCd"/>
							  </xsl:call-template>
							</span>
						  </td>
						  <td class="styTableCell">
							<xsl:attribute name="style">
							  <xsl:choose>
							    <xsl:when test="position()=last()">
							      width:60mm;text-align:left;font-size:7pt;border-color:black; 
							    </xsl:when>
							    <xsl:otherwise>width:60mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
							  </xsl:choose>
							</xsl:attribute>
							<xsl:choose>
							  <xsl:when test="PersonInvolvedSSN!=''">
								<xsl:call-template name="PopulateSSN">
								  <xsl:with-param name="TargetNode" select="PersonInvolvedSSN"/>
								</xsl:call-template>
							  </xsl:when>
							  <xsl:when test="PersonInvolvedEIN!=''">
								<xsl:call-template name="PopulateEIN">
								  <xsl:with-param name="TargetNode" select="PersonInvolvedEIN"/>
								</xsl:call-template>
							  </xsl:when>
							  <xsl:otherwise>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
								</xsl:call-template>
							  </xsl:otherwise>
							</xsl:choose>
							<xsl:if test="ForeignCorporationName!=''">
							  <br/>
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
							  </xsl:call-template>
							  <xsl:if test="ForeignCorporationName/BusinessNameLine2Txt!=''">
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							  </xsl:if>
							</xsl:if>
							<br/>
							<xsl:call-template name="populateEINFieldTemplate">
							  <xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						  </td>
						  <td class="styTableCell">
							<xsl:attribute name="style">
							  <xsl:choose>
							    <xsl:when test="position()=last()">
							      width:20mm;text-align:center;font-size:7pt;border-color:black; 
							    </xsl:when>
							    <xsl:otherwise>width:20mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
							  </xsl:choose>
							</xsl:attribute>
							<xsl:choose>
							  <xsl:when test="InactivePrincipalBusActyCd!=''">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="InactivePrincipalBusActyCd"/>
								</xsl:call-template>
							  </xsl:when>
							  <xsl:when test="PrincipalBusinessActivityCd!=''">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
								</xsl:call-template>
							  </xsl:when>
							  <xsl:otherwise>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="ForeignCorpMissingEINReasonCd"/>
								</xsl:call-template>
							  </xsl:otherwise>
							</xsl:choose>
						  </td>
						  <td class="styTableCell">
							<xsl:attribute name="style">
							  <xsl:choose>
							    <xsl:when test="position()=last()">
							      width:44mm;text-align:left;font-size:7pt;border-color:black; 
							    </xsl:when>
							    <xsl:otherwise>width:44mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
							  </xsl:choose>
							</xsl:attribute>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
							</xsl:call-template>
						  </td>
						  <td class="styTableCell">
							<xsl:attribute name="style">
							  <xsl:choose>
							    <xsl:when test="position()=last()">	
							      width:20mm;text-align:center;text-align:center;font-size:7pt;border-color:black; 
							    </xsl:when>
							    <xsl:otherwise>width:20mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
							  </xsl:choose>
							</xsl:attribute>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="PrincipalProductCodeDesc"/>
							</xsl:call-template>
						  </td>
						</tr>
					  </xsl:for-each>
					</tbody>
				  </table>
				</xsl:if>
				<!-- End Part I Line 9 separated data -->
				<!-- Additonal Data Table for separated data from Part I Line 10 -->
				<xsl:if test="($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8) ">
				  <span class="styRepeatingDataTitle">
					<br/>Form 5713, Part I, Line 10 - Boycotts other than the boycott of Israel:
				  </span>
				  <table class="styDepTbl" style="font-size:7pt">
					<thead class="styTableHead">
					  <tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col" rowspan="2" style="width:26mm;text-align:center;border-bottom:none;left-margin:3mm;">
                          Name of country
                        </th>
						<th class="styDepTblCell" scope="col" rowspan="2" style="width:60mm;text-align:center;border-bottom:none;">
                          Identifying number of person having operations
                        </th>
						<th class="styDepTblCell" scope="col" colspan="2" style="width:60mm;text-align:center;border-color:black;">
                          Principal business activity
                        </th>
						<th class="styDepTblCell" scope="col" rowspan="2" style="width:41mm;text-align:center;border-bottom:none;">
                          IC-DISCs only-Enter product code
                        </th>
					  </tr>
					  <tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-bottom:none;">Code</th>
						<th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-bottom:none;">Description</th>
					  </tr>
					  <tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col" style="width:26mm;text-align:center;border-top:none">(1)</th>
						<th class="styDepTblCell" scope="col" style="width:60mm;text-align:center;border-top:none">(2)</th>
						<th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-top:none">(3)</th>
						<th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-top:none">(4)</th>
						<th class="styDepTblCell" scope="col" style="width:41mm;text-align:center;border-top:none;">(5)</th>
					  </tr>
					  </thead>
					  <tbody>
					    <xsl:for-each select="$Form5713Data/OprInNonIsraelBoycottingCtry">
						  <tr>
							<!--Define background colors to the rows -->
                           	<xsl:attribute name="class">
                           	  <xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							  </xsl:choose>
							</xsl:attribute>	
							<td class="styTableCell">
							  <xsl:attribute name="style">
							    <xsl:choose>
							      <xsl:when test="position()=last()">
							        width:26mm;text-align:left;font-size:7pt;border-color:black; 
							      </xsl:when>
							      <xsl:otherwise>width:26mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
							    </xsl:choose>
							  </xsl:attribute>
							  <span style="float:left;">
								<!--<xsl:if test="position()&lt;9">-->
								  <span style="font-weight:bold;">
									<xsl:number value="position()" format="a"/>
								  </span>
								<!--</xsl:if>-->
								<span style="width:3mm;"/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CountryCd"/>
								</xsl:call-template>
							  </span>
							</td>
							<td class="styTableCell">
							  <xsl:attribute name="style">
							    <xsl:choose>
							      <xsl:when test="position()=last()">
							        width:60mm;text-align:left;font-size:7pt;border-color:black; 
							      </xsl:when>
							      <xsl:otherwise>width:60mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
							    </xsl:choose>
							  </xsl:attribute>
							  <xsl:choose>
								<xsl:when test="PersonInvolvedSSN!=''">
								  <xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="PersonInvolvedSSN"/>
								  </xsl:call-template>
								</xsl:when>
								<xsl:when test="PersonInvolvedEIN!=''">
								  <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="PersonInvolvedEIN"/>
								  </xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
								  </xsl:call-template>
								</xsl:otherwise>
							  </xsl:choose>
							  <xsl:if test="ForeignCorporationName!=''">
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="ForeignCorporationName/BusinessNameLine2Txt!=''">
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
								  </xsl:call-template>
								</xsl:if>
								</xsl:if>
								<br/>
								<xsl:call-template name="populateEINFieldTemplate">
								  <xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCell">
								<xsl:attribute name="style">
								  <xsl:choose>
								    <xsl:when test="position()=last()">
								      width:16.25mm;text-align:center;font-size:7pt;border-color:black; 
								    </xsl:when>
								    <xsl:otherwise>width:16.25mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
								<xsl:choose>
								  <xsl:when test="InactivePrincipalBusActyCd!=''">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="InactivePrincipalBusActyCd"/>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:when test="PrincipalBusinessActivityCd!=''">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:otherwise>
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="ForeignCorpMissingEINReasonCd"/>
									</xsl:call-template>
								  </xsl:otherwise>
								</xsl:choose>
							  </td>
							  <td class="styTableCell">
								<xsl:attribute name="style">
								  <xsl:choose>
								    <xsl:when test="position()=last()">
								      width:43.25mm;text-align:left;font-size:7pt;border-color:black; 
								    </xsl:when>
								    <xsl:otherwise>width:43.25mm;text-align:left;font-size:7pt;border-color:black</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
								</xsl:call-template>
							  </td>
							  <td class="styTableCell">
								<xsl:attribute name="style">
								  <xsl:choose>
								    <xsl:when test="position()=last()">
								      width:16.25mm;text-align:center;font-size:7pt;border-color:black; 
								    </xsl:when>
								    <xsl:otherwise>width:16.25mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
								  </xsl:choose>
								</xsl:attribute>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="PrincipalProductCodeDesc"/>
								</xsl:call-template>
							  </td>
							</tr>
						  </xsl:for-each>
						</tbody>
					  </table>
					</xsl:if>
					<!-- End Part I Line 10 separated data -->
					<!-- Additonal Data Table for separated data from Part II Line 13b???? -->
					<xsl:if test="($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16) ">
					  <span class="styRepeatingDataTitle">
						<br/>Form 5713, Part II, Line 13b - Requests and agreements:
                      </span>
					  <table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" rowspan="3" style="width:15mm;text-align:center;border-bottom:none;left-margin:3mm;">
                              Name of country
                            </th>
							<th class="styDepTblCell" scope="col" rowspan="3" style="width:50mm;text-align:center;border-bottom:none;">
                              Identifying number of person having operations
                            </th>
							<th class="styDepTblCell" scope="col" rowspan="2" colspan="2" style="width:41mm;text-align:center;border-color:black;">
                              Principal business activity
							</th>
							<th class="styDepTblCell" scope="col" rowspan="3" style="width:15mm;text-align:center;border-bottom:none;">
                              IC-DISCs only-Enter product code
                            </th>
							<th class="styDepTblCell" scope="col" colspan="4" style="width:64mm;text-align:center;border-bottom:none;">
                              Type of cooperation or participation
                            </th>
						  </tr>
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" colspan="2" style="width:32mm;text-align:center;" scope="col">Number of requests</th>
							<th class="styDepTblCell" colspan="2" style="width:32mm;text-align:center;" scope="col">Number of agreements</th>
						  </tr>
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:15mm;text-align:center;border-bottom:none;">Code</th>
							<th class="styDepTblCell" scope="col" style="width:26mm;text-align:center;border-bottom:none;">Description</th>
							<th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;border-bottom:none;">Total</th>
							<th class="styDepTblCell" scope="col" style="width:8mm;text-align:center;border-bottom:none;">Code</th>
							<th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;border-bottom:none;">Total</th>
							<th class="styDepTblCell" scope="col" style="width:8mm;text-align:center;border-bottom:none;">Code</th>
						  </tr>
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:15mm;text-align:center;border-top:none">(1)</th>
							<th class="styDepTblCell" scope="col" style="width:50mm;text-align:center;border-top:none">(2)</th>
							<th class="styDepTblCell" scope="col" style="width:15mm;text-align:center;border-top:none">(3)</th>
							<th class="styDepTblCell" scope="col" style="width:26mm;text-align:center;border-top:none">(4)</th>
							<th class="styDepTblCell" scope="col" style="width:15mm;text-align:center;border-top:none;">(5)</th>
							<th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;border-top:none">(6)</th>
							<th class="styDepTblCell" scope="col" style="width:8mm;text-align:center;border-top:none">(7)</th>
							<th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;border-top:none;">(8)</th>
							<th class="styDepTblCell" scope="col" style="width:8mm;text-align:center;border-top:none;">(9)</th>
						  </tr>
						</thead>
						<tbody>
						  <xsl:for-each select="$Form5713Data/BoycottRequestsAndAgreements">
							<tr>
							  <xsl:call-template name="BoycottDetailsTypeDepTblRow"/>
							  <td class="styDepTblCell" style="text-align:right" nowrap="nowrap">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="MaxSize" select="12"/>
								  <xsl:with-param name="TargetNode" select="BoycottRequestCnt"/>
								</xsl:call-template>
							  </td>
							  <td class="styDepTblCell" style="text-align:center;" nowrap="nowrap">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="NumberBoycottRequestCd"/>
								</xsl:call-template>
							  </td>
							  <td class="styDepTblCell" style="text-align:center," nowrap="nowrap">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="MaxSize" select="12"/>
								  <xsl:with-param name="TargetNode" select="BoycottAgrmtCnt"/>
								</xsl:call-template>
							  </td>
							  <td class="styDepTblCell" style="text-align:center;" nowrap="nowrap">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="NumberBoycottAgrmtCd"/>
								</xsl:call-template>
							  </td>
							</tr>
						  </xsl:for-each>
						</tbody>
					  </table>
					</xsl:if>
					<!-- End Part II Line 13b separated data -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>