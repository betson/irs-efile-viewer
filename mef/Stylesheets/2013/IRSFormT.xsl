<?xml version="1.0" encoding="UTF-8"?>
<!-- 09/13/10 - Modified by Jeremy Nichols for ITAMS 7494829 -->
<!-- 03/30/12 - Modified by Robert L Jones for IBM Defects-29720, 29721 -->
<!-- 03/30/12 - ON 29721 Tester complained about Part IV 2-4b right two columns being off -->
<!--That was caused by the scroll feature, when scroll bars show columns were off, but when
      scroll bar is hidden they were aligned - I switched them around so that when scroll bars show 
      columns are aligned and vice versa - RLJONES-->
<!-- 10/08/13 - Modified by Robert L Jones for IBM Defects-38145. Form not Populating. Schemas were late and no changes made it to Form when Delivered. Elements Changed -->
<!-- Last modified on 10/23/2013 by Robert Jones for IBM Defect Accverify 508 Comp-->
<!-- Last modified on 12/10/2013 by Robert Jones for IBM Defect 39361-->
<!-- Last modified on 12/13/2013 by Robert Jones for IBM Defect 39363-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRSFormTStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormTData" select="$RtnDoc/IRSFormT"/>
	<xsl:param name="FormTAData" select="$RtnDoc/IRSFormT/ForestActyAcquisitionsGrp"/>
	<xsl:param name="FormTADataII" select="$RtnDoc/IRSFormT/ForestActyTimberDepletionGrp"/>
	<xsl:param name="FormTADataIII" select="$RtnDoc/IRSFormT/ForestActyPrftLossTmbrSalesGrp"/>
	<xsl:param name="FormTADataIV" select="$RtnDoc/IRSFormT/ForestActyReforestationTmbrGrp"/>
	<xsl:param name="FormTADataV" select="$RtnDoc/IRSFormT/ForestActyLandOwnershipGrp"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormTData)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form FormT"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<!-- Form FormT CSS Styles are located in the template called below -->
					<xsl:call-template name="IRSFormTStyle"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<style type="text/css">
					table tr td {
						page-break-inside: avoid;
					}
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
				    <link rel="stylesheet" type="text/css" name="HeaderStyleSheet" href="{$CSSPath}/header.css"/>
    <link rel="stylesheet" type="text/css" name="BodyStyleSheet" href="{$CSSPath}/body.css"/>
    <link rel="stylesheet" type="text/css" name="General" href="{$CSSPath}/general.css"/>

			</head>
			<body class="styBodyClass">
				<form name="IRSFormT">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;float:none;">
						<div class="styFNBox" style="width:39mm;height:21mm;">
							<div style="height:10mm;">
                Form<span class="styFormNumber" style="font-size:15pt"> T (Timber)</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormTData"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
                (Rev. December 2013)
              </div>
							<div style="height:11mm;font-size:7pt;font-family:arial;">
								<br/>
								<span>Department of the Treasury</span>
								<br/>
								<span>Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:114mm;height:21mm;">
							<div class="styFTBox" style="width:114mm;height:17mm;">
								<div class="styMainTitle" style="height:12">
                  Forest Activities Schedule
                </div>
								<div class="styFBT" style="padding-bottom:1.75mm;">
									<img src="{$ImagePath}/T_Bullet.gif" alt="Bullet Image"/> Attach to your tax return. <span style="width:10mm;"/>
									<img src="{$ImagePath}/T_Bullet.gif" alt="Bullet Image"/> Information about Form T (Timber) and its separate instructions is at 
                  <a href="http://www.irs.gov/timber" title="Link to IRS.gov">
										<i>www.IRS.gov/timber</i>
									</a>.
                </div>
								<div class="styFBT" style="padding-top:1mm;">
                  For tax year ending
                  <span class="styBB" style="width:18mm;float:none;text-align:center;font-weight: normal">
										<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
									</span>
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:34mm;height:21mm;">
							<div class="styOMB" style="height:8mm;padding-top:3mm;">
								<span style="width:10px;"/>OMB No. 1545-0007</div>
							<div style="padding-top:3mm;">
								<span style="padding-right:30px;">Attachment </span>
								<br/>Sequence No.<span class="styBoldText">
									<span style="width:4px;"/>117</span>
							</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN NAME   -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:10mm;font-size:7pt;">
              Name(s) as shown on return<br/>
							<!-- Added per UWR 31342 to allow 1040/ssn filer to use this form -->
							<xsl:choose>
								<xsl:when test="$RtnHdrData/ReturnType='1040'">
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormTData/ShownOnReturnName/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormTData/ShownOnReturnName/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:45mm;height:10mm;font-size:7pt;padding-left:2mm;font-weight:bold;">
							<span style="width:4px;"/>
              Identifying number<br/>
							<br/>
							<span style="font-weight:normal;">
								<span style="width:4px;"> </span>
								<xsl:choose>
									<xsl:when test="$FormTData/EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$FormTData/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$FormTData/SSN">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormTData/SSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormTData/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--  END NAME   -->
					<!-- The whole part I is scheduled to repeat unboundedly.  So, the whole page repeats -->
					<!-- start page 2-->
					<!-- Header -->
					<xsl:choose>
						<xsl:when test="$FormTAData">
							<!-- When there is Part I data and the print parameter is NOT "separated", display all the data -->
							<!-- When there is Part I data and the print parameter is "separated", display the data only if there is a -->
							<!-- single Part I, and the repeating data elements within it do not exceed their individual container heights -->
							<xsl:choose>
								<xsl:when test="($Print != $Separated) or (count($FormTAData)=1 and count($FormTAData/MerchantableTimber)&lt;=6 and count($FormTAData/PremerchantableTimber)&lt;=4 and count($FormTAData/Improvement)&lt;=6)">
									<xsl:for-each select="$FormTAData">
										<xsl:call-template name="populateparti"/>
									</xsl:for-each>
								</xsl:when>
								<!-- When there is Part I data and the print parameter is "separated" and any of the repeating data elements -->
								<!-- exceed their container height -->
								<xsl:otherwise>
									<xsl:call-template name="populateparti">
										<xsl:with-param name="AdditionalDataMsg" select="'true'"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<!-- This is the case for when the Part I data is empty -->
						<xsl:otherwise>
							<xsl:call-template name="populateparti"/>
						</xsl:otherwise>
					</xsl:choose>
					<!-- Start page 3 and 4 and part II-->
					<xsl:choose>
						<xsl:when test="$FormTADataII">
							<!-- When there is Part II data and the print parameter is NOT "separated", display all the data -->
							<!-- When there is Part II data and the print parameter is "separated", display the data only if there is -->
							<!-- a single Part II i.e. it does not repeat-->
							<xsl:choose>
								<xsl:when test="($Print != $Separated) or (count($FormTADataII)=1) ">
									<xsl:for-each select="$FormTADataII">
										<xsl:call-template name="populatepartii"/>
									</xsl:for-each>
								</xsl:when>
								<!-- When there are multiple Part II data elements and the print parameter is "separated" -->
								<xsl:otherwise>
									<xsl:call-template name="populatepartii">
										<xsl:with-param name="AdditionalDataMsg" select="'true'"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<!-- This is the case for when the Part II data is empty -->
						<xsl:otherwise>
							<xsl:call-template name="populatepartii"/>
						</xsl:otherwise>
					</xsl:choose>
					<!-- begin page 5 and part III -->
					<xsl:choose>
						<xsl:when test="$FormTADataIII">
							<!-- When there is Part III data and the print parameter is NOT "separated", display all the data -->
							<!-- When there is Part III data and the print parameter is "separated", display the data only if there is a -->
							<!-- single Part III, and the repeating data elements within it do not exceed their individual container heights -->
							<xsl:choose>
								<xsl:when test="($Print != $Separated) or (count($FormTADataIII)=1 and count($FormTADataIII/MerchantableTimber)&lt;=6 and count($FormTADataIII/PremerchantableTimber)&lt;=4 and count($FormTADataIII/Improvement)&lt;=6)">
									<xsl:for-each select="$FormTADataIII">
										<xsl:call-template name="populatepartiii"/>
									</xsl:for-each>
								</xsl:when>
								<!-- When there is Part III data and the print parameter is "separated" and any of the repeating data elements -->
								<!-- exceed their container height -->
								<xsl:otherwise>
									<xsl:call-template name="populatepartiii">
										<xsl:with-param name="AdditionalDataMsg" select="'true'"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<!-- This is the case for when the Part III data is empty -->
						<xsl:otherwise>
							<xsl:call-template name="populatepartiii"/>
						</xsl:otherwise>
					</xsl:choose>
					<!-- Start Part IV and V -->
					<!-- Header -->
					<div class="styBB" style="width:187mm;padding-bottom:.5mm;">
						<div style="float:left;">Form T (Timber) (Rev. 12-2013)<span style="width:128mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;">4</span>
						</div>
					</div>
					<!-- BEGIN Part IV Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size: 9pt">Part IV </div>
						<div class="styPartDesc" style="font-size:9pt">Reforestation and Timber Stand Activities <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<xsl:choose>
						<xsl:when test="$FormTADataIV">
							<!-- When there is Part IV data and the print parameter is NOT "separated", display all the data -->
							<!-- When there is Part IV data and the print parameter is "separated", display the data only if there is -->
							<!-- a single Part IV, and the repeating data element within it does not exceed it's container height -->
							<xsl:choose>
								<xsl:when test="($Print != $Separated) or 
                                           (count($FormTADataIV)=1 and count($FormTADataIV/ReforestationExpensesInfoGrp)&lt;=4 )">
									<xsl:for-each select="$FormTADataIV">
										<xsl:call-template name="populatepartiv"/>
									</xsl:for-each>
								</xsl:when>
								<!-- When there is Part IV data and the print parameter is "separated" and any of the repeating data elements -->
								<!-- exceed their container height -->
								<xsl:otherwise>
									<xsl:call-template name="populatepartiv">
										<xsl:with-param name="AdditionalDataMsg" select="'true'"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<!-- This is the case for when the Part IV data is empty -->
						<xsl:otherwise>
							<xsl:call-template name="populatepartiv"/>
						</xsl:otherwise>
					</xsl:choose>
					<!-- end part IV -->
					<!-- Begin Part V -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size: 9pt">Part V </div>
						<div class="styPartDesc" style="font-size:9pt">Land Ownership</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;height:6mm;margin-top:2mm;margin-bottom:1mm;">
              Show all changes in land accounts. Attach as many additional sheets as needed, following the format of lines 1 through 6.
            </div>
					</div>
					<xsl:choose>
						<xsl:when test="$FormTADataV">
							<!-- When there is Part V data and the print parameter is NOT "separated", display all the data -->
							<!-- When there is Part V data and the print parameter is "separated", display the data only if there is a -->
							<!-- single Part V -->
							<xsl:choose>
								<xsl:when test="($Print != $Separated) or (count($FormTADataV)=1)">
									<xsl:for-each select="$FormTADataV">
										<xsl:call-template name="populatepartv"/>
									</xsl:for-each>
								</xsl:when>
								<!-- When there are multiple Part V data elements and the print parameter is "separated" -->
								<xsl:otherwise>
									<xsl:call-template name="populatepartv">
										<xsl:with-param name="AdditionalDataMsg" select="'true'"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<!-- This is the case for when the Part V data is empty -->
						<xsl:otherwise>
							<xsl:call-template name="populatepartv"/>
						</xsl:otherwise>
					</xsl:choose>
					<div style="width:187mm;clear:both;padding-top:1mm;">
						<span style="width:114mm;font-weight:bold;padding-left:85mm;" class="styGenericDiv">
            </span>
						<span style="width:19mm;font-weight:normal;" class="styGenericDiv"/>
						<span style="float:right;" class="styGenericDiv">Form <span class="styBoldText">T (Timber)</span> (Rev. 12-2013)</span>
					</div>
					<div style="width:187mm;"/>
					<div style="width:187mm;padding-top:1mm;" class="pageEnd"/>
					<div style="width:187mm;"/>
					<!-- Begininning of write-in data -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
              Additional Data        
            </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormTData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Additional Data Table for separated data from Part I -->
					<xsl:if test="($Print = $Separated) and (count($FormTAData)&gt;1 or count($FormTAData/MerchantableTimber)&gt;6 or count($FormTAData/PremerchantableTimber)&gt;4 or count($FormTAData/Improvement)&gt;6) ">
						<span class="styRepeatingDataTitle">
							<br/>Part I - Acquisitions:
            </span>
						<xsl:for-each select="$FormTAData">
							<table class="styDepTbl" style="font-size:7pt">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" colspan="5" style="text-align:left;">Part I - Acquisitions
                    
                  </th>
								</tr>
								<!-- Line 1 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="5" style="text-align:left">
										<div class="styLNLeftNumBoxSD" style="height:auto;">1</div>
										<div class="styLNDesc" style="height:auto;width:130mm;">Name of block and title of account<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfBlockAndTitleOfAcctTxt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!-- Line 2 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="5" style="text-align:left">
										<div class="styLNLeftNumBoxSD" style="height:auto;">2</div>
										<div class="styLNDesc" style="height:auto;width:130mm;">Location of property (by legal subdivisions or map surveys)<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyLocationTxt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!-- Line 3 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="4" style="text-align:left">
										<div class="styLNLeftNumBoxSD" style="height:auto;">3a</div>
										<div class="styLNDesc" style="width:130mm;height:auto;"> Name and address of seller or person from whom property was acquired</div>
										<br/>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="SellerName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="SellerName/BusinessNameLine2 ">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SellerName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:choose>
											<xsl:when test="SellerUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="SellerUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="SellerForeignAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styDepTblCell" style="height:20mm;text-align:center;">
										<b>b </b>
										<span style=" width:10px;"> </span> Date acquired <br/>
										<br/>
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="AcquiredDt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 4a -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-bottom-width:0px">
										<div class="styLNLeftNumBoxSD" style="height:auto;width:auto;">4
                    Amount paid:<span style="width:5.5mm"/>
											<span class="styBoldText">a </span>
											<span style="width:3px;"/>In cash
                    <span style="letter-spacing:4mm;font-weight:bold">......................</span>
										</div>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PaidCashAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 4b -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-bottom-width:0px;border-top-width:0px">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<span style="width:21.5mm"/>
										<span class="styBoldText">b</span>
										<span style="width:3px"/>In interest-bearing notes
                    <span style="letter-spacing:4mm;font-weight:bold">.................</span>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PaidInterestBearingNotesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 4c -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-top-width:0px;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<span style="width:21.5mm"/>
										<span class="styBoldText">c </span>
										<span style="width:3px;"/>In non-interest-bearing notes
                    <span style="letter-spacing:4mm;font-weight:bold">................</span>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PaidNonInterestBearingNotesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 5a -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-bottom-width:0px">
										<div class="styLNLeftNumBoxSD" style="height:auto;width:auto;">5a  
                    Amount of other consideration
                    <span style="letter-spacing:4mm;font-weight:bold">.....................</span>
										</div>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherConsiderationAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 5b -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-bottom-width:0px;border-top-width:0px">
										<div class="styLNLeftLtrBox" style="height:auto;width:auto;padding-left:2.3mm;">b 
                    Explain the nature of other consideration and how you determined the amount shown on line 5a.</div>
									</td>
									<td class="styDepTblCell" style="border-bottom-width:0px;background-color:lightgrey">
                  </td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-top-width:0px">
										<div class="styLNLeftLtrBox" style="height:4mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherConsiderationNatureTxt"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="border-top-width:0px;background-color:lightgrey">
                  </td>
								</tr>
								<!-- Line 6 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="4" style="text-align:left;vertical-align:top;">
										<div class="styLNLeftNumBoxSD" style="height:auto;width:auto;">6
                    Legal expenses
                    <span style="letter-spacing:4mm;font-weight:bold">.......................</span>
										</div>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="LegalExpensesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 7 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="4" style="text-align:left;vertical-align:top;">
										<div class="styLNLeftNumBoxSD" style="height:auto;width:auto;">7
                    Cruising, surveying, and other acquisition expenses
                    <span style="letter-spacing:4mm;font-weight:bold">...............</span>
										</div>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherAcquisitionExpensesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 8 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="4" style="text-align:left;vertical-align:top;">
										<div class="styLNLeftNumBoxSD" style="height:auto;width:auto;">8
                    Total cost or other basis of property. Add lines 4a through 7
                    <span style="letter-spacing:4mm;font-weight:bold">.............</span>
										</div>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisPropAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 9 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="width: 80mm;font-size:7pt;text-align:left;font-weight:normal;" scope="col">
										<div style="height:auto;width:auto;text-align:left;vertical-align:center;" class="styLNLeftNumBoxSD">9
                    Allocation of total cost or other basis on books:</div>
									</td>
									<td style="width: 18mm;" scope="col" class="styFormTTablesHeaders "> Unit</td>
									<td style="width: 25mm" scope="col" class="styFormTTablesHeaders "> Number of units</td>
									<td style="width: 31.5mm;" scope="col" class="styFormTTablesHeaders ">Cost or other<br/> basis per unit
                  </td>
									<td style="width: 32.5mm; border-right:0;" scope="col" class="styFormTTablesHeaders ">
                    Total cost or other basis
                  </td>
								</tr>
								<!-- Line 9a -->
								<tr class="styDepTblRow1">
									<td style="width: 80mm;text-align: left;vertical-align:center;" scope="row" class="styFormTTablesCells ">
										<div style="float:left;font-size:7pt;text-align:left;vertical-align:center;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">a
                      Forested land<span style="letter-spacing:4mm;font-weight:bold">.........</span>
											</div>
										</div>
									</td>
									<td style="width: 18mm; text-align: center;" class="styFormTTablesCells ">
                    Acre<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;height:4mm;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="ForestedLand/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 31.5mm; text-align: right" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="ForestedLand/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ForestedLand/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ForestedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForestedLand/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<!-- Line 9b -->
								<tr class="styDepTblRow2">
									<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
										<div style="float:left;font-size:7pt;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">b
                      Other unimproved land
                      <span style="letter-spacing:4mm;font-weight:bold">.........</span>
											</div>
										</div>
									</td>
									<td style="width: 18mm; text-align: center;vertical-align:bottom;" class="styFormTTablesCells ">
                    Acre<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;height:4mm;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="OtherUnimprovedLand/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 31.5mm; text-align: right" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="OtherUnimprovedLand/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherUnimprovedLand/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherUnimprovedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherUnimprovedLand/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<!-- Line 9c -->
								<tr class="styDepTblRow1">
									<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
										<div style="float:left;font-size:7pt;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">c
                      Improved land (describe)
                        <img src="{$ImagePath}/T_Bullet.gif" alt="Bullet Image"/>
												<span style="width:4px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ImprovedLand/@desc"/>
												</xsl:call-template>
											</div>
											<xsl:if test="not(ImprovedLand/@desc) or (ImprovedLand/@desc !='')">
												<span style="width:1px;"/>
											</xsl:if>
										</div>
									</td>
									<td style="width: 18mm; text-align: center;vertical-align:center;" class="styFormTTablesCells ">
                    Acre<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;height:4mm;vertical-align:center;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="ImprovedLand/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 31.5mm; text-align: right;vertical-align:center;" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="ImprovedLand/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ImprovedLand/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ImprovedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:center;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ImprovedLand/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<!-- Part I - Line 9d -->
								<tr class="styDepTblRow2">
									<td style="width: 80mm;text-align: left;vertical-align:top;" scope="row" class="styFormTTablesCells ">
										<xsl:attribute name="rowspan"><xsl:value-of select="count(MerchantableTimber)"/></xsl:attribute>
										<div style="float:left;font-size:7pt;width:76mm;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">d
                        Merchantable timber. Estimate the quantity of merchantable timber present on the acquisition date 
                        (see Regulations section 1.611-3(e)). Details of the timber estimate, made for purposes of the 
                        acquisition, should be available if your return is examined.</div>
										</div>
										<div style="float:left;">
											<img src="{$ImagePath}/T_Bracket_Lg.gif" alt="Bullet Image" height="85" width="6"/>
										</div>
									</td>
									<td style="width: 18mm; text-align: left;vertical-align:top;" class="styFormTTablesCells ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/UnitTxt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;height:4mm;vertical-align:top;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 31.5mm; text-align: right;vertical-align:top;" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="MerchantableTimber[1]/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:top;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<xsl:for-each select="MerchantableTimber">
									<xsl:if test="position() != 1">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td style="width: 18mm; text-align: left;vertical-align:top;" class="styFormTTablesCells ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="UnitTxt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td style="width: 25mm;height:4mm;vertical-align:top;" class="styFormTTablesCells ">
												<nobr>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="MaxSize" select="12"/>
														<xsl:with-param name="TargetNode" select="UnitQty"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</nobr>
											</td>
											<td style="width: 31.5mm; text-align: right;vertical-align:top;" class="styFormTTablesCells ">
												<nobr>
													<xsl:choose>
														<xsl:when test="CostOrOtherBasisPerUnitAmt">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</nobr>
											</td>
											<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:top;" class="styFormTTablesCells ">
												<nobr>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</nobr>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Line 9e************************************************************************************************************************************************************************ -->
								<tr class="styDepTblRow1">
									<td style="width: 80mm;text-align: left;vertical-align:top" scope="row" class="styFormTTablesCells ">
										<xsl:attribute name="rowspan"><xsl:value-of select="count(PremerchantableTimber)"/></xsl:attribute>
										<div style="float:left;font-size:7pt;width:76mm;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">e
                      
                        Premerchantable timber. Make an allocation
                        here only if it is a factor in the total cost or
                        value of the land.
                      </div>
										</div>
										<div style="float:left;">
											<img src="{$ImagePath}/T_Bracket_Sm.gif" alt="Bullet Image" height="56" width="6"/>
										</div>
									</td>
									<td style="width: 18mm; text-align: left;vertical-align:top;" class="styFormTTablesCells ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/UnitTxt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;height:4mm;vertical-align:top;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 31.5mm; text-align: right;vertical-align:top;" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="PremerchantableTimber[1]/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:top;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<xsl:for-each select="PremerchantableTimber">
									<xsl:if test="position() != 1">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td style="width: 18mm; text-align: left;vertical-align:top;" class="styFormTTablesCells ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="UnitTxt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td style="width: 25mm;height:4mm;vertical-align:top;" class="styFormTTablesCells ">
												<nobr>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="MaxSize" select="12"/>
														<xsl:with-param name="TargetNode" select="UnitQty"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</nobr>
											</td>
											<td style="width: 31.5mm; text-align: right;vertical-align:top;" class="styFormTTablesCells ">
												<nobr>
													<xsl:choose>
														<xsl:when test="CostOrOtherBasisPerUnitAmt">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</nobr>
											</td>
											<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:top;" class="styFormTTablesCells ">
												<nobr>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</nobr>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!--***************END PART I 9e*********************************************************************************************************************************-->
								<!-- Line 9f -->
								<tr class="styDepTblRow2">
									<td style="width: 80mm;text-align: left;border-bottom-width:0px;vertical-align:center;" scope="row" class="styFormTTablesCells ">
										<div style="float:left;font-size:7pt;width:77mm;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">f
                      Improvements (list separately)</div>
										</div>
									</td>
									<td style="width: 18mm; text-align: center;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
										<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
										<span style="width:1px;"/>
									</td>
									<td style="width: 31.5mm; text-align: right;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
										<span style="width:1px;"/>
									</td>
									<td style="width: 31.5mm; border-right:0;border-bottom-width:0px;" class="styFormTTablesCells ">
										<span style="width:1px;"/>
									</td>
								</tr>
								<xsl:for-each select="Improvement">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
										<td style="width:80mm;text-align: left;border-bottom-width:0px;" scope="row" class="styFormTTablesCells ">
											<div style="float:left;font-size:7pt;height:8mm;">
												<div style="height:8mm;" class="styLNLeftLtrBox"/>
												<div style="width:70mm;height:8mm;float:left;clear:none;padding-top:6px;" class="styBB">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Desc"/>
													</xsl:call-template>
												</div>
											</div>
											<span style="width:1px;"/>
										</td>
										<td style="width: 18mm; text-align: left;vertical-align:top;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UnitTxt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 25mm;height:8mm;vertical-align:top;" class="styFormTTablesCells ">
											<nobr>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="MaxSize" select="12"/>
													<xsl:with-param name="TargetNode" select="UnitQty"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</nobr>
										</td>
										<td style="width: 31.5mm; text-align: right;vertical-align:top;" class="styFormTTablesCells ">
											<nobr>
												<xsl:choose>
													<xsl:when test="CostOrOtherBasisPerUnitAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span style="width:1px;"/>
											</nobr>
										</td>
										<td style="width: 31.5mm; height:8mm; border-right:0;vertical-align:top;" class="styFormTTablesCells ">
											<nobr>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</nobr>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Line 9g -->
								<tr class="styDepTblRow1">
									<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
										<div style="float:left;font-size:7pt;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">g
                      Mineral rights
                    
                    <span style="letter-spacing:4mm;font-weight:bold">...........</span>
											</div>
										</div>
									</td>
									<td style="width: 18mm; text-align: left;vertical-align:top;" class="styFormTTablesCells ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="MineralRights/UnitTxt"/>
										</xsl:call-template>
									</td>
									<td style="width: 25mm;height:4mm;vertical-align:top;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="MineralRights/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 31.5mm; text-align: right;vertical-align:top;" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="MineralRights/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MineralRights/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MineralRights/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:top;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="MineralRights/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<!-- Line 9h -->
								<tr class="styDepTblRow2">
									<td style="width: 155mm;text-align: left;vertical-align:center;" scope="row" class="styFormTTablesCells " colspan="4">
										<div style="float:left;font-size:7pt;">
											<div style="height:auto;width:auto;vertical-align:center;" class="styLNLeftLtrBox">h
                      Total cost or other basis (same amount as line 8). Add lines 9a through 9g
                      
                    <span style="letter-spacing:4mm;font-weight:bold">........</span>
											</div>
										</div>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:center;" class="styFormTTablesCells ">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisPropAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<!-- End Part I separated data -->
					<!-- Additional Data Table for separated data from Part II -->
					<xsl:if test="($Print = $Separated) and (count($FormTADataII)&gt;1) ">
						<span class="styRepeatingDataTitle">
							<br/>Part II - Timber Depletion:
            </span>
						<xsl:for-each select="$FormTADataII">
							<table class="styDepTbl" style="font-size:7pt">
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" colspan="4" style="text-align:left;font-weight:bold;">Part II - Timber Depletion (see instructions)
                    
                  </td>
								</tr>
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="width:5mm;text-align:left;border-right-width:0px;font-weight:bold;padding-left:2.5mm;">1</td>
									<td class="styDepTblCell" colspan="3" style="text-align:left;border-left-width:0px;font-weight:normal;">
										<div class="styFormTLnDesc">
                      Name of block and title of account <img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
											<span style="width:4px;"/>
										</div>
										<div class="styBB" style="width:128mm;float:left;clear:none;height:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfBlockAndTitleOfAcctTxt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="2" style="text-align:left;padding-left:10mm;"> 
                    If you express timber quantity in thousand board feet (MBF), log scale, name the log rule used. If another unit of measure is used, provide details 
                    <img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
										<span style="text-decoration:underline">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LogRuleUsedTxt"/>
											</xsl:call-template>
										</span>
									</td>
									<th class="styDepTblHdr" style="width:29mm;text-align:center;border-right-width:1px;">(a) <br/>
										<b>Quantity</b>
									</th>
									<th class="styDepTblHdr" style="width:34mm;text-align:center;border-left-width:1px;">(b) <br/>
										<b>Cost or other basis</b>
									</th>
								</tr>
								<!-- Line 2 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;padding-left:2.5mm;">2</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Estimated quantity of timber and cost or other basis returnable through depletion
                    at end of the preceding tax year<span style="letter-spacing:4mm;font-weight:bold">........</span>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="TimberEndOfPrecedingTYEstQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CostRetThruDpltnEndPrecTYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 3 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;padding-left:2.5mm;">3</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Increase or decrease of quantity of timber required by way of correction
                    <span style="letter-spacing:4mm;font-weight:bold">..</span>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="IncreaseOrDecreaseTimberQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="border-bottom-width:0px;background-color:lightgrey;">
                  </td>
								</tr>
								<!-- Line 4a -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;padding-left:2.5mm;">4a</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Addition for growth (number of years covered<span style="width:4px;"/>
										<img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
										<span style="width:3px;"/>
										<span style="text-decoration:underline">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="20"/>
												<xsl:with-param name="TargetNode" select="AdditionForGrowthQty/@yearsCoveredCnt"/>
											</xsl:call-template>
										</span> )
                    <span style="letter-spacing:4mm;font-weight:bold"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="AdditionForGrowthQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="border-top-width:0px;background-color:lightgrey;">
                  </td>
								</tr>
								<!-- Line 4b -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:right;font-weight:bold;border-right-width:0px">b</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Transfers from premerchantable timber account
                    <span style="letter-spacing:4mm;font-weight:bold">.....</span>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="TrnsfrPrmrchTmbrAcctQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TrnsfrPrmrchTmbrAcctCostAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 4c -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align:right;font-weight:bold;border-right-width:0px">c</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Transfers from deferred reforestation account
                    <span style="letter-spacing:4mm;font-weight:bold">.......</span>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="TransfersFromDefrdRforAcctQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TrnsfrFromDefrdRforAcctCostAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 5 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;padding-left:2.5mm;">5</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Timber acquired during tax year
                    <span style="letter-spacing:4mm;font-weight:bold">.............</span>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="TimberAcquiredDuringYearQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TimberAcquiredDuringYrCostAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 6 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;padding-left:2.5mm;">6</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Addition to capital during tax year
                    <span style="letter-spacing:4mm;font-weight:bold">............</span>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;">
                  </td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdditionToCapitalDurYrCostAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Part II, Line 7 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;padding-left:2.5mm;">7</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Total at end of tax year, before depletion. Add lines 2 through 6
                    <span style="letter-spacing:4mm;font-weight:bold">....</span>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="TotalEOYBeforeDepletionQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalEOYBeforeDepletionCostAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 8 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;padding-left:2.5mm;">8</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Unit rate returnable through depletion, or basis of sales or losses. Divide line 7, column (b), by line 7, column (a)
                    <span style="letter-spacing:4mm;font-weight:bold">............</span>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;">
                  </td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;t">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ReturnableOrSlsLossesBssUnitRt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 9 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;padding-left:2.5mm;">9</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Quantity of timber cut during tax year
                    <span style="letter-spacing:4mm;font-weight:bold">...........</span>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="TimberCutDuringYearQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;">
                  </td>
								</tr>
								<!-- Line 10 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px">10</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Depletion for the current tax year. Multiply line 8 by line 9
                    <span style="letter-spacing:4mm;font-weight:bold">.....</span>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;">
                  </td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="DepletionForCurrentTaxYearAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 11 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px">11</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Quantity of standing timber sold or otherwise disposed of during tax year
                    <span style="letter-spacing:4mm;font-weight:bold"/>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="StandingTimberSoldDuringYrQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;">
                  </td>
								</tr>
								<!-- Line 12 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px">12</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Allowable as basis of sale. Multiply line 8 by line 11
                    <span style="letter-spacing:4mm;font-weight:bold">.....</span>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;">
                  </td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AllowableBasisSaleAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 13 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px">13</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Quantity of standing timber lost by fire or other cause during tax year
                    <span style="letter-spacing:4mm;font-weight:bold">..</span>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="LostByFireOrOtherCauseDurYrQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;">
                  </td>
								</tr>
								<!-- Line 14 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px">14</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                    Allowable basis of loss plus any excess amount where decrease in FMV<br/>
                    (before and after the casualty) exceeds the standard depletion amount, but<br/>
                    not the block basis (see instructions)
                    <span style="letter-spacing:4mm;font-weight:bold">..........</span>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;">
                  </td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AllowableBasisOfLossAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 15 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;border-bottom-width:0px">15</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px;border-bottom-width:0px">
                    Total reductions during tax year:
                  </td>
									<td class="styDepTblCell" style="border-bottom-width:0px">
                  </td>
									<td class="styDepTblCell" style="border-bottom-width:0px;background-color:lightgrey;">
                  </td>
								</tr>
								<!-- Line 15a -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:right;font-weight:bold;border-right-width:0px;border-top-width:0px;border-bottom-width:0px">a</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px;border-top-width:0px;border-bottom-width:0px">
                   In column (a), add lines 9, 11, and 13
                    <span style="letter-spacing:4mm;font-weight:bold">........</span>
									</td>
									<td class="styDepTblCell" style="text-align:right;border-top-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="TotalReductionsDuringYearQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;border-top-width:0px">
                  </td>
								</tr>
								<!-- Line 15b -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align:right;font-weight:bold;border-right-width:0px;border-top-width:0px">
                    b
                  </td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px;border-top-width:0px">
                    In column (b), add lines 10, 12, and 14
                    <span style="letter-spacing:4mm;font-weight:bold">........</span>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;">
                  </td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalReductionsDuringYrCostAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 16 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px">16</td>
									<td class="styDepTblCell" style="text-align:left;border-left-width:0px">
                   Net quantity and value at end of tax year. In column (a), subtract line 15a from line 7. In column (b), subtract line 15b from line 7
                    <span style="letter-spacing:4mm;font-weight:bold">....</span>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="NetEndOfYearQty"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="NetValueAtEndOfYearAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 17 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px">17</td>
									<td class="styDepTblCell" colspan="2" style="text-align:left;border-left-width:0px">
                    Quantity of cut timber that was sold as logs or other rough products
                    <span style="letter-spacing:4mm;font-weight:bold">.......</span>
									</td>
									<td class="styDepTblCell" style="text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="12"/>
											<xsl:with-param name="TargetNode" select="TimberSoldAsLogsQty"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 18 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;border-bottom-width:0px;">18</td>
									<td class="styDepTblCell" colspan="3" style="text-align:left;border-left-width:0px;border-bottom-width:0px;">
										<b>Section 631(a):</b>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;padding-left:4.3mm;border-bottom-width:0px;border-top-width:0px;">a</td>
									<td class="styDepTblCell" colspan="2" style="text-align:left;border-left-width:0px;border-bottom-width:0px;border-right-width:0px;border-top-width:0px;">
            Are you electing, or have you made an election in a prior tax year that is in effect, to report gains or losses from the cutting of timber under section 631(a)? (see instructions)
                    <span style="letter-spacing:4mm;font-weight:bold">.....</span>
									</td>
									<td class="styDepTblCell" style="border-left-width:0px;border-bottom-width:0px;border-top-width:0px;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
												</xsl:call-template>
											</input>
										</span>
										<label style="font-weight:bold;">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
											</xsl:call-template>
                Yes
              </label>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
												</xsl:call-template>
											</input>
										</span>
										<label style="font-weight:bold;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
											</xsl:call-template>
                  No
                </label>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;font-weight:bold;border-right-width:0px;padding-left:4.3mm;border-top-width:0px;border-bottom-width:0px;">b</td>
									<td class="styDepTblCell" colspan="2" style="text-align:left;border-left-width:0px;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;">Are you revoking your section 631(a) election (see instructions)?</td>
									<td class="styDepTblCell" style="border-left-width:0px;border-bottom-width:0px;border-top-width:0px;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
												</xsl:call-template>
											</input>
										</span>
										<label style="font-weight:bold;">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
											</xsl:call-template>
                      Yes
                    </label>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
												</xsl:call-template>
											</input>
										</span>
										<label style="font-weight:bold;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
											</xsl:call-template>
                  No
                </label>
									</td>
								</tr>
								<tr class="styDepTblRow2" style="border-top-width:0px;border-top-width:0px;">
									<td class="styDepTblCell" colspan="4" style="text-align:right;padding-right:20mm;border-top-width:0px;border-bottom-width:0px;">Effective date <img src="{$ImagePath}/T_Bullet.gif" alt="Bullet Image"/>
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="EffectiveDt"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<!-- End Part II separated data -->
					<!-- Additional Data Table for separated data from Part III -->
					<xsl:if test="($Print = $Separated) and (count($FormTADataIII)&gt;1 or count($FormTADataIII/MerchantableTimber)&gt;6 or count($FormTADataIII/PremerchantableTimber)&gt;4 or count($FormTADataIII/Improvement)&gt;6) ">
						<span class="styRepeatingDataTitle">
							<br/>Part III - Profit or Loss From Land and Timber Sales:
            </span>
						<xsl:for-each select="$FormTADataIII">
							<table class="styDepTbl" style="font-size:7pt">
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" colspan="5" style="text-align:left;">Part III - Profit or Loss From Land and Timber Sales
                  
                </td>
								</tr>
								<!-- Line 1 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="5" style="text-align:left">
										<div class="styLNLeftNumBox" style="height:auto;width:auto;text-align:left;">1
                  Name of block and title of account<span style="width:5px"/>
										</div>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="NameOfBlockAndTitleOfAcctTxt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 2 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="5" style="text-align:left">
										<div class="styLNLeftNumBox" style="height:auto;width:auto;text-align:left;">2
                  Location of property (by legal subdivisions or map surveys)</div>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PropertyLocationTxt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 3 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="4" style="text-align:left">
										<div class="styLNLeftNumBox" style="height:auto;width:auto;text-align:left;">3a
                  Purchaser's name and address</div>
										<br/>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PurchaserName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="PurchaserName/BusinessNameLine2 ">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PurchaserName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:choose>
											<xsl:when test="PurchaserUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="PurchaserUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="PurchaserForeignAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styDepTblCell" style="text-align:center">
										<b>b </b>
										<span style=" width:10px;"> </span> Date of sale<br/>
										<br/>
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="SaleDt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 4 -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-bottom-width:0px">
										<div class="styLNLeftNumBox" style="height:auto;width:auto;text-align:left;vertical-align:bottom;">4
                  Amount received:<span style="width:7px;vertical-align:bottom;"/>a
                  <span style="width:5px;vertical-align:bottom;"/>In cash
                  <span style="letter-spacing:4mm;font-weight:bold;vertical-align:bottom;">...................</span>
										</div>
									</td>
									<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CashReceivedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 4b -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
										<div class="styLNLeftNumBox" style="height:auto;width:auto;"/>
										<span style="width:29mm;"/>
										<span class="styBoldText">b </span>
										<span style="width:5px;"/>In interest-bearing notes
                  <span style="letter-spacing:4mm;font-weight:bold">................</span>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="InterestBearingNotesRcvdAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 4c -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-top-width:0px;">
										<div class="styLNLeftNumBox" style="height:auto;width:auto;"/>
										<span style="width:29mm;"/>
										<span class="styBoldText">c </span>
										<span style="width:5px;"/>In non-interest-bearing notes
                  <span style="letter-spacing:4mm;font-weight:bold">...............</span>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="NonInterestBearingNotesRcvdAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 5a -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-bottom-width:0px">
										<div class="styLNLeftNumBox" style="height:auto;width:auto;text-align:left;">5a
                  Amount of other consideration
                  <span style="letter-spacing:4mm;font-weight:bold">.....................</span>
										</div>
									</td>
									<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherConsiderationAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 5b -->
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-top-width:0px;border-bottom-width:0px">
										<div class="styLNLeftLtrBox" style="height:auto;width:auto;padding-left:2.2mm;">b
                  Explain the nature of other consideration and how you determined the amount shown on line 5a:</div>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;border-bottom-width:0px">
                </td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styDepTblCell" colspan="4" style="text-align:left;border-top-width:0px">
										<div class="styLNLeftLtrBox"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherConsiderationNatureTxt"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="background-color:lightgrey;border-top-width:0px">
                </td>
								</tr>
								<!-- Line 6 -->
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" colspan="4" style="text-align:left;">
										<div class="styLNLeftNumBox" style="height:auto;width:auto;">6  
                  Total amount received for property. Add lines 4a, 4b, 4c, and 5a
                  <span style="letter-spacing:4mm;font-weight:bold">..........</span>
										</div>
									</td>
									<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalReceivedForPropertyAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 7 -->
								<tr class="styDepTblRow2">
									<td style="width: 80mm;font-size:7pt;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesHeaders ">
										<div style="height:auto;width:auto;text-align:left;" class="styLNLeftNumBox">7
                  Cost or other basis of property:</div>
									</td>
									<td style="width: 18mm;" scope="col" class="styFormTTablesHeaders "> Unit</td>
									<td style="width: 25mm; " scope="col" class="styFormTTablesHeaders "> Number of units</td>
									<td style="width: 31.5mm;" scope="col" class="styFormTTablesHeaders ">
                  Cost or other<br/> basis per unit
                </td>
									<td style="width: 32.5mm;border-right:0;" scope="col" class="styFormTTablesHeaders ">
                  Total cost or other basis
                </td>
								</tr>
								<!-- Line 7a -->
								<tr class="styDepTblRow1">
									<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
										<div style="height:auto;width:auto;" class="styLNLeftLtrBox">a
                    Forested land
                  <span style="letter-spacing:4mm; font-weight:bold;">...........</span>
										</div>
									</td>
									<td style="width: 18mm; text-align: center;" class="styFormTTablesCells ">
                  Acre<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="ForestedLand/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width:  31.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="ForestedLand/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ForestedLand/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ForestedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForestedLand/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<!-- Line 7b -->
								<tr class="styDepTblRow2">
									<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
										<div style="float:left;font-size:7pt;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">b
                    Nonforested land
                  
                  <span style="letter-spacing:4mm; font-weight:bold;">...........</span>
											</div>
										</div>
									</td>
									<td style="width: 18mm; text-align: center;" class="styFormTTablesCells ">
                  Acre<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;height:4mm;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="NonforestedLand/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; text-align: right" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="NonforestedLand/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="NonforestedLand/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="NonforestedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NonforestedLand/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<!-- Line 7c -->
								<tr class="styDepTblRow1">
									<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
										<div style="float:left;font-size:7pt;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">c
                     Improved land (describe)
                      <img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
												<span style="width:4px;"/>
											</div>
											<div class="styBB" style="width:70mm;float:left;clear:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ImprovedLand/@desc"/>
												</xsl:call-template>
												<xsl:if test="not(ImprovedLand/@desc) or (ImprovedLand/@desc !='')">
													<span style="width:1px;"/>
												</xsl:if>
											</div>
										</div>
									</td>
									<td style="width: 18mm; text-align: center;vertical-align:bottom;" class="styFormTTablesCells ">
                  Acre<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="ImprovedLand/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width:  32.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="ImprovedLand/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ImprovedLand/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ImprovedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ImprovedLand/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<!-- Line 7d -->
								<tr class="styDepTblRow2">
									<td style="width: 80mm;text-align: left;vertical-align:top;" scope="row" class="styFormTTablesCells ">
										<xsl:attribute name="rowspan"><xsl:value-of select="count(MerchantableTimber)"/></xsl:attribute>
										<div style="float:left;font-size:7pt;width:76mm;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">d
                    
                     Merchantable timber. Estimate in detail the quantity of merchantable timber on the date of sale or exchange. Include the quantity of
                      timber in each species of timber by diameter at breast height (DBH) classes. State the log rule used if the unit of measure is thousand 
                      board feet (MBF), log scale. If another unit of measure is used, provide details. <img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
												<br/>
											</div>
										</div>
										<div style="float:left;">
											<img alt="Bullet Image" src="{$ImagePath}/T_Bracket_Lg.gif" height="85" width="6"/>
										</div>
										<xsl:for-each select="LogRuleUsedTxt">
											<div style="height:4.5mm;" class="styLNLeftLtrBox"/>
											<div class="styBB" style="height:auto;width:auto;float:left;clear:none;padding-top:.5mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
												<xsl:if test="not(.) or (. !='')">
													<span style="width:1px;"/>
												</xsl:if>
											</div>
										</xsl:for-each>
									</td>
									<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/UnitTxt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width:  32.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="MerchantableTimber[1]/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<xsl:for-each select="MerchantableTimber">
									<xsl:if test="position() != 1">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="UnitTxt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
												<nobr>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="MaxSize" select="12"/>
														<xsl:with-param name="TargetNode" select="UnitQty"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</nobr>
											</td>
											<td style="width:  32.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
												<nobr>
													<xsl:choose>
														<xsl:when test="CostOrOtherBasisPerUnitAmt">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
													<span style="width:1px;"/>
												</nobr>
											</td>
											<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
												<nobr>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</nobr>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Line 7e -->
								<tr class="styDepTblRow1">
									<td style="width: 80mm;text-align: left;vertical-align:center;" scope="row" class="styFormTTablesCells ">
										<xsl:attribute name="rowspan"><xsl:value-of select="count(PremerchantableTimber)"/></xsl:attribute>
										<div style="float:left;font-size:7pt;width:76mm;vertical-align:center;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">e
                   Premerchantable timber
                     <span style="letter-spacing:4mm; font-weight:bold;">.......</span>
											</div>
										</div>
										<div style="float:left;">
											<img alt="Bullet Image" src="{$ImagePath}/T_Bracket_Sm.gif" height="56" width="6"/>
										</div>
									</td>
									<td style="width: 18mm; text-align: left;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/UnitTxt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 25mm;height:4mm;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width:  32.5mm; text-align: right" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="PremerchantableTimber[1]/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<xsl:for-each select="PremerchantableTimber">
									<xsl:if test="position() != 1">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td style="width: 18mm; text-align: left;" class="styFormTTablesCells ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="UnitTxt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td style="width: 25mm;height:4mm;" class="styFormTTablesCells ">
												<nobr>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="MaxSize" select="12"/>
														<xsl:with-param name="TargetNode" select="UnitQty"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</nobr>
											</td>
											<td style="width:  32.5mm; text-align: right" class="styFormTTablesCells ">
												<nobr>
													<xsl:choose>
														<xsl:when test="CostOrOtherBasisPerUnitAmt">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
													<span style="width:1px;"/>
												</nobr>
											</td>
											<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
												<nobr>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</nobr>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Line 7f -->
								<tr class="styDepTblRow2">
									<td style="width: 80mm;text-align: left;border-bottom-width:0px;" scope="row" class="styFormTTablesCells ">
										<div style="float:left;font-size:7pt;width:77mm;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">f
                   Improvements (list separately)</div>
										</div>
									</td>
									<td style="width: 18mm; text-align: center;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
										<span style="width:1px;"/>
									</td>
									<td style="width: 25mm;height:4mm;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
										<span style="width:1px;"/>
									</td>
									<td style="width:  31.5mm; text-align: right;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
										<span style="width:1px;"/>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;border-bottom-width:0px;" class="styFormTTablesCells ">
										<span style="width:1px;"/>
									</td>
								</tr>
								<xsl:for-each select="Improvement">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
										<td style="width:80mm;text-align: left;border-bottom-width:0px;" scope="row" class="styFormTTablesCells ">
											<div style="float:left;font-size:7pt;height:8mm;">
												<div style="height:8mm;" class="styLNLeftLtrBox"/>
												<div style="width:70mm;height:8mm;float:left;clear:none;padding-top:6px;" class="styBB">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Desc"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
										<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UnitTxt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 25mm;height:8mm;vertical-align:bottom;" class="styFormTTablesCells ">
											<nobr>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="MaxSize" select="12"/>
													<xsl:with-param name="TargetNode" select="UnitQty"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</nobr>
										</td>
										<td style="width:  32.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
											<nobr>
												<xsl:choose>
													<xsl:when test="CostOrOtherBasisPerUnitAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span style="width:1px;"/>
											</nobr>
										</td>
										<td style="width: 32.5mm; height:8mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
											<nobr>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</nobr>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Line 7g -->
								<tr class="styDepTblRow1">
									<td style="width: 80mm;text-align: left;vertical-align:bottom;" scope="row" class="styFormTTablesCells ">
										<div style="float:left;font-size:7pt;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">g
                   Mineral rights
                  <span style="letter-spacing:4mm; font-weight:bold;">......</span>
											</div>
										</div>
									</td>
									<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="MineralRights/UnitTxt"/>
										</xsl:call-template>
									</td>
									<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="MineralRights/UnitQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width:  31.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:choose>
												<xsl:when test="MineralRights/CostOrOtherBasisPerUnitAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MineralRights/CostOrOtherBasisPerUnitAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MineralRights/CostOrOtherBasisPerUnitDcmlAmt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:1px;"/>
										</nobr>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
										<nobr>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="MineralRights/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</nobr>
									</td>
								</tr>
								<!-- Line 7h -->
								<tr class="styDepTblRow2">
									<td style="width: 155mm;text-align: left;" scope="row" class="styFormTTablesCells " colspan="4">
										<div style="float:left;font-size:7pt;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">h
                   Total cost or other basis. Add lines 7a through 7g
                 
                 <span style="letter-spacing:4mm; font-weight:bold;">......</span>
											</div>
										</div>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisPropAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 7i -->
								<tr class="styDepTblRow1">
									<td style="width: 155mm;text-align: left;" scope="row" class="styFormTTablesCells " colspan="4">
										<div style="float:left;font-size:7pt;">
											<div style="height:auto;width:auto;" class="styLNLeftLtrBox">i
                   Direct sale expenses (cruising, marking, selling)
                 
                 <span style="letter-spacing:4mm; font-weight:bold;">......</span>
											</div>
										</div>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="DirectSaleExpensesAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Line 8 -->
								<tr class="styDepTblRow2" style="height:8mm;">
									<td style="width:155mm;text-align: left;vertical-align:bottom;" scope="row" class="styFormTTablesCells " colspan="4">
										<div style="float:left;font-size:7pt;">
											<div style="height:auto;width:auto;" class="styLNLeftNumBox">8
                   Profit or loss. Subtract the sum of lines 7h and 7i from line 6
                 
                 <span style="letter-spacing:4mm; font-weight:bold;">...........</span>
											</div>
										</div>
									</td>
									<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ProfitOrLossAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</table>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<!-- End Part III separated data -->
					<!-- Additional Data Table for separated data from Part IV, Line 42 -->
					<xsl:if test="($Print = $Separated) and (count($FormTADataIV)&gt;1 or count($FormTADataIV/ReforestationExpensesInfoGrp)&gt;4) ">
						<span class="styRepeatingDataTitle">
							<br/>Part IV - Reforestation and Timber Stand Activities (see instructions)
          </span>
						<xsl:for-each select="$FormTADataIV">
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="width:65mm">
											<b>Account, block, tract, area, or stand ID for each Qualified Timber Property (QTP)</b>
										</th>
										<th class="styDepTblCell" style="width:58mm">
											<b>Kind of activity (burning, chopping,spraying, planting, seeding, thinning, pruning, fertilizing, etc.)</b>
										</th>
										<th class="styDepTblCell" style="width:32mm">
											<b>Number of <br/>acres treated</b>
										</th>
										<th class="styDepTblCell" style="width:32mm">
											<b>Total <br/>expenditures</b>
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="ReforestationExpensesInfoGrp">
										<tr>
											<!--Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styDepTblCell" style="text-align:left;">
												<xsl:if test="position() = 1">
													<span style="font-weight:bold;">1 </span>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AccountBlockTractOrAreaTxt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="KindOfActivityTxt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="MaxSize" select="12"/>
													<xsl:with-param name="TargetNode" select="AcresTreatedQty"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalExpendituresAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<tr class="styDepTblHdr">
										<td class="styDepTblCell" colspan="2" style="text-align:left;">2 Total</td>
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="WhiteFont">true</xsl:with-param>
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="TotalAcresTreatedQty"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="WhiteFont">true</xsl:with-param>
												<xsl:with-param name="TargetNode" select="TotalOfTotalExpendituresAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- line 3 -->
									<tr class="styDepTblHdr">
										<td class="styDepTblCell" colspan="2" style="text-align:left;">3 Total reforestation expenses</td>
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="WhiteFont">true</xsl:with-param>
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="RforExpnssAcreTreatdQty"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="WhiteFont">true</xsl:with-param>
												<xsl:with-param name="TargetNode" select="RforExpnssTotExpendAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblHdr">
										<td class="styDepTblCell" colspan="2" style="text-align:left;">4a Amount to be expensed under section 194(b). (See instructions for limitations)</td>
										<td class="styDepTblCell" style="text-align:right;">
                
                </td>
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="WhiteFont">true</xsl:with-param>
												<xsl:with-param name="TargetNode" select="RforExpnssDedUndSection194bAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblHdr">
										<td class="styDepTblCell" colspan="2" style="text-align:left; padding-left:3mm;">b Amount to be amortized under IRC 194(a), including remaining reforestation expenditures not expensed under section 194(b)</td>
										<td class="styDepTblCell" style="text-align:right;"/>
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="WhiteFont">true</xsl:with-param>
												<xsl:with-param name="TargetNode" select="RforExpnssAmortzUndIRC194aAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<!-- End Part IV, Line 42 separated data -->
					<!-- Additional Data Table for separated data from Part V -->
					<xsl:if test="($Print = $Separated) and (count($FormTADataV)&gt;1) ">
						<span class="styRepeatingDataTitle">
							<div class="styBB" style="width:187mm;">
								<div class="styPartName" style="font-size: 9pt">Part V 
            Land Ownership</div>
							</div>
							<div style="width:187mm;height:4mm;">
              Show all changes in land accounts. Attach as many additional sheets as needed, following the format of lines 1 through 6.
          
          </div>
						</span>
						<xsl:for-each select="$FormTADataV">
							<table cellpadding="0" cellspacing="0" class="styDepTbl" style="font-size:7pt">
								<thead class="styTableThead">
									<!-- Line 1 -->
									<tr class="styDepTblHdr">
										<th style="width: 90mm;text-align:justify;font-weight:normal;" scope="col" class="styFormTTablesHeaders">
											<div style="height:auto;width:auto;text-align:left;" class="styLNLeftNumBox">1
                    Name of block and title of account <img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
												<span style="width:4px;"/>
											</div>
											<div class="styBB" style="width:80mm;float:left;clear:none;border-bottom-width:0px;padding-left:3mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfBlockAndTitleOfAcctTxt"/>
												</xsl:call-template>
											</div>
										</th>
										<th style="width: 25mm; font-size:7pt;" scope="col" class="styFormTTablesHeaders "> Acres</th>
										<th style="width: 36mm; font-size:7pt;" scope="col" class="styFormTTablesHeaders "> 
                    Total cost or other basis. Give amount of March 1, 1913 appreciation, if included
                  </th>
										<th style="width: 36mm;font-size:7pt;border-right:0;" scope="col" class="styFormTTablesHeaders ">
                     Average rate per acre
                  </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<!-- Line 2 -->
									<tr class="styDepTblRow1">
										<td style="width: 90mm;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesCells ">
											<span style="float:left;font-size:7pt;">
                      2 Balance at beginning of year
                      <span class="styBoldText">
													<span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                      </span>
											</span>
										</td>
										<td style="width:25mm;height:4mm;text-align: right;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="LandOwnershipBOYGrp/AcresQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 36mm; text-align: right" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LandOwnershipBOYGrp/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 36mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LandOwnershipBOYGrp/AverageRatePerAcreAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Line 3 -->
									<tr class="styDepTblRow2">
										<td style="width: 90mm;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesCells ">
											<div style="float:left;font-size:7pt;">
                      3 Acquisitions during year
                   
                    <span class="styBoldText">
													<span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                      </span>
											</div>
										</td>
										<td style="width:25mm;height:4mm;text-align: right;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="LandOwnershipAcquisDuringYrGrp/AcresQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 36mm; text-align: right" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LandOwnershipAcquisDuringYrGrp/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 36mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LandOwnershipAcquisDuringYrGrp/AverageRatePerAcreAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Line 4 -->
									<tr class="styDepTblRow1">
										<td style="width: 90mm;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesCells ">
											<div style="float:left;font-size:7pt;">
                      4 Sales during year
                   
                    <span class="styBoldText">
													<span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                      </span>
											</div>
										</td>
										<td style="width:25mm;height:4mm;text-align: right;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="LandOwnershipSalesDuringYrGrp/AcresQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 36mm; text-align: right" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LandOwnershipSalesDuringYrGrp/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 36mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LandOwnershipSalesDuringYrGrp/AverageRatePerAcreAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Line 5 -->
									<tr class="styDepTblRow2">
										<td style="width: 90mm;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesCells ">
											<div style="float:left;font-size:7pt;">
                      5 Other changes
                    
                    <span class="styBoldText">
													<span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:15px;"/>.
                      </span>
											</div>
										</td>
										<td style="width:25mm;height:4mm;text-align: right;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="LandOwnershipOtherChangesGrp/AcresQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 36mm; text-align: right" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LandOwnershipOtherChangesGrp/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 36mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LandOwnershipOtherChangesGrp/AverageRatePerAcreAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Line 6 -->
									<tr class="styDepTblRow1">
										<td style="width: 90mm;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesCells ">
											<div style="float:left;font-size:7pt;">
												<div style="height:auto;width:auto;">6
                      Balance at end of year. Add lines 2 and 3, subtract line 4 and add or subtract line 5
                      <!--Dotted Line-->
													<span class="styBoldText">
														<span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:15px;"/>.
                      </span>
												</div>
											</div>
										</td>
										<td style="width:25mm;height:4mm;text-align: right;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="12"/>
												<xsl:with-param name="TargetNode" select="LandOwnershipBalanceEOYGrp/AcresQty"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 36mm; text-align: right;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LandOwnershipBalanceEOYGrp/TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width: 36mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LandOwnershipBalanceEOYGrp/AverageRatePerAcreAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Additional Information -->
									<tr class="styDepTblRow2">
										<td style="width: 187mm;text-align:justify;font-weight:normal;" scope="col" colspan="5" class="styFormTTablesCells ">
											<div style="font-weight:bold;padding-left:8.5mm;">Additional Information.</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AdditionalInformationTxt"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
						</xsl:for-each>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="populateparti">
		<xsl:param name="AdditionalDataMsg">false</xsl:param>
		<div class="styBB" style="width:187mm;border-top-width: 1px;">
			<div class="styPartName" style="font-size: 9pt">Part I </div>
			<div class="styPartDesc" style="font-size:9pt">Acquisitions 
        
      </div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:8mm;">1</div>
			<div class="styLNDesc" style="width:178mm;">
        Name of block and title of account<br/>
				<span style="width:2px"/>
				<xsl:if test="$AdditionalDataMsg= 'true' ">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$FormTAData"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="NameOfBlockAndTitleOfAcctTxt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:8mm;">2</div>
			<div class="styLNDesc" style="width:178mm;">
        Location of property (by legal subdivisions or map surveys)
        <br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="PropertyLocationTxt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styBB" style="width:187mm;height:22mm;">
			<div class="styLNLeftNumBoxSD" style="height:22mm;">3a</div>
			<div class="styLNDesc" style="width:145mm;height:22mm;">
        Name and address of seller or person from whom property was acquired  
        <br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="SellerName/BusinessNameLine1"/>
				</xsl:call-template>
				<xsl:if test="SellerName/BusinessNameLine2 ">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="SellerName/BusinessNameLine2"/>
					</xsl:call-template>
				</xsl:if>
				<br/>
				<xsl:choose>
					<xsl:when test="SellerUSAddress">
						<xsl:call-template name="PopulateUSAddressTemplate">
							<xsl:with-param name="TargetNode" select="SellerUSAddress"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateForeignAddressTemplate">
							<xsl:with-param name="TargetNode" select="SellerForeignAddress"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="styLNAmountBox" style="height:22mm;border-bottom-width:0px;text-align:center;float:right;">
				<b>b </b>
				<span style=" width:10px;"> </span> Date acquired
        <br/>
				<br/>
				<xsl:call-template name="PopulateMonthDayYear">
					<xsl:with-param name="TargetNode" select="AcquiredDt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
					<div class="styFormTLnDesc" style="width:19mm;">
             Amount paid: 
				   </div>
					<div class="styFormTLnDesc">
						<span class="styBoldText">a </span>
						<span style="width:3px;"/>In cash
				   </div>
				</div>
				<div style="float:right">
					<!--Dotted Line-->
					<span class="styFormTDotLnDesc">  
            ......................  
					</span>
					<div class="styLNAmountBox" style="height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="PaidCashAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;"/>
					<div class="styFormTLnDesc " style="width:19mm;">
					</div>
					<div class="styFormTLnDesc ">
						<span class="styBoldText">b </span>
						<span style="width:3px;"/>In interest-bearing notes
				    </div>
				</div>
				<div style="float:right">
					<!--Dotted Line-->
					<span class="styFormTDotLnDesc">  
            .................  
					</span>
					<div class="styLNAmountBox" style="height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="PaidInterestBearingNotesAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;"/>
					<div class="styFormTLnDesc " style="width:19mm;">
           </div>
					<div class="styFormTLnDesc">
						<span class="styBoldText">c </span>
						<span style="width:3px;"/>
               In non-interest-bearing notes  
          </div>
				</div>
				<div style="float:right">
					<!--Dotted Line-->
					<span class="styFormTDotLnDesc">  
            ................  
          </span>
					<div class="styLNAmountBox" style="height:4mm;border-bottom-width: 0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="PaidNonInterestBearingNotesAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:4mm;">5a</div>
					<div class="styFormTLnDesc">
             Amount of other consideration
          </div>
				</div>
				<div style="float:right">
					<!--Dotted Line-->
					<span class="styFormTDotLnDesc">  
            .....................  
          </span>
					<div class="styLNAmountBox" style="height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="OtherConsiderationAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4.3mm;">b</div>
					<div class="styFormTLnDesc">
              Explain the nature of other consideration and how you determined the amount shown on line 5a.
          </div>
				</div>
				<div style="float:right">
					<div class="styShadingCell" style="height:4.5mm;">        
          </div>
				</div>
			</div>
			<div style="width:187mm;height:100%;border:0 solid red;background-color:lightgrey;">
				<div style="float:left;background-color:white;border-right-width:1px;border-right-style:solid;">
					<div class="styLNLeftLtrBox" style=""/>
					<div class="styGenericDiv" style="width:147mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="OtherConsiderationNatureTxt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styShadingCell"/>
			</div>
		</div>
		<div class="styBB" style="width:187mm;height:10mm;">
			<div style="float:left">
				<div class="styLNLeftNumBoxSD" style="height:10mm;">6</div>
				<div class="styFormTLnDesc" style="height:10mm;">
           Legal expenses
        </div>
			</div>
			<div style="float:right">
				<!--Dotted Line-->
				<span class="styFormTDotLnDesc">  
          .........................  
        </span>
				<div class="styLNAmountBox" style="height:10mm;border-bottom-width: 0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="LegalExpensesAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;height:10mm;">
			<div style="float:left">
				<div class="styLNLeftNumBoxSD" style="height:10mm;">7</div>
				<div class="styFormTLnDesc">
           Cruising, surveying, and other acquisition expenses
        </div>
			</div>
			<div style="float:right">
				<!--Dotted Line-->
				<span class="styFormTDotLnDesc">  
          ...............  
        </span>
				<div class="styLNAmountBox" style="height:10mm;border-bottom-width: 0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="OtherAcquisitionExpensesAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;height:10mm;float:none;clear:both;">
			<div style="float:left">
				<div class="styLNLeftNumBoxSD" style="height:10mm;">8</div>
				<div class="styFormTLnDesc">
           Total cost or other basis of property. Add lines 4a through 7
        </div>
			</div>
			<div style="float:right">
				<!--Dotted Line-->
				<span class="styFormTDotLnDesc">  
          .............  
        </span>
				<div class="styLNAmountBox" style="height:10mm;border-bottom-width: 0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisPropAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<table summary="Allocation of total cost or other basis on books" cellpadding="0" cellspacing="0" class="styFormTTable">
			<thead class="styTableThead">
				<tr>
					<th style="width: 80mm;font-size:7pt;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesHeaders ">
						<div style="height:4mm;text-align:left;padding-left:2mm;" class="styLNLeftNumBoxSD">9</div>
						<div class="styFormTLnDesc">
               Allocation of total cost or other basis on books:
             </div>
					</th>
					<th style="width: 18mm;" scope="col" class="styFormTTablesHeaders "> Unit</th>
					<th style="width: 25mm" scope="col" class="styFormTTablesHeaders "> Number of units</th>
					<th style="width: 37mm;" scope="col" class="styFormTTablesHeaders ">
             Cost or other<br/> basis per unit
           </th>
					<th style="width: 32.5mm; border-right:0;" scope="col" class="styFormTTablesHeaders ">
             Total cost or other basis
           </th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<tr>
					<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
						<div style="float:left;font-size:7pt;">
							<div style="height:4mm;" class="styLNLeftLtrBox">a</div>
							<div class="styFormTLnDesc">
                Forested land
              </div>
						</div>
						<div class="styFormTDotLn">
              ............
            </div>
					</td>
					<td style="width: 18mm; text-align: center;" class="styFormTTablesCells ">
            Acre<span style="width:1px;"/>
					</td>
					<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="ForestedLand/UnitQty"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
					<td style="width: 31.5mm; text-align: right" class="styFormTTablesCells ">
						<xsl:choose>
							<xsl:when test="ForestedLand/CostOrOtherBasisPerUnitAmt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ForestedLand/CostOrOtherBasisPerUnitAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ForestedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						<span style="width:1px;"/>
					</td>
					<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForestedLand/TotalCostOrOtherBasisAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
				</tr>
				<tr>
					<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
						<div style="float:left;font-size:7pt;">
							<div style="height:4mm;" class="styLNLeftLtrBox">b</div>
							<div class="styFormTLnDesc">
                Other unimproved land
              </div>
						</div>
						<div class="styFormTDotLn">
              .........
            </div>
					</td>
					<td style="width: 18mm; text-align: center;" class="styFormTTablesCells ">
            Acre<span style="width:1px;"/>
					</td>
					<td style="width: 25mm;height:4mm;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="OtherUnimprovedLand/UnitQty"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
					<td style="width: 31.5mm; text-align: right" class="styFormTTablesCells ">
						<xsl:choose>
							<xsl:when test="OtherUnimprovedLand/CostOrOtherBasisPerUnitAmt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="OtherUnimprovedLand/CostOrOtherBasisPerUnitAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="OtherUnimprovedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						<span style="width:1px;"/>
					</td>
					<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="OtherUnimprovedLand/TotalCostOrOtherBasisAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
				</tr>
				<tr>
					<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
						<div style="float:left;font-size:7pt;">
							<div style="height:4mm;" class="styLNLeftLtrBox">c</div>
							<div class="styFormTLnDesc">
                Improved land (describe)
                <img src="{$ImagePath}/T_Bullet.gif" alt="Bullet Image"/>
								<span style="width:4px;"/>
							</div>
							<div class="styBB" style="width:70mm;float:left;clear:none;vertical-align:bottom;padding-left:8mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ImprovedLand/@desc"/>
								</xsl:call-template>
								<xsl:if test="not(ImprovedLand/@desc) or (ImprovedLand/@desc !='')">
									<span style="width:1px;"/>
								</xsl:if>
							</div>
						</div>
					</td>
					<td style="width: 18mm; text-align: center;vertical-align:bottom;" class="styFormTTablesCells ">
            Acre<span style="width:1px;"/>
					</td>
					<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="ImprovedLand/UnitQty"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
					<td style="width: 31.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:choose>
							<xsl:when test="ImprovedLand/CostOrOtherBasisPerUnitAmt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ImprovedLand/CostOrOtherBasisPerUnitAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ImprovedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ImprovedLand/TotalCostOrOtherBasisAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- Starting d-->
				<!-- By default this should always show 6 rows.  So, the minimum rowspan is 6-->
				<tr>
					<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells " rowspan="6">
						<xsl:if test="count(MerchantableTimber) &gt; 6">
							<xsl:attribute name="rowspan"><xsl:value-of select="count(MerchantableTimber)"/></xsl:attribute>
							<xsl:attribute name="style">width: 80mm;text-align: left;vertical-align:top;</xsl:attribute>
						</xsl:if>
						<div style="float:left;font-size:7pt;width:76mm;">
							<div style="height:20mm;" class="styLNLeftLtrBox">d</div>
							<div class="styFormTLnDesc">
                Merchantable timber. Estimate the quantity of <br/>merchantable timber present on the acquisition<br/> date (see Regulations section
                1.611-3(e)). Details<br/> of the timber estimate, made for purposes of the <br/>acquisition, should be available if your return is<br/> examined.
              </div>
						</div>
						<div style="float:left;">
							<img src="{$ImagePath}/T_Bracket_Lg.gif" alt="Bullet Image" height="85" width="6"/>
						</div>
					</td>
					<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/UnitTxt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
					<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/UnitQty"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
					<td style="width: 31.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:choose>
							<xsl:when test="MerchantableTimber[1]/CostOrOtherBasisPerUnitAmt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/CostOrOtherBasisPerUnitAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/CostOrOtherBasisPerUnitDcmlAmt"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/TotalCostOrOtherBasisAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
				</tr>
				<xsl:for-each select="MerchantableTimber">
					<xsl:if test="position() != 1">
						<tr>
							<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="UnitTxt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="12"/>
									<xsl:with-param name="TargetNode" select="UnitQty"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width: 31.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:choose>
									<xsl:when test="CostOrOtherBasisPerUnitAmt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="count(MerchantableTimber)&lt;1">
					<xsl:call-template name="PopulateEmptyTableRow"/>
				</xsl:if>
				<xsl:if test="count(MerchantableTimber)&lt;2">
					<xsl:call-template name="PopulateEmptyTableRow"/>
				</xsl:if>
				<xsl:if test="count(MerchantableTimber)&lt;3">
					<xsl:call-template name="PopulateEmptyTableRow"/>
				</xsl:if>
				<xsl:if test="count(MerchantableTimber)&lt;4">
					<xsl:call-template name="PopulateEmptyTableRow"/>
				</xsl:if>
				<xsl:if test="count(MerchantableTimber)&lt;5">
					<xsl:call-template name="PopulateEmptyTableRow"/>
				</xsl:if>
				<xsl:if test="$FormTAData">
					<xsl:if test="MerchantableTimber">
						<xsl:if test="count(MerchantableTimber)&lt;6">
							<xsl:call-template name="PopulateEmptyTableRow"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<!-- starting e-->
				<tr>
					<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells " rowspan="4">
						<xsl:if test="count(PremerchantableTimber) &gt; 4">
							<xsl:attribute name="rowspan"><xsl:value-of select="count(PremerchantableTimber)"/></xsl:attribute>
							<xsl:attribute name="style">width: 80mm;text-align: left;vertical-align:top;</xsl:attribute>
						</xsl:if>
						<div style="float:left;font-size:7pt;width:76mm;">
							<div style="height:12mm;" class="styLNLeftLtrBox">e</div>
							<div class="styFormTLnDesc">
                Premerchantable timber. Make an allocation here<br/> only if it is a factor in the total cost or value of the<br/> land.
              </div>
						</div>
						<div style="float:left;">
							<img src="{$ImagePath}/T_Bracket_Sm.gif" alt="Bullet Image" height="56" width="6"/>
						</div>
					</td>
					<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/UnitTxt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
					<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/UnitQty"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
					<td style="width: 31.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:choose>
							<xsl:when test="PremerchantableTimber[1]/CostOrOtherBasisPerUnitAmt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/CostOrOtherBasisPerUnitAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/CostOrOtherBasisPerUnitDcmlAmt"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						<span style="width:1px;"/>
					</td>
					<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/TotalCostOrOtherBasisAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
				</tr>
				<xsl:for-each select="PremerchantableTimber">
					<xsl:if test="position() != 1">
						<tr>
							<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="UnitTxt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="12"/>
									<xsl:with-param name="TargetNode" select="UnitQty"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width: 31.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:choose>
									<xsl:when test="CostOrOtherBasisPerUnitAmt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="count(PremerchantableTimber)&lt;1">
					<xsl:call-template name="PopulateEmptyTableRow"/>
				</xsl:if>
				<xsl:if test="count(PremerchantableTimber)&lt;2">
					<xsl:call-template name="PopulateEmptyTableRow"/>
				</xsl:if>
				<xsl:if test="count(PremerchantableTimber)&lt;3">
					<xsl:call-template name="PopulateEmptyTableRow"/>
				</xsl:if>
				<xsl:if test="$FormTAData">
					<xsl:if test="PremerchantableTimber">
						<xsl:if test="count(PremerchantableTimber)&lt;4">
							<xsl:call-template name="PopulateEmptyTableRow"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<!-- starting f-->
				<tr>
					<td style="width: 80mm;text-align: left;vertical-align:top;border-bottom-width:0px;" scope="row" class="styFormTTablesCells ">
						<div style="float:left;font-size:7pt;width:77mm;">
							<div style="height:4mm;" class="styLNLeftLtrBox">f</div>
							<div class="styFormTLnDesc">
                Improvements (list separately)
              </div>
						</div>
					</td>
					<td style="width: 18mm; text-align: center;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
						<span style="width:1px;"/>
					</td>
					<td style="width: 25mm;height:4mm;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
						<span style="width:1px;"/>
					</td>
					<td style="width: 31.5mm; text-align: right;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
						<span style="width:1px;"/>
					</td>
					<td style="width: 32.5mm; height:4mm; border-right:0;border-bottom-width:0px;" class="styFormTTablesCells ">
						<span style="width:1px;"/>
					</td>
				</tr>
				<xsl:for-each select="Improvement">
					<tr>
						<td style="width:80mm;text-align: left;border-bottom-width:0px;" scope="row" class="styFormTTablesCells ">
							<xsl:if test="position() = last() and position() &gt;= 6">
								<xsl:attribute name="style">width:80mm;text-align: left;</xsl:attribute>
							</xsl:if>
							<div style="float:left;font-size:7pt;height:8mm;">
								<div style="height:8mm;" class="styLNLeftLtrBox"/>
								<xsl:choose>
									<xsl:when test="position() = last() and position() &gt;= 6">
										<div style="width:70mm;height:8mm;float:left;clear:none;padding-top:6px;" class="styGenericDiv">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div style="width:70mm;height:8mm;float:left;clear:none;padding-top:6px;" class="styBB">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<span style="width:1px;"/>
						</td>
						<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="UnitTxt"/>
							</xsl:call-template>
						</td>
						<td style="width: 25mm;height:8mm;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="UnitQty"/>
							</xsl:call-template>
						</td>
						<td style="width: 31.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:choose>
								<xsl:when test="CostOrOtherBasisPerUnitAmt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td style="width: 32.5mm; height:8mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
				</xsl:for-each>
				<xsl:if test="count(Improvement)&lt;1">
					<xsl:call-template name="PopulateEmptyTableRowForImprovements"/>
				</xsl:if>
				<xsl:if test="count(Improvement)&lt;2">
					<xsl:call-template name="PopulateEmptyTableRowForImprovements"/>
				</xsl:if>
				<xsl:if test="count(Improvement)&lt;3">
					<xsl:call-template name="PopulateEmptyTableRowForImprovements"/>
				</xsl:if>
				<xsl:if test="count(Improvement)&lt;4">
					<xsl:call-template name="PopulateEmptyTableRowForImprovements"/>
				</xsl:if>
				<xsl:if test="count(Improvement)&lt;5">
					<xsl:call-template name="PopulateEmptyTableRowForImprovements"/>
				</xsl:if>
				<xsl:if test="count(Improvement)&lt;6">
					<xsl:call-template name="PopulateEmptyTableRowForImprovements">
						<xsl:with-param name="end">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<tr>
					<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
						<div style="float:left;font-size:7pt;">
							<div style="height:4mm;" class="styLNLeftLtrBox">g</div>
							<div class="styFormTLnDesc">
                Mineral rights
              </div>
						</div>
						<div class="styFormTDotLn">
              ............
            </div>
					</td>
					<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="MineralRights/UnitTxt"/>
						</xsl:call-template>
					</td>
					<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="MineralRights/UnitQty"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
					<td style="width: 31.5mm; text-align: right;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:choose>
							<xsl:when test="MineralRights/CostOrOtherBasisPerUnitAmt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="MineralRights/CostOrOtherBasisPerUnitAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="MineralRights/CostOrOtherBasisPerUnitDcmlAmt"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						<span style="width:1px;"/>
					</td>
					<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="MineralRights/TotalCostOrOtherBasisAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
				</tr>
				<tr>
					<td style="width: 155mm;text-align: left;" scope="row" class="styFormTTablesCells " colspan="4">
						<div style="float:left;font-size:7pt;">
							<div style="height:4mm;" class="styLNLeftLtrBox">h</div>
							<div class="styFormTLnDesc">
                 Total cost or other basis (same amount as line 8). Add lines 9a through 9g              
              </div>
						</div>
						<div class="styFormTDotLn">
              ...........
            </div>
					</td>
					<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisPropAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
				</tr>
			</tbody>
		</table>
		<xsl:choose>
			<xsl:when test="(position() = count($FormTAData)) or (count($FormTAData)=0)">
				<div style="width:187mm;clear:both;padding-top:1mm;">
					<span style="width:100mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</span>
					<span style="width:33mm;font-weight:normal;" class="styGenericDiv">Cat. No. 16717G</span>
					<span style="float:right;" class="styGenericDiv">Form <span class="styBoldText">T (Timber)</span> (Rev. 12-2013)</span>
				</div>
				<div style="width:187mm;"/>
				<div style="width:187mm;padding-top:1mm;" class="pageEnd"/>
				<div style="width:187mm;"/>
			</xsl:when>
			<xsl:otherwise>
				<div style="width:187mm;"/>
				<div style="width:187mm;padding-top:1mm;" class="pageEnd"/>
				<div style="width:187mm;"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="populatepartii">
		<xsl:param name="AdditionalDataMsg">false</xsl:param>
		<div class="styBB" style="width:187mm;padding-bottom:.5mm;">
			<div style="float:left;">Form T (Timber) (Rev. 12-2013)<span style="width:128mm;"/>
			</div>
			<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div class="styPartName" style="font-size: 9pt">Part II </div>
			<div class="styPartDesc" style="font-size:9pt">Timber Depletion <span style="font-weight:normal;">(see instructions)</span>
			</div>
		</div>
		<div class="styBB" style="width:187mm;height:6mm;">
			<div style="width:187mm;height:6mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:6mm;">1</div>
					<div class="styGenericDiv" style="width:50mm;padding-top:.5mm;">
             Name of block and title of account <span style="width:4px;"/>
						<img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
						<span style="width:4px;"/>
					</div>
					<div style="width:129mm;" class="styFixedUnderline">
						<xsl:if test="$AdditionalDataMsg= 'true' ">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormTADataII"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="NameOfBlockAndTitleOfAcctTxt"/>
						</xsl:call-template>
						<xsl:if test="not(NameOfBlockAndTitleOfAcctTxt) or (NameOfBlockAndTitleOfAcctTxt !='')">
							<span style="width:1px;"/>
						</xsl:if>
					</div>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;height:12mm;">
			<div style="width:187mm;height:12mm;">
				<div style="width:122mm; height:12mm; border-top-width:1px; border-right-width:25px; float:left;">
					<div class="styGenericDiv" style="width:122mm;padding-bottom:1mm;padding-left:8mm;">
            If you express timber quantity in thousand board feet (MBF), <br/>
            log scale, name the log rule used. If another unit of measure is <br/> 
            used, provide details 
            <img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
						<span style="width:4px;"/>
						<span style="width:81mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="LogRuleUsedTxt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<div style="float:right;font-weight:bold;height:12mm;width:64mm;">
					<div class="styLNAmountBoxNBB" style="height:4mm;text-align:center;background-color:lightgrey;border-bottom-width:1px;">
          </div>
					<div class="styLNAmountBoxNBB" style="height:4mm;text-align:center;background-color:lightgrey;border-bottom-width:1px;">
          </div>
					<div class="styLNAmountBoxNBB" style="height:8mm;text-align:center;">
            (a) <br/>Quantity
          </div>
					<div class="styLNAmountBoxNBB" style="height:8mm;text-align:center;">
            (b) <br/>Cost or other basis
          </div>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
					<div class="styFormTLnDesc">
             Estimated quantity of timber and cost or other basis returnable through depletion
           </div>
				</div>
				<div style="float:right">
					<div class="styLNAmountBoxNBB" style="height:4mm;">
          </div>
					<div class="styLNAmountBoxNBB" style="height:4mm;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;"/>
					<div class="styFormTLnDesc">
             at end of the preceding tax year
          </div>
				</div>
				<div style="float:right">
					<span style="float:left" class="styFormTDotLn">
              .................
          </span>
					<div class="styLNAmountBox" style="height:4.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="TimberEndOfPrecedingTYEstQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="height:4.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="CostRetThruDpltnEndPrecTYAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:7mm;padding-top:3.5mm;">3</div>
					<div class="styFormTLnDescPartII ">
             Increase or decrease of quantity of timber required by way of correction
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              ....
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="IncreaseOrDecreaseTimberQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="height:7.5mm;background-color:lightgrey;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:7mm;padding-top:3.5mm;">4a</div>
					<div class="styFormTLnDescPartII ">
             Addition for growth (number of years covered
             <span style="width:4px;"/>
						<img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
						<span style="width:3px;"/>
					</div>
				</div>
				<div style="float:left;height:7mm;padding-top:3.5mm;">
					<span class="styBB" style="width:39mm;float:left;clear:none;text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="20"/>
							<xsl:with-param name="TargetNode" select="AdditionForGrowthQty/@yearsCoveredCnt"/>
						</xsl:call-template>
						<xsl:if test="not(AdditionForGrowthQty/@yearsCoveredCnt) or (AdditionForGrowthQty/@yearsCoveredCnt !='')">
							<span style="width:1px;"/>
						</xsl:if>
					</span> )
        </div>
				<div style="float:right">
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="AdditionForGrowthQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="height:7.5mm;background-color:lightgrey;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftLtrBox" style="height:7mm;padding-left:4mm;padding-top:3.5mm;">b</div>
					<div class="styFormTLnDescPartII ">
             Transfers from premerchantable timber account
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              ............
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="TrnsfrPrmrchTmbrAcctQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="TrnsfrPrmrchTmbrAcctCostAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftLtrBox" style="height:7mm;padding-left:4mm;padding-top:3.5mm;">c</div>
					<div class="styFormTLnDescPartII ">
             Transfers from deferred reforestation account
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              .............
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="TransfersFromDefrdRforAcctQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="TrnsfrFromDefrdRforAcctCostAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:7mm;padding-top:3.5mm;">5</div>
					<div class="styFormTLnDescPartII ">
             Timber acquired during tax year
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              .................
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="TimberAcquiredDuringYearQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="TimberAcquiredDuringYrCostAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:7mm;padding-top:3.5mm;">6</div>
					<div class="styFormTLnDescPartII ">
             Addition to capital during tax year
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              ................
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;background-color:lightgrey;">
          </div>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="AdditionToCapitalDurYrCostAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:7mm;padding-top:3.5mm;">7</div>
					<div class="styFormTLnDescPartII ">
             Total at end of tax year, before depletion. Add lines 2 through 6
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              ......
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="TotalEOYBeforeDepletionQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="TotalEOYBeforeDepletionCostAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
					<div class="styFormTLnDesc" style="height:4mm;">
             Unit rate returnable through depletion, or basis of sales or losses. Divide line 7,
          </div>
				</div>
				<div style="float:right">
					<div class="styLNAmountBoxNBB" style="height:4mm;background-color:lightgrey;">
          </div>
					<div class="styLNAmountBoxNBB" style="height:4mm;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;"/>
					<div class="styFormTLnDesc" style="height:4mm;">
             column (b), by line 7, column (a)
          </div>
				</div>
				<div style="float:right">
					<span style="float:left" class="styFormTDotLn">
              .................
          </span>
					<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;">
          </div>
					<div class="styLNAmountBox" style="height:4.5mm; font-size:6pt">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ReturnableOrSlsLossesBssUnitRt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- line 9 -->
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:7mm;padding-top:3.5mm;">9</div>
					<div class="styFormTLnDescPartII ">
             Quantity of timber cut during tax year
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              ...............
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="TimberCutDuringYearQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="height:7.5mm;background-color:lightgrey;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:7mm;padding-top:3.5mm;">10</div>
					<div class="styFormTLnDescPartII ">
             Depletion for the current tax year. Multiply line 8 by line 9
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              ........
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;background-color:lightgrey;">
          </div>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="DepletionForCurrentTaxYearAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:7mm;padding-top:3.5mm;">11</div>
					<div class="styFormTLnDescPartII ">
             Quantity of standing timber sold or otherwise disposed of during tax year
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              ....
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="StandingTimberSoldDuringYrQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="height:7.5mm;background-color:lightgrey;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:7mm;padding-top:3.5mm;">12</div>
					<div class="styFormTLnDescPartII ">
             Allowable as basis of sale. Multiply line 8 by line 11
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              ..........
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;background-color:lightgrey;">
          </div>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="AllowableBasisSaleAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:7mm;padding-top:3.5mm;">13</div>
					<div class="styFormTLnDescPartII ">
             Quantity of standing timber lost by fire or other cause during tax year
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              .....
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="LostByFireOrOtherCauseDurYrQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="height:7.5mm;background-color:lightgrey;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:7mm;padding-top:3.5mm;">14</div>
					<div class="styFormTLnDescPartII ">
             Allowable basis of loss plus any excess amount where decrease in FMV (before and
          </div>
				</div>
				<div style="float:right">
					<div class="styLNAmountBoxNBB" style="height:7.5mm;background-color:lightgrey;">
          </div>
					<div class="styLNAmountBoxNBB" style="height:7.5mm;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;"/>
					<div class="styFormTLnDesc" style="height:4mm;">
              after the casualty) exceeds the standard depletion amount, but not the block basis
          </div>
				</div>
				<div style="float:right">
					<div class="styLNAmountBoxNBB" style="height:4mm;background-color:lightgrey;">
          </div>
					<div class="styLNAmountBoxNBB" style="height:4mm;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;"/>
					<div class="styFormTLnDesc" style="height:4mm;">
            (see instructions)
          </div>
				</div>
				<div style="float:right">
					<span style="float:left" class="styFormTDotLn">
              ....................
          </span>
					<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;">
          </div>
					<div class="styLNAmountBox" style="height:4.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="AllowableBasisOfLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- line 15 -->
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;">15</div>
					<div class="styFormTLnDesc" style="height:4mm;">
             Total reductions during tax year:
          </div>
				</div>
				<div style="float:right">
					<div class="styLNAmountBoxNBB" style="height:4mm;">
          </div>
					<div class="styLNAmountBoxNBB" style="height:4mm;background-color:lightgrey;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4.3mm;">a</div>
					<div class="styFormTLnDesc" style="height:4mm;">
            In column (a), add lines 9, 11, and 13
          </div>
				</div>
				<div style="float:right">
					<span style="float:left" class="styFormTDotLn">
              ...............
          </span>
					<div class="styLNAmountBox" style="height:4.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="TotalReductionsDuringYearQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftLtrBox" style="height:7mm;padding-top:3.5mm;padding-left:4.3mm;">b</div>
					<div class="styFormTLnDescPartII ">
              In column (b), add lines 10, 12, and 14
          </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              ...............
          </span>
					<div class="styLNAmountBox" style="height:7.5mm;background-color:lightgrey;">
          </div>
					<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="TotalReductionsDuringYrCostAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;">16</div>
					<div class="styFormTLnDesc" style="height:4mm;">
             Net quantity and value at end of tax year. In column (a), subtract line 15a from
          </div>
				</div>
				<div style="float:right">
					<div class="styLNAmountBoxNBB" style="height:4mm;">
          </div>
					<div class="styLNAmountBoxNBB" style="height:4mm;">
          </div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftLtrBox" style="height:4mm;"/>
					<div class="styFormTLnDesc" style="height:4mm;">
              line 7. In column (b), subtract line 15b from line 7
          </div>
				</div>
				<div style="float:right">
					<span style="float:left" class="styFormTDotLn">
              .........
          </span>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="NetEndOfYearQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="NetValueAtEndOfYearAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;padding-top:3.5mm;">17</div>
					<div class="styFormTLnDescPartII ">
              Quantity of cut timber that was sold as logs or other rough products
           </div>
				</div>
				<div style="float:right">
					<span class="styFormTDotLnForPartII">
              .............
          </span>
					<div class="styLNAmountBoxNBB" style="height:7mm;padding-top:3.5mm;border-bottom-width:1px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="TimberSoldAsLogsQty"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
		</div>
		<!-- Part II line 18 -->
		<div style="width:187mm;float:left;">
			<div style="float:left">
				<div class="styLNLeftNumBox" style="height:4mm;">18</div>
				<div class="styFormTLnDesc" style="height:4mm;font-weight:bold;">Section 631(a):</div>
			</div>
		</div>
		<div style="width:187mm;float:left;">
			<div style="float:left">
				<div class="styLNLeftLtrBox" style="height:7mm;padding-left:4.3mm;">a</div>
				<div class="styGenericDiv" style="width:153mm;height:7mm;padding-top:.5mm;padding-bottom:.5mm;">
            Are you electing, or have you made an election in a prior tax year that is in effect, to report gains or losses from the cutting of timber under section 631(a)? (see instructions)
            <span class="styDotLn" style="float:none;clear:none;">....................</span>
				</div>
			</div>
			<div style="float:right;padding-top:2.5mm;">
				<div class="styLNDesc" style="width:12mm;text-align:right;">
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
							</xsl:call-template>
						</input>
					</span>
					<label style="font-weight:bold;">
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
						</xsl:call-template>
              Yes
            </label>
				</div>
				<div class="styLNDesc" style="width:12mm;text-align:right;">
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
							</xsl:call-template>
						</input>
					</span>
					<label style="font-weight:bold;">
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="Section631aElectionInd"/>
						</xsl:call-template>
                  No
                </label>
				</div>
			</div>
		</div>
		<div style="width:187mm;float:left;">
			<div style="float:left">
				<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4.3mm;">b</div>
				<div class="styFormTLnDescPartII " style="padding-top:.5mm;height:4mm;">
             Are you revoking your section 631(a) election (see instructions)?
            <span class="styDotLn" style="float:none;clear:none;">..................</span>
				</div>
			</div>
			<div style="float:right;">
				<div class="styLNDesc" style="width:12mm;text-align:right;">
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
							</xsl:call-template>
						</input>
					</span>
					<label style="font-weight:bold;">
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
						</xsl:call-template>
                Yes
              </label>
				</div>
				<div class="styLNDesc" style="width:12mm;text-align:right;">
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
							</xsl:call-template>
						</input>
					</span>
					<label style="font-weight:bold;">
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="Section631aRevocationInd"/>
						</xsl:call-template>
                  No
                </label>
				</div>
			</div>
			<div style="width:187mm;" class="styBB">
				<span style="width:140mm;"/>
             Effective date <img src="{$ImagePath}/T_Bullet.gif" alt="Bullet Image"/>
				<xsl:call-template name="PopulateMonthDayYear">
					<xsl:with-param name="TargetNode" select="EffectiveDt"/>
				</xsl:call-template>
			</div>
		</div>
		<xsl:call-template name="populatefooter"/>
	</xsl:template>
	<xsl:template name="populatepartiii">
		<xsl:param name="AdditionalDataMsg">false</xsl:param>
		<div class="styBB" style="width:187mm;padding-bottom:.5mm;">
			<div style="float:left;">Form T (Timber) (Rev. 12-2013)<span style="width:128mm;"/>
			</div>
			<div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;">3</span>
			</div>
		</div>
		<!-- Part III -->
		<div class="styBB" style="width:187mm;">
			<div class="styPartName" style="font-size: 9pt">Part III</div>
			<div class="styPartDesc" style="font-size:9pt">Profit or Loss From Land and Timber Sales <span style="font-weight:normal">(see instructions)</span>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:8mm;">1</div>
			<div class="styLNDesc" style="width:178mm;height:8mm;">
        Name of block and title of account<br/>
				<span style="width:2px"/>
				<xsl:if test="$AdditionalDataMsg= 'true' ">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$FormTADataIII"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="NameOfBlockAndTitleOfAcctTxt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:8mm;">2</div>
			<div class="styLNDesc" style="width:178mm;height:8mm;">
        Location of property (by legal subdivisions or map surveys)
        <br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="PropertyLocationTxt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styBB" style="width:187mm;height:22mm;">
			<div class="styLNLeftNumBoxSD" style="height:22mm;">3a</div>
			<div class="styLNDesc" style="width:145mm;height:22mm;">
        Purchaser's name and address  
        <br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="PurchaserName/BusinessNameLine1"/>
				</xsl:call-template>
				<xsl:if test="PurchaserName/BusinessNameLine2 ">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="PurchaserName/BusinessNameLine2"/>
					</xsl:call-template>
				</xsl:if>
				<br/>
				<xsl:choose>
					<xsl:when test="PurchaserUSAddress">
						<xsl:call-template name="PopulateUSAddressTemplate">
							<xsl:with-param name="TargetNode" select="PurchaserUSAddress"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateForeignAddressTemplate">
							<xsl:with-param name="TargetNode" select="PurchaserForeignAddress"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="styLNAmountBox" style="height:22mm;border-bottom-width:0px;text-align:center;float:right;">
				<b>b </b>
				<span style=" width:10px;"> </span> Date of sale
              <br/>
				<br/>
				<xsl:call-template name="PopulateMonthDayYear">
					<xsl:with-param name="TargetNode" select="SaleDt"/>
				</xsl:call-template>
			</div>
		</div>
		<!-- Part III line 4 -->
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
					<div class="styFormTLnDesc" style="width:25mm;">
             Amount received: 
           </div>
					<div class="styFormTLnDesc">
						<span class="styBoldText">a </span>
						<span style="width:3px;"/>In cash
           </div>
				</div>
				<div style="float:right">
					<!--Dotted Line-->
					<span class="styFormTDotLnDesc">  
            ......................
          </span>
					<div class="styLNAmountBox" style="height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="CashReceivedAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;"/>
					<div class="styFormTLnDesc" style="width:25mm;">
           </div>
					<div class="styFormTLnDesc">
						<span class="styBoldText">b </span>
						<span style="width:3px;"/>In interest-bearing notes
           </div>
				</div>
				<div style="float:right">
					<!--Dotted Line-->
					<span class="styFormTDotLnDesc">  
            .................  
          </span>
					<div class="styLNAmountBox" style="height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="InterestBearingNotesRcvdAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;"/>
					<div class="styFormTLnDesc" style="width:25mm;">
           </div>
					<div class="styFormTLnDesc">
						<span class="styBoldText">c </span>
						<span style="width:3px;"/>
               In non-interest-bearing notes  
          </div>
				</div>
				<div style="float:right">
					<!--Dotted Line-->
					<span class="styFormTDotLnDesc">  
            ................
          </span>
					<div class="styLNAmountBox" style="height:4mm;border-bottom-width: 0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="NonInterestBearingNotesRcvdAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBoxSD" style="height:4mm;">5a</div>
					<div class="styFormTLnDesc">
             Amount of other consideration
           </div>
				</div>
				<div style="float:right">
					<!--Dotted Line-->
					<span class="styFormTDotLnDesc">  
            .....................  
          </span>
					<div class="styLNAmountBox" style="height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="OtherConsiderationAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4.2mm;">b</div>
					<div class="styFormTLnDesc">
              Explain the nature of other consideration and how you determined the amount shown on line 5a:  
           </div>
				</div>
				<div style="float:right">
					<div class="styShadingCell" style="height:4.5mm;">        
          </div>
				</div>
			</div>
			<div style="width:187mm;height:100%;border:0 solid red;background-color:lightgrey;">
				<div style="float:left;background-color:white;border-right-width:1px;border-right-style:solid;">
					<div class="styLNLeftLtrBox" style=""/>
					<div class="styGenericDiv" style="width:147mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="OtherConsiderationNatureTxt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styShadingCell"/>
			</div>
		</div>
		<div class="styBB" style="width:187mm;clear:both;">
			<div style="float:left">
				<div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
				<div class="styFormTLnDesc">
          Total amount received for property. Add lines 4a, 4b, 4c, and 5a
        </div>
			</div>
			<div style="float:right">
				<!--Dotted Line-->
				<span class="styFormTDotLnDesc">  
          ..........
        </span>
				<div class="styLNAmountBox" style="height:4mm;border-bottom-width: 0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="TotalReceivedForPropertyAmt"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!--Part III line 7 -->
		<div class="styBB" style="width:187mm;clear:both;">
			<table summary="Allocation of total cost or other basis on books" cellpadding="0" cellspacing="0" class="styFormTTable">
				<thead class="styTableThead">
					<tr>
						<th style="width: 80mm;font-size:7pt;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesHeaders ">
							<div style="height:4mm;text-align:left;" class="styLNLeftNumBoxSD">7</div>
							<div class="styGenericDiv" style="padding-top:.5mm;padding-bottom:.5mm;">
               Cost or other basis of property:
             </div>
						</th>
						<th style="width: 18mm;" scope="col" class="styFormTTablesHeaders "> Unit</th>
						<th style="width: 25mm; " scope="col" class="styFormTTablesHeaders "> Number of units</th>
						<th style="width: 37mm;" scope="col" class="styFormTTablesHeaders ">
             Cost or other<br/> basis per unit
           </th>
						<th style="width: 32.5mm;border-right:0;" scope="col" class="styFormTTablesHeaders ">
             Total cost or other basis
           </th>
					</tr>
				</thead>
				<tfoot/>
				<tbody>
					<tr>
						<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftLtrBox">a</div>
								<div class="styFormTLnDesc">
                Forested land
							</div>
							</div>
							<div class="styFormTDotLn">
              ...........
            </div>
						</td>
						<td style="width: 18mm; text-align: center;" class="styFormTTablesCells ">
            Acre<span style="width:1px;"/>
						</td>
						<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="ForestedLand/UnitQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width:  31.5mm; text-align: righ;vertical-align:bottom;font-size:6pt;" class="styFormTTablesCells ">
							<xsl:choose>
								<xsl:when test="ForestedLand/CostOrOtherBasisPerUnitAmt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ForestedLand/CostOrOtherBasisPerUnitAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ForestedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<span style="width:1px;"/>
						</td>
						<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ForestedLand/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftLtrBox">b</div>
								<div class="styFormTLnDesc">
                Nonforested land
              </div>
							</div>
							<div class="styFormTDotLn">
              ...........
            </div>
						</td>
						<td style="width: 18mm; text-align: center;" class="styFormTTablesCells ">
            Acre<span style="width:1px;"/>
						</td>
						<td style="width: 25mm;height:4mm;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="NonforestedLand/UnitQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 31.5mm; text-align: right;font-size:6pt;" class="styFormTTablesCells ">
							<xsl:choose>
								<xsl:when test="NonforestedLand/CostOrOtherBasisPerUnitAmt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="NonforestedLand/CostOrOtherBasisPerUnitAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="NonforestedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<span style="width:1px;"/>
						</td>
						<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="NonforestedLand/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftLtrBox">c</div>
								<div class="styFormTLnDesc">
                Improved land (describe)
                <img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
									<span style="width:4px;"/>
								</div>
								<div class="styBB" style="width:70mm;float:left;clear:none;padding-left:8mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ImprovedLand/@desc"/>
									</xsl:call-template>
									<xsl:if test="not(ImprovedLand/@desc) or (ImprovedLand/@desc !='')">
										<span style="width:1px;"/>
									</xsl:if>
								</div>
							</div>
						</td>
						<td style="width: 18mm; text-align: center;vertical-align:bottom;" class="styFormTTablesCells ">
            Acre<span style="width:1px;"/>
						</td>
						<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="ImprovedLand/UnitQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width:  31.5mm; text-align: right;vertical-align:bottom;font-size:6pt;" class="styFormTTablesCells ">
							<xsl:choose>
								<xsl:when test="ImprovedLand/CostOrOtherBasisPerUnitAmt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ImprovedLand/CostOrOtherBasisPerUnitAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ImprovedLand/CostOrOtherBasisPerUnitDcmlAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<span style="width:1px;"/>
						</td>
						<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ImprovedLand/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part III Starting 7 d-->
					<!-- By default this should always show 6 rows.  So, the minimum rowspan is 6-->
					<tr>
						<td style="width: 80mm;text-align: left;vertical-align:top;" scope="row" class="styFormTTablesCells " rowspan="12">
							<xsl:if test="count(MerchantableTimber) &gt; 12">
								<xsl:attribute name="rowspan"><xsl:value-of select="count(MerchantableTimber)"/></xsl:attribute>
								<xsl:attribute name="style">width: 80mm;text-align: left;vertical-align:top;</xsl:attribute>
							</xsl:if>
							<div style="float:left;font-size:7pt;width:76mm;">
								<div style="height:20mm;" class="styLNLeftLtrBox">d</div>
								<div class="styFormTLnDesc">
            Merchantable timber. Estimate in detail the <br/>quantity of merchantable timber on the date of sale <br/>or exchange. Include the quantity of
            timber in each <br/>species of timber by diameter at breast height <br/>(DBH) classes. State the log rule used if the unit of <br/>measure is thousand 
            board feet (MBF), log scale. If <br/>another unit of measure is used, provide details. <img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
									<br/>
								</div>
							</div>
							<div style="float:left;">
								<img alt="Bullet Image" src="{$ImagePath}/T_Bracket_Lg.gif" height="85" width="6"/>
							</div>
							<xsl:for-each select="LogRuleUsedTxt">
								<div style="height:4.5mm;" class="styLNLeftLtrBox"/>
								<div class="styBB" style="height:4.5mm;width:66mm;float:left;clear:none;padding-top:.5mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<xsl:if test="not(.) or (. !='')">
										<span style="width:1px;"/>
									</xsl:if>
								</div>
							</xsl:for-each>
							<xsl:if test="count(LogRuleUsedTxt) = 0">
								<span class="styBB" style="width:65mm;height:5mm;margin-left:8mm;"/>
								<span class="styBB" style="width:65mm;height:5mm;margin-left:8mm;"/>
								<span class="styBB" style="width:65mm;height:5mm;margin-left:8mm;"/>
								<span class="styBB" style="width:65mm;height:5mm;margin-left:8mm;"/>
							</xsl:if>
						</td>
						<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/UnitTxt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/UnitQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width:  31.5mm; text-align: right;vertical-align:bottom;font-size:6pt;" class="styFormTTablesCells ">
							<xsl:choose>
								<xsl:when test="MerchantableTimber[1]/CostOrOtherBasisPerUnitAmt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/CostOrOtherBasisPerUnitAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/CostOrOtherBasisPerUnitDcmlAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<span style="width:1px;"/>
						</td>
						<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MerchantableTimber[1]/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<xsl:for-each select="MerchantableTimber">
						<xsl:if test="position() != 1">
							<tr>
								<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="UnitTxt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="MaxSize" select="12"/>
										<xsl:with-param name="TargetNode" select="UnitQty"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td style="width:  31.5mm; text-align: right;vertical-align:bottom;font-size:6pt;" class="styFormTTablesCells ">
									<xsl:choose>
										<xsl:when test="CostOrOtherBasisPerUnitAmt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<span style="width:1px;"/>
								</td>
								<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="count(MerchantableTimber)&lt;1">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(MerchantableTimber)&lt;2">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(MerchantableTimber)&lt;3">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(MerchantableTimber)&lt;4">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(MerchantableTimber)&lt;5">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(MerchantableTimber)&lt;6">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(MerchantableTimber)&lt;7">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(MerchantableTimber)&lt;8">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(MerchantableTimber)&lt;9">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(MerchantableTimber)&lt;10">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(MerchantableTimber)&lt;11">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="$FormTADataIII">
						<xsl:if test="MerchantableTimber">
							<xsl:if test="count(MerchantableTimber)&lt;12">
								<xsl:call-template name="PopulateEmptyTableRow"/>
							</xsl:if>
						</xsl:if>
					</xsl:if>
					<!-- Part III starting 7 e-->
					<tr>
						<td style="width: 80mm;text-align: left;vertical-align:center;" scope="row" class="styFormTTablesCells " rowspan="4">
							<xsl:if test="count(PremerchantableTimber) &gt; 4">
								<xsl:attribute name="rowspan"><xsl:value-of select="count(PremerchantableTimber)"/></xsl:attribute>
								<xsl:attribute name="style">width: 80mm;text-align: left;vertical-align:top;</xsl:attribute>
							</xsl:if>
							<div style="float:left;font-size:7pt;width:76mm;">
								<div style="height:12mm;" class="styLNLeftLtrBox">
									<xsl:if test="count(PremerchantableTimber) &lt; 5">
										<xsl:attribute name="style">height:12mm;padding-top:5mm;</xsl:attribute>
									</xsl:if>
                e
              </div>
								<div class="styFormTLnDesc">
									<xsl:if test="count(PremerchantableTimber) &lt; 5">
										<xsl:attribute name="style">padding-top:5mm;</xsl:attribute>
									</xsl:if>
                Premerchantable timber
                <!--Dotted Line-->
									<span style="letter-spacing:4mm; font-weight:bold;">  
                    .......
                  </span>
								</div>
							</div>
							<div style="float:left;">
								<img alt="Bullet Image" src="{$ImagePath}/T_Bracket_Sm.gif" height="56" width="6"/>
							</div>
						</td>
						<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/UnitTxt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/UnitQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width:  31.5mm; text-align: right;vertical-align:bottom;font-size:6pt;" class="styFormTTablesCells ">
							<xsl:choose>
								<xsl:when test="PremerchantableTimber[1]/CostOrOtherBasisPerUnitAmt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/CostOrOtherBasisPerUnitAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/CostOrOtherBasisPerUnitDcmlAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<span style="width:1px;"/>
						</td>
						<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PremerchantableTimber[1]/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<xsl:for-each select="PremerchantableTimber">
						<xsl:if test="position() != 1">
							<tr>
								<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="UnitTxt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="MaxSize" select="12"/>
										<xsl:with-param name="TargetNode" select="UnitQty"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td style="width:  31.5mm; text-align: right;vertical-align:bottom;font-size:6pt;" class="styFormTTablesCells ">
									<xsl:choose>
										<xsl:when test="CostOrOtherBasisPerUnitAmt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<span style="width:1px;"/>
								</td>
								<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="count(PremerchantableTimber)&lt;1">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(PremerchantableTimber)&lt;2">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="count(PremerchantableTimber)&lt;3">
						<xsl:call-template name="PopulateEmptyTableRow"/>
					</xsl:if>
					<xsl:if test="$FormTADataIII">
						<xsl:if test="PremerchantableTimber">
							<xsl:if test="count(PremerchantableTimber)&lt;4">
								<xsl:call-template name="PopulateEmptyTableRow"/>
							</xsl:if>
						</xsl:if>
					</xsl:if>
					<!--Part III  starting 7 f-->
					<tr>
						<td style="width: 80mm;text-align: left;border-bottom-width:0px;" scope="row" class="styFormTTablesCells ">
							<div style="float:left;font-size:7pt;width:77mm;">
								<div style="height:4mm;" class="styLNLeftLtrBox">f</div>
								<div class="styFormTLnDesc">
                Improvements (list separately)
              </div>
							</div>
						</td>
						<td style="width: 18mm; text-align: center;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
							<span style="width:1px;"/>
						</td>
						<td style="width: 25mm;height:4mm;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
							<span style="width:1px;"/>
						</td>
						<td style="width:  31.5mm; text-align: right;border-left-width:1px;border-bottom-width:0px;" class="styFormTTablesCells ">
							<span style="width:1px;"/>
						</td>
						<td style="width: 32.5mm; height:4mm; border-right:0;border-bottom-width:0px;" class="styFormTTablesCells ">
							<span style="width:1px;"/>
						</td>
					</tr>
					<xsl:for-each select="Improvement">
						<tr>
							<td style="width:80mm;text-align: left;border-bottom-width:0px;" scope="row" class="styFormTTablesCells ">
								<xsl:if test="position() = last() and position() &gt;=6">
									<xsl:attribute name="style">width:80mm;text-align:left;</xsl:attribute>
								</xsl:if>
								<div style="float:left;font-size:7pt;height:8mm;">
									<div style="height:8mm;" class="styLNLeftLtrBox"/>
									<xsl:choose>
										<xsl:when test="position() = last() and position() &gt;= 6">
											<div style="width:70mm;height:8mm;float:left;clear:none;padding-top:6px;" class="styGenericDiv">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Desc"/>
												</xsl:call-template>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div style="width:70mm;height:8mm;float:left;clear:none;padding-top:6px;" class="styBB">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Desc"/>
												</xsl:call-template>
											</div>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</td>
							<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="UnitTxt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width: 25mm;height:8mm;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="12"/>
									<xsl:with-param name="TargetNode" select="UnitQty"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width:  31.5mm; text-align: right;vertical-align:bottom;font-size:6pt;" class="styFormTTablesCells ">
								<xsl:choose>
									<xsl:when test="CostOrOtherBasisPerUnitAmt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CostOrOtherBasisPerUnitDcmlAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width:1px;"/>
							</td>
							<td style="width: 32.5mm; height:8mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:if test="count(Improvement)&lt;1">
						<xsl:call-template name="PopulateEmptyTableRowForImprovements"/>
					</xsl:if>
					<xsl:if test="count(Improvement)&lt;2">
						<xsl:call-template name="PopulateEmptyTableRowForImprovements"/>
					</xsl:if>
					<xsl:if test="count(Improvement)&lt;3">
						<xsl:call-template name="PopulateEmptyTableRowForImprovements"/>
					</xsl:if>
					<xsl:if test="count(Improvement)&lt;4">
						<xsl:call-template name="PopulateEmptyTableRowForImprovements"/>
					</xsl:if>
					<xsl:if test="count(Improvement)&lt;5">
						<xsl:call-template name="PopulateEmptyTableRowForImprovements"/>
					</xsl:if>
					<xsl:if test="count(Improvement)&lt;6">
						<xsl:call-template name="PopulateEmptyTableRowForImprovements">
							<xsl:with-param name="end">true</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<tr>
						<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftLtrBox">g</div>
								<div class="styFormTLnDesc">
                Mineral rights
              </div>
							</div>
							<div class="styFormTDotLn">
              ............
            </div>
						</td>
						<td style="width: 18mm; text-align: left;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MineralRights/UnitTxt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 25mm;height:4mm;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="MineralRights/UnitQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width:  31.5mm; text-align: right;vertical-align:bottom;font-size:6pt;" class="styFormTTablesCells ">
							<xsl:choose>
								<xsl:when test="MineralRights/CostOrOtherBasisPerUnitAmt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="MineralRights/CostOrOtherBasisPerUnitAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="MineralRights/CostOrOtherBasisPerUnitDcmlAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<span style="width:1px;"/>
						</td>
						<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MineralRights/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td style="width: 155mm;text-align: left;" scope="row" class="styFormTTablesCells " colspan="4">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftLtrBox">h</div>
								<div class="styFormTLnDesc">
                Total cost or other basis. Add lines 7a through 7g
              </div>
							</div>
							<div class="styFormTDotLn">
              ...................
            </div>
						</td>
						<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisPropAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td style="width: 155mm;text-align: left;" scope="row" class="styFormTTablesCells " colspan="4">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftLtrBox">i</div>
								<div class="styFormTLnDesc">
                Direct sale expenses (cruising, marking, selling)
              </div>
							</div>
							<div class="styFormTDotLn">
              ...................
            </div>
						</td>
						<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DirectSaleExpensesAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr style="height:6mm;">
						<td style="width:155mm;text-align: left;vertical-align:bottom;" scope="row" class="styFormTTablesCells " colspan="4">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftNumBoxSD">8</div>
								<div class="styFormTLnDesc">
                Profit or loss. Subtract the sum of lines 7h and 7i from line 6
              </div>
							</div>
							<div class="styFormTDotLn">
              ..............
            </div>
						</td>
						<td style="width: 32.5mm; height:4mm; border-right:0;vertical-align:bottom;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ProfitOrLossAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<xsl:call-template name="populatefooter"/>
	</xsl:template>
	<!-- Part IV -->
	<xsl:template name="populatepartiv">
		<xsl:param name="AdditionalDataMsg">false</xsl:param>
		<xsl:variable name="pos" select="position()"/>
		<xsl:if test="count($FormTADataIV[$pos]/ReforestationExpensesInfoGrp) &gt;4">
			<div style="width:187mm;height:3mm;" class="styBB">
				<div class="styGenericDiv" style="float:right;">
					<xsl:call-template name="SetDynamicTableToggleButton">
						<xsl:with-param name="TargetNode" select="$FormTADataIV[$pos]/ReforestationExpensesInfoGrp"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" concat('Actn',position())"/>
					</xsl:call-template>
				</div>
			</div>
		</xsl:if>
		<!-- Start the table -->
		<div style="float:left" class="styTableContainer">
			<xsl:attribute name="id"><xsl:value-of select="concat('Actn',position())"/></xsl:attribute>
			<xsl:call-template name="SetInitialState"/>
			<table cellpadding="0" cellspacing="0" style="float:none;" class="styTable">
				<thead class="styTableThead">
					<tr style="font-weight:bold;">
						<th style="width: 65mm;" scope="col" class="styFormTTablesHeaders ">
              Account, block, tract, area, or stand ID for each Qualified Timber Property (QTP)
            </th>
						<th style="width: 60mm; " scope="col" class="styFormTTablesHeaders ">
              Kind of activity (burning, chopping,spraying, planting, seeding, thinning,
              pruning, fertilizing, etc.)
            </th>
						<th style="width: 32mm;" scope="col" class="styFormTTablesHeaders ">
              Number of <br/>acres treated
            </th>
						<th style="width: 32mm;border-right-width:0px;" scope="col" class="styFormTTablesHeaders ">
              Total <br/>expenditures
            </th>
					</tr>
				</thead>
				<tfoot/>
				<tbody>
					<xsl:for-each select="ReforestationExpensesInfoGrp">
						<tr style="height:6mm;">
							<td style="width: 65mm;text-align:left;" class="styFormTTablesCells ">
								<xsl:if test="position() = last() and position() &gt;= 4">
									<xsl:attribute name="style">width: 65mm;text-align:left;border-bottom-width:0px;</xsl:attribute>
								</xsl:if>
								<xsl:if test="position() = 1">
									<span style="font-weight:bold;padding-right:2mm;">1</span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AccountBlockTractOrAreaTxt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="position() != 1">
									<span style="padding-left:4mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AccountBlockTractOrAreaTxt"/>
										</xsl:call-template>
									</span>
								</xsl:if>
							</td>
							<td style="width: 60mm; text-align: left;" class="styFormTTablesCells">
								<xsl:if test="position() = last() and position() &gt;= 4">
									<xsl:attribute name="style">width: 58mm;text-align:left;border-bottom-width:0px;</xsl:attribute>
								</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="KindOfActivityTxt"/>
								</xsl:call-template>
							</td>
							<td style="width: 32mm; text-align: right;" class="styFormTTablesCells ">
								<xsl:if test="position() = last() and position() &gt;= 4">
									<xsl:attribute name="style">width:32mm;text-align:right;border-bottom-width:0px;</xsl:attribute>
								</xsl:if>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="12"/>
									<xsl:with-param name="TargetNode" select="AcresTreatedQty"/>
								</xsl:call-template>
							</td>
							<td style="width: 32mm; text-align: right;border-right-width:0px;" class="styFormTTablesCells ">
								<xsl:if test="position() = last() and position() &gt;= 4">
									<xsl:attribute name="style">width:32mm;text-align:right;border-bottom-width:0px;border-right-width:0px;</xsl:attribute>
								</xsl:if>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalExpendituresAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:if test="count(ReforestationExpensesInfoGrp) &lt; 1">
						<xsl:call-template name="PopulateFirstEmptyTableRowForPartIV">
							<xsl:with-param name="AdditionalDataMsg" select="$AdditionalDataMsg"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="count(ReforestationExpensesInfoGrp) &lt; 2">
						<xsl:call-template name="PopulateEmptyTableRowForPartIV"/>
					</xsl:if>
					<xsl:if test="count(ReforestationExpensesInfoGrp) &lt; 3">
						<xsl:call-template name="PopulateEmptyTableRowForPartIV"/>
					</xsl:if>
					<xsl:if test="count(ReforestationExpensesInfoGrp) &lt; 4">
						<tr style="height:6mm;">
							<td style="width: 65mm;border-bottom-width:0px;;" class="styFormTTablesCells ">
								<span style="width:1px;"/>
							</td>
							<td style="width: 58mm; text-align: center;border-bottom-width:0px;" class="styFormTTablesCells ">
								<span style="width:1px;"/>
							</td>
							<td style="width: 32mm; text-align: center;border-bottom-width:0px;" class="styFormTTablesCells ">
								<span style="width:1px;"/>
							</td>
							<td style="width: 32mm; text-align: center;border-right-width:0px;border-bottom-width:0px;" class="styFormTTablesCells ">
								<span style="width:1px;"/>
							</td>
						</tr>
					</xsl:if>
				</tbody>
			</table>
		</div>
		<xsl:call-template name="SetInitialDynamicTableHeight">
			<xsl:with-param name="TargetNode" select="$FormTADataIV[$pos]/ReforestationExpensesInfoGrp"/>
			<xsl:with-param name="containerHeight" select="4"/>
			<xsl:with-param name="headerHeight" select="1"/>
			<xsl:with-param name="containerID" select=" concat('Actn',position())"/>
		</xsl:call-template>
		<!-- Part IV line 2 -->
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;">2</div>
					<span style="padding-top:.5mm;height:4mm;">Total</span>
				</div>
				<!--Dotted Line-->
				<div style="float:right">
					<span style="letter-spacing:4mm; font-weight:bold; float:left;padding-top:.5mm;height:4mm;">
             ..............
          </span>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width: 32mm;padding-right:0.5mm;border-right-width:1px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="TotalAcresTreatedQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width: 32mm;padding-right:0.5mm;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="TotalOfTotalExpendituresAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
		</div>
		<!-- Part IV line 3 -->
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;">3</div>
					<span style="padding-top:.5mm;height:4mm;">Total reforestation expenses</span>
				</div>
				<div style="float:right">
					<span style="letter-spacing:4mm; font-weight:bold; float:left;padding-top:.5mm;height:4mm;">
             .........
          </span>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;padding-right:0.5mm;border-right-width:1px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="MaxSize" select="12"/>
							<xsl:with-param name="TargetNode" select="RforExpnssAcreTreatdQty"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;padding-right:0.5mm;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="RforExpnssTotExpendAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;">4a</div>
					<span style="padding-top:.5mm;height:4mm;">Amount to be expensed under section 194(b).</span>
				</div>
				<div style="float:right">
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;padding-right:0.5mm;border-right-width:1px;background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;padding-right:0.5mm;border-left-width:0px;">
          </div>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;"/>
					<span style="padding-top:.5mm;height:4mm;">(See instructions for limitations)</span>
				</div>
				<div style="float:right">
					<span style="letter-spacing:4mm; font-weight:bold; float:left;padding-top:.5mm;height:4mm;">
              .........
          </span>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;padding-right:0.5mm;border-right-width:1px;background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;padding-right:0.5mm;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="RforExpnssDedUndSection194bAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftLtrBox" style="height:4mm;">b</div>
					<span style="padding-top:.5mm;height:4mm;">Amount to be amortized under IRC 194(a), including remaining reforestation</span>
				</div>
				<div style="float:right">
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;padding-right:0.5mm;border-right-width:1px;background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;padding-right:0.5mm;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="RforExpnssAmortzUndIRC194aAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div style="width:187mm;">
				<div style="float:left">
					<div class="styLNLeftNumBox" style="height:4mm;"/>
					<span style="padding-top:.5mm;height:4mm;">expenditures not expensed under section 194(b)</span>
				</div>
				<div style="float:right">
					<span style="letter-spacing:4mm; font-weight:bold; float:left;padding-top:.5mm;height:4mm;">
              .........
          </span>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;padding-right:0.5mm;border-right-width:1px;background-color:lightgrey;"/>
					<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;padding-right:0.5mm;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="BalanceAmortizedTotalExpend"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
		</div>
		<xsl:if test="count($FormTADataIV) &gt; 1 and position() != last()">
			<div class="styBB" style="width:187mm;"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="populatepartv">
		<xsl:param name="AdditionalDataMsg">false</xsl:param>
		<div class="styBB" style="width:187mm;float:left;">
			<table cellpadding="0" cellspacing="0" class="styFormTTable">
				<thead class="styTableThead">
					<tr>
						<th style="width: 90mm;font-size:7pt;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesHeaders">
							<div style="height:4mm;text-align:left;" class="styLNLeftNumBox">1</div>
							<div class="styFormTLnDesc">Name of block and title of account <img alt="Bullet Image" src="{$ImagePath}/T_Bullet.gif"/>
							</div>
							<div class="styBB" style="width:70mm;float:left;clear:none;border-bottom-width:0px;padding-left:8mm;">
								<xsl:if test="$AdditionalDataMsg= 'true' ">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$FormTADataV"/>
										<xsl:with-param name="ShortMessage" select="'true'"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="NameOfBlockAndTitleOfAcctTxt"/>
								</xsl:call-template>
							</div>
						</th>
						<th style="width: 25mm; font-size:7pt;" scope="col" class="styFormTTablesHeaders "> Acres</th>
						<th style="width: 36mm; font-size:7pt;" scope="col" class="styFormTTablesHeaders "> Total cost
            or other basis. Give
            amount of March 1,
            1913 appreciation, if
            included
          </th>
						<th style="width: 36mm;font-size:7pt;border-right:0;" scope="col" class="styFormTTablesHeaders ">
             Average rate per acre
           </th>
					</tr>
				</thead>
				<tfoot/>
				<tbody>
					<tr>
						<td style="width: 90mm;font-size:7pt;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesCells ">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftNumBox">2</div>
              Balance at beginning of year
            </div>
							<div style="float:right;font-size:7pt;letter-spacing:3.2mm;font-weight:bold;">
              .........
            </div>
						</td>
						<td style="width:25mm;height:4mm;text-align: right;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="LandOwnershipBOYGrp/AcresQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 36mm; text-align: right" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LandOwnershipBOYGrp/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 36mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LandOwnershipBOYGrp/AverageRatePerAcreAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td style="width: 90mm;font-size:7pt;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesCells ">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftNumBox">3</div>
              Acquisitions during year
            </div>
							<div class="styFormTDotLn ">
              ..........
            </div>
						</td>
						<td style="width:25mm;height:4mm;text-align: right;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="LandOwnershipAcquisDuringYrGrp/AcresQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 36mm; text-align: right" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LandOwnershipAcquisDuringYrGrp/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 36mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LandOwnershipAcquisDuringYrGrp/AverageRatePerAcreAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td style="width: 90mm;font-size:7pt;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesCells ">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftNumBox">4</div>
              Sales during year
            </div>
							<div class="styFormTDotLn ">
              .............
            </div>
						</td>
						<td style="width:25mm;height:4mm;text-align: right;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="LandOwnershipSalesDuringYrGrp/AcresQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 36mm; text-align: right" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LandOwnershipSalesDuringYrGrp/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 36mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LandOwnershipSalesDuringYrGrp/AverageRatePerAcreAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td style="width: 90mm;font-size:7pt;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesCells ">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftNumBox">5</div>
              Other changes
            </div>
							<div class="styFormTDotLn ">
              ..............
            </div>
						</td>
						<td style="width:25mm;height:4mm;text-align: right;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="LandOwnershipOtherChangesGrp/AcresQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 36mm; text-align: right" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LandOwnershipOtherChangesGrp/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 36mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LandOwnershipOtherChangesGrp/AverageRatePerAcreAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td style="width: 90mm;font-size:7pt;text-align:left;font-weight:normal;" scope="col" class="styFormTTablesCells ">
							<div style="float:left;font-size:7pt;">
								<div style="height:4mm;" class="styLNLeftNumBox">6</div>
              Balance at end of year. Add lines 2 and 3, subtract line 4 and add or subtract line 5
            <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px;"/>.
                <span style="width:15px;"/>.
                <span style="width:16px;"/>.
                <span style="width:15px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
							</div>
						</td>
						<td style="width:25mm;height:4mm;text-align: right;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="12"/>
								<xsl:with-param name="TargetNode" select="LandOwnershipBalanceEOYGrp/AcresQty"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 36mm; text-align: right;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LandOwnershipBalanceEOYGrp/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="width: 36mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LandOwnershipBalanceEOYGrp/AverageRatePerAcreAmt"/>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- Additional Info -->
		<div class="styBB" style="width:187mm;">
			<div style="padding-left:9mm;font-weight:bold;">Additional Information.</div>
			<xsl:choose>
				<xsl:when test="AdditionalInformationTxt and AdditionalInformationTxt != '' ">
					<div class="styBB" style="width:187mm;text-align:left;float:none;border-bottom-width:0px;;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="AdditionalInformationTxt"/>
						</xsl:call-template>
					</div>
					<div class="styBB" style="width:187mm;float:none;"/>
				</xsl:when>
				<xsl:otherwise>
					<div class="styBB" style="width:187mm;float:none;"/>
					<div class="styBB" style="width:187mm;float:none;"/>
					<div class="styBB" style="width:187mm;float:none;"/>
					<div class="styBB" style="width:187mm;float:none;"/>
					<div class="styBB" style="width:187mm;float:none;"/>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template name="PopulateEmptyTableRow">
		<tr>
			<td style="width: 18mm; text-align: center;" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
			<td style="width: 25mm;height:4mm;" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
			<td style="width:  31.5mm; text-align: right" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
			<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="PopulateEmptyTableRowForImprovements">
		<xsl:param name="end">false</xsl:param>
		<tr>
			<xsl:choose>
				<xsl:when test="$end = 'false'">
					<td style="width: 80mm;text-align: left;border-bottom-width:0px;" scope="row" class="styFormTTablesCells ">
						<div style="float:left;font-size:7pt;">
							<div style="height:4mm;" class="styLNLeftLtrBox"/>
							<div style="width:70mm;height:4mm;float:left;clear:none;" class="styBB">
								<span style="width:1px;"/>
							</div>
						</div>
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td style="width: 80mm;text-align: left;" scope="row" class="styFormTTablesCells ">
						<div style="float:left;font-size:7pt;">
							<div style="height:4mm;" class="styLNLeftLtrBox"/>
						</div>
					</td>
				</xsl:otherwise>
			</xsl:choose>
			<td style="width: 18mm; text-align: center;" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
			<td style="width: 25mm;height:4mm;" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
			<td style="width:  31.5mm; text-align: right" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
			<td style="width: 32.5mm; height:4mm; border-right:0;" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="PopulateEmptyTableRowForPartIV">
		<xsl:param name="AdditionalDataMsg">false</xsl:param>
		<tr style="height:6mm;">
			<td style="width: 65mm;text-align:left;" class="styFormTTablesCells ">
				<xsl:if test="$AdditionalDataMsg= 'true' ">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$FormTADataIV"/>
					</xsl:call-template>
				</xsl:if>
				<span style="width:1px;"/>
			</td>
			<td style="width: 58mm; text-align: left;" class="styFormTTablesCells">
				<span style="width:1px;"/>
			</td>
			<td style="width: 32mm; text-align: right;" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
			<td style="width: 32mm; text-align: right;border-right-width:0px;" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="PopulateFirstEmptyTableRowForPartIV">
		<xsl:param name="AdditionalDataMsg">false</xsl:param>
		<tr style="height:6mm;">
			<td style="width: 65mm;text-align:left;" class="styFormTTablesCells ">
				<span style="font-weight:bold;">1</span>
				<xsl:if test="$AdditionalDataMsg= 'true' ">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$FormTADataIV"/>
					</xsl:call-template>
				</xsl:if>
				<span style="width:1px;"/>
			</td>
			<td style="width: 58mm; text-align: left;" class="styFormTTablesCells">
				<span style="width:1px;"/>
			</td>
			<td style="width: 32mm; text-align: right;" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
			<td style="width: 32mm; text-align: right;border-right-width:0px;" class="styFormTTablesCells ">
				<span style="width:1px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="populatefooter">
		<div style="width:187mm;"/>
		<div style="width:187mm;padding-top:1mm;">
			<span style="width:114mm;font-weight:bold;" class="styGenericDiv"/>
			<span style="width:19mm;font-weight:normal;" class="styGenericDiv"/>
			<span style="float:right;" class="styGenericDiv">Form <span class="styBoldText">T (Timber)</span> (Rev. 12-2013)</span>
		</div>
		<div style="width:187mm;padding-top:1mm;" class="pageEnd"/>
		<div style="width:187mm;"/>
	</xsl:template>
</xsl:stylesheet>
