<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120XStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1120XData" select="$RtnDoc/IRS1120X"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1120XData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1120X"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120XStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					 </xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1120X">
					<!--Form 1120X-->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;">
						<!-- <div class="styFNBox" style="width:31mm;height:22.5mm;border-right-width:.5mm;"> -->
						<div class="styFNBox" style="width:31mm;height:22.5mm; border-right-width:2px;">            
            
     		Form <span class="styFormNumber">1120X</span>
							<!--General Dependency Push Pin
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120XData"/>
              </xsl:call-template> -->
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120XData"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120X, Top Left Margin - Section 199 Closing Books Election Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120XData/@sect199ClosingBooksElectCd"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120X, Top Left Margin - Section 30191002 Election Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120XData/@filedPursuantToSect30191002Cd"/>
							</xsl:call-template>
							<div style="font-size:7pt">(Rev. January 2011)
				<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:110mm;height:19.5mm;">
							<br/>
							<div class="styMainTitle" style="height:8mm;">Amended U.S. Corporation <br/> Income Tax Return								</div>
						</div>
						<div class="styTYBox" style="width:45mm;height:22.5mm;border-left-width:.5mm;">
							<div class="styOMB">OMB No. 1545-0132</div>
							<table style="width:45mm;cellspacing:0; cell-padding:0;border:1;text-align:bottom;font-size:7pt">
								<tbody>
									<!-- Row 1 of a 3 row by 2 column table -->
									<tr style="padding-top:2mm;">
										<!-- this cell blank and used as a placeholder for row 1 column1 -->
										<th style="width:4mm"/>
										<th style="width:40mm;text-align:left">For tax year ending</th>
									</tr>
									<!-- Row 2 -->
									<tr style="height:5mm;">
										<!-- column 1 -->
										<th style="padding-bottom:2mm">
											<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
										</th>
										<!-- column 2 -->
										<td>
											<div style="font-size:7pt;font-weight:bold;text-align:center;border-top-width:0mm;border-bottom-width:1px;border-style:dashed;border-color:black">
												<xsl:call-template name="PopulateMonthYearForYearMonthType">
													<xsl:with-param name="TargetNode" select="$Form1120XData/TaxYearEndMonthYr"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
									<!-- Row 3 -->
									<tr>
										<!-- this cell blank and used as a placeholder -->
										<th style="width:4mm"/>
										<th style="text-align:left;vertical-align:bottom"> (Enter month and year.)</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;font-size:7pt;">
						<!-- modified address box from common IRS return label -->
						<div class="styLblNameAddr" style="width:145mm; height:26mm;border-right-width:0px;border-left-width:0px;border-top-width:0px;border-bottom-width:0px;">
							<div class="styUseLbl" style="width:12mm;height:21mm;border-right-width:0px;padding-top:8mm;text-align:center;">Please Type or Print</div>
							<div class="styNameAddr" style="width:133mm;height:8.6mm;border-left-width:1px;">
							Name <br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
								</span>
							</div>
							<div class="styNameAddr" style="width:133mm;height:8.6mm;border-left-width:1px;">
							Number, street, and room or suite no. (If a P.O. box, see instructions.)<br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/USAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>											
											</xsl:otherwise>
										</xsl:choose>
								</span>
							</div>
							<div class="styNameAddr" style="border-bottom-width:0px;width:131mm;height:8.6mm;border-left-width:1px;">
							City or town, state, and ZIP code<br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/USAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
											</xsl:call-template>
											,
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
											</xsl:call-template>
											<span style="width;2mm;"/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<!-- Commented out becz there is no approved UWR to display foreign address choice -->
										<!--<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
											</xsl:call-template>
											,
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
											</xsl:call-template>
											<span style="width;2mm;"/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											</xsl:call-template>
											</xsl:when>-->
											<xsl:otherwise>											
											</xsl:otherwise>
										</xsl:choose>
								</span>
							</div>
						</div>
						<!-- styLblNameAddr is being used here because it works for these  3 lines with minimal modification - it readily lines up with the previous section -->
						<div class="styLblNameAddr" style="width:42mm;height:25mm;border-right-width:0px;border-left-width:0px;border-top-width:0px;border-bottom-width:0px;">
							<div class="styNameAddr" style="width:41mm;height:8.6mm;border-bottom-width:1px;border-left-width:1px;font-weight:bold">
							Employer identification number<br/>
								<br/>
								<div style="text-align:left">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div class="styNameAddr" style="width:41mm;height:8.6mm;border-bottom-width:1px;border-left-width:0px"/>
							<br/>
							<span class="stySmallText" style="font-size:6pt"/>
							<div class="styNameAddr" style="width:41mm;height:8.6mm;border-bottom-width:0px;font-size:6pt;border-left-width:1px">
							Telephone number (optional)
								<br/>
								<br/>
								<div style="font-size:6pt;text-align:left">
									<xsl:if test="$Form1120XData/PhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$Form1120XData/PhoneNum "/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$Form1120XData/ForeignPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120XData/ForeignPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<br/>
						</div>
					</div>
					<!-- Choice - Address of original return or use SAME if same as in Return Header -->
					<div class="styBB" style="width:187mm; border-top-width:.5px; border-bottom-width:0px; min-height:10mm; height:auto;">
						<div class="styText" style="text-align:left;">
							Enter name and address used on original return (If same as above, write "Same.")
							<br/>
							<div style="padding-left:2mm;text-align:left">
								<xsl:if test="$Form1120XData/NameAndAddress">
									<xsl:choose>
										<xsl:when test="$Form1120XData/NameAndAddress/PersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1120XData/NameAndAddress/PersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1120XData/NameAndAddress/BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1120XData/NameAndAddress/BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<xsl:choose>
										<xsl:when test="$Form1120XData/NameAndAddress/USAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$Form1120XData/NameAndAddress/USAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$Form1120XData/NameAndAddress/ForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="$Form1120XData/SameAsAboveCd">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120XData/SameAsAboveCd"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;border-bottom-width:1px">
						<div class="styLNDesc" style="width:48mm;height:4mm;text-align:left;">Internal Revenue Service Center where original return was filed</div>
						<div class="styIRS1120VTImageBox" style="height:8mm;padding-top:1mm;border-right:0mm;">
							<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styText" style="padding-top:2mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120XData/ServiceCenterWhereRetFiledCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Start Part I -->
					<div style="width:187mm;border-bottom-width:0px;line-height:9mm;text-align:center;font-size:9pt;font-weight:bold;border-bottom: 1px solid black;">Fill in applicable items and use Part II on the back to explain any changes</div>
					<!--BEGIN Main Form Table:  Income Section-->
					<table class="styTable" style=" width:187mm;empty-cells:show;border-collapse:collapse;      border-style:solid;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;border-bottom-width:0px;cell-padding:0;cell-spacing:0;font-size:7pt;">
						<tr style="height:8mm">
							<th class="styTblCell" colspan="3" scope="col" style="width:89mm;border-right-width:1px;border-left-width:0">
								<div class="styPartName" style="font-size:9pt">Part I</div>
								<span style="font-size:9pt"> Income and Deductions <span style="font-weight:normal">
							(see instructions)</span>
								</span>
							</th>
							<th class="styTblAmountCell " scope="col" style="width:31mm;font-size:6pt;font-weight:bold;text-align:center;border-left-width:1px;">(a) <span style="font-weight:normal;display:inline;">As originally<br/>reported or as <br/>previously adjusted</span>
							</th>
							<th class="styTblAmountCell " scope="col" style="width:31mm;font-size:6pt;font-weight:bold;text-align:center">(b) <span style="font-weight:normal;display:inline;">Net change—<br/>increase or (decrease)—<br/>explain in Part II </span>
							</th>
							<th class="styTblAmountCell " scope="col" style="width:31mm;font-size:6pt;font-weight:bold;text-align:center;border-right-width:0">(c) <span style="font-weight:normal">Correct amount</span>
							</th>
						</tr>
						<tbody>
							<!-- Line 1  columns a through c -->
							<tr style="height:8mm;vertical-align:bottom;">
								<td class="styTblCellNumber" style="border-top-width:1px;border-bottom-width:0px;border-right-width:0px;vertical-align:bottom;text-align:left;padding-left:1.5mm">1</td>
								<td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;border-top-width:1px">
									<span style="float:left;">Total income </span>
									<span class="styDotLn" style="padding-right:1mm;float:right;">...............</span>
								</td>
								<td class="styTblCellNumber">1</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TotalIncomeOriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TotalIncomeNetChangeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell " style="border-right-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TotalIncomeCorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 2  -->
							<tr style="height:8mm;vertical-align:bottom">
								<!-- Use space here;  to maintain character alignment use &#160 to place a space below "2" the and still use vertical-align: bottom -->
								<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;vertical-align:bottom;text-align:left;padding-left:1.5mm;padding-top:6mm;">2</td>
								<td class="styTableCellText" style="width:79mm; border-bottom-width:0px;">
									<span style="float:left;">Total deductions </span>
									<span class="styDotLn" style="font-weight:bold;padding-right:1mm;float:right;">..............</span>
								</td>
								<td class="styTblCellNumber" style="border-bottom-width:1px;">2</td>
								<td class="styTblAmountCell" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TotalDeductionOriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TotalDeductionNetChangeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell" style="border-bottom-width:1px;border-right-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TotalDeductionCorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 3  -->
							<tr style="height:8mm;vertical-align:bottom">
								<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;vertical-align:bottom;text-align:left;padding-left:1.5mm">3</td>
								<td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;">
									<span style="float:left;">Taxable income. Subtract line 2 from line 1 </span>
									<span class="styDotLn" style="padding-right:1mm;float:right;">.....</span>
								</td>
								<td class="styTblCellNumber">3</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TaxableIncomeOriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TaxableIncomeNetChangeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell" style="border-right-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TaxableIncomeCorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 4  -->
							<tr style="height:8mm;vertical-align:bottom">
								<td class="styTblCellNumber" style="border-bottom-width:1;border-right-width:0px;vertical-align:bottom;text-align:left;padding-left:1.5mm">4</td>
								<td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:1px;">
									<span style="float:left">Total tax </span>
									<span class="styDotLn" style="padding-right:1mm;float:right;">................</span>
								</td>
								<td class="styTblCellNumber">4</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TotalTaxOriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TotalTaxNetChangeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell" style="border-right-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TotalTaxCorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Payment and Credit Section
					<div class="styBoldText" style="font-size:8pt;">Payments and Credits<span style="font-weight:normal"> (see instructions)</span>
					</div> -->
							<!-- Payment and Credit table -->
							<tr>
								<td class="styBoldText" colspan="6" style="width:187mm;height:8mm;vertical-align:center;font-size:8pt;">Payments and Credits<span style="font-weight:normal"> (see instructions)</span>
								</td>
							</tr>
							<!-- Line 5a  -->
							<tr style="vertical-align:bottom">
								<td class="styTblCellNumber" scope="col" style="border-top-width:1px;border-bottom-width:0px;border-right-width:0px;text-align:left;padding-left:1.5mm;">5a</td>
								<td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;border-top-width:1px;">
									<span style="float:left;">Overpayment in prior year allowed as a credit </span>
									<span class="styDotLn" style="padding-right:1mm;float:right;">....</span>
								</td>
								<td class="styTblCellNumber" style="border-top-width:1px;">5a</td>
								<td class="styTblAmountCell" style="border-top-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/PYOvpmtCrOriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell" style="border-top-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/PYOvpmtCrNetChangeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell" style="border-right-width:0px;border-top-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/PYOvpmtCrCorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5b  -->
							<tr style="vertical-align:bottom">
								<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;letter-spacing:.5em">&#160;b</td>
								<td class="styTableCellText" scope="col" style="width:79mm; border-bottom-width:0px;">
									<span style="float:left;">Estimated tax payments </span>
									<span class="styDotLn" style="padding-right:1mm;float:right;">...........</span>
								</td>
								<td class="styTblCellNumber">5b</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/EsPaymentsOriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/EsPaymentsNetChangeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell" style="border-right-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/EsPaymentsCorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5c  -->
							<tr style="vertical-align:bottom">
								<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;letter-spacing:.5em">&#160;c</td>
								<td class="styTableCellText" style="width:79mm;border-bottom-width:0px;">
									<span style="float:left;">Refund applied for on Form 4466 </span>
									<span class="styDotLn" style="padding-right:1mm;float:right;">........</span>
								</td>
								<td class="styTblCellNumber">5c</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/RefundForm4466OriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/RefundForm4466NetChangeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell" style="border-right-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/RefundForm4466CorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  Line 5d  -->
							<tr style="vertical-align:bottom">
								<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;letter-spacing:.5em">&#160;d</td>
								<td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;">
									<span style="float:left;">Subtract line 5c from the sum of lines 5a and 5b </span>
									<span class="styDotLn" style="padding-right:1mm;float:right;">...</span>
								</td>
								<td class="styTblCellNumber">5d</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/DifferenceOriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/DifferenceNetChangeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell" style="border-right-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/DifferenceCorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5e  -->
							<tr style="vertical-align:bottom">
								<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;letter-spacing:.5em">&#160;e</td>
								<td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;">
									<span style="float:left;">Tax deposited with Form 7004 </span>
									<span class="styDotLn" style="padding-right:1mm;float:right;">.........</span>
								</td>
								<td class="styTblCellNumber">5e</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TxPaidForm7004OriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TxPaidForm7004NetChangeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTblAmountCell" style="border-right-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/TxPaidForm7004CorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5f  -->
							<tr style="vertical-align:bottom">
								<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;letter-spacing:.5em">&#160;f</td>
								<td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;">
									<span style="float:left;">Credit from Form 2439 </span>
									<span class="styDotLn" style="padding-right:1mm;float:right;">...........</span>
								</td>
								<td class="styTblCellNumber">5f</td>
								<!-- column a -->
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/Form2439CreditOriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<!-- column b -->
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/Form2439CreditNetChangeAmt"/>
									</xsl:call-template>
								</td>
								<!-- column c -->
								<td class="styTblAmountCell" style="border-right-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/Form2439CreditCorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5g -->
							<tr style="vertical-align:bottom">
								<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;letter-spacing:.5em">&#160;g</td>
								<td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;">
									<span style="float:left;">Credit for federal tax on fuels and other refundable credits </span>
								</td>
								<td class="styTblCellNumber">5g</td>
								<!-- column a -->
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/CrFedTaxFuelsOriginallyRptAmt"/>
									</xsl:call-template>
								</td>
								<!-- column b -->
								<td class="styTblAmountCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/CrFedTaxFuelsNetChangeAmt"/>
									</xsl:call-template>
								</td>
								<!-- column c -->
								<td class="styTblAmountCell" style="border-right-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/CrFedTaxFuelsCorrectAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="styTable" style=" width:187mm;empty-cells:show;border-collapse:collapse;border-style:solid;border-color:black;border-top-width:0px; border-left-width:0px;border-right-width:0px;border-bottom-width:1px;      ;cell-padding:0;cell-spacing:0;font-size:7pt">
						<!-- Line 6  -->
						<tr style="height:8mm;vertical-align:bottom">
							<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;vertical-align:bottom;text-align:left;padding-left:1.5mm">6</td>
							<td class="styTableCellText" scope="col" style="width:147mm;border-bottom-width:0px;">
								<span style="float:left;">Tax deposited or paid with (or after) the filing of the original return </span>
								<span class="styDotLn" style="padding-right:1mm;float:right;">.............</span>
							</td>
							<td class="styTblCellNumber" style="border-bottom-width:1px">6</td>
							<td class="styTblAmountCell" style="width:33.1mm;border-bottom-width:1px;border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120XData/OriginalReturnTaxPaidAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 7  -->
						<tr style="height:8mm;vertical-align:bottom">
							<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;text-align:left;padding-left:1.5mm">7</td>
							<td class="styTableCellText" scope="col" style="width:147mm; border-bottom-width:0px;">
								<span style="float:left;">Add lines 5d through 6, column (c) </span>
								<span class="styDotLn" style="padding-right:1mm;float:right;">........................</span>
							</td>
							<td class="styTblCellNumber">7</td>
							<td class="styTblAmountCell" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120XData/SubtotalPaymentsAndCreditsAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 8  -->
						<tr style=";vertical-align:bottom">
							<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;text-align:left;padding-left:1.5mm">8</td>
							<td class="styTableCellText" scope="col" style="width:147mm;border-bottom-width:0px;">
								<span style="float:left;">Overpayment, if any, as shown on original return or as later adjusted </span>
								<span class="styDotLn" style="padding-right:1mm;float:right;">.............</span>
							</td>
							<td class="styTblCellNumber" style="border-bottom-width:1px">8</td>
							<td class="styTblAmountCell" style="border-bottom-width:1px;border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120XData/OriginalReturnOverpaymentAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 9  -->
						<tr style="height:8mm;vertical-align:bottom">
							<td class="styTblCellNumber" style="border-bottom-width:0px;border-right-width:0px;text-align:left;padding-left:1.5mm">9</td>
							<td class="styTableCellText" style="width:147mm;border-bottom-width:0px;">
								<span style="float:left;">Subtract line 8 from line 7 </span>
								<span class="styDotLn" style="padding-right:1mm;float:right;">..........................</span>
							</td>
							<td class="styTblCellNumber" style="border-bottom-width:0px;">9</td>
							<td class="styTblAmountCell" style="border-right-width:0px;border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120XData/TotalPaymentsAndCreditsAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="styBoldText" style="height:8mm;font-size:8pt; width:187mm;border-top: 1px solid black;border-bottom: 1px solid black;">Tax Due or Overpayment <span style="font-weight:normal"> (see instructions)</span>
					</div>
					<br/>
					<table class="styTable" style=" width:187mm;empty-cells:show;border-collapse:collapse;border-style:solid;border-color:black;border-top-width:1px; border-left-width:0px;      border-right-width:0px;border-bottom-width:1px;cell-padding:0;cell-spacing:0;font-size:7pt">
						<!-- Line 10  -->
						<tr style="height:8mm;vertical-align:bottom">
							<td class="styTblCellNumber" style="width:6mm;border-bottom-width:0px;border-right-width:0px;text-align:left;vertical-alight:top;">10 &#160; &#160;</td>
							<td class="styTableCellText" scope="col" style="width:146mm;border-bottom-width:0px;border-right-width:0px">
								<b>Tax due.</b> Subtract line 9 from line 4, column (c). If paying by check, make it payable to the <span class="styBoldText">"United
				<span style="float:none;">States Treasury" </span>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="padding-right:1mm;float:right;">.........................</span>
							</td>
							<td class="styTblCell" style="width:5mm;border-bottom-width:0px;">
								<img src="{$ImagePath}/1120X_Bullet_Sm.gif" alt="SmallBullet"/>
							</td>
							<td class="styTblCellNumber">10</td>
							<td class="styTblAmountCell" style="width:34mm;border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120XData/TaxDueAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 11  -->
						<tr style="height:5mm;vertical-align:bottom">
							<td class="styTblCellNumber" style="width:6mm;border-bottom-width:0px;border-right-width:0px;text-align:left">11</td>
							<td class="styTableCellText" scope="col" style="width:146mm; border-bottom-width:0px;border-right-width:0px;">
								<span style="float:left;">
									<b>Overpayment.</b> Subtract line 4, column (c), from line 9
								</span>
								<span class="styDotLn" style="padding-right:1mm;float:right;">................</span>
							</td>
							<td class="styTblCell" style="width:5mm;border-bottom-width:0px;">
								<img src="{$ImagePath}/1120X_Bullet_Sm.gif" alt="SmallBullet"/>
							</td>
							<td class="styTblCellNumber">11</td>
							<td class="styTblAmountCell" style="width:32mm;border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120XData/OverpaymentAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 12  -->
						<tr style="vertical-align:bottom;height:5mm">
							<td class="styTblCellNumber" style="width:6mm;border-bottom-width:1px;border-right-width:0px;text-align:left">12</td>
							<td class="styTableCellText" scope="col" style="width:146mm;border-bottom-width;border-right-width:0px;">
					          Enter the amount of line 11 you want:	
								<span class="styBoldText">Credited to
								<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120XData/CreditElectionYr"/>
									</xsl:call-template>
							Estimated tax</span>
								<span style="width:1px"/>
								<img src="{$ImagePath}/1120X_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:25mm;font-size:6.5pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120XData/CreditElectionAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm;"/>
								<span class="styBoldText" style="font-size:7pt">Refunded</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120XData/Refund"/>
								</xsl:call-template>
							</td>
							<td class="styTblCell" style="width:5mm;border-bottom=0">
								<img src="{$ImagePath}/1120X_Bullet_Sm.gif" alt="SmallBullet"/>
							</td>
							<td class="styTblCellNumber">12</td>
							<td class="styTblAmountCell" style="width:32mm;border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120XData/RefundAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!--END Main Form Tax and Payment Section-->
					<!-- BEGIN Signature Section -->
					<!-- Implementing the signature section as a table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
						<tr>
							<td rowspan="3" style="width:22.75mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">Sign Here</td>
							<td colspan="6" style="padding-left:1mm;padding-bottom:1mm;">
							 <!-- Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, 
							  and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) 
							  is based on all information of which preparer has any knowledge. -->
							  Under penalties of perjury, I declare that I have filed an original return and that I have examined this amended return, 
							  including accompanying schedules and statements, and to the best of my knowledge and belief, this amended return is true, 
							  correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
							  <br/>
							  <span style="width:1px;"/>
							  </td>
						</tr>
						<tr>
							<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
								<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
							</td>
							<td style="width:62mm;border-right:1px solid black;border-bottom:1px solid black;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width:30mm;border-bottom:1px solid black;vertical-align:bottom;padding-left:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</td>
							<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
								<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
							</td>
							<td style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Title</xsl:with-param>
								</xsl:call-template>
							</td>
							<!--<td rowspan="2" style="width:40mm;border-bottom:1px solid black;padding-bottom:1mm;">
								<div class="styGenericDiv" style="width:1px;"/>
								<div style="border-right:1px solid black;border-left:1px solid black;border-bottom:1px solid black;border-top:1px solid black;float:right;" class="styGenericDiv">    
									May the IRS discuss this return<br/> with the preparer shown below <br/>(see instructions)?
									<input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
										</xsl:call-template>
									</input>
									<span class="styBoldText">
										<label for="dummyidyes">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
												<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
											</xsl:call-template>
											Yes
										</label>
									</span>
									<input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidno" style="width:2.5mm;">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
										</xsl:call-template>
									</input>
									<span class="styBoldText">
										<label for="dummyidno">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
												<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
											</xsl:call-template>
											No
										</label>
									</span>
								</div>
							</td>-->
						</tr>
						<tr>
							<td style="border-bottom:1px solid black;vertical-align:top;">Signature of officer </td>
							<td style="border-bottom:1px solid black;vertical-align:top;">Date </td>
							<td style="border-bottom:1px solid black;vertical-align:top;">Title </td>
						</tr>
					</table>
					<!-- END Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;page-break-inside:avoid;">
						<div style="width:21.25mm;padding-top:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;border-leftright:1px;">
								<div class="styLNDesc" style="height:8.5mm;width:45mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
								  Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPreparerPersonNm</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:8.5mm;width:44mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:8.5mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpDatePrepared</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:8.5mm;width:18mm;border-right:1px solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployed</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:8.5mm;width:26mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
									<span style="width:6mm;"/>
									<xsl:if test="$RtnHdrData/PreparerPersonGrp/SSN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PreparerPersonGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<!--<xsl:if test="$RtnHdrData/PreparerPersonGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>-->
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:122mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmBusinessNameBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmBusinessNameBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmEIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/MissingEINReasonCd">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpMissingEINReasonCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="height:auto; min-height:6mm; width:122mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpAddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpAddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignPostalCd</xsl:with-param>
											</xsl:call-template>,
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignCountryCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:37.5mm;padding-left:1mm;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPhoneNum</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpForeignPhoneNum</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Implementing the Preparer section in table -->
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Page Break and Footer-->
					<!--footer -->
					<div class="pageEnd" style="width:187mm;clear:both;padding-top:1mm;" >
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see instructions</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 11530Z </div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">1120X </span> (Rev. 1-2011)</div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120X (Rev. 1-2011)<span style="width:130mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
							<br/>
						</div>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;border-top-width:1px; border-bottom-width:0px;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="width:170mm;height:4mm;">
							Explanation of Changes to Items in Part I <span style="font-weight:normal;"> (Enter the line number from page 1 for the items you are changing, 							
							</span>
						</div>
						<div class="styPartDesc" style="width:187mm;height:4mm;padding-left:18mm;">
							<span style="font-weight:normal;">
								and give the reason for each change. Show any computation in detail. Also, see<span style="font-weight:bold">&#160;What To Attach</span>
							in the instructions.)
								<br/>
							</span>
						</div>
						<span class="styNormalText" style="font-size:8pt;padding-left:0px;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120XData/CarrybackClaimsInd"/>
								</xsl:call-template>   
					If the change is due to a net operating loss carryback, a capital loss carryback, or a general business credit carryback, see <span style="font-weight: bold">Carryback Claims</span> in the instructions, and check here &#160;
 					</label>
							<span style="letter-spacing:3.3mm; font-weight:bold">....................</span>
							<img src="{$ImagePath}/1120X_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/> &#160;
                <span style="width:2mm;"/>
							<input type="Checkbox" alt="alt" name="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120XData/CarrybackClaimsInd"/>
									<xsl:with-param name="BackupName">IRS1120XICarrybackClaims</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120XData/CarrybackClaimsInd"/>
									<xsl:with-param name="BackupName">IRS1120XICarrybackClaims</xsl:with-param>
								</xsl:call-template>
							</label>
						</span>
						<!-- Explanation of Changes section -->
						<xsl:if test="count($Form1120XData/ChangeExplanationGrp) &gt; 1">
							<div style="width:3mm;float:right">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1120XData/ChangeExplanationGrp"/>
									<xsl:with-param name="containerHeight" select="1"/>
									<xsl:with-param name="headerHeight" select="0"/>
									<xsl:with-param name="containerID" select=" 'EOCctn' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</xsl:if>
						<div class="styTableContainer" id="EOCctn">
							<xsl:call-template name="SetInitialState"/>
							<table cellpadding="0" cellspacing="0" style="font-size:7pt">
								<tbody>
									<xsl:if test="$Form1120XData/ChangeExplanationGrp">
										<xsl:for-each select="$Form1120XData/ChangeExplanationGrp">
											<tr style="height:8mm">
												<td class="styTableCell" style="text-align:left;width:8mm;border-right-width:0;vertical-align:top">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ChangeItemLineNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="text-align:left;width:179mm;border-right-width:0;vertical-align:top">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ChangeExplanationTxt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1120XData/ChangeExplanationGrp"/>
							<xsl:with-param name="containerHeight" select="14"/>
							<xsl:with-param name="headerHeight" select="6"/>
							<xsl:with-param name="containerID" select=" 'EOCctn' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
					</div>
					<div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1 solid black;border-top-width1px;">
						<div style="width:100mm;float:left;">
							<span style="width:90mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:80px;"/>  
    					   Form <span class="styBoldText" style="font-size:8pt;">1120X </span>(Rev. 1-2011)   
   					 </div>
					</div>
					<!-- Additional Data Section -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
						<div class="styLeftOverTitle" style="padding-bottom:0.5mm; padding-top:0.5mm">
       				   Additional Data        
       				 </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage       ()" tabindex="1"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1120XData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120X, Top Left Margin - Section 199 closing Books Election Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120XData/@sect199ClosingBooksElectCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120X, Top Left Margin - Section 30191002 Election Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120XData/@filedPursuantToSect30191002Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
