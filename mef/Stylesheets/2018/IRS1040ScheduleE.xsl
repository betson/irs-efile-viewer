<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleEStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040ScheduleE"/>
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
				<!--hold-->
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<!--new-->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form Schedule E"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript">
            </script>
				<xsl:call-template name="InitJS">
            </xsl:call-template>
				<style type="text/css">
		         <xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS1040ScheduleEStyle"/>
					<xsl:call-template name="AddOnStyle"/>
				 </xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form id="IRS1040ScheduleE">
					<xsl:call-template name="DocumentHeader">
               </xsl:call-template>
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;height:23mm;">
							<div style="padding-top:1mm;line-height:100%;">
								<span class="styFormNumber" style="font-size:9pt;">SCHEDULE E</span>
						
								<span class="styFormNumber" style="font-size:9pt;padding-top:2mm;">(Form 1040)</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:3.0mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service (99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:23mm;">
							<div class="styMainTitle" style="height:12mm;font-size:14pt;padding-top:0mm;">
                     Supplemental Income and Loss<br/>
								<span class="styTitleDesc" style="width:127mm;font-size:10pt;">
                        (From rental real estate, royalties, partnerships,
                           S corporations, estates, trusts, REMICs, etc.)
                        </span>
							</div>
							<div style="padding-top:2mm;">
								<img src="{$ImagePath}/1040SchE_Bullet.gif" alt="Bullet Image"/>
								<span class="styBoldText" style="font-size:6pt;">Attach to Form 1040, 1040NR, or Form 1041. </span>
							</div>
							<div style="padding-top:0.5mm;">
								<img src="{$ImagePath}/1040SchE_Bullet.gif" alt="Bullet Image"/>
								<span class="styBoldText" style="font-size:6pt;">Go to <i>www.irs.gov/ScheduleE</i> for instructions and the latest information. </span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:23mm;">
							<div class="styOMB" style="height:4mm;">
                     OMB No. 1545-0074
                     </div>
							<div class="styTaxYear">
                                  20<span class="styTYColor">18</span>
							</div>
							<div style="margin-left:2mm; text-align:left;">
                     Attachment <br/>Sequence No. <span class="styBoldText">13</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;">
						<!-- Begin Names and Identifying number section -->
						<div class="styBB" style="width:187mm;">
							<div class="styNameBox" style="width:138mm;height:9mm;font-weight:normal;font-size:7pt;">
                                     Name(s) shown on return<br/>
								<xsl:choose>
									<xsl:when test="RtnHdrData/filer/NameLine1Txt">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div style="width:49mm;height:4mm;padding-left:2mm;font-size:7pt;" class="styEINBox">
                                Your social security number<br/>
								<span style="font-weight:normal;">
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/EIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerEIN</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerPrimarySSN</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<!--<xsl:choose>
								<xsl:when test="$RtnHdrData/ReturnTypeCd='1041'">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
										<xsl:with-param name="BackupName">$RtnHdrDataFilerEIN</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								  <xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
										<xsl:with-param name="BackupName">$RtnHdrDataFilerPrimarySSN</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
								</xsl:choose>-->
								</span>
							</div>
						</div>
						<!-- End Names and Identifying number section -->
						<!-- Start Part I Title -->
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="width:12mm;">Part I</div>
							<div class="styLNDesc" style="width:171mm;padding-left:2mm;height:auto;padding-top:0mm;">
								<span style="font-size:8pt;">
									<b>lncome or Loss From Rental Real Estate and Royalties</b>
									<span style="width:2mm"/>
									<b>Note:</b> If you are in the business of renting personal property, use <b>Schedule C</b> or <b>C-EZ</b>
                                   (see instructions). If you are an individual, report farm rental income or loss from
                                  <b> Form 4835</b> on page 2, line 40.</span>
							</div>
							<div class="styBB" style="width:187mm;height:auto;display:block;border-width:0mm;"/>
						</div>
						<!-- Start Prologue -->
						<div class="styBB" style="width:187mm;">
							<div class="styGenericDiv" style="width:187mm;">
								<div class="styLNLeftNumBox">A</div>
								<div class="styLNDesc" style="width:142mm;">
							         Did you make any payments in 2018 that would require you to file Form(s) 1099? (see instructions)
							         <span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">...</span>
								</div>
								<div class="styGenericDiv" style="width:28mm;">
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/PaymentRqrFilingForm1099Ind"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox" alt="YesPaymentRqrFilingForm1099">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PaymentRqrFilingForm1099Ind"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPaymentRqrFilingForm1099Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$FormData/PaymentRqrFilingForm1099Ind"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPaymentRqrFilingForm1099Ind</xsl:with-param>
											</xsl:call-template>
											<b>Yes</b>
										</label>
										<span style="width:8px;"/>
										<input type="checkbox" class="styCkbox" alt="NoPaymentRqrFilingForm1099">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PaymentRqrFilingForm1099Ind"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPaymentRqrFilingForm1099Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$FormData/PaymentRqrFilingForm1099Ind"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPaymentRqrFilingForm1099Ind</xsl:with-param>
											</xsl:call-template>
											<b>No</b>
										</label>
									</span>
								</div>
							</div>
							<div class="styGenericDiv" style="width:187mm;">
								<div class="styLNLeftNumBox">B</div>
								<div class="styLNDesc" style="width:142mm;">
							         If "Yes," did you or will you file all required Forms 1099?
							         <span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">................</span>
								</div>
								<div class="styGenericDiv" style="width:28mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/RequiredForms1099FiledInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="YesRequiredForms1099Filed">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/RequiredForms1099FiledInd"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleERequiredForms1099FiledInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/RequiredForms1099FiledInd"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleERequiredForms1099FiledInd</xsl:with-param>
										</xsl:call-template>
										<b>Yes</b>
									</label>
									<span style="width:8px;"/>
									<input type="checkbox" class="styCkbox" alt="NoRequiredForms1099Filed">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/RequiredForms1099FiledInd"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleERequiredForms1099FiledInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/RequiredForms1099FiledInd"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleERequiredForms1099FiledInd</xsl:with-param>
										</xsl:call-template>
										<b>No</b>
									</label>
								</div>
							</div>
						</div>
						<!-- End Prologue -->
						<div class="styLNDesc" style="width:3mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/PropertyDesc"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'PICctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
						<!-- END PART  I Title -->
						<!-- Part 1, Lines 1 & 2 Table (Start) -->
						<div class="styTableContainer" style="width:188mm;border-bottom-width:1px;height:auto;" id="PICctn">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-bottom-width:1px;height:auto;" cellspacing="0" id="PICTable">
								<tr style="height:2mm;">
									<td class="styTableCell" scope="col" style="height:2mm;width:5.9mm;border-right-width:0px;text-align:center;font-weight:bold;font-size:8pt;">
                                    1a
                                    </td>
									<td class="styTableCell" scope="col" colspan="8" style="width:182mm;height:2mm;border-right-width:0px; text-align:left;padding-left:2mm;">
										<span class="styNormalText" style="font-size:7.5pt;">
                                    Physical address of each property (street, city, state, and ZIP code)
                                    </span>
									</td>
								</tr>
								<xsl:if test="($Print != $Separated) or (count($FormData/PropertyRealEstAndRoyaltyGroup) &lt;= 3) ">
									<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup">
										<tr>
											<!-- Column A1 -->
											<td class="styTableCell" style="width:5.9mm;text-align:center; border-left-width:0px;height:2mm;">
												<span class="styBoldText" style="font-size:8pt;">
													<xsl:call-template name="AddPositionNumber"/>
												</span>
											</td>
											<!-- Column B1 -->
											<td class="styTableCell" colspan="7" style="width:182mm;border-right-width:0px;text-align:left;font-size:7pt;height:3mm;">
												<xsl:if test="PropertyUSAddress != ''">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="PropertyUSAddress"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPropertyUSAddress</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="PropertyForeignAddress != ''">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="PropertyForeignAddress"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPropertyForeignAddress</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<tr>
									<xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5.9mm;text-align:center;vertical-align:bottom;border-bottom-width:1px;">
												<span class="styBoldText" style="font-size:8pt;">
													<xsl:call-template name="AlphaPosition">
														<!-- row A -->
														<xsl:with-param name="Position" select="1"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" colspan="7" style="width:182mm;border-right-width:0px;border-bottom-width:1px;text-align:left">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 2 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5.9mm;text-align:center;">
												<span class="styBoldText" style="font-size:8pt;">
													<xsl:call-template name="AlphaPosition">
														<!-- row A -->
														<xsl:with-param name="Position" select="2"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" colspan="7" style="width:182mm;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 3 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5.9mm;text-align:center;">
												<span class="styBoldText" style="font-size:8pt;">
													<xsl:call-template name="AlphaPosition">
														<!-- row A -->
														<xsl:with-param name="Position" select="3"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" colspan="7" style="width:182mm;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<td class="styTableCell" scope="col" style="width:5.9mm;border-right-width:0px;text-align:center;font-weight:bold;font-size:8pt;">
                                        1b
                                   </td>
									<td class="styTableCell" scope="col" style="width:40mm;text-align:center;padding:1px;font-size:7.5pt;">
								       Type of Property<br/>(from list below)
							        </td>
									<td class="styTableCell" scope="col" style="width:5mm;border-bottom-width:0px;border-right-width:0px; font-weight:bold;font-size:8pt;text-align:center;vertical-align:top;padding-top:1mm;">                              
                                   </td>
									<td class="styTableCell" scope="col" rowspan="4" colspan="1" style="vertical-align:top;padding-top:1mm;font-size:8pt;width:71mm;border-bottom-width:0px;text-align:left;border-right-width:0px;padding-right:5mm;">
										<span class="styNormalText">
											<span style="font-size:8pt;font-weight:bold;">2</span> For each rental real estate property listed    above, report the number of fair rental and personal use days. Check the <b>QJV</b> box only if you meet the requirements to file as a qualified joint venture. See instructions.
								</span>
									</td>
									<td class="styTableCell" scope="col" style="width:5.9mm; height:7mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" scope="col" style="width:22mm; height:4mm;text-align:center;">
										<span style="font-weight:bold;font-size:7pt;">Fair Rental<br/>Days</span>
									</td>
									<td class="styTableCell" scope="col" style="width:22mm; height:4mm;text-align:center;">
										<span style="font-weight:bold;font-size:7pt;">Personal<br/>Use Days</span>
									</td>
									<td class="styTableCell" scope="col" style="width:16mm;border-right-width:0px; height:4mm;text-align:center;">
										<span style="font-weight:bold;font-size:7pt;">QJV</span>
									</td>
								</tr>
								<xsl:if test="($Print != $Separated) or (count($FormData/PropertyRealEstAndRoyaltyGroup) &lt;= 3) ">
									<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup">
										<tr>
											<!-- Column A -->
											<td class="styTableCell" style="width:5.9mm;text-align:center; border-left-width:0px;height:2mm;">
												<span class="styBoldText" style="font-size:8pt;">
													<xsl:call-template name="AddPositionNumber"/>
												</span>
											</td>
											<!-- Column B -->
											<!-- Column C -->
											<td class="styTableCell" style="width:40mm;font-size:7pt;padding:2px;text-align:left;">
												<xsl:if test="PropertyDesc">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
												</xsl:if>
												<span style="width:2mm"></span>
												<xsl:if test="OtherPropertyTypeDesc">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherPropertyTypeDesc"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<!-- Column D -->
											<td class="styTableCell" style="width:5mm;border-right-width:0px;border-bottom-width:0px; height:3mm;">
												<span class="styTableCellPad"/>
											</td>
											<!-- Column E -->
											<xsl:if test="(position() &gt; 3) ">
												<td class="styTableCell" style="width:76.9mm;border-bottom-width:0px; ">
													<span class="styTableCellPad"/>
												</td>
											</xsl:if>
											<!-- Column F -->
											<td class="styTableCell" style="width:5.9mm;vertical-align:center;text-align:center;font-size:8pt; border-left-width:1px;height:5mm; ">
												<xsl:call-template name="AddPositionNumber"/>
											</td>
											<!-- Column G -->
											<td class="styTableCell" style="width:22mm;text-align:center; vertical-align:center;color:darkblue;font-size:7pt;border-color:black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FairRentalDaysCnt"/>
												</xsl:call-template>
											</td>
											<!-- Column H -->
											<td class="styTableCell" style="width:22mm;text-align:center; vertical-align:center;color:darkblue;font-size:7pt;border-color:black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonalUseDaysCnt"/>
												</xsl:call-template>
											</td>
											<!-- Column I -->
											<td class="styTableCell" style="width:16mm;border-right-width:0px;padding-right:6.5mm; vertical-align:center;">
												<input type="checkbox" class="styCkbox" alt="QualifiedJointVenture">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="QualifiedJointVentureInd"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroup<xsl:number value="position()"/>QualifiedJointVentureInd</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="display:none">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="QualifiedJointVentureInd"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroup<xsl:number value="position()"/>QualifiedJointVentureInd</xsl:with-param>
													</xsl:call-template>
											QJV
										</label>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
									<tr>
										<!-- Column A -->
										<td class="styTableCell" style="width:5.9mm;text-align:center; border-left-width:0px;height:2mm;">
											<span class="styBoldText" style="font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="1"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- Column C -->
										<td class="styTableCell" style="width:40mm;padding:2px;text-align:left;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup"/>
											</xsl:call-template>
										</td>
										<!-- Column D -->
										<td class="styTableCell" style="width:5mm;border-right-width:0px;border-bottom-width:0px; height:3mm;">
											<span class="styTableCellPad"/>
										</td>
										<!-- Column E -->
										<xsl:if test="(position() &gt; 3) ">
											<td class="styTableCell" style="width:76.9mm;border-bottom-width:0px; ">
												<span class="styTableCellPad"/>
											</td>
										</xsl:if>
										<!-- Column F -->
										<td class="styTableCell" style="width:5.9mm;vertical-align:center;text-align:center;font-size:8pt; border-left-width:1px;height:5mm; ">
											<span class="styBoldText" style="font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="1"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- Column G -->
										<td class="styTableCell" style="width:22mm;text-align:center; vertical-align:center;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup"/>
											</xsl:call-template>
										</td>
										<!-- Column H -->
										<td class="styTableCell" style="width:22mm;text-align:center; vertical-align:center;color:darkblue;font-size:7pt;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<!-- Column I -->
										<td class="styTableCell" style="width:16mm;border-right-width:0px;text-align:center; vertical-align:center;">
											
										<input type="checkbox" class="styCkbox" alt="QualifiedJointVenture">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="RS1040ScheduleEPropertyRealEstAndRoyaltyGroup"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroup<xsl:number value="position()"/>QualifiedJointVentureInd</xsl:with-param>
													</xsl:call-template>
												</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 2 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
									<tr>
										<!-- Column A -->
										<td class="styTableCell" style="width:5.9mm;text-align:center; border-left-width:0px;height:2mm;">
											<span class="styBoldText" style="font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="2"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- Column C -->
										<td class="styTableCell" style="width:40mm;padding:2px;text-align:left;">
											<span class="styTableCellPad"/>
										</td>
										<!-- Column D -->
										<td class="styTableCell" style="width:5mm;border-right-width:0px;border-bottom-width:0px; height:3mm;">
											<span class="styTableCellPad"/>
										</td>
										<!-- Column E -->
										<xsl:if test="(position() &gt; 3) ">
											<td class="styTableCell" style="width:76.9mm;border-bottom-width:0px; ">
												<span class="styTableCellPad"/>
											</td>
										</xsl:if>
										<!-- Column F -->
										<td class="styTableCell" style="width:5.9mm;vertical-align:center;text-align:center;font-size:8pt; border-left-width:1px;height:5mm; ">
											<span class="styBoldText" style="font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="2"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- Column G -->
										<td class="styTableCell" style="width:22mm;text-align:center; vertical-align:center;">
											<span class="styTableCellPad"/>
										</td>
										<!-- Column H -->
										<td class="styTableCell" style="width:22mm;text-align:center; vertical-align:center;color:darkblue;font-size:7pt;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<!-- Column I -->
										<td class="styTableCell" style="width:16mm;border-right-width:0px;text-align:center; vertical-align:center;">
											<input type="checkbox" class="styCkbox" alt="QualifiedJointVenture">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPropertyRealEstAndRoyaltyGroup"/>
													</xsl:call-template>
												</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 3 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
									<tr>
										<!-- Column A -->
										<td class="styTableCell" style="width:5.9mm;text-align:center; border-left-width:0px;height:2mm;">
											<span class="styBoldText" style="font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="3"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- Column C -->
										<td class="styTableCell" style="width:40mm;padding:2px;text-align:left;">
											<span class="styTableCellPad"/>
										</td>
										<!-- Column D -->
										<td class="styTableCell" style="width:5mm;border-right-width:0px;border-bottom-width:0px; height:3mm;">
											<span class="styTableCellPad"/>
										</td>
										<!-- Column E -->
										<xsl:if test="(position() &gt; 3) ">
											<td class="styTableCell" style="width:76.9mm;border-bottom-width:0px; ">
												<span class="styTableCellPad"/>
											</td>
										</xsl:if>
										<!-- Column F -->
										<td class="styTableCell" style="width:5.9mm;vertical-align:center;text-align:center;font-size:8pt; border-left-width:1px;height:5mm; ">
											<span class="styBoldText" style="font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="3"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- Column G -->
										<td class="styTableCell" style="width:22mm;text-align:center; vertical-align:center;">
											<span class="styTableCellPad"/>
										</td>
										<!-- Column H -->
										<td class="styTableCell" style="width:22mm;text-align:center; vertical-align:center;color:black;font-size:7pt;color:darkblue;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<!-- Column I -->
										<td class="styTableCell" style="width:16mm;border-right-width:0px;text-align:center; vertical-align:center;padding-left:1.5mm">
										<input type="checkbox" class="styCkbox" alt="QualifiedJointVenture">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="RS1040ScheduleEPropertyRealEstAndRoyaltyGroup"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroup<xsl:number value="position()"/>QualifiedJointVentureInd</xsl:with-param>
													</xsl:call-template>
												</input>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows (Section 1) -->
								<!-- End of filler rows -->
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:if test="($Print != $Separated) or (count($FormData/PropertyRealEstAndRoyaltyGroup) &lt;= 3) ">
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'PICctn' "/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="headerHeight" select="10"/>
								<xsl:with-param name="containerID" select=" 'PICctn' "/>
							</xsl:call-template>
						</xsl:if>
						<div class="styBB" style="width:187mm;padding-left:8px;height:auto;">
							<b>Type of Property:</b>
							<br/>
							<span style="width:43.3mm;">1 Single Family Residence</span>
							<span style="width:50mm;">3 Vacation/Short-Term Rental</span>
							<span style="width:30mm;">5 Land</span>
							<span style="width:43.3mm;">7 Self-Rental</span>
							<br/>
							<span style="width:43.3mm;">2 Multi-Family Residence</span>
							<span style="width:50mm;">4 Commercial</span>
							<span style="width:30mm;">6 Royalties</span>
							<span style="width:43.3mm;">8 Other (describe)</span>
						</div>
						<!-- Generated Table (End) -->
						<table class="styTable" style="width:187mm;height:auto;" cellspacing="0">
							<thead class="styTableThead" style="height:0px;">
								<tr style="">
									<td style="width:7.4mm;"/>
									<td style="width:63.6mm;"/>
									<td style="width:8mm;"/>
									<td style="width:36mm;"/>
									<td style="width:39.5mm;"/>
									<td style="width:39.5mm;"/>
								</tr>	
						
												
								
								<xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
							        <tr>
								       <td class="styTableCell" colspan="2" style="text-align:left;width:71mm;padding-top:0mm;padding-right:2mm;border-right-width:0px;">
                                           	<span class="styBoldText" style="float:left;">	
                                           	      <span style="font-size:8pt;">
											           <b>lncome:</b>
												  </span>
											</span>
											<span class="styBoldText" style="float:right;">
														<span style="font-size:8pt;padding-right:5mm;">Properties:</span>
											</span>						       
								       </td>
								       <td class="styTableCell" style="width:8mm;border-left-width:0px;">
													<span class="styTableCellPad"/>
									</td>
								<td class="styTableCell" style="width:32.5mm;text-align:center;font-size:8pt;border-left-width:0px;">
										<xsl:call-template name="AddPositionNumber"/>
										<span class="styTableCellPad" style="border-left-width:0px;"/>
								</td>
									<td class="styTableCell" style="width:38mm;text-align:center;font-size:8pt;border-left-width:0px;">
										<xsl:call-template name="AddPositionNumber1"/>
							             <span class="styTableCellPad" style="border-left-width:0px;"/>
									</td>
									<td class="styTableCell" style="width:38mm;text-align:center;font-size:8pt;border-left-width:0px;">
										<xsl:call-template name="AddPositionNumber2"/>
							    		<span class="styTableCellPad" style="border-right-width:0px;"/>
								    </td>				
								   </tr>
								</xsl:if>

							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($FormData/PropertyRealEstAndRoyaltyGroup) &lt;=4) ">
									<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup">
										<xsl:variable name="pos" select="position()"/>
										<xsl:if test="position() mod 3 = 1">
											<xsl:variable name="conID" select="concat('PropTableID', $pos)"/>
											<xsl:variable name="imgID" select="concat('PropImgID', $pos)"/>
											<xsl:variable name="btnID" select="concat('PropBtnID', $pos)"/>
											<xsl:variable name="OtherRowCount" select="(count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/OtherExpenseDetail)+ count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/OtherExpenseDetail)+ count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/OtherExpenseDetail))"/>
											<tr>
												<td class="styTableCell" colspan="2" style="text-align:left;width:71mm;padding-top:0mm;padding-right:2mm;border-bottom-width:0px;border-right-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:8mm;border-left-width:0px;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<xsl:if test="$pos &lt;= 3">
													<td class="styTableCell" rowspan="1" style="width:32mm;text-align:center;border-right:0px;">
														<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
                                                        </span>
													</td>
													<td class="styTableCell" rowspan="1" style="width:37mm;text-align:center;border-left:0px;border-right:0px;">
														<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
                                                        </span>
													</td>
													<td class="styTableCell" rowspan="1" style="width:38mm;text-align:center;border-left:0px;">
														<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
                                                        </span>
													</td>
												</xsl:if>
											
												<xsl:if test="$pos &gt;= 4 or count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1  ">
													<td class="styTableCell" rowspan="1" style="width:32mm;text-align:center;border-right:0px;height:auto;">
														<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
                                                        </span>
													</td>
													<td class="styTableCell" rowspan="1" style="width:37mm;border-left-width:0px;text-align:center;border-left:0px;border-right:0px;height:auto;">
                                                         (Continued)
                                                    </td>
													<td class="styTableCell" rowspan="1" style="width:38mm;text-align:center;border-left:0px;height:auto;">
														<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
                                                        </span>
													</td>
												</xsl:if>
											</tr>
											<tr>
												<td class="styTableCell" colspan="2" style="text-align:left;width:71mm;padding-top:0mm;padding-right:2mm;border-right-width:0px;">
													<span class="styBoldText" style="float:left;">
														<span style="font-size:8pt;">
															<b>lncome:</b>
														</span>
													</span>
													<span class="styBoldText" style="float:right;">
														<span style="font-size:8pt;padding-right:5mm;">Properties:</span>
													</span>
												</td>
												<td class="styTableCell" style="width:8mm;border-left-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<xsl:if test="(position() &gt;= $pos and position() &lt; $pos+3)">
													<td class="styTableCell" style="width:32.5mm;text-align:center;font-size:8pt;border-left-width:0px;">
														<xsl:call-template name="AddPositionNumber"/>
														<span class="styTableCellPad" style="border-left-width:0px;"/>
													</td>
													<td class="styTableCell" style="width:38mm;text-align:center;font-size:8pt;border-left-width:0px;">
														<xsl:call-template name="AddPositionNumber1"/>
														<span class="styTableCellPad" style="border-left-width:0px;"/>
													</td>
													<td class="styTableCell" style="width:38mm;text-align:center;font-size:8pt;border-left-width:0px;">
														<xsl:call-template name="AddPositionNumber2"/>
														<span class="styTableCellPad" style="border-right-width:0px;"/>
													</td>
												</xsl:if>
											</tr>
											<!-- Line 3 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;border-top-width:0px;">
													<span class="styBoldText" style="text-align:left;padding-right:3.5mm;font-size:7pt;">
                                                     3
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Rents received </span>
													<span class="styDotLn" style="padding-right:1mm;float:right;">.......</span>
												</td>
												<!-- Column 3-->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">3</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RentsReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RentsReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RentsReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 4 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;vertical-align:top;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;font-size:7pt;">
                                                         4
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Royalties received</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">......</span>
												</td>
												<!-- Column 3-->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">4</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/TotalRoyaltiesReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/TotalRoyaltiesReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!--Column 6 -->
												<td class="styTableCell" style="width:38mm;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/TotalRoyaltiesReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Expenses -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" colspan="2" style="width:71mm;border-bottom-width:0px;border-right-width:1px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                      Expenses:
                                                    </span>
												</td>
												<!-- Column 2 -->
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="bwidth:38mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<!-- Line 5 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                      5
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Advertising</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;">.........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">5</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/AdvertisingAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/AdvertisingAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;border-top-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/AdvertisingAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 5 -->
											<!-- Line 6 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                        6
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Auto and travel (see instructions)</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">6</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/AutoAndTravelAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/AutoAndTravelAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/AutoAndTravelAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 7 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                        7
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Cleaning and maintenance</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;">...</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">7</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/CleaningAndMaintenanceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/CleaningAndMaintenanceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/CleaningAndMaintenanceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 7 -->
											<!-- Line 8 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                         8
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Commissions</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.......</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">8</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/CommissionsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/CommissionsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/CommissionsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 8 -->
											<!-- Line 9 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                         9
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Insurance</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">9</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/InsuranceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/InsuranceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/InsuranceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 9 -->
											<!-- Line 10 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         10
                                                   </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Legal and other professional fees</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">10</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/LegalAndOtherProfFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/LegalAndOtherProfFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/LegalAndOtherProfFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 10 -->
											<!-- Line 11 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         11
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Management fees</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.......</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">11</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/ManagementFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/ManagementFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/ManagementFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 11 -->
											<!-- Line 12 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;padding-bottom:2mm;">
                                                         12
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Mortgage interest paid to banks,</span>
													<span style="font-size:7pt;float:left;padding-left:1.5mm;"> etc. (see instructions)
														  <xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/MortgageInterestPaidBanksAmt"/>
														</xsl:call-template>
													</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;"/>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="padding-top:2mm;text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">12</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="padding-top:2mm;width:36mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/MortgageInterestPaidBanksAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;padding-top:2mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/MortgageInterestPaidBanksAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;padding-top:2mm;width:36mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/MortgageInterestPaidBanksAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 12 -->
											<!-- Line 13 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         13
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Other interest</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.......</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">13</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/MortgageInterestPaidOtherAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/MortgageInterestPaidOtherAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/MortgageInterestPaidOtherAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/MortgageInterestPaidOtherAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/MortgageInterestPaidOtherAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/MortgageInterestPaidOtherAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 13 -->
											<!-- Line 14 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                          14
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Repairs</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">..........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">14</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RepairsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RepairsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RepairsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 14 -->
											<!-- Line 15 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                      15
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Supplies</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">15</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/SuppliesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/SuppliesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/SuppliesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 15 -->
											<!-- Line 16 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         16
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Taxes</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">..........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">16</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/TaxesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/TaxesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/TaxesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 16 -->
											<!-- Line 17 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         17
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Utilities</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">..........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">17</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/UtilitiesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/UtilitiesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/UtilitiesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 17 -->
											<!-- Line 18 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                             18
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Depreciation expense or depletion</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">....</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">18</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/DeprecExpenseOrDepletionAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/DeprecExpenseOrDepletionAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:39.5mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/DeprecExpenseOrDepletionAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/DeprecExpenseOrDepletionAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:39.5mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/DeprecExpenseOrDepletionAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/DeprecExpenseOrDepletionAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 18 -->
											<!-- Line 19 -->
											<!-- If there are no entries for OtherExpenseAmt, then build empty rows -->
											<xsl:if test="$OtherRowCount=0">
												<tr style="height:auto;">
													<xsl:choose>
														<xsl:when test="position() mod 3=1">
															<td class="styTableCell" style="width:7.4mm;font-size:7pt;border:none;text-align:left;">
																<span class="styBoldText" style="font-size:7pt;">19</span>
															</td>
															<td class="styTableCell" style="text-align:left;border-width:0px 1px 0px 0px;border-style:solid; width:63.6mm;padding-left:1.5mm;">
                                                                Other (list)<span style="width:1mm;"/>
																<img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
																<span style="width:25mm;border-bottom-width:1px">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="Desc"/>
																	</xsl:call-template>
																</span>
															</td>
															<td class="styTableCell" style="text-align:center;width:8mm;">
																<span class="styBoldText" style="font-size:7pt;">19</span>
															</td>
															<!-- Empty columns-->
															<td class="styTableCell">
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCell" style="width:37mm;">
																<span class="styTableCellPad" style="width:12mm;"/>
															</td>
															<td class="styTableCell" style="width:38mm;">
																<span class="styTableCellPad" style="width:15mm;"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border:none;font-size:7pt;width:26mm;" scope="row">
																<div class="styGenericDiv" style="width:7mm;font-weight:bold;"/>
																<span class="styBB" style="width:29mm;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="Desc"/>
																	</xsl:call-template>
																</span>
																<span class="styTableCellPad"/>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:if>
											<xsl:variable name="FirstCol">
												<xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/OtherExpenseDetail) "/>
											</xsl:variable>
											<xsl:variable name="SecondCol">
												<xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/OtherExpenseDetail) "/>
											</xsl:variable>
											<xsl:variable name="ThirdCol">
												<xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/OtherExpenseDetail) "/>
											</xsl:variable>
											<xsl:variable name="Line18Rows">
												<xsl:value-of select="$FirstCol + $SecondCol + $ThirdCol"/>
											</xsl:variable>
											<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/OtherExpenseDetail">
												<tr style="height:auto;">
													<xsl:choose>
														<xsl:when test="position() = 1">
															<!-- Col 1 -->
															<td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
																<div class="styGenericDiv" style="width:7.4mm;font-weight:bold;text-align:left;padding-left:0mm;margin-bottom:3mm;">19</div>
															</td>
															<!-- Col 2 -->
															<td style="text-align:left;border-width:0px 1px 0px 0px;border-style:solid;padding-left:1.5mm;">
																<div class="styGenericDiv" style="width:50mm;font-size:7pt;">
																	<span>
                                                                      Other (list)
                                                                     <img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
																		<span style="width:1mm;"> </span>
																	</span>
																	<div class="styBB" style="width:50mm;border-style:dotted;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="Desc"/>
																		</xsl:call-template>
																	</div>
																</div>
															</td>
															<!-- Col 3 -->
															<xsl:if test="$Line18Rows&gt;position()">
																<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;border-bottom:0px;">
																	<span class="styTableCellPad"/>
																</td>
															</xsl:if>
															<!-- Col 3 -->
															<xsl:if test="position()=$Line18Rows">
																<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;">
																	<span style="font-size:7pt;">19</span>
																</td>
															</xsl:if>
															<!-- Col A -->
															<td class="styTableCell" style="width:32mm;height:auto;padding-top:2mm;padding-top:2mm;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/OtherExpenseDetail"/>
																</xsl:call-template>
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="Amt"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
																</xsl:call-template>
															</td>
															<td class="styTableCell" style="width:37mm;">
																<span class="styTableCellPad" style="width:18mm;"/>
															</td>
															<td class="styTableCell" style="width:38mm;">
																<span class="styTableCellPad" style="width:18mm;"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
																<span class="styTableCellPad"/>
															</td>
															<td style="border:none;font-size:7pt;text-align:left;border-width:0px 1px 0px 0px;border-style:solid;padding-left:1.5mm;" scope="row">
																<span class="styBB" style="border-style:dotted;width:50mm;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="Desc"/>
																	</xsl:call-template>
																</span>
															</td>
															<!-- Col 3 -->
															<xsl:if test="$Line18Rows&gt;position()">
																<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;border-bottom:0px;">
																	<span class="styTableCellPad"/>
																</td>
															</xsl:if>
															<!-- Col 3 -->
															<xsl:if test="position()=$Line18Rows">
																<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;">
																	<span style="font-size:7pt;">19</span>
																</td>
															</xsl:if>
															<td class="styTableCell" style="width:32mm;padding-top:2mm;padding-top:2mm;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="."/>
																</xsl:call-template>
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="Amt"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
																</xsl:call-template>
															</td>
															<td class="styTableCell" style="width:37mm;">
																<span class="styTableCellPad" style="width:21mm;"/>
															</td>
															<td class="styTableCell" style="width:38mm;">
																<span class="styTableCellPad" style="width:22mm;"/>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/OtherExpenseDetail">
												<tr style="height:auto;">
													<td style="width:7.4mm;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
														<span class="styTableCellPad"/>
													</td>
													<td style="width:63.6mm;border:none;font-size:7pt;text-align:left;border-width:0px 1px 0px 0px;border-style:solid;padding-left:1.5mm;height:2mm;" scope="row">
														<span class="styBB" style="border-style:dotted;width:50mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="Desc"/>
															</xsl:call-template>
														</span>
													</td>
													<!-- Col 3 -->
													<xsl:if test="$Line18Rows&gt;(position()+$FirstCol)">
														<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;border-bottom:0px;">
															<span class="styTableCellPad" style="width:5mm;"/>
														</td>
													</xsl:if>
													<!-- Col 3 -->
													<xsl:if test="(position()+$FirstCol)=$Line18Rows">
														<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;">
															<span style="font-size:7pt;">19</span>
														</td>
													</xsl:if>
													<td class="styTableCell" style="width:32mm;">
														<span class="styTableCellPad" style="width:10mm;"/>
													</td>
													<td class="styTableCell" style="width:37mm;padding-top:2mm;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="."/>
														</xsl:call-template>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Amt"/>
															<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="styTableCell" style="width:38mm;">
														<span class="styTableCellPad" style="width:20mm;"/>
													</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/OtherExpenseDetail">
												<tr style="height:auto;">
													<td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
														<span class="styTableCellPad"/>
													</td>
													<td style="border:none;font-size:7pt;text-align:left;border-width:0px 1px 0px 0px;border-style:solid;padding-left:1.5mm;width:63.6mm;height:auto;" scope="row">
														<span class="styBB" style="border-style:dotted;width:50mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="Desc"/>
															</xsl:call-template>
														</span>
													</td>
													<!-- Col 3 -->
													<xsl:if test="$Line18Rows&gt;(position()+$SecondCol+$FirstCol)">
														<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;border-bottom:0px;height:auto;">
															<span class="styTableCellPad" style="width:8mm;"/>
														</td>
													</xsl:if>
													<!-- Col 3 -->
													<xsl:if test="(position()+$SecondCol+$FirstCol)=$Line18Rows">
														<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;height:auto;">
															<span style="font-size:7pt;">19</span>
														</td>
													</xsl:if>
													<td class="styTableCell" style="width:32mm;height:auto;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:37mm;height:auto;">
														<span class="styTableCellPad" style="width:22mm;"/>
													</td>
													<td class="styTableCell" style="width:40mm;height:auto;padding-top:2mm;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="."/>
														</xsl:call-template>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Amt"/>
															<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
											<!-- End of Line 19 -->
											<!-- Line 20 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         20
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Total expenses. Add lines 5 through 19</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">..</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">20</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/TotalExpensesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:39.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/TotalExpensesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:39.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/TotalExpensesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 20 -->
											<!-- Line 21 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;vertical-align:top;">
													<span class="styBoldText" style="float:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         21
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Subtract line 20 from line 3 (rents) and/or 4 (royalties). If result is a (loss), see instructions</span>
													<span style="font-size:7pt;float:left;padding-left:1.5mm;"> to find out if you must file <b>Form 6198</b>
													</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">..</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;vertical-align:bottom;">
													<span class="styBoldText" style="font-size:7pt;">21</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;vertical-align:bottom;">
													<!-- Form to Form Link -->
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/NetRentalIncomeOrLossAmt"/>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:38mm;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/NetRentalIncomeOrLossAmt"/>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/NetRentalIncomeOrLossAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 21 -->
											<!-- Line 22 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;vertical-align:top;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         22
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Deductible rental real estate loss after limitation, if any, on <b>Form 8582</b>
													 (see</span>
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">  instructions)</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;vertical-align:bottom;">
													<span class="styBoldText" style="font-size:7pt;">22</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;vertical-align:bottom;">
													<xsl:call-template name="PopulateNegativeNumber">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/DedRentalRealEstateLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:38mm;vertical-align:bottom;">
													<xsl:call-template name="PopulateNegativeNumber">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/DedRentalRealEstateLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;vertical-align:bottom;">
													<xsl:call-template name="PopulateNegativeNumber">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/DedRentalRealEstateLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 22 -->
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<!-- Blank Filler rows if no data is entered -->
								<xsl:if test="(count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1) ">
									<xsl:if test="($Print != $Separated) or (count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1) ">
										<xsl:variable name="pos" select="position()"/>
										<xsl:if test="position() mod 3 = 1">
											<xsl:variable name="conID" select="concat('PropTableID', $pos)"/>
											<xsl:variable name="imgID" select="concat('PropImgID', $pos)"/>
											<xsl:variable name="btnID" select="concat('PropBtnID', $pos)"/>
											<xsl:variable name="OtherRowCount" select="(count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/OtherExpenseDetail) + count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/OtherExpenseDetail) + count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/OtherExpenseDetail))"/>
											<!-- Line 3 (2)-->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;float:left;">
													<span class="styBoldText" style="text-align:left;padding-right:3mm;font-size:7pt;">
                                                      3
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Rents received</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">......</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">3</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- Line 4 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;font-size:7pt;">
                                                         4
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Royalties received</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.....</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">4</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:39mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- Expenses -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" colspan="2" style="width:71mm;border-bottom-width:0px;border-right-width:1px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         Expenses:
                                                    </span>
												</td>
												<!-- Column 2 -->
												<!--
												<td class="styTableCell" style="width:63.5mm;text-align:left;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>-->
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<!-- Line 5 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                         5
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Advertising</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">5</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 5 -->
											<!-- Line 6 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                         6
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;padding-left:1.5mm;float:left;">Auto and travel (see instructions)</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">...</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">6</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- Line 7 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                         7
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Cleaning and maintenance</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.....</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">7</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 7 -->
											<!-- Line 8 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                          8
                                                   </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Commissions</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">..........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">8</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 8 -->
											<!-- Line 9 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                         9
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Insurance</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">..........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">9</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 9 -->
											<!-- Line 10 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         10
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;padding-left:1.5mm;">Legal and other professional fees</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">10</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 10 -->
											<!-- Line 11 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         11
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Management fees</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.......</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">11</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 11 -->
											<!-- Line 12 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;padding-bottom:3mm;">
                                                         12
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Mortgage interest paid to banks,etc. </span>
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">(see instructions)</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="padding-top:2mm;text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">12</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;padding-top:2mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="padding-top:2mm;width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="padding-top:2mm;width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 12 -->
											<!-- Line 13 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         13
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;padding-left:1.5mm;">Other interest</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">..........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">13</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 13 -->
											<!-- Line 14 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                          14
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Repairs</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">14</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 14 -->
											<!-- Line 15 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         15
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;padding-left:1.5mm;">Supplies</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">...........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">15</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 15 -->
											<!-- Line 16 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         16
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;padding-left:1.5mm;float:left;">Taxes</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">............</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">16</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 16 -->
											<!-- Line 17 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         17
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Utilities</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">...........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">17</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 17 -->
											<!-- Line 18 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;padding-left:0mm;padding-right:2mm;font-size:7pt;padding-bottom:0mm;">
                                                         18
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Depreciation expense or depletion</span>
													<!--<span style="font-size:7pt;float:left;padding-left:1.5mm;"> (see instructions)</span>-->
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">...</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">18</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<!-- Form to Form Link -->
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 18 -->
											<!-- Line 19 -->
											
										<!--	<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;padding-left:0mm;padding-right:2mm;font-size:7pt;padding-bottom:0mm;">
                                                         18
                                                    </span>
												</td>
												--><!-- Column 2 --><!--
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Depreciation expense or depletion</span>
													--><!--<span style="font-size:7pt;float:left;padding-left:1.5mm;"> (see instructions)</span>--><!--
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">...</span>
												</td>-->
												
											<tr style="height:auto;">
												<td class="styTableCell" style="width:7.4mm;font-size:normal;border:none;text-align:left;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">19</span>
												</td>
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-width:0px 1px 0px 0px;border-style:solid;padding-left:1.5mm;">
												<span style="font-size:7.5pt;float:left;padding-left:.5mm;"> Other (list)<span style="width:1mm;"/>
												       <img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
												       <span class="styTableCellPad" style="width:31mm;border-bottom-width:1px">
                                                         </span>
												</span>
                                               
												</td>
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:normal">19</span>
												</td>
												<!-- Empty columns-->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="width:10mm;"/>
												</td>
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="width:10mm;"/>
												</td>
											</tr>
											<!-- End of Line 19 -->
											<!-- Line 20 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                             20
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Total expenses. Add lines 5 through 19</span>
													<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">.</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">20</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 20 -->
											<!-- Line 21 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;vertical-align:top;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                          21
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;padding-left:1.5mm;">Subtract line 20 from line 3 (rents) and/or 4 (royalties). If result is a (loss), see instructions to find out if you must file <b>
													Form 6198</b>
													</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">21</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
												</td>
											</tr>
											<!-- End of Line 21 -->
											<!-- Line 22 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="vertical-align:text-top;width:7.4mm;border-right-width:0px;border-bottom-width:0px;vertical-align:top;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;font-size:7pt;">
                                                     22
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">
													 Deductible rental real estate loss after limitation, if any, on <b>Form 8582</b> (see  </span>
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">instructions)</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">...........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="vertical-align:text-bottom;text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">22</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:34.5mm;vertical-align:text-bottom;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
													<span style="float:left;padding-top:10mm;">(</span>
													<span style="float:right;padding-top:10mm;">)</span>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="vertical-align:text-bottom;width:39mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
													<span style="float:left;padding-top:10mm;">(</span>
													<span style="float:right;padding-top:10mm;">)</span>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="vertical-align:text-bottom;width:37.5mm;">
													<span class="styTableCellPad" style="border-left-width:0px;"/>
													<span style="float:left;padding-top:10mm;">(</span>
													<span style="float:right;padding-top:10mm;">)</span>
												</td>
											</tr>
											<!-- End of Line 22 -->
										</xsl:if>
									</xsl:if>
								</xsl:if>
								<!-- SEPARATED DATA -->
								<xsl:if test="(count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1 ) or (($Print = $Separated) and (count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 4)) ">
									<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup">
										<xsl:variable name="pos" select="position()"/>
										<xsl:if test="position() mod 3 = 1">
											<xsl:variable name="conID" select="concat('PropTableID', $pos)"/>
											<xsl:variable name="imgID" select="concat('PropImgID', $pos)"/>
											<xsl:variable name="btnID" select="concat('PropBtnID', $pos)"/>
											<xsl:variable name="OtherRowCount" select="(count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/OtherExpenseDetail) + count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/OtherExpenseDetail) + count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/OtherExpenseDetail))"/>
											<tr>
												<td class="styTableCell" colspan="2" style="text-align:left;width:71mm;border-right-width:0px;border-bottom-width:0px;padding-top:0mm;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" colspan="1" style="width:8mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<xsl:if test="$pos &lt;= 3">
													<td class="styTableCell" rowspan="1" style="width:32mm;border-right-width:0px;text-align:center;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" rowspan="1" style="width:37mm;border-right-width:0px;text-align:center;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" rowspan="1" style="width:38mm;border-right-width:0px;text-align:center;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
												</xsl:if>
												<xsl:if test="$pos &gt;= 4">
													<td class="styTableCell" rowspan="1" style="width:32mm;border-right-width:0px;text-align:center;">
													</td>
													<td class="styTableCell" rowspan="1" style="width:37mm;border-right-width:0px;border-left-width:0px;text-align:center;">
                                                      (Continued)
                                                    </td>
													<td class="styTableCell" rowspan="1" style="width:38mm;border-right-width:0px;text-align:center;border-right-width:1px;">
													</td>
												</xsl:if>
											</tr>
											<tr>
												<td class="styTableCell" colspan="2" style="text-align:left;width:71mm;border-right-width:0px;border-bottom-width:0px;padding-top:0mm;">
													<span class="styBoldText">
														<span style="font-size:8pt;">lncome:</span>
													</span>
													<span class="styBoldText" style="font-size:8pt;float:right;padding-right:1mm;">
                                                          Properties:
                                                    </span>
												</td>
												<td class="styTableCell" colspan="1" style="width:8mm;">
													<span class="styTableCellPad"/>
												</td>
												<xsl:if test="(position() &gt;= $pos and position() &lt; $pos+3)">
													<td class="styTableCell" style="width:33mm;text-align:center;font-size:8pt;border-left-width:0px;">
														<xsl:call-template name="AddPositionNumber"/>
														<span class="styTableCellPad" style="border-left-width:0px;"/>
													</td>
													<td class="styTableCell" style="width:37mm;text-align:center;font-size:8pt;border-left-width:0px;">
														<xsl:call-template name="AddPositionNumber1"/>
														<span class="styTableCellPad" style="border-left-width:0px;"/>
													</td>
													<td class="styTableCell" style="width:38mm;text-align:center;font-size:8pt;border-left-width:0px;border-right-width:1px;">
														<xsl:call-template name="AddPositionNumber2"/>
														<span class="styTableCellPad" style="border-left-width:0px;"/>
													</td>
												</xsl:if>
											</tr>
											<!-- Line 3 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="text-align:left;width:7.4;padding-left:2mm;padding-right:2mm;font-size:7pt;float:left;">
                                                        3
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Rents received</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">3</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RentsReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RentsReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RentsReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 4 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;font-size:7pt;">
                                                         4
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Royalties received</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">4</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/TotalRoyaltiesReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/TotalRoyaltiesReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/TotalRoyaltiesReceivedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Expenses -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" colspan="2" style="width:71mm;border-right-width:1px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                        Expenses:
                                                   </span>
												</td>
												<!-- Column 2 -->
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:32mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:40mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:37mm;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<!-- Line 5 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                         5
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Advertising</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">5</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/AdvertisingAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/AdvertisingAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/AdvertisingAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 5 -->
											<!-- Line 6 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                      6
                                                   </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Auto and travel (see instructions)</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.....</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">6</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/AutoAndTravelAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/AutoAndTravelAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/AutoAndTravelAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 7 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                         7
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Cleaning and maintenance</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.......</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">7</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/CleaningAndMaintenanceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/CleaningAndMaintenanceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/CleaningAndMaintenanceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 7 -->
											<!-- Line 8 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                         8
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Commissions</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">...........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">8</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/CommissionsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/CommissionsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/CommissionsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 8 -->
											<!-- Line 9 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                         9
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Insurance</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">............</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">9</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/InsuranceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/InsuranceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/InsuranceAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 9 -->
											<!-- Line 10 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         10
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Legal and other professional fees</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">..</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">10</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/LegalAndOtherProfFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/LegalAndOtherProfFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/LegalAndOtherProfFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 10 -->
											<!-- Line 11 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         11
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Management fees</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">11</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/ManagementFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/ManagementFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/ManagementFeesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 11 -->
											<!-- Line 12 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:3mm;font-size:7pt;padding-bottom:2mm;">
                                                         12
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Mortgage interest paid to banks, etc.</span>
													<span style="font-size:7pt;float:left;padding-left:1.5mm;"> (see instructions)</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">..........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="padding-top:2mm;text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">12</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="padding-top:2mm;width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/MortgageInterestPaidBanksAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="padding-top:2mm;width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/MortgageInterestPaidBanksAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="padding-top:2mm;width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/MortgageInterestPaidBanksAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 12 -->
											<!-- Line 13 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         13
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Other interest</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">..........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">13</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/MortgageInterestPaidOtherAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/MortgageInterestPaidOtherAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/MortgageInterestPaidOtherAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 13 -->
											<!-- Line 14 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                      14
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Repairs</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">............</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">14</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RepairsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RepairsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RepairsAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 14 -->
											<!-- Line 15 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         15
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Supplies</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">............</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">15</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/SuppliesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/SuppliesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:37.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/SuppliesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 15 -->
											<!-- Line 16 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                     16
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Taxes</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.............</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">16</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/TaxesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/TaxesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:37.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/TaxesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 16 -->
											<!-- Line 17 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                        17
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Utilities</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">............</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">17</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/UtilitiesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/UtilitiesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:37.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/UtilitiesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 17 -->
											<!-- Line 18 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         18
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Utilities</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">............</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">18</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:30mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/DeprecExpenseOrDepletionAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/DeprecExpenseOrDepletionAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:42mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/DeprecExpenseOrDepletionAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/DeprecExpenseOrDepletionAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:37mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/DeprecExpenseOrDepletionAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/DeprecExpenseOrDepletionAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 18 -->
											<!-- Line 19 -->
											<!-- If there are no entries for OtherExpenseAmt, then build empty rows -->
											<xsl:if test="$OtherRowCount=0">
												<tr style="height:auto;">
													<xsl:choose>
														<xsl:when test="position() mod 3=1">
															<td class="styTableCell" style="width:7.4mm;font-size:7pt;border:none;text-align:left;">
																<span class="styBoldText" style="font-size:7pt;padding-top:2mm;">19</span>
															</td>
															<td class="styTableCell" style="width:63.5mm;text-align:left;border-width:0px 1px 0px 0px;border-style:solid;padding-left:1.5mm;">
                                                                 Other (list)<span style="width:1mm;"/>
																<img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
																<span style="width:31mm;border-bottom-width:1px">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="Desc"/>
																	</xsl:call-template>
																</span>
															</td>
															<td class="styTableCell" style="text-align:center;width:8mm;">
																<span class="styBoldText" style="font-size:7pt;">19</span>
															</td>
															<!-- Empty columns-->
															<td class="styTableCell" style="width:33mm;">
																<span class="styTableCellPad" style="width:16mm;"/>
															</td>
															<td class="styTableCell" style="width:37.5mm;">
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCell" style="width:37.5mm;">
																<span class="styTableCellPad"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border:none;font-size:7pt;" scope="row">
																<div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
																<span class="styBB" style="width:29mm;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="Desc"/>
																	</xsl:call-template>
																</span>
																<span class="styTableCellPad"/>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:if>
											<xsl:variable name="FirstCol">
												<xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/OtherExpenseDetail) "/>
											</xsl:variable>
											<xsl:variable name="SecondCol">
												<xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/OtherExpenseDetail) "/>
											</xsl:variable>
											<xsl:variable name="ThirdCol">
												<xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/OtherExpenseDetail) "/>
											</xsl:variable>
											<xsl:variable name="Line18Rows">
												<xsl:value-of select="$FirstCol + $SecondCol + $ThirdCol"/>
											</xsl:variable>
											<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/OtherExpenseDetail">
												<tr style="height:auto;">
													<xsl:choose>
														<xsl:when test="position() = 1">
															<!-- Col 1 -->
															<td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
																<div class="styGenericDiv" style="width:7.4mm;font-weight:bold;text-align:left;padding-left:0mm;padding-bottom:3mm;">19</div>
															</td>
															<!-- Col 2 -->
															<td style="width:63.6mm;text-align:left;border-width:0px 1px 0px 0px;border-style:solid;padding-left:1.5mm;">
																<div class="styGenericDiv" style="width:63.6mm;font-size:7pt;">
																	<span>
                                                                        Other (list)
                                                                        <img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
																		<span style="width:1mm;"> </span>
																	</span>
																	<div class="styBB" style="width:50mm;border-style:dotted;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="Desc"/>
																		</xsl:call-template>
																	</div>
																</div>
															</td>
															<!-- Col 3 -->
															<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-bottom-width:0px;border-left-width:0px;">
																<!--																<xsl:attribute name="rowspan"><xsl:value-of select="$Line18Rows"/></xsl:attribute>
																<span style="font-size:7pt;">19</span>-->
																<span class="styTableCellPad"/>
															</td>
															<!-- Col A -->
															<td class="styTableCell" style="width:32mm;padding-top:2mm;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="."/>
																</xsl:call-template>
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="Amt"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
																</xsl:call-template>
															</td>
															<td class="styTableCell" style="width:37mm;">
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCell" style="width:38mm;">
																<span class="styTableCellPad" style="width:29mm;"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
																<span class="styTableCellPad"/>
															</td>
															<td style="border:none;font-size:7pt;text-align:left;border-width:0px 1px 0px 0px;border-style:solid;padding-left:1.5mm;" scope="row">
																<span class="styBB" style="border-style:dotted;width:50mm;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="Desc"/>
																	</xsl:call-template>
																</span>
															</td>
															<!-- Col 3 -->
															<xsl:if test="$Line18Rows&gt;position()">
																<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;border-bottom-width:0px;">
																	<span class="styTableCellPad"/>
																</td>
															</xsl:if>
															<!-- Col 3 -->
															<xsl:if test="position()=$Line18Rows">
																<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-top-width:0px;border-left-width:0px;">
																	<span style="font-size:7pt;">19</span>
																</td>
															</xsl:if>
															<td class="styTableCell" style="width:33mm;padding-top:2mm;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="."/>
																</xsl:call-template>
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="Amt"/>
																	<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
																</xsl:call-template>
															</td>
															<td class="styTableCell" style="width:37.5mm;">
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCell" style="width:38mm;">
																<span class="styTableCellPad" style="width:18mm;"/>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/OtherExpenseDetail">
												<tr style="height:auto;">
													<td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
														<span class="styTableCellPad"/>
													</td>
													<td style="border:none;font-size:7pt;text-align:left;border-width:0px 1px 0px 0px;border-style:solid;padding-left:1.5mm;">
														<span class="styBB" style="border-style:dotted;width:50mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="Desc"/>
															</xsl:call-template>
														</span>
													</td>
													<!-- Col 3 -->
													<xsl:if test="$Line18Rows&gt;(position()+$FirstCol)">
														<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;border-bottom:0px;">
															<span class="styTableCellPad"/>
														</td>
													</xsl:if>
													<!-- Col 3 -->
													<xsl:if test="(position()+$FirstCol)=$Line18Rows">
														<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;">
															<span style="font-size:7pt;">19</span>
														</td>
													</xsl:if>
													<td class="styTableCell" style="width:33mm;padding-top:2mm;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:38mm;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="."/>
														</xsl:call-template>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Amt"/>
															<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="styTableCell" style="width:37mm;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/OtherExpenseDetail">
												<tr style="height:auto;">
													<td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
														<span class="styTableCellPad"/>
													</td>
													<td style="border:none;font-size:7pt;text-align:left;border-width:0px 1px 0px 0px;border-style:solid;padding-left:1.5mm;" scope="row">
														<span class="styBB" style="border-style:dotted;width:50mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="Desc"/>
															</xsl:call-template>
														</span>
													</td>
													<!-- Col 3 -->
													<xsl:if test="$Line18Rows&gt;(position()+$FirstCol+$SecondCol)">
														<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;border-bottom:0px;">
															<span class="styTableCellPad"/>
														</td>
													</xsl:if>
													<!-- Col 3 -->
													<xsl:if test="(position()+$FirstCol+$SecondCol)=$Line18Rows">
														<td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:center;border-left-width:0px;">
															<span style="font-size:7pt;">19</span>
														</td>
													</xsl:if>
													<td class="styTableCell" style="width:33mm;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:37mm;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:38mm;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="."/>
														</xsl:call-template>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Amt"/>
															<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
											<!-- End of Line 19 -->
											<!-- Line 20 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                                         20
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;padding-left:1.5mm;">Total expenses. Add lines 5 through 19</span>
													<span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">.</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">20</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="text-align:right;width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/TotalExpensesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/TotalExpensesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:37.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/TotalExpensesAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 20 -->
											<!-- Line 21 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;padding-left:0mm;padding-right:2mm;font-size:7pt;padding-bottom:6mm;">
                                                         21
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Subtract line 20 from line 3c. If result is a (loss), see instructions to find out if you must file </span>
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">
														<b>Form 6198</b>
													</span>
													<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.........</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">21</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/NetRentalIncomeOrLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDeprecExpenseOrDepletionAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/NetRentalIncomeOrLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDeprecExpenseOrDepletionAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:37.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/NetRentalIncomeOrLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDeprecExpenseOrDepletionAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 21 -->
											<!-- Line 22 -->
											<tr style="height:auto;">
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-bottom-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;padding-bottom:3mm;">
                                                         22
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;border-bottom-width:0px;">
													<span style="font-size:7pt;padding-left:1.5mm;">Deductible rental real estate loss after limitation, if any, on <b>Form 8582</b> (see instructions)</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;vertical-align:bottom;">
													<span class="styBoldText" style="font-size:7pt;">22</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;vertical-align:bottom;">
													<xsl:call-template name="PopulateNegativeNumber">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/DedRentalRealEstateLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37.5mm;vertical-align:bottom;">
													<xsl:call-template name="PopulateNegativeNumber">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/DedRentalRealEstateLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:37.5mm;vertical-align:bottom;">
													<xsl:call-template name="PopulateNegativeNumber">
														<xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/DedRentalRealEstateLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<!-- End of Line 22 -->
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</tbody>
						</table>
						<!-- Generated Table (End) -->
						<!--scroll here 23-->
						<!-- Line 23a  -->
						<div class="styBB" style="width:187mm;height:auto;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="width:7.3mm;padding-top:.5mm;padding-left:0mm;height:5mm;">
						         23a
				  	        </div>
							<div style="float:left;">
								<div class="styLnDesc" style="padding-top:.5mm;width:104.2mm;padding-left:2mm;height:5mm;">
									<span style="float:left;">Total of all amounts reported on line 3 for all rental properties</span>
									<span class="styDotLn" style="padding-right:2mm;float:right;clear:none;">.....</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="width:5.5mm;height:5mm;">
						          23a
				        	</div>
							<div class="styLNAmountBox" style="padding-right:.5mm;width:32mm;font-size:6.5pt;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotAllPaymentsAllRentalPropAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:37.2mm;height:5mm;"/>
						</div>
						<!-- Line 23b  -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="width:7.3mm;padding-top:.5mm;padding-left:3mm;height:5mm;">
								 b
								</div>
								<div class="styLnDesc" style="padding-top:.5mm;width:104.2mm;padding-left:2mm;height:5mm;">
									<span style="float:left;">Total of all amounts reported on line 4 for all royalty properties</span>
									<span class="styDotLn" style="padding-right:2mm;float:right;clear:none;">....</span>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox" style="width:5.5mm;height:5mm;">
										 23b
									</div>
									<div class="styLNAmountBox" style="padding-right:.5mm;width:32mm;font-size:6.5pt;height:5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAllPaymentsAllRyltyPropAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="width:37.2mm;height:5mm;"/>
								</div>
							</div>
						</div>
						<!-- Line 23c  -->
						<div class="styBB" style="width:187mm;height:5mm;border-bottom-width: 0px;">
							<div style="height:auto;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="width:7.3mm;padding-top:.5mm;padding-left:3mm;height:5mm;">
									  c
								   </div>
									<div class="styLnDesc" style="padding-top:.5mm;width:104.2mm;padding-left:2mm;height:5mm;">
										<span style="float:left;">Total of all amounts reported on line 12 for all properties</span>
										<span class="styDotLn" style="padding-right:2mm;float:right;clear:none;">......</span>
									</div>
								</div>
								<div class="styLNRightNumBox" style="width:5.5mm;height:5mm;">
										 23c
								</div>
								<div class="styLNAmountBox" style="padding-right:.5mm;width:32mm;font-size:6.5pt;height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalMortgageInterestPaidAmt"/>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="width:37.2mm;height:5mm;"/>
							</div>
						</div>
						<!-- Line 23d  -->
						<div class="styBB" style="width:187mm;height:auto;border-bottom-width: 0px;">
							<div style="height:auto;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="width:7.3mm;padding-top:.5mm;padding-left:3mm;height:5mm;">
						        d
					        </div>
									<div class="styLnDesc" style="padding-top:.5mm;width:104.2mm;padding-left:2mm;height:5mm;">
										<span style="float:left;">Total of all amounts reported on line 18 for all properties</span>
										<span class="styDotLn" style="padding-right:2mm;float:right;clear:none;">......</span>
									</div>
								</div>
								<div class="styLNRightNumBox" style="width:5.5mm;height:5mm;">
						         23d
					        </div>
								<div class="styLNAmountBox" style="padding-right:.5mm;width:32mm;font-size:6.5pt;height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalDepreciationAmt"/>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="width:37.2mm;height:5mm;"/>
							</div>
						</div>
						<!-- Line 23e  -->
						<div class="styBB" style="width:187mm;height:5mm;border-bottom-width: 0px;">
							<div style="height:auto;width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="width:7.3mm;padding-top:.5mm;padding-left:3mm;height:5mm;">
								 e
								</div>
									<div class="styLnDesc" style="padding-top:.5mm;width:104.2mm;padding-left:2mm;height:5mm;">
										<span style="float:left;">Total of all amounts reported on line 20 for all properties</span>
										<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">......</span>
									</div>
								</div>
								<div class="styLNRightNumBox" style="width:5.5mm;height:5mm;">
						          23e
					         </div>
								<div class="styLNAmountBox" style="padding-right:.5mm;width:32mm;font-size:6.5pt;height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalAllPropTotalExpensesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="width:37.2mm;height:5mm;"/>
							</div>
						</div>
						<!-- Line 24  -->
						<div class="styBB" style="width:187mm;height:5mm;border-bottom-width: 0px;">
							<div style="width:187mm;height:auto;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="padding-left:0mm;width:7.3mm;padding-top:.5mm;padding-left:0mm;height:5mm;">
										   24
										</div>
									<div class="styLnDesc" style="padding-top:.5mm;width:141.8mm;padding-left:2mm;height:5mm;">
										<span class="styBoldText">lncome.</span> Add positive amounts shown on line 21. <span class="styBoldText">Do not</span> include any losses
									<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.........</span>
									</div>
								</div>
								<div class="styLNRightNumBox" style="width:5.5mm;height:5mm;">
										 24
									</div>
								<div class="styLNAmountBox" style="padding-right:.5mm;width:32mm;font-size:6.5pt;height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeAmt"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleEIncomeAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- End Line 24  -->
						<!-- Line 25  -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
							<div style="height:auto;width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="float:left;clear:none;padding-left:0mm;width:7.3mm;padding-top:.5mm;padding-left:0mm;height:5mm;">25</div>
									<div class="styLnDesc" style="padding-top:.5mm;width:141.8mm;padding-left:2mm;height:5mm;">
										<span class="styBoldText">Losses.</span> Add royalty losses from line 21 and rental real estate losses from line 22. Enter total losses here
									</div>
								</div>
								<div class="styLNRightNumBox" style="width:5.5mm;height:5mm;">
									 25
								</div>
								<div class="styLNAmountBox" style="font-size:6.5pt;width:32mm;height:5mm;">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$FormData/LossesAmt"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleELossesAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- End Line 25  -->
						<!-- Line 26  -->
						<div class="styBB" style="width:187mm;height:13mm;float:left;clear:none;">
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="float:left;clear:none;padding-left:0mm;width:7.3mm;padding-top:.5mm;padding-left:0mm;height:11mm;">26</div>
									<div class="styLnDesc" style="padding-top:.5mm;width:141.8mm;padding-left:2mm;padding-right:1mm;height:11mm;">
										<b> Total rental real estate and royalty income or (loss).</b> Combine lines 24 and 25. Enter the result here.
								   If Parts II, III, IV, and line 40 on page 2 do not apply to you, also enter this amount on Schedule 1 (Form 1040),
								   line 17, or Form 1040NR, line 18. Otherwise, include this amount in the total on line 41 on page 2
								   <xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part I, Line 26 NonPassive Activity Literal </xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityLiteralCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part I, Line 26 NonPassive Activity Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityAmt"/>
										</xsl:call-template>
										<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;"></span>
									</div>
								</div>
								<div class="styLNRightNumBox" style="width:5.5mm;height:13mm;border-bottom-width:0px;padding-top:3mm;">
									<br/>
									<br/>
									 26
							   </div>
								<div class="styLNAmountBox" style="font-size:6.5pt;padding-right:.5mm;width:32mm;height:13mm;border-bottom-width:0px;padding-top:3mm">
									<br/>
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleETotalIncomeOrLossAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- End Line 26  -->
					</div>
					<!-- End Expenses -->
					<!-- page 1 footer -->
					<div class="pageEnd" style="width:187mm;page-break-after:always;display:block;">
						<span class="styBoldText" style="width:110mm;padding-top:.5mm;float:left;clear:none;font-size:6.5pt;">
                        For Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span class="styNormalText" style="padding-top:.5mm;float:left;clear:none;">Cat. No. 11344L</span>
						<span style="float:right;clear:none;">
							<span class="styBoldText" style="font-size:7pt;padding-top:.5mm;padding-left:10mm;float:right;">Schedule E (Form 1040) 2018</span>
						</span>
					</div>
					<p class="pageEnd" style="page-break-after:always;display:block;"/>
					<!-- end page 1 footer -->
					<!-- Page 2 -->
					<div class="styTBB" style="height:5.5mm;width:187mm;">
						<span style="float:left;clear:none;padding-top:1mm;">Schedule E (Form 1040) 2018</span>
						<span style="float:left;clear:none;padding-left:45mm;padding-top:1mm;">Attachment Sequence No. <span class="styBoldText" style="font-size:10pt;">13</span>
						</span>
						<span style="float:right;clear:none;padding-top:1mm;">Page <span class="styBoldText" style="font-size:10pt;">2</span>
						</span>
					</div>
					<div style="width:187mm;" class="styBB">
						<div style="width:138mm;height:8mm;font-weight:normal;font-size:7pt;" class="styNameBox">
                            Name(s) shown on return. Do not enter name and social security number if shown on other side.<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
							<br/>
						</div>
						<div style="width:49mm;height:4mm;padding-left:2mm;font-size:7pt;" class="styEINBox">
                            Your social security number<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
									<xsl:with-param name="BackupName">$RtnHdrDataFilerPrimarySSN</xsl:with-param>
								</xsl:call-template>
								<!--<xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param></xsl:call-template><br />-->
								<!--<xsl:call-template name="PopulateReturnHeaderFiler">
                              <xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param></xsl:call-template>-->
							</span>
						</div>
					</div>
					<div style="width:187mm;" class="styBB">
						<span class="styBoldText">Caution:</span> The IRS compares amounts reported on your tax return with amounts shown on Schedule(s) K-1.
               </div>
					<!-- Part II -->
					<!-- Part II Title -->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;font-weight:normal;height:auto;">
							<span class="styBoldText">lncome or Loss From Partnerships and S Corporations - <span style="padding-left:.5mm;padding-right:1mm;">Note:</span>
							</span>If you report a loss, receive a distribution, dispose of stock, or receive a loan repayment from an S corporation, you <b>must</b> check the box in column 
							<b>(e)</b> on line 28 and attach the required basis computation.   If you report a loss from an at-risk activity for which <span class="styBoldText">any</span> amount is <span class="styBoldText">not</span> at risk, you <span class="styBoldText">must</span> check the box in column <b>(f)</b> on line 28 and attach <span class="styBoldText">Form 6198</span> (see instructions). 
                  </div>
					</div>
					<!-- End Part II Title -->
					<!-- Line 27-->
					<div style="width:187mm;" class="styBB">
						<div class="styLNLeftNumBox" style="float:left;clear:none;padding-left:0mm;width:5mm;padding-top:.5mm;padding-left:1mm;">27</div>
						<div style="width:150mm;float:left;clear:none;padding-top:.5mm;padding-left:2mm;">
                  Are you reporting any loss not allowed in a prior year due to the at-risk, excess farm loss, or basis limitations, a prior year unallowed
                  loss from a passive activity (if that loss was not reported on Form 8582), or unreimbursed partnership expenses?
                  If you answered "Yes," see instructions before completing this section.        
                         <span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">...........</span>       
                  </div>
						<div style="width:16mm;float:left;clear:none;padding-left:2mm;padding-top:5.5mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/PriorYearsLossesInd"/>
							</xsl:call-template>
							<!-- Yes Checkbox -->
							<input type="Checkbox" class="styCkbox" alt="YesPriorYearsLosses">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PriorYearsLossesInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleEPriorYearsLossesInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/PriorYearsLossesInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleEPriorYearsLossesInd</xsl:with-param>
								</xsl:call-template>
								<span style="font-weight:bold;padding-left:1mm;">Yes</span>
							</label>
						</div>
						<div style="width:13mm;float:left;clear:none;padding-left:2mm;padding-top:5.5mm;">
							<!-- No Checkbox -->
							<input type="Checkbox" class="styCkbox" alt="NoPriorYearsLosses">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PriorYearsLossesInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleEPriorYearsLossesInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/PriorYearsLossesInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleEPriorYearsLossesInd</xsl:with-param>
								</xsl:call-template>
								<span style="font-weight:bold;padding-left:1mm;">No</span>
							</label>
						</div>
						<!--<div class="styGenericDiv" style="height:2mm;float:right;clear:none;">
							-->
						<!-- button display logic -->
						<!--
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'sCorpContainerId'  "/>
							</xsl:call-template>
							-->
						<!-- end button display logic -->
						<!--
						</div>-->
					</div>
					<div class="styGenericDiv" style="height:2mm;float:right;clear:none;">
						<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>
							<xsl:with-param name="containerHeight" select="2"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'sCorpContainerId'  "/>
						</xsl:call-template>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px" id="sCorpContainerId">
						<table style="float:none;clear:both;" class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr style="height:7mm;">
									<th class="styTableCellHeader" scope="col" style="width:5mm;border-right-width:0px;height:7mm;float:left;border-bottom-width:0px;padding-top:2.5mm">
										<span class="styBoldText" style="font-size:7pt;">28</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:44.1mm;height:7mm;">
										<span style="font-weight:bold;">(a)</span>
										<span class="styNormalText">
											   Name
											</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;height:7mm;">
										<div>
											<span style="font-weight:bold;">(b)</span>
											<span class="styNormalText">
												Enter <b>P</b> for
												partnership; <b>S</b>
											</span>
											<span>
												<span style="font-weight:normal">for S corporation</span>
											</span>
										</div>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31.9mm;height:7mm;">
										<div>
											<span style="font-weight:bold;">(c)</span>
											<span class="styNormalText">
											  Check if</span>
											<span>
												<span style="font-weight:normal">foreign partnership</span>
											</span>
										</div>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:33.9mm;height:7mm;">
										<span style="padding-left:2mm;">
											<span style="font-weight:bold;">(d)</span>
											<span class="styNormalText">Employer</span>
											<span>
												<span style="font-weight:normal">identification number</span>
											</span>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;border-right-width:0px;height:7mm;">
										<span style="padding-left:2mm;">
											<span style="font-weight:bold;">(e)</span>
											<span class="styNormalText"> Check if basis</span> 
											<span>
												<span style="font-weight:normal">computation is required</span>
											</span>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;border-left-width:1px;height:7mm;border-right-width:0px;">
										<span style="padding-left:2mm;">
											<span style="font-weight:bold;">(f)</span>
											<span class="styNormalText">
											  Check if any </span>
											<span>
												<span style="font-weight:normal">amount is not at risk</span>
											</span>
										</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($FormData/PartnershipOrSCorpGroup) &lt;= 4) ">
									<xsl:for-each select="$FormData/PartnershipOrSCorpGroup">
										<tr style="height:11mm;">
											<!-- Column 0 -->
											<td class="styTableCell" style="width:5mm;height:13mm;float:left;clear:none;">
												<span class="styBoldText" style="padding-right:2mm;font-size:8pt;width:5mm;">
													<xsl:call-template name="AlphaPosition">
														<xsl:with-param name="Position" select="position()"/>
													</xsl:call-template>
												</span>
												<span class="styTableCellPad"/>
											</td>
											<!-- Column a -->
											<td class="styTableCell" style="text-align:left;width:40mm;height:11mm;clear:none;font-size:7pt;vertical-align:top;">
												<xsl:if test="PartnershipOrSCorporationNm != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PartnershipOrSCorporationNm"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpName</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count($FormData/PartnershipOrSCorpGroup/PartnershipOrSCorporationNm) &lt; 1">
													<span class="styTableCellPad"/>
												</xsl:if>
												<xsl:if test="PartnershipOrSCorpNameCd != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PartnershipOrSCorpNameCd"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpNameCd</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="count($FormData/PartnershipOrSCorpGroup/PartnershipOrSCorpNameCd) &lt; 1">
													<span class="styTableCellPad"/>
												</xsl:if>
											</td>
											<!-- Column b -->
											<td class="styTableCell" style="width:40mm;height:11mm;text-align:center;clear:none;font-size:7pt;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartnershipSCorpCd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipSCorpCd</xsl:with-param>
												</xsl:call-template>
											</td>
											<!-- Column c -->
											<td class="styTableCell" style="width:31.9mm;height:11mm;text-align:center;float:center;clear:none;font-size:7pt;vertical-align:top;">
												<!-- Checkbox -->
												<input type="checkbox" alt="ForeignPartnership" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ForeignPartnershipInd"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupForeignPartnershipInd</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ForeignPartnershipInd"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupForeignPartnershipInd</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
											<!-- Column d -->
											<td class="styTableCell" style="width:33.9mm;height:11mm;text-align:center;float:center;clear:none;font-size:7pt;vertical-align:top;">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="PartnershipOrSCorpEIN"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpEIN</xsl:with-param>
												</xsl:call-template>
											</td>
											<!-- Column e -->
											<td class="styTableCell" style="width:32mm;height:11mm;text-align:center;float:center;clear:none;border-right-width:0px;font-size:7pt;vertical-align:top;">
												<!-- Checkbox -->
												<input type="Checkbox" alt="BasisComputationRequired" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="BasisComputationRequiredInd"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="BasisComputationRequiredInd"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupBasisComputationRequiredInd</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
											
													<!-- Column f -->
											<td class="styTableCell" style="width:32mm;height:11mm;text-align:center;float:center;clear:none;border-left-width:1px;font-size:7pt;vertical-align:top;
											border-right-width:0px;">
												<!-- Checkbox -->
												<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="AnyAmountIsNotAtRiskInd"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="AnyAmountIsNotAtRiskInd"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Table Filler Rows -->
								<xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 1 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:5mm;height:5.5mm;float:left;clear:none;">
											<span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="1"/>
												</xsl:call-template>
											</span>
											<span class="styTableCellPad"/>
										</td>
									                                           	<!--      This is the Name box       -->
										<td class="styTableCell" style="width:44.1mm;height:5.5mm;clear:none;text-align:left;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										                           <!--              This is the B box                    -->
										<td class="styTableCell" style="width:40mm;height:5.5mm;float:left;clear:none;">
											<span class="styTableCellPad" style="width:40mm;"/>
										</td>
										                                  <!--              This is the C checkbox       -->                                              
										<td class="styTableCell" style="width:31.9mm;height:5.5mm;text-align:center">
											<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd"/>
													</xsl:call-template>
												</input>
										</td>
										                                                <!--              This is the D box       -->        
										<td class="styTableCell" style="width:33.9mm;height:5.5mm;float:left;clear:none;">
											<span class="styTableCellPad" style="height:5mm;"/>
										</td> 
										                                      <!--              This is the E checkbox       --> 
										<td class="styTableCell" style="width:32mm;height:5.5mm;border-right-width:0px;text-align:center;">
											<input type="Checkbox" alt="BasisComputationRequired" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupBasisComputationRequiredInd"/>
													</xsl:call-template>
												</input>
										</td>
										<td class="styTableCell" style="width:32mm;height:5.5mm;border-right-width:0px;text-align:center;border-left-width:1px;">
											<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd"/>
													</xsl:call-template>
												</input>
										</td>
									</tr>
								</xsl:if>
								<!-- row B -->
								<xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 2 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:5mm;height:5.5mm;float:left;clear:none;">
											<span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="2"/>
												</xsl:call-template>
											</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:44.1mm;height:5.5mm;clear:none;">
											<span class="styTableCellPad" style="width:44.1mm"/>
										</td>
										<td class="styTableCell" style="width:40mm;height:5.5mm;float:left;clear:none;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:31.9mm;height:5.5mm;clear:none;text-align:center">
											<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd"/>
													</xsl:call-template>
												</input>
										</td>
										<td class="styTableCell" style="width:33.9mm;height:5.5mm;float:left;clear:none;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;height:5.5mm;clear:none;border-right-width:0px;text-align:center">
										<input type="Checkbox" alt="BasisComputationRequired" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupBasisComputationRequiredInd"/>
													</xsl:call-template>
												</input>
										</td>
										<td class="styTableCell" style="width:32mm;height:5.5mm;clear:none;border-right-width:0px;text-align:center;border-left-width:1px;">
										<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd"/>
													</xsl:call-template>
												</input>
										</td>
									</tr>
								</xsl:if>
								<!-- row C -->
								<xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 3 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:5mm;height:5.5mm;float:left;clear:none;">
											<span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="3"/>
												</xsl:call-template>
											</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:44.1mm;height:5.5mm;clear:none;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:40mm;height:5.5mm;float:left;clear:none;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:31.9mm;height:5.5mm;clear:none;text-align:center">
											<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd"/>
													</xsl:call-template>
												</input>
										</td>
										<td class="styTableCell" style="width:33.9mm;height:5.5mm;clear:none;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;height:5.5mm;clear:none;border-right-width:0px;text-align:center">
											<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd"/>
													</xsl:call-template>
												</input>
										</td>
										<td class="styTableCell" style="width:32mm;height:5.5mm;clear:none;border-right-width:0px;text-align:center;border-left-width:1px;">
										<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd"/>
													</xsl:call-template>
												</input>
										</td>
									</tr>
								</xsl:if>
								<!-- row D -->
								<xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 4 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:5mm;height:5.5mm;float:left;clear:none;padding-right:1.5mm;">
											<span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="4"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</span>
										</td>
										<td class="styTableCell" style="width:44.1mm;height:5.5mm;clear:none;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:40mm;height:5.5mm;float:left;clear:none;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:31.9mm;height:5.5mm;clear:none;text-align:center">
											<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd"/>
													</xsl:call-template>
												</input>
										</td>
										<td class="styTableCell" style="width:33.9mm;height:5.5mm;clear:none;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;height:5.5mm;clear:none;border-right-width:0px;text-align:center">
											<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd"/>
													</xsl:call-template>
												</input>
										</td>
										<td class="styTableCell" style="width:32mm;height:5.5mm;clear:none;border-right-width:0px;text-align:center;border-left-width:1px;">
										<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd"/>
													</xsl:call-template>
												</input>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styFNBox" style="width:5mm;text-align:center;border-right-width:0px;height:4mm;border-bottom-width:1px;">
							<span class="styBoldText" style="font-size:8pt;"/>
						</div>
						<div class="styFNBox" style="width:75.2mm;text-align:center;border-right-width:1px;height:4mm;border-bottom-width:1px;">
							<span class="styBoldText" style="font-size:8pt;">Passive lncome and Loss</span>
						</div>
						<div class="styFNBox" style="width:106mm;text-align:center;border-right-width:0px;height:4mm;border-bottom-width:1px;">
							<span class="styBoldText" style="font-size:8pt;float:center;">Nonpassive lncome and Loss</span>
							<span class="styGenericDiv" style="height:4mm;float:right;clear:none;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'partnerSorpTbl2Id'  "/>
								</xsl:call-template>
							</span>
						</div>
						<!-- passive income and loss -->
						<!-- double table start -->
						<!-- Generated Table (Start) -->
						<div class="styTableContainer" style="width:187mm;height:auto;" id="partnerSorpTbl2Id">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" style="float:none;clear:both;" cellspacing="0">
								<thead class="styTableThead">
									<tr style="height:auto;">
										<th class="styTableCellHeader" scope="col" style="width:5mm;float:left;clear:none;height:8.5mm;">
											<span class="styTableCellPad"/>
										</th>
										<th class="styTableCellHeader" scope="col" style="width:46mm;clear:none;height:8.5mm;">
											<!-- uncomment and change table header literals here or use 'cellpad' -->
											<span style="padding-left:2mm;padding-right:1mm;">
												<span style="font-weight:bold;">(g) <span class="styNormalText"> Passive loss allowed </span>
												</span>
												<span style="float:center;">												
												          (<span style="font-weight:normal;padding-right:1mm;">attach</span>
													<b>Form 8582</b>
													<span style="font-weight:normal;padding-left:1mm"> if required)</span>
												</span>
											</span>
										</th>
										<th class="styTableCellHeader" scope="col" style="width:36.5mm;border-right-width:1px;clear:none;height:8.5mm;">
											<span style="padding-left:2mm;padding-right:1mm;">
												<span style="font-weight:bold;">(h) <span class="styNormalText">Passive income</span>
												</span>
												<span style="float:center;">
													<span style="font-weight:normal;padding-right:1mm;">from</span>
													<b>Schedule K-1 </b>
												</span>
											</span>
											<!--<span  style="padding-left:2mm;padding-right:1mm;">								
												<span style="font-weight:bold;">(g)</span>
												<span class="styNormalText">
													 Passive income
											    </span>
												<span  style="float:left;"><span style="width:mm;font-weight:normal">from</span>  <b>Schedule K-1 </b>
												</span>
											</span>-->
										</th>
										<th class="styTableCellHeader" scope="col" style="width:36.5mm;clear:none;height:8.5mm;">
                                            										
										        	<span style="font-weight:bold;">(i) <span class="styNormalText">Nonpassive loss</span>
												</span>
												<span style="float:center;">
													<span style="font-weight:normal;padding-right:1mm;">from</span>
													<b>Schedule K-1</b>
												</span>
										
										</th>
										<th class="styTableCellHeader" scope="col" style="width:30.9mm;clear:none;height:8.5mm;">
											<span style="padding-left:2mm;padding-right:1mm;">
												<span style="font-weight:bold;">(j) <span class="styNormalText">Section 179 expense</span>
												</span>
												<span style="float:center;">
													<span style="font-weight:normal;padding-right:1mm;">deduction from</span>
													<b>Form 4562</b>
												</span>
											</span>
										</th>
										<th class="styTableCellHeader" scope="col" style="width:36mm;border-right-width:0px;clear:none;">
											<span style="padding-left:2mm;padding-right:1mm;">
												<span style="font-weight:bold;">(k) <span class="styNormalText">Nonpassive income</span>
												</span>
												<span style="float:center;">
													<span style="font-weight:normal;padding-right:1mm;"> from</span>
													<b>Schedule K-1 </b>
												</span>
											</span>
											<!--<span   style="padding-left:2mm;padding-right:1mm;">	
												<span style="font-weight:bold;">(j)</span>
												<span class="styNormalText">
													 Nonpassive income</span>
												<span> from <b>Schedule K-1</b>
												</span>
											</span>-->
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($FormData/PartnershipOrSCorpGroup) &lt;= 4) ">
										<xsl:for-each select="$FormData/PartnershipOrSCorpGroup">
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:5mm;height:5mm;float:left;clear:none;">
													<span class="styBoldText" style="padding-right:2mm;font-size:8pt;">
														<xsl:call-template name="AlphaPosition">
															<xsl:with-param name="Position" select="position()"/>
														</xsl:call-template>
													</span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:46mm;height:5mm;clear:none;font-size:7pt;">
													<!-- Form to Form Link -->
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PassiveLossAllowedAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PassiveLossAllowedAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPassiveLossAllowedAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="width:36.5mm;height:5mm;clear:none;font-size:7pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="BusinessPassiveIncomeAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupBusinessPassiveIncomeAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:36.5mm;height:5mm;clear:none;font-size:7pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="NonpassiveLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupNonpassiveLossAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37.5mm;height:5mm;clear:none;font-size:7pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section179ExpenseDeductionAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupSect179ExpenseDeductionAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:36mm;height:5mm;clear:none;border-right-width:0px;font-size:7pt;padding-right:1mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="NonpassiveIncomeAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupNonpassiveIncomeAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Table Filler Rows -->
									<xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 1 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:43.5mm;width:5mm;height:4mm;float:left;clear:none;">
												<span class="styBoldText" style="font-size:8pt;padding-right:2mm;">
													<xsl:call-template name="AlphaPosition">
														<!-- row A -->
														<xsl:with-param name="Position" select="1"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:37mm;height:4mm;clear:none;text-align:left;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:34mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:37.5mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:37.5mm;height:4mm;clear:none;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 2 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;">
												<span class="styBoldText" style="padding-right:2mm;font-size:8pt;">
													<xsl:call-template name="AlphaPosition">
														<!-- row A -->
														<xsl:with-param name="Position" select="2"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:43.3mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32.8mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:35mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:36.2mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:4mm;clear:none;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 3 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;">
												<span class="styBoldText" style="padding-right:2mm;font-size:8pt;">
													<xsl:call-template name="AlphaPosition">
														<!-- row A -->
														<xsl:with-param name="Position" select="3"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:43.3mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:36mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32.8mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:36.2mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:4mm;clear:none;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 4 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;">
												<span class="styBoldText" style="padding-right:2mm;font-size:8pt;padding-right:2mm;">
													<xsl:call-template name="AlphaPosition">
														<!-- row A -->
														<xsl:with-param name="Position" select="4"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:43.3mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32.8mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:35mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:36.2mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:4mm;clear:none;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<!-- End of filler rows -->
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'partnerSorpTbl2Id' "/>
						</xsl:call-template>
						<!-- double table end -->
						<!-- end line 28 -->
						<!-- line 29 -->
						<div style="width:187mm">
							<div style="width:187mm;border-right-width:0px;height:auto;">
								<div style="float:left;clear:none;height:auto;">
									<div class="styLNLeftNumBox" style="padding-left:1mm;">29a</div>
									<div style="width:10.2mm;padding-top:.5mm;float:left;clear:none;">Totals</div>
									<div class="styShadingCell" style="width:27.8mm;border-bottom-width:1px;height:5mm;"/>
									<!-- Column 29a (g) total -->
									<div class="styLNAmountBox" style="width:34mm;height:5mm;font-size:7pt;border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPassiveIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleETotalPassiveIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div style="float:left;clear:none;height:auto;">
										<div class="styShadingCell" style="width:30mm;border-bottom-width:1px;height:5mm;font-size:7pt;border-right-width:0px;"/>
										<div class="styShadingCell" style="width:38.8mm;border-bottom-width:1px;height:5mm;font-size:7pt;border-left-width:0px;"/>
										<div class="styLNAmountBox" style="width:37.5mm;height:5mm;padding-right:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BusTotalNonpassiveIncomeAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEBusTotalNonpassiveIncomeAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
									<div class="styLNLeftNumBox" style="padding-left:4.25mm;">b</div>
									<div style="width:10.2mm;padding-top:.5mm;float:left;clear:none;">Totals</div>
									<!-- Column 29b (f) total -->
									<div class="styLNAmountBox" style="font-size:7pt;width:27.8mm;height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPassiveLossAllowedAmt"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleETotalPassiveLossAllowedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4.5mm;width:34mm;border-bottom-width:1px;"/>
									<div class="styLNAmountBox" style="width:33.5mm;height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalNonpassiveLossAmt"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleETotalNonpassiveLossAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="width:35.2mm;height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotSect179ExpenseDeductionAmt"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleETotSect179ExpenseDeductionAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4.5mm;width:37.5mm;border-bottom-width:1px;"/>
								</div>
							</div>
						</div>
						<!-- End line 29 -->
						<!-- line 30 -->
						<div style="width:187mm;height:auto;">
							<div style="float:left;width:149mm;">
								<div class="styLNLeftNumBox" style="padding-left:1mm;">30</div>
								<div style="width:141mm;padding-top:0.8mm;" class="styLnDesc">
									<span style="float:left;clear:none;">
                                      Add columns (h) and (k) of line 29a
                                </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">......................</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="width:6mm;">
                                 30
                            </div>
								<div class="styLNAmountBox" style="padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalPrtshpSCorpIncomeAmt"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleETotalPrtshpSCorpIncomeAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 31 -->
						<div style="width:187mm;height:auto;">
							<div style="float:left;width:149mm;">
								<div class="styLNLeftNumBox" style="padding-left:1mm;">31</div>
								<div style="width:141mm;padding-top:0.8mm;" class="styLnDesc">
									<span style="float:left;clear:none;">
                                     Add columns (g), (i), and (j) of line 29b
                                </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.....................</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="width:6mm;">
                             31
                            </div>
								<div class="styLNAmountBox" style="text-align:right;font-size:6.5pt;">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$FormData/TotalPrtshpSCorpLossAmt"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleETotalPrtshpSCorpLossAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- end line 31 -->
						<!-- line 32 -->
						<div class="styBB" style="width:187mm;">
							<div style="float:left;width:149mm;height:auto;">
								<div class="styLNLeftNumBox" style="padding-left:1mm;">32</div>
								<div class="styLnDesc" style="width:141mm;padding-top:0.8mm;">
									<span style="float:left;clear:none;">
										<span class="styBoldText" style="float:none;clear:none;">Total partnership and S corporation income or (loss).</span> Combine lines 30 and 31.

										<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">........</span>
									</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="border-bottom-width:0px;width:6mm;height:4mm;padding-top:1mm;">
                     32
                     </div>
								<div class="styLNAmountBox" style="border-bottom-width:0px;padding-right:1mm;height:4mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetPrtshpSCorpIncomeOrLossAmt"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleENetPrtshpSCorpIncomeOrLossAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- end line 32 -->
						<!-- Start Part III -->
						<!-- line 33 -->
						<div class="styBB" style="width:187mm;float:left:clear:none;height:auto;">
							<div class="styPartName" style="width:15mm;">Part III</div>
							<div class="styPartDesc" style="padding-left:3mm;width:86mm;height:auto;">
                             lncome or Loss From Estates and Trusts 
                        </div>
							<div class="styGenericDiv" style="float:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'EAndTIncomeId'  "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<!-- End Part III (title line) -->
						<div class="styLine33TableContainer" style="width:187mm;height:auto;" id="EAndTIncomeId">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" style="float:none;clear:both;height:auto;" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:5mm;float:left;clear:none;border-right-width:0px;height:6mm;">
											<span class="styBoldText" style="font-size:7pt;">33</span>
										</th>
										<th class="styTableCellHeader" scope="col" style="width:144.5mm;clear:none;height:6mm;">
											<!-- uncomment and change table header literals here or use 'cellpad' -->
											<span style="font-weight:bold;">(a) <span class="styNormalText"> Name</span>
											</span>
										</th>
										<th class="styTableCellHeader" scope="col" style="width:36.5mm;border-right-width:0px;clear:none;">
											<span style="font-weight:bold;">(b) <span class="styNormalText"> Employer</span>
												<span style="font-weight:normal">identification number</span>
											</span>
											<!--<span>
											<span style="font-weight:bold;float:left;">(b)</span>
											<span class="styNormalText">Employer</span>
											<span>	identification number
                                            
										</span>-->
											<!-- span class="styTableCellPad"></span -->
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($FormData/EstateAndTrustGroup) &lt;= 3) ">
										<xsl:for-each select="$FormData/EstateAndTrustGroup">
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:5mm;height:8mm;float:left;clear:none;padding-right:2mm;">
													<span class="styBoldText" style="float:center;text-align:center;font-size:8pt;padding-right:2mm;">
														<xsl:call-template name="AlphaPosition">
															<xsl:with-param name="Position" select="position()"/>
														</xsl:call-template>
													</span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:144.5mm;height:8mm;text-align:left;clear:none;font-size:7pt;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EstateOrTrustName/BusinessNameLine1Txt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustNameBusinessNameLine1</xsl:with-param>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EstateOrTrustName/BusinessNameLine2Txt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustNameBusinessNameLine2</xsl:with-param>
													</xsl:call-template>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="width:36.5mm;height:8mm;text-align:center;padding-top:4mm;border-right-width:0px;float:left;clear:none;font-size:7pt;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EstateOrTrustEIN"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustEIN</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Table Filler Rows -->
									<xsl:if test="count($FormData/EstateAndTrustGroup) &lt; 1 or ((count($FormData/EstateAndTrustGroup) &gt; 3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;">
												<span class="styBoldText" style="font-size:8pt;padding-right:2mm;">
													<xsl:call-template name="AlphaPosition">
														<xsl:with-param name="Position" select="1"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:139.7mm;height:4mm;clear:none;text-align:left;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:39.4mm;height:4mm;float:left;clear:none;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/EstateAndTrustGroup) &lt; 2 or ((count($FormData/EstateAndTrustGroup) &gt; 3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;">
												<span class="styBoldText" style="font-size:8pt;padding-right:2mm;">
													<xsl:call-template name="AlphaPosition">
														<xsl:with-param name="Position" select="2"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:139.7mm;height:4mm;clear:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:39.4mm;height:4mm;float:left;clear:none;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<!-- End of filler rows -->
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:if test="($Print != $Separated)">
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'EAndTIncomeId' "/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($Print = $Separated)">
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
								<xsl:with-param name="containerHeight" select="10"/>
								<xsl:with-param name="headerHeight" select="10"/>
								<xsl:with-param name="containerID" select=" 'EAndTIncomeId' "/>
							</xsl:call-template>
						</xsl:if>
						<!-- Generated Table (End) -->
						<!-- end line33 -->
						<!-- d33tbl -->
						<!-- Generated Table (Start) -->
						<!--Line 33 passive-->
						<div class="styBB" style="width:187mm;border-bottom-width: 1px;">
							<div class="styFNBox" style="width:4.5mm;text-align:center;border-right-width:0px;height:4mm;border-bottom-width:1px;">
								<span class="styBoldText" style="font-size:8pt;"/>
							</div>
							<div class="styFNBox" style="width:98.1mm;text-align:center;border-right-width:1px;height:4mm;border-bottom-width:1px;">
								<span class="styBoldText" style="font-size:8pt;">Passive lncome and Loss</span>
							</div>
							<div class="styFNBox" style="width:84.4mm;text-align:center;border-right-width:0px;height:4mm;border-bottom-width:1px;">
								<div class="styBoldText" style="font-size:8pt;float:center">Nonpassive lncome and Loss</div>
								<div class="styGenericDiv" style="height:4mm;float:right;border-bottom-width: 1px;">
									<!-- button display logic -->
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
										<xsl:with-param name="containerHeight" select="2"/>
										<xsl:with-param name="headerHeight" select="1"/>
										<xsl:with-param name="containerID" select=" 'estateTrustId'  "/>
									</xsl:call-template>
									<!-- end button display logic -->
								</div>
							</div>
							<div class="styTableContainer" style="width:187mm;" id="estateTrustId">
								<!-- print logic -->
								<xsl:call-template name="SetInitialState"/>
								<!-- end -->
								<table class="styTable" cellspacing="0">
									<thead class="styTableThead">
										<tr>
											<th class="styTableCellHeader" scope="col" style="float:left;clear:none;width:5mm;height:5.8mm;">
												<span class="styTableCellPad"/>
											</th>
											<th class="styTableCellHeader" scope="col" style="float:left;clear:none;width:53.2mm;">
												<span style="padding-left:4mm;padding-right:1mm;">
													<span style="font-weight:bold">(c)  <span class="styNormalText"> Passive deduction or loss allowed</span>
													</span>
													<span>
													 ( <span style="font-weight:normal;padding-right:1mm;">attach</span>
														<b>Form 8582</b>
														<span style="font-weight:normal;padding-left:1mm;">  if required</span>										)
												</span>
												</span>
											</th>
											<th class="styTableCellHeader" scope="col" style="float:left;clear:none;width:44.5mm;border-right-width:1px;">
											<span style="padding-left:4mm;padding-right:1mm;">
													<span style="font-weight:bold;">(d)  <span class="styNormalText">Passive income</span>
													</span>
													<span>
													  <span style="font-weight:normal;padding-right:1mm;"> from </span>
														<b>Schedule K-1</b>
														
												</span>
												</span>
										
											</th>
											<th class="styTableCellHeader" scope="col" style="float:left;clear:none;width:46.5mm;">
												<span style="padding-left:4mm;padding-right:1mm;">
													<span style="font-weight:bold;">(e)  <span class="styNormalText">Deduction or loss</span>
													</span>
													<span>
													  <span style="font-weight:normal;padding-right:1mm;"> from </span>
														<b>Schedule K-1</b>
														
												</span>
												<!--	<span style="font-weight:bold;float:left;">(e)</span>
													<span class="styNormalText">
														  Deduction or loss</span>
													<span>from <b>Schedule K-1</b>
													</span>-->
												</span>
												<!-- span class="styTableCellPad"></span -->
											</th>
											<th class="styTableCellHeader" scope="col" style="float:left;clear:none;width:33.2mm;border-right-width:0px;">
												<span style="padding-left:4mm;padding-right:1mm;">
												
													<span style="font-weight:bold;float:left;">(f)  <span class="styNormalText"> Other income from</span>     </span>
													   <b>Schedule K-1</b>
													
													</span>
														
													
												
												<!-- span class="styTableCellPad"></span -->
											</th>
										</tr>
									</thead>
									<tbody>
										<xsl:if test="($Print != $Separated) or (count($FormData/EstateAndTrustGroup) &lt;= 3) ">
											<xsl:for-each select="$FormData/EstateAndTrustGroup">
												<tr>
													<!-- Column 1 -->
													<td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;">
														<span class="styBoldText" style="font-size:8pt;padding-right:2mm;">
															<xsl:call-template name="AlphaPosition">
																<xsl:with-param name="Position" select="position()"/>
															</xsl:call-template>
														</span>
													</td>
													<!-- Column 2 -->
													<td class="styTableCell" style="width:53.2mm;height:4mm;float:left;clear:none;font-size:7pt;">
														<!-- Form to Form Link -->
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="PassiveDedOrLossAllowedAmt"/>
														</xsl:call-template>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="PassiveDedOrLossAllowedAmt"/>
															<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupPassiveDedOrLossAllowedAmt</xsl:with-param>
														</xsl:call-template>
													</td>
													<!-- Column 3 -->
													<td class="styTableCell" style="width:44.5mm;height:4mm;float:left;clear:none;border-right-width:1px;font-size:7pt;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="EstateAndTrustPassiveIncomeAmt"/>
															<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateAndTrustPassiveIncomeAmt</xsl:with-param>
														</xsl:call-template>
													</td>
													<!-- Column 4 -->
													<td class="styTableCell" style="width:46.5mm;height:4mm;float:left;clear:none;font-size:7pt;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="DeductionOrLossAmt"/>
															<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupDeductionOrLossAmt</xsl:with-param>
														</xsl:call-template>
													</td>
													<!-- Column 5 -->
													<td class="styTableCell" style="width:33.2mm;height:4mm;float:left;clear:none;border-right-width:0px;font-size:7pt;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="OtherIncomeAmt"/>
															<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupOtherIncomeAmt</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<!-- Table Filler Rows -->
										<xsl:if test="count($FormData/EstateAndTrustGroup) &lt; 1 or ((count($FormData/EstateAndTrustGroup) &gt; 3) and ($Print = $Separated))">
											<tr>
												<td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;">
													<span class="styBoldText" style="float:center;text-align:center;font-size:8pt;padding-right:2mm;">
														<xsl:call-template name="AlphaPosition">
															<!-- row A -->
															<xsl:with-param name="Position" select="1"/>
														</xsl:call-template>
													</span>
												</td>
												<td class="styTableCell" style="width:53.2mm;height:4mm;float:left;clear:none;text-align:left">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:44.5mm;height:4mm;float:left;clear:none;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:46.5mm;height:4mm;float:left;clear:none;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:36.5mm;height:4mm;float:left;clear:none;border-right-width:0px;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($FormData/EstateAndTrustGroup) &lt; 2 or ((count($FormData/EstateAndTrustGroup) &gt; 3) and ($Print = $Separated))">
											<tr>
												<td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;">
													<span class="styBoldText" style="float:center;text-align:center;font-size:8pt;padding-right:2mm;">
														<xsl:call-template name="AlphaPosition">
															<!-- row A -->
															<xsl:with-param name="Position" select="2"/>
														</xsl:call-template>
													</span>
												</td>
												<td class="styTableCell" style="width:53.2mm;height:4mm;float:left;clear:none;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:44.5mm;height:4mm;float:left;clear:none;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:46.5mm;height:4mm;float:left;clear:none;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:36.5mm;height:4mm;float:left;clear:none;border-right-width:0px;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<!-- End of filler rows -->
									</tbody>
								</table>
							</div>
							<!-- Set Initial Height of Above Table -->
							<xsl:if test="($Print = $Separated)">
								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="headerHeight" select="10"/>
									<xsl:with-param name="containerID" select=" 'estateTrustId' "/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Print != $Separated)">
								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'estateTrustId' "/>
								</xsl:call-template>
							</xsl:if>
							<!-- Generated Table (End) -->
							<!-- end d33tbl -->
							<!--Line 34a-->
							<!-- part iii table (left) -->
							<!-- Totals (left) -->
							<div class="styFNBox" style="width:187mm;border-right-width:0px;">
								<div style="float:left;clear:none;">
									<div class="styLNLeftNumBox" style="padding-left:0mm;width:6.1mm;padding-top:.5mm;text-align:right;">34a</div>
									<div style="width:13mm;float:left;clear:none;padding-top:.5mm;padding-left:2mm;">
                                     Totals
                                </div>
									<!-- greyed box -->
									<div class="styShadingCell" style="height:4.5mm;width:38.8mm;border-bottom-width:1px;"/>
									<!-- Column 34a (d) total -->
									<div class="styLNAmountBox" style="width:44.7mm;height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustTotPssvIncmAmt"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustTotPssvIncmAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div style="float:left;clear:none;">
										<!-- greyed box -->
										<div class="styShadingCell" style="height:4.5mm;width:46.3mm;border-bottom-width:1px;border-left-width:0px;"/>
										<!-- Column 34a (f) total -->
										<div class="styLNAmountBox" style="width:36.5mm;height:4.5mm;padding-right:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleETotalOtherIncomeAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
									<div style="width:187mm;float:left;clear:none;">
										<div class="styLNLeftNumBox" style="padding-left:0mm;width:6.1mm;padding-top:.5mm;text-align:right;">b</div>
										<div style="width:13mm;float:left;clear:none;padding-top:.5mm;padding-left:2mm;">
                                         Totals
                                    </div>
										<!-- Column 34b (c) total -->
										<div class="styLNAmountBox" style="width:38.8mm;height:5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotPassiveDedOrLossAllowedAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleETotPassiveDedOrLossAllowedAmt</xsl:with-param>
											</xsl:call-template>
										</div>
										<!-- greyed box -->
										<div style="float:left;clear:none;">
											<div class="styShadingCell" style="height:5mm;width:44.6mm;border-bottom-width:1px;"/>
											<!-- Column 34b (e) total -->
											<div class="styLNAmountBox" style="width:46.5mm;height:5mm;border-left-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionOrLossAmt"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleETotalDeductionOrLossAmt</xsl:with-param>
												</xsl:call-template>
											</div>
											<!-- greyed box -->
											<div class="styShadingCell" style="height:5mm;width:38mm;border-bottom-width:1px;"/>
										</div>
									</div>
									<!-- end Totals (left) -->
								</div>
							</div>
							<!-- line 35 -->
							<div style="width:187mm;">
								<div style="float:left;width:149mm;height:auto;">
									<div class="styLNLeftNumBox" style="padding-left:1mm;">35</div>
									<div style="width:141mm;padding-top:0.5mm;" class="styLnDesc">
										<span style="float:left;clear:none;">
                                         Add columns (d) and (f) of line 34a
                                    </span>
										<span class="styDotLn" style="clear:none;padding-right:1mm;float:right;">......................</span>
									</div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox" style="width:6mm;">
                                     35
                                </div>
									<div class="styLNAmountBox" style="padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalEstateOrTrustIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleETotalEstateOrTrustIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!-- end line 35 -->
							<!-- line 36 -->
							<div style="width:187mm;">
								<div style="float:left;width:149mm;height:auto;">
									<div class="styLNLeftNumBox" style="padding-left:1mm;">36</div>
									<div style="width:141mm;padding-top:0.5mm;" class="styLnDesc">
										<span style="float:left;clear:none;">
                                         Add columns (c) and (e) of line 34b
                                    </span>
										<span class="styDotLn" style="clear:none;padding-right:1mm;float:right;">......................</span>
									</div>
								</div>
								<div class="styLNRightNumBox" style="width:6mm;height:5mm;">
                                 36
                            </div>
								<div class="styLNAmountBox" style="padding-right:1mm;font-size:6.5pt;height:5mm;text-align:right;">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$FormData/TotalEstateOrTrustLossAmt"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleETotalEstateOrTrustLossAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!-- end line 36 -->
							<!-- line 37 -->
							<div style="width:187mm;">
								<div style="float:left;width:149mm;height:auto;">
									<div class="styLNLeftNumBox" style="padding-left:1mm;">37</div>
									<div style="width:141mm;padding-top:0.5mm;" class="styLnDesc">
										<span style="float:left;clear:none;">
											<span class="styBoldText">Total estate and trust income or (loss).</span> Combine lines 35 and 36. 
					    <xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Part III, Line 37 Schedule K1 ES Payment Literal </xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsLiteralCd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Part III, Line 37 Schedule K1 ES Payment Amount</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsAmt"/>
											</xsl:call-template>
											<span class="styDotLn" style="clear:none;padding-right:1mm;float:right;">...........</span>
										</span>
									</div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox" style="height:4mm;width:6mm;padding-top:1mm;border-bottom-width:0px;">
                                     37
                                </div>
									<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;padding-top:1mm;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotEstateAndTrustIncOrLossAmt"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleETotEstateAndTrustIncOrLossAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- end line 37 -->
						<div class="pageEnd" style="width:187mm;page-break-after:always;display:block;"/>
						<div style="&#160;"/>
						<!-- Start Part IV -->
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartName" style="width:15mm;height:3.85mm;">Part IV</div>
							<div class="styPartDesc" style="padding-left:3mm;width:160mm;height:auto;">
                  lncome or Loss From Real Estate Mortgage Investment Conduits (REMICs)-Residual Holder 
                    </div>
							<div class="styGenericDiv" style="float:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/REMICGroup"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'IncomeId'  "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<!-- Line 38 (all headers) -->
						<div class="styTableContainer " style="width:187mm;height:auto;" id="IncomeId">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0" style="width:187mm;">
								<thead class="styTableThead">
									<tr style="width:187mm;">
										<th style="width:5mm;border-right-width:0px;height:12mm;float:left;border-bottom:1px solid black;">
											<div style="width:5mm;clear:none;font-size:7pt;">38
                                       </div>
										</th>
										<th class="styTableCellHeader" style="width:50mm;height:12mm;">
											 <b> (a)</b> <span style="width:1mm"/><span style="font-weight:normal;"> Name</span>

										</th>
										<th class="styTableCellHeader" style="width:26mm;height:12mm;">
										    <div style="width:26mm;">
										         <span> <b> (b) </b> <span style="font-weight:normal;">Employer</span> </span>
										         <span style="font-weight:normal;">identification number</span>
										    </div>
											<!--<div style="width:26mm;">
												<div style="float:left;">
													<b> (b) </b>
												</div>
												<div style="font-weight:normal;">Employer</div>
											</div>
											<div style="float:left;width:26mm;padding-left:0px;">identification number</div>-->
										</th>
										<th class="styTableCellHeader" style="width:33mm;font-weight:normal;height:12mm;">
											<div style="padding-top:2mm;font-weight:normal;">
												<b>(c) </b>Excess inclusion from <b>Schedules Q,</b> line 2c <br/> (see instructions)
                                        </div>
										</th>
										<th class="styTableCellHeader" style="width:37mm;float:left;height:13mm;">
										     <div style="width:10mm;height:3.5mm"/>
										       <span> <b> (d) </b> <span style="font-weight:normal;">Taxable income (net loss) </span> </span>
										         <span style="font-weight:normal;">from <b> Schedules Q,</b><span style="font-weight:normal;padding-left:1mm"> line 1b </span></span>
											<!--<span style="width:37mm;padding-top:3mm;">
												<span style="font-weight:bold;float:left;">
													<b>(d)</b>
												</span>
												<span class="styNormalText">
												Taxable income (net loss) </span>
												<span>
												from <b>Schedules Q,</b> line 1b
											</span>
											</span>-->
											<!-- span class="styTableCellPad"></span -->
										</th>
										<th class="styTableCellHeader" style="width:6mm;border-right-width:0px;border-bottom-width:1px;">
											<span class="styTableCellPad"/>
										</th>
										<th class="styTableCellHeader" style="width:32mm;border-right-width:0px;">
											<span style="width:26mm;">
												<span style="font-weight:bold;">
													<b>(e)</b>
												</span>
												<span class="styNormalText" style="padding-left:1mm"> lncome from </span>
											</span>
											<span >
												<b>Schedules Q,</b> <span class="styNormalText" style="padding-left:1mm"> line 3b</span>
										   </span>
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($FormData/REMICGroup) &lt;5) ">
										<xsl:for-each select="$FormData/REMICGroup">
											<tr>
												<td class="styTableCell" style="width:5mm;height:4mm;border-bottom-width:1px;border-right-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:50mm;height:4mm;font-size:7pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="REMICName/BusinessNameLine1Txt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICName</xsl:with-param>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="REMICName/BusinessNameLine2Txt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICName</xsl:with-param>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:23mm;height:4mm;text-align:center;font-size:7pt;">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="REMICEIN"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICEIN</xsl:with-param>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:32mm;height:4mm;text-align:right;font-size:7pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ExcessInclusionAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupExcessInclusionAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:37mm;height:4mm;text-align:right;font-size:7pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxableIncomeOrNetLossAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupTaxableIncomeOrNetLossAmt</xsl:with-param>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:6mm;height:4mm;border-left-width:0px; border-bottom-width: 1px;background-color:lightgrey;">
													<span class="styTableCellPad" style="width:6mm;"/>
												</td>
												<td class="styTableCell" style="width:31.5mm;height:4mm;text-align:right;border-right-width:0px;font-size:7pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="REMICIncomeAmt"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICIncomeAmt</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Table Filler Rows -->
									<xsl:if test="count($FormData/REMICGroup) &lt; 1 or ((count($FormData/REMICGroup) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:50mm;height:4mm;clear:none;text-align:left;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$FormData/REMICGroup"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:18mm;height:4mm;text-align:right;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;height:4mm;text-align:right;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:37mm;height:4mm;text-align:right;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styShadingCellRB" style="width:6mm;height:4mm;border-left-width:0px;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:31.5mm;height:4mm;text-align:right;border-right-width:0px;">
												<!--	<span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">-->
												<span class="styTableCellPad"/>
												<!--	</span>-->
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- End Line 38 (data) -->
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/REMICGroup"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'IncomeId' "/>
						</xsl:call-template>
						<!-- Generated Table (End) -->
						<!-- line 39 -->
						<div class="styBB" style="width:187mm;">
							<div style="float:left;width:149mm;">
								<div class="styLNLeftNumBox" style="padding-left:1mm;">39</div>
								<div style="width:141mm;padding-top:0.5mm;" class="styLnDesc">
									<span style="float:left;clear:none;">
                                   Combine columns (d) and (e) only. Enter the result here and include in the total on line 41 below
                                </span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="width:6mm;border-bottom-width:0px;height:5mm;">
                                 39
                            </div>
								<div class="styLNAmountBox" style="padding-right:1mm;border-bottom-width:0px;height:5mm;padding-top:0.8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalREMICIncomeAmt"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleETotalREMICIncomeAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- end line 39 -->
						<!-- Start Part V -->
						<div style="width:187mm;" class="styBB">
							<div class="styPartName" style="width:15mm;">Part V</div>
							<div class="styPartDesc" style="padding-left:3mm;">
                            Summary 
                        </div>
						</div>
						<!-- line 40 -->
						<div style="width:187mm;">
							<div style="float:left;width:149mm;">
								<div class="styLNLeftNumBox" style="padding-left:1mm;">40</div>
								<div style="width:141mm;padding-top:0.5mm;" class="styLnDesc">
									<span style="float:left;clear:none;">
                                     Net farm rental income or (loss) from <span class="styBoldText">Form 4835</span>. Also, complete line 42 below
                                </span>
									<span class="styDotLn" style="clear:none;padding-right:1mm;float:right;">.........</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="width:6mm;height:5mm;">
                                40
                            </div>
								<div class="styLNAmountBox" style="padding-right:1mm;height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetFarmRentalIncomeOrLossAmt"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleENetFarmRentalIncomeOrLossAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- end line 40 -->
						<!-- line 41 -->
						<div style="width:187mm;">
							<div style="float:left;width:149mm;">
								<div class="styLNLeftNumBox" style="padding-left:1mm;">41</div>
								<div style="width:141mm;padding-top:0.5mm;" class="styLnDesc">
									<span style="float:left;clear:none;">
										<span class="styBoldText">Total income or (loss).</span> Combine lines 26, 32, 37, 39, and 40. Enter the result here and on Schedule 1 
                                    <span style="float:left;">(Form 1040),  line 17, or Form 1040NR, line 18
                                          <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										</span>
										<span class="styDotLn" style="clear:none;padding-right:1mm;float:right;">.................</span>
									</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom:0px;">
                                 41
                            </div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:4.8mm;padding-right:1mm;border-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalSuppIncomeOrLossAmt"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleETotalSuppIncomeOrLossAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- end line 41 -->
						<!-- line 42 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;">42</div>
							<div style="width:99mm;float:left;clear:none;padding-top:0.5mm;">
								<span class="styBoldText">Reconciliation of farming and fishing income.</span> Enter your <span class="styBoldText">gross  </span> farming
                           and fishing income reported on Form 4835, line 7; Schedule K-1 (Form
                           1065), box 14, code B; Schedule K-1 (Form 1120S), box 17, code AC; and
                           Schedule
                           <span style="float:left;">K-1 (Form 1041), line 14, code F (see instructions)</span>
								<span class="styDotLn" style="clear:none;padding-right:1mm;float:right;">.......</span>
							</div>
							<div class="styShadingCell" style="height:8mm;width:41.95mm;border-top-width:1px;border-bottom-width:1px;">
                        </div>
							<div class="styShadingCell" style="height:8mm;width:38mm;border-top-width:1px;">
                        </div>
							<div class="styLNRightNumBox" style="width:6mm;height:5mm;">
                           42
                           </div>
							<div class="styLNAmountBox" style="width:35.95mm;padding-right:0mm;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FarmingAndFishingIncomeAmt"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleEFarmingAndFishingIncomeAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:5mm;width:38mm;">
                        </div>
						</div>
						<!-- end line 42 -->
						<!-- line 43 -->
						<div class="styBB" style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;">43</div>
							<div style="width:99mm;float:left;padding-top:0.5mm;" class="styLnDesc">
								<span class="styBoldText">Reconciliation for real estate professionals. </span>  If you were a real estate<br/>
                           professional (see instructions), enter the net income or (loss) you reported<br/>
                           anywhere on Form 1040 or Form 1040NR from all rental real estate<br/>
                           activities in which you materially participated under the passive activity<br/>
								<span style="float:left;"> loss rules</span>
								<span class="styDotLn" style="padding-right:1mm;float:right;clear:none;">..................</span>
							</div>
							<!-- Shading boxes -->
							<div class="styShadingCell" style="height:13mm;width:41.95mm;border-top-width:0px;border-bottom-width:1px;float:left;"/>
							<div class="styShadingCell" style="height:13mm;width:38mm;border-top-width:0px;float:left;"/>
							<div class="styLNRightNumBox" style="width:6mm;border-bottom-width:0px;height:5mm;">43
						</div>
							<div class="styLNAmountBox" style="width:35.95mm;height:5mm;padding-right:0mm;border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RecnclForREProfessionalsAmt"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleERecnclForREProfessionalsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:38mm;height:5mm;float:left"/>
						</div>
						<!-- end line 43 -->
						<!-- last footer -->
						<div class="pageEnd" style="height:6mm;width:187mm;">
							<span class="stySmallText" style="width:141mm;text-align:center;padding-top:1mm;">
								<span style="width:156px"/>
							</span>
							<div class="stySmallText" style="width:46mm;text-align:right;">
								<span class="styBoldText" style="font-weight:bold;font-size:7pt">Schedule E (Form 1040) 2018</span>
							</div>
						</div>
					</div>
					<!-- end page 2 footer -->
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
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part I, Line 1, <xsl:number format="A" value="position()"/> - Other Property Type Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="OtherPropertyTypeDescTxt"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</xsl:for-each>-->
						<tr>
							<td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I, Line - 26 - Total income or loss Literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityLiteralCd"/>
									<xsl:with-param name="BackupName">$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityLiteralCd</xsl:with-param>
								</xsl:call-template>
							</td>
							<td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part I, Line - 26 - Total income or loss amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityAmt"/>
									<xsl:with-param name="BackupName">$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityAmt</xsl:with-param>
								</xsl:call-template>
							</td>
							<td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III, Line - 37 - Schedule K1 ES Payment Literal</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsLiteralCd"/>
									<xsl:with-param name="BackupName">$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsLiteralCd</xsl:with-param>
								</xsl:call-template>
							</td>
							<td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part III, Line - 37 - Schedule K1 ES Payment Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsAmt"/>
									<xsl:with-param name="BackupName">$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsAmt</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<p class="pageEnd"/>
					<!-- Begin Separated Repeating data table for PropertyRealEstAndRoyaltyGroup -->
					<xsl:if test="($Print = $Separated) and (count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3)">
						<span class="styRepeatingDataTitle">Form 1040 Schedule E, Part I, Lines 1 and 2 - Income or Loss From Rental Real Estate and Royalities</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:8mm;">
										<span style="width:0px;"/>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:104mm;">
                                       Physical address of each property (street, city, state, and ZIP code)
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:32mm;">
                                      Type of Property<br/>(from list below)
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:15mm;">
                                      Fair Rental<br/>Days
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:15mm;">
                                      Personal<br/>Use Days
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:9mm;">
                                     QJV
                                   </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup">
									<tr style="height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:8mm;text-align:center;font-weight:bold;">
											<xsl:number format="A" value="position()"/>
										</td>
										<td class="styTableCellText" style="width:104mm;">
											<xsl:choose>
												<xsl:when test="PropertyForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="PropertyForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="PropertyUSAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellText" style="width:32mm;">
											<xsl:if test="PropertyDesc">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</xsl:if>
											<span style="width:2mm"></span>
											<xsl:if test="OtherPropertyTypeDesc">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OtherPropertyTypeDesc"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FairRentalDaysCnt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonalUseDaysCnt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:9mm;text-align:center;">
											<input class="styCkbox" alt="QualifiedJointVenture" type="checkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="QualifiedJointVentureInd"/>
													<xsl:with-param name="BackupName">IRS1040SchEPropertyRealEstAndRoyaltyGroup<xsl:number value="position()"/>QJVIndSep</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table -->
					<!-- Begin Separated Repeating data table -->
					<xsl:if test="($Print = $Separated) and (count($FormData/PartnershipOrSCorpGroup) &gt; 4)">
						<span class="styRepeatingDataTitle">Form 1040 Schedule E, Part II , Line 28 - Income or Loss From Partnership and S Corporations'</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:3.5mm;">
										<span style="width:0px;"/>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:86.2mm;">
										<span style="font-weight:bold;">(a)</span>
                              Name
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:19.7mm;">
										<span style="font-weight:bold;">(b)</span>
                              Enter P for
                              partnership; S
                              for S corporation
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:17.5mm;">
										<span style="font-weight:bold;">(c)</span>
										  Check if
										  foreign
										  partnership
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:32.5mm;">
										<span>
											<span style="font-weight:bold;float:left;">(d)</span>
											<span>Employer</span>
											<span> identification number</span>
										</span>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:17.5mm;">
										<span style="font-weight:bold;">(e)</span>
										  Check if
										  basis
										  computation is required
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23.2mm;">
										<span style="font-weight:bold;">(f)</span>
                              Check if
                              any amount is
                              not at risk
                           </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/PartnershipOrSCorpGroup">
									<tr style="height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:3.5mm;text-align:left">
											<span style="width:4mm;font-weight:bold;" class="styGenericDiv">
												<span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
													<xsl:call-template name="AlphaPosition">
														<xsl:with-param name="Position" select="position()"/>
													</xsl:call-template>
												</span>
											</span>
										</td>
										<td class="styDepTblCell" style="text-align:left;width:86.2mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnershipOrSCorporationNm"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpName</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnershipOrSCorpNameCd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpNameCd</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;width:19.7mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnershipSCorpCd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipSCorpCd</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;width:17.5mm;">
											<!-- Checkbox -->
											<input type="Checkbox" alt="ForeignPartnership" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ForeignPartnershipInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupForeignPartnershipInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styDepTblCell" style="text-align:center;width:32.5mm;">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="PartnershipOrSCorpEIN"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpEIN</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;width:23.2mm;">
												<!-- Checkbox -->
												<input type="Checkbox" alt="BasisComputationRequired" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="BasisComputationRequiredInd"/>
														<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupBasisComputationRequiredInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
										<td class="styDepTblCell" style="text-align:center;width:23.2mm;">
											<!-- Checkbox -->
											<input type="Checkbox" alt="AnyAmountIsNotAtRisk" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AnyAmountIsNotAtRiskInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data tableForm 1040 Schedule E, Part III, Line 33 - Passive Income and Loss/Nonpassive Income and Loss        -->
					<!-- Begin Separated Repeating data table -->
					<xsl:if test="($Print = $Separated) and (count($FormData/PartnershipOrSCorpGroup) &gt; 4)">
						<span class="styRepeatingDataTitle">Form 1040 Schedule E, Part II, Line 28 -Passive Income and Loss/Nonpassive Income and Loss</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:3.4mm;">
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:41.9mm;">
										<span style="font-weight:bold;">(g)</span>
                              Passive loss allowed<br/>
										<span style="font-weight:normal">(attach Form 8582 if required)</span>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:40mm;">
										<span style="font-weight:bold;">(h)</span>
                              Passive income
                              from Schedule K-1
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:35.9mm;">
										<span style="font-weight:bold;">(i)</span>
                              Nonpassive loss
                              from Schedule K-1
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:30.9mm;">
										<span style="font-weight:bold;">(j)</span>
                              Section 179 expense
                              deduction from Form 4562
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:35.9mm;">
										<span style="font-weight:bold;">(k)</span>
                              Nonpassive income
                              from Schedule K-1
                           </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/PartnershipOrSCorpGroup">
									<tr style="height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:3.4mm;text-align:left;">
											<span style="width:4mm;font-weight:bold;" class="styGenericDiv">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="position()"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styDepTblCell" style="width:35mm;text-align:right;">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="PassiveLossAllowedAmt"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PassiveLossAllowedAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPassiveLossAllowedAmt</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:40mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BusinessPassiveIncomeAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupBusinessPassiveIncomeAmt</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:35.9mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NonpassiveLossAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupNonpassiveLossAmt</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:30.9mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section179ExpenseDeductionAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupSect179ExpenseDeductionAmt</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:35.9mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NonpassiveIncomeAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupNonpassiveIncomeAmt</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table -->
					<!-- Begin Separated Repeating data table -->
					<xsl:if test="($Print = $Separated) and (count($FormData/EstateAndTrustGroup) &gt; 3)">
						<span class="styRepeatingDataTitle">Form 1040 Schedule E, Part III, Line 33 - Income or Loss From Estates and Trusts</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:3.5mm;">
										<span style="width:0px;"/>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:139.7mm;">
										<span style="font-weight:bold;">(a)</span>
                              Name
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:39.4mm;">
										<span style="font-weight:bold;">(b)</span>
										<span>Employer</span>
										<span> identification number</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/EstateAndTrustGroup">
									<tr style="height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:3.5mm;">
											<span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
												<xsl:call-template name="AlphaPosition">
													<xsl:with-param name="Position" select="position()"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styDepTblCell" style="width:139.7mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EstateOrTrustName/BusinessNameLine1Txt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustName</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EstateOrTrustName/BusinessNameLine2Txt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustName</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;width:39.4mm;">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EstateOrTrustEIN"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustEIN</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table -->
					<!-- Begin Separated Repeating data table -->
					<xsl:if test="($Print = $Separated) and (count($FormData/EstateAndTrustGroup) &gt; 3)">
						<span class="styRepeatingDataTitle">Form 1040 Schedule E, Part III, Line 33 - Passive Income and Loss/Nonpassive Income and Loss</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:3.5mm;">
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:52.3mm;">
										<span style="font-weight:bold;">(c)</span>
                              Passive deduction or loss allowed
                              (attach Form 8582 if required)
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:46.7mm;">
										<span style="font-weight:bold;">(d)</span>
                              Passive income
                              from Schedule K-1
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:39.1mm;">
										<span style="font-weight:bold;">(e)</span>
                              Deduction or loss
                              from Schedule K-1
                           </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:42.5mm;">
										<span style="font-weight:bold;">(f)</span>
                              Other income from
                              Schedule K-1
                           </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/EstateAndTrustGroup">
									<tr style="height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:3.5mm;">
											<xsl:call-template name="AlphaPosition">
												<xsl:with-param name="Position" select="position()"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:52.3mm;text-align:right;">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="PassiveDedOrLossAllowedAmt"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PassiveDedOrLossAllowedAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupPassiveDedOrLossAllowedAmt</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:46.7mm;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EstateAndTrustPassiveIncomeAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateAndTrustPassiveIncomeAmt</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:39.1mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeductionOrLossAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupDeductionOrLossAmt</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:42.5mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherIncomeAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupOtherIncomeAmt</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table -->
					<!-- Begin Separated Repeating data table -->
					<xsl:if test="($Print = $Separated) and (count($FormData/REMICGroup) &gt; 4)">
						<span class="styRepeatingDataTitle">Form 1040 Schedule E, Part IV, Line 38 - Income or Loss From Real Estate Mortgage Investment Conduits (REMICs) - Residual Holder</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:86.2mm;">
										<span style="font-weight:bold;">(a)</span>
                                             Name
                                   </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:19.7mm;">
										<span style="font-weight:bold;">(b)</span>
                                             Employer identification number
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:32.5mm;">
										<span style="font-weight:bold;">(c)</span>
                                             Excess inclusion from <b>Schedules Q,</b> line 2c (see instructions)
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:32.5mm;">
										<span style="font-weight:bold;">(d)</span>
                                             Taxable income (net loss) from <b>Schedules Q,</b> line 1b
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:32.2mm;">
										<span style="font-weight:bold;">(e)</span>
										 lncome from <b>Schedules Q,</b> line 3b
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/REMICGroup">
									<tr style="height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;width:65mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="REMICName/BusinessNameLine1Txt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICName</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="REMICName/BusinessNameLine2Txt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICName</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;width:19.7mm;">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="REMICEIN"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICEIN</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:right;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExcessInclusionAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupExcessInclusionAmt</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:right;width:32.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxableIncomeOrNetLossAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupTaxableIncomeOrNetLossAmt</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:right;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="REMICIncomeAmt"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICIncomeAmt</xsl:with-param>
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
	<xsl:template name="AddPositionNumber">
		<span class="styBoldText">
			<xsl:number value="position()" format="A"/>
		</span>
	</xsl:template>
	<xsl:template name="AddPositionNumber1">
		<span class="styBoldText">
			<xsl:number value="position()+1" format="A"/>
		</span>
	</xsl:template>
	<xsl:template name="AddPositionNumber2">
		<span class="styBoldText">
			<xsl:number value="position()+2" format="A"/>
		</span>
	</xsl:template>
	<xsl:template name="AlphaPosition">
		<xsl:param name="Position"/>
		<xsl:variable name="FirstAlphaPos" select="format-number(($Position div 26), &quot;###.##&quot;) "/>
		<xsl:if test="$FirstAlphaPos &gt; 1">
			<xsl:value-of select="substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',$FirstAlphaPos,1)">
         </xsl:value-of>
			<xsl:variable name="SecondAlphaPos" select="format-number(($Position - 26), &quot;###&quot;) "/>
			<xsl:value-of select="substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',$SecondAlphaPos,1)"/>
		</xsl:if>
		<xsl:if test="$FirstAlphaPos &lt; 1.1">
			<xsl:value-of select="substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',$Position,1)"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Line18Array">
		<xsl:param name="Count"/>
		<tr>
			<!-- Column 1 -->
			<td class="styTableCell" style="width:27.9mm;height:4mm;float:left;clear:none;">
				<xsl:value-of select="position()"/>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="Amt[$Count]"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
				</xsl:call-template>
			</td>
			<!-- Column 2 -->
			<td class="styTableCell" style="width:27.9mm;height:4mm;float:left;clear:none;">
				<xsl:if test="($Count + 1) &lt; ($FormData/PropertyRealEstAndRoyaltyGroup/OtherExpenseDetail)">
					<xsl:value-of select="position() + 1"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="Amt[($Count + 1)]"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</td>
			<!-- Column 3 -->
			<td class="styTableCell" style="width:27.9mm;height:4mm;float:left;clear:none;border-right-width:0px;">
				<xsl:if test="($Count + 2) &lt; ($FormData/PropertyRealEstAndRoyaltyGroup/OtherExpenseDetail)">
					<xsl:value-of select="position() + 2"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="Amt[($Count + 2)]"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="Line18Col">
		<xsl:param name="TargetNode"/>
		<!-- Column 1, 2, or 3 -->
		<td class="styTableCell" style="width:27.9mm;height:4mm;float:left;clear:none;">
			<xsl:value-of select="position()"/>
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
			</xsl:call-template>
		</td>
	</xsl:template>
</xsl:stylesheet>
