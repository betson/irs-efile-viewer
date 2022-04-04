<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleBStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040ScheduleB"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)">
            </xsl:with-param>
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
				<meta name="Description" content="IRS Form Schedule B"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript">
        </script>
				<xsl:call-template name="InitJS">
        </xsl:call-template>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040ScheduleBStyle">
            </xsl:call-template>
						<xsl:call-template name="AddOnStyle">
            </xsl:call-template>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="IRS1040ScheduleB">
					<xsl:call-template name="DocumentHeader">
          </xsl:call-template>
					<!--Beginning of header-->
					 <div class="styTBB" style="width:187mm;height:18mm;">
                     <div class="styFNBox" style="width:30mm;height:18mm;">
                     <div style="height:8mm;">
								<span class="styFormNumber" style="font-size:9pt;">SCHEDULE B</span>
								<br/>
								<span class="styFormNumber" style="font-size:7pt;">
									(Form 1040 or 1040-SR)
								</span></div>
								 <div style="height:10mm;">
								 <div style="width:10mm;height:3mm;"/>
								 <!--<span class="styAgency">(Rev. October 2017)</span>-->
								 <div class="styAgency">Department of the Treasury<br/>
                                     <span class="styAgency" style="width:30mm;">Internal Revenue Service
                                     <span style="padding-left:0.2mm;"> (99)</span>
                                     </span>
                                 </div>
                                 </div>    
                        </div>          
						<div class="styFTBox" style="width:127mm;height:18.2mm; ">
							<div class="styMainTitle" style="height:4mm;margin-top:1mm;">Interest and Ordinary Dividends  
        
							</div>
							
							<div class="styFBT" style="height:3mm;margin-top:6mm;font:size:6pt;width:127mm;">
									<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>  Go to <span style="font-style:italic">www.irs.gov/ScheduleB</span> for instructions and the latest information.       <br/>
							
							
								<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/> Attach to Form 1040 or 1040-SR.
       
						
        </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:18mm;">
							<div class="styOMB" style="height:2mm;padding-top:0mm;padding-left:1mm;line-height: 3px;">
                            OMB No. 1545-0074
                          </div>
							<div class="styTaxYear" style="">
          20<span class="styTYColor">19</span>
							</div>
							<div style="margin-left:2mm; text-align:left;font-size:6pt;padding-top:0mm;">
          Attachment<br/>Sequence No. <span class="styBoldText">08</span>
							</div>
						</div>
					</div>
					<!--end of one Header-->
					<!--Begin of Name-->
					<!--Name-->
					<div class="styBB" style="width:187mm;height:6mm;">
						<div class="styNameBox" style="width:143.7mm;font-weight:normal;font-size:7pt;">
            Name(s) shown on return <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
							</xsl:call-template>
						</div>
						<!--SSN-->
						<div class="styEINBox" style="width:43mm;padding-left:2mm;font-size:7pt;">
            Your social security number<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
				     </div>
					<!--end of Name-->
			 <div class="styBB" style="width:187mm;height:auto;">
					<!--Begin of Part I-->
						<!-- Part I Left margin -->
							<div style="width:25mm;float:left;clear:none;border-bottom-width: 0px;height:60mm">
								<div class="styFMT" style="font-size:12pt;font-family:Arial;">Part I 
									<br/>Interest
                                </div>
								<div style="padding-top:1mm;width:25mm;">(See instructions<br/>
                  and the<br/>
                  instructions for<br/>
                  Form 1040 or 1040-SR.<br/>
                  line 2b.)   
								</div>
								<br/>
								<div style="padding-top:2mm;width:25mm;">
									<b>Note:</b> If you<br/>
                  received a Form<br/>
                  1099-INT, Form<br/>
                  1099-OID, or<br/>
                  substitute<br/>
                  statement from<br/>
                  a brokerage firm,<br/>
                  list the firm's<br/>
                  name as the<br/>
                  payer and enter<br/>
                  the total interest<br/>
                  shown on that<br/>
                  form.
								</div>
							</div>
							<!-- end left margin -->
								<!-- Generated Table (Start) -->
								<div id="part1ContainerId" class="stySchBLn1TblContainer" style="width:161.5mm;float:right;">
									<!-- print logic -->
									<!-- end -->
									<!--<xsl:call-template name="SetInitialState"/>-->
									<table class="styTable" cellspacing="0" style="font-size:7pt;" summary="Table displaying Interest and Ordinary Dividends " name="INORDtable" id="INORDtable">
										<thead class="styTableThead">
										<tr  style="width:161.5mm;float:right;">					
											<!--Line 1-->
											<th class="styTableCell" scope="col" rowspan="2" style="border-right-width:0px;border-bottom-width:0px;width:4mm;padding-bottom:0mm;vertical-align:top">
												<span class="styBoldText" style="font-size:7pt;text-align:left;">1</span>
											</th>
											<th class="styTableCell" scope="col" rowspan="2" style="width:114mm;border-bottom-width:0px;border-right-width:0px;text-align:left;padding-left:1mm;">
												<span class="styNormalText">
                        List name of payer. If any interest is from a seller-financed mortgage and the
                          buyer used the property as a personal residence, see the instructions and list this
                          interest first. Also, show that buyer&apos;s social security number and address 
                                                 <span style="width:1mm;"/>
												<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Right pointing arrowhead image"/>
												</span>
												<!--Line 1 Interest Subtotal-->
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Interest Subtotal Literal</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/InterestSubtotalAmt/@interestSubtotalLiteralCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Interest Subtotal Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/InterestSubtotalAmt"/>
												</xsl:call-template>
												<!--Line 1 Nominee Interest-->
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Nominee Interest Literal</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/NomineeInterestAmt/@nomineeInterestLiteralCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 Nominee Interest Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/NomineeInterestAmt"/>
												</xsl:call-template>
												<!--Line 1  Accrued Interest-->
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Accrued Interest Literal</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/AccruedInterestAmt/@accruedInterestLiteralCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Accrued Interest Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/AccruedInterestAmt"/>
												</xsl:call-template>
												<!--Line 1 AccruedMarketDiscountAmt-->
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Accrued Market Discount Literal</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/AccruedMarketDiscountAmt/@accruedMarketDiscountLiteralCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Accrued Market Discount Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/AccruedMarketDiscountAmt"/>
												</xsl:call-template>
												<!--Line 1 OriginalIssueDiscountAdjAmt-->
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Original Issue Discount Adj Literal</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/OriginalIssueDiscountAdjAmt/@originalIssueDiscountAdjLitCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Original Issue Discount Adj Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/OriginalIssueDiscountAdjAmt"/>
												</xsl:call-template>
												<!--Line 1 Amortizable Bond Prem Adj Amt-->
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Amortizable Bond Prem Adj Amt Literal</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/AmortizableBondPremAdjAmt/@amortizableBondPremiumAdjLitCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Amortizable Bond Prem Adj Amt </xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/AmortizableBondPremAdjAmt"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, Line 1 - Total Seller Financed Mortgage Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/TotalSellerFinancedMortgIntAmt"/>
												</xsl:call-template>
											</th>
											<th class="styTableCell" scope="col" rowspan="2" style="width:6.8mm;border-bottom-width:0px;
											  border-left:1px solid black;border-right:1px solid black;">
												<span class="styTableCellPad"></span>
											</th>
											<th class="styTableCell" scope="col" rowspan="1" style="height:4mm;width:31mm;border-right:0px solid black;
											  border-left:0px solid black;border-bottom:1px solid black;vertical-align:top;text-align:center;">
												<div class="styBB" style="font-size:7pt;width:100%;border-left:0px solid black;border-right:0px solid black;
												   border-bottom:1px solid black;">              Amount
												</div>												
											</th>
										</tr>
										</thead>
										<tfoot/>
										<tbody>
											<xsl:if test="($Print != $Separated) or (count($FormData/Form1040SchBPartIGroup1) &lt; 14) ">
												<xsl:for-each select="($FormData/Form1040SchBPartIGroup1) ">
													<tr style="width:161.5mm;float:right;">
														<!-- Column 1 -->
														<td class="styTableCell" style="font-size:7pt;width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														</td>
														<!-- Column 2 -->
														<td class="styTableCell" style="width:114mm;height:4mm;text-align:left;border-top-width:0px;
														  border-bottom:1px dashed black;border-right-width:0px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SellerFinancedNm"/>
																<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedNm</xsl:with-param>
															</xsl:call-template>
															<br/>
															<xsl:if test="SellerFinancedSSN != ''">
																<xsl:call-template name="PopulateSSN">
																	<xsl:with-param name="TargetNode" select="SellerFinancedSSN"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedSSN</xsl:with-param>
																</xsl:call-template>
																<br/>
															</xsl:if>
															<xsl:if test="SellerFinancedAddressUS != ''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="SellerFinancedAddressUS/AddressLine1Txt"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressUSAddressLine1</xsl:with-param>
																</xsl:call-template>
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="SellerFinancedAddressUS/AddressLine2Txt"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressUSAddressLine2</xsl:with-param>
																</xsl:call-template>
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="SellerFinancedAddressUS/CityNm"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressUSCity</xsl:with-param>
																</xsl:call-template>    
                                 ,								<span style="width:1mm;">
																</span>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="SellerFinancedAddressUS/StateAbbreviationCd"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressUSState</xsl:with-param>
																</xsl:call-template>
																<span style="width:1mm;"> 
																</span>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="SellerFinancedAddressUS/ZIPCd"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressUSZIPCd</xsl:with-param>
																</xsl:call-template>
															</xsl:if>
															<xsl:if test="SellerFinancedAddressForeign != ''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/AddressLine1Txt"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignAddressLine1</xsl:with-param>
																</xsl:call-template>
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/AddressLine2Txt"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignAddressLine2</xsl:with-param>
																</xsl:call-template>
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/CityNm"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignCity</xsl:with-param>
																</xsl:call-template>
                               ,								<span style="width:1mm;">
																</span>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/ProvinceOrStateNm"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignProvinceOrState</xsl:with-param>
																</xsl:call-template>
																<span style="width:2mm;"> 
																</span>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/ForeignPostalCd"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignPostalCd</xsl:with-param>
																</xsl:call-template>
															</xsl:if>
															<span style="width:2mm;">
															</span>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/CountryCd"/>
																<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignCountryCd</xsl:with-param>
															</xsl:call-template>
														</td>
														<!-- Column 3 -->
														<td class="styTableCell" style="width:6.8mm;height:4mm;border-bottom-width:0px;border-left:1px solid black;border-right-width:1px;border-right:1px solid black">
															<xsl:choose>
																<xsl:when test="position() = 9">
																	<span style="padding-right:2mm;font-size:7pt;font-weight:bold;">1</span>
																</xsl:when>
																<xsl:otherwise>
																	<span class="styTableCellPad"/>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<!-- Column 4 -->
														<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;vertical-align:bottom;
														  border-bottom:1px solid black;border-left:0px solid black;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="SellerFinancedMortgageIntAmt"/>
																<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedMortgageInterestAmt</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<!-- Table Filler Rows -->
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 1 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;none;text-align:left;border-bottom:1px dashed black;border-right-width:0px;">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$FormData/Form1040SchBPartIGroup1"/>
														</xsl:call-template>
														<span class="styTableCellPad">
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-bottom-width:0px;border-left:1px solid black;
													  border-right:1px solid black;">
														<span class="styTableCellPad"> </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 2 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 3 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 4 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;
													  border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 5 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;
													  border-right:1px solid black;border-left:1px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 6 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styBoldText" style="font-size:7pt;padding-right:2mm;">1</span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 7 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 8 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 9 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 10 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 11 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;text-align:center;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 12 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;
													  border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 13 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;
													  border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup1) &lt; 14 or ((count($FormData/Form1040SchBPartIGroup1) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
												        </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;
													  border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<!-- End of filler rows -->
										</tbody>
									</table>
								</div>
								<!-- Set Initial Height of Above Table -->
<!--								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$FormData/Form1040SchBPartIGroup1"/>
									<xsl:with-param name="containerHeight" select="14"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'part1ContainerId' "/>
								</xsl:call-template>-->
								<!--End of Table and instructions Part 1 Group 1-->
								<!-- Generated Table (End) -->
								<!--Begin Table Group 2-->
								<!--<div style="width:187mm;border-bottom-width: 0px;height:3mm;">-->
								<!--<span style="width:182mm">  
 </span>-->
								<xsl:if test="$FormData/Form1040SchBPartIGroup2">
								<!-- button display logic -->
								<!--	<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$FormData/Form1040SchBPartIGroup2"/>
										<xsl:with-param name="containerHeight" select="14"/>
										<xsl:with-param name="headerHeight" select="1"/>
										<xsl:with-param name="containerID" select=" 'part2ContainerId'  "/>
									</xsl:call-template>-->
								<!-- end button display logic -->
								<!--</div>-->
								<!--begin payer Group2-->
								<!--begin payer Group2-->
								<!--<div style="width:187mm;border-bottom-width: 0px;">-->
								<!--Begin Table Group 2 instructions space-->
								<!--
								<div style="width:161.5mm;float:left;clear:none;border-bottom-width: 0px;">
									<span class="styTableCellPad">        </span>
								</div>
								<br/>-->
								<!--End of toggle-->
								<div  style="width:161.5mm;float:right;">
								<!-- print logic -->
									<!--<xsl:call-template name="SetInitialState"/>-->
									<table class="styTable" cellspacing="0" style="font-size:7pt;" summary="Table displaying Interest and Ordinary Dividends " id="PAYORTable" name="PAYORtable">
										<thead class="styTableThead">
										<tr  style="width:161.5mm;float:right;">
											<th class="styTableCell" style="border-right-width:0px;border-bottom-width:0px;width:4mm;height:8mm;
											  padding-bottom:2mm;vertical-align:top;">
												<span class="styBoldText" style="font-size:7pt;">
												</span>
											</th>
											<th class="styTableCellHeader" scope="col" rowspan="1" style="width:114mm;height8mm;text-align:left;
											  border-bottom:1px solid black;vertical-align:bottom;border-right-width:0px;">
                  Payer
										    </th>
											<th class="styTableCellHeader" scope="col" rowspan="1" style="width:6.8mm;height:8mm;border-right-width:1px;
											  border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
												<span class="styTableCellPad">
											    </span>
											</th>
											<th class="styTableCellHeader" scope="col" rowspan="1" style="text-align:center;width:31mm;height:8mm;border-left-width:1px;
											  border-right-width:0px;border-bottom:1px solid black;vertical-align:bottom;border-left:0px solid black;">
												<div style="width:26mm;padding-left:4mm;">Amount</div>
											</th>
											</tr>
										</thead>
										<tfoot/>
										<tbody>
											<xsl:if test="($Print != $Separated) or (count($FormData/Form1040SchBPartIGroup2) &lt;= 14) ">
												<xsl:for-each select="$FormData/Form1040SchBPartIGroup2">
													<tr style="width:161.5mm;float:right;">
														<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
															<span class="styTableCellPad"> 
														    </span>
														</td>
														<td class="styTableCell" style="width:114mm;text-align:left;border-bottom:1px dashed black;border-right-width:0px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="InterestPayerName/BusinessNameLine1Txt"/>
																<xsl:with-param name="BackupName">IRS1040ScheduleBInterestIncomeGrpInterestPayerNameL1</xsl:with-param>
															</xsl:call-template>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="InterestPayerName/BusinessNameLine2Txt"/>
																<xsl:with-param name="BackupName">IRS1040ScheduleBInterestIncomeGrpInterestPayerNameL2</xsl:with-param>
															</xsl:call-template>
														</td>
														<td class="styTableCell" style="width:6.8mm;border-bottom-width:0px;border-left:1px solid black;
														  border-right:1px solid black;">
															<!-- Insert PopulateTemplate call here -->
															<span class="styTableCellPad">
														    </span>
														</td>
														<td class="styTableCell" style="width:31mm;border-right-width:0px;vertical-align:bottom;border-bottom:1px solid black;border-left:0px solid black;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="InterestAmt"/>
																<xsl:with-param name="BackupName">IRS1040ScheduleBInterestIncomeGrpInterestAmt</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 1 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;text-align:left;border-bottom:1px dashed black;border-right-width:0px;">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$FormData/Form1040SchBPartIGroup2"/>
														</xsl:call-template>
														<span class="styTableCellPad">
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
												        </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 2 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 3 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 4 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
												        </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 5 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 6 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 7 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 8 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 9 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 10 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 11 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 12 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 13 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
														</span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartIGroup2) &lt; 14 or ((count($FormData/Form1040SchBPartIGroup2) &gt; 14) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-bottom:1px dashed black;border-right-width:0px;">
														<span class="styTableCellPad"> 
														</span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;
													  border-left:1px solid black;border-right:1px solid black;border-bottom:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
													    </span>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</div>
								<!-- End Separated Repeating data table -->
								<!-- Set Initial Height of Above Table -->
	<!--							<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$FormData/Form1040SchBPartIGroup2"/>
									<xsl:with-param name="containerHeight" select="14"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'part2ContainerId' "/>
								</xsl:call-template>-->
								<!-- Generated Table (End) -->
							</xsl:if>
						<!-- Line 2 -->
						<div class="styBB" style="width:187mm;hight:auto;border-bottom-width: 0px;">
						<div class="styLNDesc" style="width:25.5mm;"/>
							<div class="styLNLeftNumBox" style="width:4mm;border-left:0px solid black;border-right:0px solid black;">2</div>
							<div class="styLNDesc" style="width:114mm;padding-left:1mm;border-right:0px solid black;">
								<span style="float:left;clear:none;">Add the amounts on line 1</span>
								<span class="styDotLn" style="padding-left:4mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="border-top-width:1px;width:6.8mm;border-bottom-width: 1px;
							  border-left:1px solid black;border-right:1px solid black;">
                                    2
							   </div>
							<div class="styLNAmountBox" style="width:31mm;padding-right:0mm;border-top-width:1px;border-bottom-width: 1px;
							  border-top-width:0px;border-left:0px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestSubtotalAmt"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleETaxableInterestSubtotalAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						<!-- end line 2 -->
						<!-- Line 3 -->
						<div class="styLNDesc" style="width:25.5mm;"/>
							<div class="styLNLeftNumBox" style="width:4mm;">3</div>
							<div class="styLNDesc" style="width:114mm;height:8mm;border-right:0px solid black;padding-left:1mm;float:left;clear:none;">
                                Excludable interest on series EE and l U.S. savings bonds issued after 1989.<br/>
                                Attach Form 8815
							    <span style="width:2px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/ExcludableSavingsBondIntAmt"/>
								</xsl:call-template>
								<span class="styBoldText">
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
									<span style="width:10px"/>.
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;width:6.8mm;padding-top:4.8mm;border-right:1px solid black;border-left:1px solid black;">
                                      3
							</div>
							<div class="styLNAmountBox" style="height:8mm;width:31mm;padding-top:4.8mm;border-left:0px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExcludableSavingsBondIntAmt"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleBExcludableSavingsBondIntAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 3 -->
					<!-- Line 4 -->
					    <div class="styBB" style="width:187mm;hight:auto;border-bottom-width: 0px;">
						<div class="styLNDesc" style="width:25.5mm;"/>
						<div class="styLNLeftNumBoxBB" style="width:4mm;height:4mm;border-bottom-width:0px;text-align:left;">4</div>
						<div class="styLNLeftNumBoxBB" style="font-weight:normal;width:114mm;padding-left:1mm;border-bottom-width:0px;height:4mm;border-right:0px solid black;">
                          Subtract line 3 from line 2. Enter the result here and on Form 1040 or 1040-SR, line 2b
							<span class="styBoldText">
								
						    </span>
						    
							<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Right pointing arrowhead image"/>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;width:6.8mm;height:4mm;padding-top:1mm;
						  border-right:1px solid black;">
                                  4
					    </div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:31mm;height:4mm;padding-top:1mm;border-left:0px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CalculatedTotalTaxableIntAmt"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleBCalculatedTotalTaxableIntAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					<!-- Line 4 note -->
									
						            <div class="styLNDesc" style="width:23.5mm;"/>
									
										<div class="styLNDesc" style="border-style: solid; border-color: black;border-top-width: 1px; border-bottom-width: 1px; 
										  border-left-width: 0px; border-right-width: 0px;width:120mm;">
												<span class="styBoldText">Note:</span> If line 4 is over $1,500, you must complete Part III.
										</div>
										<div class="styLNRightNumBox" style="border-left-width:1px;border-bottom-width:1px;width:6.8mm;border-top-width:1px;border-right-width:1px;">
										</div>
										<div class="styLNAmountBox" style="border-bottom-width:1px;width:31mm;border-top-width:1px;border-left:0px solid black;text-align:center;">
										<span class="styBoldText">Amount</span> 
										</div>
									
								<!-- end Line 4 note -->
				 </div>	
						<!--End of Part I-->
						<!--start of Part II-->
				 <div  style="width:187mm;">
								<!-- Part II Left margin -->
								<div style="width:25mm;float:left;clear:none;border-bottom-width:0px;">
									<div class="styFMT" style="padding-top:2mm;font-size:12pt;font-family:Arial;">Part II
										<br/>
                Ordinary
                Dividends
									</div>
									<div style="padding-top:1mm;width:25mm;">(See instructions<br/>
                 and the<br/>
                  instructions for<br/>
                  Form 1040 or 1040-SR,<br/>
                  line 3b.)<br/>
										<br/>
									</div>
									<div style="padding-top:1mm;width:25mm;">
										<b>Note:</b> If you<br/>
                  received a Form<br/>
                  1099-DIV or<br/>
                  substitute<br/>
                  statement from<br/>
                  a brokerage firm,<br/>
                  list the firm's<br/>
                  name as the<br/>
                  payer and enter<br/>
                  the ordinary<br/>
                  dividends shown<br/>
                  on that form.
								</div>
							</div>
								<!-- end left margin -->
								<!-- Line 5 Table -->
								<!-- Generated Table (Start) -->
								<div class="stySchBLn5TblContainer" id="1040SchBPartII" style="width:161.5mm;float:right;">
									<!-- print logic -->
									<!--<xsl:call-template name="SetInitialState"/>-->
									<!-- end -->
									<table class="styTable" cellspacing="0" width="100%" style="font-size:7pt;padding-top:mm;" summary="Table displaying Ordinary Dividends" name="ODtable" id="ODtable">
										<thead class="styTableThead">
											
                                          <tr style="width:161.5mm;float:right;">
												<th class="styTableCellHeader" scope="col" rowspan="1" style="text-align:left;width:4mm;border-right-width:0px;border-bottom-width:0px;padding-top:0mm;">
													<span class="styBoldText" style="font-size:7pt;padding-left:1mm;">5</span>
												</th>
												<th class="styTableCellHeader" scope="col" rowspan="1" style="width:114mm;border-right-width:0px;text-align:left;border-bottom-width:0px;">
													<span class="styNormalText" style="padding-left:1mm;font-size:7pt;">
                        List name of payer
                        </span>
													<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Right pointing arrowhead image"/>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part II, Line 5 - Ordinary Dividend Subtotal Literal</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendSubtotalAmt/@dividendSubtotalLiteralCd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part II, Line 5 - Ordinary Dividend Subtotal Amount</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendSubtotalAmt"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part II, Line 5 - Restricted Stock Dividend Literal</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/RestrictedStockDividendAmt/@restrictedStockDivLiteralCd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part II, Line 5 - Restricted Stock Dividend Amount</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/RestrictedStockDividendAmt"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part II, Line 5 -  Nominee Dividend Literal</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/NomineeDividendAmt/@nomineeDividendLiteralCd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part II, Line 5 -  Nominee Dividend Amount</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/NomineeDividendAmt"/>
													</xsl:call-template>
												</th>
												<th class="styTableCellHeader" scope="col" rowspan="1" style="width:6.8mm;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
													<!-- uncomment and change table header literals here or use 'cellpad' -->
													<span class="styTableCellPad">
                        </span>
												</th>
												<th class="styTableCellHeader" scope="col" rowspan="1" style="width:31mm;border-bottom-width:0px;border-right-width:0px;border-top-width:0px;border-left:0px solid black;">
													<div class="styBoldText" style="font-size:7pt;width:29mm;border-top-width:1px;">
														<div style="width:29mm;padding-left:4mm;"/>
													</div>
												</th>
											</tr>
										</thead>
										<tfoot/>
										<tbody>
											<xsl:if test="($Print != $Separated) or (count($FormData/Form1040SchBPartII) &lt;= 19) ">
												<xsl:for-each select="$FormData/Form1040SchBPartII">
													
                                                      <tr style="width:161.5mm;float:right;">
														<!-- Column 1 -->
														<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;text-align:left;">
															<span class="styBoldText" style="font-size:7pt;">
                               </span>
														</td>
														<!-- Column 2 -->
														<td class="styTableCellText" style="width:114mm;height:4mm;font-size:7pt;border-right-width:0px;text-align:left;border-bottom:1px dashed black;">
															<xsl:if test="DividendPayerNameBusiness != ''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="DividendPayerNameBusiness/BusinessNameLine1Txt"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIIDividendPayerNameBusinessBusinessNameLine1</xsl:with-param>
																</xsl:call-template>
															</xsl:if>
															<br/>
															<xsl:if test="$FormData/Form1040SchBPartII/DividendPayerNameBusiness/BusinessNameLine2Txt">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="DividendPayerNameBusiness/BusinessNameLine2Txt"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIIDividendPayerNameBusinessBusinessNameLine2</xsl:with-param>
																</xsl:call-template>
															</xsl:if>
														</td>
														<!-- Column 3 -->
														<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
															<xsl:choose>
																<xsl:when test="position() = 8">
																	<span style="padding-right:7px;font-size:7pt;font-style:bold;">5</span>
																</xsl:when>
																<xsl:otherwise>
																	<span class="styTableCellPad"/>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<!-- Column 4 -->
														<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;vertical-align:bottom;border-bottom:1px solid black;border-left:0px solid black;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="DividendAmt"/>
																<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIIDividendAmt</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<!-- Table Filler Rows -->
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 1 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												 
                                                  <tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-right-width:0px;text-align:left;border-bottom-width:1px;border-bottom:1px dashed black;">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$FormData/Form1040SchBPartII"/>
														</xsl:call-template>
														<span class="styTableCellPad">    </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 2 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;border-right-width:0px;text-align:left;border-bottom-width:1px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 3 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:1px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 4 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 5 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 6 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 7 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 8 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styBoldText" style="font-size:7pt;padding-right:2mm"> 5
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 9 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad">
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 10 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 11 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;text-align:center;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
						  </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 12 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 13 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 14 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 15 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:0px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 16 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 17 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;border-left:1px solid black;border-right:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/Form1040SchBPartII) &lt; 18 or ((count($FormData/Form1040SchBPartII) &gt; 18) and ($Print = $Separated))">
												<tr style="width:161.5mm;float:right;">
													<td class="styTableCell" style="width:4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom-width:0px;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:114mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px dashed black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:6.8mm;height:4mm;float:left;clear:none;border-right-width:1px;border-bottom-width:1px;border-left:1px solid black;border-right:1px solid black;border-bottom:1px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
													<td class="styTableCell" style="width:31mm;height:4mm;float:left;clear:none;border-right-width:0px;border-bottom:1px solid black;border-left:0px solid black;">
														<span class="styTableCellPad"> 
                          </span>
													</td>
												</tr>
												
											</xsl:if>
											<!-- End of filler rows -->		
										</tbody>
									</table>
								</div>
<!--								--><!-- Set Initial Height of Above Table --><!--
								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$FormData/Form1040SchBPartII"/>
									<xsl:with-param name="containerHeight" select="18"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" '1040SchBPartII' "/>
								</xsl:call-template>-->
								<!-- Generated Table (End) -->
								<!-- end Line 5 Table -->
								<!-- Line 6 -->
								<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
						        <div class="styLNDesc" style="width:25.5mm;"/>
								<div class="styLNLeftNumBoxBB" style="width:4mm;height:4mm;border-bottom-width:0px;text-align:left;">6</div>
								<div class="styLNLeftNumBoxBB" style="font-weight:normal;width:114mm;padding-left:1mm;border-bottom-width:0px;height:4mm;border-right:0px solid black;">
									  Add the amounts on line 5. Enter the total here and on Form 1040 or 1040-SR, line 3b.
										<!--<span class="styBoldText">
										
									    </span>-->
									    <!--	<span style="width:2mm"/>-->
										<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Right pointing arrowhead image" align="bottom"/>
									</div>
									<div class="styLNRightNumBox" style="padding-top:1mm;border-bottom-width:0px;width:6.8mm;height:4mm;border-top-width:0px;border-left:1px solid black;border-right:1px solid black;">
									  6
									</div>
									<div class="styLNAmountBox" style="border-bottom-width:0px;width:31mm;height:4mm;padding-top:1mm;border-left:0px solid black;
">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryDividendsAmt"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleBTotalOrdinaryDividendsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<!-- end line 6 -->
									<!-- Line 6 note -->
									<div class="styBB" style="width:181.5mm;border-bottom-width: 1px;height:4mm;">
						             <div class="styLNDesc" style="width:25.5mm;"/>
										<div class="styLNDesc" style="border-style: solid; border-color: black;border-top-width: 1px; border-bottom-width: 0px; 
										  border-left-width: 0px; border-right-width: 0px;width:118mm;">
												<span class="styBoldText">Note:</span> If line 6 is over $1,500, you must complete Part III.
										</div>
										<div class="styLNRightNumBox" style="border-left-width:0px;border-bottom-width:0px;width:6.8mm;border-top-width:1px;">
										</div>
										<div class="styLNAmountBox" style="border-bottom-width:0px;width:31mm;border-left-width:0px;border-top-width:1px;border-left:0px solid black;">
										</div>
									</div>
								</div>
								<!-- end Line 6 note -->
				 </div>			
						<!--end of Part II-->
							<!--Start of Part III-->
					 <div  style="width:187mm;">
							<!-- left margin Part III -->
							<div style="width:25.5mm;height:38.5;float:left;">
								<div class="styFMT" style="padding-top:0mm;font-size:12pt;font-family:Arial">
                Part III<br/>
                <div style="width:5mm;padding-top:2.5mm;">
                Foreign<br/>
                Accounts<br/>
                and Trusts</div>
                </div>
								<div style="padding-top:1mm;width:25.5mm;"><b>Caution:</b> If required, failure to<br/> file FinCEN Form<br/> 114 may result in<br/> substantial penalties. See instructions.
                </div>
							</div>
							<!-- end left margin -->
							<!--Yes and No heading-->
							<div class="styBB" style="padding-top:.5mm;width:141mm;float:left;clear:none;">
                You must complete this part if you <span class="styBoldText"> (a) </span> had over $1,500 of taxable interest or ordinary dividends;  <b>(b) </b>had a foreign account; or <b>(c)</b> received a distribution from, or were a grantor of, or a transferor to, a foreign trust.              
     </div>
							<!-- part III Yes No title -->
							<!-- Yes No Boxes -->
							<div class="styBB" style="text-align:center;width:8.5mm;padding-top:3mm;border-bottom-width:1px;border-left-width:1px;float:left;clear:none;">
								<span class="styBoldText" style="font-size:8pt;">Yes</span>
							</div>
							<div class="styBB" style="text-align:center;float:left;clear:none;width:8.5mm;padding-top:3mm;border-bottom-width:1px;border-left-width:1px;">
								<span class="styBoldText" style="font-size:8pt;">No</span>
							</div>
							<!-- end Yes No Boxes -->
							<!-- Line 7a text -->
							<div class="styGenericDiv" style="padding-top:0mm;width:158mm;border-bottom-width:0px;">
								<div class="styLNLeftNumBox" style="padding-left:0mm;width:6mm;height:10mm;">7a</div>
								<div class="styLNDesc" style="width:135mm;height:10mm;">
									<span style="float:left;clear:none;">
										At any time during 2019, did you have a financial interest in or signature authority over a financial account (such as a bank account, securities account, or brokerage account) located in a foreign country?  See instructions
									   <xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part III, Line 7a - Account Form Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/Form8814LiteralCd"/>
										</xsl:call-template>
							  <span class="styBoldText">
                                    <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     
                               </span>
									</span>
								</div>
								<!-- grey areas -->
								<div class="styBB" style="height:7mm;width:17mm;float:left;clear:none;border-bottom-width:0px;">
									<div class="styBB" style="height:7mm;width:8.5mm;background-color:lightgrey;float: left; clear: none;border-left-width: 1px;border-bottom-width:0px; ">
									</div>
									<div class="styBB" style="height:7mm;width:8.5mm;background-color:lightgrey;float: left; clear: none;border-left-width: 1px; border-bottom-width:0px;">
									</div>
								</div>
								<!--end of grey area-->
								<!-- Line 7a YES/NO -->
								<div class="styBB" style="width:17mm;float:left;clear:none;border-bottom-width:0px;">
									<div class="styBB" style="float:left;clear:none;height:4mm;width:8.5mm;border-left-width:1px;">
										<span style="padding-left:2mm;">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBForeignAccountsQuestionInd</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<div class="styBB" style="float:left;clear:none;height:4mm;width:8.5mm;border-left-width:1px;">
										<span style="padding-left:2mm;">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBForeignAccountsQuestionInd</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
								</div>
								<!-- end grey areas -->
							</div>
							<!--end of 7a-->
							<!-- second line 7a -->
							<div class="styGenericDiv" style="padding-top:0mm;width:158mm;border-bottom-width:0px;height:10mm;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;width:6mm;height:10mm;"/>
								<div class="styLNDesc" style="width:135mm;height:10mm;padding-right:1mm;">
									<span style="float:left;clear:none;">
										If “Yes,” are you required to file FinCEN Form 114, Report of Foreign Bank and Financial Accounts (FBAR), to report that financial interest or signature authority? See FinCen Form 114 and its instructions for filing requirements and exceptions to those requirements
										<span class="styBoldText">
								    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.
                                    <span style="width:10px"/>.    
                               </span>
									</span>
								</div>
								<!-- grey areas -->
								<div class="styBB" style="height:7mm;width:17mm;float:left;clear:none;border-bottom-width:0px;">
									<div class="styBB" style="height:7mm;width:8.5mm;background-color:lightgrey;float: left; clear: none;border-left-width: 1px;border-bottom-width:0px; ">
									</div>
									<div class="styBB" style="height:7mm;width:8.5mm;background-color:lightgrey;float: left; clear: none;border-left-width: 1px; border-bottom-width:0px;">
									</div>
								</div>
								<!--end of grey area-->
								<!-- Line 7a YES/NO -->
								<div class="styBB" style="width:17mm;float:left;clear:none;border-bottom-width:0px;">
									<div class="styBB" style="float:left;clear:none;height:4mm;width:8.5mm;border-left-width:1px;">
										<span style="padding-left:2mm;">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/FinCENForm114Ind"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBFinCENForm114Ind</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<div class="styBB" style="float:left;clear:none;height:4mm;width:8.5mm;border-left-width:1px;">
										<span style="padding-left:2mm;">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/FinCENForm114Ind"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBFinCENForm114Ind</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
								</div>
							</div>
							<!-- Line 7b text -->
							<div class="styGenericDiv" style="width:158mm;border-bottom-width:0px;">
								<div class="styLNLeftNumBox" style="padding-left:1.5mm;width:6mm;">b</div>
								<div class="styLNDesc" style="width:135mm;height:15mm;float:left;clear:none;padding-right:1mm;">
										If you are required to file FinCEN Form 114, enter the name of the foreign
										country where the financial account is located 
										<span style="width:1mm;"/>
									<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:105mm;border-bottom:1px dashed black;">
										<xsl:if test="$FormData/ForeignCountryCd">
											<xsl:call-template name="CreateTable">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+count($FormData/ForeignCountryCd)"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryCd"/>
											</xsl:call-template>
										</xsl:if>
									</span>
								</div>
								<!-- end Line 7b text-->
								<xsl:if test="count($FormData/ForeignCountryCd) &lt;= 5 ">
									<!-- grey areas -->
									<div class="styGenericDiv" style="height:22mm;width:8.5mm;background-color:lightgrey;border-left:1px solid black;border-bottom-width:0px;"/>
									<div class="styGenericDiv" style="height:22mm;width:8.5mm;background-color:lightgrey;border-left:1px solid black;border-bottom-width:0px;"/>
								</xsl:if>
								<!-- end grey areas -->
								<xsl:if test="count($FormData/ForeignCountryCd) &gt; 5 ">
									<!-- end Line 7b text-->
									<!-- grey areas -->
									<div class="styGenericDiv" style="height:13.7mm;width:8.5mm;background-color:lightgrey;border-left:1px solid black;border-bottom-width:0px;"/>
									<div class="styGenericDiv" style="height:13.7mm;width:8.5mm;background-color:lightgrey;border-left:1px solid black;border-bottom-width:0px;"/>
								</xsl:if>
								<!-- end grey areas -->
							</div>
							<!-- end Line 7b -->
							<!-- Line 8 text -->
							<div class="styBB" style="padding-top:0mm;width:187mm;float:left;clear:none;border-bottom-width: 0px;padding-bottom:0mm;">
							    <div class="styLNDesc" style="width:25.5mm;"/>
								<div class="styLNLeftNumBox" style="padding-left:1.5mm;width:6mm;">8</div>
								<div class="styLNDesc" style="width:135mm;height:8mm;float:left;clear:none;">
										During 2019, did you receive a distribution from, or were you the grantor of, or transferor to, a
										foreign trust? If "Yes," you may have to file Form 3520. See instructions
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part III, Line 8 - Trust Form Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TrustFormLiteralCd"/>
										</xsl:call-template>
								<span class="styBoldText">
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                                     <span style="width:10px"/>.
                               </span>
								</div>
								<!-- end Line 8 text -->
								<!-- grey areas -->
								<div class="styBB" style="height:4mm;width:17mm;float:left;clear:none;border-bottom-width:1px;">
									<div class="styBB" style="height:4mm;width:8.5mm;background-color:lightgrey;float:left;clear:none;border-left-width: 1px; border-bottom-width:0px;">
									</div>
									<div class="styBB" style="height:4mm;width:8.5mm;background-color:lightgrey;float:left; clear:none;border-left-width: 1px; border-bottom-width:0px;">
									</div>
								</div>
								<!-- end grey areas -->
								<!-- Line 8 YES/NO -->
								<div class="styBB" style="width:17mm;float:left;clear:none;border-bottom-width:0">
									<div class="styBB" style="float:left;clear:none;height:4mm;width:8.5mm;border-left-width:1px;border-bottom-width:0px;">
										<span style="padding-left:2mm;">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBForeignTrustQuestionInd</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<div class="styBB" style="float:left;clear:none;height:4mm;width:8.5mm;border-left-width:1px;border-bottom-width:0px;">
										<span style="padding-left:2mm;">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBForeignTrustQuestionInd</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
								</div>
								<!-- End Line 8 YES/NO -->
							</div>
							<!-- end Line 8 -->
						</div>
						<!--end of Part III-->
			 </div>
					<!-- page 2 footer -->
					<div style="width:187mm; border-top:1 solid black;border-top-width:1px;">
						<div style="width:100mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see your tax return instructions.</div>
						<div style="width:25mm;text-align:center;" class="styGenericDiv">Cat. No. 17146N</div>
						<div style="float:right;" class="styGenericDiv">
							<b>Schedule B (Form 1040 or 1040-SR) 2019</b>
						</div>
					</div>
					<!-- end page 2 footer -->
					<br/>
					<div class="pageEnd"/>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="width:187mm;">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<!--Additional Data Table-->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<tr style="width:161.5mm">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I, Line 1 - Interest Subtotal Literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/InterestSubtotalAmt/@interestSubtotalLiteralCd"/>
									<xsl:with-param name="BackupName">$FormData/InterestSubtotalAmt/@interestSubtotalLiteralCd</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part I, Line 1 - Interest Subtotal Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/InterestSubtotalAmt"/>
									<xsl:with-param name="BackupName">$FormData/InterestSubtotalAmt</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I, Line 1 - Nominee Interest Literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NomineeInterestAmt/@nomineeInterestLiteralCd"/>
									<xsl:with-param name="BackupName">$FormData/NomineeInterestAmt/@nomineeInterestLiteralCd</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part I, Line 1 - Nominee Interest Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NomineeInterestAmt"/>
									<xsl:with-param name="BackupName">$FormData/NomineeInterestAmt</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I, Line 1 - Accrued Interest Literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/AccruedInterestAmt/@accruedInterestLiteralCd"/>
									<xsl:with-param name="BackupName">$FormData/AccruedMarketDiscountAmt/@accruedMarketDiscountLiteralCd</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part I, Line 1 - Accrued Interest Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/AccruedInterestAmt"/>
									<xsl:with-param name="BackupName">$FormData/AccruedMarketDiscountAmt</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I, Line 1 - Accrued Market Discount literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/AccruedMarketDiscountAmt/@accruedMarketDiscountLiteralCd"/>
									<xsl:with-param name="BackupName">$FormData/AccruedMarketDiscountAmt/@accruedMarketDiscountLiteralCd</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part I, Line 1 - Accrued Market Discount Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/AccruedMarketDiscountAmt"/>
									<xsl:with-param name="BackupName">$FormData/AccruedMarketDiscountAmt</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I, Line 1 - Original Issue Discount Adj Literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OriginalIssueDiscountAdjAmt/@originalIssueDiscountAdjLitCd"/>
									<xsl:with-param name="BackupName">$FormData/OriginalIssueDiscountAdjAmt/@originalIssueDiscountAdjLitCd</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part I, Line 1 - Original Issue Discount Adj Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OriginalIssueDiscountAdjAmt"/>
									<xsl:with-param name="BackupName">$FormData/OriginalIssueDiscountAdjAmt</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I, Line 1 - Amortizable Bond Prem Adj Literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/AmortizableBondPremAdjAmt/@amortizableBondPremiumAdjLitCd"/>
									<xsl:with-param name="BackupName">$FormData/AmortizableBondPremAdjAmt/@amortizableBondPremiumAdjLitCd</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part I, Line 1 - Amortizable Bond Prem Adj Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/AmortizableBondPremAdjAmt"/>
									<xsl:with-param name="BackupName">$FormData/AmortizableBondPremAdjAmt</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part I, Line 1 - Total Seller Financed Mortgage Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalSellerFinancedMortgIntAmt"/>
									<xsl:with-param name="BackupName">$FormData/TotalSellerFinancedMortgIntAmt</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part II, Line 5 - Ordinary Dividend Subtotal Literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendSubtotalAmt/@dividendSubtotalLiteralCd"/>
									<xsl:with-param name="BackupName">$FormData/OrdinaryDividendSubtotalAmt@dividendSubtotalLiteralCd</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part II, Line 5 -  Ordinary Dividend Subtotal Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendSubtotalAmt"/>
									<xsl:with-param name="BackupName">$FormData/OrdinaryDividendSubtotalAmt</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part II, Line 5 - Restricted Stock Dividend Literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/RestrictedStockDividendAmt/@restrictedStockDivLiteralCd"/>
									<xsl:with-param name="BackupName">$FormData/RestrictedStockDividendAmt@restrictedStockDivLiteralCd</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part II, Line 5 - Restricted Stock Dividend Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/RestrictedStockDividendAmt"/>
									<xsl:with-param name="BackupName">$FormData/RestrictedStockDividendAmt/</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part II, Line 5 -  Nominee Dividend Literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NomineeInterestAmt/@nomineeInterestLiteralCd"/>
									<xsl:with-param name="BackupName">$FormData/NomineeDividendAmt/@nomineeDividendLiteralCd</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part II, Line 5 -  Nominee Dividend Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NomineeDividendAmt"/>
									<xsl:with-param name="BackupName">$FormData/NomineeDividendAmt</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III, Line 7a - Account Form Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8814LiteralCd"/>
									<xsl:with-param name="BackupName">$FormData/Form8814LiteralCd</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III, Line 8 - Trust Form Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TrustFormLiteralCd"/>
								</xsl:call-template>
						</tr>
					</table>
					<br/>
					<!--Additional Table end-->
					<!--Separate print table Line-1 Form 1040 Schedule B, Part I, Group 1-->
					<xsl:if test="($Print = $Separated) and (count($FormData/Form1040SchBPartIGroup1) &gt; 14)">
						<span class="styRepeatingDataTitle">Form 1040 Schedule B, Part I, Group 1</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;" summary="Table displaying Interest and Ordinary Dividends information">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="width:187mm;float:right;">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:8mm;height:8mm;">
                  1
                  </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:133mm;height:8mm;text-align:left;">
                  List name of payer. If any interest is from a seller-financed mortgage and the
                    buyer used the property as a personal residence, see page B-1 and list this
                    interest first. Also, show that buyer&apos;s social security number and address
                  </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:8mm;height:8mm;">
										<span class="styTableCellPad">
                    </span>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:38mm;height:8mm;font-size:8pt;">
                    Amount
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/Form1040SchBPartIGroup1">
									<!--define background colors-->
									<tr style="width:187mm;float:right;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:8mm;">
											<span style="width:4mm;font-weight:bold;">
                      </span>
											<span class="styTableCellPad">
                      </span>
										</td>
										<td class="styDepTblCell" style="width:133mm;text-align:left;">
											<span style="width:2mm;">
                     </span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SellerFinancedNm"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedNm</xsl:with-param>
											</xsl:call-template>
											<xsl:if test="SellerFinancedSSN != ''">
												<span style="width:2mm;">
                       </span>
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="SellerFinancedSSN"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedSSN</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="SellerFinancedAddressUS != ''">, 
                              <span style="width:2mm;">
                            </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressUS/AddressLine1Txt"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressUSAddressLine1</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;"> 
                               </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressUS/AddressLine2Txt"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressUSAddressLine2</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;"> 
                               </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressUS/CityNm"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressUSCity</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;">  
                               </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressUS/StateAbbreviationCd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressUSState</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;">   
                                </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressUS/ZIPCd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressUSZIPCd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="SellerFinancedAddressForeign != ''">,   
                             <span style="width:2mm;">
                            </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/AddressLine1Txt"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignAddressLine1</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;"> 
                                  </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/AddressLine2Txt"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignAddressLine2</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;"> 
                                 </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/CityNm"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignCity</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;"> 
                               </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/ProvinceOrStateNm"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignProvinceOrState</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;"> 
                               </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/CountryCd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignCountryCd</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;"> 
                               </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SellerFinancedAddressForeign/ForeignPostalCd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedAddressForeignPostalCd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="width:8mm;">
											<span class="styTableCellPad">
                      </span>
										</td>
										<td class="styDepTblCell" style="width:38mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SellerFinancedMortgageIntAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIGroup1SellerFinancedMortgageInterestAmt</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<!-- End Separated Repeating data table -->
					<!-- Begin Separated Repeating data table Form 1040 Schedule B, Part I, Group 2 -->
					<xsl:if test="($Print = $Separated) and (count($FormData/Form1040SchBPartIGroup2) &gt; 14)">
						<span class="styRepeatingDataTitle">Form 1040 Schedule B, Part I, Group 2</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:7mm;">
                  #
                  </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:107.9mm;">
                  Payer
                  </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:6.8mm;">
                  </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:29.9mm;">
                  Amount
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/Form1040SchBPartIGroup2">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:7mm;">
											<span style="width:4mm;font-weight:bold;" class="styGenericDiv">
												<xsl:number value="position()" format="1">
                      </xsl:number>
											</span>
										</td>
										<td class="styDepTblCell" style="width:107.9mm;text-align:left">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InterestPayerName/BusinessNameLine1Txt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBInterestIncomeGrpInterestPayerNameL1</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;">
                       </span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InterestPayerName/BusinessNameLine2Txt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBInterestIncomeGrpInterestPayerNameL2</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:6.8mm;">
											<span class="styTableCellPad">
                      </span>
										</td>
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InterestAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBInterestIncomeGrpInterestAmt</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table -->
					<br/>
					<!-- Begin Separated Repeating data table for Form1040SchBPartII Line 5-->
					<xsl:if test="($Print = $Separated) and (count($FormData/Form1040SchBPartII) &gt; 18)">
						<span class="styRepeatingDataTitle">Form 1040 Schedule B, Part II, Line 5</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:7mm;">
										<span class="styBoldText">#</span>
									</th>
									<!---DividendPayerNamePerson-->
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:109.1mm;">
                  Name of payer
                  </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:6.8mm;">
										<span class="styTableCellPad">
                    </span>
									</th>
									<!--DividendAmt-->
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:30.4mm;">
                  Amount
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/Form1040SchBPartII">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:7mm;">
											<span style="width:6mm;font-weight:bold;text-align:right;" class="styGenericDiv">
												<xsl:number value="position()" format="1"/>
											</span>
										</td>
										<td class="styDepTblCell" style="width:109.1mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendPayerNameBusiness/BusinessNameLine1Txt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIIDividendPayerNameBusinessBusinessNameLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendPayerNameBusiness/BusinessNameLine2Txt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIIDividendPayerNameBusinessBusinessNameLine2</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:6.8mm;">
											<span class="styTableCellPad">
                      </span>
										</td>
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleBForm1040SchBPartIIDividendAmt</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table -->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="CreateTable">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styLNAmountBox" style="width:34mm;border-right-width:0px;padding-left:1mm;text-align:left;border-bottom-width:1px">
				<xsl:call-template name="PopulateName">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTable">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PopulateName">
		<xsl:param name="TargetNode"/>
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$TargetNode"/>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
