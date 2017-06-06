<?xml version="1.0" encoding="UTF-8"?>
<!-- 07-08-2011 - Changes made per UWR 40218 - Jeremy Nichols --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8697Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8697Data" select="$RtnDoc/IRS8697"/>
	<xsl:template match="/">
		<html xmlns="http://www.irs.gov/efile" xmlns:efile="http://www.irs.gov/efile">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8697Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8697"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS8697Style"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8697">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header Box -->
					<div class="styTBB" style="width:187mm;height:22mm;border-bottom-width: 1px;">
						<!-- Form No., etc.-->
						<div class="styFNBox" style="float:left;width:32mm;height:22mm;">
							<div style="padding-top:1mm;">
        Form<span style="width=2mm;"/>
								<span class="styFormNumber">8697</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data"/>
								</xsl:call-template>
								<br/>
							</div>
							<div style="padding-top:1.5mm; font-size:6pt;">(Rev. December 2011)</div>
							<div style="padding-top:1mm;">
								<span class="styAgency" style="font-size:6pt;width:30mm;">Department of the Treasury</span>
								<span class="styAgency" style="font-size:6pt;">Internal Revenue Service</span>
							</div>
						</div>
						<!-- Form title in header -->
						<div class="styFTBox" style="width:125mm;height:22mm;border-right: 1 solid black">
							<div class="styMainTitle">Interest Computation Under the Look-Back<br/> Method for Completed Long-Term Contracts</div>
							<div class="styFBT" style="padding-top:3mm;">
								<img src="{$ImagePath}/8697_Bullet_Md.gif" alt="bullet image pointing to right" width="8"/>
								<span style="width:38mm;font-size:7pt;">See separate instructions</span>
							</div>
						</div>
						<div style="float:left; font-size:7pt; width:30mm; padding-top:3.5mm; text-align:center; border-bottom:1 solid black; height:11mm">
          OMB No. 1545-1031
        </div>
						<div style="float:left; font-size:7pt; padding-top:2mm; padding-left:4mm">
          Attachment<br/>Sequence No. <b style="font-size:9pt">97</b>
						</div>						
					</div>
					<!-- End Header -->
					<!-- Tax year begining and ending -->
					<div class="styBB" style="width:187mm;border-top-width:1px;font-size:7pt;">
      For the filing year  
    <span style="width:1mm;"/>
						<span style="width:23mm;">
							<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
						</span>
  beginning
  <span style="width:1mm;"/>
						<span style="width:25mm;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						</span>  
    , and ending
    <span style="width:1mm;"/>
						<span style="width:25mm;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
						</span>
    . See page 4 of the instructions.
  </div>
					<!-- End Tax Year Beginning and Ending -->
					<!-- Name and identifying number -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" rowspan="3" style="width:27mm;text-align:center;font-size:7pt;height:29.5mm;font-weight:bold;border-top-width:0px;">
							<span style="height:4mm;padding-top:8mm;"/>
      Type <br/>or <br/>Print
    </div>						
						
						<div class="styNameBox" style="font-size:7pt;width:104mm;height:9.5mm;">
						   <span style="width:3px;"/>Name
      <div style="float:left;font-size:6pt;width:104mm;font-family:verdana;">
								<xsl:choose>
									<xsl:when test="$Form8697Data/PersonNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8697Data/PersonNm"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8697Data/BusinessName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="$Form8697Data/BusinessName/BusinessNameLine2!=''">
											<div style="float:left;font-size:6pt;width:104mm;font-family:verdana;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8697Data/BusinessName/BusinessNameLine2"/>
												</xsl:call-template>
											</div>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
												
												<div class="styEINBox" style="font-size:7pt;font-weight:bold;width:55mm;height:9.5mm;border-bottom-width:2px;border-top-width:2px;border-right-width:2px;border-left-width:2px;">
							<span style="width:3px;"/>A Identifying number
      <div style="float:left;width:55mm;font-weight:normal;text-align:left;padding-left:1mm;">
								<xsl:choose>
									<xsl:when test="$Form8697Data/EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form8697Data/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form8697Data/MissingEINReasonCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8697Data/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form8697Data/SSN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>	
												
						<!-- Street Address -->						
						<div style="width:104mm;height:10mm;float:left;">
							<div class="styNameBox" style="font-size:7pt;width:104mm;height:10mm;border-bottom-width:1px;border-top-width:1px;">
								<span style="width:3px;"/>
								<span style="font-family:Arial;">Number, street, and apt., room, or suite no. If a P.O. box, see page 4 of the instructions.</span>
								<div style="float:left;font-size:7pt;width:104mm;">
									<span style="width:3px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8697Data/USAddress/AddressLine1"/>
									</xsl:call-template>
									<xsl:if test="$Form8697Data/USAddress/State!=''">
										<div style="float:left;font-size:7pt;width:104mm;">
											<span style="width:3px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8697Data/USAddress/AddressLine2"/>
											</xsl:call-template>
										</div>
									</xsl:if>
								</div>
							</div>
							
											<div class="styNameBox" style="float:left;font-size:7pt;width:104mm;height:10mm;">
								<span style="width:3px;"/>City or town, state, and ZIP code
        <div style="float:left;font-size:7pt;width:104mm;">
									<span style="width:3px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8697Data/USAddress/City"/>
									</xsl:call-template>
									<xsl:if test="$Form8697Data/USAddress/State!=''">,
            <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8697Data/USAddress/State"/>
										</xsl:call-template>,
          </xsl:if>
									<xsl:if test="$Form8697Data/USAddress/ZIPCode!=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8697Data/USAddress/ZIPCode"/>
										</xsl:call-template>
									</xsl:if>
								</div>
						
						<!-- Taxpayer type is choice element -->

							</div>	
							
						</div>
													
					
								<div class="styEINBox" rowspan="2" style="text-align:center;font-face:Arial;font-size:7pt;font-weight:normal;width:55mm;height:20mm;border-top: 1 solid black;">
							<span style="width:2px;"/>
							<span style="font-weight:bold;">B</span>
							<span style="width:.5mm;"/>
							<span style="font-size:6pt;">Check applicable box to show type of taxpayer:</span>
							<span style="width:55mm;height:5mm;font-weight:normal;text-align:left;padding-top:3mm;">
								<span style="width:3mm;"/>
								<!--Corporation Checkbox -->
								<input type="checkbox" class="styCkbox" style="width:5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8697Data/CorporationInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8697Data/CorporationInd"/>
									</xsl:call-template>
									<span style="vertical-align:bottom;">Corporation</span>
								</label>
								<span style="width:3mm;"/>
								<!--S Corporation Checkbox -->
								<input type="checkbox" class="styCkbox" style="width:5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SCorporationInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SCorporationInd"/>
									</xsl:call-template>
									<span style="vertical-align:bottom;">S Corporation</span>
								</label>
							</span>
							<div style="width:55mm;font-weight:normal;text-align:left;padding-top:0.5mm;">
								<span style="width:3mm;"/>
								<!--Individual Checkbox -->
								<input type="checkbox" class="styCkbox" style="width:5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8697Data/IndividualInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8697Data/IndividualInd"/>
									</xsl:call-template>
									<span style="vertical-align:bottom;">Individual</span>
								</label>
								<span style="width:5.25mm;"/>
								<!--Partnership Checkbox -->
								<input type="checkbox" class="styCkbox" style="width:5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8697Data/PartnershipInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8697Data/PartnershipInd"/>
									</xsl:call-template>
									<span style="vertical-align:bottom;">Partnership</span>
									<span style="width:1mm;"/>
								</label>
							</div>
							<div style="width:55mm;font-weight:normal;text-align:left;padding-top:0.5mm;">
								<span style="width:3mm;"/>
								<!-- Estate or Trust Checkbox -->
								<input type="checkbox" class="styCkbox" style="width:5mm;margin-left:none;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8697Data/EstateOrTrustInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8697Data/EstateOrTrustInd"/>
									</xsl:call-template>
									<span style="vertical-align:bottom;">Estate or trust</span>
								</label>
							</div>
						</div>
			</div>	

							<!-- Line C -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:4mm;padding-top:none;">C</div>
						<div style="float:right;clear:all;width:183mm;font-size:6pt;">
      If you were an owner of an interest in a pass-through entity (such as a partnership or an S corporation)
       that holds one or more long-term contracts to which this interest computation relates, enter the name 
       and employer identification number of the entity. Attach a schedule if there is more than one such entity.
      <span style="width:20mm;float:right;"/>
						</div>
					</div>
					<xsl:variable name="part4Count" select="1"/>
					<div class="styBB" style="width:187mm;" id="TPctn">
						<xsl:call-template name="SetInitialState"/>
						<table cellspacing="0" summary="Table displaying entity name or names and corresponding employer identification numbers" style="font-size:7pt;" name="TYTable" id="TYTable">
							<tr>
								<th class="styTableCell" rowspan="1" style="width:4mm;float:left;border:none;">
									<span style="width:1px;"/>
								</th>
								<th class="styTableCell" rowspan="1" style="width:139mm;text-align:left;border-color:black;border-right-width:1px;border-bottom:none;font-weight:normal;">Name of entity <br/>
								</th>
								<th class="styTableCell" rowspan="1" style="width:44mm;text-align:center;border-color:black;border-bottom:none;border-right:none;">
									<span style="font-weight:bold;">Employer identification number<br/>
									</span>
								</th>
							</tr>
							<tr>
								<td class="styTableCell" style="width:4mm;float:left;border:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCell" style="margin-left:2mm;width:139mm;border-color:black;border-left:none;border-right-width:1px;text-align:left;border-bottom:none;font-size:6pt;font-family:verdana;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8697Data/PassThroughEntityName/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8697Data/PassThroughEntityName/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:44mm;border-color:black;text-align:left;padding-left:1mm;border-left:none;border-right:none;border-bottom:none;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form8697Data/PassThroughEntityEIN"/>
									</xsl:call-template>
									<xsl:if test="$Form8697Data/MissingEINEntityReasonCd!=' '">
										<span style="font-weight:normal;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8697Data/MissingEINEntityReasonCd"/>
											</xsl:call-template>
										</span>
									</xsl:if>
								</td>
							</tr>
						</table>
					</div>
					<!-- Part I title -->
					<div style="width:187mm;height:8mm;border-style:solid;           border-bottom-width:1px;border-top-width:0px;           border-right-width:0px;border-left-width:0px;padding-top:2mm;float:none;clear:both;">
						<span class="styPartName" style="height:2mm;">Part I</span>
						<span style="width 50mm;" class="styPartDesc">Regular Method 
						<span style="font-weight:normal"> (see instructions)</span>
						</span>
					</div>
					<xsl:variable name="PriorYearCount" select="count($Form8697Data/RegularMethodRedetermYrGrp/AdjustedTaxableIncomeForLkBck)"/>
					<xsl:variable name="FilingYearCount">
						<xsl:value-of select="count($Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt)"/>
					</xsl:variable>
					<xsl:variable name="FilingYearExists">
						<xsl:choose>
							<xsl:when test="$FilingYearCount &gt; '0'">
								<xsl:value-of select="true()"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="false()"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="($PriorYearCount  &gt; '2') and ($Print = $Separated)">
							<table style="width:187mm;" id="TP1ctn">
								<xsl:call-template name="SetInitialState"/>
								<table cellspacing="0" summary="Table located under line C, having four columns and eight rows" style="width:187mm;border-top-width:0px;font-size:7pt;border-style: solid; border-color: black;         border-bottom-width:0px;border-left-width:0px;border-right-width: 0px;">
									<tr>
										<th class="styTableCell" rowspan="1" style="width:7mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
											<span style="width:1px;"/>
										</th>
										<th class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;">
											<span style="width:1px;"/>
										</th>
										<th class="styTableCell" style="width:29mm;height:7mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
          Filing Year
        </th>
										<th class="styTableCell" colspan="2" style="width:67mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
          Redetermination Years
        </th>
										<th class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-top-width:0px;border-color:black;border-right:none;border-bottom:none;">
											<span style="float:left;width:1px;"/>
										</th>
									</tr>
									<tr>
										<th class="styTableCell" rowspan="2" style="width:7mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;">1</th>
										<th class="styForm8697TableCellDescription" rowspan="2" style="font-weight:normal;">
          Taxable income or loss for the prior years shown on tax
          return (or as previously adjusted) before net operating loss
          or capital loss carrybacks (other than carrybacks that must
          be taken into account to properly compute interest under
          section 460) (see page 4 of the instructions). If you were
          required to file Form 8697 for an earlier year, enter adjusted
          taxable income for the prior years from line 3, Form 8697,
          for the most recent filing year that affects the prior years.  
          <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">........</span>
										</th>
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
											<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														<xsl:choose>
															<xsl:when test="substring(../YearEndedDt,6,7)=''">
																<xsl:value-of select="substring(../YearEndedDt,6,7)"/>
																<span style="width:2mm;"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="substring(../YearEndedDt,6,7)"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
												</span>
												<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														<xsl:value-of select="substring(../YearEndedDt,1,4)"/>
													</xsl:for-each>
												</span>
											</span>
										</td>
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
											(a)
											
											<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
											
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">

												</span>
												<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
												</span>
											</span>
										</td>
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
										(b)
										<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
													<span style="width:2mm;"/>
												</span>
												<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
													<span style="width:2mm;"/>
												</span>
											</span>
										</td>
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-color:black;border-right:none">
											<span style="font-weight:bold;">
										(c)
									</span>
											<br/>
											<span style="text-align:center;width:20mm;">Totals</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">
            (Add columns (a)
          </span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">
            and (b).)
          </span>
										</td>
									</tr>
									<tr>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../TaxableIncomeOrLossAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp/TaxableIncomeOrLossAmt"/>
												<xsl:with-param name="ShortMessage" select="'true'"/>
											</xsl:call-template>
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1mm;"/>
										</td>
									</tr>
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">2</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Adjustment to income to reflect the difference between:
          <span style="font-weight:bold;">(a)</span> the amount of income required to be allocated for
          post-February 1986 contracts completed or adjusted
          during the tax year based on the <span style="font-weight:bold;">actual</span> contract price and
          costs, and <span style="font-weight:bold;">(b)</span> the amount of income reported for such
          contracts based on <span style="font-weight:bold;">estimated</span> contract price and costs.
          See page 4 of the instructions and attach a schedule listing
          each separate contract, unless you were an owner of an
          interest in a pass-through entity reporting this amount from
          Schedule K-1 or a similar statement             
          <!-- Form Link to Additional Data -->
											<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested with maximum digits placed a break next to it,as the space is already scarce -->
											<span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">.</span>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/IncomeAdjustmentAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../IncomeAdjustmentAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/IncomeAdjustmentAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
													<span style="width:2mm;"/>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<td class="styForm8697TableCell" rowspan="1" style="border-right:0px;border-top:1px;border-color:black;border-style:solid;">
											<span style="width:1mm;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 3 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">3</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Adjusted taxable income for look-back purposes. Combine lines 1 and 2.  If line 3 is a negative amount, see instructions.
        </td>
										<td class="styForm8697TableCell" rowspan="1">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/AdjTaxableIncomeLookBackAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../AdjTaxableIncomeLookBackAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 4 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">4</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Income tax liability on line 3 amount using tax rates in effect
          for the prior years (see page 4 of the instructions)
          <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">...</span>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxLiabilityAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../TaxLiabilityAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 5 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">5</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Income tax liability shown on return (or as previously
          adjusted) for the prior years (see page 4 of the instructions).
          If you were required to file Form 8697 for an earlier year,
          enter the amount required to be reported on line 4, Form
          8697, for the most recent filing year that affects the prior
          years <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">........</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 6 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">6</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Increase or decrease in tax for the prior years on which
          interest is due (or is to be refunded). Subtract line 5 from
          line 4.<span style="width:4mm;"/>
											<span style="letter-spacing:4mm;">.</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 7 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">7</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Interest due on increase, if any, shown on line 6 (see
          page 4 of the instructions)<span style="width:4mm;"/>
											<span style="letter-spacing:4mm;">.</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
											<span style="width:1mm;"/>
										</td>
									</tr>
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">8</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Interest to be refunded on decrease, if any, shown on
          line 6 (see page 4 of the instructions)
          <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">........</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-bottom:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
											<span style="width:1mm;"/>
										</td>
									</tr>
								</table>
							</table>
						</xsl:when>
						<xsl:otherwise>
							<table style="width:187mm;" id="TP1ctn">
								<xsl:call-template name="SetInitialState"/>
								<table cellspacing="0" summary="Table located under line C, having four columns and eight rows" style="width:187mm;border-top-width:0px;font-size:7pt;border-style: solid; border-color: black;         border-bottom-width:0px;border-left-width:0px;border-right-width: 0px;">
									<tr>
										<th class="styTableCell" rowspan="1" style="width:7mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
											<span style="width:1px;"/>
										</th>
										<th class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;">
											<span style="width:1px;"/>
										</th>
										<th class="styTableCell" style="width:29mm;height:7mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
          Filing Year
        </th>
										<th class="styTableCell" colspan="2" style="width:67mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
          Redetermination Years
        </th>
										<th class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-top-width:0px;border-color:black;border-right:none;border-bottom:none;">
											<span style="float:left;width:1px;"/>
										</th>
									</tr>
									<tr>
										<th class="styTableCell" rowspan="2" style="width:7mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;">1</th>
										<th class="styForm8697TableCellDescription" rowspan="2" style="font-weight:normal;">
          Taxable income or loss for the prior years shown on tax
          return (or as previously adjusted) before net operating loss
          or capital loss carrybacks (other than carrybacks that must
          be taken into account to properly compute interest under
          section 460) (see page 4 of the instructions). If you were
          required to file Form 8697 for an earlier year, enter adjusted
          taxable income for the prior years from line 3, Form 8697,
          for the most recent filing year that affects the prior years.  
          <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">........</span>
										</th>
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
											<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														<xsl:choose>
															<xsl:when test="substring(../YearEndedDt,6,7)=''">
																<xsl:value-of select="substring(../YearEndedDt,6,7)"/>
																<span style="width:2mm;"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="substring(../YearEndedDt,6,7)"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
												</span>
												<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														<xsl:value-of select="substring(../YearEndedDt,1,4)"/>
													</xsl:for-each>
												</span>
											</span>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/TaxableIncomeOrLossAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<!--				(a)   -->
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="$pos = 0"/>
	               (<xsl:number value="$pos" format="a"/>)<span style="width:2px"/>										
											
											<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
													<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
											
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
															<xsl:choose>
																<xsl:when test="substring(../YearEndedDt,6,7)=''">
																	<span style="width:2mm;"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="substring(../YearEndedDt,6,7)"/>
																</xsl:otherwise>
															</xsl:choose>
														</span>
														<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
															<xsl:choose>
																<xsl:when test="substring(../YearEndedDt,1,4)=''"/>
																<xsl:otherwise>
																	<xsl:value-of select="substring(../YearEndedDt,1,4)"/>
																</xsl:otherwise>
															</xsl:choose>
														</span>
													</span>
												</td>
											</xsl:if>
										</xsl:for-each> 
<!--										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
										(a)
										<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<span style="width:2mm;"/>
													</span>
													<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<span style="width:2mm;"/>
													</span>
												</span>
											</td>
										</xsl:if> 
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
												<xsl:if test="$index &lt;= 1">(b)</xsl:if>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<span style="width:2mm;"/>
													</span>
													<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<span style="width:2mm;"/>
													</span>
												</span>
											</td>
										</xsl:if>  -->
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-color:black;border-right:none">
											<span style="font-weight:bold;">
												<!--<xsl:if test="$index &lt;= 1">-->(c)<!--</xsl:if>-->
											</span>
											<br/>
											<span style="text-align:center;width:20mm;">Totals</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">
            (Add columns (a)
          </span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">
            and (b).)
          </span>
										</td>
									</tr>
									<tr>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../TaxableIncomeOrLossAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/TaxableIncomeOrLossAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../TaxableIncomeOrLossAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
	<!--									<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  -->
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1mm;"/>
										</td>
									</tr>
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">2</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Adjustment to income to reflect the difference between:
          <span style="font-weight:bold;">(a)</span> the amount of income required to be allocated for
          post-February 1986 contracts completed or adjusted
          during the tax year based on the <span style="font-weight:bold;">actual</span> contract price and
          costs, and <span style="font-weight:bold;">(b)</span> the amount of income reported for such
          contracts based on <span style="font-weight:bold;">estimated</span> contract price and costs.
          See page 4 of the instructions and attach a schedule listing
          each separate contract, unless you were an owner of an
          interest in a pass-through entity reporting this amount from
          Schedule K-1 or a similar statement             
          <!-- Form Link to Additional Data -->
											<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested with maximum digits placed a break next to it,as the space is already scarce -->
											<span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">.</span>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/IncomeAdjustmentAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../IncomeAdjustmentAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/IncomeAdjustmentAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
													<div style="text-align:left;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="../IncomeAdjustmentAmt"/>
														</xsl:call-template>
													</div>
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../IncomeAdjustmentAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
<!--										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>  
										</xsl:if>  -->
										<td class="styForm8697TableCell" rowspan="1" style="border-right:0px;border-top:1px;border-color:black;border-style:solid;">
											<xsl:choose>
												<xsl:when test="$PriorYearCount  &lt;= '2'">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalAdjustmentToIncomeAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:1mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<!-- Part 1 - Line 3 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">3</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Adjusted taxable income for look-back purposes. Combine lines 1 and 2.  If line 3 is a negative amount, see instructions.
        </td>
										<td class="styForm8697TableCell" rowspan="1">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/AdjTaxableIncomeLookBackAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../AdjTaxableIncomeLookBackAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/AdjTaxableIncomeLookBackAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../AdjTaxableIncomeLookBackAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
<!--										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  -->
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 4 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">4</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Income tax liability on line 3 amount using tax rates in effect
          for the prior years (see page 4 of the instructions)
          <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">...</span>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxLiabilityAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../TaxLiabilityAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/TaxLiabilityAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../TaxLiabilityAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
<!--										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  -->
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 5 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">5</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Income tax liability shown on return (or as previously
          adjusted) for the prior years (see page 4 of the instructions).
          If you were required to file Form 8697 for an earlier year,
          enter the amount required to be reported on line 4, Form
          8697, for the most recent filing year that affects the prior
          years <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">........</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/FederalIncomeTaxLiabilityAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../FederalIncomeTaxLiabilityAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
<!--										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  -->
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 6 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">6</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Increase or decrease in tax for the prior years on which
          interest is due (or is to be refunded). Subtract line 5 from
          line 4.<span style="width:4mm;"/>
											<span style="letter-spacing:4mm;">.</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/IncreaseOrDecreaseInTxForPYAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../IncreaseOrDecreaseInTxForPYAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
<!--										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  -->
										<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 7 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">7</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Interest due on increase, if any, shown on line 6 (see
          page 4 of the instructions)<span style="width:4mm;"/>
											<span style="letter-spacing:4mm;">.</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/InterestDueOnIncreaseAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../InterestDueOnIncreaseAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
<!--										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  -->
										<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
											<xsl:choose>
												<xsl:when test="$PriorYearCount  &lt;= '2'">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalInterestDueOnIncreaseAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:1mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<!-- Part I - Line 8  -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">8</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
          Interest to be refunded on decrease, if any, shown on
          line 6 (see page 4 of the instructions)
          <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">........</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-bottom:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/InterestToBeRefundedOnDecrAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../InterestToBeRefundedOnDecrAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
<!--										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  -->
										<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
											<xsl:choose>
												<xsl:when test="$PriorYearCount  &lt;= '2'">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalInterestToBeRefundedAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:1mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</table>
							</table>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="($PriorYearCount  &gt; '2') and ($Print != $Separated)">
						<xsl:call-template name="Page1">
							<xsl:with-param name="MaxPages" select="ceiling($PriorYearCount div 2)"/>
							<xsl:with-param name="StartingPage" select="2"/>
						</xsl:call-template>
					</xsl:if>
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!-- END PAGE 2 -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:5mm;padding-left:1.5mm;">9</div>
						<div class="styLNDesc" style="width:152.25mm;height:4mm;padding-left:1mm;">
						Net amount of <span style="font-weight:bold;">interest to be refunded to you.</span>
						 If line 8, column (c), exceeds line 7, column (c), enter the excess. File
      Form 8697 separately; 
      <span style="font-weight:bold;">do not</span>
       attach it to your tax return (see page 5 of the instructions)
       <span style="width:5mm;"/>
							<span style="letter-spacing:4mm;">.....</span>
						</div>
						<div class="styLNAmountBox" style="float:right;clear:all;border-top-width:0px;width:30mm;height:7.5mm;"/>
					</div>
					<!-- Line 10 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:5mm;padding-left:.5mm;">10</div>
						<div class="styLNDesc" style="width:152.25mm;height:4mm;padding-left:1mm;">
      Net amount of <span style="font-weight:bold;">interest you owe.</span> If line 7, column (c), exceeds line 8, column (c), enter the excess. Attach
      Form 8697 to your tax return. See page 5 of the instructions for where to include this amount on your return
      <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">...</span>
						</div>
						<div class="styLNAmountBox" style="float:right;clear:all;border-top-width:0px;border-bottom:none;width:30mm;height:7.5mm;">
							<span style="width:30mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/NetAmtOfInterestOwedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Footer line -->
					<div style="  clear:both;width:187mm;">
						<span style="font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see page 7 of the instructions.</span>
						<span style="width:6mm;"/>
    Cat. No. 64598V
    <span style="width:5mm;"/>
    Form 
    <span style="font-size:9pt;font-weight:bold;">8697</span> (Rev. 12-2011)
  </div>
					<div style="page-break-after:always"/>
					<!-- End Footer Line -->
					<!-- Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Form 8697 (Rev. 12-2011)<span style="width:130mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;">2</span>
						</div>
					</div>
					<!-- End of Header -->
					<!-- Part II title -->
					<div style="width:187mm;height:8mm;border-style:solid;           border-bottom-width:1px;border-top-width:0px;           border-right-width:0px;border-left-width:0px;padding-top:2mm;float:left;">
						<span class="styPartName" style="height:2mm;">Part II</span>
						<span style="width:100mm; height: 2mm;" class="styPartDesc">Simplified Marginal Impact Method (see instructions)
    </span>
					</div>
					<!-- Display all repeating elements when the Print parameter is not Separated. If the Print parameter is Separated, -->
					<!-- but the number of elements is less than the container size, then also display all elements -->
					<xsl:if test="($Print != $Separated) or (count($Form8697Data/SimplifiedMethodComputation) &lt;= 3)">
						<!--Determine how many times to repeat Part II table-->
						<xsl:variable name="Part2Count" select="count($Form8697Data/SimplifiedMethodComputation)"/>
						<xsl:variable name="Part2PreMax">
							<xsl:choose>
								<xsl:when test="$Part2Count mod 3 = 0">
									<xsl:value-of select="$Part2Count div 3"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="ceiling($Part2Count div 3)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:call-template name="part2Table">
							<xsl:with-param name="Part2Max">
								<xsl:choose>
									<!-- Check to see if there are exactly three records -->
									<xsl:when test="$Part2PreMax = 0">
										<xsl:value-of select="1"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$Part2PreMax"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<!-- When the Print parameter is Separated and there are more elements than the container size, then display a -->
					<!-- blank section and direct the user to the addtional data table -->
					<xsl:if test="($Print = $Separated) and (count($Form8697Data/SimplifiedMethodComputation) &gt; 3)">
						<xsl:call-template name="part2Table">
							<xsl:with-param name="index" select="0"/>
							<xsl:with-param name="Part2Max" select="0"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:5mm;padding-left:0mm;">10</div>
						<div class="styLNDesc" style="width:152.25mm;height:4mm;">
      Net amount of <span style="font-weight:bold;">interest to be refunded to you.</span> If line 9, column (d), exceeds line 8, column (d), enter the excess. File
      Form 8697 separately; <span style="font-weight:bold;">do not</span> attach it to your tax return (see page 6 of the instructions)<span style="width:px;"/>
							<span style="letter-spacing:4mm;">......</span>
						</div>
						<div class="styLNAmountBox" style="float:right;clear:all;border-top-width:0px;width:30mm;height:7.5mm;">
							<span style="width:1px;"/>
<!--							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthdGrp/TotalInterestToBeRefunded"/>
							</xsl:call-template>	-->						
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:5mm;padding-left:0mm;">11</div>
						<div class="styLNDesc" style="width:152.25mm;height:4mm;">      
      Net amount of <span style="font-weight:bold;">interest you owe.</span> If line 8, column (d), exceeds line 9, column (d), enter the excess. Attach
      Form 8697 to your tax return. See page 6 of the instructions for where to include this amount on your return<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">....</span>
						</div>
						<div class="styLNAmountBox" style="float:right;clear:all;border-top-width:0px;border-bottom:none;width:30mm;height:7.5mm;">
							<span style="width:30mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthdGrp/NetAmtOfInterestOwedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="page-break-after:always"/>
					<!-- Begin Signature Section -->
					<!-- Implementing the Signature Section in table -->
					<div class="styBB" style="width:187mm;">
						<span style="font-size: 9pt">
							<b>Signature(s)</b> Complete this section <b>only</b> if this form is being filed separately.</span>
					</div>
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;clear:both;">
						<tr>
							<td rowspan="3" style="width:18mm;font-size: 11pt;font-weight:bold;border-right:1 solid black;border-bottom:1 solid black;">Sign Here</td>
							<td colspan="4" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this form, including accompanying schedules and statements, and to the best of my
knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer
has any knowledge. </td>
						</tr>
						<tr>
							<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
								<img src="{$ImagePath}/8697_Bullet_Lg.gif" alt="Big Right Arrow"/>
							</td>
							<td style="width:103mm;border-bottom:1 solid black;vertical-align:bottom;">
      Your signature<br/>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width:53mm;border-top:0px; border-right:0px; border-left:1px; border-bottom:1px; border-style:solid; border-color:black;vertical-align:bottom;">
      Date<br/>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td style="width:103mm;border-bottom:1 solid black;vertical-align:bottom;">
      Spouse's signature.  If a joint return, both must sign.<br/>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width:53mm;border-top:0px; border-right:0px; border-left:1px; border-bottom:1px; border-style:solid; border-color:black;vertical-align:bottom;">
      Date<br/>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- End Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the Preparer section in table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;border-bottom:1 solid black;">
						<tr>
							<!--row 1-->
							<td rowspan="3" style="width:22mm;font-size:14pt;font-weight:bold;font-family:'arial narrow';border-right:1 solid black;border-bottom:1 solid black;text-align:left;">Paid Preparer Use Only</td>
							<td style="width:43mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">Print/Type preparer's name
                <br/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
							</td>
							<td style="width:55mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">Preparer's signature
                <br/>
								<span style="width:2px;"/>
							</td>
							<td style="width:24mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">
				Date <br/>
								<span style="text-align:center; padding-left:7mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="width:19mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;vertical-align:bottom;padding-bottom:.5mm;">
								<nobr>
									<label for="dummyid1">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>Check  
				  </label>
								</nobr>
								<input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
								</input>
                if <br/> self-employed
              </td>
							<td style="width:35mm;border-bottom:1 solid black;padding-left:1mm;">PTIN
                <br/>
								<span style="text-align:center;padding-left:10mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<!--row 2-->
							<td rowspan="1" colspan="4" style="border-bottom:1 solid black;border-right:1 solid black;padding-left:.5mm;">Firm's name
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-left:16mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="border-bottom:1 solid black;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<!--row 3-->
							<td rowspan="1" colspan="4" style="border-bottom:1 solid black;border-right:1 solid black;padding-left:.5mm;">Firm's address
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">Country</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="border-bottom:1 solid black;padding-left:1mm;"> Phone no. 
				<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Footer line -->
					<div style="  clear:both;width:187mm;text-align:center;padding-top:1.5mm;">
  </div>
					<!-- End Footer Line -->
					<br class="pageEnd"/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
        Additional Data        
      </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8697Data"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table for Separated Data from Part I -->
					<xsl:if test="($Print = $Separated) and (count($Form8697Data/RegularMethodFilingYrGrp) &gt; 3)">
						<span class="styRepeatingDataTitle">
							<br/>Form 8697, Part I - Regular Method:
    </span>
						<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="$pos mod 3 = 1">
								<table class="styDepTbl" style="font-size:7pt">
									<thead class="styTableThead">
										<tr class="styDepTblHdr">
											<th class="styDepTblCell" style="width:4mm;border-right:none;">
												<span style="width:1px;"/>
											</th>
											<th class="styDepTblCell" style="width:67mm;border-left:none;">
												<span style="width:1px;"/>
											</th>
											<th class="styDepTblCell" colspan="3" style="width:87mm;text-align:center;">
                Date of each prior year to which interest <br/>computation relates:
              </th>
											<th class="styDepTblCell" style="width:29mm;">
												<span style="float:left;width:1px;"/>
											</th>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<!-- Line 1 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" rowspan="2" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">1</td>
											<td class="styDepTblCell" rowspan="2" style="width:67mm;text-align:left;border-left:none;">
                Taxable income or loss for the prior years shown on tax
                return (or as previously adjusted) before net operating loss
                or capital loss carrybacks (other than carrybacks that must
                be taken into account to properly compute interest under
                section 460) (see page 4 of the instructions). If you were
                required to file Form 8697 for an earlier year, enter adjusted
                taxable income for the prior years from line 3, Form 8697,
                for the most recent filing year that affects the prior years.
              </td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;font-weight:bold;">
                (<xsl:number value="$pos" format="a"/>)<span style="width:2px"/>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
                  <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp[$pos]/YearEndedDt,6,7)"/>
													</span>
													<span style="width:1mm;"/>yr.
                  <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp[$pos]/YearEndedDt,1,4)"/>
													</span>
												</span>
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;font-weight:bold;">
                (<xsl:number value="$pos+1" format="a"/>)<span style="width:2px"/>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
                  <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp[$pos + 1]/YearEndedDt,6,7)"/>
													</span>
													<span style="width:1mm;"/>yr.
                  <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp[$pos + 1]/YearEndedDt,1,4)"/>
													</span>
												</span>
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;font-weight:bold;">
                (<xsl:number value="$pos+2" format="a"/>)<span style="width:2px"/>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
                  <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp[$pos +2 ]/YearEndedDt,6,7)"/>
													</span>
													<span style="width:1mm;"/>yr.
                  <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp[$pos + 2]/YearEndedDt,1,4)"/>
													</span>
												</span>
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;">
												<xsl:if test="$pos = 1">
													<span style="text-align:center;width:20mm;">Totals</span>
													<span style="float:left;clear:all;width:29mm;font-weight:normal">(Add columns (a),</span>
													<span style="float:left;clear:all;width:29mm;font-weight:normal">(b), and (c).)</span>
												</xsl:if>
											</td>
										</tr>
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos]/TaxableIncomeOrLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos + 1]/TaxableIncomeOrLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos + 2]/TaxableIncomeOrLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-bottom:none"/>
										</tr>
										<!-- Line 2 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">2</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Adjustment to income to reflect the difference between:
                <span style="font-weight:bold;">(a)</span> the amount of income required to be allocated for
                post-February 1986 contracts completed or adjusted
                during the tax year based on the <span style="font-weight:bold;">actual</span> contract price and
                costs, and <span style="font-weight:bold;">(b)</span> the amount of income reported for such
                contracts based on <span style="font-weight:bold;">estimated</span> contract price and costs.
                See page 4 of the instructions and attach a schedule listing
                each separate contract, unless you were an owner of an
                interest in a pass-through entity reporting this amount from
                Schedule K-1 or a similar statement.
              </td>
											<td class="styDepTblCell" style="vertical-align:bottom;text-align:right;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos]/IncomeAdjustmentAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos]/IncomeAdjustmentAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="vertical-align:bottom;text-align:right;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos+1]/IncomeAdjustmentAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos + 1]/IncomeAdjustmentAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="vertical-align:bottom;text-align:right;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos+2]/IncomeAdjustmentAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos + 2]/IncomeAdjustmentAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="vertical-align:bottom;text-align:right;width:29mm">
												<xsl:choose>
													<xsl:when test="$pos = 1">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalAdjustmentToIncomeAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1mm;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!-- Line 3 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">3</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Adjusted taxable income for look-back purposes. Combine lines 1 and 2
                <span style="width:2mm;"/>
												<span style="letter-spacing:4mm;">.</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos]/AdjTaxableIncomeForLookBack"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos + 1]/AdjTaxableIncomeForLookBack"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos + 2]/AdjTaxableIncomeForLookBack"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 4 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">4</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Income tax liability on line 3 amount using tax rates in effect for the prior years (see page 4 of the instructions)
              </td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos]/TaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos + 1]/TaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$pos + 2]/TaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 5 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">5</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Income tax liability shown on return (or as previously
                adjusted) for the prior years (see page 4 of the instructions).
                If you were required to file Form 8697 for an earlier year,
                enter the amount required to be reported on line 4, Form
                8697, for the most recent filing year that affects the prior
                years <span style="width:2mm;"/>
												<span style="letter-spacing:4mm;">...</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos]/FederalIncomeTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos + 1]/FederalIncomeTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos + 2]/FederalIncomeTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 6 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">6</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Increase or decrease in tax for the prior years on which
                interest is due (or is to be refunded). Subtract line 5 from
                line 4<span style="width:4mm;"/>
												<span style="letter-spacing:4mm;">........</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos]/IncreaseOrDecreaseInTxForPYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos + 1]/IncreaseOrDecreaseInTxForPYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos + 2]/IncreaseOrDecreaseInTxForPYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;"/>
										</tr>
										<!-- Line 7 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">7</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Interest due on increase, if any, shown on line 6 (see
                page 4 of the instructions)<span style="width:4mm;"/>
												<span style="letter-spacing:4mm;">.......</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos]/InterestDueOnIncreaseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos + 1]/InterestDueOnIncreaseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos + 2]/InterestDueOnIncreaseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<!-- If this is the first Part I Table, then display the total amounts in the (d) column -->
												<xsl:if test="$pos = 1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalInterestDueOnIncreaseAmt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$pos != 1">
													<span style="width:1mm;"/>
												</xsl:if>
											</td>
										</tr>
										<!-- Line 8 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">8</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Interest to be refunded on decrease, if any, shown on
                line 6 (see page 4 of the instructions)
                <span style="width:2mm;"/>
												<span style="letter-spacing:4mm;">.......</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos]/InterestToBeRefundedOnDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos + 1]/InterestToBeRefundedOnDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$pos + 2]/InterestToBeRefundedOnDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<!-- If this is the first Part I Table, then display the total amounts in the (d) column -->
												<xsl:if test="$pos = 1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalInterestToBeRefundedAmt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$pos != 1">
													<span style="width:1mm;"/>
												</xsl:if>
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- End of Part I separated data -->
					<!-- Additional Data Table for Separated Data from  -->
					<xsl:if test="($Print = $Separated) and (count($Form8697Data/SimplifiedMethodComputation) &gt; 3)">
						<span class="styRepeatingDataTitle">
							<br/>Form 8697, Part II - Simplified Marginal Impact Method:
    </span>
						<xsl:for-each select="$Form8697Data/SimplifiedMethodComputation">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="$pos mod 3 = 1">
								<table class="styDepTbl" style="font-size:7pt">
									<thead class="styTableThead">
										<tr class="styDepTblHdr">
											<th class="styDepTblCell" style="width:4mm;border-right:none;">
												<span style="width:1px;"/>
											</th>
											<th class="styDepTblCell" style="width:67mm;border-left:none">
												<span style="width:1px;"/>
											</th>
											<th class="styDepTblCell" colspan="3" style="width:87mm;text-align:center;">
                Date of each prior year to which interest <br/>computation relates:
              </th>
											<th class="styDepTblCell" style="width:29mm;">
												<span style="float:left;width:1px;"/>
											</th>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<!-- Line 1 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" rowspan="2" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">1</td>
											<td class="styDepTblCell" rowspan="2" style="width:67mm;text-align:left;border-left:none;">
                Adjustment to regular taxable income to reflect the
                difference between: <span style="font-weight:bold;">(a)</span> the amount of such income required
                to be allocated for post-February 1986 contracts
                completed or adjusted during the tax year based on <span style="font-weight:bold;">actual</span>
                contract price and costs, and <span style="font-weight:bold;">(b)</span> the amount of such
                income reported for such contracts based on <span style="font-weight:bold;">estimated</span>
                contract price and costs. See page 6 of the instructions
                and attach a schedule listing each separate contract,
                unless you were an owner of an interest in a pass-through
                entity reporting this amount from Schedule K-1 or a similar
                statement
                <span style="width:6px;"/>
												<span style="letter-spacing:4mm;">........</span>
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;font-weight:bold;">
                (<xsl:number value="$pos" format="a"/>)<span style="width:2px"/>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
                  <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$pos]/YearEndedDt,6,7)"/>
													</span>
													<span style="width:1mm;"/>yr.
                  <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$pos]/YearEndedDt,1,4)"/>
													</span>
												</span>
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;font-weight:bold;">
                (<xsl:number value="$pos+1" format="a"/>)<span style="width:2px"/>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
                  <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$pos + 1]/YearEndedDt,6,7)"/>
													</span>
													<span style="width:1mm;"/>yr.
                  <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$pos + 1]/YearEndedDt,1,4)"/>
													</span>
												</span>
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;font-weight:bold;">
                (<xsl:number value="$pos+2" format="a"/>)<span style="width:2px"/>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
                  <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$pos + 2]/YearEndedDt,6,7)"/>
													</span>
													<span style="width:1mm;"/>yr.
                  <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$pos + 2]/YearEndedDt,1,4)"/>
													</span>
												</span>
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;">
												<xsl:if test="$pos = 1">
													<span style="text-align:center;width:20mm;">Totals</span>
													<span style="float:left;clear:all;width:29mm;font-weight:normal">(Add columns (a),</span>
													<span style="float:left;clear:all;width:29mm;font-weight:normal">(b), and (c).)</span>
												</xsl:if>
											</td>
										</tr>
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/RegularTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/RegularTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/RegularTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/RegularTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/RegularTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/RegularTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-bottom:none"/>
										</tr>
										<!-- Line 2 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">2</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Increase or decrease in regular tax for prior years. Multiply
                line 1 in each column by the applicable regular tax rate (see
                page 6 of the instructions)
              </td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/PriorYearRegTaxIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/PriorYearRegTaxIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/PriorYearRegTaxIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 3 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;padding-top:10.5mm;">3</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
												<span style="font-weight:bold;">Note:</span>
												<span style="width:1mm;"/>
												<i>For prior years beginning before 1987, skip lines 3 and 4 and enter on line 5 the amount from line 2.</i>
												<br/>Adjustment to alternative minimum taxable income to
                reflect the difference between: <span style="font-weight:bold;">(a)</span> the amount of such
                income required to be allocated for post-February 1986
                contracts completed or adjusted during the tax year based
                on <span style="font-weight:bold;">actual</span> contract price and costs, and <span style="font-weight:bold;">(b)</span> 
                the amount of such income reported for such contracts based on
                <span style="font-weight:bold;">estimated</span> contract price and costs. See page 6 of the
                instructions and attach a schedule listing each separate
                contract, unless you were an owner of an interest in a
                pass-through entity reporting this amount from Schedule
                K-1 or a similar statement 
              </td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/AltMinTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/AltMinTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/AltMinTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/AltMinTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/AltMinTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/AltMinTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 4 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">4</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Increase or decrease in alternative minimum tax (AMT) for
                prior years. Multiply line 3 in each column by the applicable
                AMT rate (see page 6 of the instructions)
                <span style="width:2mm;"/>
												<span style="letter-spacing:4mm;">......</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/PriorYearAMTIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/PriorYearAMTIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/PriorYearAMTIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Part II Line 5 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">5</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">          
                Enter the <span style="font-weight:bold;">larger</span> of line 2 or line 4. See page 4 of the
                instructions if either amount is negative
                <span style="width:2mm;"/>
												<span style="letter-spacing:4mm;">.....</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/AdjustmentToTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/AdjustmentToTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/AdjustmentToTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 6 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;padding-top:7.5mm">6</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
												<span style="font-weight:bold;">Pass-through entities:</span>
												<span style="width:2px;"/>
												<i>Skip line 6 and enter on line 7 the amount from line 5.</i>
												<br/>
                Overpayment ceiling. For each column in which line 5 is a
                negative number, enter your total tax liability for the prior
                year, as adjusted for past applications of the look-back
                method and after net operating loss, capital loss, net
                section 1256 contracts loss, and credit carryovers and
                carrybacks to that year. For each column in which line 5 is
                a positive number, leave line 6 blank and enter on line 7
                the amount from line 5
              </td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/OverpaymentCeilingAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/OverpaymentCeilingAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/OverpaymentCeilingAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 7 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">7</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Increase or decrease in tax for the prior years on which
                interest is due (or is to be refunded). Enter the amount from
                line 5 or line 6, whichever is smaller. Treat both numbers
                as positive when making this comparison, but enter the
                amount as a negative number.
                <span style="width:2mm;"/>
												<span style="letter-spacing:4mm;">........</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/IncreaseOrDecreaseInTxForPYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/IncreaseOrDecreaseInTxForPYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/IncreaseOrDecreaseInTxForPYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none"/>
										</tr>
										<!-- Line 8 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">8</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Interest due on increase, if any, shown on line 7 (see page
                6 of the instructions)<span style="width:2mm;"/>
												<span style="letter-spacing:4mm;">.......</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/InterestDueOnIncreaseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/InterestDueOnIncreaseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/InterestDueOnIncreaseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<span style="width:1mm;"/>
												<!-- If this is the first Part II Table, then display the total amounts in the (d) column -->
												<xsl:if test="$pos = 1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthGrp/TotalInterestDueOnIncreaseAmt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
										<!-- Line 9 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">9</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
                Interest to be refunded on decrease, if any, shown on
                line 7 (see page 6 of the instructions)<span style="width:px;"/>
												<span style="letter-spacing:4mm;">.......</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/InterestToBeRefundedOnDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/InterestToBeRefundedOnDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/InterestToBeRefundedOnDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<span style="width:1mm;"/>
												<!-- If this is the first Part II Table, then display the amounts in the (d) column -->
												<xsl:if test="$pos = 1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthdGrp/TotalInterestToBeRefundedAmt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- End of Part II separated data -->
				</form>
			</body>
		</html>
	</xsl:template>
	<!--Part I recurring table -->
	<xsl:template name="part1Table">
		<xsl:param name="index" select="1"/>
		<xsl:param name="Part1Max"/>
		<xsl:if test="$index &lt;= $Part1Max">
			<table style="width:187mm;" id="TP1ctn">
				<xsl:call-template name="SetInitialState"/>
				<table cellspacing="0" summary="Table located under line C, having four columns and eight rows" style="width:187mm;border-top-width:0px;font-size:7pt;border-style: solid; border-color: black;         border-bottom-width:0px;border-left-width:0px;border-right-width: 0px;">
					<tr>
						<th class="styTableCell" rowspan="1" style="width:7mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</th>
						<th class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;">
							<span style="width:1px;"/>
						</th>
						<th class="styTableCell" style="width:29mm;height:7mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
          Filing Year
        </th>
						<th class="styTableCell" colspan="2" style="width:67mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
          Redetermination Years
        </th>
						<th class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-top-width:0px;border-color:black;border-right:none;border-bottom:none;">
							<span style="float:left;width:1px;"/>
						</th>
					</tr>
					<tr>
						<th class="styTableCell" rowspan="2" style="width:7mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;">1</th>
						<th class="styForm8697TableCellDescription" rowspan="2" style="font-weight:normal;">
          Taxable income or loss for the prior years shown on tax
          return (or as previously adjusted) before net operating loss
          or capital loss carrybacks (other than carrybacks that must
          be taken into account to properly compute interest under
          section 460) (see page 4 of the instructions). If you were
          required to file Form 8697 for an earlier year, enter adjusted
          taxable income for the prior years from line 3, Form 8697,
          for the most recent filing year that affects the prior years.  
          <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">........</span>
						</th>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
           <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/RegularMethodFilingYrGrp[$index*3-2]/YearEndedDt,6,7)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp[$index*3-2]/YearEndedDt,6,7)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
								<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/RegularMethodFilingYrGrp[$index*3-2]/YearEndedDt,1,4)=''">
											<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp[$index*3-2]/YearEndedDt,1,4)"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp[$index*3-2]/YearEndedDt,1,4)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index &lt;= 1">(a)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/YearEndedDt,6,7)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/YearEndedDt,6,7)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
								<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/YearEndedDt,1,4)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/YearEndedDt,1,4)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index &lt;= 1">(b)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/RegularMethodRedetermYrGrp[$index*3]/YearEndedDt,6,7)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/RegularMethodRedetermYrGrp[$index*3]/YearEndedDt,6,7)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
								<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/RegularMethodRedetermYrGrp[$index*3]/YearEndedDt,1,4)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/RegularMethodRedetermYrGrp[$index*3]/YearEndedDt,1,4)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-color:black;border-right:none">
							<span style="font-weight:bold;">
								<xsl:if test="$index &lt;= 1">(c)</xsl:if>
							</span>
							<br/>
							<span style="text-align:center;width:20mm;">Totals</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">
            (Add columns (a)
          </span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">
            and (b).)
          </span>
						</td>
					</tr>
					<tr>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<xsl:if test="$index=0 and $Part1Max=0">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form8697Data/TaxableIncomeOrLossAmt"/>
									<xsl:with-param name="ShortMessage" select="'true'"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$index*3-2]/TaxableIncomeOrLossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/TaxableIncomeOrLossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3]/TaxableIncomeOrLossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1mm;"/>
						</td>
					</tr>
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">2</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
          Adjustment to income to reflect the difference between:
          <span style="font-weight:bold;">(a)</span> the amount of income required to be allocated for
          post-February 1986 contracts completed or adjusted
          during the tax year based on the <span style="font-weight:bold;">actual</span> contract price and
          costs, and <span style="font-weight:bold;">(b)</span> the amount of income reported for such
          contracts based on <span style="font-weight:bold;">estimated</span> contract price and costs.
          See page 4 of the instructions and attach a schedule listing
          each separate contract, unless you were an owner of an
          interest in a pass-through entity reporting this amount from
          Schedule K-1 or a similar statement             
          <!-- Form Link to Additional Data -->
							<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested with maximum digits placed a break next to it,as the space is already scarce -->
							<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">.</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$index*3-2]/IncomeAdjustmentAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$index*3-2]/IncomeAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/IncomeAdjustmentAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/IncomeAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3]/IncomeAdjustmentAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3]/IncomeAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" style="border-right:0px;border-top:1px;border-color:black;border-style:solid;">
							<xsl:choose>
								<xsl:when test="$index = $Part1Max">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotalAdjustmentToIncomeAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<span style="width:1mm;"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<!-- Part 1 - Line 3 -->
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">3</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
          Adjusted taxable income for look-back purposes. Combine lines 1 and 2.  If line 3 is a negative amount, see instructions.
        </td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$index*3-2]/AdjTaxableIncomeForLookBack"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/AdjTaxableIncomeForLookBack"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3]/AdjTaxableIncomeForLookBack"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 4 -->
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">4</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
          Income tax liability on line 3 amount using tax rates in effect
          for the prior years (see page 4 of the instructions)
          <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">...</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp[$index*3-2]/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3]/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 5 -->
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">5</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
          Income tax liability shown on return (or as previously
          adjusted) for the prior years (see page 4 of the instructions).
          If you were required to file Form 8697 for an earlier year,
          enter the amount required to be reported on line 4, Form
          8697, for the most recent filing year that affects the prior
          years <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">........</span>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/PriorYearIncomeTaxLiability"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3]/PriorYearIncomeTaxLiability"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 6 -->
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">6</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
          Increase or decrease in tax for the prior years on which
          interest is due (or is to be refunded). Subtract line 5 from
          line 4.<span style="width:4mm;"/>
							<span style="letter-spacing:4mm;">.</span>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/PriorYearTaxIncreaseOrDecrease"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3]/PriorYearTaxIncreaseOrDecrease"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 7 -->
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">7</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
          Interest due on increase, if any, shown on line 6 (see
          page 4 of the instructions)<span style="width:4mm;"/>
							<span style="letter-spacing:4mm;">.</span>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/InterestDueOnIncrease1"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3]/InterestDueOnIncrease1"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
							<xsl:choose>
								<xsl:when test="$index = $Part1Max">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotalInterestDueOnIncreaseAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<span style="width:1mm;"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">8</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
          Interest to be refunded on decrease, if any, shown on
          line 6 (see page 4 of the instructions)
          <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">........</span>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-bottom:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3-1]/InterestToBeRefundedOnDecr1"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*3]/InterestToBeRefundedOnDecr1"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
							<xsl:choose>
								<xsl:when test="$index = $Part1Max">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotalInterestToBeRefundedAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<span style="width:1mm;"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
				<xsl:if test="$index != $Part1Max">
					<xsl:choose>
						<xsl:when test="$index = 1">
							<div style="page-break-after:always"/>
						</xsl:when>
						<xsl:otherwise>
        </xsl:otherwise>
					</xsl:choose>
					<br/>
					<div style="width:187mm;">
						<span style="width:65mm;float:left;clear:none;"/>
						<span style="width:122.75mm;float:right;clear:none;border-style:solid;border-top-width:0px;border-right-width:0px;               border-left-width:0px;border-bottom-width:1px;border-color:black;"/>
					</div>
				</xsl:if>
				<xsl:call-template name="part1Table">
					<xsl:with-param name="index" select="$index+1"/>
					<xsl:with-param name="Part1Max" select="$Part1Max"/>
				</xsl:call-template>
			</table>
		</xsl:if>
	</xsl:template>
	<!--Part II recurring table -->
	<xsl:template name="part2Table">
		<xsl:param name="index" select="1"/>
		<xsl:param name="Part2Max"/>
		<xsl:if test="$index &lt;= $Part2Max">
			<table style="width:187mm;" id="TP2ctn">
				<xsl:call-template name="SetInitialState"/>
				<table cellspacing="0" summary="Table located under Part 2, having four columns and eight rows" style="width:187mm;border-top-width:0px;font-size:7pt;border-style: solid; border-color: black;border-bottom-width:0px;border-left-width:0px;border-right-width: 0px;" name="TYTable" id="TYTable">
					<tr>
						<th class="styTableCell" rowspan="1" style="width:7mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</th>
						<th class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;">
							<span style="width:1px;"/>
						</th>
						<th class="styTableCell" colspan="3" style="width:96mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
							<span style="width:12mm;"/>Date of each prior year to which interest <br/>
							<span style="width:15mm;"/>computation relates:</th>
						<th class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-color:black;border-right:none;border-top-width:0px;border-bottom:none;">
							<span style="float:left;width:1px;"/>
						</th>
					</tr>
					<tr>
						<th class="styTableCell" rowspan="2" style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">1</th>
						<th class="styTableCell" rowspan="2" style="width:80mm;text-align:left;font-weight:normal;border-color:black;border-bottom:none;padding-right:1mm;">
          Adjustment to regular taxable income to reflect the
          difference between: <span style="font-weight:bold;">(a)</span> the amount of such income required
          to be allocated for post-February 1986 contracts
          completed or adjusted during the tax year based on <span style="font-weight:bold;">actual</span>
          contract price and costs, and <span style="font-weight:bold;">(b)</span> the amount of such
          income reported for such contracts based on <span style="font-weight:bold;">estimated</span>
          contract price and costs. See page 6 of the instructions
          and attach a schedule listing each separate contract,
          unless you were an owner of an interest in a pass-through
          entity reporting this amount from Schedule K-1 or a similar
          statement           
          <!-- Form Link to Additional Data -->
							<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested with maximum digits placed a break next to it,as the space is already scarce -->
							<span style="width:6px;"/>
							<span style="letter-spacing:4mm;">.</span>
						</th>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index = 1">(a)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/SimplifiedMethodComputation[$index*3-2]/YearEndedDt,6,7)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$index*3-2]/YearEndedDt,6,7)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
								<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/SimplifiedMethodComputation[$index*3-2]/YearEndedDt,1,4)=''">
											<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$index*3-2]/YearEndedDt,1,4)"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$index*3-2]/YearEndedDt,1,4)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index = 1">(b)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/SimplifiedMethodComputation[$index*3-1]/YearEndedDt,6,7)=''">
                </xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$index*3-1]/YearEndedDt,6,7)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
								<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/SimplifiedMethodComputation[$index*3-1]/YearEndedDt,1,4)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$index*3-1]/YearEndedDt,1,4)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index = 1">(c)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/SimplifiedMethodComputation[$index*3]/YearEndedDt,6,7)=''">
											<xsl:value-of select="''"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$index*3]/YearEndedDt,6,7)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
								<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:choose>
										<xsl:when test="substring($Form8697Data/SimplifiedMethodComputation[$index*3]/YearEndedDt,1,4)=''">
											<xsl:value-of select="''"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/SimplifiedMethodComputation[$index*3]/YearEndedDt,1,4)"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;border-right:none">
							<xsl:if test="$index = 1">(d)</xsl:if>
							<span style="text-align:center;font-weight:bold;width:29mm;">Totals</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">
            (Add columns (a),
          </span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">
            (b), and (c).)
          </span>
						</td>
					</tr>
					<tr>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap">
							<xsl:choose>
								<xsl:when test="$index=0 and $Part2Max=0">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation"/>
										<xsl:with-param name="ShortMessage" select="'true'"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<div style="text-align:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/RegularTaxableIncomeAdjAmt"/>
										</xsl:call-template>
									</div>
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/RegularTaxableIncomeAdjAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/RegularTaxableIncomeAdjAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/RegularTaxableIncomeAdjAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/RegularTaxableIncomeAdjAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/RegularTaxableIncomeAdjAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1mm;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">2</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
          Increase or decrease in regular tax for prior years. Multiply
          line 1 in each column by the applicable regular tax rate (see
          page 6 of the instructions)<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">.........</span>
							<span style="width:2px;"/>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/PriorYearRegTaxIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/PriorYearRegTaxIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/PriorYearRegTaxIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 2 - Line 3 -->
					<tr>
						<td class="styTableCell" rowspan="1" style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-top:9.5mm;padding-left:1.5mm;">3</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
							<span style="font-weight:bold;">Note:</span>
							<span style="width:1mm;"/>
							<i>
								<span style="width:50mm;">For prior years beginning before 1987,</span>
								<span style="width:60mm;"> skip lines 3
          and 4 and enter on line 5 the amount from line 2.</span>
							</i>
							<br/>Adjustment to alternative minimum taxable income to
          reflect the difference between: <span style="font-weight:bold;">(a)</span> the amount of such
          income required to be allocated for post-February 1986
          contracts completed or adjusted during the tax year based
          on <span style="font-weight:bold;">actual</span> contract price and costs, and <span style="font-weight:bold;">(b)</span> the amount of
          such income reported for such contracts based on
          <span style="font-weight:bold;">estimated</span> contract price and costs. See page 6 of the
          instructions and attach a schedule listing each separate
          contract, unless you were an owner of an interest in a
          pass-through entity reporting this amount from Schedule
          K-1 or a similar statement
          <!-- Form Link to Additional Data -->
							<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested with maximum digits placed a break next to it,as the space is already scarce -->
							<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">.......</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/AltMinTaxableIncomeAdjAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/AltMinTaxableIncomeAdjAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/AltMinTaxableIncomeAdjAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/AltMinTaxableIncomeAdjAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/AltMinTaxableIncomeAdjAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/AltMinTaxableIncomeAdjAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">4</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
          Increase or decrease in alternative minimum tax (AMT) for
          prior years. Multiply line 3 in each column by the applicable
          AMT rate (see page 6 of the instructions).<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">.....</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/PriorYearAMTIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/PriorYearAMTIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/PriorYearAMTIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">5</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">          
          Enter the <span style="font-weight:bold;">larger</span> of line 2 or line 4. See page 4 of the
          instructions if either amount is negative.<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">..........</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/AdjustmentToTaxableIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/AdjustmentToTaxableIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/AdjustmentToTaxableIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-top:6.5mm;padding-left:1.5mm;">6<span style="width:3mm;"/>
						</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
							<span style="font-weight:bold;">Pass-through entities:</span>
							<span style="padding-left:.5mm;">
								<i>
            Skip line 6 and enter
            </i>
							</span>
							<span style="width:60mm;">
								<i>
          on line 7 the amount from line 5.</i>
							</span>
							<br/>
          Overpayment ceiling. For each column in which line 5 is a
          negative number, enter your total tax liability for the prior
          year, as adjusted for past applications of the look-back
          method and after net operating loss, capital loss, net
          section 1256 contracts loss, and credit carryovers and
          carrybacks to that year. For each column in which line 5 is
          a positive number, leave line 6 blank and enter on line 7
          the amount from line 5<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">..</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/OverpaymentCeilingAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/OverpaymentCeilingAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/OverpaymentCeilingAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">7</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
          Increase or decrease in tax for the prior years on which
          interest is due (or is to be refunded). Enter the amount from
          line 5 or line 6, whichever is smaller. Treat both numbers
          as positive when making this comparison, but enter the
          amount as a negative number .
        </td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/IncreaseOrDecreaseInTaxForPY"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/IncreaseOrDecreaseInTaxForPY"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/IncreaseOrDecreaseInTaxForPY"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">8</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
          Interest due on increase, if any, shown on line 7 (see page
          6 of the instructions)<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">...</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/InterestDueOnIncreaseAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/InterestDueOnIncreaseAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/InterestDueOnIncreaseAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;border-color:black;border-right:none;vertical-align:bottom;padding-bottom:1mm;">
							<xsl:choose>
								<xsl:when test="($index = $Part2Max) and (($Print != $Separated) or (count($Form8697Data/SimplifiedMethodComputation) &lt;= 3))">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthdGrp/TotalInterestDueOnIncreaseAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<span style="width:1mm;"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">9</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
          Interest to be refunded on decrease, if any, shown on
          line 7 (see page 6 of the instructions)<span style="width:px;"/>
							<span style="letter-spacing:4mm;">.........</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/InterestToBeRefundedOnDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/InterestToBeRefundedOnDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/InterestToBeRefundedOnDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;border-color:black;border-right:none;vertical-align:bottom;padding-bottom:1mm;">
							<xsl:choose>
								<xsl:when test="($index = $Part2Max) and (($Print != $Separated) or (count($Form8697Data/SimplifiedMethodComputation) &lt;= 3))">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthdGrp/TotalInterestToBeRefundedAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<span style="width:1mm;"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
				<xsl:if test="$index != $Part2Max">
					<br/>
					<div style="width:187mm;">
						<span style="width:66mm;float:left;clear:none;"/>
						<span style="width:119mm;float:right;clear:none;border-style:solid;border-top-width:0px;border-right-width:0px;             border-left-width:0px;border-bottom-width:1px;border-color:black;"/>
					</div>
				</xsl:if>
				<xsl:call-template name="part2Table">
					<xsl:with-param name="index" select="$index+1"/>
					<xsl:with-param name="Part2Max" select="$Part2Max"/>
				</xsl:call-template>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="a">
		<xsl:value-of select="."/>
		<xsl:if test="string(number(.))='NaN'"> 
is not a number</xsl:if>
	</xsl:template>
	<xsl:template name="Page1">
		<xsl:param name="MaxPages"/>
		<xsl:param name="StartingPage"/>
		<xsl:variable name="PriorYearCount">
			<xsl:value-of select="count($Form8697Data/RegularMethodFilingYrGrp/AdjTaxableIncomeForLookBack)"/>
		</xsl:variable>
		<xsl:variable name="LastPage">
			<xsl:choose>
				<xsl:when test="$StartingPage = $MaxPages">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!--<xsl:value-of select="$LastPage"/>
-->
		<!--<xsl:value-of select="$MyPos+4"/>-->
		<!--		<xsl:param name="index" select="1"/>
		<xsl:param name="Part1Max"/>	-->
		<!-- PAGE 1 -->
		<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
		<table style="width:187mm;" id="TP1ctn">
			<xsl:call-template name="SetInitialState"/>
			<table cellspacing="0" summary="Table located under line C, having four columns and eight rows" style="width:187mm;border-top-width:0px;font-size:7pt;border-style: solid; border-color: black;         border-bottom-width:0px;border-left-width:0px;border-right-width: 0px;">
				<div style="width:187mm;">
					<span style="width:65mm;float:left;clear:none;"/>
					<span style="width:122.75mm;float:right;clear:none;border-style:solid;border-top-width:0px;border-right-width:0px;               border-left-width:0px;border-bottom-width:1px;border-color:black;"/>
				</div>
				<tr>
					<th class="styTableCell" rowspan="1" style="width:7mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
						<span style="width:1px;"/>
					</th>
					<th class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;">
						<span style="width:1px;"/>
					</th>
					<th class="styTableCell" style="width:29mm;height:7mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
          Filing Year
        </th>
					<th class="styTableCell" colspan="2" style="width:67mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
          Redetermination Years
        </th>
					<th class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-top-width:0px;border-color:black;border-right:none;border-bottom:none;">
						<span style="float:left;width:1px;"/>
					</th>
				</tr>
				<tr>
					<th class="styTableCell" rowspan="2" style="width:7mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;">1</th>
					<th class="styForm8697TableCellDescription" rowspan="2" style="font-weight:normal;">
          Taxable income or loss for the prior years shown on tax
          return (or as previously adjusted) before net operating loss
          or capital loss carrybacks (other than carrybacks that must
          be taken into account to properly compute interest under
          section 460) (see page 4 of the instructions). If you were
          required to file Form 8697 for an earlier year, enter adjusted
          taxable income for the prior years from line 3, Form 8697,
          for the most recent filing year that affects the prior years.  
          <span style="width:2mm;"/>
						<span style="letter-spacing:4mm;">........</span>
					</th>
					<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
						<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
						<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">

</span>
							<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">

            </span>
						</span>
					</td>
					<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
						<xsl:if test="(position() &gt;= ($StartingPage*2-1)) and (position() &lt;= $StartingPage*2)">
							<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
								<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
								<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
										<xsl:choose>
											<xsl:when test="substring(../YearEndedDt,6,7)=''"/>
											<xsl:otherwise>
												<xsl:value-of select="substring(../YearEndedDt,6,7)"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
									<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
										<xsl:choose>
											<xsl:when test="substring(../YearEndedDt,1,4)=''"/>
											<xsl:otherwise>
												<xsl:value-of select="substring(../YearEndedDt,1,4)"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</span>
							</td>
						</xsl:if>
					</xsl:for-each>
					<!--BLANK CELLS-->
					<xsl:if test="($LastPage = 'true') and ($PriorYearCount mod 2 = 1)">
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
            <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">

            </span>
								<span style="width:1mm;"/>yr.
            <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">

            </span>
							</span>
						</td>
					</xsl:if>
					<!--END BLANK CELLS-->
					<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-color:black;border-right:none">
						<span style="font-weight:bold;"/>
						<br/>
						<span style="text-align:center;width:20mm;">Totals</span>
						<span style="float:left;clear:all;width:29mm;font-weight:normal">
            (Add columns (a)
          </span>
						<span style="float:left;clear:all;width:29mm;font-weight:normal">
            and (b).)
          </span>
					</td>
				</tr>
				<tr>
					<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
						<span style="width:2mm;"/>
					</td>
					<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
						<xsl:if test="(position() &gt;= ($StartingPage*2-1)) and (position() &lt;= $StartingPage*2)">
							<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="../TaxableIncomeOrLossAmt"/>
								</xsl:call-template>
							</td>
						</xsl:if>
					</xsl:for-each>
					<!--BLANK CELLS-->
					<xsl:if test="($LastPage = 'true') and ($PriorYearCount mod 2 = 1)">
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<span style="width:2mm;"/>
						</td>
					</xsl:if>
					<!--END BLANK CELLS-->
					<td class="styForm8697TableCellEmptyGray" rowspan="1">
						<span style="width:1mm;"/>
					</td>
				</tr>
				<tr>
					<td class="styForm8697TableCellNumber" rowspan="1">2</td>
					<td class="styForm8697TableCellDescription" rowspan="1">
          Adjustment to income to reflect the difference between:
          <span style="font-weight:bold;">(a)</span> the amount of income required to be allocated for
          post-February 1986 contracts completed or adjusted
          during the tax year based on the <span style="font-weight:bold;">actual</span> contract price and
          costs, and <span style="font-weight:bold;">(b)</span> the amount of income reported for such
          contracts based on <span style="font-weight:bold;">estimated</span> contract price and costs.
          See page 4 of the instructions and attach a schedule listing
          each separate contract, unless you were an owner of an
          interest in a pass-through entity reporting this amount from
          Schedule K-1 or a similar statement             
          <!-- Form Link to Additional Data -->
						<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested with maximum digits placed a break next to it,as the space is already scarce -->
						<span style="width:2mm;"/>
						<span style="letter-spacing:4mm;">.</span>
					</td>
					<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
						<span style="width:2mm;"/>
					</td>
					<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/IncomeAdjustmentAmt">
						<xsl:if test="(position() &gt;= ($StartingPage*2-1)) and (position() &lt;= $StartingPage*2)">
							<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
								<div style="text-align:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="../IncomeAdjustmentAmt"/>
									</xsl:call-template>
								</div>
								<br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="../IncomeAdjustmentAmt"/>
								</xsl:call-template>
							</td>
						</xsl:if>
					</xsl:for-each>
					<!--BLANK CELLS-->
					<xsl:if test="($LastPage = 'true') and ($PriorYearCount mod 2 = 1)">
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<span style="width:2mm;"/>
						</td>
					</xsl:if>
					<!--END BLANK CELLS-->
					<td class="styForm8697TableCell" rowspan="1" style="border-right:0px;border-top:1px;border-color:black;border-style:solid;">
						<xsl:choose>
							<xsl:when test="$LastPage = 'true'">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8697Data/TotalAdjustmentToIncomeAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<span style="width:2mm"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<!-- Part 1 - Line 3 -->
				<tr>
					<td class="styForm8697TableCellNumber" rowspan="1">3</td>
					<td class="styForm8697TableCellDescription" rowspan="1">
          Adjusted taxable income for look-back purposes. Combine lines 1 and 2.  If line 3 is a negative amount, see instructions.
        </td>
					<td class="styForm8697TableCell" rowspan="1">
						<span style="width:2mm;"/>
					</td>
					<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/AdjTaxableIncomeForLookBack">
						<xsl:if test="(position() &gt;= ($StartingPage*2-1)) and (position() &lt;= $StartingPage*2)">
							<td class="styForm8697TableCell" rowspan="1">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="../AdjTaxableIncomeForLookBack"/>
								</xsl:call-template>
							</td>
						</xsl:if>
					</xsl:for-each>
					<!--BLANK CELLS-->
					<xsl:if test="($LastPage = 'true') and ($PriorYearCount mod 2 = 1)">
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<span style="width:2mm;"/>
						</td>
					</xsl:if>
					<!--END BLANK CELLS-->
					<td class="styForm8697TableCellEmptyGray" rowspan="1">
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- Part 1 - Line 4 -->
				<tr>
					<td class="styForm8697TableCellNumber" rowspan="1">4</td>
					<td class="styForm8697TableCellDescription" rowspan="1">
          Income tax liability on line 3 amount using tax rates in effect
          for the prior years (see page 4 of the instructions)
          <span style="width:2mm;"/>
						<span style="letter-spacing:4mm;">...</span>
					</td>
					<td class="styForm8697TableCell" rowspan="1">
						<span style="width:2mm;"/>
					</td>
					<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxLiabilityAmt">
						<xsl:if test="(position() &gt;= ($StartingPage*2-1)) and (position() &lt;= $StartingPage*2)">
							<td class="styForm8697TableCell" rowspan="1">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="../TaxLiabilityAmt"/>
								</xsl:call-template>
							</td>
						</xsl:if>
					</xsl:for-each>
					<!--BLANK CELLS-->
					<xsl:if test="($LastPage = 'true') and ($PriorYearCount mod 2 = 1)">
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<span style="width:2mm;"/>
						</td>
					</xsl:if>
					<!--END BLANK CELLS-->
					<td class="styForm8697TableCellEmptyGray" rowspan="1">
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- Part 1 - Line 5 -->
				<tr>
					<td class="styForm8697TableCellNumber" rowspan="1">5</td>
					<td class="styForm8697TableCellDescription" rowspan="1">
          Income tax liability shown on return (or as previously
          adjusted) for the prior years (see page 4 of the instructions).
          If you were required to file Form 8697 for an earlier year,
          enter the amount required to be reported on line 4, Form
          8697, for the most recent filing year that affects the prior
          years <span style="width:2mm;"/>
						<span style="letter-spacing:4mm;">........</span>
					</td>
					<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
						<span style="width:1px;"/>
					</td>
					<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/PriorYearIncomeTaxLiability">
						<xsl:if test="(position() &gt;= ($StartingPage*2-1)) and (position() &lt;= $StartingPage*2)">
							<td class="styForm8697TableCell" rowspan="1">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="../PriorYearIncomeTaxLiability"/>
								</xsl:call-template>
							</td>
						</xsl:if>
					</xsl:for-each>
					<!--BLANK CELLS-->
					<xsl:if test="($LastPage = 'true') and ($PriorYearCount mod 2 = 1)">
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<span style="width:2mm;"/>
						</td>
					</xsl:if>
					<!--END BLANK CELLS-->
					<td class="styForm8697TableCellEmptyGray" rowspan="1">
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- Part 1 - Line 6 -->
				<tr>
					<td class="styForm8697TableCellNumber" rowspan="1">6</td>
					<td class="styForm8697TableCellDescription" rowspan="1">
          Increase or decrease in tax for the prior years on which
          interest is due (or is to be refunded). Subtract line 5 from
          line 4.<span style="width:4mm;"/>
						<span style="letter-spacing:4mm;">.</span>
					</td>
					<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
						<span style="width:1px;"/>
					</td>
					<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/PriorYearTaxIncreaseOrDecrease">
						<xsl:if test="(position() &gt;= ($StartingPage*2-1)) and (position() &lt;= $StartingPage*2)">
							<td class="styForm8697TableCell" rowspan="1">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="../PriorYearTaxIncreaseOrDecrease"/>
								</xsl:call-template>
							</td>
						</xsl:if>
					</xsl:for-each>
					<!--BLANK CELLS-->
					<xsl:if test="($LastPage = 'true') and ($PriorYearCount mod 2 = 1)">
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<span style="width:2mm;"/>
						</td>
					</xsl:if>
					<!--END BLANK CELLS-->
					<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- Part 1 - Line 7 -->
				<tr>
					<td class="styForm8697TableCellNumber" rowspan="1">7</td>
					<td class="styForm8697TableCellDescription" rowspan="1">
          Interest due on increase, if any, shown on line 6 (see
          page 4 of the instructions)<span style="width:4mm;"/>
						<span style="letter-spacing:4mm;">.</span>
					</td>
					<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
						<span style="width:1px;"/>
					</td>
					<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/InterestDueOnIncrease1">
						<xsl:if test="(position() &gt;= ($StartingPage*2-1)) and (position() &lt;= $StartingPage*2)">
							<td class="styForm8697TableCell" rowspan="1">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="../InterestDueOnIncrease1"/>
								</xsl:call-template>
							</td>
						</xsl:if>
					</xsl:for-each>
					<!--BLANK CELLS-->
					<xsl:if test="($LastPage = 'true') and ($PriorYearCount mod 2 = 1)">
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<span style="width:2mm;"/>
						</td>
					</xsl:if>
					<!--END BLANK CELLS-->
					<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
						<xsl:choose>
							<xsl:when test="$LastPage = 'true'">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8697Data/TotalInterestDueOnIncreaseAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<span style="width:2mm"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<td class="styForm8697TableCellNumber" rowspan="1">8</td>
					<td class="styForm8697TableCellDescription" rowspan="1">
          Interest to be refunded on decrease, if any, shown on
          line 6 (see page 4 of the instructions)
          <span style="width:2mm;"/>
						<span style="letter-spacing:4mm;">........</span>
					</td>
					<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-bottom:1px;border-color:black;border-style:solid;">
						<span style="width:1px;"/>
					</td>
					<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/InterestToBeRefundedOnDecr1">
						<xsl:if test="(position() &gt;= ($StartingPage*2-1)) and (position() &lt;= $StartingPage*2)">
							<td class="styForm8697TableCell" rowspan="1">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="../InterestToBeRefundedOnDecr1"/>
								</xsl:call-template>
							</td>
						</xsl:if>
					</xsl:for-each>
					<!--BLANK CELLS-->
					<xsl:if test="($LastPage = 'true') and ($PriorYearCount mod 2 = 1)">
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<span style="width:2mm;"/>
						</td>
					</xsl:if>
					<!--END BLANK CELLS-->
					<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
						<xsl:choose>
							<xsl:when test="$LastPage = 'true'">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8697Data/TotalInterestToBeRefundedAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<span style="width:2mm"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<!--			<xsl:if test="$LastPage = 'false'">
				<br/>
				<div style="width:187mm;">
					<span style="width:65mm;float:left;clear:none;"/>
					<span style="width:122.75mm;float:right;clear:none;border-style:solid;border-top-width:0px;border-right-width:0px;
              border-left-width:0px;border-bottom-width:1px;border-color:black;"/>
				</div>
			</xsl:if>-->
		</table>
		<xsl:if test="$StartingPage &lt; $MaxPages">
			<xsl:call-template name="Page1">
				<xsl:with-param name="MaxPages" select="$MaxPages"/>
				<xsl:with-param name="StartingPage" select="$StartingPage + 1"/>
			</xsl:call-template>
		</xsl:if>
		<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
		<!-- END PAGE 1 -->
	</xsl:template>
</xsl:stylesheet>