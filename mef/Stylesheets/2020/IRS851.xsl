<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS851Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form851Data" select="$RtnDoc/IRS851"/>
	<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
	<html lang="EN-US">
	  <head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<title>
		  <xsl:call-template name="FormTitle">
			<xsl:with-param name="RootElement" select="local-name($Form851Data)"/>
		  </xsl:call-template>
		</title>
		<meta http-equiv="Pragma" content="no-cache"/>
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<meta http-equiv="Expires" content="0"/>
		<meta http-equiv="Cache-Control" content="private"/>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta name="Description" content="IRS Form 851"/>
		<META name="GENERATOR" content="IBM WebSphere Studio"/>
		<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
		<xsl:call-template name="InitJS"/>
		<style type="text/css">
		   <!-- Part I, 5 columns.  Row 1 is designated for Parent corp and Row 2-10 is repeated subsidiary corp, scroll bar and button present-->
		  <!-- Part II, 9 columns.  Row 1 is designated for Parent corp and Row 2-10 is repeated subsidiary corp, column 6-9 repeated within rows, and no scroll bar and button present -->
		  <!-- Part III, 8 columns.  Row 1 is designated for Parent corp and Row 2-10 is repeated subsidiary corp, column 3-9 repeated within rows, and no scroll bar and button present -->
		  <!-- Part IV, line 1 check box, row 1 is designated for Parent corp and subsequent row is repeated subsidiary corp.
	            Table, 3 columns, row 1 is designated for Parent corp and Row 2-10 is repeated subsidiary corp -->
		  <!-- Part IV, line 2 check box, row 1 is designated for Parent corp and subsequent row is repeated subsidiary corp.
			    Table, 3 columns, row 1 is designated for Parent corp and Row 2-10 is repeated subsidiary corp -->
		  <!-- Part IV, line 3 check box, row 1 is designated for Parent corp and subsequent row is repeated subsidiary corp.
			    Table, 5 columns, row 1 is designated for Parent corp and Row 2-10 is repeated subsidiary corp -->
		  <!-- Part IV, line 3d check box, row 1 is designated for Parent corp and subsequent row is repeated subsidiary corp.
			   Table, 2 columns, row 1 is designated for Parent corp and Row 2-10 is repeated subsidiary corp -->
		  <!--HINTS: separated print would not display if test data is less than 9 for Part I, II, and III.                          
			              Each Part Table there is a format where row 1 (parent corp) and row 2 and > (subsidary corp) repeaing rows.
                          Part IV line 3 and continuation part 3 (d)...should not be displayed per Style Sheet Guide line document.
		    -->
		  <!--EXCEPTION: No Scroll bar for Part II and III due to repeat row within row. 					 
			                       Part II, column 6 to 9 repeat and Part III, column 4 to 8 repeat within a row.
			-->
		  <!--HINTS: Tester claim data in all tables is double line spacing, reject the claim is invalid.  
			              Appear double spacing but when max characters are added the line is single spacing 
			-->
		  <!--EXCEPTION:  All tables should be top align for inline and separated  -->
		 <xsl:if test="not($Print) or $Print=''">
			<xsl:call-template name="IRS851Style"/>
			<xsl:call-template name="AddOnStyle"/>
		 </xsl:if>
		</style>
		<xsl:call-template name="GlobalStylesForm"/>
	  </head>
	  <body class="styBodyClass" style="width:187mm;">
		<form name="Form851">
		  <xsl:call-template name="DocumentHeader"/>
		  <!--Form 851 Title -->
		  <div class="styBB" style="width:187mm;border-bottom-width:2px;">
			<div class="styFNBox" style="width:30mm;height:21mm;border-right-width:2px;">
			  <div>
			    <span style="padding-top:1mm;">Form<span style="width:6px;"/></span>
			    <span class="styFormNumber">851</span>
			  </div>
			  <div class="styAgency" style="width:22mm;height:6mm;">(Rev. October 2016)
			    <!--General Dependency Push Pin -->
			    <xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form851Data"/>
			    </xsl:call-template>
			  </div>
			  <div>
			    <span class="styAgency">Department of the Treasury </span>
			    <span class="styAgency">Internal Revenue Service</span>
			  </div>
		    </div>
		    <div class="styFTBox" style="width:127mm;height:21mm;">
			  <div class="styMainTitle">Affiliations Schedule</div>
			  <br/>
			  <div style="font-size:7pt;font-weight:normal;padding-top:2.5mm;">
			    <span style="width:30mm;text-align:left; ">For tax year ending </span>
			    <span style="width:20mm;text-align:left;">
			      <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
			    </span>
			  </div>
			  <br/>
			  <div class="styFBT" style="font-size:7pt;">
			    <img src="{$ImagePath}/851_Bullet_Sm.gif" alt="Right pointing arrow large image"/>
			    <span style="width:1mm;"/>File with each consolidated income tax return.
			  </div>
			  <br/>
			  <img src="{$ImagePath}/851_Bullet_Sm.gif" alt="Right pointing arrow large image"/>
			  <span style="padding-top:2mm;padding-left:1mm;font-weight:bold;">
			    Information about Form 851 and its instructions is at 
			    <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form851" title="Link to IRS.gov">
				  <i>www.irs.gov/form851</i>
			    </a>.
			  </span>
		    </div>
		    <div class="styTYBox" style="width:30mm;height:21mm;border-left-width:2px;">
		      <span style="width:110px;font-size:7pt;padding-top:9mm">OMB No. 1545-0123</span>
		    </div>
		  </div>
		  <!-- Name and EIN -->
		  <div class="styBB" style="width:187mm;">
		    <div class="styNameBox" style="font-family:verdana;font-size:7pt;width:133mm;height:9mm;">Name of common parent corporation
			  <br/>
			  <xsl:call-template name="PopulateReturnHeaderFiler">
				<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
			  </xsl:call-template>
			  <br/>
			  <xsl:call-template name="PopulateReturnHeaderFiler">
			    <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
			  </xsl:call-template>
			</div>
			<div class="styEINBox" style="font-size:7pt;font-weight:bold;width:50mm;padding-left:2mm;">
			  Employer identification number
			  <br/>
			  <span style="width:50mm;text-align:left;font-weight:normal;padding-top: 3mm">
				<xsl:call-template name="PopulateReturnHeaderFiler">
				  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
				</xsl:call-template>
			  </span>
			</div>
		  </div>
		  <!-- Number street and room ... -->
		  <div class="styBB" style="width:187mm;">
		    <div style="width:140mm;height:9mm;">Number, street, and room or suite no. If a P.O. box, see instructions.
			  <br/>
			  <xsl:choose>
			    <xsl:when test="$RtnHdrData/Filer/USAddress">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<xsl:otherwise>								
				</xsl:otherwise>
			  </xsl:choose>
			</div>
		  </div>
		  <!-- City, Town, State and Zip Code -->
		  <div class="styBB" style="width:187mm;height:9mm;">
		    <div style="font-size:7pt;width:140mm;">City or town, state, and ZIP code
		      <br/>
			  <xsl:choose>
			    <!-- US Address -->
				<xsl:when test="$RtnHdrData/Filer/USAddress">
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
				  </xsl:call-template>,
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd"/>
				  </xsl:call-template>
				  <span style="width:1mm;"/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
				  </xsl:call-template>
				</xsl:when>
				<!-- FOREIGN Address -->
				<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
				  </xsl:call-template>,
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm"/>
				  </xsl:call-template>
				  <span style="width:1mm;"/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CountryCd"/>
				  </xsl:call-template>
				</xsl:when>
				<xsl:otherwise>								
				</xsl:otherwise>
			  </xsl:choose>
			</div>
		  </div>
		  <!-- @@@PART I TABLE@@@ -->
		  <div class="styGenericDiv">						
			<div class="styBB" style="width:187mm;border-top-width:1px">
			  <span class="styPartName" style="width:16mm;">Part I</span>
			  <span style="width:150mm;" class="styPartDesc">Overpayment Credits, Estimated Tax Payments, and Tax Deposits 
				<span class="styNormalText"> (see instructions)</span>
			  </span>
			  <!-- Table expand/collapse toggle button-->
			  <xsl:if test="($Print != $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">
				<span class="styGenericDiv" style="float:right;height:4mm;clear:none;width:7mm;text-align:right;">
				  <xsl:call-template name="SetDynamicTableToggleButton">
					<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
					<xsl:with-param name="containerHeight" select="9"/>
					<xsl:with-param name="headerHeight" select="2"/>
					<xsl:with-param name="containerID" select=" 'TPctn' "/>
				  </xsl:call-template>
				</span>
			  </xsl:if>
			  <!--Table expand/collapse toggle button end-->
			</div>
			<div class="styTableContainer" id="TPctn" style="width:187mm;">
			  <xsl:call-template name="SetInitialState"/>
			  <table cellspacing="0" style="font-size:7pt;">
				<thead class="styTableThead">
				  <tr>
					<th class="styTableCell" scope="col" style="width:10mm;text-align:center;font-weight:normal;">Corp. No. </th>
					<th class="styTableCell" scope="col" style="width:81mm;text-align:center;font-weight:normal;">Name and address of corporation </th>
					<th class="styTableCell" scope="col" style="width:32mm;text-align:center;font-weight:normal;">Employer identification number </th>
					<th class="styTableCell" scope="col" style="width:32mm;text-align:center;font-weight:normal;">Portion of overpayment credits and estimated tax payments </th>
					<th class="styTableCell" scope="col" style="width:32mm;text-align:center;font-weight:normal;border-right:none;">Portion of tax deposited with Form 7004 </th>
				  </tr>
				</thead>
				<tfoot/>
				<tbody>
				  <!-- Row 1***Parent Corp *** for ***inline and/or empty format***-->
				  <tr>
					<td valign="bottom" class="styTableCell" style="width:10mm;font-weight:bold;text-align:center;">
					  <!-- Choice option of input Corporation Number is blank or separated format is selected then the default number 1 would display -->
					  <xsl:choose>
						<!-- When there is no data or the separated data tag is switched, fill the box with just a 1 -->
						<xsl:when test="(not($Form851Data/CommonParentCorporationInfo)) or ($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">1 </xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<td valign="top" class="styTableCell" style="width:81mm;text-align:left;">Common parent corporation </td>
					<td class="styTableCell" style="width:32mm;background-color:lightgrey;"/>
					<td valign="top" class="styTableCell" style="width:32mm;text-align:right;">
					  <!-- If the separated data tag is not switched, populate with data -->
					  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
					    <xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PrtnOvpmtCrAndEstTxPaymentsAmt"/>
					    </xsl:call-template>
					  </xsl:if>
					  <span style="width:1px;"/>
					</td>
					<td valign="top" class="styTableCell" style="width:32mm;text-align:right;border-right:none;">
					  <!-- If the separated data tag is not switched, populate with data -->
					  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PrtnTaxDepositedWith7004Amt"/>
						</xsl:call-template>
					  </xsl:if>
					  <span style="width:1px;"/>
					</td>
				  </tr>
			      <!-- Row 2 and >*** Subsidiary Corp *** for *** inline format ***-->
				  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
					<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
					  <tr>
						<!--Column 1 -->
						<td valign="bottom" class="styTableCell" style="width:10mm;font-weight:bold;text-align:center;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CorporationNum"/>
						  </xsl:call-template>
						</td>
						<!--Column 2 -->
						<td valign="top" class="styTableCell" style="width:81mm;text-align:left;">
						  <xsl:if test="position()=1">
							Subsidiary corporations:<br/>
						  </xsl:if>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
						  </xsl:call-template>
						  <span class="styTableCellPad"/>
						  <xsl:if test="CorporationName/BusinessNameLine2Txt!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						  </xsl:if>
						  <!-- Subsidiary Corporation Address -->
						  <xsl:choose>
						    <!-- US Address -->
							<xsl:when test="CorporationUSAddress">
							  <xsl:if test="CorporationUSAddress/AddressLine1Txt!=''">
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CorporationUSAddress/AddressLine1Txt"/>
								</xsl:call-template>
							  </xsl:if>
							  <xsl:if test="CorporationUSAddress/AddressLine2Txt!=''">
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CorporationUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
							  </xsl:if>
							  <xsl:if test="CorporationUSAddress/CityNm!=''">
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CorporationUSAddress/CityNm"/>
								</xsl:call-template>
							  </xsl:if>
							  <xsl:if test="CorporationUSAddress/StateAbbreviationCd!=''">
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CorporationUSAddress/StateAbbreviationCd"/>
								</xsl:call-template>
							  </xsl:if>
							  <xsl:if test="CorporationUSAddress/ZIPCd!=''">
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CorporationUSAddress/ZIPCd"/>
								</xsl:call-template>
							  </xsl:if>
							</xsl:when>
							<!-- FOREIGN Address -->
							<xsl:otherwise>								
							  <xsl:if test="CorporationForeignAddress/AddressLine1Txt!=''">
							    <br/>
							    <xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/AddressLine1Txt"/>
							    </xsl:call-template>
							  </xsl:if>
							  <xsl:if test="CorporationForeignAddress/AddressLine2Txt!=''">
							    <br/>
							    <xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/AddressLine2Txt"/>
							    </xsl:call-template>
							  </xsl:if>
							  <xsl:if test="CorporationForeignAddress/CityNm!=''">
							    <br/>
							    <xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/CityNm"/>
							    </xsl:call-template>
							  </xsl:if>
							  <xsl:if test="CorporationForeignAddress/ProvinceOrStateNm!=''">
							    <br/>
							    <xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/ProvinceOrStateNm"/>
							    </xsl:call-template>
							  </xsl:if>
							  <xsl:if test="CorporationForeignAddress/ForeignPostalCd!=''">
							    <br/>
							    <xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/ForeignPostalCd"/>
							    </xsl:call-template>
							  </xsl:if>
							  <xsl:if test="CorporationForeignAddress/CountryCd!=''">
							    <br/>
							    <xsl:call-template name="PopulateText">
							      <xsl:with-param name="TargetNode" select="CorporationForeignAddress/CountryCd"/>
							    </xsl:call-template>
							  </xsl:if>
						    </xsl:otherwise>
						  </xsl:choose>
						  <xsl:if test="CorporationNameControlTxt!=''">
						    <br/>
						    Corporation Name Control: 
						    <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationNameControlTxt"/>
						    </xsl:call-template>
						  </xsl:if>
					    </td>
						<!--Column 3 -->
						<td valign="top" class="styTableCell" style="width:32mm;border-style:solid;text-align:center;">
						  <xsl:choose>
							<xsl:when test="CorporationEIN">
							  <xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="CorporationEIN"/>
							  </xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
							  </xsl:call-template>
							</xsl:otherwise>
						  </xsl:choose>
						</td>
						<!--Column 4 -->
						<td valign="top" class="styTableCell" style="width:32mm;text-align:right;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="PrtnOvpmtCrAndEstTxPaymentsAmt"/>
						  </xsl:call-template>
						  <span style="width:1px;"/>
						</td>
						<!--Column 5 -->
						<td valign="top" class="styTableCell" style="width:32mm;text-align:right;border-right:none;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="PrtnTaxDepositedWith7004Amt"/>
						  </xsl:call-template>
						  <span style="width:1px;"/>
						</td>
					  </tr>
					</xsl:for-each>
				  </xsl:if>
				  <!-- Row 2 and >*** Subsidiary Corp *** for *** Empty row forma t***-->
				  <!-- Filler rows which are used when there is not enough data to match the PDF or when the separated data parameter is set for row 2-->
				  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;1) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
					<tr>
					  <!--Column 1 -->
					  <td valign="top" class="styTableCell" style="width:10mm;height:10mm;font-weight:bold;">
						<span style="padding-top:6mm;padding-right:4mm;">2</span>
					  </td>
					  <!--Column 2 -->
					  <td class="styTableCell" style="width:81mm;height:10mm;text-align:left;vertical-align:top;">Subsidiary corporations:<br/>
						<!-- Part I row 2 repeat data for empty table with the See additional Data Message -->
						<xsl:if test="($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">
						  <br/>
						  <xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
						  </xsl:call-template>
						</xsl:if>
					  </td>
					  <!--Column 3 -->
					  <td class="styTableCell" style="width:32mm;height:10mm;"/>
					  <!--Column 4 -->
					  <td class="styTableCell" style="width:32mm;height:10mm;"/>
					  <!--Column 5 -->
					  <td class="styTableCell" style="width:32mm;height:10mm;border-right:none;"/>
					</tr>
				  </xsl:if>
				  <!-- IF ((PRINT = SEPARATED) & (DATA COUNT > 9) ) THEN PRINT 8 EMPTY ROWS -->
				  <xsl:if test="((count($Form851Data/SubsidiaryCorporationInfo) &gt; 9) and ($Print = $Separated)) or (count($Form851Data/SubsidiaryCorporationInfo) = 0)">
			        <xsl:call-template name="PartIEmptyRows">
					  <xsl:with-param name="numRows" select="8"/>
					</xsl:call-template>
				  </xsl:if>
				  <!-- IF (DATA COUNT < 9)  THEN PRINT (8 - DATA COUNT) EMPTY ROWS -->
				  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &gt; 0) and (count($Form851Data/SubsidiaryCorporationInfo) &lt; 9)">
					<xsl:call-template name="PartIEmptyRows">
					  <xsl:with-param name="numRows" select="9 - count($Form851Data/SubsidiaryCorporationInfo)"/>
					</xsl:call-template>
				  </xsl:if>
				  <!-- TOTAL LINE*** Subsidiary Corp *** for *** inline format ***-->
				  <tr>
				    <td class="styTableCell" style="width:10mm;height:10mm;border:none;"/>
					<td colspan="2" class="styTableCell" style="vertical-align:bottom;width:113mm;height:10mm;border-bottom:none;">
					  <span style="float:left;font-size:7pt;">
						<b>Totals </b> (Must equal amounts shown on the consolidated tax return.)
					  </span>
					  <span class="styDotLn" style="float-right;padding-left:4mm;">...<img src="{$ImagePath}/851_Bullet_Sm.gif" alt="Right pointing arrow large image"/></span>
					</td>
					<td class="styTableCell" style="vertical-align:bottom;width:32mm;height:10mm;text-align:right; border-bottom-width: 0px">
					  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form851Data/TotOvpmtCrAndEstTxPaymentsAmt"/>
						</xsl:call-template>
					  </xsl:if>
					  <span style="width:1px;"/>
					</td>
					<td class="styTableCell" style="vertical-align:bottom;width:32mm;height:10mm;border-right:none;text-align:right; border-bottom-width: 0px">
					  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form851Data/TaxPaidForm7004Amt"/>
						</xsl:call-template>
					  </xsl:if>
					  <span style="width:1px;"/>
					</td>
				  </tr>
				</tbody>
			  </table>
			</div>
			<xsl:if test="($Print != $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">
			  <!--Part I toggle button at the end of the table -->
			  <xsl:call-template name="SetInitialDynamicTableHeight">
				<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
				<xsl:with-param name="containerHeight" select="9"/>
				<xsl:with-param name="headerHeight" select="2"/>
				<xsl:with-param name="containerID" select=" 'TPctn' "/>
			  </xsl:call-template>
			</xsl:if>
		  </div>
		  <!-- <xsl:variable name="PartIIcontainerHeight" select="1 + count($Form851Data/SubsidiaryCorporationInfo[0]/StockHoldingInfo)
			 	    + count($Form851Data/SubsidiaryCorporationInfo[1]/StockHoldingInfo)
					+ count($Form851Data/SubsidiaryCorporationInfo[2]/StockHoldingInfo)
					+ count($Form851Data/SubsidiaryCorporationInfo[3]/StockHoldingInfo)
					+ count($Form851Data/SubsidiaryCorporationInfo[4]/StockHoldingInfo)
					+ count($Form851Data/SubsidiaryCorporationInfo[5]/StockHoldingInfo)
					+ count($Form851Data/SubsidiaryCorporationInfo[6]/StockHoldingInfo)
					+ count($Form851Data/SubsidiaryCorporationInfo[7]/StockHoldingInfo)
					+ count($Form851Data/SubsidiaryCorporationInfo[8]/StockHoldingInfo)"/>																			
					<div class="styGenericDiv" style="width:187mm;height:10mm;border-top:2 px solid black;border-bottom:2px solid black;background-color:pink;font-size:12pt;">
					  <xsl:value-of select="$PartIIcontainerHeight"/>
					</div>   
			-->
		  <!--@@@PART II TABLE@@@-->
		  <div style="width:187mm;clear:both;float:none;">
			<div class="styTableContainer" style="width:187mm;border-bottom-width:0px;" id="PartIITable">
			  <div class="styNBB" style="width:187mm;border-top-width:1px;">
				<span class="styPartName" style="width:16mm;">Part II</span>
				<span style="width:171mm;background-color:white;" class="styPartDesc">Principal Business Activity, Voting  Stock Information, Etc. <span style="width:1px;"/>
				  <span class="styNormalText">  (see instructions)</span>
				</span>
				<!-- <span class="styGenericDiv" style="float:right;height:4mm;clear:none;width:7mm;text-align:right;">
				  		<xsl:call-template name="SetDynamicTableToggleButton">
						  <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
						  <xsl:with-param name="containerHeight" select="14"/>
						  <xsl:with-param name="headerHeight" select="3"/>
						  <xsl:with-param name="containerID" select=" 'PartIITable' "/>
						</xsl:call-template>
					  </span>-->
			  </div>
			  <table cellspacing="0" style="font-size:7pt;border-top:1px solid black;">
				<thead class="styTableThead">
				  <tr>
					<th class="styTableCell" rowspan="2" scope="col" style="width:10mm;text-align:center;font-weight:normal;">Corp. No.</th>
					<th class="styTableCell" rowspan="2" scope="col" style="width:46mm;text-align:center;font-weight:normal;">Principal business activity (PBA)</th>
					<th class="styTableCell" rowspan="2" scope="col" style="width:12mm;text-align:center;font-weight:normal;">PBA Code No.</th>
					<th class="styTableCell" colspan="2" scope="col" style="width:24mm;text-align:center;font-weight:normal;border-style:solid;border-top:none;border-left:none;border-width:1px;;">
					  Did the subsidiary make any nondividend distributions?
					</th>
					<th class="styTableCell" scope="col" colspan="4" style="width:95mm;text-align:center;font-weight:normal;border-right:none;">
					  Stock holdings at beginning of year
					</th>
				  </tr>
				  <tr>
					<th class="styTableCell" scope="col" style="width:12mm;text-align:center;font-weight:normal;">Yes</th>
					<th class="styTableCell" scope="col" style="width:12mm;text-align:center;font-weight:normal;">No</th>
					<th class="styTableCell" scope="col" style="width:32mm;text-align:center;font-weight:normal;">Number of shares</th>
					<th class="styTableCell" scope="col" style="width:21mm;text-align:center;font-weight:normal;">Percentage of voting power</th>
					<th class="styTableCell" scope="col" style="width:21mm;text-align:center;font-weight:normal;">Percentage of value</th>
					<th class="styTableCell" scope="col" style="width:21mm;text-align:center;font-weight:normal;border-right:none;">Owned by corporation no.</th>
				  </tr>
				</thead>
				<tfoot/>
				<tbody>
				  <!-- Row 1 *** Parent Corp *** for *** inline format ***-->
				  <tr style="height: 10mm">
					<!--Column 1  (choice of display 1 or the actual data-->
					<td valign="bottom" class="styTableCell" style="width:10mm;font-weight:bold;text-align:center;">
					  <!-- Choice option of input Corporation Number is blank or separated format is selected then the default number 1 would display -->
					  <xsl:choose>
						<!-- When there is no data or the separated data tag is switched, fill the box with just a 1 -->
						<xsl:when test="(not($Form851Data/CommonParentCorporationInfo)) or ($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">1 </xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<!-- Column 2 -->
					<td valign="top" class="styTableCell" style="width:46mm;text-align:left;">Common parent corporation
					  <br/>
					  <!-- If the separated data tag is not switched, populate with data -->
					  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PrincipalBusinessActivityDesc"/>
						</xsl:call-template>
					  </xsl:if>
					</td>
					<!--Column 3 -->
					<td valign="top" class="styTableCell" style="width:12mm;text-align:center;border-right-width:1px;border-bottom-width:1px;">
					  <!-- If the separated data tag is not switched, populate with data -->
					  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
						<xsl:choose>
						  <xsl:when test="$Form851Data/CommonParentCorporationInfo/PrincipalBusinessActivityCd">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PrincipalBusinessActivityCd"/>
							</xsl:call-template>
						  </xsl:when>
						  <xsl:otherwise>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/InactivePrincipalBusActyCd"/>
							</xsl:call-template>
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:if>
					</td>
					<!--Column 4 -->
					<td class="styTableCell" style="width:12mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:1px;"/>
					<!--Column 5 -->
					<td class="styTableCell" style="width:12mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:1px;"/>
					<!--Column 6 -->
					<td class="styTableCell" style="width:32mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:1px;"/>
					<!--Column 7 -->
					<td class="styTableCell" style="width:21mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:1px;"/>
					<!--Column 8 -->
					<td class="styTableCell" style="width:21mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:1px;"/>
					<!--Column 9 -->
					<td class="styTableCell" style="width:21mm;background-color:lightgrey;border-bottom-width:1px;border-right:none;"/>
				  </tr>
				  <!-- Row 2 and >***Subsidiary Corp *** for ***inline format***-->
				  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
					<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
					  <tr>
						<!--Column 1 -->
						<td valign="bottom" class="styTableCell" style="width:10mm;font-weight:bold;text-align:center;">
						  <!--Row will span for column 1 Part II -->
						  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CorporationNum"/>
						  </xsl:call-template>
						</td>
						<!--Column 2 -->
						<td valign="top" class="styTableCell" style="width:46mm;text-align:left;">
						  <!--Row will span for column 2 Part II -->
						  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
						  <xsl:if test="position() = 1">
						    Subsidiary corporations:<br/>
						  </xsl:if>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
						  </xsl:call-template>
						</td>
						<!--Column 3 -->
						<td valign="top" class="styTableCell" style="width:12mm;text-align:center;">
						  <!--Row will span for column 3 Part II -->
						  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
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
						<!--Column 4 -->
						<td valign="top" class="styTableCell" style="width:12mm;text-align:center;">
						  <!--Row will span for column 4 Part II -->
						  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
						  <xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="NondividendDistriMadeInd"/>
						  </xsl:call-template>
						</td>
						<!--Column 5 -->
						<td valign="top" class="styTableCell" style="width:12mm;text-align:center;">
						  <!--Row will span for column 5 Part II -->
						  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
						  <xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="NondividendDistriMadeInd"/>
						  </xsl:call-template>
						</td>
						<!--Column 6 -->
						<!-- First Instance of Column 6 Through 9 Below. The remaining repeating Column 6 Through 9 will be handled by the for-each loop-->
						<td valign="top" class="styTableCell" style="width:21mm;text-align:left;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/SharesCnt"/>
						  </xsl:call-template>
						</td>
						<!--Column 7 ***inline and empty format***-->
						<td valign="top" class="styTableCell" style="width:21mm;text-align:right;">
						  <xsl:choose>
							<xsl:when test="normalize-space(StockHoldingInfo[1]/VotingPowerPct)=''">%</xsl:when>
							<xsl:otherwise>
							  <xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/VotingPowerPct"/>
							  </xsl:call-template>
							</xsl:otherwise>
						  </xsl:choose>
						</td>
						<!--Column 8 ***inline and empty format***-->
						<td valign="top" class="styTableCell" style="'width:21mm;text-align:right;">
						  <xsl:choose>
							<xsl:when test="normalize-space(StockHoldingInfo[1]/StockValuePct)=''">%</xsl:when>
							<xsl:otherwise>
							  <xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/StockValuePct"/>
							  </xsl:call-template>
							</xsl:otherwise>
						  </xsl:choose>
						</td>
						<!--Column 9 -->
						<td valign="top" class="styTableCell" style="width:21mm;text-align:left;border-right:none;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/OwnedByCorporationNum"/>
						  </xsl:call-template>
						</td>
					  </tr>
					  <!-- *** Subsidiary Corp *** Column 6 to 9 *** repeat within row *** for *** inline format ***-->
					  <xsl:for-each select="StockHoldingInfo">
						<xsl:if test="position() &gt; 1">
						  <tr>
							<!--Column 6 (repeat within row)-->
							<td valign="top" class="styTableCell" style="width:21mm;text-align:left;">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SharesCnt"/>
							  </xsl:call-template>
							</td>
							<!--Column 7 (repeat within row) -->
							<td valign="top" class="styTableCell" style="width:21mm;text-align:right;">
							  <xsl:choose>
								<xsl:when test="normalize-space(VotingPowerPct)=''">%</xsl:when>
								<xsl:otherwise>
								  <xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="VotingPowerPct"/>
								  </xsl:call-template>
								</xsl:otherwise>
							  </xsl:choose>
							</td>
							<!--Column 8 (repeat within row) -->
							<td valign="top" class="styTableCell" style="width:21mm;text-align:right;">
							  <xsl:choose>
								<xsl:when test="normalize-space(StockValuePct)=''">%</xsl:when>
								<xsl:otherwise>
								  <xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="StockValuePct"/>
								  </xsl:call-template>
								</xsl:otherwise>
							  </xsl:choose>
							</td>
							<!--Column 9 (repeat within row)-->
							<td valign="top" class="styTableCell" style="width:21mm;text-align:left;border-right:none;">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="OwnedByCorporationNum"/>
							  </xsl:call-template>
							</td>
						  </tr>
						</xsl:if>
					  </xsl:for-each>
					</xsl:for-each>
				  </xsl:if>
				  <!-- Row 2 and >***Subsidiary Corp *** for ***Empty row format***-->
				  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;1) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
					<tr style="height: 10mm;">
					  <td class="styTableCell" style="width:12mm;">
						<span style="font-weight:bold;padding-top:6mm;padding-right:5mm;">2</span>
					  </td>
					  <td class="styTableCell" style="width:46mm;vertical-align:top;text-align:left;">Subsidiary corporations:<br/>
						<br/>
						<xsl:if test="($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">
						  <xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
						  </xsl:call-template>
						</xsl:if>
					  </td>
					  <td class="styTableCell" style="width:12mm;"/>
					  <td class="styTableCell" style="width:12mm;"/>
					  <td class="styTableCell" style="width:12mm;"/>
					  <td class="styTableCell" style="width:32mm;"/>
					  <td class="styTableCell" style="width:21mm;vertical-align:bottom;">%</td>
					  <td class="styTableCell" style="width:21mm;vertical-align:bottom;">%</td>
					  <td class="styTableCell" style="width:21mm;border-right:none;"/>
					</tr>
				  </xsl:if>
				  <!-- IF ((PRINT = SEPARATED) & (DATA COUNT > 9) ) THEN PRINT 8 EMPTY ROWS -->
				  <xsl:if test="((count($Form851Data/SubsidiaryCorporationInfo) &gt; 9) and ($Print = $Separated)) or (count($Form851Data/SubsidiaryCorporationInfo) = 0)">
					<xsl:call-template name="PartIIEmptyRows">
					  <xsl:with-param name="numRows" select="8"/>
					</xsl:call-template>
				  </xsl:if>
				  <!-- IF (DATA COUNT < 9)  THEN PRINT (8 - DATA COUNT) EMPTY ROWS -->
				  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &gt; 0) and (count($Form851Data/SubsidiaryCorporationInfo) &lt; 9)">
					<xsl:call-template name="PartIIEmptyRows">
					  <xsl:with-param name="numRows" select="9 - count($Form851Data/SubsidiaryCorporationInfo)"/>
					</xsl:call-template>
				  </xsl:if>
				</tbody>
			  </table>
			  <!--<xsl:call-template name="SetInitialDynamicTableHeight">
					 <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
					 <xsl:with-param name="containerHeight" select="14"/>
					 <xsl:with-param name="headerHeight" select="3"/>
					 <xsl:with-param name="containerID" select=" 'PartIITable' "/>
				  </xsl:call-template>-->
			</div>
		  </div>
		  <!--Page 1 footer -->
		  <div class="styIRS851PageBreak" style="width:187mm;padding-top:0;border-top:1px solid black;">
			<div style="float:left;width:100mm;font-weight:bold;">For Paperwork Reduction Act Notice, see instructions.</div>
			<div style="width:35mm;float:left;">Cat. No. 16880G</div>
			<div style="float:right;">Form <span style="font-weight:bold;font-size:7pt;">851</span> (Rev. 10-2016)</div>
		  </div>
		  <p style="page-break-before: always"/>
		  <!--Page 2 start-->
		  <div class="styBB" style="width:187mm;padding-bottom:.5mm;border-bottom-width:2px;">
			<div style="float:left">Form 851 (Rev. 10-2016)</div>
			<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
		  </div>
		  <!--@@@PART III TABLE @@@-->
		  <div class="styGenericDiv" style="width:187mm;">
		    <div class="styBB" style="width:187mm;">
			  <span class="styPartName" style="width:16mm;">Part III</span>
		      <span style="width:158mm;" class="styPartDesc">Changes in Stock Holdings During the Tax Year<span style="width:1px;"/></span>
			</div>
			<table class="styTable" cellspacing="0" style="font-size:7pt;">
			  <thead class="styTableThead">
				<tr>
				  <th class="styTableCell" rowspan="2" scope="col" style="width:8mm;text-align:center;font-weight:normal;">Corp. No.</th>
				  <th class="styTableCell" rowspan="2" scope="col" style="width:50mm;text-align:center;font-weight:normal;">Name of corporation  </th>
				  <th class="styTableCell" rowspan="2" scope="col" style="width:10mm;text-align:center;font-weight:normal;">Share-holder of Corporation No.</th>
				  <th class="styTableCell" rowspan="2" scope="col" style="width:17mm;text-align:center;font-weight:normal;">Date of transaction</th>
				  <th class="styTableCell" colspan="2" scope="col" style="text-align:center;font-weight:normal;"><b>(a)</b> Changes</th>
				  <th class="styTableCell" colspan="2" scope="col" style="text-align:center;font-weight:normal;border-right:none;">
				    <b>(b) </b> Shares held after changes described in column (a)
				  </th>
				</tr>
				<tr>
				  <th class="styTableCell" scope="col" style="width:31mm;text-align:center;font-weight:normal;">Number of shares acquired</th>
				  <th class="styTableCell" scope="col" style="width:31mm;text-align:center;font-weight:normal;">Number of shares disposed of</th>
				  <th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-weight:normal;">Percentage of voting power</th>
				  <th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-weight:normal;border-right:none;">Percentage of value</th>
				</tr>
			  </thead>
			  <tfoot/>
			  <tbody>
				<!-- Row 1 ***Parent Corp *** for ***inline and/or empty row format***-->
				<!-- EXCEPTION: Parent Corp row 1 border line is not display-->
				<tr>
				  <!--Column 1 ***inline and empty row format***-->
				  <td valign="top" class="styTableCell" style="width:8mm;text-align:left;">
					<!-- Choice option of input Corporation Number is blank or separated format is selected then the default number 1 would display -->
					<xsl:choose>
					  <!-- When there is no data or the separated data tag is switched, fill the box with just a 1 -->
					  <xsl:when test="(not($Form851Data/CommonParentCorporationInfo)) or ($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7)">
						<!-- 1-->
					  </xsl:when>
					  <xsl:otherwise>
						<xsl:attribute name="rowspan"><xsl:value-of select="count($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear)"/></xsl:attribute>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
						</xsl:call-template>
					  </xsl:otherwise>
					</xsl:choose>
					<span style="width:1px;"/>
				  </td>
				  <!--Column 2 ***inline and empty row format***-->
				  <td valign="top" class="styTableCell" style="width:50mm;text-align:left;">
				    <!-- If the separated data tag is not switched, populate with data -->
					<xsl:if test="($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7)">
					  <xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo"/>
					  </xsl:call-template>
					</xsl:if>
					<xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">
					  <!--Column 2 of Part III row 1 inline format -->
					  <xsl:attribute name="rowspan"><xsl:value-of select="count($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear)"/></xsl:attribute>
					  <xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
					  </xsl:call-template>
					  <br/>
					  <xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
					  </xsl:call-template>
					</xsl:if>
					<span style="width:0px;"/>
				  </td>
				  <!--Column 3 ***inline format***-->
				  <td valign="top" class="styTableCell" style="width:10mm;text-align:left;">
					<!-- If the separated data tag is not switched, populate with data -->
					<xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/ShareholderOfCorporationNum"/>
					  </xsl:call-template>
					</xsl:if>
					<span style="width:1px;"/>
				  </td>
				  <!--Column 4 ***inline format***-->
				  <td valign="top" class="styTableCell" style="width:17mm;text-align:center;">
					<!-- If the separated data tag is not switched, populate with data -->
					<xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">
					  <xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/TransactionDt"/>
					  </xsl:call-template>
					</xsl:if>
					<span style="width:1px;"/>
				  </td>
				  <!--Column 5 ***inline format***-->
				  <td valign="top" class="styTableCell" style="width:31mm;text-align:left;">
					<!-- If the separated data tag is not switched, populate with data -->
					<xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/SharesAcquiredCnt"/>
					  </xsl:call-template>
					</xsl:if>
					<span style="width:1px;"/>
				  </td>
				  <!--Column 6 ***inline format***-->
				  <td valign="top" class="styTableCell" style="width:31mm;text-align:left;">
					<!-- If the separated data tag is not switched, populate with data -->
					<xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/SharesDisposedCnt"/>
					  </xsl:call-template>
					</xsl:if>
					<span style="width:1px;"/>
				  </td>
				  <!--Column 7 ***inline and empty row format***-->
				  <td valign="top" class="styTableCell" style="width:20mm;text-align:right;">
					<xsl:if test="(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">%</xsl:if>
					<!-- If the separated data tag is not switched, populate with data -->
					<xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">
					  <xsl:choose>
						<xsl:when test="not($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/VotingPowerPct)">
						  <span style="padding-top:6mm;">%</span>
						</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulatePercent">
							<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/VotingPowerPct"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</xsl:if>
				  </td>
				  <!--Column 8 ***inline and empty row format***-->
				  <td valign="top" class="styTableCell" style="width:20mm;text-align:right;border-right:none;">
					<xsl:if test="(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">%</xsl:if>
					<xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">
					  <xsl:choose>
						<xsl:when test="not($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/VotingPowerPct) or $Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/StockValuePct='' ">
						  <span style="padding-top:6mm;">%</span>
						</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulatePercent">
							<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/StockValuePct"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</xsl:if>
				  </td>
				</tr>
				<!-- Row 1***Parent Corp *** Column 3 to 8 ***repeating within row*** for ***inline and/or empty row format***-->
				<xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">
				  <!--START Repeating Group For Part III, Line 2, Column 3-8-->
				  <xsl:for-each select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear">
					<xsl:if test="not(position() = 1)">
					  <tr>
						<!--Column 3 ***repeating within row*** -->
						<td valign="top" class="styTableCell" style="width:10mm;text-align:left;">
						  <!-- If the separated data tag is not switched, populate with data -->
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShareholderOfCorporationNum"/>
						  </xsl:call-template>
						  <span style="width:1px;"/>
						</td>
						<!--Column 4 ***repeating within row*** -->
						<td valign="top" class="styTableCell" style="width:17mm;text-align:center;">
						  <xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="TransactionDt"/>
						  </xsl:call-template>
						  <span style="width:1px;"/>
						</td>
						<!--Column 5 ***repeating within row*** -->
						<td valign="top" class="styTableCell" style="width:31mm;text-align:left;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SharesAcquiredCnt"/>
						  </xsl:call-template>
						  <span style="width:1px;"/>
						</td>
						<!--Column 6 ***repeating within row*** -->
						<td valign="top" class="styTableCell" style="width:31mm;text-align:left;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SharesDisposedCnt"/>
						  </xsl:call-template>
						  <span style="width:1px;"/>
						</td>
						<!--Column 7 ***repeating within row*** ***inline and/or empty row format***-->
						<td valign="top" class="styTableCell" style="width:20mm;text-align:right;">
						  <xsl:choose>
							<xsl:when test="not(VotingPowerPct) or VotingPowerPct='' ">%</xsl:when>
							<xsl:otherwise>
							  <xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="VotingPowerPct"/>
							  </xsl:call-template>
							</xsl:otherwise>
						  </xsl:choose>
						</td>
						<!--Column 8 ***repeating within row*** ***inline and/or empty row format***-->
						<td valign="top" class="styTableCell" style="width:20mm;text-align:right;border-right:none;">
						  <xsl:choose>
							<xsl:when test="not(StockValuePct) or StockValuePct='' ">%</xsl:when>
							<xsl:otherwise>
							  <xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="StockValuePct"/>
							  </xsl:call-template>
							</xsl:otherwise>
						  </xsl:choose>
						</td>
					  </tr>
					</xsl:if>
				  </xsl:for-each>
				</xsl:if>
				<!-- Row 2 and >***Subsidiary corp *** for ***inline and/or empty row format***-->
				<!-- EXCEPTION: Subsidiary Corp row 1 and 2 border line are not display-->
				<xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 6))">
				  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
					<tr>
					  <!-- Column 1 -->
					  <td valign="top" class="styTableCell" style="width:8mm;text-align:left;">
						<!-- Row to span for column 1-->
						<xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingChangesForTaxYear)"/></xsl:attribute>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="CorporationNum"/>
						</xsl:call-template>
					  </td>
					  <!-- Column 2 -->
					  <td valign="top" class="styTableCell" style="width:50mm;text-align:left;">
						<!-- Row to span for column 2-->
						<xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingChangesForTaxYear)"/></xsl:attribute>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
						<xsl:if test="CorporationName/BusinessNameLine2Txt!=''">
						  <br/>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
						  </xsl:call-template>
						  <span class="styTableCellPad"/>
						</xsl:if>
					  </td>
					  <!-- Column 3 -->
					  <td valign="top" class="styTableCell" style="width:10mm;text-align:left;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/ShareholderOfCorporationNum"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					  </td>
					  <!-- Column 4 -->
					  <td valign="top" class="styTableCell" style="width:17mm;text-align:center;">
						<xsl:call-template name="PopulateMonthDayYear">
						  <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/TransactionDt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					  </td>
					  <!-- Column 5 -->
					  <td valign="top" class="styTableCell" style="width:31mm;text-align:left;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/SharesAcquiredCnt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					  </td>
					  <!-- Column 6 -->
					  <td valign="top" class="styTableCell" style="width:31mm;text-align:left;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/SharesDisposedCnt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					  </td>
					  <!-- Column 7 ***inline and empty format***-->
					  <td valign="top" class="styTableCell" style="width:20mm;text-align:right;">
						<xsl:choose>
						  <xsl:when test="not(StockHoldingChangesForTaxYear[1]/VotingPowerPct) or StockHoldingChangesForTaxYear[1]/VotingPowerPct='' ">%</xsl:when>
						  <xsl:otherwise>
							<xsl:call-template name="PopulatePercent">
						 	  <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/VotingPowerPct"/>
							</xsl:call-template>
						  </xsl:otherwise>
						</xsl:choose>
					  </td>
					  <!-- Column 8 ***inline and empty format***-->
					  <td valign="top" class="styTableCell" style="width:20mm;text-align:right;border-right:none;">
						<xsl:choose>
						  <xsl:when test="not(StockHoldingChangesForTaxYear[1]/StockValuePct) or StockHoldingChangesForTaxYear[1]/StockValuePct='' ">%</xsl:when>
						  <xsl:otherwise>
							<xsl:call-template name="PopulatePercent">
							  <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/StockValuePct"/>
							</xsl:call-template>
						  </xsl:otherwise>
						</xsl:choose>
					  </td>
					</tr>
					<!-- Row 2 and >***Subsidiary corp *** Column 3 to 8 ***repeating within row*** for ***inline and/or empty row format***-->
					<xsl:for-each select="StockHoldingChangesForTaxYear">
					  <xsl:if test="position() &gt;1">
						<tr>
						  <!-- Column 3 -->
						  <td valign="top" class="styTableCell" style="width:10mm;text-align:left;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="ShareholderOfCorporationNum"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						  </td>
						  <!-- Column 4 -->
						  <td valign="top" class="styTableCell" style="width:17mm;text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
							  <xsl:with-param name="TargetNode" select="TransactionDt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						  </td>
						  <!-- Column 5 -->
						  <td valign="top" class="styTableCell" style="width:31mm;text-align:left;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="SharesAcquiredCnt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						  </td>
						  <!-- Column 6 -->
						  <td valign="top" class="styTableCell" style="width:31mm;text-align:left;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="SharesDisposedCnt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						  </td>
						  <!-- Column 7 ***inline and/or empty row format***-->
						  <td valign="top" class="styTableCell" style="width:20mm;text-align:right;">
							<xsl:choose>
							  <xsl:when test="not(VotingPowerPct) or VotingPowerPct='' ">%</xsl:when>
							  <xsl:otherwise>
								<xsl:call-template name="PopulatePercent">
								  <xsl:with-param name="TargetNode" select="VotingPowerPct"/>
								</xsl:call-template>
							  </xsl:otherwise>
							</xsl:choose>
						  </td>
						  <!-- Column 8 ***inline and/or empty row format***-->
						  <td valign="top" class="styTableCell" style="width:20mm;text-align:right;border-right:none;">
							<xsl:choose>
							  <xsl:when test="not(StockValuePct) or StockValuePct='' ">%</xsl:when>
							  <xsl:otherwise>
								<xsl:call-template name="PopulatePercent">
								  <xsl:with-param name="TargetNode" select="StockValuePct"/>
								</xsl:call-template>
							  </xsl:otherwise>
							</xsl:choose>
						  </td>
						</tr>
					  </xsl:if>
					</xsl:for-each>
				  </xsl:for-each>
				</xsl:if>
				<!-- Row 2 ***Subsidiary Corp *** for ***Empty row format***-->
				<xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;1) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7))">
				  <tr>
					<!-- Column 1 -->
					<td valign="top" class="styTableCell" style="width:10mm;height:10mm;text-align left;">
					  <span class="styTableCellPad"/>
					</td>
					<!-- Column 2 -->
					<td valign="top" class="styTableCell" style="width:19mm;text-align:left;">
					  <!--	<xsl:if test="($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 7)">
							  <xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
							  </xsl:call-template>
							</xsl:if>-->
					  <span class="styTableCellPad"/>
					</td>
					<!-- Column 3 -->
					<td valign="top" class="styTableCell" style="width:15mm;text-align:left;">
					  <span class="styTableCellPad"/>
					</td>
					<!-- Column 4 -->
					<td valign="top" class="styTableCell" style="width:21mm;text-align:center;">
					  <span class="styTableCellPad"/>
					</td>
					<!-- Column 5 -->
					<td valign="top" class="styTableCell" style="width:35mm;text-align:right;">
					  <span class="styTableCellPad"/>
					</td>
					<!-- Column 6 -->
					<td valign="top" class="styTableCell" style="width:35mm;text-align:right;">
					  <span class="styTableCellPad"/>
					</td>
					<!-- Column 7 -->
					<td valign="top" class="styTableCell" style="width:22mm;text-align:right;">
					  <span style="padding-top:6mm;">%</span>
					</td>
					<!-- Column 8 -->
					<td valign="top" class="styTableCell" style="width:22mm;text-align:right;border-right:none;">
					  <span style="padding-top:6mm;">%</span>
					</td>
				  </tr>
				</xsl:if>
				<!-- Row 2 ***Subsidiary Corp *** for ***Empty row format***-->
				<xsl:if test="((count($Form851Data/SubsidiaryCorporationInfo) &gt; 7) and ($Print = $Separated)) or (count($Form851Data/SubsidiaryCorporationInfo) = 0)">
				  <xsl:call-template name="PartIIIEmptyRows">
					<xsl:with-param name="numRows" select="6"/>
				  </xsl:call-template>
				</xsl:if>
				<!-- IF (DATA COUNT < 9)  THEN PRINT (8 - DATA COUNT) EMPTY ROWS -->
				<xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &gt; 0) and (count($Form851Data/SubsidiaryCorporationInfo) &lt; 7)">
				  <xsl:call-template name="PartIIIEmptyRows">
					<xsl:with-param name="numRows" select="7 - count($Form851Data/SubsidiaryCorporationInfo)"/>
				  </xsl:call-template>
				</xsl:if>
			  </tbody>
			</table>
		  </div>
		  <!-- Part III Line (c) row 1 -->
		  <div style="width:187mm;float:none;clear:both;"/>
		  <div style="width:187mm;">
			<div class="styLNLeftNumBox" style="padding-left:2mm;">(c)</div>
			<div class="styLNDesc" style="width:152mm;">
			  If any transaction listed above caused a transfer of a share of subsidiary stock (defined to include dispositions and
			</div>
		  </div>
		  <!-- End of Part III line (c) row 1-->
		  <!-- Part III Line (c) row 2 -->
		  <div style="width:187mm;">
			<div class="styLNLeftNumBox"/>
			<div class="styLNDesc" style="width:152mm;">
			  <span style="float:left;"> deconsolidations), did the share's basis exceed its value at the time of the transfer? See instructions. </span>
			  <span class="styDotLn" style="float:right;">......</span>
			</div>
			<div class="styLNDesc" style="float:right;width:27mm;padding-top:0;">
			  <span>
				<xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="$Form851Data/ShareExceedVlAtTrnsfrTimeInd"/>
				</xsl:call-template>
				<input class="styCkBox" alt="IRS851RetainedShrExceedValAtTsfrTime" type="checkbox" TabIndex="-1" name="Checkbox">
				  <xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="$Form851Data/ShareExceedVlAtTrnsfrTimeInd"/>
					<xsl:with-param name="BackupName">IRS851RetainedShrExceedValAtTsfrTime</xsl:with-param>
				  </xsl:call-template>
				</input>
			  </span>
			  <label>
				<xsl:call-template name="PopulateLabelYes">
				  <xsl:with-param name="TargetNode" select="$Form851Data/ShareExceedVlAtTrnsfrTimeInd"/>
				  <xsl:with-param name="BackupName">IRS851RetainedShrExceedValAtTsfrTime</xsl:with-param>
				</xsl:call-template>
				<span style="width:2px;"/>
				<b>Yes</b>
			  </label>
			  <span class="styBoldText" style="width:4mm;"/>
			  <span>
				<xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="$Form851Data/ShareExceedVlAtTrnsfrTimeInd"/>
				</xsl:call-template>
				<input class="styCkBox" alt="IRS851RetainedShrExceedValAtTsfrTime" type="checkbox" TabIndex="-1" name="Checkbox">
				  <xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="$Form851Data/ShareExceedVlAtTrnsfrTimeInd"/>
					<xsl:with-param name="BackupName">IRS851RetainedShrExceedValAtTsfrTime</xsl:with-param>
				  </xsl:call-template>
				</input>
			  </span>
			  <label>
				<xsl:call-template name="PopulateLabelNo">
				  <xsl:with-param name="TargetNode" select="$Form851Data/ShareExceedVlAtTrnsfrTimeInd"/>
				  <xsl:with-param name="BackupName">IRS851RetainedShrExceedValAtTsfrTime</xsl:with-param>
				</xsl:call-template>
				<span style="width:2px;"/>
				<b>No</b>
			  </label>
			</div>
		  </div>
		  <!-- End of Part III line (c) row 2-->
		  <!-- Part III Line (d) row 1 -->
		  <div style="width:187mm;padding-top:3mm;">
			<div class="styLNLeftNumBox" style="padding-left:2mm;">(d)</div>
			<div class="styLNDesc" style="width:152mm;">
			  Did any share of subsidiary stock become worthless within the meaning of section 165 (taking into account the provisions
			</div>
		  </div>
		  <!-- End of Part III line (d) row 1-->
		  <!-- Part III Line (d) row 2 -->
		  <div style="width:187mm;">
			<div class="styLNLeftNumBox"/>
			<div class="styLNDesc" style="width:152mm;">
			  <span style="float:left;">of Regulations section 1.1502-80(c)) during the taxable year? See instructions. </span>
			  <span class="styDotLn" style="float:right;">.............</span>
			</div>
			<div class="styLNDesc" style="float:right;width:27mm;padding-top:0;">
			  <span>
				<xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="$Form851Data/ShrVlWorthlessUnderSect165Ind"/>
				</xsl:call-template>
				<input class="styCkBox" alt="IRS851ShareValueWorthlessUnderSec165" type="checkbox" TabIndex="-1" name="Checkbox">
				  <xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="$Form851Data/ShrVlWorthlessUnderSect165Ind"/>
					<xsl:with-param name="BackupName">IRS851ShareValueWorthlessUnderSec165</xsl:with-param>
				  </xsl:call-template>
				</input>
			  </span>
			  <label>
				<xsl:call-template name="PopulateLabelYes">
				  <xsl:with-param name="TargetNode" select="$Form851Data/ShrVlWorthlessUnderSect165Ind"/>
				  <xsl:with-param name="BackupName">IRS851ShareValueWorthlessUnderSec165</xsl:with-param>
				</xsl:call-template>
				<span style="width:2px;"/>
				<b>Yes</b>
			  </label>
			  <span class="styBoldText" style="width:4mm;"/>
			  <span>
				<xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="$Form851Data/ShrVlWorthlessUnderSect165Ind"/>
				</xsl:call-template>
				<input class="styCkBox" alt="IRS851ShareValueWorthlessUnderSec165" type="checkbox" TabIndex="-1" name="Checkbox">
				  <xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="$Form851Data/ShrVlWorthlessUnderSect165Ind"/>
					<xsl:with-param name="BackupName">IRS851ShareValueWorthlessUnderSec165</xsl:with-param>
				  </xsl:call-template>
				</input>
			  </span>
			  <label>
				<xsl:call-template name="PopulateLabelNo">
				  <xsl:with-param name="TargetNode" select="$Form851Data/ShrVlWorthlessUnderSect165Ind"/>
				  <xsl:with-param name="BackupName">IRS851ShareValueWorthlessUnderSec165</xsl:with-param>
				</xsl:call-template>
				<span style="width:2px;"/>
				<b>No</b>
			  </label>
			</div>
		  </div>
		  <!-- Part III Line (e) -->
		  <div style="width:187mm;">
			<div class="styLNLeftNumBox" style="padding-left:2mm;">(e)</div>
			<div class="styLNDesc" style="width:168mm;height:4mm;">
			  If the equitable owners of any capital stock shown above were other than the holders of record, provide details of the changes.
			</div>
			<div style="width:187mm;"/>
			<div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
			  <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form851Data/OwnersNotRecHoldersDetailsTxt"/>
			  </xsl:call-template>
			</div>
		  </div>
		  <!--Part III Line (f) -->
		  <div style="width:187mm;"/>
		  <!-- Align data all the way to the left -->
		  <div style="width:187mm;">
			<div class="styLNLeftNumBox" style="padding-left:2mm;">(f)</div>
			<div class="styLNDesc" style="width:168mm;height:4mm;">
			  If additional stock was issued, or if any stock was retired during the year, list the dates and amounts of these transactions.
			</div>
			<div style="width:187mm;"/>
			<div class="styBB" style="width:187mm;text-align:justify;margin-left:0.75mm;">
			  <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form851Data/StockPurchasedOrRtdDetailsTxt"/>
			  </xsl:call-template>
			</div>
		  </div>
		  <!--Page Footer -->
		  <div class="styIRS851PageBreak" style="width:187mm;padding-top:1mm;border-top:1px solid black;">
			<div style="float:right;">Form <span style="font-weight:bold;font-size:7pt;">851</span> (Rev. 10-2016)</div>
		  </div>
		  <p style="page-break-before: always"/>
		  <!--Page 3 start-->
		  <div class="styBB" style="width:187mm;padding-bottom:.5mm;border-bottom-width:2px;">
			<div style="float:left">Form 851 (Rev. 10-2016)</div>
			<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></div>
		  </div>
		  <!--@@@PART IV TABLE @@@-->
		  <!-- 9/8/2016 Customer Approved 
			    EXCEPTION:  Part IV, Line 1 design is associated with schema and will not match PDF.
			    	                 Part IV, Line 1 repeating subsidiary will not be display in the Additional Data section.  
			-->
		  <!--Line 1 of Part IV***Parent Corp*** check box-->
		  <div class="styBB" style="width:187mm;border-top-width:0px">
			<span class="styPartName" style="width:16mm;">Part IV</span>
			<span style="width:151mm;" class="styPartDesc"> Additional Stock Information <span style="font-weight:normal;"> (see instructions)</span></span>
		  </div>
		  <!--Line 1 of Part IV****Subsidiary Corp*** repeated checkboxes-->
		  <div class="styNBB" style="width:187mm;">
			<div class="styLNLeftNumBox">1</div>
			<div class="styLNDesc" style="width:152mm;">
			  <span style="float:left;">During the tax year, did the corporation have more than one class of stock outstanding? </span>
			  <span class="styDotLn" style="float:right;">..........</span>
			</div>
			<div class="styLNDesc" style="float:right;width:27mm;padding-top:0;">
			  <span>
				<xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstdInd"/>
				</xsl:call-template>
				<input class="styCkBox" alt="IRS851MoreThanOneClassStkOutstd" type="checkbox" TabIndex="-1" name="Checkbox">
				  <xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstdInd"/>
					<xsl:with-param name="BackupName">IRS851MoreThanOneClassStkOutstd</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabelYes">
					<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstdInd"/>
					<xsl:with-param name="BackupName">IRS851MoreThanOneClassStkOutstd</xsl:with-param>
				  </xsl:call-template>
				  <span style="width:2px;"/>
				  <b>Yes</b>
				</label>
			  </span>
			  <span class="styBoldText" style="width:4mm;"/>
			  <span>
				<xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstdInd"/>
				</xsl:call-template>
				<input class="styCkBox" alt="IRS851MoreThanOneClassStkOutstd" type="checkbox" TabIndex="-1" name="Checkbox">
				  <xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstdInd"/>
					<xsl:with-param name="BackupName">IRS851MoreThanOneClassStkOutstd</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabelNo">
					<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstdInd"/>
					<xsl:with-param name="BackupName">IRS851MoreThanOneClassStkOutstd</xsl:with-param>
				  </xsl:call-template>
				  <span style="width:2px;"/>
				  <b>No</b>
				</label>
			  </span>
			</div>
			<div style="width:165mm;float:left">
			  <div class="styGenericDiv" style="width:150mm;padding-bottom:.5mm;padding-left:8mm;">
				If "Yes," enter the name of the corporation and list and describe each class of stock.
			  </div>
			</div>
			<!--Toggle Button-->
			<xsl:if test="count($Form851Data/SubsidiaryCorporationInfo) = 0">
			  <div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;vertical-align:bottom;padding-top:2px;">
				<xsl:call-template name="SetDynamicTableToggleButton">
				  <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
				  <xsl:with-param name="containerHeight" select="3"/>
				  <xsl:with-param name="headerHeight" select="2"/>
				  <xsl:with-param name="containerID" select=" 'TPctnA1' "/>
				  <xsl:with-param name="imageID" select=" 'TPimgA1' "/>
				  <xsl:with-param name="buttonID" select=" 'TPbtnA1' "/>
				</xsl:call-template>
			  </div>
			</xsl:if>
		  </div>
		  <!-- Line 1 of Part IV ***repeating table (3 columns)*** -->
		  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
			<div class="styNBB" style="width:187mm;">
			  <div class="styLNLeftNumBox"/>
			  <div class="styLNDesc" style="width:152mm;">
				<span style="float:left;">During the tax year, did the corporation have more than one class of stock outstanding? </span>
				<span class="styDotLn" style="float:right;">..........</span>
			  </div>
			  <div class="styLNDesc" style="float:right;width:27mm;padding-top:0;">
				<span>
				  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="./MoreThanOneClassStkOutstdInd"/>
				  </xsl:call-template>
				  <input class="styCkBox" alt="Subsidiary Corp" type="checkbox" TabIndex="-1" name="Checkbox">
					<xsl:call-template name="PopulateYesCheckbox">
					  <xsl:with-param name="TargetNode" select="./MoreThanOneClassStkOutstdInd"/>
					  <xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851MoreThanOneClassStkOutstd</xsl:with-param>
					</xsl:call-template>
				  </input>
				  <label>
					<xsl:call-template name="PopulateLabelYes">
					  <xsl:with-param name="TargetNode" select="./MoreThanOneClassStkOutstdInd"/>
					  <xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851MoreThanOneClassStkOutstd</xsl:with-param>
					</xsl:call-template>
					<span style="width:2px;"/>
					<b>Yes</b>
				  </label>
				</span>
				<span class="styBoldText" style="width:4mm;"/>
				<span>
				  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="./MoreThanOneClassStkOutstdInd"/>
				  </xsl:call-template>
				  <input class="styCkBox" alt="Subsidiary Corp" type="checkbox" TabIndex="-1" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
					  <xsl:with-param name="TargetNode" select="./MoreThanOneClassStkOutstdInd"/>
					  <xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851MoreThanOneClassStkOutstd</xsl:with-param>
					</xsl:call-template>
				  </input>
				  <label>
					<xsl:call-template name="PopulateLabelNo">
					  <xsl:with-param name="TargetNode" select="./MoreThanOneClassStkOutstdInd"/>
					  <xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851MoreThanOneClassStkOutstd</xsl:with-param>
					</xsl:call-template>
					<span style="width:2px;"/>
					<b>No</b>
				  </label>
				</span>
			  </div>
			  <div style="width:165mm;float:left">
				<div class="styGenericDiv" style="width:150mm;padding-bottom:.5mm;padding-left:8mm;">
				  If "Yes," enter the name of the corporation and list and describe each class of stock.
				</div>
			  </div>
			  <!--Toggle Button-->
			  <xsl:if test="position()=last()">
				<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;vertical-align:bottom;padding-top:2px;">
				  <xsl:call-template name="SetDynamicTableToggleButton">
					<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
					<xsl:with-param name="containerHeight" select="3"/>
					<xsl:with-param name="headerHeight" select="2"/>
					<xsl:with-param name="containerID" select=" 'TPctnA1' "/>
					<xsl:with-param name="imageID" select=" 'TPimgA1' "/>
					<xsl:with-param name="buttonID" select=" 'TPbtnA1' "/>
				  </xsl:call-template>
				</div>
			  </xsl:if>
			</div>
		  </xsl:for-each>
		  <!-- Line 1 of Part IV ***repeating table *** (3 columns) -->
		  <div class="styTableContainer" id="TPctnA1">
			<xsl:call-template name="SetInitialState"/>
			<table cellspacing="0" style="width:187mm;font-size:7pt;border-top:1px solid black;">
			  <tr>
				<th class="styTableCell" scope="col" rowspan="1" style="width:7mm;text-align:center;font-weight:normal;">Corp. No.</th>
				<th class="styTableCell" scope="col" rowspan="1" style="width:85mm;text-align:center;font-weight:normal;">Name of corporation</th>
				<th class="styTableCell" scope="col" rowspan="1" style="width:85mm;text-align:center;font-weight:normal;border-right:none;">Class of stock</th>
			  </tr>
			  <!--Row 1***Parent Corp*** for ***inline format*** -->
			  <tr>
				<!-- Column 1 -->
				<td valign="top" class="styTableCell" style="width:7mm;height:10mm;text-align:left;">
				  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
					</xsl:call-template>
				  </xsl:if>
				  <span class="styTableCellPad"/>
				</td>
				<!-- Column 2 -->
				<td valign="top" class="styTableCell" style="width:80mm;height:10mm;text-align:left;">
				  <xsl:choose>
					<xsl:when test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
					  <xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
					  </xsl:call-template>
					  <br/>
					  <xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
					  </xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
					  <xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
					  </xsl:call-template>
					</xsl:otherwise>
				  </xsl:choose>
				</td>
				<!-- Column 3 -->
				<td valign="top" class="styTableCell" style="width:80mm;height:10mm;text-align:left;border-right:none;">
				  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/StockClassDesc"/>
					</xsl:call-template>
				  </xsl:if>
				</td>
			  </tr>
			  <!--Row 2 and >***Subsidiary Corp*** repeated for ***inline format*** -->
			  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
				<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
				  <tr>
					<!-- Column 1 -->
					<td valign="top" class="styTableCell" style="width:7mm;height:10mm;text-align:left;">
					  <xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
						<xsl:attribute name="style">width:7mm;height:10mm;text-align:left;border-bottom:none;</xsl:attribute>
					  </xsl:if>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="../CorporationNum"/>
					  </xsl:call-template>
					</td>
					<!-- Column 2 -->
					<td valign="top" class="styTableCell" style="width:80mm;height:10mm;text-align:left;">
					  <xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
						<xsl:attribute name="style">width:80mm;height:10mm;text-align:left;border-bottom:none;</xsl:attribute>
					  </xsl:if>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1Txt"/>
					  </xsl:call-template>
					  <xsl:if test="../CorporationName/BusinessNameLine2Txt!=''">
						<br/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2Txt"/>
						</xsl:call-template>
					  </xsl:if>
					</td>
					<!-- Column 3 -->
					<td valign="top" class="styTableCell" style="width:80mm;height:10mm;text-align:left;border-right:none;">
					  <xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
						<xsl:attribute name="style">width:80mm;height:10mm;text-align:left;border-right:none;border-bottom:none;</xsl:attribute>
					  </xsl:if>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="StockClassDesc"/>
					  </xsl:call-template>
					</td>
				  </tr>
				</xsl:for-each>
			  </xsl:if>
			  <!--Line 1 of Part IV***Subsidiary Corp*** for ***Empty format***-->
			  <!-- Line 1 of Part IV Empty lines Check if Additional Stock Information is less than 1 and greater than 3 or Separated print format is selected then display empty lines -->
			  <xsl:if test="((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)) or (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) = 0)">
				<xsl:call-template name="PartIVEmptyRows">
				  <xsl:with-param name="numRows" select="3"/>
				</xsl:call-template>
			  </xsl:if>
			  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 0) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 3)">
			    <xsl:call-template name="PartIVEmptyRows">
				  <xsl:with-param name="numRows" select="3 - count($Form851Data/SubsidiaryCorporationInfo)"/>
				</xsl:call-template>
			  </xsl:if>
			</table>
		  </div>
		  <xsl:call-template name="SetInitialDynamicTableHeight">
			<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
			<xsl:with-param name="containerHeight" select="3"/>
			<xsl:with-param name="headerHeight" select="2"/>
			<xsl:with-param name="containerID" select=" 'TPctnA1' "/>
		  </xsl:call-template>
		  <div style="page-break-inside:avoid;width:187mm;">
			<!-- 9/8/2016 Customer Approved 
				  EXCEPTION:  Part IV, Line 2 design is associated with schema and will not match PDF.
									   Part IV, Line 2 repeating subsidiary will not be display in the Additional Data section.  
			-->
			<!--Line 2 of Part IV***Parent Corp*** check box-->
			<div class="styNBB" style="width:187mm;">
			  <div class="styLNLeftNumBox">2</div>
			  <div class="styLNDesc" style="width:152mm;">
				<span style="float:left;">During the tax year, was there any member of the consolidated group that reaffiliated within 60 months of disaffiliation?
					<span class="styDotLn" style="float:right;">..........</span>
				</span>
			  </div>
			  <div class="styLNDesc" style="float:right;width:27mm;padding-top:0;">
				<span>
				  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MemReaffiliatedWithin60MnthInd"/>
				  </xsl:call-template>
				  <input class="styCkBox" alt="IRS851MemReaffiliatedWithin60MnthInd" type="checkbox" TabIndex="-1" name="Checkbox">
					<xsl:call-template name="PopulateYesCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MemReaffiliatedWithin60MnthInd"/>
					  <xsl:with-param name="BackupName">IRS851MemReaffiliatedWithin60MnthInd</xsl:with-param>
					</xsl:call-template>
				  </input>
				  <label>
					<xsl:call-template name="PopulateLabelYes">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MemReaffiliatedWithin60MnthInd"/>
					  <xsl:with-param name="BackupName">IRS851MemReaffiliatedWithin60MnthInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:2px;"/>
					<b>Yes</b>
				  </label>
				</span>
				<span class="styBoldText" style="width:4mm;"/>
				<span>
				  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MemReaffiliatedWithin60MnthInd"/>
				  </xsl:call-template>
				  <input class="styCkBox" alt="IRS851MemReaffiliatedWithin60MnthInd" type="checkbox" TabIndex="-1" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MemReaffiliatedWithin60MnthInd"/>
					  <xsl:with-param name="BackupName">IRS851MemReaffiliatedWithin60MnthInd</xsl:with-param>
					</xsl:call-template>
				  </input>
				  <label>
					<xsl:call-template name="PopulateLabelNo">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/MemReaffiliatedWithin60MnthInd"/>
					  <xsl:with-param name="BackupName">IRS851MemReaffiliatedWithin60MnthInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:2px;"/>
					<b>No</b>
				  </label>
				</span>
			  </div>
			  <!--Part IV Line 2 (parent corp) row 2 -->
			  <div style="width:165mm;float:left">
				<div class="styGenericDiv" style="width:150mm;padding-bottom:.5mm;padding-left:8mm;">
				  If "Yes," enter the name of the corporation(s) and explain the circumstances.
				</div>
			  </div>
			  <!-- Toggle Button -->
			  <xsl:if test="count($Form851Data/SubsidiaryCorporationInfo) = 0">
				<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;vertical-align:bottom;padding-top:2px;">
				  <xsl:call-template name="SetDynamicTableToggleButton">
					<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
					<xsl:with-param name="containerHeight" select="3"/>
					<xsl:with-param name="headerHeight" select="2"/>
					<xsl:with-param name="containerID" select=" 'TPctnB1' "/>
					<xsl:with-param name="imageID" select=" 'TPimgB1' "/>
					<xsl:with-param name="buttonID" select=" 'TPbtnB1' "/>
				  </xsl:call-template>
				</div>
			  </xsl:if>
			</div>
			<!--Line 2 of Part IV****Subsidiary Corp*** repeated checkboxes-->
			<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
			  <div class="styNBB" style="width:187mm;">
				<div class="styLNLeftNumBox"/>
				<div class="styLNDesc" style="width:152mm;">
				  <span style="float:left;">During the tax year, was there any member of the consolidated group that reaffiliated within 60 months of disaffiliation?</span>
				  <span class="styDotLn" style="float:right;">..........</span>
				</div>
				<div class="styLNDesc" style="float:right;width:27mm;padding-top:0;">
				  <span>
					<xsl:call-template name="PopulateSpan">
					  <xsl:with-param name="TargetNode" select="./MemReaffiliatedWithin60MnthInd"/>
					</xsl:call-template>
					<input class="styCkBox" alt="Subsidiary Corp" type="checkbox" TabIndex="-1" name="Checkbox">
					  <xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="./MemReaffiliatedWithin60MnthInd"/>
						<xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851MemReaffiliatedWithin60MnthInd</xsl:with-param>
					  </xsl:call-template>
					</input>
					<label>
					  <xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="./MemReaffiliatedWithin60MnthInd"/>
						<xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851MemReaffiliatedWithin60MnthInd</xsl:with-param>
					  </xsl:call-template>
					  <span style="width:2px;"/>
					  <b>Yes</b>
					</label>
				  </span>
				  <span class="styBoldText" style="width:4mm;"/>
				  <span>
					<xsl:call-template name="PopulateSpan">
					  <xsl:with-param name="TargetNode" select="./MemReaffiliatedWithin60MnthInd"/>
					</xsl:call-template>
					<input class="styCkBox" alt="Subsidiary Corp" type="checkbox" TabIndex="-1" name="Checkbox">
					  <xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="./MemReaffiliatedWithin60MnthInd"/>
						<xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851MemReaffiliatedWithin60MnthInd</xsl:with-param>
					  </xsl:call-template>
					</input>
					<label>
					  <xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="./MemReaffiliatedWithin60MnthInd"/>
						<xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851MemReaffiliatedWithin60MnthInd</xsl:with-param>
					  </xsl:call-template>
					  <span style="width:2px;"/>
					  <b>No</b>
					</label>
				  </span>
				</div>
				<div style="width:165mm;float:left">
				  <div class="styGenericDiv" style="width:150mm;padding-bottom:.5mm;padding-left:8mm;">
					If "Yes," enter the name of the corporation(s) and explain the circumstances.
				  </div>
				</div>
				<xsl:if test="position()=last()">
				  <div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;vertical-align:bottom;padding-top:2px;">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
					  <xsl:with-param name="containerHeight" select="3"/>
					  <xsl:with-param name="headerHeight" select="2"/>
					  <xsl:with-param name="containerID" select=" 'TPctnB1' "/>
					  <xsl:with-param name="imageID" select=" 'TPimgB1' "/>
					  <xsl:with-param name="buttonID" select=" 'TPbtnB1' "/>
					</xsl:call-template>
				  </div>
				</xsl:if>
			  </div>
			</xsl:for-each>
			<!-- Line 2 of Part IV Table (3 columns)-->
			<div class="styTableContainer " id="TPctnB1">
			  <xsl:call-template name="SetInitialState"/>
			  <table cellspacing="0" style="width:187mm;font-size:7pt;border-top:1px solid black;border-bottom:0px;">
				<thead class="styTableThead">
				  <tr>
					<th class="styTableCell" scope="col" rowspan="1" style="width:7mm;text-align:center;font-weight:normal;">Corp. No.</th>
					<th class="styTableCell" scope="col" rowspan="1" style="width:80mm;text-align:center;font-weight:normal;">Name of corporation</th>
					<th class="styTableCell" scope="col" rowspan="1" style="width:85mm;text-align:center;font-weight:normal;border-right:none;">Explanation</th>
				  </tr>
				</thead>
				<tfoot/>
				<tbody>
				<!--Row 1***Parent Corp*** for ***inline format*** -->
				  <tr>
					<!--Column 1 -->
					<td valign="top" class="styTableCell" style="width:7mm;height:10mm;text-align:left;">
					  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
						</xsl:call-template>
					  </xsl:if>
					  <span class="styTableCellPad"/>
					</td>
					<!--Column 2 -->
					<td valign="top" class="styTableCell" style="width:80mm;height:10mm;text-align:left;">
					  <xsl:choose>
						<xsl:when test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
						  <xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
						  </xsl:call-template>
						  <br/>
						  <xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
						  </xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<!--Column 2 Part IV line 2 Table for inline format -->
					<!-- <xsl:if test="$Form851Data/CommonParentCorporationInfo/MemReaffiliatedWithin60MnthInd=1">
						    <td class="styTableCell" style="width:7.5mm;height:10mm;text-align:center;">
							  <xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/MemReaffiliatedWithin60MnthInd"/>
							  </xsl:call-template>
							  <span class="styTableCellPad"/>
							</td>
							<td class="styTableCell" style="width:7.5mm;height:10mm;text-align:center;">
							  <span style="width:1px;"/>
							</td>
						  </xsl:if>-->
					<!--Column 3 -->
					<td valign="top" class="styTableCell" style="width:80mm;height:10mm;text-align:left;border-right:none;">
					  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ExplanationTxt"/>
						</xsl:call-template>
					  </xsl:if>
					  <span class="styTableCellPad"/>
					</td>
				  </tr>
				  <!--Row 2 and >***Subsidiary Corp*** repeated for ***inline format*** -->
				  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
					<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
					  <tr>
						<!-- Column 1 -->
						<td valign="top" class="styTableCell" style="width:7mm;height:10mm;text-align:left;">
						  <xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
							<xsl:attribute name="style">width:7mm;height:10mm;text-align:left;border-bottom:none;</xsl:attribute>
						  </xsl:if>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="../CorporationNum"/>
						  </xsl:call-template>
						  <span class="styTableCellPad"/>
						</td>
						<!-- Column 2 -->
						<td valign="top" class="styTableCell" style="width:80mm;height:10mm;text-align:left;">
						  <xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
							<xsl:attribute name="style">width:80mm;height:10mm;text-align:left;border-bottom:none;</xsl:attribute>
						  </xsl:if>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1Txt"/>
						  </xsl:call-template>
						  <xsl:if test="../CorporationName/BusinessNameLine2Txt!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						  </xsl:if>
						</td>
						<!-- Column 3 -->
						<td valign="top" class="styTableCell" style="width:80mm;height:10mm;text-align:left;border-right:none;">
						  <xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
							<xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;text-align:left;border-right:none;border-bottom:none;'"/></xsl:attribute>
						  </xsl:if>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
						  </xsl:call-template>
						</td>
					  </tr>
					</xsl:for-each>
				  </xsl:if>
				  <!--Line 2 Part IV ***Subsidiary corp****for ***Empty format*** -->
				  <xsl:if test="((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)) or (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) = 0)">
					<xsl:call-template name="PartIVEmptyRows">
					  <xsl:with-param name="numRows" select="3"/>
					</xsl:call-template>
				  </xsl:if>
				  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 0) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 3)">
					<xsl:call-template name="PartIVEmptyRows">
					  <xsl:with-param name="numRows" select="3 - count($Form851Data/SubsidiaryCorporationInfo)"/>
					</xsl:call-template>
				  </xsl:if>
				</tbody>
			  </table>
			</div>
			<xsl:call-template name="SetInitialDynamicTableHeight">
			  <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
			  <xsl:with-param name="containerHeight" select="3"/>
			  <xsl:with-param name="headerHeight" select="2"/>
			  <xsl:with-param name="containerID" select=" 'TPctnB1' "/>
			</xsl:call-template>
		  </div>
		  <div style="page-break-inside:avoid;width:187mm;">
		  <!-- 9/8/2016 Customer Approved 
			   EXCEPTION:  Part IV, Line 3 design is associated with schema and will not match PDF.
								    Part IV, Line 3 repeating subsidiary will not be display in the Additional Data section.  
			-->
		    <!--Line 3 of Part IV***Parent Corp*** check box-->
		    <div class="styNBB" style="width:187mm;">
			  <div class="styLNLeftNumBox">3</div>
			  <div class="styLNDesc" style="width:152mm;height:10mm;">
			    <span style="float:left;">During the tax year, was there any arrangement in existence by which one or more persons that 
				  were not members of the affiliated group could acquire any stock, or acquire any voting power without acquiring stock, in 
				  the corporation, other than a de minimis amount, from the corporation or another member of the affiliated group?
				  <span class="styDotLn" style="float:right;">......</span>
			    </span>
			  </div>
			  <div class="styLNDesc" style="float:right;width:27mm;padding-top:5mm;">
			    <span>
				  <xsl:call-template name="PopulateSpan">
				    <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrngmNonMemAcqStkVtngPwrInd"/>
				  </xsl:call-template>
				  <input class="styCkBox" alt="IRS851ArrngmNonMemAcqStkVtngPwr" type="checkbox" TabIndex="-1" name="Checkbox">
				    <xsl:call-template name="PopulateYesCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrngmNonMemAcqStkVtngPwrInd"/>
					  <xsl:with-param name="BackupName">IRS851ArrngmNonMemAcqStkVtngPwr</xsl:with-param>
				    </xsl:call-template>
				  </input>
				  <label>
				    <xsl:call-template name="PopulateLabelYes">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrngmNonMemAcqStkVtngPwrInd"/>
					  <xsl:with-param name="BackupName">IRS851ArrngmNonMemAcqStkVtngPwr</xsl:with-param>
				    </xsl:call-template>
				    <span style="width:2px;"/>
				    <b>Yes</b>
				  </label>
			    </span>
			    <span class="styBoldText" style="width:4mm;"/>
			    <span>
				  <xsl:call-template name="PopulateSpan">
				    <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrngmNonMemAcqStkVtngPwrInd"/>
				  </xsl:call-template>
				  <input class="styCkBox" alt="IRS851ArrngmNonMemAcqStkVtngPwr" type="checkbox" TabIndex="-1" name="Checkbox">
				    <xsl:call-template name="PopulateNoCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrngmNonMemAcqStkVtngPwrInd"/>
					  <xsl:with-param name="BackupName">IRS851ArrngmNonMemAcqStkVtngPwr</xsl:with-param>
				    </xsl:call-template>
				  </input>
				  <label>
				    <xsl:call-template name="PopulateLabelNo">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrngmNonMemAcqStkVtngPwrInd"/>
					  <xsl:with-param name="BackupName">IRS851ArrngmNonMemAcqStkVtngPwr</xsl:with-param>
				    </xsl:call-template>
				    <span style="width:2px;"/>
				    <b>No</b>
				  </label>
			    </span>
			  </div>
			  <div style="width:165mm;float:left">
			    <div class="styGenericDiv" style="width:170mm;padding-bottom:.5mm;padding-left:8mm;">
				  If "Yes," enter the name of the corporation and see the instructions for the percentages to enter in columns (a), (b), and (c).
			    </div>
			  </div>
			  <!--Toggle Button -->
			  <xsl:if test="count($Form851Data/SubsidiaryCorporationInfo) = 0">
			    <div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;vertical-align:bottom;padding-top:3mm;">
				  <xsl:call-template name="SetDynamicTableToggleButton">
				    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
				    <xsl:with-param name="containerHeight" select="3"/>
				    <xsl:with-param name="headerHeight" select="2"/>
				    <xsl:with-param name="containerID" select=" 'TPctnC1' "/>
				    <xsl:with-param name="imageID" select=" 'TPimgC1' "/>
				    <xsl:with-param name="buttonID" select=" 'TPbtnC1' "/>
				  </xsl:call-template>
			    </div>
			  </xsl:if>
		    </div>
			<!--Line 3 of Part IV****Subsidiary Corp*** repeated checkboxes-->
			<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
			  <div class="styNBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:1mm;"/>
			    <div class="styLNDesc" style="width:152mm;height:10mm;">
				  <span style="float:left;">
					During the tax year, was there any arrangement in existence by which one or more persons that were not members of
					the affiliated group could acquire any stock, or acquire any voting power without acquiring stock, in the corporation, 
					other than a de minimis amount, from the corporation or another member of the affiliated group?
					<span class="styDotLn" style="float:right;">......</span>
				  </span>
				</div>
				<div class="styLNDesc" style="float:right;width:27mm;padding-top:5mm;">
				  <span>
					<xsl:call-template name="PopulateSpan">
					  <xsl:with-param name="TargetNode" select="./ArrngmNonMemAcqStkVtngPwrInd"/>
					</xsl:call-template>
					<input class="styCkBox" alt="Subsidiary Corp" type="checkbox" TabIndex="-1" name="Checkbox">
					  <xsl:call-template name="PopulateYesCheckbox">
					    <xsl:with-param name="TargetNode" select="./ArrngmNonMemAcqStkVtngPwrInd"/>
						<xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851ArrngmNonMemAcqStkVtngPwrInd</xsl:with-param>
					  </xsl:call-template>
					</input>
					<label>
					  <xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="./ArrngmNonMemAcqStkVtngPwrInd"/>
						<xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851ArrngmNonMemAcqStkVtngPwrInd</xsl:with-param>
					  </xsl:call-template>
					  <span style="width:2px;"/>
					  <b>Yes</b>
					</label>
				  </span>
				  <span class="styBoldText" style="width:4mm;"/>
				  <span>
					<xsl:call-template name="PopulateSpan">
					  <xsl:with-param name="TargetNode" select="./ArrngmNonMemAcqStkVtngPwrInd"/>
					</xsl:call-template>
					<input class="styCkBox" alt="Subsidiary Corp" type="checkbox" TabIndex="-1" name="Checkbox">
					  <xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="./ArrngmNonMemAcqStkVtngPwrInd"/>
						<xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851ArrngmNonMemAcqStkVtngPwrInd</xsl:with-param>
					  </xsl:call-template>
					</input>
					<label>
					  <xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="./ArrngmNonMemAcqStkVtngPwrInd"/>
						<xsl:with-param name="BackupName">Subsidiary Corp <xsl:value-of select="position()"/> IRS851ArrngmNonMemAcqStkVtngPwrInd</xsl:with-param>
					  </xsl:call-template>
					  <span style="width:2px;"/>
					  <b>No</b>
					</label>
				  </span>
				</div>
				<div style="width:165mm;float:left">
				  <div class="styGenericDiv" style="width:170mm;padding-bottom:.5mm;padding-left:8mm;">
					If "Yes," enter the name of the corporation and see the instructions for the percentages to enter in columns (a), (b), and (c).
				  </div>
				</div>
				<xsl:if test="position()=last()">
				  <div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;vertical-align:bottom;padding-top:3mm;">
					<xsl:call-template name="SetDynamicTableToggleButton">
					  <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
					  <xsl:with-param name="containerHeight" select="3"/>
					  <xsl:with-param name="headerHeight" select="2"/>
					  <xsl:with-param name="containerID" select=" 'TPctnC1' "/>
					  <xsl:with-param name="imageID" select=" 'TPimgC1' "/>
					  <xsl:with-param name="buttonID" select=" 'TPbtnC1' "/>
					</xsl:call-template>
				  </div>
				</xsl:if>
			  </div>
			</xsl:for-each>
			<div class="styTableContainer" id="TPctnC1">
			  <xsl:call-template name="SetInitialState"/>
			  <!-- Line 3 of Part IV ***repeating table *** (5 columns) -->
			  <table class="styNBB" cellspacing="0" style="width:187mm;font-size:7pt;border-top:1px solid black;">
				<thead class="styTableThead">
				  <tr>
					<th class="styTableCell" scope="col" rowspan="1" style="width:7mm;text-align:center;font-weight:normal;">Corp. No.</th>
					<th class="styTableCell" scope="col" rowspan="1" style="width:80mm;text-align:center;font-weight:normal;">Name of corporation</th>
					<th class="styTableCell" scope="col" rowspan="1" style="width:27mm;text-align:center;font-weight:normal;">
					  <b>(a)</b> 
					  <br/>Percentage of value
					</th>
					<th class="styTableCell" scope="col" rowspan="1" style="width:28mm;text-align:center;font-weight:normal;">
					  <b>(b)</b>
					  <br/>Percentage of outstanding voting stock
					</th>
					<th class="styTableCell" scope="col" rowspan="1" style="width:29mm;text-align:center;font-weight:normal;border-right:none;">
					  <b>(c)</b>
					  <br/>Percentage of voting power
					</th>
				  </tr>
				</thead>
				<tfoot/>
				<tbody>
				  <!--Row 1***Parent Corp*** for ***inline format*** -->
				  <tr>
					<!--Column 1 -->
					<td valign="top" class="styTableCell" style="width:7mm;height:10mm;text-align:left;">
					  <xsl:if test="not((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated))">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
						</xsl:call-template>
					  </xsl:if>
					  <span class="styTableCellPad"/>
					</td>
					<!--Column 2 *** inline and empty format***-->
					<td valign="top" class="styTableCell" style="width:80mm;height:10mm;text-align:left;">
					  <xsl:choose>
						<xsl:when test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
						  <xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
						  </xsl:call-template>
						  <br/>
						  <xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
						  </xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<!--Column 3 *** inline and empty format***-->
					<td valign="top" class="styTableCell" style="text-align:right;width:27mm;height:10mm;">
					  <xsl:choose>
						<xsl:when test="($Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/VotingPowerPct) and (not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3)))">
						  <xsl:call-template name="PopulatePercent">
							<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/StockValuePct"/>
						  </xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						  <span style="padding-top:6mm;">%</span>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<!--Column 4 *** inline and empty format***-->
					<td valign="top" class="styTableCell" style="width:27mm;text-align:right;">
					  <xsl:choose>
						<xsl:when test="($Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/VotingPowerPct) and (not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3)))">
						  <xsl:call-template name="PopulatePercent">
							<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/OutstandingVotingStockPct"/>
						  </xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						  <span style="padding-top:6mm;">%</span>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<!--Column 5 *** inline and empty format***-->
					<td valign="top" class="styTableCell" style="width:26mm;height:10mm;border-right:none;">
					  <xsl:choose>
						<xsl:when test="($Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/VotingPowerPct) and (not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3)))">
						  <xsl:call-template name="PopulatePercent">
							<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/VotingPowerPct"/>
						  </xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						  <span style="padding-top:6mm;">%</span>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
				  </tr>
				  <!--Row 2 and >***Subsidiary Corp*** repeated for ***inline format*** -->
				  <xsl:if test="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation!=''">
					<xsl:if test="not((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated))">
					  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
						<tr style="height:10mm;">
						  <!--Column 1 -->
						  <td valign="top" class="styTableCell" style="width:7mm;text-align:left;">
							<xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
							  <xsl:attribute name="style"><xsl:value-of select="'width:7mm;border-bottom:none;text-align:left;'"/></xsl:attribute>
							</xsl:if>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="../CorporationNum"/>
							</xsl:call-template>
						  </td>
						  <!--Column 2 -->
						  <td valign="top" class="styTableCell" style="width:80mm;height:10mm;text-align:left;">
							<xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
							  <xsl:attribute name="style"><xsl:value-of select="'border-bottom:none;text-align:left;'"/></xsl:attribute>
							</xsl:if>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="../CorporationName/BusinessNameLine2Txt!=''">
							  <br/>
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2Txt"/>
							  </xsl:call-template>
							</xsl:if>
						  </td>
						  <!--Column 3 *** inline and empty format***-->
						  <td valign="top" class="styTableCell" style="width:27mm;height:10mm;">
							<xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
							  <xsl:attribute name="style"><xsl:value-of select="'border-bottom:none;'"/></xsl:attribute>
							</xsl:if>
							<xsl:choose>
							  <xsl:when test="StockValuePct!=''">
								<xsl:call-template name="PopulatePercent">
								  <xsl:with-param name="TargetNode" select="StockValuePct"/>
								</xsl:call-template>
							  </xsl:when>
							  <xsl:otherwise>%</xsl:otherwise>
							</xsl:choose>
						  </td>
						  <!--Column 4 *** inline and empty format***-->
						  <td valign="top" class="styTableCell" style="width:27mm;height:10mm;">
							<xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
							  <xsl:attribute name="style"><xsl:value-of select="'border-bottom:none;'"/></xsl:attribute>
							</xsl:if>
							<xsl:choose>
							  <xsl:when test="OutstandingVotingStockPct!=''">
								<xsl:call-template name="PopulatePercent">
								  <xsl:with-param name="TargetNode" select="OutstandingVotingStockPct"/>
								</xsl:call-template>
							  </xsl:when>
							  <xsl:otherwise>%</xsl:otherwise>
							</xsl:choose>
						  </td>
						  <!--Column 5 *** inline and empty format***-->
						  <td valign="top" class="styTableCell" style="width:27mm;height:10mm;border-right:none;">
							<xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
							  <xsl:attribute name="style"><xsl:value-of select="'border-bottom:none;border-right:none;'"/></xsl:attribute>
							</xsl:if>
							<xsl:choose>
							  <xsl:when test="VotingPowerPct!=''">
								<xsl:call-template name="PopulatePercent">
								  <xsl:with-param name="TargetNode" select="VotingPowerPct"/>
								</xsl:call-template>
							  </xsl:when>
							  <xsl:otherwise>%</xsl:otherwise>
							</xsl:choose>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
				  </xsl:if>
				  <!--Line 3 Part IV***Subsidiary Corp*** for ***Empty format*** -->
				  <xsl:if test="((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)) or (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) = 0)">
					<xsl:call-template name="PartIVLineCEmptyRows">
					  <xsl:with-param name="numRows" select="3"/>
					</xsl:call-template>
				  </xsl:if>
				  <!--Line 3 Part IV***Subsidiary Corp*** for ***Empty format*** -->
				  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 0) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 3)">
				    <xsl:call-template name="PartIVLineCEmptyRows">
					  <xsl:with-param name="numRows" select="3 - count($Form851Data/SubsidiaryCorporationInfo)"/>
					</xsl:call-template>
				  </xsl:if>
				</tbody>
			  </table>
			</div>
			<xsl:call-template name="SetInitialDynamicTableHeight">
			  <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
			  <xsl:with-param name="containerHeight" select="3"/>
			  <xsl:with-param name="headerHeight" select="2"/>
			  <xsl:with-param name="containerID" select=" 'TPctnC1' "/>
			</xsl:call-template>
		  </div>
		  <!-- Line 3d of Part IV ***repeating table *** (2 columns) -->
		  <div style="page-break-inside:avoid;width:187mm;">
			<div class="styGenericDiv" style="width:187mm;">
			  <!--Table expand/collapse toggle button-->
			  <div class="styGenericDiv" style="float:right;clear:all;width:7mm;text-align:right;">
				<xsl:call-template name="SetDynamicTableToggleButton">
				  <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
				  <xsl:with-param name="headerHeight" select="2"/>
				  <xsl:with-param name="containerHeight" select="3"/>
				  <xsl:with-param name="containerID" select=" 'TPctnD1' "/>
				  <xsl:with-param name="imageID" select=" 'TPimgD1' "/>
				  <xsl:with-param name="buttonID" select=" 'TPbtnD1' "/>
				 </xsl:call-template>
			  </div>
			  <!--Table expand/collapse toggle button end-->
			</div>
			<!-- Line 3d Table (2 columns) -->
			<div class="styTableContainer" id="TPctnD1">
			  <xsl:call-template name="SetInitialState"/>
			  <table cellspacing="0" style="width:187mm;font-size:7pt;border-top:1px solid black;">
				<thead class="styTableThead">
				  <tr>
					<th class="styTableCell" scope="col" style="width:7mm;text-align:center;font-weight:normal;">Corp. No.</th>
					<th class="styTableCell" scope="col" style="width:175mm;text-align:left;font-weight:normal;border-right:none;">
					  <b>(d)</b>  Provide a description of any arrangement.
					</th>
				  </tr>
				</thead>
				<tfoot/>
				<tbody>
				  <!-- Row 1 of Line 3d of Part IV***Parent Corp*** for ***inline format***-->
				  <tr>
					<!-- Column 1 -->
					<td valign="top" class="styTableCell" style="width:7mm;height:10mm;text-align:left;">
					  <xsl:if test="not((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated))">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
						</xsl:call-template>
					  </xsl:if>
					  <span class="styTableCellPad"/>
					</td>
					<!-- Column 2 -->
					<td valign="top" class="styTableCell" style="width:180mm;height:10mm;text-align:left;border-right:none;">
					  <xsl:choose>
						<xsl:when test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrangementDesc"/>
						  </xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrangementDesc"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
				  </tr>
				  <!-- Row 2 of Line 3d of Part IV***Subsidiary Corp*** for ***inline format*** -->
				  <xsl:if test="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation!=''">
					<xsl:if test="not((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated))">
					  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
						<tr style="height:10mm;">
						  <!-- Column 1 -->
						  <td valign="top" class="styTableCell" style="width:7mm;text-align:left;'">
							<xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
							  <xsl:attribute name="style"><xsl:value-of select="'width:7mm;text-align:left;border-bottom:none;'"/></xsl:attribute>
							</xsl:if>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="../CorporationNum"/>
							</xsl:call-template>
						  </td>
						  <!-- Column 2 -->
						  <td valign="top" class="styTableCell" style="width:175mm;height:10mm;text-align:left;border-right:none;">
							<xsl:if test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
							  <xsl:attribute name="style"><xsl:value-of select="'text-align:left;border-right:none;border-bottom:none;'"/></xsl:attribute>
							</xsl:if>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="ArrangementDesc"/>
							</xsl:call-template>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
				  </xsl:if>
				  <!-- Line 3d of Part IV ***Empty format *** row 1-->
				  <xsl:if test="((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)) or (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) = 0)">
					<xsl:call-template name="PartIVLineDEmptyRows">
					  <xsl:with-param name="numRows" select="3"/>
					</xsl:call-template>
				  </xsl:if>
				  <!-- Line 3d of Part IV ***Empty format *** row 2-->
				  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 0) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 3)">
					<xsl:call-template name="PartIVLineDEmptyRows">
					  <xsl:with-param name="numRows" select="3 - count($Form851Data/SubsidiaryCorporationInfo)"/>
					</xsl:call-template>
				  </xsl:if>
				</tbody>
			  </table>
			</div>
			<xsl:call-template name="SetInitialDynamicTableHeight">
			  <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
			  <xsl:with-param name="containerHeight" select="3"/>
			  <xsl:with-param name="headerHeight" select="2"/>
			  <xsl:with-param name="containerID" select=" 'TPctnD1' "/>
			</xsl:call-template>
		  </div>
		  <div style="width:187mm;padding-top:1mm;">
			<div style="float:right;">Form
			  <span style="font-weight:bold;font-size:7pt;">851</span> (Rev. 10-2016)
			</div>
		  </div>
		  <!-- Left over data -->
		  <p style="page-break-before: always"/>
		  <!-- BEGIN Left Over Table -->
		  <!-- Additonal Data Title Bar and Button -->
		  <div class="styLeftOverTitleLine" id="LeftoverData">
			<div class="styLeftOverTitle">Additional Data  </div>
			<div class="styLeftOverButtonContainer">
			  <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
			</div>
		  </div>
		  <!-- ADDITIONAL DATA TABLE -->
		  <table class="styLeftOverTbl">
			<xsl:call-template name="PopulateCommonLeftover">
			  <xsl:with-param name="TargetNode" select="$Form851Data"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
		  </table>
		  <!-- END Left Over Table -->
		  <!--@@@SEPARATED Print for PART I TABLE@@@-->
		  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &gt; 9) and ($Print = $Separated)">
			<span class="styRepeatingDataTitle">Form 851, Part I - Overpayment Credits, Estimated Tax Payments, and Tax Deposits 
			  <span class="styNormalText">  (see instructions)</span>:
			</span>
			<table class="styDepTbl" cellspacing="0" style="width:187mm;font-size:7pt;">
			  <thead class="styTableThead">
				<tr class="styDepTblHdr">
				  <th class="styDepTblCell" scope="col" style="width:10mm;text-align:center;font-weight:normal;">Corp. No.</th>
				  <th class="styDepTblCell" scope="col" style="width:59.5mm;text-align:center;font-weight:normal;">Name and address of corporation</th>
				  <th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;font-weight:normal;">Employer identification number</th>
				  <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;font-weight:normal;">Portion of overpayment credits and estimated tax payments</th>
				  <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;font-weight:normal;border-right:none;">Portion of tax deposited with Form 7004</th>
				</tr>
			  </thead>
			  <tfoot/>
			  <tbody>
				<tr class="styDepTblRow1">
				  <td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
					</xsl:call-template>
				  </td>
				  <td class="styTableCell" style="width:55mm;text-align:left;">Common parent corporation</td>
				  <td class="styTableCell" style="width:32mm;background-color:lightgrey;"/>
				  <td class="styTableCell" style="width:40mm;text-align:right;">
				    <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PrtnOvpmtCrAndEstTxPaymentsAmt"/>
					</xsl:call-template>
				  </td>
				  <td class="styTableCell" style="width:40mm;text-align:right;border-right:none;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PrtnTaxDepositedWith7004Amt"/>
					</xsl:call-template>
				  </td>
				</tr>
				<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
				  <tr>
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
					<td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
					  <xsl:call-template name="PopulateText">
					    <xsl:with-param name="TargetNode" select="CorporationNum"/>
					  </xsl:call-template>
					</td>
					<td valign="top" class="styTableCell" style="width:55mm;text-align:left;">
					  <xsl:if test="position()=1">
					    Subsidiary corporations:<br/>
					  </xsl:if>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
					  </xsl:call-template>
					  <xsl:if test="CorporationName/BusinessNameLine2Txt!=''">
						<br/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
						</xsl:call-template>
					  </xsl:if>
					  <!-- Subsidiary Corporation Address -->
					  <xsl:choose>
						<!-- US Address -->
						<xsl:when test="CorporationUSAddress">
						  <xsl:if test="CorporationUSAddress/AddressLine1Txt!=''">
						    <br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationUSAddress/AddressLine1Txt"/>
							</xsl:call-template>
						  </xsl:if>
						  <xsl:if test="CorporationUSAddress/AddressLine2Txt!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationUSAddress/AddressLine2Txt"/>
							</xsl:call-template>
						  </xsl:if>
						  <xsl:if test="CorporationUSAddress/CityNm!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationUSAddress/CityNm"/>
							</xsl:call-template>
						  </xsl:if>
						  <xsl:if test="CorporationUSAddress/StateAbbreviationCd!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationUSAddress/StateAbbreviationCd"/>
							</xsl:call-template>
						  </xsl:if>
						  <xsl:if test="CorporationUSAddress/ZIPCd!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationUSAddress/ZIPCd"/>
							</xsl:call-template>
						  </xsl:if>
						</xsl:when>
						<!-- FOREIGN Address -->
						<xsl:otherwise> 	
						  <xsl:if test="CorporationForeignAddress/AddressLine1Txt!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/AddressLine1Txt"/>
							</xsl:call-template>
						  </xsl:if>
						  <xsl:if test="CorporationForeignAddress/AddressLine2Txt!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/AddressLine2Txt"/>
							</xsl:call-template>
						  </xsl:if>
						  <xsl:if test="CorporationForeignAddress/CityNm!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/CityNm"/>
							</xsl:call-template>
						  </xsl:if>
						  <xsl:if test="CorporationForeignAddress/ProvinceOrStateNm!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/ProvinceOrStateNm"/>
							</xsl:call-template>
						  </xsl:if>
						  <xsl:if test="CorporationForeignAddress/ForeignPostalCd!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/ForeignPostalCd"/>
							</xsl:call-template>
						  </xsl:if>
						  <xsl:if test="CorporationForeignAddress/CountryCd!=''">
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="CorporationForeignAddress/CountryCd"/>
							</xsl:call-template>
						  </xsl:if>
						</xsl:otherwise>
					  </xsl:choose>
					  <xsl:if test="CorporationNameControlTxt!=''">
						<br/>            
						Corporation Name Control: 
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="CorporationNameControlTxt"/>
						</xsl:call-template>
					  </xsl:if>
					</td>
					<td class="styTableCell" valign="top" style="width:32mm;border-style:solid;text-align:center;">
					  <xsl:choose>
						<xsl:when test="CorporationEIN">
						  <xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="CorporationEIN"/>
						  </xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<td class="styTableCell" valign="top" style="width:40mm;text-align:right;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="PrtnOvpmtCrAndEstTxPaymentsAmt"/>
					  </xsl:call-template>
					  <span style="width:1px;"/>
					</td>
					<td class="styTableCell" valign="top" style="width:40mm;text-align:right;border-right:none;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="PrtnTaxDepositedWith7004Amt"/>
					  </xsl:call-template>
					  <span style="width:1px;"/>
					</td>
				  </tr>
				</xsl:for-each>
				<tr class="styDepTblHdr">
				  <td class="styDepTblCell" colspan="3" style="width:113mm;height:10mm;border-bottom-width:0px;padding-left:8mm;padding-top:8mm;">
					<span style="float:left;font-size:7pt;">
					  <b>Totals</b>
					   <span style="width:1mm;"/>(Must equal amounts shown on the consolidated tax return.)
					</span>
					<span class="styDotLn" style="float-right;padding-left:4mm;">.
					  <img src="{$ImagePath}/851_Bullet_Lg.gif" alt="Right pointing arrow large image" width="4"/>
					</span>
				  </td>
				  <td class="styDepTblCell" style="width:40mm;height:10mm;text-align:right;border-bottom-width:0px;padding-top:8mm;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form851Data/TotOvpmtCrAndEstTxPaymentsAmt"/>
					  <xsl:with-param name="WhiteFont">true</xsl:with-param>
					</xsl:call-template>
					<span style="width:1px;"/>
				  </td>
				  <td class="styDepTblCell" style="width:40mm;height:10mm;border-right:none;text-align:right;border-bottom-width:0px;padding-top:8mm;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form851Data/TaxPaidForm7004Amt"/>
					  <xsl:with-param name="WhiteFont">true</xsl:with-param>
					</xsl:call-template>
					<span style="width:1px;"/>
				  </td>
				</tr>
			  </tbody>
			</table>
		  </xsl:if>
		  <!--@@@SEPARATED Print for PART II TABLE@@@-->
		  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &gt; 9) and ($Print = $Separated)">
		    <br/>
			<span class="styRepeatingDataTitle">Form 851, Part II - Principal Business Activity, Voting  Stock Information, Etc. 
			  <span class="styNormalText">  (see instructions)</span>:
			</span>
			<!--Part II table for inline print format -->
			<table class="styDepTbl" cellspacing="0" style="width:187mm;overflow-y:visible;font-size:7pt;">
			  <thead class="styTableThead">
				<tr class="styDepTblHdr">
				  <th class="styDepTblCell" rowspan="2" scope="col" style="width:12mm;text-align:center;font-weight:normal;">Corp. No.</th>
				  <th class="styDepTblCell" rowspan="2" scope="col" style="width:43mm;text-align:center;font-weight:normal;">Principal business activity (PBA)</th>
				  <th class="styDepTblCell" rowspan="2" scope="col" style="width:12mm;text-align:center;font-weight:normal;">PBA Code No.</th>
				  <th class="styDepTblCell" colspan="2" scope="col" style="width:24mm;text-align:center;font-weight:normal;">Did the subsidiary make any nondividend distributions?</th>
				  <th class="styDepTblCell" scope="col" colspan="4" style="width:96mm;text-align:center;font-weight:normal;">Stock holdings at beginning of year</th>
				</tr>
				<!-- Define background colors to the rows -->
				<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
				<tr class="styDepTblHdr">
				  <th class="styDepTblCell" scope="col" style="width:12mm;text-align:center;font-weight:normal;">Yes</th>
				  <th class="styDepTblCell" scope="col" style="width:12mm;text-align:center;font-weight:normal;">No</th>
				  <th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;font-weight:normal;">Number of shares</th>
				  <th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;font-weight:normal;">Percentage of voting power</th>
				  <th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;font-weight:normal;">Percentage of value</th>
				  <th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;font-weight:normal;border-right:none;">Owned by corporation no.</th>
				</tr>
			  </thead>
			  <tfoot/>
			  <tbody>
				<tr class="styDepTblRow1" style="height:10mm;">
				  <!--Column 1 of Part II line 1  of Parent Corp for inline format-->
				  <td valign="top" class="styTableCell" style="width:12mm;padding-right:3mm;font-weight:bold;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
					</xsl:call-template>
				  </td>
				  <!-- Column 2 of Part II line 1 - Parent Corp for inline format -->
				  <td valign="top" class="styTableCell" style="width:43mm;text-align:left;">Common parent corporation:<br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PrincipalBusinessActivityDesc"/>
					</xsl:call-template>
				  </td>
				  <!--Column 3 of Part II line 1  of Parent Corpfor inline print-->
				  <td valign="top" class="styTableCell" style="width:12mm;text-align:center;">
					<xsl:choose>
					  <xsl:when test="$Form851Data/CommonParentCorporationInfo/PrincipalBusinessActivityCd">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PrincipalBusinessActivityCd"/>
						</xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/InactivePrincipalBusActyCd"/>
						</xsl:call-template>
					  </xsl:otherwise>
					</xsl:choose>
				  </td>
				  <!--Column 4 of Part II line 1  of Parent Corpfor inline print-->
				  <td class="styTableCell" style="width:12mm;background-color:lightgrey;"/>
				  <!--Column 5 of Part II line 1  of Parent Corpfor inline print-->
				  <td class="styTableCell" style="width:12mm;background-color:lightgrey;"/>
				  <!--Column 6 of Part II line 1 for inline print-->
				  <td class="styTableCell" style="width:24mm;background-color:lightgrey;"/>
				  <!--Column 7 of Part II line 1 for inline print-->
				  <td class="styTableCell" style="width:24mm;background-color:lightgrey;"/>
				  <!--Column 8 of Part II line 1 for inline print-->
				  <td class="styTableCell" style="width:24mm;background-color:lightgrey;"/>
				  <!--Column 9 of Part II line 1 for inline print-->
				  <td class="styTableCell" style="width:24mm;background-color:lightgrey;border-bottom-width:1px;border-right:none;"/>
				</tr>
				<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
				  <tr>
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
					<!--Column 1 of Part II LIne 2  of Subsidiary for inline print -->
					<td valign="top" class="styTableCell" style="width:12mm;font-weight:bold;text-align:left;">
					  <!--Row will span for column 1 Part II -->
					  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="CorporationNum"/>
					  </xsl:call-template>
					</td>
					<!--Column 2 of Part II LIne 2  of Subsidiary for inline print-->
					<td valign="top" class="styTableCell" style="width:43mm;text-align:left;">
					  <!--Row will span for column 2 Part II -->
					  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
					  <xsl:if test="position() = 1">Subsidiary corporations:<br/></xsl:if>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
					  </xsl:call-template>
					</td>
					<!--Column 3 of Part II LIne 2 of Subsidiary for inline print -->
					<td valign="top" class="styTableCell" style="width:12mm;text-align:center;">
					<!--Row will span for column 3 Part II -->
					  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
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
					<!--Column 4  Yes of Part II LIne 2 of Subsidiary for inline print -->
					<td valign="top" class="styTableCell" style="width:12mm;text-align:center;">
					  <!--Row will span for column 4 Part II -->
					  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
					  <xsl:call-template name="PopulateYesBoxText">
						<xsl:with-param name="TargetNode" select="NondividendDistriMadeInd"/>
					  </xsl:call-template>
					</td>
					<!--Column 5 NO of Part II LIne 2 of Subsidiary for inline print -->
					<td valign="top" class="styTableCell" style="width:12mm;text-align:center;">
					  <!--Row will span for column 5 Part II -->
					  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
					  <xsl:call-template name="PopulateNoBoxText">
						<xsl:with-param name="TargetNode" select="NondividendDistriMadeInd"/>
					  </xsl:call-template>
					</td>
					<!-- First Instance of Column 6 Through 9 Below. The remaining repeating Column 6 Through 9 will be handled by the for-each loop-->
					<td valign="top" class="styTableCell" style="width:24mm;text-align:left;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/SharesCnt"/>
					  </xsl:call-template>
					</td>
					<td valign="top" class="styTableCell" style="width:24mm;text-align:right;">
					  <xsl:choose>
						<xsl:when test="normalize-space(StockHoldingInfo[1]/VotingPowerPct)=''">%</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulatePercent">
							<xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/VotingPowerPct"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<td valign="top" class="styTableCell" style="width:24mm;text-align:right;">
					  <xsl:choose>
						<xsl:when test="normalize-space(StockHoldingInfo[1]/StockValuePct)=''">%</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulatePercent">
							<xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/StockValuePct"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<td valign="top" class="styTableCell" style="width:24mm;text-align:left;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/OwnedByCorporationNum"/>
					  </xsl:call-template>
					</td>
				  </tr>
				  <!--Column 6 to 9 of Part II will repeat-->
				  <xsl:for-each select="StockHoldingInfo">
					<xsl:if test="position() &gt; 1">
					  <tr>
						<!-- Define background colors to the rows -->
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
						<!--Column 6 of Part II LIne 2 of Subsidiary for inline print-->
						<td valign="top" class="styTableCell" style="width:24mm;text-align:left;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SharesCnt"/>
						  </xsl:call-template>
						</td>
						<!--Column 7 of Part II LIne 2 of Subsidiary for inline print -->
						<td valign="top" class="styTableCell" style="width:24mm;text-align:right;">
						  <xsl:choose>
							<xsl:when test="normalize-space(VotingPowerPct)=''">%</xsl:when>
							<xsl:otherwise>
							  <xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="VotingPowerPct"/>
							  </xsl:call-template>
							</xsl:otherwise>
						  </xsl:choose>
						</td>
						<!--Column 8 of Part II LIne 2 of Subsidiary for inline print -->
						<td valign="top" class="styTableCell" style="'width:24mm;text-align:right;">
						  <xsl:choose>
							<xsl:when test="normalize-space(StockValuePct)=''">%</xsl:when>
							<xsl:otherwise>
							  <xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="StockValuePct"/>
							  </xsl:call-template>
							</xsl:otherwise>
						  </xsl:choose>
						</td>
						<!--Column 9 of Part II LIne 2 for inline print-->
						<td valign="top" class="styTableCell" style="width:24mm;text-align:left;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="OwnedByCorporationNum"/>
						  </xsl:call-template>
						</td>
					  </tr>
					</xsl:if>
				  </xsl:for-each>
				</xsl:for-each>
			  </tbody>
			</table>
		  </xsl:if>
		  <!--@@@SEPARATED Print for PART III TABLE@@@-->
		  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &gt; 7) and ($Print = $Separated)">
			<br/>
			<span class="styRepeatingDataTitle">Form 851, Part III - Changes in Stock Holdings During the Tax Year:</span>
			<table class="styDepTbl" cellspacing="0" sumary="Table Changes in Stock Holdings During the Tax Year" style="width:187mm;clear:both;float:none;font-size:7pt;">
			  <thead class="styTableThead">
				<tr class="styDepTblHdr">
				  <th class="styDepTblCell" rowspan="2" scope="col" style="width:10mm;text-align:center;font-weight:normal;">Corp. No.</th>
				  <th class="styDepTblCell" rowspan="2" scope="col" style="width:16mm;text-align:center;font-weight:normal;">Name of corporation</th>
				  <th class="styDepTblCell" rowspan="2" scope="col" style="width:15mm;text-align:center;font-weight:normal;">Share-holder of Corporation No.</th>
				  <th class="styDepTblCell" rowspan="2" scope="col" style="width:24mm;text-align:center;font-weight:normal;">Date of transaction</th>
				  <th class="styDepTblCell" colspan="2" scope="col" style="width:70mm;text-align:center;font-weight:normal;"><b>(a)</b> Changes</th>
				  <th class="styDepTblCell" colspan="2" scope="col" style="width:44mm;text-align:center;font-weight:normal;">
					<b>(b)  </b> Shares held after changes described in column (a)
				  </th>
				</tr>
				<tr class="styDepTblHdr">
				  <th class="styDepTblCell" scope="col" style="width:35mm;text-align:center;font-weight:normal;">Number of shares acquired </th>
				  <th class="styDepTblCell" scope="col" style="width:35mm;text-align:center;font-weight:normal;">Number of shares disposed of </th>
				  <th class="styDepTblCell" scope="col" style="width:22mm;text-align:center;font-weight:normal;">Percentage of voting power </th>
				  <th class="styDepTblCell" scope="col" style="width:22mm;text-align:center;font-weight:normal;">Percentage of value </th>
				</tr>
			  </thead>
			  <tfoot/>
			  <tbody>
				<!--START Part III, Line 1 Common Parent Corporation Info-->
				<tr class="styDepTblRow1">
				  <!--Column 1 of Part III for inline format -->
				  <td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
				    <!--Row to expand for column 1 of Part III-->
					<xsl:attribute name="rowspan"><xsl:value-of select="count($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear)"/></xsl:attribute>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
					</xsl:call-template>
				  </td>
				  <!--Column 2 of Part III for inline format -->
				  <td valign="top" class="styTableCell" style="width:54mm;text-align:left;">
					<!--Row to expand for column 2 of Part III-->
					<xsl:attribute name="rowspan"><xsl:value-of select="count($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear)"/></xsl:attribute>
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
					</xsl:call-template>
					<br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
					</xsl:call-template>
				  </td>
				  <!--Column 3 of Part III for inline format -->
				  <td valign="top" class="styTableCell" style="width:15mm;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/ShareholderOfCorporationNum"/>
					</xsl:call-template>
				  </td>
				  <!--Column 4 of Part III for inline format -->
				  <td valign="top" class="styTableCell" style="width:21mm;text-align:center;">
					<xsl:call-template name="PopulateMonthDayYear">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/TransactionDt"/>
					</xsl:call-template>
				  </td>
				  <!--Column 5 of Part III for inline format -->
				  <td valign="top" class="styTableCell" style="width:35mm;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/SharesAcquiredCnt"/>
					</xsl:call-template>
				  </td>
				  <!--Column 6 of Part III for inline format -->
				  <td valign="top" class="styTableCell" style="width:35mm;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/SharesDisposedCnt"/>
					</xsl:call-template>
				  </td>
				  <!--Column 7 of Part III for inline format -->
				  <td class="styTableCell" style="text-align:right;width:22mm;">
					<xsl:choose>
					  <xsl:when test="not($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/VotingPowerPct) or $Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/VotingPowerPct='' ">%</xsl:when>
					  <xsl:otherwise>
						<xsl:call-template name="PopulatePercent">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/VotingPowerPct"/>						  
						</xsl:call-template>
					  </xsl:otherwise>
					</xsl:choose>
				  </td>
				  <!--Column 8 %sign of Part III for inline format -->
				  <td class="styTableCell" style="text-align:right;width:22mm;">
					<xsl:choose>
					  <xsl:when test="not($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/VotingPowerPct) or $Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/StockValuePct='' ">%</xsl:when>
					  <xsl:otherwise>
						<xsl:call-template name="PopulatePercent">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/StockValuePct"/>
						</xsl:call-template>
					  </xsl:otherwise>
					</xsl:choose>
				  </td>
				</tr>
				<!--START Repeating Group For Part III, Line 1, Column 3-8 for Common Parent Corporation row-->
				<xsl:for-each select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear">
				  <xsl:if test="not(position() = 1)">
					<tr>
					  <!-- Define background colors to the rows -->
					  <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					  <!--Column 3 of Part III for inline format -->
					  <td valign="top" class="styTableCell" style="width:15mm;text-align:left;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="ShareholderOfCorporationNum"/>
						</xsl:call-template>
					  </td>
					  <!--Column 4 of Part III for inline format -->
					  <td valign="top" class="styTableCell" style="width:21mm;text-align:center;">
						<xsl:call-template name="PopulateMonthDayYear">
						  <xsl:with-param name="TargetNode" select="TransactionDt"/>
						</xsl:call-template>
					  </td>
					  <!--Column 5 of Part III for inline format -->
					  <td valign="top" class="styTableCell" style="width:35mm;text-align:left;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="SharesAcquiredCnt"/>
						</xsl:call-template>
					  </td>
					  <!--Column 6 of Part III for inline format -->
					  <td valign="top" class="styTableCell" style="width:35mm;text-align:left;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="SharesDisposedCnt"/>
						</xsl:call-template>
					  </td>
					  <!--Column 7 of Part III for inline format row 1 choice of blank with % or numeric with %  -->
					  <td valign="top" class="styTableCell" style="width:22mm;text-align:right;">
						<xsl:choose>
						  <xsl:when test="not(VotingPowerPct) or VotingPowerPct='' ">%</xsl:when>
						  <xsl:otherwise>
							<xsl:call-template name="PopulatePercent">
							  <xsl:with-param name="TargetNode" select="VotingPowerPct"/>
							</xsl:call-template>
						  </xsl:otherwise>
						</xsl:choose>
					  </td>
					  <!--Column 8 of Part III for inline format -->
					  <td class="styTableCell" style="text-align:right;width:22mm;">
						<xsl:choose>
						  <xsl:when test="not(StockValuePct) or StockValuePct='' ">%</xsl:when>
						  <xsl:otherwise>
							<xsl:call-template name="PopulatePercent">
							  <xsl:with-param name="TargetNode" select="StockValuePct"/>
							</xsl:call-template>
						  </xsl:otherwise>
						</xsl:choose>
					  </td>
					</tr>
				  </xsl:if>
				</xsl:for-each>
				<!--END Repeating Group For Part III, Line 1, Column 3-8-->
				<!--END Part III, Line 1-->
				<!--START Part III line 2 subsidiarity Corporation Info inline format -->
				<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
				  <tr>
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
					<!-- Column 1 Part III line2 for inline format -->
					<td valign="top" class="styTableCell" style="width:10mm;font-weight:bold;text-align:left;">
					  <!-- Row to span for column 1-->
					  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingChangesForTaxYear)"/></xsl:attribute>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="CorporationNum"/>
					  </xsl:call-template>
					</td>
					<!-- Column 2 Part III line2 for inline format -->
					<td valign="top" class="styTableCell" style="width:19mm;text-align:left;">
					  <!-- Row to span for column 2-->
					  <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingChangesForTaxYear)"/></xsl:attribute>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
					  </xsl:call-template>
					  <xsl:if test="CorporationName/BusinessNameLine2Txt!=''">
						<br/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
						</xsl:call-template>
					  </xsl:if>
					</td>
					<!-- Column 3 Part III line2 for inline format -->
					<td valign="top" class="styTableCell" style="width:15mm;text-align:left;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/ShareholderOfCorporationNum"/>
					  </xsl:call-template>
					</td>
					<!-- Column 4 Part III line2 for inline format -->
					<td valign="top" class="styTableCell" style="width:21mm;text-align:center;">
					  <xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/TransactionDt"/>
					  </xsl:call-template>
					</td>
					<!-- Column 5 Part III line2 for inline format -->
					<td valign="top" class="styTableCell" style="width:35mm;text-align:left;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/SharesAcquiredCnt"/>
					  </xsl:call-template>
					</td>
					<!-- Column 6 Part III line2 for inline format -->
					<td valign="top" class="styTableCell" style="width:35mm;text-align:left;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/SharesDisposedCnt"/>
					  </xsl:call-template>
					</td>
					<!-- Column 7 Part III line2 for inline format with blank % sign and numeric % -->
					<td valign="top" class="styTableCell" style="width:22mm;text-align:right;">
					  <xsl:choose>
						<xsl:when test="not(StockHoldingChangesForTaxYear[1]/VotingPowerPct) or StockHoldingChangesForTaxYear[1]/VotingPowerPct=''">%</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulatePercent">
						    <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/VotingPowerPct"/>
						  </xsl:call-template>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<!-- Column 8 Part III line2 for inline format with blank % sign and numeric % -->
					<td valign="top" class="styTableCell" style="width:22mm;text-align:right;">
					  <xsl:choose>
						<xsl:when test="not(StockHoldingChangesForTaxYear[1]/StockValuePct) or StockHoldingChangesForTaxYear[1]/StockValuePct=''">%</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulatePercent">
							<xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/StockValuePct"/>
						  </xsl:call-template>
						</xsl:otherwise>
					   </xsl:choose>
					</td>
				  </tr>
				  <!--START Repeating Group For Part III line 2 Column 3-8-->
				  <xsl:for-each select="StockHoldingChangesForTaxYear">
					<xsl:if test="position() &gt;1">
					  <tr>
						<!-- Define background colors to the rows -->
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
						<!-- Column 3 Part III line2 for inline format -->
						<td valign="top" class="styTableCell" style="width:15mm;text-align:left;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShareholderOfCorporationNum"/>
						  </xsl:call-template>
						</td>
						<!-- Column 4 Part III line2 for inline format -->
						<td valign="top" class="styTableCell" style="width:21mm;text-align:center;">
						  <xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="TransactionDt"/>
						  </xsl:call-template>
						</td>
						<!-- Column 5 Part III line2 for inline format -->
						<td valign="top" class="styTableCell" style="width:35mm;text-align:left;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SharesAcquiredCnt"/>
						  </xsl:call-template>
						</td>
						<!-- Column 6 Part III line2 for inline format -->
						<td valign="top" class="styTableCell" style="width:35mm;text-align:left;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SharesDisposedCnt"/>
						  </xsl:call-template>
						</td>
						<!-- Column 7 Part III line2 for inline format -->
						<td valign="top" class="styTableCell" style="width:22mm;text-align:right;">
						  <xsl:choose>
							<xsl:when test="not(VotingPowerPct) or VotingPowerPct=''">%</xsl:when>
							<xsl:otherwise>
							  <xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="VotingPowerPct"/>
							  </xsl:call-template>
							</xsl:otherwise>
						  </xsl:choose>
						</td>
						<!-- Column 8 Part III line2 for inline format -->
						<td valign="top" class="styTableCell" style="width:22mm;text-align:right;">
						  <xsl:choose>
							<xsl:when test="not(StockValuePct) or StockValuePct=''">%</xsl:when>
							<xsl:otherwise>
							  <xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="StockValuePct"/>
							  </xsl:call-template>
							</xsl:otherwise>
						  </xsl:choose>
						</td>
					  </tr>
					</xsl:if>
				  </xsl:for-each>
				  <!--END Repeating Group For Part III line 2 Column 3-8-->
				</xsl:for-each>
				<!--END Part III line 2 -->
			  </tbody>
			</table>
		  </xsl:if>
		  <!--@@@SEPARATED Print for PART IV LINE 1@@@-->
		  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)">
			<br/>
			<span class="styRepeatingDataTitle">Form 851, Part IV, Line 1 - Additional Stock Information
			  <span class="styNormalText">  (see instructions)</span>:
			</span>
			<table class="styDepTbl" cellspacing="0" style="width:187mm;font-size:7pt;">
			  <tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" rowspan="1" style="width:10mm;text-align:center;font-weight:normal;">Corp. No.</th>
				<th class="styDepTblCell" scope="col" rowspan="1" style="width:89mm;text-align:center;font-weight:normal;">Name of corporation</th>
				<th class="styDepTblCell" scope="col" rowspan="1" style="width:88mm;text-align:center;font-weight:normal;">Class of stock</th>
			  </tr>
			  <tr class="styDepTblRow1" style="height:10mm;">
				<td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
				  </xsl:call-template>
				</td>
				<td valign="top" class="styTableCell" style="width:89mm;text-align:left;">
				  <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
				  </xsl:call-template>
				</td>
				<td valign="top" class="styTableCell" style="width:88mm;text-align:left;">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/StockClassDesc"/>
				  </xsl:call-template>
				</td>
			  </tr>
			  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
				<tr style="height:10mm;">
				  <!-- Define background colors to the rows -->
				  <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
				  <td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="../CorporationNum"/>
					</xsl:call-template>
				  </td>
				  <td valign="top" class="styTableCell" style="width:89mm;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="../CorporationName/BusinessNameLine2Txt!=''">
					  <br/>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2Txt"/>
					  </xsl:call-template>
					</xsl:if>
				  </td>
				  <td valign="top" class="styTableCell" style="width:80mm;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="StockClassDesc"/>
					</xsl:call-template>
				  </td>
				</tr>
			  </xsl:for-each>
			</table>
		  </xsl:if>
		  <!--@@@SEPARATED Print for PART IV LINE 2@@@-->
		  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)">
		    <br/>
			<span class="styRepeatingDataTitle">Form 851, Part IV, Line 2 - Additional Stock Information
			  <span class="styNormalText">  (see instructions)</span>:
			</span>
			<table class="styDepTbl" cellspacing="0" style="width:187mm;font-size:7pt;">
			  <thead class="styTableThead">
				<tr class="styDepTblHdr">
				  <th class="styDepTblCell" scope="col" rowspan="1" style="width:10mm;text-align:center;font-weight:normal;">Corp. No.</th>
				  <th class="styDepTblCell" scope="col" rowspan="1" style="width:89mm;text-align:center;font-weight:normal;">Name of corporation</th>
				  <th class="styDepTblCell" scope="col" rowspan="1" style="width:88mm;text-align:center;font-weight:normal;">Explanation</th>
				</tr>
			  </thead>
			  <tfoot/>
			  <tbody>
				<tr class="styDepTblRow1" style="height:10mm;">
				  <td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
					</xsl:call-template>
				  </td>
				  <td valign="top" class="styTableCell" style="width:89mm;text-align:left;">
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
					</xsl:call-template>
					<br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
					</xsl:call-template>
				  </td>
				  <!-- <xsl:if test="$Form851Data/CommonParentCorporationInfo/MemReaffiliatedWithin60MnthInd=1">
						  <td class="styTableCell" style="width:7.5mm;height:10mm;text-align:center;">
							<xsl:call-template name="PopulateYesBoxText">
							  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/MemReaffiliatedWithin60MnthInd"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styTableCell" style="width:7.5mm;height:10mm;text-align:center;">
							<span style="width:1px;"/>
						  </td>
						</xsl:if>-->
				  <td valign="top" class="styTableCell" style="width:88mm;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ExplanationTxt"/>
					</xsl:call-template>
				  </td>
				</tr>
				<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
				  <tr style="font-weight:7pt;height:10mm;">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
					<td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="../CorporationNum"/>
					  </xsl:call-template>
					</td>
					<td valign="top" class="styTableCell" style="width:89mm;text-align:left;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1Txt"/>
					  </xsl:call-template>
					  <span class="styTableCellPad"/>
					  <xsl:if test="../CorporationName/BusinessNameLine2Txt!=''">
						<br/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2Txt"/>
						</xsl:call-template>
					  </xsl:if>
					</td>
					<td valign="top" class="styTableCell" style="width:88mm;text-align:left;">
				      <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
					  </xsl:call-template>
					</td>
				  </tr>
				</xsl:for-each>
			  </tbody>
			</table>
			</xsl:if>
		  <!--@@@SEPARATED Print for PART IV LINE 3@@@-->
		  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)">
			<br/>
			<span class="styRepeatingDataTitle">Form 851, Part IV, Line 3 - Additional Stock Information
			  <span class="styNormalText">  (see instructions)</span>:
			</span>
			<table class="styDepTbl" cellspacing="0" style="width:187mm;font-size:7pt;">
			  <thead class="styTableThead">
				<tr class="styDepTblHdr">
				  <th class="styDepTblCell" scope="col" rowspan="1" style="width:10mm;text-align:center;font-weight:normal;">Corp. No.</th>
				  <th class="styDepTblCell" scope="col" rowspan="1" style="width:87mm;text-align:center;font-weight:normal;">Name of corporation</th>
				  <th class="styDepTblCell" scope="col" rowspan="1" style="width:30mm;text-align:center;font-weight:normal;">
					<b>(a)</b>
					<br/>Percentage of value
				  </th>
				  <th class="styDepTblCell" scope="col" rowspan="1" style="width:30mm;text-align:center;font-weight:normal;">
					<b>(b)</b>
					<br/>Percentage of outstanding voting stock
				  </th>
				  <th class="styDepTblCell" scope="col" rowspan="1" style="width:30mm;text-align:center;font-weight:normal;">
					<b>(c)</b>
					<br/>Percentage of voting power
				  </th>
				</tr>
			  </thead>
			  <tfoot/>
			  <tbody>
				<tr class="styDepTblRow1" style="height:10mm;">
				  <td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
					</xsl:call-template>
				  </td>
				  <td valign="top" class="styTableCell" style="width:87mm;text-align:left;">
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
					</xsl:call-template>
					<br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
					</xsl:call-template>
				  </td>
				  <!-- Common Parent Corporation Info - begin -->
				  <td valign="top" class="styTableCell" style="width:30mm;">
					<xsl:choose>
					  <xsl:when test="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/StockValuePct != ''">
						<xsl:call-template name="PopulatePercent">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/StockValuePct"/>
						</xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>%</xsl:otherwise>
					</xsl:choose>
				  </td>
				  <td valign="top" class="styTableCell" style="width:30mm;">
					<xsl:choose>
					  <xsl:when test="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/OutstandingVotingStockPct != ''">
						<xsl:call-template name="PopulatePercent">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/OutstandingVotingStockPct"/>
						</xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>%</xsl:otherwise>
					</xsl:choose>
				  </td>
				  <td valign="top" class="styTableCell" style="width:30mm;">
				    <xsl:choose>
					  <xsl:when test="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/VotingPowerPct != ''">
						<xsl:call-template name="PopulatePercent">
						  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/VotingPowerPct"/>
						</xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>%</xsl:otherwise>
					</xsl:choose>
				  </td>
				</tr>
				<!-- Common Parent Corporation Info - end -->
				<!-- Subsidiary Corporation Info - begin -->
				  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
					<tr style="height:10mm">
					  <!-- Define background colors to the rows -->
					  <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
					  <td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="../CorporationNum"/>
						</xsl:call-template>
					  </td>
					  <td valign="top" class="styTableCell" style="width:87mm;text-align:left;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<span class="styTableCellPad"/>
						<xsl:if test="../CorporationName/BusinessNameLine2Txt!=''">
						  <br/>
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2Txt"/>
						  </xsl:call-template>
						</xsl:if>
					  </td>
					  <td valign="top" class="styTableCell" style="width:30mm;">
						<xsl:choose>
						  <xsl:when test="StockValuePct != '' ">
							<xsl:call-template name="PopulatePercent">
							  <xsl:with-param name="TargetNode" select="StockValuePct"/>
							</xsl:call-template>
						  </xsl:when>
						  <xsl:otherwise>%</xsl:otherwise>
						</xsl:choose>
					  </td>
					  <td valign="top" class="styTableCell" style="width:30mm;text-align:right;">
					    <xsl:choose>
						  <xsl:when test="OutstandingVotingStockPct != '' ">
						  	<xsl:call-template name="PopulatePercent">
							  <xsl:with-param name="TargetNode" select="OutstandingVotingStockPct"/>
							</xsl:call-template>
						  </xsl:when>
						  <xsl:otherwise>%</xsl:otherwise>
						</xsl:choose>
					  </td>
					  <td valign="top" class="styTableCell" style="width:30mm;">
						<xsl:choose>
						  <xsl:when test="VotingPowerPct != '' ">
							<xsl:call-template name="PopulatePercent">
							  <xsl:with-param name="TargetNode" select="VotingPowerPct"/>
							</xsl:call-template>
						  </xsl:when>
						  <xsl:otherwise>%</xsl:otherwise>
						</xsl:choose>
					  </td>
					</tr>
				  </xsl:for-each>
				<!-- Subsidiary Corporation Info - end -->
				</tbody>
			</table>
		  </xsl:if>
		  <!--@@@SEPARATED Print for PART IV LINE 3d@@@-->
		  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)">
			<br/>
			<span class="styRepeatingDataTitle">Form 851, Part IV, Line 3d - Additional Stock Information
			  <span class="styNormalText">  (see instructions)</span>:
			</span>
			<table class="styDepTbl" cellspacing="0" style="width:187mm;font-size:7pt;">
			  <thead class="styTableThead">
				<tr class="styDepTblHdr">
				  <th class="styDepTblCell" scope="col" style="width:10mm;text-align:center;font-weight:normal;">Corp. No.</th>
				  <th class="styDepTblCell" scope="col" style="width:177mm;text-align:left;font-weight:normal;border-right:none;">
					<b>(d)</b> &#8212; Provide a description of any arrangement.
				  </th>
				</tr>
			  </thead>
			  <tfoot/>
			  <tbody>
				<tr class="styDepTblRow1">
				  <td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNum"/>
					</xsl:call-template>
				  </td>
				  <td valign="top" class="styTableCell" style="width:177mm;height:10mm;text-align:left;border-right:none;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrangementDesc"/>
					</xsl:call-template>
				  </td>
				</tr>
				<xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
				  <tr>
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
					<td valign="top" class="styTableCell" style="width:10mm;padding-right:3mm;font-weight:bold;text-align:left;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="../CorporationNum"/>
					  </xsl:call-template>
					</td>
					<td valign="top" class="styTableCell" style="width:177mm;height:10mm;text-align:left;border-right:none;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="ArrangementDesc"/>
					  </xsl:call-template>
					</td>
				  </tr>
				</xsl:for-each>
			  </tbody>
			</table>
		  </xsl:if>
		</form>
	  </body>
	</html>
	</xsl:template>
	<!-- Part I, row 3 repeating (subsidiary corp) for 5 columns -->
	<xsl:template name="PartIEmptyRows">
	  <xsl:param name="numRows" select="9 - count($Form851Data/SubsidiaryCorporationInfo)"/>
	  <xsl:if test="$numRows &gt; 0">
		<tr style="height: 10mm;">
		  <td class="styTableCell" style="width:10mm;font-weight:bold;vertical-align:bottom;text-align:center;">
			<xsl:value-of select="11 - $numRows"/>
		  </td>
		  <td class="styTableCell" style="width:81mm;"/>
		  <td class="styTableCell" style="width:32mm;"/>
		  <td class="styTableCell" style="width:32mm;"/>
		  <td class="styTableCell" style="width:32mm;border-right:none;"/>
		</tr>
		<xsl:call-template name="PartIEmptyRows">
		  <xsl:with-param name="numRows" select="$numRows - 1"/>
		</xsl:call-template>
	  </xsl:if>
	</xsl:template>
	<!-- Part II, row 3 repeating (subsidiary corp) for 9 columns and column 6-9 repeat within row -->
	<xsl:template name="PartIIEmptyRows">
	  <xsl:param name="numRows" select="9 - count($Form851Data/SubsidiaryCorporationInfo)"/>
	  <xsl:if test="$numRows &gt; 0">
		<tr style="height: 10mm;">
		  <td class="styTableCell" style="width:12mm;font-weight:bold;vertical-align:bottom;text-align:center;">
			<xsl:value-of select="11 - $numRows"/>
		  </td>
		  <td class="styTableCell" style="width:46mm;"/>
		  <td class="styTableCell" style="width:12mm;"/>
		  <td class="styTableCell" style="width:12mm;"/>
		  <td class="styTableCell" style="width:12mm;"/>
		  <!-- column 6-9 repeated within row -->
		  <td class="styTableCell" style="width:32mm;"/>
		  <td class="styTableCell" style="width:21mm;vertical-align:bottom;text-align:right;"> % </td>
		  <td class="styTableCell" style="width:21mm;vertical-align:bottom;text-align:right;"> % </td>
		  <td class="styTableCell" style="width:21mm;border-right:none;"/>
		</tr>
		<xsl:call-template name="PartIIEmptyRows">
		  <xsl:with-param name="numRows" select="$numRows - 1"/>
		</xsl:call-template>
	  </xsl:if>
	</xsl:template>
	<!-- Part III, row 3 repeating (subsidiary corp) for 8 columns and column 3-8 repeat within row -->
	<xsl:template name="PartIIIEmptyRows">
	  <xsl:param name="numRows" select="7 - count($Form851Data/SubsidiaryCorporationInfo)"/>
	  <xsl:if test="$numRows &gt; 0">
		<tr style="height: 10mm;">
		  <td valign="top" class="styTableCell" style="width:10mm;"/>
		  <td valign="top" class="styTableCell" style="width:19mm;"/>
		  <!-- column 3-8 repeated within row -->
		  <td valign="top" class="styTableCell" style="width:15mm;"/>
		  <td valign="top" class="styTableCell" style="width:21mm;"/>
		  <td valign="top" class="styTableCell" style="width:35mm;"/>
		  <td valign="top" class="styTableCell" style="width:35mm;"/>
		  <td valign="top" class="styTableCell" style="width:22mm;vertical-align:bottom;text-align:right;"> %</td>
		  <td valign="top" class="styTableCell" style="width:22mm;vertical-align:bottom;text-align:right;border-right:none;"> %</td>
		</tr>
		<xsl:call-template name="PartIIIEmptyRows">
		  <xsl:with-param name="numRows" select="$numRows - 1"/>
		</xsl:call-template>
	  </xsl:if>
	</xsl:template>
	<!-- START of Excess Codes-->
	<xsl:template name="PartIVEmptyRows">
	  <xsl:param name="numRows" select="7 - count($Form851Data/SubsidiaryCorporationInfo)"/>
	  <xsl:if test="$numRows &gt; 0">
		<xsl:choose>
		  <xsl:when test="$numRows = 1">
			<tr>
			  <td class="styTableCell" style="width:7mm;height:10mm;border-bottom:0;"/>
			  <td class="styTableCell" style="width:80mm;height:10mm;border-bottom:0;"/>
			  <td class="styTableCell" style="width:80mm;height:10mm;border-right:0;border-bottom:0;"/>
			</tr>
		  </xsl:when>
		  <xsl:otherwise>
		    <tr>
			  <td class="styTableCell" style="width:7mm;height:10mm;"/>
			  <td class="styTableCell" style="width:80mm;height:10mm;"/>
			  <td class="styTableCell" style="width:80mm;height:10mm;border-right:none;"/>
			</tr>
		  </xsl:otherwise>
		</xsl:choose>
		<xsl:call-template name="PartIVEmptyRows">
		  <xsl:with-param name="numRows" select="$numRows - 1"/>
		</xsl:call-template>
	  </xsl:if>
	</xsl:template>
	<xsl:template name="PartIVLineCEmptyRows">
	  <xsl:param name="numRows" select="7 - count($Form851Data/SubsidiaryCorporationInfo)"/>
	  <xsl:if test="$numRows &gt; 0">
		<xsl:choose>
		  <xsl:when test="$numRows = 1">
			<tr style="height:10mm;border-bottom:none;">
			  <td class="styTableCell" style="width:7mm;border-bottom:0;"/>
			  <td class="styTableCell" style="width:80mm;border-bottom:0;"/>
			  <td class="styTableCell" style="text-align:right;border-bottom:0;vertical-align:bottom;">%</td>
			  <td class="styTableCell" style="text-align:right;border-bottom:0;vertical-align:bottom;">%</td>
			  <td class="styTableCell" style="border-right:none;border-bottom:0;vertical-align:bottom;">%</td>
			</tr>
		  </xsl:when>
		  <xsl:otherwise>
			<tr style="height:10mm;border-bottom:none;">
			  <td class="styTableCell" style="width:7mm;"/>
			  <td class="styTableCell" style="width:80mm;"/>
			  <td class="styTableCell" style="text-align:right;vertical-align:bottom;">%</td>
			  <td class="styTableCell" style="text-align:right;vertical-align:bottom;">%</td>
			  <td class="styTableCell" style="border-right:none;vertical-align:bottom;">%</td>
			</tr>
		  </xsl:otherwise>
		</xsl:choose>
		<xsl:call-template name="PartIVLineCEmptyRows">
		  <xsl:with-param name="numRows" select="$numRows - 1"/>
		</xsl:call-template>
	  </xsl:if>
	</xsl:template>
	<xsl:template name="PartIVLineDEmptyRows">
	  <xsl:param name="numRows" select="7 - count($Form851Data/SubsidiaryCorporationInfo)"/>
	  <xsl:if test="$numRows &gt; 0">
		<xsl:choose>
		  <xsl:when test="$numRows = 1">
			<tr style="height:10mm;border-bottom:none;">
			  <td class="styTableCell" style="width:7mm;border-bottom:0;"/>
			  <td class="styTableCell" style="width:175mm;border-right:none;border-bottom:0;"/>
			</tr>
		  </xsl:when>
		  <xsl:otherwise>
			<tr style="height:10mm;border-bottom:none;">
			  <td class="styTableCell" style="width:7mm;"/>
			  <td class="styTableCell" style="width:175mm;border-right:none;"/>
			</tr>
		  </xsl:otherwise>
		</xsl:choose>
		<xsl:call-template name="PartIVLineDEmptyRows">
		  <xsl:with-param name="numRows" select="$numRows - 1"/>
		</xsl:call-template>
	  </xsl:if>
	</xsl:template>
	<!-- END of Excess Codes-->
	<!-- Part IV, Row 2 for line 1 and Line 2 table with 3 columns 
	<xsl:template name="PartIVEmptyRows">
	  <xsl:param name="numRows" select="7 - count($Form851Data/SubsidiaryCorporationInfo)"/>
	  <xsl:if test="$numRows &gt; 0">
		<tr>
		  <td class="styTableCell" style="width:7mm;height:10mm;"/>
		  <td class="styTableCell" style="width:80mm;height:10mm;"/>
		  <td class="styTableCell" style="width:80mm;height:10mm;border-right:none;"/>
		</tr>
		<xsl:call-template name="PartIVEmptyRows">
		  <xsl:with-param name="numRows" select="$numRows - 1"/>
		</xsl:call-template>
	  </xsl:if>
	</xsl:template>-->
	<!-- Part IV, where is line 3 table with 5 columns? -->
	<!-- Part IV, where is line 3d table with 2 columns? -->
</xsl:stylesheet>
