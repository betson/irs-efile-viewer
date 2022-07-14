<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5472Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5472Data" select="$RtnDoc/IRS5472"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5472Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="Form 5472"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<script>
      function expandParentCtn(containerId) {
        var container = document.getElementById(containerId);        
        container.style.overflowY = "visible";
      }
    </script>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''"> -->
						<xsl:call-template name="IRS5472Style"/>
						<xsl:call-template name="AddOnStyle"/>
					<!--</xsl:if> -->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form style="font-family:arial; font-size:8pt" name="Form5472">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm; clear:both">
						<div class="styFNBox" style="height:20mm; width:30mm; font-size:7pt">
							<div>
            Form &nbsp; <span class="styFormNumber">5472</span>
								<br/>(Rev. December 2007)
            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form5472Data"/>
								</xsl:call-template>
								<div style="font-size:6pt; margin-top:2mm">
              Department of the Treasury<br/>Internal Revenue Service
            </div>
							</div>
						</div>
						<div class="styFTBox" style="width:126mm">
							<div class="styMainTitle" style="font-size:11pt; line-height:110%">
          Information Return of a 25% Foreign-Owned U.S. Corporation<br/>or a Foreign Corporation Engaged in a U.S. Trade or Business            
            <br/>
								<font style="font-size:9pt">(Under Sections 6038A and 6038C of the Internal Revenue Code)</font>
							</div>
							<div style="font-size:6.5pt;">            
                  For tax year of the reporting corporation beginning           
                <span style="width:20mm;border-bottom:1 solid black;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>      
            , and ending
                <span style="width:20mm;border-bottom:1 solid black;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
								<br/>
								<font style="font-size:8.5pt">
									<b>Note.</b> &nbsp; <i>Enter all information in English and money items in U.S. dollars.</i>
								</font>
							</div>
						</div>
						<div class="styTYBox" style="font-size:7pt; height:20mm; width:30mm; padding-top:3mm">
							<br/>
							<br/>OMB No. 1545-0805  
        </div>
					</div>
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:11mm">Part I</div>
						<div class="styPartDesc">
          Reporting Corporation <span class="styNormalText">(see instructions). All reporting corporations must complete Part I.</span>
						</div>
					</div>
					<!-- END Part I Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:135mm; height:8mm">
							<div class="styIRS5472TextTitle">1a</div>
							<div class="styGenericDiv">Name of reporting corporation
            <div style="margin-left:1mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationName/BusinessNameLine1"/>
									</xsl:call-template>
									<xsl:if test="normalize-space($Form5472Data/ReportingCorporationInfo/CorporationName/BusinessNameLine2) != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
						<div style="float:left">
							<div class="styIRS5472TextTitle">1b</div>
							<div style="float:right">
								<b>Employer identification number</b>
								<!--point one -->
								<xsl:if test="$Form5472Data/ReportingCorporationInfo/CorporationEIN">
									<div class="styIRS5472CenterTxt" style="vertical-align:bottom;text-align:left;">
										<br/>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationEIN"/>
										</xsl:call-template>
									</div>
								</xsl:if>
								<xsl:if test="$Form5472Data/ReportingCorporationInfo/MissingEINReason">
									<div class="styIRS5472CenterTxt" style="padding-top:0.5mm;vertical-align:bottom;text-align:left;">
										<br/>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/MissingEINReason"/>
										</xsl:call-template>
									</div>
								</xsl:if>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:135mm; height:8mm">
							<div style="border-bottom:1 solid black">
								<div style="padding-left:6mm; height:8mm">
              Number, street, and room or suite no. (if a P.O. box, see instructions)
              <div style="margin-left:1mm;">
										<xsl:choose>
											<xsl:when test="$Form5472Data/ReportingCorporationInfo/CorporationUSAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationUSAddress/AddressLine1"/>
												</xsl:call-template>
												<xsl:if test="normalize-space($Form5472Data/ReportingCorporationInfo/CorporationUSAddress/AddressLine2) != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationUSAddress/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/AddressLine1"/>
												</xsl:call-template>
												<xsl:if test="normalize-space($Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/AddressLine2) != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
							</div>
							<div style="padding-left:6mm; height:8mm">
            City or town, state, and ZIP code (if a foreign address, see instructions.)            
            <div>
									<xsl:choose>
										<xsl:when test="$Form5472Data/ReportingCorporationInfo/CorporationUSAddress">
											<xsl:attribute name="style">
                    margin-left:2mm; padding-top:1mm; 
                  </xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationUSAddress/City"/>
											</xsl:call-template>,
                  <xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationUSAddress/State"/>
											</xsl:call-template> &nbsp;
                  <xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationUSAddress/ZIPCode"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<!--xsl:attribute name="style">
                    line-height:100%; font-size:5pt
                  </xsl:attribute-->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/City"/>
											</xsl:call-template>
											<xsl:if test="(normalize-space($Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/City) != '') and (normalize-space($Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/ProvinceOrState) != '' or normalize-space($Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/PostalCode) != '')">, </xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/ProvinceOrState"/>
											</xsl:call-template> &nbsp;                  
                  <xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/PostalCode"/>
											</xsl:call-template>
											<xsl:if test="normalize-space($Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/City) != '' or normalize-space($Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/ProvinceOrState) != '' or normalize-space($Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/PostalCode) != ''">
												<br/>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationForeignAddress/Country"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
						</div>
						<div style="float:left">
							<div class="styIRS5472TextTitle">1c</div>
							<div class="styGenericDiv">
            Total assets
            <div style="margin-top:8.5mm;">$
               <span style="width:40mm;;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/TotalAssets"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:118mm">
							<div class="styIRS5472TextTitle">1d</div>
							<div class="styGenericDiv">
            Principal business activity <img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>&nbsp;
            <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/PrincipalBusinessActivity"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:left">
							<div class="styIRS5472TextTitle">1e</div>
							<div class="styGenericDiv">
								<!-- point 2 -->
            Principal business activity code <img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>&nbsp;
            <xsl:if test="$Form5472Data/ReportingCorporationInfo/PrincipalBusinessActivityCode">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/PrincipalBusinessActivityCode"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form5472Data/ReportingCorporationInfo/InactivePrincipalBusActyCode">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/InactivePrincipalBusActyCode"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div style="float:left; width:70mm">
							<div class="styIRS5472TextTitle">1f</div>
							<div class="styGenericDiv">
            Total value of gross payments made or received (see instructions) reported on <b>this</b> Form 5472
            <div style="padding-top:2mm">$
            <span style="width:40mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/TotalValueOfGrossPayments"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left; width:48mm; border-left:1 solid; border-right:1 solid">
							<div class="styIRS5472TextTitle">1g</div>
							<div class="styGenericDiv">
            Total number of Forms 5472 filed for the tax year
            <div style="padding-top:2mm" class="styIRS5472CenterTxt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="MaxSize" select="4"/>
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/TotalForms5472Filed"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div style="float:left">
							<div class="styIRS5472TextTitle">1h</div>
							<div class="styGenericDiv">
            Total value of gross payments made or received<br/>(see instructions) reported on <b>all</b> Forms 5472
            <div style="padding-top:2mm">$  
            <span style="width:40mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/TotalValueAllForm5472sFiled"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
					</div>
					<table style="font-size:8pt; width:187mm; line-height:110%;empty-cells:show;border-collapse:collapse;
					border-style:solid;border-color:black;border-top-width:0px;border-bottom-width:1;border-left-width:0;border-right-width:0;" cellpadding="0" cellspacing="0" >
						<tr>
							<th rowspan="2" scope="row" style="width:6mm; border-bottom:1 solid black;" valign="top">
            1i
          </th>
							<th rowspan="2" scope="col" valign="top" align="left" style="width:32mm; font-weight:normal; border-right:1 solid black; border-bottom:1 solid black; line-height:100%">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ConsolidatedFilingOfForm5472"/>
									</xsl:call-template>             
              Check here if this 
              <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ConsolidatedFilingOfForm5472"/>
									</xsl:call-template>
									<br/>is a consolidated<br/>filing of Form 5472 <span style="letter-spacing:3.3mm; font-weight:bold">...</span>&nbsp;&nbsp;
              <img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Arrow Bullet"/>&nbsp;&nbsp;            
            </label>
								<input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ConsolidatedFilingOfForm5472"/>
									</xsl:call-template>
								</input>
							</th>
							<th rowspan="2" scope="row" style="width:6mm" valign="top">
            1j
          </th>
							<th scope="col" valign="top" align="left" style="width:22mm; font-weight:normal; border-right:1 solid black">
            Country of<br/>incorporation
          </th>
							<th rowspan="2" scope="row" style="width:6mm;" valign="top">
            1k
          </th>
							<th scope="col" style="font-weight:normal; width:75mm" align="left" valign="top">            
            Country(ies) under whose laws the reporting<br/>corporation files an income tax return as a resident
          </th>
							<td align="right" valign="bottom" width="15px">
								<!-- button display logic -->
								<!-- end button display logic -->
							</td>
							<th rowspan="2" scope="row" valign="top" style="border-left:1 solid black; width:6mm">
            1l
          </th>
							<th scope="col" style="font-weight:normal; width:40mm" align="left" valign="top">    
            Principal country(ies) where<br/>business is conducted
          </th>
							<td align="right" valign="bottom"  width="15px">
								<!-- button display logic -->
								<!-- end button display logic -->
							</td>
						</tr>
						<tr style="height:6mm">
							<td style="border-right:1 solid black" valign="top">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CountryOfIncorporation"/>
								</xsl:call-template>
							</td>
							<td colspan="2" valign="top">
								<xsl:for-each select="$Form5472Data/ReportingCorporationInfo/CountryCorpFilesIncmTaxAsRes">
									<xsl:if test="position()!=1">, </xsl:if>
									<!--xsl:if test="(position() mod $breakPnt(13) = 1) and (position()!= 1)"><br/></xsl:if-->
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</td>
							<td colspan="2"  valign="top">
								<xsl:for-each select="$Form5472Data/ReportingCorporationInfo/PrincipalCountryBusIsConducted">
									<xsl:if test="position()!= 1">, </xsl:if>
									<xsl:if test="(position() mod 7= 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<div class="styBB" style="width:187mm;padding-bottom:0.5mm; padding-top:0.5mm">
						<div class="styIRS5472TextTitle">2</div>
						<div class="styGenericDiv">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/FrgnPersonOwn50PctVoteOrStock"/>
								</xsl:call-template>             
            Check here if, at any time during the tax year, any foreign person owned, directly or indirectly, at least 50% of <b>(a)</b> the total voting<br/>power of all classes of the stock of the reporting corporation entitled to vote, or <b>(b)</b> the total value of all classes of stock of the<br/>reporting corporation                        
          </label>
							<span style="letter-spacing:3.3mm; font-weight:bold">
            .................................. 
          </span>
							<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Arrow Bullet"/>
							<span style="width:2mm"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/FrgnPersonOwn50PctVoteOrStock"/>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- BEGIN Part II Title -->
					<xsl:variable name="p2DirectCount" select="count($Form5472Data/Direct25PctFrgnShareholderInfo)"/>
					<xsl:variable name="containerHeight" select="2"/>
					<div class="styBB" style="width:187mm; border-top:1 solid black">
						<div class="styPartName" style="width:11mm">Part II</div>
						<div class="styPartDesc">
          25% Foreign Shareholder <span class="styNormalText">(see instructions)</span>
						</div>
						<div style="float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo"/>
								<xsl:with-param name="containerHeight" select="$containerHeight"/>
								<xsl:with-param name="containerID" select="'part2TPctn1'"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END Part II Title -->
					<!-- BEGIN Part II Line Items -->
					<div class="styIRS5472TableContainer2" id="part2TPctn1">
						<xsl:attribute name="style"><xsl:if test="$p2DirectCount &gt; $containerHeight">
            height:51.2mm;
          </xsl:if></xsl:attribute>
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<xsl:call-template name="p2DirectTemplate">
							<xsl:with-param name="p2DirectCount" select="$p2DirectCount"/>
							<xsl:with-param name="max">
								<xsl:choose>
									<xsl:when test="$p2DirectCount &gt; $containerHeight">
										<xsl:value-of select="$p2DirectCount"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$containerHeight"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
						</xsl:call-template>
					</div>
					<xsl:variable name="p2UltimateCount" select="count($Form5472Data/UltimateIndr25PctFrgnShrInfo)"/>
					<xsl:if test="$p2UltimateCount &gt; $containerHeight">
						<div class="styBB" style="width:187mm;border-top:1 solid black">
							<div style="float:right">
								<xsl:call-template name="SetTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo"/>
									<xsl:with-param name="containerHeight" select="$containerHeight"/>
									<xsl:with-param name="containerID" select="'part2TPctn2'"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<div class="styIRS5472TableContainer2" id="part2TPctn2">
						<xsl:attribute name="style"><xsl:if test="$p2UltimateCount &gt; $containerHeight">
            height:51.2mm; 
          </xsl:if></xsl:attribute>
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<xsl:call-template name="p2UltimateTemplate">
							<xsl:with-param name="p2UltimateCount" select="$p2UltimateCount"/>
							<xsl:with-param name="max">
								<xsl:choose>
									<xsl:when test="$p2UltimateCount &gt; $containerHeight">
										<xsl:value-of select="$p2UltimateCount"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$containerHeight"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- END Part II Line Items -->
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="widt:187mm;height:8mm; border-top:1 solid black">
						<div class="styPartName" style="width:13mm;">Part III</div>
						<div class="styPartDesc">
          Related Party <span class="styNormalText">(see instructions)<br/>Check applicable box: Is the related party a
          <input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyIsForeignPerson"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyIsForeignPerson"/>
									</xsl:call-template>             
            foreign person
          </label> or 
          <input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyIsUSPerson"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyIsUSPerson"/>
									</xsl:call-template>   
            U.S. person
          </label>?
          <br/>All reporting corporations must complete this question and the rest of Part III.</span>
						</div>
					</div>
					<!-- END Part III Title -->
					<!-- BEGIN Part III Line Items -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:138mm">
							<div class="styIRS5472TextTitle">1a</div>
							<div class="styGenericDiv">
            Name and address of related party            
            <div style="margin-left:1mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyName/BusinessNameLine1"/>
									</xsl:call-template>
									<xsl:if test="normalize-space($Form5472Data/RelatedPartyInfo/RelatedPartyName/BusinessNameLine2)!=''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:if>
									<br/>
									<xsl:choose>
										<xsl:when test="$Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/AddressLine1"/>
											</xsl:call-template>
											<xsl:if test="normalize-space($Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/AddressLine2)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/AddressLine2"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/City"/>
											</xsl:call-template>
											<xsl:if test="(normalize-space($Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/City) != '') and (normalize-space($Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/ProvinceOrState) != '' or normalize-space($Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/PostalCode) != '')">, </xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/ProvinceOrState"/>
											</xsl:call-template> &nbsp;                                       
                  <xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/PostalCode"/>
											</xsl:call-template>
											<xsl:if test="normalize-space($Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/City) != '' or normalize-space($Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/ProvinceOrState) != '' or normalize-space($Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/PostalCode) != ''">
												<br/>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyForeignAddress/Country"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$Form5472Data/RelatedPartyInfo/RelatedPartyUSAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyUSAddress/AddressLine1"/>
												</xsl:call-template>
												<xsl:if test="normalize-space($Form5472Data/RelatedPartyInfo/RelatedPartyUSAddress/AddressLine2)!=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyUSAddress/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyUSAddress/City"/>
												</xsl:call-template>,
                    <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyUSAddress/State"/>
												</xsl:call-template> &nbsp;
                    <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyUSAddress/ZIPCode"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
						</div>
						<div style="float:left">
							<div class="styIRS5472TextTitle">1b</div>
							<div class="styGenericDiv">
            U.S. identifying number, if any  
            <div style="text-align:center; padding-top:3mm;">
									<xsl:choose>
										<xsl:when test="$Form5472Data/RelatedPartyInfo/EIN !=''">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/EIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$Form5472Data/RelatedPartyInfo/MissingEINReason !=''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/MissingEINReason"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/SSN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:118mm">
							<div class="styIRS5472TextTitle">1c</div>
							<div class="styGenericDiv">
            Principal business activity <img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>&nbsp;
            <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/PrincipalBusinessActivity"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:left">
							<div class="styIRS5472TextTitle">1d</div>
							<div class="styGenericDiv">
            Principal business activity code <img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>&nbsp;
                <xsl:if test="$Form5472Data/RelatedPartyInfo/PrincipalBusinessActivityCode">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/PrincipalBusinessActivityCode"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form5472Data/RelatedPartyInfo/InactivePrincipalBusActyCode">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/InactivePrincipalBusActyCode"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5472TextTitle">1e</div>
						<div class="styGenericDiv">
          Relationship—Check boxes that apply:
          <span style="width:1mm"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedToReportingCorporation"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedToReportingCorporation"/>
								</xsl:call-template>   
            Related to reporting corporation
          </label>
							<span style="width:1mm"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedTo25PctFrgnShareholder"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedTo25PctFrgnShareholder"/>
								</xsl:call-template>   
            Related to 25% foreign shareholder
          </label>
							<span style="width:1mm"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignShareholder25Percent"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignShareholder25Percent"/>
								</xsl:call-template>   
            25% foreign shareholder
          </label>
						</div>
					</div>
					<div style="width:187mm">
						<table class="styIRS5472Table" cellpadding="0" cellspacing="0" border="0">
							<thead class="styTableThead">
								<tr>
									<th scope="row" style="padding-left:1mm; width:5mm;" valign="top" align="left">
                1f
              </th>
									<th scope="col" valign="top" align="left" style="font-weight:normal" nowrap="nowrap">
                Principal country(ies) where business is conducted
              </th>
									<th align="right" valign="bottom">
										<!-- button display logic -->
										<!-- end button display logic -->
									</th>
									<th scope="row" style="width:6mm; border-left:1 solid black;" valign="top" align="center">
                1g
              </th>
									<th scope="col" valign="top" align="left" style="font-weight:normal" nowrap="nowrap">  
                Country(ies) under whose laws the related party files an income tax return as<br/>a resident
              </th>
									<th align="right" valign="bottom">
										<!-- button display logic -->
										<!-- end button display logic -->
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<tr style="height:6mm">
									<td/>
									<td colspan="2" valign="top">
										<xsl:for-each select="$Form5472Data/RelatedPartyInfo/PrincipalCountryBusIsConducted">
											<xsl:if test="position()!= 1">, </xsl:if>
											<xsl:if test="(position() mod 13 = 1) and (position()!= 1)">
												<br/>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</xsl:for-each>
									</td>
									<td style="border-left:1 solid black">&nbsp;</td>
									<td colspan="2" valign="top">
										<xsl:for-each select="$Form5472Data/RelatedPartyInfo/CntryRltdPrtyFilesIncmTaxAsRes">
											<xsl:if test="position()!= 1">, </xsl:if>
											<xsl:if test="(position() mod 19 = 1) and (position()!= 1)">
												<br/>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- END Part III Line Items -->
					<div style="width:187mm; font-size:7pt;  border-top:1 solid black; padding-top:0.5mm">
						<div style="float:left; font-size:8pt">
							<b>For Paperwork Reduction Act Notice, see page 4.</b>
						</div>
						<div style="float:right">
        Cat. No. 49987Y
        <span style="width:35mm"/>
        Form <b style="font-size:8pt">5472</b> (Rev. 12-2007)
        </div>
					</div>
					<div style="width:187mm; font-size:7pt;  page-break-before:always; padding-bottom:0.5mm">
						<div style="float:left">
          Form 5472 (Rev. 12-2007)
        </div>
						<div style="float:right">                    
          Page <b style="font-size:8pt">2</b>
						</div>
					</div>
					<!-- BEGIN Part IV Title -->
					<div class="styBB" style="width:187mm;height:4mm; border-top:2 solid black">
						<div class="styPartName" style="width:13mm;">Part IV</div>
						<div class="styPartDesc">
          Monetary Transactions Between Reporting Corporations and Foreign Related Party <span style="font-weight:normal;">(see instructions)</span>
							<br/>
							<b>Caution:</b>&nbsp;<i style="font-weight:normal">Part IV <b>must</b> be completed if the "foreign person" box is checked in the heading for Part III.</i>
							<br/>
							<span class="styNormalText" style="font-size: 8pt;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReasonableEstimatesUsed"/>
									</xsl:call-template>   
            If estimates are used, check here
          </label> &nbsp; <img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/> &nbsp; &nbsp; 
          <input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReasonableEstimatesUsed"/>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<!-- END Part IV Title -->
					<!-- BEGIN Part IV Line Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">1</div>
						<div style="float:left">
          Sales of stock in trade (inventory)
        </div>
						<div style="float:right">
							<span class="styDotLn">
            .......................
          </span>
							<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/SalesOfStockInTrade) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/SalesOfStockInTrade"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/StockSale50000OrLess"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">2</div>
						<div style="float:left">
          Sales of tangible property other than stock in trade
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ..................                              
          </span>
							<div class="styLNRightNumBox">2</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/SalesOfTangiblePropertyInTrade) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/SalesOfTangiblePropertyInTrade"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TangiblePropertySale50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">3a</div>
						<div style="float:left">
          Rents received (for other than intangible property rights)
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ................                              
          </span>
							<div class="styLNRightNumBox">3a</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/RentsReceived) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RentsReceived"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RentsReceived50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm"> b</div>
						<div style="float:left">
        Royalties received (for other than intangible property rights)
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ...............                              
          </span>
							<div class="styLNRightNumBox">3b</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/RoyaltiesReceived) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RoyaltiesReceived"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RoyaltiesReceived50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">4</div>
						<div style="float:left;">
						
          Sales, leases, licenses, etc., of intangible property rights (e.g., patents, trademarks, secret formulas)
		
        </div>
						<div style="float:right">
						
							<span class="styDotLn">  
            ..                                                             
          </span>
							<div class="styLNRightNumBox">4</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/MiscSalesFromIntngblPropRights) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/MiscSalesFromIntngblPropRights"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/MiscSalesIntngblProp50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">5</div>
						<div style="float:left">
          Consideration received for technical, managerial, engineering, construction, scientific, or like services
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ..                                                              
          </span>
							<div class="styLNRightNumBox">5</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/CnsdrRcvdForTechOrLikeServices) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CnsdrRcvdForTechOrLikeServices"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CnsdrRcvdTechLikeSrvc50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">6</div>
						<div style="float:left">
          Commissions received
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ..........................                                                                              
          </span>
							<div class="styLNRightNumBox">6</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/CommissionsReceived) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CommissionsReceived"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CommissionsReceived50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">7</div>
						<div style="float:left">
          Amounts borrowed <span style="font-family:'Arial Narrow'">(see instructions)<span style="width:2mm"/>
								<!--				<font style="font-family:'Arial Narrow'"> -->
								<b>a</b>&nbsp;&nbsp;Beginning balance
						          <span style="width:21mm; border-bottom:1 solid black; text-align:right">
									<!--  ***************************************************************************************  -->
									<xsl:choose>
										<xsl:when test="normalize-space($Form5472Data/AmtBorrowedBeginningBalance) != ''">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form5472Data/AmtBorrowedBeginningBalance"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form5472Data/AmtBorrowedBegngBal50000Less"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<!--  ***************************************************************************************  -->
								</span>
								<span style="width:2mm"/>
								<b>b</b>&nbsp;&nbsp;Ending balance or monthly average</span>
							<span style="width:2mm"/>
							<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox">7b</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/AmtBorrowedEndingBalance) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/AmtBorrowedEndingBalance"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/AmtBorrowedEndingBal50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">8</div>
						<div style="float:left">
          Interest received
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ............................                                                                            
          </span>
							<div class="styLNRightNumBox">8</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/InterestReceived) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InterestReceived"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InterestReceived50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">9</div>
						<div style="float:left">
          Premiums received for insurance or reinsurance
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ...................                                                                                                  
          </span>
							<div class="styLNRightNumBox">9</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/InsOrReinsPremiumsReceived) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InsOrReinsPremiumsReceived"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InsReinsPremiumsRcvd50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">10</div>
						<div style="float:left">
          Other amounts received (see instructions)
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            .....................                                                                                    
          </span>
							<div class="styLNRightNumBox">10</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/OtherAmountsReceived) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/OtherAmountsReceived"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/OtherAmountsReceived50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox">11</div>
						<div style="float:left">
							<b>Total.</b> Combine amounts on lines 1 through 10
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ....................                                                                                  
          </span>
							<div class="styLNRightNumBox" style="border-bottom:0">11</div>
							<div class="styLNAmountBoxNBB">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/TotalReceived) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TotalReceived"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TotalReceived50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">12</div>
						<div style="float:left">
          Purchases of stock in trade (inventory)
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            .....................                                                                                                        
          </span>
							<div class="styLNRightNumBox">12</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/PurchasesOfStockInTrade) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PurchasesOfStockInTrade"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PrchsOfStockInTrade50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">13</div>
						<div style="float:left">
          Purchases of tangible property other than stock in trade
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ................                                          
          </span>
							<div class="styLNRightNumBox">13</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/PurchasesOfTangiblePropInTrade) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PurchasesOfTangiblePropInTrade"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PrchsTngblPropInTrade50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">14a</div>
						<div style="float:left">
		Rents paid (for other than intangible property rights)
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            .................                                
          </span>
							<div class="styLNRightNumBox">14a</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/RentsPaid) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RentsPaid"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RentsPaid50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm">b</div>
						<div style="float:left">
          Royalties paid (for other than intangible property rights)
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            .................                               
          </span>
							<div class="styLNRightNumBox">14b</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/RoyaltiesPaid) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RoyaltiesPaid"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RoyaltiesPaid50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">15</div>
						<div style="float:left">
          Purchases, leases, licenses, etc., of intangible property rights (e.g., patents, trademarks, secret formulas)
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            .                                                        
          </span>
							<div class="styLNRightNumBox">15</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/MiscPrchsFromIntngblPropRights) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/MiscPrchsFromIntngblPropRights"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/MiscPrchsIntngblProp50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">16</div>
						<div style="float:left">
          Consideration paid for technical, managerial, engineering, construction, scientific, or like services
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ....                                                                    
          </span>
							<div class="styLNRightNumBox">16</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/CnsdrPaidForTechOrLikeServices) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CnsdrPaidForTechOrLikeServices"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CnsdrPaidTechLikeSrvc50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">17</div>
						<div style="float:left">
          Commissions paid          
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ............................                                                                  
          </span>
							<div class="styLNRightNumBox">17</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/CommissionsPaid) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CommissionsPaid"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CommissionsPaid50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">18</div>
						<div style="float:left">
          Amounts loaned <span style="font-family:'Arial Narrow'">(see instructions)<span style="width:3mm"/>
								<b>a</b>&nbsp;&nbsp;Beginning balance
          <span style="width:21mm; border-bottom:1 solid black; text-align:right">
									<!--  ***************************************************************************************  -->
									<xsl:choose>
										<xsl:when test="normalize-space($Form5472Data/AmtLoanedBginningBalance) != ''">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form5472Data/AmtLoanedBginningBalance"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form5472Data/AmtLoanedBginningBal50000Less"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<!--  ***************************************************************************************  -->
								</span>
								<span style="width:4mm"/>
								<b>b</b>&nbsp;&nbsp;Ending balance or monthly average	</span>
							<span style="width:2mm"/>
							<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox">18b</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/AmtLoanedEndingBalance) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/AmtLoanedEndingBalance"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/AmtLoanedEndingBal50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">19</div>
						<div style="float:left">
          Interest paid
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            .............................                                                                            
          </span>
							<div class="styLNRightNumBox">19</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/InterestPaid) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InterestPaid"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InterestPaid50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">20</div>
						<div style="float:left">
          Premiums paid for insurance or reinsurance
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ....................                                                                                                    
          </span>
							<div class="styLNRightNumBox">20</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/InsuranceOrReinsPremiumsPaid) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InsuranceOrReinsPremiumsPaid"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InsOrReinsPremiumsPd50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox">21</div>
						<div style="float:left">
          Other amounts paid (see instructions)
        </div>
						<div style="float:right">
							<span class="styDotLn">  
            ......................                                                                                              
          </span>
							<div class="styLNRightNumBox">21</div>
							<div class="styLNAmountBox">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/OtherAmountsPaid) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/OtherAmountsPaid"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/OtherAmountsPaid50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox">22</div>
						<div style="float:left">
						<b>Total.</b> Combine amounts on lines 12 through 21
        			</div>
					<div style="float:right">
						<span class="styDotLn">  
            ...................                                                                                  
          </span>
							<div class="styLNRightNumBox" style="border-bottom:0">22</div>
							<div class="styLNAmountBoxNBB">
								<!--  ***************************************************************************************  -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/TotalPaid) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TotalPaid"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TotalPaid50000Less"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--  ***************************************************************************************  -->
							</div>
						</div>
					</div>
					<!-- END Part IV Line Items -->
					<!-- BEGIN Part V Title -->
					<div class="styBB" style="width:187mm;border-top:1 solid black">
						<div class="styPartName" style="width:12mm;">Part V</div>
						<div class="styPartDesc" style="width:170mm">          
          Nonmonetary and Less-Than-Full Consideration Transactions Between the Reporting Corporation<br/>and the Foreign Related Party <span class="styNormalText"> (see instructions)</span>
							<br/>
							<span class="styNormalText">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/AllNonmonetaryAndLessThanFull"/>
									</xsl:call-template> 
              Describe these transactions on an attached separate sheet and check here.
            </label>
								<img src="{$ImagePath}/5472_Bullet_Lg.gif" alt="Big Right Arrow Bullet"/>&nbsp;
            <input type="Checkbox" style="vertical-align: middle;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/AllNonmonetaryAndLessThanFull"/>
									</xsl:call-template>
								</input>
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5472Data/AllNonmonetaryAndLessThanFull"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Part V Title -->
					<!-- BEGIN Part VI Title -->
					<div class="styBB" style="width:187mm;height:8mm; border-top:1 solid black">
						<div class="styPartName" style="width:13mm">Part VI</div>
						<div class="styPartDesc">Additional Information<br/>
							<span class="styNormalText">All reporting corporations must complete Part VI.</span>
						</div>
					</div>
					<!-- END Part VI Title -->
					<!-- BEGIN Part VI Line Items -->
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox">1</div>
						<div style="float:left">
          Does the reporting corporation import goods from a foreign related party?
        </div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn">  
            ..............      
          </span>
							<div class="styLNDesc" style="float: right; clear:none; width: 26mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsFromFrgnRltdParty"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsFromFrgnRltdParty"/>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsFromFrgnRltdParty"/>
									</xsl:call-template>
              Yes
            </label>
								<span style="width:7mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsFromFrgnRltdParty"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsFromFrgnRltdParty"/>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsFromFrgnRltdParty"/>
									</xsl:call-template>
              No
            </label>
							</div>
						</div>
					</div>
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox">2a</div>
						<div style="float:left">
          If "Yes," is the basis or inventory cost of the goods valued at greater than the customs value of the imported goods?                    
          <br/>If "No," <b>do not</b> complete <b>b</b> and <b>c</b> below.     
          <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGreaterThanCustomsVal"/>
							</xsl:call-template>
						</div>
						<div style="float:right; margin-right:1mm">
							<div class="styLNDesc" style="float: right; clear:none; width: 26mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGreaterThanCustomsVal"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGreaterThanCustomsVal"/>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGreaterThanCustomsVal"/>
									</xsl:call-template>
              Yes
            </label>
								<span style="width:7mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGreaterThanCustomsVal"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGreaterThanCustomsVal"/>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGreaterThanCustomsVal"/>
									</xsl:call-template>
              No
            </label>
							</div>
						</div>
					</div>
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm">b</div>
						<div style="float:left">
          If "Yes," attach a statement explaining the reason or reasons for such difference.  
        </div>
					</div>
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm">c</div>
						<div style="float:left">
          If the answers to questions 1 and 2a are "Yes," were the documents used to support this treatment of the imported
        </div>
					</div>
					<div style="width:187mm; padding-bottom:1mm; border-bottom:2 solid black">
						<div class="styLNLeftNumBox" style="padding-left:4mm"/>
						<div style="float:left">
          goods in existence and available in the United States at the time of filing Form 5472?              
        </div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn">  
            ..........
          </span>
							<div class="styLNDesc" style="float: right; clear:none; width: 26mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocInExistenceInUS"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocInExistenceInUS"/>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocInExistenceInUS"/>
									</xsl:call-template>
              Yes
            </label>
								<span style="width:7mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocInExistenceInUS"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocInExistenceInUS"/>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocInExistenceInUS"/>
									</xsl:call-template>
              No
            </label>
							</div>
						</div>
					</div>
					<!-- END Part VI Line Items -->
					<p style="page-break-before:always"/>
					<div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
						<div class="styLeftOverTitle">
          Additional Data        
        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form5472Data"/>
						</xsl:call-template>
					</table>
					<!-- Optional Print Solution for repeating data table Part II, Lines 1a-e and 2a-e -->
					<xsl:if test="(count($Form5472Data/Direct25PctFrgnShareholderInfo) &gt; 2) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 5472, Part II, Lines 1a-e and Lines 2a-e - 25% Direct Foreign Shareholder:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:4mm;"/>
									<th class="styDepTblCell" scope="col" style="width:60mm;">(a) Name and address of direct 25% foreign shareholder</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;">(b) U.S. identifying number, if any </th>
									<th class="styDepTblCell" scope="col" style="width:35mm;">(c) Principal country(ies) where business is conducted</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;">(d) Country of citizenship, organization, or incorporation</th>
									<th class="styDepTblCell" scope="col" style="width:35mm;">(e) Country(ies) under whose laws the direct 25% foreign shareholder files an income tax return as a resident</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5472Data/Direct25PctFrgnShareholderInfo">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styDepTblCell" style="text-align:center;">
											<!--xsl:if test="position() &lt; 3"-->
											<xsl:value-of select="position()"/>
											<!--/xsl:if-->
										</td>
										<!-- Second Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignShareholderName/BusinessNameLine1"/>
											</xsl:call-template>
											<xsl:if test="normalize-space(ForeignShareholderName/BusinessNameLine2)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignShareholderName/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="USAddress">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(USAddress/AddressLine2)!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/City"/>
													</xsl:call-template>,  
                      <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/State"/>
													</xsl:call-template>&nbsp;
                      <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(ForeignAddress/AddressLine2)!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
													</xsl:call-template>
													<xsl:if test="(normalize-space(ForeignAddress/City) != '') and (normalize-space(ForeignAddress/ProvinceOrState) != '' or normalize-space(ForeignAddress/PostalCode) != '')">, </xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
													</xsl:call-template>  &nbsp;
                        <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(ForeignAddress/City) != '' or normalize-space(ForeignAddress/ProvinceOrState) != '' or normalize-space(ForeignAddress/PostalCode) != ''">
														<br/>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Third Column -->
										<td class="styDepTblCell" style="text-align:left;">
										<xsl:choose>
												<xsl:when test="EIN !=''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="MissingEINReason !=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReason"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Fourth Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:for-each select="PrincipalCountryBusIsConducted">
												<xsl:if test="position()!= 1">, </xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:for-each>
										</td>
										<!-- Fifth Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryOfCtznOrgOrIncorp"/>
											</xsl:call-template>
										</td>
										<!-- Sixth Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:for-each select="CountryShrFilesIncmTaxAsRes">
												<xsl:if test="position()!= 1">, </xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<!-- Optional Print Solution for repeating data table Part II, Lines 3a-e and 4a-e -->
					<xsl:if test="(count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &gt; 2) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 5472, Part II, Lines 3a-e and Lines 4a-e - 25% Indirect Foreign Shareholder:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:4mm;"/>
									<th class="styDepTblCell" scope="col" style="width:60mm;">(a) Name and address of ultimate indirect 25% foreign shareholder</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;">(b) U.S. identifying number, if any </th>
									<th class="styDepTblCell" scope="col" style="width:35mm;">(c) Principal country(ies) where business is conducted</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;">(d) Country of citizenship, organization, or incorporation</th>
									<th class="styDepTblCell" scope="col" style="width:35mm;">(e) Country(ies) under whose laws the ultimate indirect 25% foreign shareholder files an income tax return as a resident </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5472Data/UltimateIndr25PctFrgnShrInfo">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<!--xsl:if test="position() &lt; 3"-->
											<xsl:value-of select="position()"/>
											<!--/xsl:if-->
											<br/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<!-- Second Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignShareholderName/BusinessNameLine1"/>
											</xsl:call-template>
											<xsl:if test="normalize-space(ForeignShareholderName/BusinessNameLine2)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignShareholderName/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="USAddress">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(USAddress/AddressLine2)!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/City"/>
													</xsl:call-template>,  
                      <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/State"/>
													</xsl:call-template>&nbsp;
                      <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(ForeignAddress/AddressLine2)!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
													</xsl:call-template>
													<xsl:if test="(normalize-space(ForeignAddress/City) != '') and (normalize-space(ForeignAddress/ProvinceOrState) != '' or normalize-space(ForeignAddress/PostalCode) != '')">, </xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
													</xsl:call-template>  &nbsp;
                        <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(ForeignAddress/City) != '' or normalize-space(ForeignAddress/ProvinceOrState) != '' or normalize-space(ForeignAddress/PostalCode) != ''">
														<br/>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Third Column -->
										<td class="styDepTblCell" style="text-align:left;">
										
											<xsl:choose>
												<xsl:when test="EIN !=''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="MissingEINReason !=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReason"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Fourth Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:for-each select="PrincipalCountryBusIsConducted">
												<xsl:if test="position()!= 1">, </xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:for-each>
										</td>
										<!-- Fifth Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryOfCtznOrgOrIncorp"/>
											</xsl:call-template>
										</td>
										<!-- Sixth Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:for-each select="CountryShrFilesIncmTaxAsRes">
												<xsl:if test="position()!= 1">, </xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="p2DirectTemplate">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:param name="p2DirectCount"/>
		<xsl:if test="$index &lt;= $max">
			<table class="styIRS5472Table" cellspacing="0" cellpadding="0" border="0">
				<thead class="styTableThead">
					<tr>
						<th scope="row" valign="top" align="center" style="width:6mm">
							<xsl:if test="$index &lt; 3">
								<xsl:value-of select="$index"/>
							</xsl:if>a
          </th>
						<th scope="col" style="font-weight:normal; width:132mm">
            Name and address of direct 25% foreign shareholder                  
          </th>
						<th scope="row" nowrap="nowrap" valign="top" align="center" style="border-left:1 solid black; width:6mm">
							<xsl:if test="$index &lt; 3">
								<xsl:value-of select="$index"/>
							</xsl:if>b
          </th>
						<th style="font-weight:normal" nowrap="nowrap">                    
            U.S. identifying number, if any              
          </th>
					</tr>
				</thead>
				<tbody>
					<tr style="height:9mm">
						<td>&nbsp;</td>
						<td>
							<xsl:if test="($Print = $Separated) and (count($Form5472Data/Direct25PctFrgnShareholderInfo) &gt; 2) and ($index = 1)">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignShareholderName/BusinessNameLine1"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignShareholderName/BusinessNameLine2)!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignShareholderName/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/AddressLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/AddressLine2)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/AddressLine2"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/City"/>
										</xsl:call-template>,  
                  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/State"/>
										</xsl:call-template>&nbsp;
                  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/ZIPCode"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/AddressLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/AddressLine2)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/AddressLine2"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/City"/>
										</xsl:call-template>
										<xsl:if test="(normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/City) != '') and (normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/ProvinceOrState) != '' or normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/PostalCode) != '')">, </xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/ProvinceOrState"/>
										</xsl:call-template>  &nbsp;
                  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/PostalCode"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/City) != '' or normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/ProvinceOrState) != '' or normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/PostalCode) != ''">
											<br/>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/Country"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</td>
						<td style="border-left:1 solid black">&nbsp;</td>
						<td align="center" valign="middle">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:choose>
									<xsl:when test="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/EIN !=''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/MissingEINReason !=''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/MissingEINReason"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/SSN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="styIRS5472Table" cellspacing="0" cellpadding="0" border="0">
				<thead class="styTableThead">
					<tr style="line-height:120%">
						<th valign="top" scope="row" align="center" style="width:6mm">
							<xsl:if test="$index &lt; 3">
								<xsl:value-of select="$index"/>
							</xsl:if>c
          </th>
						<th scope="col" style="font-weight:normal" valign="top" nowrap="nowrap">
            Principal country(ies) where<br/>business is conducted
          </th>
						<td align="right" valign="bottom" style="width:3.5mm">
          </td>
						<th scope="row" valign="top" align="center" style="width:6mm; border-left:1 solid black">
							<xsl:if test="$index &lt; 3">
								<xsl:value-of select="$index"/>
							</xsl:if>d
          </th>
						<th scope="col" style="font-weight:normal; width:40mm" nowrap="nowrap" valign="top">
            Country of citizenship,<br/>organization, or incorporation                
          </th>
						<th valign="top" style="width:6mm; border-left:1 solid black;" align="center">
							<xsl:if test="$index &lt; 3">
								<xsl:value-of select="$index"/>
							</xsl:if>e
          </th>
						<th style="font-weight:normal" nowrap="nowrap" valign="top">
            Country(ies) under whose laws the direct 25% foreign<br/>shareholder files an income tax return as a resident  
          </th>
						<th align="right" valign="bottom" style="width:3.5mm">    
          </th>
					</tr>
				</thead>
				<tbody>
					<tr style="height:5.5mm">
						<td/>
						<td colspan="2" valign="top">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:for-each select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/PrincipalCountryBusIsConducted">
									<xsl:if test="position()!= 1">, </xsl:if>
									<xsl:if test="(position() mod 8 = 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</xsl:if>
						</td>
						<td style="border-left:1 solid black">&nbsp;</td>
						<td valign="middle">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/CountryOfCtznOrgOrIncorp"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td style="border-left:1 solid black">&nbsp;</td>
						<td colspan="2" valign="top">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:for-each select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/CountryShrFilesIncmTaxAsRes">
									<xsl:if test="position()!= 1">, </xsl:if>
									<xsl:if test="(position() mod 15 = 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</xsl:if>
						</td>
					</tr>
				</tbody>
			</table>
			<xsl:choose>
				<xsl:when test="($Print = $Separated) and (count($Form5472Data/Direct25PctFrgnShareholderInfo) &gt; 2) and ($index = 2)">
					<xsl:call-template name="p2DirectTemplate">
						<xsl:with-param name="index" select="$max+1"/>
						<xsl:with-param name="max" select="$max"/>
						<xsl:with-param name="p2DirectCount" select="$p2DirectCount"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="p2DirectTemplate">
						<xsl:with-param name="index" select="$index + 1"/>
						<xsl:with-param name="max" select="$max"/>
						<xsl:with-param name="p2DirectCount" select="$p2DirectCount"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p2UltimateTemplate">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:param name="p2UltimateCount"/>
		<xsl:if test="$index &lt;= $max">
			<table class="styIRS5472Table" cellspacing="0" cellpadding="0" border="0">
				<thead class="styTableThead">
					<tr>
						<th scope="row" valign="top" style="width:6mm" align="center">
							<xsl:if test="$index &lt; 3">
								<xsl:value-of select="$index + 2"/>
							</xsl:if>a                
          </th>
						<th scope="col" style="font-weight:normal; width:132mm">                  
            Name and address of ultimate indirect 25% foreign shareholder
          </th>
						<th style="width:6mm; border-left:1 solid black" scope="row" nowrap="nowrap" valign="top" align="center">
							<xsl:if test="$index &lt; 3">
								<xsl:value-of select="$index + 2"/>
							</xsl:if>b
          </th>
						<th style="font-weight:normal" nowrap="nowrap">
            U.S. identifying number, if any
          </th>
					</tr>
				</thead>
				<tbody>
					<tr style="height:9mm">
						<td valign="bottom"> &nbsp;        
          <xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td>
							<xsl:if test="($Print = $Separated) and (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &gt; 2) and ($index = 1)">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignShareholderName/BusinessNameLine1"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignShareholderName/BusinessNameLine2)!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignShareholderName/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/AddressLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/AddressLine2)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/AddressLine2"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/City"/>
										</xsl:call-template>,  
                  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/State"/>
										</xsl:call-template>&nbsp;
                  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/ZIPCode"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/AddressLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/AddressLine2)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/AddressLine2"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/City"/>
										</xsl:call-template>
										<xsl:if test="(normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/City) != '') and (normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/ProvinceOrState) != '' or normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/PostalCode) != '')">, </xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/ProvinceOrState"/>
										</xsl:call-template> &nbsp;
                  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/PostalCode"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/City) != '' or normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/ProvinceOrState) != '' or normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/PostalCode) != ''">
											<br/>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/Country"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</td>
						<td style="border-left:1 solid black">&nbsp;</td>
						<td align="center" valign="middle">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
								<xsl:choose>
									<!-- maybe this -->
									<xsl:when test="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/MissingEINReason !=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/MissingEINReason"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/EIN !=''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/SSN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="styIRS5472Table" cellspacing="0" cellpadding="0" border="0">
				<thead class="styTableThead">
					<tr style="line-height:120%">
						<th valign="top" scope="row" align="center" style="width:6mm">
							<xsl:if test="$index &lt; 3">
								<xsl:value-of select="$index + 2"/>
							</xsl:if>c
          </th>
						<th scope="col" style="font-weight:normal" valign="top" nowrap="nowrap">
            Principal country(ies) where<br/>business is conducted
          </th>
						<th align="right" valign="bottom" style="width:3.5mm">
							<xsl:choose>
								<xsl:when test="$p2UltimateCount &gt; 2">
									<xsl:call-template name="SetTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/PrincipalCountryBusIsConducted"/>
										<xsl:with-param name="containerHeight" select="12"/>
										<xsl:with-param name="containerID" select="concat('partII3cTPctn', $index)"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="SetTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/PrincipalCountryBusIsConducted"/>
										<xsl:with-param name="containerHeight" select="12"/>
										<xsl:with-param name="containerID" select="concat('partII3cTPctn', $index)"/>
										<xsl:with-param name="Jfunc">
                    javascript:toggle('<xsl:value-of select="concat('partII3cTPctn', $index)"/>', '<xsl:value-of select="concat('partII3cTPctn', $index, 'image')"/>', '<xsl:value-of select="concat('partII3cTPctn', $index, 'button')"/>'); expandParentCtn('part2TPctn2')
                  </xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</th>
						<th scope="row" valign="top" align="center" style="width:6mm; border-left:1 solid black">
							<xsl:if test="$index &lt; 3">
								<xsl:value-of select="$index + 2"/>
							</xsl:if>d
          </th>
						<th scope="col" style="font-weight:normal; width:40mm" nowrap="nowrap" valign="top">
            Country of citizenship,<br/>organization, or incorporation                
          </th>
						<th valign="top" style="width:6mm; border-left:1 solid black" align="center">
							<xsl:if test="$index &lt; 3">
								<xsl:value-of select="$index + 2"/>
							</xsl:if>e
          </th>
						<th style="font-weight:normal" nowrap="nowrap" valign="top">
            Country(ies) under whose laws the ultimate indirect 25%<br/>foreign shareholder files an income tax return as a resident
          </th>
						<th align="right" valign="bottom" style="width:3.5mm">
							<xsl:choose>
								<xsl:when test="$p2UltimateCount &gt; 2">
									<xsl:call-template name="SetTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/CountryShrFilesIncmTaxAsRes"/>
										<xsl:with-param name="containerHeight" select="24"/>
										<xsl:with-param name="containerID" select="concat('partII3eTPctn', $index)"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="SetTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/CountryShrFilesIncmTaxAsRes"/>
										<xsl:with-param name="containerHeight" select="24"/>
										<xsl:with-param name="containerID" select="concat('partII3eTPctn', $index)"/>
										<xsl:with-param name="Jfunc">
                    javascript:toggle('<xsl:value-of select="concat('partII3eTPctn', $index)"/>', '<xsl:value-of select="concat('partII3eTPctn', $index, 'image')"/>', '<xsl:value-of select="concat('partII3eTPctn', $index, 'button')"/>'); expandParentCtn('part2TPctn2')                        
                  </xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr style="height:5.5mm">
						<td/>
						<td colspan="2" valign="top">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
								<div class="styIRS5472TableContainer" style="height:100%">
									<xsl:attribute name="id"><xsl:value-of select="concat('partII3cTPctn', $index)"/></xsl:attribute>
									<xsl:if test="count($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/PrincipalCountryBusIsConducted) &gt; 12">
										<xsl:call-template name="SetInitialState"/>
									</xsl:if>
									<xsl:variable name="breakPnt2">
										<xsl:choose>
											<xsl:when test="count($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/PrincipalCountryBusIsConducted) &gt; 12">
												<xsl:value-of select="5"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="6"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:for-each select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/PrincipalCountryBusIsConducted">
										<xsl:if test="position()!= 1">, </xsl:if>
										<xsl:if test="(position() mod $breakPnt2 = 1) and (position()!= 1)">
											<br/>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
							</xsl:if>
						</td>
						<td style="border-left:1 solid black">&nbsp;</td>
						<td valign="middle">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/CountryOfCtznOrgOrIncorp"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td style="border-left:1 solid black">&nbsp;</td>
						<td valign="top" colspan="2">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
								<div class="styIRS5472TableContainer" style="height:100%">
									<xsl:attribute name="id"><xsl:value-of select="concat('partII3eTPctn', $index)"/></xsl:attribute>
									<xsl:if test="count($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/CountryShrFilesIncmTaxAsRes) &gt; 24">
										<xsl:call-template name="SetInitialState"/>
									</xsl:if>
									<xsl:for-each select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/CountryShrFilesIncmTaxAsRes">
										<xsl:if test="position()!= 1">, </xsl:if>
										<xsl:if test="(position() mod 12 = 1) and (position()!= 1)">
											<br/>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
							</xsl:if>
						</td>
					</tr>
				</tbody>
			</table>
			<xsl:choose>
				<xsl:when test="($Print = $Separated) and (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &gt; 2) and ($index = 2)">
					<xsl:call-template name="p2UltimateTemplate">
						<xsl:with-param name="index" select="$max+1"/>
						<xsl:with-param name="max" select="$max"/>
						<xsl:with-param name="p2UltimateCount" select="$p2UltimateCount"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="p2UltimateTemplate">
						<xsl:with-param name="index" select="$index + 1"/>
						<xsl:with-param name="max" select="$max"/>
						<xsl:with-param name="p2UltimateCount" select="$p2UltimateCount"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
