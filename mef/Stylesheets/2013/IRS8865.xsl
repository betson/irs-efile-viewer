<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 05/27/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 08/24/2015 - Changes made for defect 43917 - Jeremy Nichols -->
<!-- 08/25/2015 - Changes made for defect 43919 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8865Style.xsl"/>
	
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>	
	
	<xsl:param name="FormData" select="$RtnDoc/IRS8865"/>
	<xsl:param name="IRS1065ScheduleD" select="$RtnDoc/IRS1065ScheduleD"/>
	
	<xsl:template match="/">
	
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="IRS Form 8865"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css"> 
                    <!-- Comment out this if statement for SEParated print leave the 2 call-template lines in-->
					<xsl:if test="not($Print) or $Print=''"> 
						<xsl:call-template name="IRS8865Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="IRS8865_LineContainer">
					<!-- Form Name -->
					<div class="IRS8865_FormNumBlock" style="height:21mm;">
						Form <span class="styFormNumber">8865</span>
						<span style="width:2px;"/>
						<br/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<span style="width:2px;"/>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Form 8865, Top Left Margin - Change Annual Accounting Period</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@changeAnnualAccountingPeriodCd"/>
							<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
						</xsl:call-template>
						<br/>
						<span style="font-size:5pt;">Department of the Treasury</span>
						<br/>
						<span style="font-size:5pt;">Internal Revenue Service</span>
					</div>
					<!-- Form Title Box -->
					<div class="IRS8865_FormTitleBlock" style="height:21mm;">
						<!-- Form Title -->
						<span class="styMainTitle" style="font-size: 11pt; line-height:100%">Return of U.S. Persons With Respect to</span><br/>
						<span class="styMainTitle" style="font-size: 11pt; line-height:100%">Certain Foreign Partnerships</span>
						<!-- Form Subtitle -->
						<br/>
						<span style="font-weight:bold">
							<img src="{$ImagePath}\8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/> Attach to your tax return.
						</span>
						<br/>
						<span style="font-weight:bold">
							<img src="{$ImagePath}\8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/> Information about Form 8865 and its separate instructions is at www.irs.gov/form8865.
						</span>
						<br/>
            Information furnished for the foreign partnership's tax year
           
            <br/>
            beginning 
                <xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/TaxYearBeginDt"/>
						</xsl:call-template>
            , and ending
            <xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/TaxYearEndDt"/>
						</xsl:call-template>
					</div>
					<!-- Tax Year Box -->
					<div class="IRS8865_FormYearBlock" style="height:21mm;">
						<!-- OMB No. -->
						<div class="IRS8865_OMB">OMB No. 1545-1668</div>
						<!-- Tax Year -->
						<div class="IRS8865_TaxYear">
							<span>20<span class="styTYColor">13</span>
							</span>
						</div>
						<div style="padding-left:4px; line-height:100%">    
              Attachment<br/>Sequence No.<span style="font-weight:bold;">118</span>
						</div>
					</div>
				</div>
				<!-- Name and Address -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_NameBox" style=" width:150mm;line-height:100%;      font-size:7pt;">Name of person filing this return<br/>
            <xsl:choose>
              <xsl:when test="normalize-space($FormData/FilerPersonNm)!=''">
				<div style="padding-top:1.5mm;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/FilerPersonNm"/>
					</xsl:call-template>
                </div>  
              </xsl:when>
              <xsl:otherwise>   
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/FilerName/BusinessNameLine1"/>
                </xsl:call-template>
                <xsl:if test="normalize-space                 ($FormData/FilerName/BusinessNameLine2)!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/FilerName/BusinessNameLine2"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose> 
					</div>
					<div class="IRS8865_EINBox" style=" width:37mm;padding-left:1mm;font-size:7pt;">
						<span style="font-weight:bold">Filer's identifying number</span><br/>
						<span style="height:4.5mm;"/>
						<span style="font-weight:normal;">
							<xsl:if test="$FormData/FilerSSN">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/FilerSSN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$FormData/FilerEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/FilerEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$FormData/MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
							<!--         <xsl:choose>
              <xsl:when test="$FormData/FilerSSN">
                      <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="$FormData/FilerSSN"/>
                  </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
                     <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$FormData/FilerEIN"/>
                  </xsl:call-template>

             </xsl:otherwise>
            </xsl:choose>      -->
						</span>
					</div>
				</div>
				<!--address and other infos -->
				<div class="IRS8865_LineContainer">
					<!-- address -->
					<div class="IRS8865_AddrBox" style="border-right-width:1px; height: 25mm;">
						<div style="font-size:6pt; padding-bottom:1mm">Filer's address (if you are not filing this form with your tax return)</div>
						<span style="width:3px;"/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
						</xsl:call-template>
						<br/>
						<span style="width:3px;"/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
						</xsl:call-template>
						<br/>
						<span style="width:3px;"/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
						</xsl:call-template>
						<br/>
						<span style="width:3px;"/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">Country</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- filer's category -->
					<div class="IRS8865_CatLine" style="padding-left:2mm;font-size:6pt; height: 13mm;">
						<span style="font-weight:bold;font-size:7pt;">A </span>
						<span style="font-size:6pt;">
              Category of filer (see <span style="font-weight:bold">Categories of Filers </span>
              in the instructions and check applicable box(es)):
            </span>
						<br/>
						<br/>
						<span style="width:20mm;padding-left:12mm;font-size:7pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CategoryOfFiler1Ind"/>
								</xsl:call-template>
								1
						   </label>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CategoryOfFiler1Ind"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="width:20mm;padding-left:12mm;font-size:7pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CategoryOfFiler2Ind"/>
								</xsl:call-template>
								2
						    </label>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CategoryOfFiler2Ind"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="width:20mm;padding-left:12mm;font-size:7pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CategoryOfFiler3Ind"/>
								</xsl:call-template>

        3

      </label>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CategoryOfFiler3Ind"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="width:20mm;padding-left:12mm;font-size:7pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CategoryOfFiler4Ind"/>
								</xsl:call-template>

        4

      </label>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CategoryOfFiler4Ind"/>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!-- filer's tax year -->
					<div class="IRS8865_YearLine" style="height: 12mm;">
						<span style="font-weight:bold">B </span>
            Filer's tax year beginning
            <span style="width:19mm;border-bottom: 1px solid black">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/FilerTaxYearBeginDt"/>
							</xsl:call-template>
						</span>
            , and ending
            <span style="width:19mm;border-bottom: 1px solid black">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/FilerTaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- Line C -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:4mm;border-bottom-width:1px;">C</div>
					<div class="IRS8865_CatLine" style="font-size:6pt;width:48mm;height:4mm;padding-top:2px;">Filer's share of liabilities: Nonrecourse $   </div>
					<div class="IRS8865_MoneyField" style="font-size:7pt;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FilerShareOfLiabNonRecourseAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_CatLine" style="font-size:6pt;width:42mm;height:4mm;padding-top:2px;">Qualified nonrecourse financing $</div>
					<div class="IRS8865_MoneyField" style="font-size:7pt;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedNonRcrsFinancingAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_CatLine" style="font-size:6pt;width:12mm;height:4mm;padding-top:2px;">Other $</div>
					<div class="IRS8865_MoneyField" style="font-size:7pt;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FilerShareOfLiabilitiesOthAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line D -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="border-bottom-width:1px;">D</div>
					<div class="IRS8865_CatLine" style="width:146mm;height:4mm;">
            If filer is a member of a consolidated group but not the parent, enter the following information about the parent:
          </div>
					<div class="IRS8865_CatLine" style="font-size:6pt;width:33mm;height:4mm;padding-top:2px;"/>
				</div>
				<!-- Name EIN line -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="border-bottom-      width:1px;height:6.5mm;"/>
					<div class="IRS8865_CatLine" style="width:147mm;height:6.5mm;                                border-right-width:1px;">
						<div style="float:left; padding-right:3mm">Name</div>
						<div style="float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ParentFilerName/BusinessNameLine1"/>
							</xsl:call-template>
							<xsl:if test="normalize-space        ($FormData/ParentFilerName/BusinessNameLine2)!=''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ParentFilerName/BusinessNameLine2"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div class="IRS8865_CatLine" style="width:32mm;height:6.5mm;padding-left:4px;">
            EIN
            <span style="width:6px;"/>
						<div>
							<!-- Start here -->
							<xsl:if test="$FormData/ParentFilerEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/ParentFilerEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$FormData/ParentFilerMissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ParentFilerMissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
				</div>
				<!-- address line -->
				<div class="IRS8865_LineContainer" style="height:10mm;vertical-align:top;">
					<div class="IRS8865_LineBottom" style="height:10mm;vertical-align:top;padding-left:8mm;">
						<div style="vertical-align:top;">Address</div>
						<div style="font-size:7pt;">
							<xsl:choose>
								<xsl:when test="normalize-space($FormData/ParentFilerUSAddress)!=''">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/ParentFilerUSAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/ParentFilerForeignAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- line E -->
				<div class="IRS8865_LineContainer">
					<div class="styBB">
						<div class="IRS8865_LineIndex">E</div>
						<div class="IRS8865_LineDescLong" style="width:170mm;border-right-width:0px;">
              Information about certain other partners (see instructions)
            </div>
						<div class="IRS8865_LineDescLong" style="width:10mm;border-right-width:0px;text-align:right;padding-right:.25mm;padding-top:1px;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/OtherPartnersInformationGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'LineETable' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
				</div>
				<!-- partner info table -->
				<div class="IRS8865_TableContainer3" name="LineETable" id="LineETable" style="border-bottom-width:0px;">
					<!-- print logic -->
					<xsl:call-template name="SetInitialState"/>
					<!-- end -->
					<table cellspacing="0" style="height:auto;width:187mm;font-size:7pt;" cellpadding="0">
						<tr>
							<th scope="col" rowspan="2" class="IRS8865_SchATabNameCol" style="height:8mm;">
								<span style="font-weight:bold;">(1) </span>Name</th>
							<th scope="col" rowspan="2" class="IRS8865_SchATabAddrCol" style="height:8mm;">
								<span style="font-weight:bold;">(2) </span>Address</th>
							<th scope="col" rowspan="2" class="IRS8865_SchATabIDCol" style="height:8mm;">
								<span style="font-weight:bold;">(3) </span>Identifying number</th>
							<th scope="col" colspan="3" style="height:4mm">
								<span style="font-weight:bold;">(4) </span>Check applicable box(es)</th>
						</tr>
						<tr>
							<th scope="col" class="IRS8865_SchATabCatCol" style="border-top-width:1px;">Category 1</th>
							<th scope="col" class="IRS8865_SchATabCatCol" style="border-top-width:1px;">Category 2</th>
							<th scope="col" class="IRS8865_SchATabCatCol" style="font-family: 'Arial Narrow'; border-right-width:0px; border-top-width:1px;">Constructive owner</th>
						</tr>
						<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
						<!-- If the print parameter is separated, but there are fewer elements than the container height (3) -->
						<xsl:if test="($Print != $Separated) or (count($FormData/OtherPartnersInformationGrp) &lt;=3) ">
							<xsl:for-each select="$FormData/OtherPartnersInformationGrp">
								<tr>
									<td class="IRS8865_SchATabNameCol" style="font-size:7pt; line-height:100%">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PartnerName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space(PartnerName/BusinessNameLine2)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnerName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="IRS8865_SchATabAddrCol" style="font-size:7pt; line-height:100%">
										<xsl:choose>
											<xsl:when test="PartnerUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="PartnerUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="PartnerForeignAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<!-- point one -->
									<td class="IRS8865_SchATabIDCol">
										<xsl:choose>
											<xsl:when test="PartnerSSN">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="PartnerSSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="PartnerMissingEINReasonCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartnerMissingEINReasonCd"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="PartnerEIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="IRS8865_SchATabCatCol">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Category1Ind"/>
										</xsl:call-template>
									</td>
									<td class="IRS8865_SchATabCatCol">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Category2Ind"/>
										</xsl:call-template>
									</td>
									<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConstructiveOwnerInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<!-- If the Separated tag is set and there are more elements than the container height -->
						<!-- PopulateAdditionalDataTableMessage will insert the message directing the user to the additional data table -->
						<!-- The blank rows will be added after that to fill the container height. Blank rows are added for both separated option and also for when the data rows are less than the total default rows.-->
						<xsl:if test="((count($FormData/OtherPartnersInformationGrp) &gt; 3) and ($Print = $Separated)) or count($FormData/OtherPartnersInformationGrp) &lt; 1">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:7pt; line-height:100%">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$FormData/OtherPartnersInformationGrp"/>
									</xsl:call-template>
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:7pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="((count($FormData/OtherPartnersInformationGrp) &gt; 3) and ($Print = $Separated)) or count($FormData/OtherPartnersInformationGrp) &lt; 2">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:7pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:7pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="((count($FormData/OtherPartnersInformationGrp) &gt; 3) and ($Print = $Separated)) or count($FormData/OtherPartnersInformationGrp) &lt; 3">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:7pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:7pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div>
				<!-- Set Initial Height of Above Table -->
				<xsl:call-template name="SetInitialDynamicTableHeight">
					<xsl:with-param name="TargetNode" select="$FormData/OtherPartnersInformationGrp"/>
					<xsl:with-param name="containerHeight" select="3"/>
					<xsl:with-param name="headerHeight" select="2"/>
					<xsl:with-param name="containerID" select=" 'LineETable' "/>
				</xsl:call-template>
				<!-- End Set Initial Height of Above Table -->
				<!--line F1 -->
				<table cellpadding="0" cellspacing="0" style="width:187mm;">
					<tbody>
						<tr>
							<td rowspan="3" style="vertical-align:top;border-bottom:1px solid black;">
								<div style="width:104mm;font-size:7pt;vertical-align:top;">
								<div style="border-bottom-width:0px;"><b>F1</b></div>
								<!-- address -->
								<div style="border-right-width:1px;border-bottom-width:0px;vertical-align:top;">
			
									   Name and address of foreign partnership
									
									   <div style="font-size:6pt;font-family:verdana;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipName/BusinessNameLine1"/>
											</xsl:call-template>
											<xsl:if test="normalize-space($FormData/ForeignPartnershipName/BusinessNameLine2)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipName/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<!--  ########################################################### -->
											<!-- <xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/AddressLine1"/>
											</xsl:call-template>
											<xsl:if test="normalize-space($FormData/ForeignPartnershipAddress/AddressLine2)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/AddressLine2"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<xsl:if test="$FormData/ForeignPartnershipAddress/City !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/City"/>
												</xsl:call-template>,
							  </xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/ProvinceOrState"/>
											</xsl:call-template>&nbsp;      
				
					  <xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/PostalCode"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/Country"/>
											</xsl:call-template>  -->
											<!--  ############################################################# -->
											<!-- Subsidiary Corporation Address -->
											<xsl:choose>
												<!-- US Address -->
												<xsl:when test="$FormData/ForeignPartnershipUSAddress">
													<xsl:if test="$FormData/ForeignPartnershipUSAddress/AddressLine1!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipUSAddress/AddressLine1"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
													<xsl:if test="$FormData/ForeignPartnershipUSAddress/AddressLine2!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipUSAddress/AddressLine2"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
													<xsl:if test="$FormData/ForeignPartnershipUSAddress/City!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipUSAddress/City"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
													<xsl:if test="$FormData/ForeignPartnershipUSAddress/State!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipUSAddress/State"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
													<xsl:if test="$FormData/ForeignPartnershipUSAddress/ZIPCode!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipUSAddress/ZIPCode"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<!-- Foreign Address -->
													<xsl:if test="$FormData/ForeignPartnershipAddress/AddressLine1!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/AddressLine1"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
													<xsl:if test="$FormData/ForeignPartnershipAddress/AddressLine2 !=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/AddressLine2"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
													<xsl:if test="$FormData/ForeignPartnershipAddress/City !=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/City"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
													<xsl:if test="$FormData/ForeignPartnershipAddress/ProvinceOrState !=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/ProvinceOrState"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
													<xsl:if test="$FormData/ForeignPartnershipAddress/Country !=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/Country"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
													<xsl:if test="$FormData/ForeignPartnershipAddress/PostalCode!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAddress/PostalCode"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
											<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
										</div>
									</div>
								</div>
							</td>
							<td style="border-bottom:1px solid black;border-left:1px solid black;">
								<!-- filer's EIN -->
								<div style="padding-left:2mm;height:9mm;font-size:7pt;">
									<span style="font-weight:bold;">2(a) </span>EIN (if any)
			
									<div style="width:100%; text-align:left">
										<xsl:choose>
											<xsl:when test="$FormData/ForeignPartnershipEIN">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipEIN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtshpMissingEINReasonCd"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="border-bottom:1px solid black;border-left:1px solid black;">
								<!-- Reference ID -->
								<div style="padding-left:2mm;height:9mm;font-size:7pt;">
									<span style="font-weight:bold;">2(b) </span>Reference ID number (see instr.)
			
									<div style="width:100%; text-align:left">
										<xsl:for-each select="$FormData/ForeignEntityIdentificationGrp">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
										  </xsl:call-template><br/>
										</xsl:for-each>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="border-bottom:1px solid black;border-left:1px solid black;">
								<!-- filer's country -->
								<div style="padding-left:2mm;height:9mm;border-bottom-width:0px;font-size:7pt;">
									<span style="font-weight:bold">3 </span> Country under whose laws organized
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/CntryUnderWhoseLawsOrganizedCd"/>
									</xsl:call-template>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				
				<!-- line F4-8 -->
				<div class="IRS8865_LineContainer">
					<table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<th scope="col" class="IRS8865_LineFTab" style="width:8mm;font-weight:bold;text-align:center;">4</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:20mm;border-right-width:1px;text-align:left;">Date of organization</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:5mm;font-weight:bold;text-align:center;">5</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:28mm;border-right-width:1px;text-align:left;">Principal place of business</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:5mm;font-weight:bold;text-align:center;">6</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:32mm;border-right-width:1px;text-align:left;">Principal business activity code number</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:5mm;font-weight:bold;text-align:center;">7</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:31mm;border-right-width:1px;text-align:left;">Principal business activity</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:5mm;font-weight:bold;text-align:center;">8a</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:30mm;border-right-width:1px;text-align:left;">Functional currency</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:5mm;font-weight:bold;text-align:center;">8b</th>
							<th scope="col" class="IRS8865_LineFTab" style="width:24mm;text-align:left;">Exchange rate (see instr.)
			</th>
						</tr>
						<tr>
							<td class="IRS8865_LineFTab" style="border-bottom-width:1px;width:8mm">
								<span style="width:3px;"/>
							</td>
							<td class="IRS8865_LineFTab" style="border-right-width:1px;border-bottom-width:1px;                      width:20mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/OrganizationFormedDt"/>
								</xsl:call-template>
							</td>
							<td class="IRS8865_LineFTab" style="border-bottom-width:1px;width:5mm">
								<span style="width:3px;"/>
							</td>
							<td class="IRS8865_LineFTab" style="border-right-width:1px;border-bottom-width:1px;width:28mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PrincipalPlaceOfBusCountryCd"/>
								</xsl:call-template>
							</td>
							<td class="IRS8865_LineFTab" style="border-bottom-width:1px;width:5mm">
								<span style="width:3px;"/>
							</td>
							<td class="IRS8865_LineFTab" style="border-right-width:1px;border-bottom-width:1px;width:28mm">
								<span class="styTableCellPad"/>
								<xsl:if test="$FormData/PrincipalBusinessActivityCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PrincipalBusinessActivityCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/InactivePrincipalBusActyCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/InactivePrincipalBusActyCd"/>
									</xsl:call-template>
								</xsl:if>
							</td>
							<td class="IRS8865_LineFTab" style="border-bottom-width:1px;width:5mm">
								<span style="width:3px;"/>
							</td>
							<td class="IRS8865_LineFTab" style="border-right-width:1px;border-bottom-width:1px;width:31mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PrincipalBusinessActivityDesc"/>
								</xsl:call-template>
							</td>
							<td class="IRS8865_LineFTab" style="border-bottom-width:1px;width:5mm">
								<span style="width:3px;"/>
							</td>
							<td class="IRS8865_LineFTab" style="border-right-width:1px;border-bottom-width:1px;                                   width:30mm">
								<!--  Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/FunctionalCurrencyDesc"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FunctionalCurrencyDesc"/>
								</xsl:call-template>
							</td>
							<td class="IRS8865_LineFTab" style="border-bottom-width:1px;width:5mm">
								<span style="width:3px;"/>
							</td>
							<td class="IRS8865_LineFTab" style="border-bottom-width:1px;text-align:left;font-size:6pt;               width:24mm">
								<span style="width:24mm; text align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ExchangeRt"/>
									</xsl:call-template>
								</span>
							</td>
						</tr>
					</table>
				</div>
				<!-- line G -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">G</div>
					<div class="IRS8865_LineDescLong" style="width:180mm;border-right-width:0px;">

   Provide the following information for the foreign partnership's tax year:

   </div>
				</div>
				<!-- line G1-4 -->
				<div class="IRS8865_LineContainer">
					<table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td class="IRS8865_LineGTab" style="width:8mm;border-top-width:1px;font-weight:bold;text-align:center;">1</td>
							<td class="IRS8865_LineGTab" style="width:88mm;border-right-width:1px;border-top-width:1px;">

      Name, address, and identifying number of agent (if any) in the United States

      </td>
							<td class="IRS8865_LineGTab" style="width:5mm;border-top-width:1px;font-weight:bold;text-align:center;">2</td>
							<td class="IRS8865_LineGTab" style="width:87mm;border-top-width:1px;">

      Check if the foreign partnership must file:<br/>
								<input type="checkbox" class="IRS8865_Checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FileForm1042Ind"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/FileForm1042Ind"/>
									</xsl:call-template>

        Form 1042

      </label>
								<span style="width:12px;"/>
								<input type="checkbox" class="IRS8865_Checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FileForm8804Ind"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/FileForm8804Ind"/>
									</xsl:call-template>

        Form 8804

      </label>
								<span style="width:12px;"/>
								<input type="checkbox" class="IRS8865_Checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FileForm1065or1065BInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/FileForm1065or1065BInd"/>
									</xsl:call-template>

        Form 1065 or 1065-B

      </label>
							</td>
						</tr>
						<tr>
							<td class="IRS8865_LineGTab" style="border-bottom-width:1px;">
								<span style="width:3px;"/>
							</td>
							<td class="IRS8865_LineGTab" style="height:10mm; border-bottom-width:1px;border-right-width:1px; font-size:7pt; line-height:100%">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/USAgentName/BusinessNameLine1"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($FormData/USAgentName/BusinessNameLine2)!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/USAgentName/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="normalize-space($FormData/USAgentAddress/AddressLine1)!=''">
									<br/>
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/USAgentAddress"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/USAgentSSN != ''">
									<br/>SSN:                  
        	    <xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/USAgentSSN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/USAgentEIN != ''">
									<br/>EIN:               
        	        <xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/USAgentEIN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/USAgentMissingEINReasonCd != ''">
									<br/>U.S. agent's missing EIN reason:               
        	        <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/USAgentMissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:if>
							</td>
							<td class="IRS8865_LineGTab" style="border-bottom-width:1px;">
								<span style="width:3px;"/>
							</td>
							<td class="IRS8865_LineGTab" style="border-bottom-width:1px;">

      Service Center where Form 1065 or 1065-B is filed:<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SCWhereForm1065or1065BFiledTxt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="IRS8865_LineGTab" style="width:8mm;font-weight:bold;text-align:center;">3</td>
							<td class="IRS8865_LineGTab" style="width:88mm;border-right-width:1px;">

      Name and address of foreign partnership's agent in country of organization, if any

      </td>
							<td class="IRS8865_LineGTab" style="width:5mm;font-weight:bold;text-align:center;">4</td>
							<td class="IRS8865_LineGTab" style="width:87mm;height:10mm;">

      Name and address of person(s) with custody of the books and records of the foreign partnership, and the location of such books and records, if different

      </td>
						</tr>
						<tr>
							<td class="IRS8865_LineGTab" style="border-bottom-width:1px;">
								<span style="width:3px;"/>
							</td>
							<td class="IRS8865_LineGTab" style="border-bottom-width:1px;border-right-width:1px;  line-height:100%">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAgentName/BusinessNameLine1"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($FormData/ForeignPartnershipAgentName/BusinessNameLine2)!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipAgentName/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<xsl:choose>
									<xsl:when test="$FormData/FrgnPartnershipAgentUSAddress">
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$FormData/FrgnPartnershipAgentUSAddress"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtshpAgentForeignAddress"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="IRS8865_LineGTab" style="border-bottom-width:1px;">
								<span style="width:3px;"/>
							</td>
							<td class="IRS8865_LineGTab" style="border-bottom-width:1px;  line-height:100%">
								<!-- Tanuja In reference todefect # 2393 -->
								<span style="width:45mm;float:left;clear:none;">
                  <xsl:choose>
                    <xsl:when test="normalize-space($RtnDoc/IndividualWithBooksNm)!=''">  
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$RtnDoc/IndividualWithBooksNm"/>
                      </xsl:call-template>  
                    </xsl:when>
                    <xsl:otherwise>  
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PersonsWithBooksName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <xsl:if test="normalize-space($FormData/PersonsWithBooksName/BusinessNameLine2)!=''">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormData/PersonsWithBooksName/BusinessNameLine2"/>
                        </xsl:call-template>
                      </xsl:if>
                      <br/>
                    </xsl:otherwise>
                  </xsl:choose> 
									<!-- Tanuja:  Earlier Contained only US Address part added the foreign address as the schema has it -->
									<xsl:choose>
										<xsl:when test="$FormData/PersonsWithBooksUSAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/PersonsWithBooksUSAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/PersonsWithBooksForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
								<xsl:if test="$FormData/LocationOfBooksUSAddress or $FormData/LocationOfBooksForeignAddress">
									<span style="width:40mm;float:left;clear:none;">
										<xsl:choose>
											<xsl:when test="$FormData/LocationOfBooksUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/LocationOfBooksUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/LocationOfBooksForeignAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</xsl:if>
							</td>
						</tr>
					</table>
				</div>
				<!-- line 5 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="text-align:center;">5</div>
					<div class="IRS8865_LineDescLong" style="width:148mm;border-right-width:0px;">Were any special allocations made by the foreign partnership? 

          <span class="IRS8865_DotSpacing">.......................</span>
					</div>
					<div class="IRS8865_LineIndex">
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_LineDescLong" style="width:12mm;border-right-width:0px;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/SpclAllocnMadeByFrgnPrtshpInd"/>
							</xsl:call-template>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SpclAllocnMadeByFrgnPrtshpInd"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;">
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/SpclAllocnMadeByFrgnPrtshpInd"/>
								</xsl:call-template>
        Yes
      </label>
						</span>
					</div>
					<div class="IRS8865_LineDescLong" style="width:12mm;border-right-width:0px;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/SpclAllocnMadeByFrgnPrtshpInd"/>
							</xsl:call-template>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SpclAllocnMadeByFrgnPrtshpInd"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;">
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/SpclAllocnMadeByFrgnPrtshpInd"/>
								</xsl:call-template>
        No
      </label>
						</span>
					</div>
				</div>
				<!-- line 6 -->
				<div class="IRS8865_LineContainer" style="height:7mm;">
					<div class="IRS8865_LineIndex" style="height:7mm;text-align:center;">6</div>
					<div class="IRS8865_LineDescLong" style="height:7mm;width:148mm;border-right-width:0px;">
             Enter the number of Forms 8858, Information Return of U.S. Persons With Respect To Foreign Disregarded Entities,
attached to this return (see instructions) 
<!--
            <span style="width:3px;"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/NumOfFrgnDisregardedEntOwned"/>
            </xsl:call-template>
            -->
						<span class="IRS8865_DotSpacing">................................</span>
					</div>
					<div class="IRS8865_LineIndex" style="height:7mm;">
						<br/>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="height:7mm;width:24mm;border-style:solid;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnDisregardedEntitiesOwnNum"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 7 -->
				<div class="IRS8865_LineContainer" style="height:auto;">
					<div class="IRS8865_LineIndex" style="text-align:center;">7</div>
					<div class="IRS8865_LineDescLong" style="width:120mm;border-right-width:0px;">
            How is this partnership classified under the law of the country in which it is organized?
          <span class="IRS8865_DotSpacing">..</span>
					</div>
					<div class="IRS8865_LineIndex" style="width:7mm;">
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="height:auto;width:52mm;border-style:solid;text-align:left;font-size:7pt;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/PrtshpClsfUnderLawOfCountryTxt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 8a -->
				<div class="IRS8865_LineContainer" style="height:11mm;">
					<div class="IRS8865_LineIndex" style="height:11mm;">8a</div>
					<div class="IRS8865_LineDescLong" style="height:11mm;width:149mm;border-right-width:0px;">Does the filer have an interest in the foreign partnership, 
						or an interest indirectly through the foreign partnership, that is a separate unit under Reg. 1.1503(d)-1(b)(4) or part of a combined separate 
						unit under Reg. 1.1503(d)-1(b)(4)(ii)? If &quot;No,&quot; skip question 8b.
						<span style="width:1px;"/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtshpInterestSepUnitInd"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">......................................</span>
					</div>
					<div class="IRS8865_LineIndex" style="height:11mm;width:7mm; padding-top:6.5mm;">
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_LineDescLong" style="height:11mm;padding-top:5.5mm;width:12mm;border-right-width:0px;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtshpInterestSepUnitInd"/>
							</xsl:call-template>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtshpInterestSepUnitInd"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;">
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtshpInterestSepUnitInd"/>
								</xsl:call-template>
								Yes
							  </label>
						</span>
					</div>
					<div class="IRS8865_LineDescLong" style="width:12mm;border-right-width:0px; padding-top:5.5mm;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtshpInterestSepUnitInd"/>
							</xsl:call-template>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtshpInterestSepUnitInd"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;">
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtshpInterestSepUnitInd"/>
								</xsl:call-template>
							  No
							</label>
						</span>
					</div>
				</div>
				<!-- line 8b -->
				<div class="IRS8865_LineContainer" style="height:8mm;">
					<div class="IRS8865_LineIndex" style="height:8mm;">b</div>
					<div class="IRS8865_LineDescLong" style="height:8mm;width:149mm;border-right-width:0px;">If  &quot;Yes,&quot; does the separate unit or combined separate unit have a dual consolidated loss as defined in Reg. 1.1503(d)-1(b)(5)(ii)?
						<span style="width:1px;"/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/SepCombSepDualCnsldtLossInd"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">............................................</span>
					</div>
					<div class="IRS8865_LineIndex" style="height:8mm;width:7mm; padding-top:3.5mm;">
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_LineDescLong" style="height:8mm;padding-top:3.5mm;width:12mm;border-right-width:0px;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/SepCombSepDualCnsldtLossInd"/>
							</xsl:call-template>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SepCombSepDualCnsldtLossInd"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;">
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/SepCombSepDualCnsldtLossInd"/>
								</xsl:call-template>
								Yes
							  </label>
						</span>
					</div>
					<div class="IRS8865_LineDescLong" style="width:12mm;border-right-width:0px; padding-top:3.5mm;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/SepCombSepDualCnsldtLossInd"/>
							</xsl:call-template>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SepCombSepDualCnsldtLossInd"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;">
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/SepCombSepDualCnsldtLossInd"/>
								</xsl:call-template>
							  No
							</label>
						</span>
					</div>
				</div>
				<!-- line 9 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="text-align:center;">9</div>
					<div class="IRS8865_LineDescLong" style="width:180mm;border-right-width:0px;">

       Does this partnership meet <span style="font-weight:bold">both</span> of the following requirements? 

      </div>
				</div>
				<!-- parences -->
				<div class="IRS8865_LineContainer">
					<span style="z-index:1;position:absolute;width:135mm;text-align:right;">
						<img src="{$ImagePath}/8865_Bracket.gif" alt="right-pointing curly bracket image"/>
					</span>
				</div>
				<!-- line 9 sub 1 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex"/>
					<div class="IRS8865_LineDescLong" style="width:148mm;border-right-width:0px;">
						<img src="{$ImagePath}/8865_Bullet_Round.gif" width="5" height="5" alt="round bullet image" border="0"/>

      The partnership's total receipts for the tax year were less than $250,000 and

   </div>
				</div>
				<!-- line 9 sub 2 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex"/>
					<div class="IRS8865_LineDescLong" style="width:149mm;border-right-width:0px;">
						<img src="{$ImagePath}/8865_Bullet_Round.gif" width="5" height="5" alt="round bullet image" border="0"/>

       The value of the partnership's total assets at the end of the tax year was less than $1 million. 
       <span class="IRS8865_DotSpacing" style="padding-left:40px;">....</span>
					</div>
					<div class="IRS8865_LineIndex" style="width:7mm;">
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" width="6" height="7" alt="right pointing bullet image" border="0"/>
					</div>
					<div class="IRS8865_LineDescLong" style="width:12mm;border-right-width:0px;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/TotalRcptsAssetsLessThanLmtInd"/>
							</xsl:call-template>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TotalRcptsAssetsLessThanLmtInd"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;">
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/TotalRcptsAssetsLessThanLmtInd"/>
								</xsl:call-template>
                Yes
              </label>
						</span>
					</div>
					<div class="IRS8865_LineDescLong" style="width:12mm;border-right-width:0px;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/TotalRcptsAssetsLessThanLmtInd"/>
							</xsl:call-template>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TotalRcptsAssetsLessThanLmtInd"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;">
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/TotalRcptsAssetsLessThanLmtInd"/>
								</xsl:call-template>
        No
      </label>
						</span>
					</div>
				</div>
				<!-- line 9 sub 3 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex"/>
					<div class="IRS8865_LineDescLong" style="width:180mm;border-right-width:0px;">

       If "Yes," <span style="font-weight:bold">do not</span> complete Schedules L, M-1, and M-2. 

      </div>
				</div>
				<!-- BEGIN SIGNATURE SECTION -->
				<!-- Implement the signature section as table -->
				<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;clear:both;border-top:1px solid black;">
					<tr>
						<td rowspan="3" style="width:19mm;font-size:6pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">Sign Here Only If You Are Filing This Form Separately and Not With Your Tax Return
</td>
						<td colspan="5" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my
knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than general partner or limited liability company member) is
based on all information of which preparer has any knowledge. </td>
					</tr>
					<tr>
						<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
							<img src="{$ImagePath}/8865_Bullet_Lg.gif" alt="Big Right Arrow" border="0"/>
						</td>
						<td style="width:83mm;border-bottom:1px solid black;vertical-align:bottom;">
							<xsl:call-template name="PopulateReturnHeaderOfficer">
								<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
							</xsl:call-template>
							<span style="width:1px;"/>
						</td>
						<td style="border-right:1px solid black;width:3mm;">
							<span style="width:2px;"/>
						</td>
						<td rowspan="2" style="border-bottom:1px solid black;padding-left:3mm;">
							<img src="{$ImagePath}/8865_Bullet_Lg.gif" alt="Big Right Arrow" border="0"/>
						</td>
						<td style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;">
							<xsl:call-template name="PopulateReturnHeaderOfficer">
								<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black;vertical-align:top;">Signature of general partner or limited liability company member</td>
						<td style="border-bottom:1px solid black;vertical-align:top;border-right:1px solid black;">
							<span style="width:2px;"/>
						</td>
						<td style="border-bottom:1px solid black;vertical-align:top;">Date</td>
					</tr>
				</table>
				<!-- END OFFICER SIGNATURE -->
				<!-- BEGIN PREPARER SIGNATURE SECTION -->
		  <!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
						<div style="width:22.75mm;padding-top:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:10pt;">Paid</span><br/>
							<span class="styMainTitle" style="font-size:10pt;">Preparer</span><br/>
							<span class="styMainTitle" style="font-size:10pt;">Use Only</span>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;border-leftright:1px;">
								<div class="styLNDesc" style="height:8mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
								  Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:8mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:8mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPreparationDt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:8mm;width:18mm;border-right:1px solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployedInd</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployedInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4.5px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:8mm;width:26mm;padding-top:0mm;padding-left:1mm;">PTIN
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
								<div class="styLNDesc" style="height:6mm;width:126.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmNameBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmNameBusinessName2</xsl:with-param>
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
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="height:9mm;width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="height:9mm;width:126.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">State</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignPostalCode</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="height:9mm;width:32mm;padding-left:1mm;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPhoneNum</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpForeignPhoneNum</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
		  <!-- Implementing the Preparer section in table -->
		  
		  <!-- END PREPARER SIGNATURE SECTION -->
				<!-- Page Break and Footer-->
				<div class="pageEnd" style="width:187mm;padding-top:1mm;">
					<div style="float:left;">
						<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="width:13mm;"/>                        
      Cat. No. 25852A
    </div>
					<div style="float:right;">
						<span style="width:30px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">8865</span> (2013)
    </div>
				</div>
				<!-- END Page Break and Footer-->
				<!--Begin Page 2 -->
				<!-- Page Header -->
				<div style="width:187mm;padding-top:.5mm;">
					<div style="float:left;">Form 8865 (2013)<span style="width:148mm;"/>
					</div>
					<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
					</div>
				</div>
				<!-- END Page Header -->
				<!-- Schedule A -->
				<div class="IRS8865_LineContainer">
					<div class="styBB">
						<div class="IRS8865_PartIndex" style="width: 21mm;">Schedule A</div>
						<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;height:17mm;width:167mm;">
							<span style="font-weight:bold;">
         Constructive Ownership of Partnership Interest.
         </span>
           Check the boxes that apply to the filer. If you check box <span style="font-weight:bold;">b</span>, enter the name, address, and U.S. taxpayer identifying number (if any) of the person(s) whose interest you constructively own. See instructions.
      <br/>
							<span style="width:93mm;padding-left:10px;padding-top:5px;font-size:7pt;">
								<span style="font-weight:bold;">a </span>
								<input type="checkbox" class="IRS8865_Checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA/OwnsDirectInterestInd"/>
									</xsl:call-template>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA/OwnsDirectInterestInd"/>
										</xsl:call-template>
        Owns a direct interest
      </label>
								</input>
							</span>
							<span style="width:59mm;padding-left:10px;padding-top:5px;font-size:7pt;">
								<span style="font-weight:bold;">b </span>
								<input type="checkbox" class="IRS8865_Checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA/OwnsConstructiveInterestInd"/>
									</xsl:call-template>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA/OwnsConstructiveInterestInd"/>
										</xsl:call-template>
        Owns a constructive interest
      </label>
								</input>
							</span>
							<span style="width:13mm;text-align:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="containerID" select=" 'SchATable' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</span>
						</div>
					</div>
				</div>
				<!-- SchA info table -->
				<div class="IRS8865_TableContainer4" name="SchATable" id="SchATable" style="height:auto;width:187mm;border-bottom-width:0px;">
					<!-- print logic -->
					<xsl:call-template name="SetInitialState"/>
					<!-- end -->
					<table cellspacing="0" style="height:auto;width:187mm;font-size:7pt;border-bottom-width:0px;">
						<tr>
							<th scope="col" class="IRS8865_SchATabNameCol">Name</th>
							<th scope="col" class="IRS8865_SchATabAddrCol">Address</th>
							<th scope="col" class="IRS8865_SchATabIDCol">Identifying number (if any)</th>
							<th scope="col" class="IRS8865_SchATabCatCol">Check if foreign person</th>
							<th scope="col" class="IRS8865_SchATabCatCol" style="border-right-width:0px;">Check if direct partner</th>
						</tr>
						<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
						<!-- If the print parameter is separated, but there are fewer elements than the container height (5) -->
						<xsl:if test="($Print != $Separated) or (count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &lt;=5) ">
							<xsl:for-each select="$FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp">
								<tr>
									<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
                    <xsl:choose>
                      <xsl:when test="normalize-space(ConstructiveOwnerPersonNm)!=''">  
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ConstructiveOwnerPersonNm"/>
                        </xsl:call-template>  
                      </xsl:when>
                      <xsl:otherwise>   
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ConstructiveOwnerName/BusinessNameLine1"/>
                        </xsl:call-template>
                        <xsl:if test="normalize-space(ConstructiveOwnerName/BusinessNameLine2)!=''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ConstructiveOwnerName/BusinessNameLine2"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:otherwise>
                    </xsl:choose> 	
									</td>
									<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
										<xsl:choose>
											<xsl:when test="ConstructiveOwnerUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="ConstructiveOwnerUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="ConstructiveOwnerFrgnAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<!-- Point 2 -->
									<td class="IRS8865_SchATabIDCol">
										<xsl:if test="ConstructiveOwnerSSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="ConstructiveOwnerSSN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="ConstructiveOwnerEIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="ConstructiveOwnerEIN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="IRS8865_SchATabCatCol">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConstructiveOwnerIsFrgnPrsnInd"/>
										</xsl:call-template>
									</td>
									<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConstructiveOwnerIsDrtPrtnrInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<!-- If the Separated tag is set and there are more elements than the container height -->
						<!-- PopulateAdditionalDataTableMessage will insert the message directing the user to the additional data table -->
						<!-- Blank rows will be added after that to fill the container height -->
						<xsl:if test="(count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &lt; 1">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp"/>
									</xsl:call-template>
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &lt; 2">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &lt; 3">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &lt; 4">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &lt; 5">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div>
				<!-- Set Initial Height of Above Table -->
				<xsl:call-template name="SetInitialDynamicTableHeight">
					<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp"/>
					<xsl:with-param name="containerHeight" select="5"/>
					<xsl:with-param name="containerID" select=" 'SchATable' "/>
				</xsl:call-template>
				<!-- End Set Initial Height of Above Table -->
				<!-- Schedule A-1-->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_PartIndex" style="border-top-width:0px;border-bottom-width:1px;height:4.25mm;">Schedule A-1</div>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;height:4.25mm;padding-left:4px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;width:153mm;">
						<span style="font-weight:bold;">
						 Certain Partners of Foreign Partnership
					   </span>
					   (see instructions)
				    </div>
					<div class="IRS8865_LineDescLong" style="border-right-width:0px;border-top-width:0px;border-bottom-width:1px;height:4.25mm;width:9mm;text-align:right;">
						<!-- button display logic -->
						<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="containerID" select=" 'SchA1Table' "/>
						</xsl:call-template>
						<!-- end button display logic -->
					</div>
				</div>
				<!-- SchA-1 info table -->
				<div class="IRS8865_TableContainer3" name="SchA1Table" id="SchA1Table" style="border-bottom-width:0px;">
					<xsl:call-template name="SetInitialState"/>
					<table cellspacing="0" style="height:auto;width:183mm;font-size:7pt;border-bottom-width:0px;">
						<tr>
							<th scope="col" class="IRS8865_SchATabNameCol">Name</th>
							<th scope="col" class="IRS8865_SchATabAddrCol">Address</th>
							<th scope="col" class="IRS8865_SchA1TabIDCol">Identifying number (if any)</th>
							<th scope="col" class="IRS8865_SchATabCatCol" style="border-right-width:0px;">Check if foreign person</th>
						</tr>
						<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
						<!-- If the print parameter is separated, but there are fewer elements than the container height (5) -->
						<xsl:if test="($Print != $Separated) or (count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &lt;=5) ">
							<xsl:for-each select="$FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp">
								<tr>
									<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
										<xsl:choose>
										  <xsl:when test="normalize-space(CertainPartnerPersonNm)!=''">  
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="CertainPartnerPersonNm"/>
											</xsl:call-template>  
										  </xsl:when>
										  <xsl:otherwise>   
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="CertainPartnerName/BusinessNameLine1"/>
											</xsl:call-template>
											<xsl:if test="normalize-space(CertainPartnerName/BusinessNameLine2)!=''">
											  <br/>
											  <xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CertainPartnerName/BusinessNameLine2"/>
											  </xsl:call-template>
											</xsl:if>
										  </xsl:otherwise>
										</xsl:choose> 										
									</td>
									<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
										<xsl:choose>
											<xsl:when test="CertainPartnerUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="CertainPartnerUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="CertainPartnerForeignAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<!-- point 3 -->
									<td class="IRS8865_SchA1TabIDCol">
										<xsl:if test="CertainPartnerSSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="CertainPartnerSSN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="CertainPartnerEIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="CertainPartnerEIN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CertainPartnerIsForeignPrsnInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<!-- If the Separated tag is set and there are more elements than the container height -->
						<!-- PopulateAdditionalDataTableMessage will insert the message directing the user to the additional data table -->
						<!-- Blank rows will be added after that to fill the container height -->
						<xsl:if test="(count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &lt; 1">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp"/>
									</xsl:call-template>
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA1TabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &lt; 2">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA1TabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &lt; 3">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA1TabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &lt; 4">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA1TabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &lt; 5">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA1TabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div>
				<!-- Set Initial Height of Above Table -->
				<xsl:call-template name="SetInitialDynamicTableHeight">
					<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp"/>
					<xsl:with-param name="containerHeight" select="5"/>
					<xsl:with-param name="containerID" select=" 'SchA1Table' "/>
				</xsl:call-template>
				<!-- End Set Initial Height of Above Table -->
				<!-- table schedule A-1 foot note -->
				<div class="IRS8865_LineContainer" style="border-top-width:0px;">
					<div class="IRS8865_LineDescLong" style="height:4.5mm;width:156mm;padding-top:1mm;border-right-width:0px;border-top-width:0px;">Does the partnership have any other foreign person as a direct partner? 

          <span class="IRS8865_DotSpacing">......................</span>
					</div>
					<div class="IRS8865_LineIndex" style="padding-top:1mm;">
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" width="4" height="7" alt="right pointing bullet image" border="0"/>
					</div>
					<div class="IRS8865_LineDescLong" style="width:12mm;border-right-width:0px;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA1/HaveOtherForeignDirectPrtnrInd"/>
							</xsl:call-template>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA1/HaveOtherForeignDirectPrtnrInd"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;">
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA1/HaveOtherForeignDirectPrtnrInd"/>
								</xsl:call-template>
            Yes
          </label>
						</span>
					</div>
					<div class="IRS8865_LineDescLong" style="width:12mm;border-right-width:0px;">
						<!--span style="width:24px;"></span-->
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA1/HaveOtherForeignDirectPrtnrInd"/>
							</xsl:call-template>
							<input type="checkbox" class="IRS8865_Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA1/HaveOtherForeignDirectPrtnrInd"/>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;">
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA1/HaveOtherForeignDirectPrtnrInd"/>
								</xsl:call-template>
        No
      </label>
						</span>
					</div>
				</div>
				<!-- Schedule A-2 header-->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_PartIndex">Schedule A-2</div>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;width:163mm;">
						<span style="font-weight:bold;">
         Affiliation Schedule.
       </span>
           List all partnerships (foreign or domestic) in which the foreign partnership owns a 
      </div>
				</div>
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_PartIndex" style="background-color:white;border-top-width:0px;"/>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-left:4px;border-right-width:0px;width:153mm;">
    direct interest or indirectly owns a 10% interest.
  </div>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-top:2px;text-align:right;border-right-width:0px;width:34mm;">
						<!-- button display logic -->
						<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA2/AffiliationScheduleGrp"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'SchA2Table' "/>
						</xsl:call-template>
						<!-- end button display logic -->
					</div>
				</div>
				<!-- SchA-2 info table -->
				<div class="IRS8865_TableContainer3" name="SchA2Table" id="SchA2Table" style="width:187mm;border-bottom-width:0px;">
					<xsl:call-template name="SetInitialState"/>
					<table cellspacing="0" style="width:187mm;font-size:7pt;border-bottom-width:0px;border-top:1px solid black;">
						<tr>
							<th scope="col" class="IRS8865_SchATabNameCol">Name</th>
							<th scope="col" class="IRS8865_SchATabAddrCol">Address</th>
							<th scope="col" class="IRS8865_SchA2TabIDCol">EIN (if any)</th>
							<th scope="col" class="IRS8865_SchA2TabMoneyCol" style="text-align:center;">Total ordinary income or loss</th>
							<th scope="col" class="IRS8865_SchATabCatCol" style="border-right-width:0px;">Check if foreign partnership</th>
						</tr>
						<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
						<!-- If the print parameter is separated, but there are fewer elements than the container height (5) -->
						<xsl:if test="($Print != $Separated) or (count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &lt;=5) ">
							<xsl:for-each select="$FormData/IRS8865ScheduleA2/AffiliationScheduleGrp">
								<tr>
									<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space(PartnershipName/BusinessNameLine2)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
										<xsl:if test="normalize-space(PartnershipUSAddress)!=''">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="PartnershipUSAddress"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="normalize-space(PartnershipForeignAddress)!=''">
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="PartnershipForeignAddress"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="IRS8865_SchA2TabIDCol">
										<xsl:if test="PartnershipSSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="PartnershipSSN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="PartnershipEIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="PartnershipEIN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="MissingSSNEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="IRS8865_SchA2TabMoneyCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalOrdinaryIncomeOrLossAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PartnershipIsForeignPersonInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<!-- If the Separated tag is set and there are more elements than the container height -->
						<!-- PopulateAdditionalDataTableMessage will insert the message directing the user to the additional data table -->
						<!-- Blank rows will be added after that to fill the container height -->
						<xsl:if test="(count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &lt; 1">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA2/AffiliationScheduleGrp"/>
									</xsl:call-template>
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA2TabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA2TabMoneyCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &lt; 2">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA2TabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA2TabMoneyCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &lt; 3">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA2TabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA2TabMoneyCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &lt; 4">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA2TabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA2TabMoneyCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="(count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &gt; 5) and ($Print = $Separated) or count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &lt; 5">
							<tr>
								<td class="IRS8865_SchATabNameCol" style="font-size:6.5pt; line-height:100%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabAddrCol" style="font-size:6.5pt; line-height:90%">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA2TabIDCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchA2TabMoneyCol">
									<span style="width:3px;"/>
								</td>
								<td class="IRS8865_SchATabCatCol" style="border-right-width:0px;">
									<span style="width:3px;"/>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div>
				<xsl:call-template name="SetInitialDynamicTableHeight">
					<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleA2/AffiliationScheduleGrp"/>
					<xsl:with-param name="containerHeight" select="5"/>
					<xsl:with-param name="containerID" select=" 'SchA2Table' "/>
				</xsl:call-template>
				<!-- Schedule B header-->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_PartIndex" style="border-top-width:0px;border-bottom-width:1px;padding-top:0.5mm; width: 21mm;">Schedule B</div>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-left:4px;padding-top:0.5mm;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;width:166mm;">
						<span style="font-weight:bold;">

         Income Statement - Trade or Business Income

       </span>
					</div>
				</div>
				<!-- schedule B header note -->
				<div>
					<div class="IRS8865_LineDescLong" style="width:187mm;border-right-width:0px;border-bottom-width:1px;">
						<span style="font-weight:bold;">Caution. </span>
						<span style="font-style:italic;">Include <span style="font-weight:bold;"> only </span> trade or business income and expenses on lines 1a through 22 below. See the instructions for more information.</span>
					</div>
				</div>
				<!-- superimposed image -->
				<span style="z-index:1;position:absolute;padding-top:15mm;">
					<img src="{$ImagePath}/8865_Income.gif" alt="image displaying the word income" border="0"/>
				</span>
				<!-- line 1a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace" style="height:7mm;padding-top:3mm;"/>
					<div class="IRS8865_LineIndex" style="height:7mm;padding-top:3mm;padding-right:10px;">1a</div>
					<div class="IRS8865_LineDescShort" style="height:7mm;padding-top:3mm;">Gross receipts or sales
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/GrossReceiptsOrSalesAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">........................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:7mm;padding-top:3mm;">1a</div>
					<div class="IRS8865_MoneyFieldMid" style="height:7mm;padding-top:3mm;padding-right:2px;font-size:7pt;font-family:arial;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/GrossReceiptsOrSalesAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray" style="height:7mm;"/>
					<div class="IRS8865_MoneyFieldFiller" style="height:7mm;"/>
				</div>
				<!-- line 1b,c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex" style="padding-right:10px;">b</div>
					<div class="IRS8865_LineDescShort">Less returns and allowances

             <span class="IRS8865_DotSpacing">.......................</span>
					</div>
					<div class="IRS8865_LineIndexMid">1b</div>
					<div class="IRS8865_MoneyFieldMid" style="padding-right:2px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/ReturnsAndAllowancesAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMid">1c</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/NetOfSalesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 2 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">2</div>
					<div class="IRS8865_LineDescLong">Cost of goods sold

             <span class="IRS8865_DotSpacing">.......................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">2</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/CostOfGoodsSoldAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 3 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">3</div>
					<div class="IRS8865_LineDescLong">Gross profit. Subtract line 2 from line 1c

             <span class="IRS8865_DotSpacing">.............................</span>
					</div>
					<div class="IRS8865_LineIndexMid">3</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/GrossProfitAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 4 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">4</div>
					<div class="IRS8865_LineDescLong">Ordinary income (loss) from other partnerships, estates, and trusts
            <span style="font-style:italic;">(attach statement)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/OrdinaryIncomeLossOthPrtshpAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">........</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">4</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/OrdinaryIncomeLossOthPrtshpAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 5 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">5</div>
					<div class="IRS8865_LineDescLong">Net farm profit (loss)
            <span style="font-style:italic;">(attach Schedule F (Form 1040))</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/NetFarmProfitLossAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">.......................</span>
					</div>
					<div class="IRS8865_LineIndexMid">5</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/NetFarmProfitLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 6 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">6</div>
					<div class="IRS8865_LineDescLong">Net gain (loss) from Form 4797, Part II,
					 line 17 (attach Form 4797)
					 
			<!--  Form Link -->
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/Form4797GainOrLossAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">................</span>
					</div>
					<div class="IRS8865_LineIndexMid">6</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/Form4797GainOrLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 7 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">7</div>
					<div class="IRS8865_LineDescLong">Other income (loss)
            <span style="font-style:italic;">(attach statement)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/OtherIncomeLossAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">............................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">7</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/OtherIncomeLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- spacer line -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex"/>
					<div class="IRS8865_LineDescLong"/>
					<div class="IRS8865_LineIndexMidFiller"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- line 8 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="border-bottom-width:1px;">8</div>
					<div class="IRS8865_LineDescLong" style="border-bottom-width:1px;border-bottom-width:1px;">
						<span style="font-weight:bold;">Total income (loss).</span>

         Combine lines 3 through 7         

             <span class="IRS8865_DotSpacing">..........................</span>
					</div>
					<div class="IRS8865_LineIndexMid" style="border-bottom-width:1px;">8</div>
					<div class="IRS8865_MoneyField" style="border-bottom-width:1px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/TotalIncomeOrLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- superimposed image -->
				<span style="z-index:1;position:absolute;padding-top:4mm;">
					<img src="{$ImagePath}/8865_DeductionsLong.gif" alt="image displaying the word deductions" border="0"/>
				</span>
				<!-- line 9 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace" style="height:4.5mm;padding-top:0.5mm;"/>
					<div class="IRS8865_LineIndex" style="height:4.5mm;padding-top:0.5mm;">9</div>
					<div class="IRS8865_LineDescLong" style="height:4.5mm;padding-top:0.5mm;">Salaries and wages (other than to partners) (less employment credits)

             <span class="IRS8865_DotSpacing">................</span>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;padding-top:0.5mm;">9</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;padding-top:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/SalariesAndWagesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 10 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">10</div>
					<div class="IRS8865_LineDescLong">Guaranteed payments to partners

             <span class="IRS8865_DotSpacing">................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">10</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/GuaranteedPaymentsToPrtnrAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 11 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">11</div>
					<div class="IRS8865_LineDescLong">Repairs and maintenance

             <span class="IRS8865_DotSpacing">....................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">11</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/RepairsAndMaintenanceAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 12 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">12</div>
					<div class="IRS8865_LineDescLong">Bad debts

             <span class="IRS8865_DotSpacing">..........................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">12</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/BadDebtExpenseAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 13 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">13</div>
					<div class="IRS8865_LineDescLong">Rent
            <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/RentAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">...........................................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">13</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/RentAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 14 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">14</div>
					<div class="IRS8865_LineDescLong">Taxes and licenses

             <span class="IRS8865_DotSpacing">......................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">14</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/TaxesAndLicensesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 15 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">15</div>
					<div class="IRS8865_LineDescLong">Interest
            <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/InterestAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">..........................................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">15</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/InterestAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 16a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex" style="padding-right:10px;">16a</div>
					<div class="IRS8865_LineDescShort">Depreciation <i>(if required, attach Form 4562)</i>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/DepreciationAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">...............</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">16a</div>
					<div class="IRS8865_MoneyFieldMid" style="padding-right:2px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/DepreciationAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- line 16b,c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex" style="padding-right:10px;">b</div>
					<div class="IRS8865_LineDescShort">Less depreciation reported elsewhere on return

             <span class="IRS8865_DotSpacing">.............</span>
					</div>
					<div class="IRS8865_LineIndexMid">16b</div>
					<div class="IRS8865_MoneyFieldMid" style="padding-right:2px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/LessDepreciationAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMid">16c</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/NetChangeToDepreciationAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 17 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">17</div>
					<div class="IRS8865_LineDescLong">Depletion (<span style="font-weight:bold;">Do not </span> deduct oil and gas depletion.)
            <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/DepletionAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">.........................</span>
					</div>
					<div class="IRS8865_LineIndexMid">17</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/DepletionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 18 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">18</div>
					<div class="IRS8865_LineDescLong">Retirement plans, etc.

             <span class="IRS8865_DotSpacing">.....................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">18</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/RetirementPlansAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 19 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">19</div>
					<div class="IRS8865_LineDescLong">Employee benefit programs

             <span class="IRS8865_DotSpacing">...................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">19</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/EmployeeBenefitProgramAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- line 20 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex">20</div>
					<div class="IRS8865_LineDescLong">Other deductions
            <span style="font-style:italic;"> (attach statement)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/OtherDeductionsAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">..............................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">20</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/OtherDeductionsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- spacer line -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex"/>
					<div class="IRS8865_LineDescLong"/>
					<div class="IRS8865_LineIndexMidFiller"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- line 21 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="border-bottom-width:1px;">21</div>
					<div class="IRS8865_LineDescLong" style="border-bottom-width:1px;border-bottom-width:1px;">
						<span style="font-weight:bold;">Total deductions.</span>

         Add the amounts shown in the far right column for lines 9 through 20         

             <span class="IRS8865_DotSpacing">.........</span>
					</div>
					<div class="IRS8865_LineIndexMid" style="border-bottom-width:1px;">21</div>
					<div class="IRS8865_MoneyField" style="border-bottom-width:1px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/TotalDeductionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- spacer line -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace"/>
					<div class="IRS8865_LineIndex"/>
					<div class="IRS8865_LineDescLong"/>
					<div class="IRS8865_LineIndexMidFiller"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- line 22 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpace" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="border-bottom-width:1px;">22</div>
					<div class="IRS8865_LineDescLong" style="border-bottom-width:1px;border-bottom-width:1px;">
						<span style="font-weight:bold;">Ordinary business income (loss) </span>

         from trade or business activities. Subtract line 21 from line 8         

           <span class="IRS8865_DotSpacing">.....</span>
					</div>
					<div class="IRS8865_LineIndexMid" style="border-bottom-width:1px;">22</div>
					<div class="IRS8865_MoneyField" style="border-bottom-width:1px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleB/OrdinaryIncomeLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Page Break and Footer-->
				<div class="pageEnd" style="width:187mm;padding-top:.5mm;">
					<div style="float:right;">
						<span style="width:80px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">8865</span> (2013)
    </div>
				</div>
				<!-- END Page Break and Footer-->

				<!-- schedule D removed -->
				<!-- END Page Break and Footer-->
				<!--Begin Page 3 -->
				<!-- Page Header -->
				<div style="width:187mm;padding-top:.5mm;">
					<div style="float:left;">Form 8865 (2013)<span style="width:148mm;"/>
					</div>
					<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
					</div>
				</div>
				<!-- END Page Header -->
				<!-- Schedule K header-->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_PartIndex" style="border-bottom-width:1px; width: 21mm;">Schedule K</div>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-left:4px;border-right-width:1px;border-top-width:1px;border-bottom-width:1px;width:133mm;">
						<span style="font-weight:bold;">
							 Partners' Distributive Share Items
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK"/>
							</xsl:call-template>
						</span> 
					</div>
					<div class="IRS8865_LineDescLong" style="width:34mm;border-bottom-width:1px;border-right-width:0px;text-align:center;font-weight:bold;border-top-width:1px;">

       Total amount

  </div>
				</div>
				<!-- superimposed image -->
				<span style="z-index:1;position:absolute;padding-top:20mm;padding-left:4mm;">
					<img src="{$ImagePath}/8865_IncomeLoss.gif" alt="image displaying the word income (loss)" border="0"/>
				</span>
				<!-- Schedule K line 1 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height:4.5mm;padding-top:0.5mm;"/>
					<div class="IRS8865_LineIndex" style="height:4.5mm;padding-top:0.5mm;">1</div>
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;padding-top:0.5mm;">Ordinary business income (loss) (page 2, line 22)
					<!-- **** Maybe Later *******
					    <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK"/>
						</xsl:call-template>    -->
						<span class="IRS8865_DotSpacing">.......................</span>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;padding-top:0.5mm;">1</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;padding-top:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OrdnryIncmLossFromTrdOrBusAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 2 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex">2</div>
					<div class="IRS8865_LineDescLongSchK">Net rental real estate income (loss) 
            <span style="font-style:italic;">(attach Form 8825)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NetIncomeLossFromRntlREActyAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">....................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">2</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NetIncomeLossFromRntlREActyAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 3a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">3a</div>
					<div class="IRS8865_LineDescShortSchK">Other gross rental income (loss)

             <span class="IRS8865_DotSpacing">...................</span>
					</div>
					<div class="IRS8865_LineIndexMid">3a</div>
					<div class="IRS8865_MoneyFieldMid" style="padding-right:2px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/GrossIncomeFromOthRntlActyAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- Schedule K line 3b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescShortSchK">Expenses from other rental activities
            <span style="font-style:italic;">(attach statement)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/ExpensesFromOtherRentalActyAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">........</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">3b</div>
					<div class="IRS8865_MoneyFieldMid" style="padding-right:2px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/ExpensesFromOtherRentalActyAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- Schedule K line 3c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">c</div>
					<div class="IRS8865_LineDescLongSchK">Other net rental income (loss). Subtract line 3b from line 3a

             <span class="IRS8865_DotSpacing">..................</span>
					</div>
					<div class="IRS8865_LineIndexMid">3c</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NetIncmLossFromOthRntlActyAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 4 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex">4</div>
					<div class="IRS8865_LineDescLongSchK">Guaranteed payments
           <span class="IRS8865_DotSpacing">...................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">4</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/GuaranteedPaymentsToPrtnrAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 5 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex">5</div>
					<div class="IRS8865_LineDescLongSchK">Interest income

             <span class="IRS8865_DotSpacing">......................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">5</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/InterestIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 6 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex">6</div>
					<div class="IRS8865_LineDescLongSchK">Dividends: <span style="width:3mm"/>
						<span style="font-weight:bold;">a </span> Ordinary dividends
          <span class="IRS8865_DotSpacing">.............................</span>
						<!--  <img src="{$ImagePath}\8865_Bullet_Sm.gif" alt="Right arrow"/>
            <span class="IRS8865_MoneyField" style="right-border-width:0px;border_style:solid;float:none;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/PrtflIncomeLossQualifiedDiv"/>
              </xsl:call-template>
            </span>
            <span style="font-weight:bold;">(2) </span> Total ordinary dividends 

        <img src="{$ImagePath}\8865_Bullet_Sm.gif" alt="Right arrow"/>-->
					</div>
					<div class="IRS8865_LineIndexMid">6a</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OrdinaryDividendsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex"/>
					<div class="IRS8865_LineDescShortSchK">
						<span style="padding-left:18mm"/>
						<span style="font-weight:bold;">b </span> Qualified dividends            
            
            <span class="IRS8865_DotSpacing">.................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">6b</div>
					<div class="IRS8865_MoneyFieldMid" style="padding-right:2px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/QualifiedDividendsAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- Schedule K line 7 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex">7</div>
					<div class="IRS8865_LineDescLongSchK">Royalties
             <span class="IRS8865_DotSpacing">.........................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">7</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/RoyaltiesReceivedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 8 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex">8</div>
					<div class="IRS8865_LineDescLongSchK">
						Net short-term capital gain (loss) (attach Schedule D (Form 1065)) 
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NetSTCapitalGainOrLossAmt"/>
						</xsl:call-template>
						<span style="width:1.5mm;"/><span class="IRS8865_DotSpacing">.............</span>
					</div>
					<div class="IRS8865_LineIndexMid">8</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NetSTCapitalGainOrLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 9a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">9a</div>
					<div class="IRS8865_LineDescLongSchK">
						Net long-term capital gain (loss) (attach Schedule D (Form 1065))
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NetLTCapitalGainOrLossAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">..............</span>
					</div>
					<div class="IRS8865_LineIndexMid">9a</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NetLTCapitalGainOrLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 9b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescShortSchK">Collectibles (28%) gain (loss)
					    <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/Collectibles28PercentGainAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">...................</span>
					</div>
					<div class="IRS8865_LineIndexMid">9b</div>
					<div class="IRS8865_MoneyFieldMid" style="padding-right:2px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/Collectibles28PercentGainAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- Schedule K line 9c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">c</div>
					<div class="IRS8865_LineDescShortSchK">Unrecaptured section 1250 gain 
            <span style="font-style:italic;">(attach statement)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/UnrecapturedSection1250GainAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">..........</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">9c</div>
					<div class="IRS8865_MoneyFieldMid" style="padding-right:2px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/UnrecapturedSection1250GainAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- Schedule K line 10 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex">10</div>
					<div class="IRS8865_LineDescLongSchK">Net section 1231 gain (loss)
            <span style="font-style:italic;">(attach Form 4797)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NetSection1231GainLossAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">.......................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">10</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NetSection1231GainLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 11 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="border-bottom-width:1px;">11</div>
					<div class="IRS8865_LineDescLongSchK" style="border-bottom-width:1px;">Other income (loss)
          <span style="font-style:italic;">(see instructions)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherIncomeLossAmt"/>
						</xsl:call-template>
						<span style="padding-left:1mm;">
        
             Type <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherIncomeLossAmt/@otherIncomeTyp"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="IRS8865_LineIndexMid">11</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherIncomeLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- superimposed image -->
				<span style="z-index:1;position:absolute;padding-top:1mm;padding-left:4mm;">
					<img src="{$ImagePath}/8865_Deductions.gif" height="65mm" width="15mm" alt="image displaying the word Deductions" border="0"/>
				</span>
				<!-- Schedule K line 12 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height:4.5mm;padding-top:0.5mm;"/>
					<div class="IRS8865_LineIndex" style="height:4.5mm;padding-top:0.5mm;">12</div>
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;padding-top:0.5mm;">Section 179 deduction          
            <span style="font-style:italic;">(attach Form 4562)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/Section179ExpenseDeductionAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">..........................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;padding-top:0.5mm;">12</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;padding-top:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/Section179ExpenseDeductionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 13 a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">13a</div>
					<div class="IRS8865_LineDescLongSchK">Contributions    
           <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/CharitableContributionsTotAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">......................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">13a</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/CharitableContributionsTotAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 13b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescLongSchK">Investment interest expense 
                  
            <span class="IRS8865_DotSpacing">...............................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">13b</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/InterestExpenseOnInvstDbAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 13c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height: 4.5mm; border-right: black 1px solid;"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">c</div>
					<div class="IRS8865_LineDescLongSchK" style="width:60mm;border-right-width:0px; height: 4.5mm; vertical-align: top;">Section 59(e)(2) expenditures:                     
               <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/Section59e2ExpenditureAmt"/>
						</xsl:call-template>
						<span style="font-weight:bold;padding-left:1mm;">(1)</span>Type
               <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="width:52mm;padding-left:1mm;border-style:solid; text-align: left; height: 4.5mm;font-family:verdana;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/Section59e2ExpenditureAmt/@sect59e2ExpenditureDesc"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineDescLongSchK" style="width:22mm;padding-left:10px; height: 4.5mm;">
						<span style="font-weight:bold;">(2) </span>Amount 
               <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="font-size: 8pt;font-family:arial narrow;height:4.5mm;">13c(2)</div>
					<div class="IRS8865_MoneyField" style="height: 4.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/Section59e2ExpenditureAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 13d -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="border-bottom-width:1px;padding-right:9px;">d</div>
					<div class="IRS8865_LineDescLongSchK" style="border-bottom-width:1px;">Other deductions
            <span style="font-style:italic;">(see instructions)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherDeductionsAmt"/>
						</xsl:call-template>
						<span style="padding-left:1mm;">
                     Type <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherDeductionsAmt/@otherDeductionsDesc"/>
							</xsl:call-template>
						</span>
						<!--
            <span class="IRS8865_DotSpacing">............................</span>
            -->
						<span style="width:3px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">13d</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherDeductionsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- superimposed image -->
				<span style="z-index:1;position:absolute;padding-top:0mm;padding-left:1mm;">
					<img src="{$ImagePath}/8865_SelfEmp.gif" alt="image displaying the word self-employment" border="0"/>
				</span>
				<!-- Schedule K line 14a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height:4.5mm;padding-top:0.5mm;"/>
					<div class="IRS8865_LineIndex" style="height:4.5mm;padding-top:0.5mm;padding-right:9px;">14a</div>
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;padding-top:0.5mm;">Net earnings (loss) from self-employment
            <span class="IRS8865_DotSpacing">..........................</span>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;padding-top:0.5mm;">14a</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;padding-top:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NetEarningsLossFromSEAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 14b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescLongSchK">Gross farming or fishing income
            <span class="IRS8865_DotSpacing">...............................</span>
					</div>
					<div class="IRS8865_LineIndexMid">14b</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/GrossFarmingOrFishingIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 14c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="border-bottom-width:1px;padding-right:9px;">c</div>
					<div class="IRS8865_LineDescLongSchK" style="border-bottom-width:1px;">Gross nonfarm income
            <span class="IRS8865_DotSpacing">...................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">14c</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/GrossNonfarmIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- superimposed image -->
					<span style="z-index:1;position:absolute;padding-top:0mm;padding-left:4.5mm;padding-top:7.5mm;padding-right:3mm;">
						<img src="{$ImagePath}/8865_Credits.gif" alt="image displaying the word credits" border="0"/>
					</span>
				<!-- Schedule K line 15a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height:4.5mm;padding-top:0.5mm;"/>
					<div class="IRS8865_LineIndex" style="height:4.5mm;padding-top:0.5mm;padding-right:9px">15a</div>
					<div class="IRS8865_LineDescLongSchK">
           Low-income housing credit (section 42(j)(5))            
           <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/LowIncmHsngCrSect42j5PrtshpAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">.......................</span>
						<span style="width:6px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;padding-top:0.5mm;">15a</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;padding-top:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/LowIncmHsngCrSect42j5PrtshpAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 15b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px">b</div>
					<div class="IRS8865_LineDescLongSchK">
            Low-income housing credit (other)           
             <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/LowIncomeHousingCrOthPrtshpAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">............................</span>
						<span style="width:3px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">15b</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/LowIncomeHousingCrOthPrtshpAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 15c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">c</div>
					<div class="IRS8865_LineDescLongSchK">Qualified rehabilitation expenditures (rental real estate)           
           <span style="font-style:italic;">(attach Form 3468)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/QlfyRehbltExpendRntlREActyAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">........</span>
						<span style="width:6px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">15c</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/QlfyRehbltExpendRntlREActyAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 15d -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">d</div>
					<div class="IRS8865_LineDescLongSchK">Other rental real estate credits <i>(see instructions)</i>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherRentalRealEstateAmt"/>
						</xsl:call-template>
						<span style="width:9mm;"/>  
               Type <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="MidSizeBullet"/>
						<span class="styIRS8865BBText" style="width:31mm;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherRentalRealEstateAmt/@otherRentalRealEstateCrDesc"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="IRS8865_LineIndexMid">15d</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherRentalRealEstateAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 15e-->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">e</div>
					<div class="IRS8865_LineDescLongSchK">Other rental credits <i>(see instructions)</i>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherRentalCreditsAmt"/>
						</xsl:call-template>
						<span style="width:24mm;"/>
          Type <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="SmallSizeBullet"/>
						<span class="styIRS8865BBText" style="width:32mm;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherRentalCreditsAmt/@otherRentalCreditDesc"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="IRS8865_LineIndexMid">15e</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherRentalCreditsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 15f -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="border-bottom-width:1px;padding-right:9px;">f</div>
					<div class="IRS8865_LineDescLongSchK" style="border-bottom-width:1px;">Other credits
           <span style="font-style:italic;">(see instructions)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/TotalCreditsAmt"/>
						</xsl:call-template>
						<span style="padding-left:5mm;">
        
             Type <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:32mm;padding-left:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/TotalCreditsAmt/@otherCreditsTotalDesc"/>
								</xsl:call-template>
							</span>
						</span>
						<span style="width:6px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">15f</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/TotalCreditsAmt"/>
						</xsl:call-template>
					</div>
				</div> 
		
	
				
				
				<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  -->
				<xsl:for-each select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs">
				  		<xsl:variable name="pos" select="position()"/>
				<!-- superimposed image -->
					<span style="z-index:1;position:absolute;padding-top:1mm;padding-top:5mm;padding-left:4mm;">
						<img src="{$ImagePath}/8865_ForeignTrans.gif" alt="image displaying the word Foreign transactions" border="0"/>
  					</span>
				<!-- Schedule K line 16a -->	
								
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height:4.5mm;padding-top:0.5mm;"/>

					<div class="IRS8865_LineIndex" style="height:4.5mm;padding-top:0.5mm;padding-right:9px;">
					
					16a</div>
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;padding-top:0.5mm;width:50mm;border-right-width:0px;">Name of country or U.S. possession

             <img src="{$ImagePath}/8865_Bullet_Sm.gif" width="4" height="7" alt="right pointing bullet image" border="0"/>
					</div>
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;padding-top:0.5mm;width:84mm;border-bottom-width:1px;border-bottom-style:solid;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray" style="height:4.5mm;padding-top:0.5mm;"/>
					<div class="IRS8865_MoneyFieldFiller" style="height:4.5mm;padding-top:0.5mm;"/>
				</div>
				<!-- Schedule K line 16b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescLongSchK">Gross income from all sources

             <span class="IRS8865_DotSpacing">...............................</span>
					</div>
					<div class="IRS8865_LineIndexMid">16b</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/GrossIncomeFromAllSourcesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 16c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">c</div>
					<div class="IRS8865_LineDescLongSchK">Gross income sourced at partner level
                          <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/GrossIncomeSrceAtPrtnrLvlAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">........................</span>
						<span style="width:2px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">16c</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/GrossIncomeSrceAtPrtnrLvlAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;"/>
					<div class="IRS8865_LineDescLongSchK">
						<span style="font-style:italic;">Foreign gross income sourced at partnership level</span>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PrtshpLvlFrgnGroIncmOthAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 16d -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height:4.5mm;"/>
					<div class="IRS8865_LineIndex" style="height:4.5mm;padding-right:9px;">d</div>
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;width:21mm;border-right-width:0px;vertical-align: top;font-size:6pt;"> Passive category
                  <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;width:22mm;border-style:solid; text-align: right; ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PrtshpLvlFrgnGroIncmPssvAmt"/>
						</xsl:call-template>
					</div>
					<!-- Schedule K line 16e -->
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;width:31mm;padding-left:5px; border-right-width:0px;">
						<span style="font-weight:bold;">e</span>
						<span style="font-size:6pt"> General category
						</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PrtshpLvlFrgnGroIncmGenCatAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;width:22mm; text-align: right;border-left-width: 0px; ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PrtshpLvlFrgnGroIncmGenCatAmt"/>
						</xsl:call-template>
					</div>
					<!-- Schedule K line 16f -->
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;width:38mm; padding-left:5px;">
						<span style="font-weight:bold;">f</span> Other <span style="font-style:italic;">(attach statement)</span>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;">16f</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PrtshpLvlFrgnGroIncmOthAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;"/>
					<div class="IRS8865_LineDescLongSchK">
						<span style="font-style:italic;">Deductions allocated and apportioned at partner level </span>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- Schedule K line 16g -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">g</div>
					<div class="IRS8865_LineDescLongSchK" style="width:27mm;border-right-width:0px;vertical-align: top;"> Interest expense
           

         <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="width:25mm;border-style:solid; text-align: right; ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PartnerLevelDedIntExpnsAmt"/>
						</xsl:call-template>
					</div>
					<!-- Schedule K line 16h -->
					<div class="IRS8865_LineDescLongSchK" style="width:82mm;padding-left:5px;">
						<span style="font-weight:bold;">h</span> Other
             
         
           <span class="IRS8865_DotSpacing">.......................</span>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_LineIndexMid">16h</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PartnerLevelDeductionsOtherAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;"/>
					<div class="IRS8865_LineDescLongSchK">
						<span style="font-style:italic;">Deductions allocated and apportioned at partnership level to foreign source income</span>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PartnershipFrgnIncmDedOthAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 16i -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height:4.5mm;"/>
					<div class="IRS8865_LineIndex" style="height:4.5mm;padding-right:9px;">i</div>
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;width:21mm;border-right-width:0px;vertical-      align: top;font-size:6pt;"> Passive category
                  <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;width:22mm;border-style:solid; text-align: right; ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PrtshpLvlFrgnIncmDedPssvAmt"/>
						</xsl:call-template>
					</div>
					<!-- Schedule K line 16J -->
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;width:31mm;padding-left:5px; border-right-width:0px;">
						<span style="font-weight:bold;">j</span>
						<span style="font-size:6pt"> General category
						</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PrtshpFrgnIncmDedGenCatAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;width:22mm; text-align: right;border-left-width: 0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PrtshpFrgnIncmDedGenCatAmt"/>
						</xsl:call-template>
					</div>
					<!-- Schedule K line 16k -->
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;width:38mm; padding-left:5px;">
						<span style="font-weight:bold;">k</span> Other <span style="font-style:italic;">(attach statement)</span>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;">16k</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/PartnershipFrgnIncmDedOthAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 16l -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height:5.5mm;"/>
					<div class="IRS8865_LineIndex" style="height:5.5mm;padding-top:2mm;padding-right:9px;">l</div>
					<div class="IRS8865_LineDescLongSchK" style="height:5.5mm;border-right-width:1px;vertical-align: top;"> Total foreign taxes (check one): 
             <span style="width:2mm;"/>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
						<span style="width:2mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/TotalForeignTaxesPaidInd"/>
								<xsl:with-param name="BackupName">IRS8865ScheduleKTotalForeignTaxesPaid</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/TotalForeignTaxesPaidInd"/>
								<xsl:with-param name="BackupName">IRS8865ScheduleKTotalForeignTaxesPaid</xsl:with-param>
							</xsl:call-template>
							<span style="padding-top:1.5mm;padding-bottom:0mm;"> Paid</span>
						</label>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/TotalForeignTaxesPaidInd"/>
						</xsl:call-template>
						<span style="width:12px"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/TotalForeignTaxesAccruedInd"/>
								<xsl:with-param name="BackupName">$FormData/IRS8865ScheduleKTotalForeignTaxesAccrued</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/TotalForeignTaxesAccruedInd"/>
								<xsl:with-param name="BackupName">$FormData/IRS8865ScheduleKTotalForeignTaxesAccrued</xsl:with-param>
							</xsl:call-template>
							<span style="padding-top:2mm;padding-bottom:0mm;">  Accrued</span>
						</label>
						<span style="width:2mm;"/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/TotalForeignTaxesAccruedInd"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:5.5mm;padding-top:2mm;">16l</div>
					<div class="IRS8865_MoneyField" style="height:5.5mm;padding-top:2mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/TotalForeignTaxesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 16m -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="border-bottom-width:0px;"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;border-bottom-width:0px;">m</div>
					<div class="IRS8865_LineDescLongSchK" style="border-bottom-width:0px;">Reduction in taxes available for credit
              <span style="font-style:italic;">(attach statement)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/ReductionInTaxesAvlblForCrAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">...................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">16m</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs[$pos]/ReductionInTaxesAvlblForCrAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 16n -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;border-bottom-width:1px;">n</div>
					<div class="IRS8865_LineDescLongSchK" style="border-bottom-width:1px;">Other foreign tax information
              <span style="font-style:italic;">(attach statement)</span>
              <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select=" $FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs"/>
							</xsl:call-template>
						<span class="IRS8865_DotSpacing">.......................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField" style="background-color:lightgrey;">
						<!--          <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/OtherForeignTaxInformation"/>
              </xsl:call-template>    -->
					</div>
				</div>
				</xsl:for-each>
								<!--  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&   -->
				<xsl:if test="normalize-space($FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs)=''">
				
				<!-- Schedule K line 16a -->		
				
				<!-- superimposed image -->
				<div class="IRS8865_LineContainer">
					<span style="z-index:1;position:absolute;padding-top:1mm;padding-top:5mm;padding-left:4mm;">
						<img src="{$ImagePath}/8865_ForeignTrans.gif" alt="image displaying the word Foreign transactions" border="0"/>
						
						
  					</span>
				</div>
				
				
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>

					<div class="IRS8865_LineIndex" style="padding-right:9px;">
					
					16a</div>
					<div class="IRS8865_LineDescLongSchK" style="width:50mm;border-right-width:0px;">Name of country or U.S. possession

             <img src="{$ImagePath}/8865_Bullet_Sm.gif" width="4" height="7" alt="right pointing bullet image" border="0"/>
					</div>
					<div class="IRS8865_LineDescLongSchK" style="width:83.75mm;border-bottom-width:1px;border-bottom-style:solid;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- Schedule K line 16b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescLongSchK">Gross income from all sources

             <span class="IRS8865_DotSpacing">...............................</span>
					</div>
					<div class="IRS8865_LineIndexMid">16b</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/GrossIncomeFromAllSourcesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 16c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">c</div>
					<div class="IRS8865_LineDescLongSchK">Gross income sourced at partner level
                          <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/GrossIncomeSrceAtPrtnrLvlAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">........................</span>
						<span style="width:2px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">16c</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/GrossIncomeSrceAtPrtnrLvlAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;"/>
					<div class="IRS8865_LineDescLongSchK">
						<span style="font-style:italic;">Foreign gross income sourced at partnership level</span>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- Schedule K line 16d -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">d</div>
					<div class="IRS8865_LineDescLongSchK" style="width:21mm;border-right-width:0px;vertical-      align: top;font-size:6pt;"> Passive category
                  <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="width:22mm;border-style:solid; text-align: right; ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PrtshpLvlFrgnGroIncmPssvAmt"/>
						</xsl:call-template>
					</div>
					<!-- Schedule K line 16e -->
					<div class="IRS8865_LineDescLongSchK" style="width:31mm;padding-left:5px; border-right-width:0px;">
						<span style="font-weight:bold;">e</span>
						<span style="font-size:6pt"> General category
						</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PrtshpLvlFrgnGroIncmGenCatAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="width:22mm; text-align: right;border-left-width: 0px; ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PrtshpLvlFrgnGroIncmGenCatAmt"/>
						</xsl:call-template>
					</div>
					<!-- Schedule K line 16f -->
					<div class="IRS8865_LineDescLongSchK" style="width:38mm; padding-left:5px;">
						<span style="font-weight:bold;">f</span> Other <span style="font-style:italic;">(attach statement)</span>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;">16f</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PrtshpLvlFrgnGroIncmOthAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PrtshpLvlFrgnGroIncmOthAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;"/>
					<div class="IRS8865_LineDescLongSchK">
						<span style="font-style:italic;">Deductions allocated and apportioned at partner level </span>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- Schedule K line 16g -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">g</div>
					<div class="IRS8865_LineDescLongSchK" style="width:27mm;border-right-width:0px;vertical-align: top;"> Interest expense
           

         <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="width:25mm;border-style:solid; text-align: right; ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PartnerLevelDedIntExpnsAmt"/>
						</xsl:call-template>
					</div>
					<!-- Schedule K line 16h -->
					<div class="IRS8865_LineDescLongSchK" style="width:82mm;padding-left:5px;">
						<span style="font-weight:bold;">h</span> Other
             
         
           <span class="IRS8865_DotSpacing">.......................</span>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_LineIndexMid">16h</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PartnerLevelDeductionsOtherAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;"/>
					<div class="IRS8865_LineDescLongSchK">
						<span style="font-style:italic;">Deductions allocated and apportioned at partnership level to foreign source income</span>
					</div>
					<div class="IRS8865_LineIndexMidFillerGray"/>
					<div class="IRS8865_MoneyFieldFiller"/>
				</div>
				<!-- Schedule K line 16i -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">i</div>
					<div class="IRS8865_LineDescLongSchK" style="width:21mm;border-right-width:0px;vertical-      align: top;font-size:6pt;"> Passive category
                  <img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="width:22mm;border-style:solid; text-align: right; ">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PrtshpLvlFrgnIncmDedPssvAmt"/>
						</xsl:call-template>
					</div>
					<!-- Schedule K line 16J -->
					<div class="IRS8865_LineDescLongSchK" style="width:31mm;padding-left:5px; border-right-width:0px;">
						<span style="font-weight:bold;">j</span>
						<span style="font-size:6pt"> General category
						</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PrtshpFrgnIncmDedGenCatAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_MoneyField" style="width:22mm; text-align: right;border-left-width: 0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PrtshpFrgnIncmDedGenCatAmt"/>
						</xsl:call-template>
					</div>
					<!-- Schedule K line 16k -->
					<div class="IRS8865_LineDescLongSchK" style="width:38mm; padding-left:5px;">
						<span style="font-weight:bold;">k</span> Other <span style="font-style:italic;">(attach statement)</span>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;">16k</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PartnershipFrgnIncmDedOthAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/PartnershipFrgnIncmDedOthAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 16l -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">l</div>
					<div class="IRS8865_LineDescLongSchK" style="border-right-width:1px;vertical-align: top;"> Total foreign taxes (check one): 
             <span style="width:2mm;"/>
						<img src="{$ImagePath}/8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/>
						<span style="width:2mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/TotalForeignTaxesPaidInd"/>
								<xsl:with-param name="BackupName">IRS8865ScheduleKTotalForeignTaxesPaid</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/TotalForeignTaxesPaidInd"/>
								<xsl:with-param name="BackupName">IRS8865ScheduleKTotalForeignTaxesPaid</xsl:with-param>
							</xsl:call-template>
							<span style="padding-top:1.5mm;padding-bottom:0mm;"> Paid</span>
						</label>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/TotalForeignTaxesPaidInd"/>
						</xsl:call-template>
						<span style="width:12px"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/TotalForeignTaxesAccruedInd"/>
								<xsl:with-param name="BackupName">$FormData/IRS8865ScheduleKTotalForeignTaxesAccrued</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/TotalForeignTaxesAccruedInd"/>
								<xsl:with-param name="BackupName">$FormData/IRS8865ScheduleKTotalForeignTaxesAccrued</xsl:with-param>
							</xsl:call-template>
							<span style="padding-top:2mm;padding-bottom:0mm;">  Accrued</span>
						</label>
						<span style="width:2mm;"/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/TotalForeignTaxesAccruedInd"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_LineIndexMid">16l</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/TotalForeignTaxesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 16m -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="border-bottom-width:0px;"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;border-bottom-width:0px;">m</div>
					<div class="IRS8865_LineDescLongSchK" style="border-bottom-width:0px;">Reduction in taxes available for credit
              <span style="font-style:italic;">(attach statement)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/ReductionInTaxesAvlblForCrAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">...................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">16m</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/ReductionInTaxesAvlblForCrAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 16n -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;border-bottom-width:1px;">n</div>
					<div class="IRS8865_LineDescLongSchK" style="border-bottom-width:1px;">Other foreign tax information
						  <span style="font-style:italic;">(attach statement)</span>
						  <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select=" $FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs"/>
							</xsl:call-template>
						<span class="IRS8865_DotSpacing">.......................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField" style="background-color:lightgrey;">
						<!--          <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributiveShareItemsFrgnTxs/OtherForeignTaxInformation"/>
              </xsl:call-template>    -->
					</div>
				</div>
				</xsl:if>

				<!-- superimposed image -->
				<span style="z-index:1;position:absolute;padding-top:1mm;padding-left:0mm;">
					<img src="{$ImagePath}/8865_Alternative.gif" alt="image displaying the word alternative minimum tax (AMT) item" border="0"/>
				</span>
				<!-- Schedule K line 17a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height:4.5mm;padding-top:0.5mm;"/>
					<div class="IRS8865_LineIndex" style="height:4.5mm;padding-top:0.5mm;padding-right:9px;">17a</div>
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;padding-top:0.5mm;">Post-1986 depreciation adjustment          
            <span class="IRS8865_DotSpacing">.............................</span>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;padding-top:0.5mm;">17a</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;padding-top:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/Post1986DepreciationAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 17b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescLongSchK">Adjusted gain or loss
            <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/AdjustedGainOrLossAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">..................................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">17b</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/AdjustedGainOrLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 17c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">c</div>
					<div class="IRS8865_LineDescLongSchK">Depletion (other than oil and gas)
            <span class="IRS8865_DotSpacing">..............................</span>
					</div>
					<div class="IRS8865_LineIndexMid">17c</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DepletionOtherThanOilAndGasAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 17 d -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">d</div>
					<div class="IRS8865_LineDescLongSchK">
            Oil, gas, and geothermal properties—gross income
            <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OilGasAndGeothermalGroIncmAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">.....................</span>
						<span style="width:4px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">17d</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OilGasAndGeothermalGroIncmAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 17e -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">e</div>
					<div class="IRS8865_LineDescLongSchK">
            Oil, gas, and geothermal properties—deductions
            <!--<xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OilGasAndGeothermalDeductions"/>
            </xsl:call-template>-->
						<span class="IRS8865_DotSpacing">......................</span>
						<span style="width:3px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">17e</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OilGasAndGeothermalDedsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 17f -->
				<div class="IRS8865_LineContainer">
					<!--div class="IRS8865_LineContainer" -->
					<div class="IRS8865_LabelSpaceWide" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="border-bottom-width:1px;padding-right:9px;">f</div>
					<div class="IRS8865_LineDescLongSchK" style="border-bottom-width:1px;">Other AMT items           
           <span style="font-style:italic;">(attach statement)</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherAMTItemsAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">...........................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">17f</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherAMTItemsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- total line -->
					<span style="z-index:1;position:absolute;padding-top:8mm;padding-left:4mm;padding-right:5mm;">
						<img src="{$ImagePath}/8865_Other.gif" alt="image displaying the word other" border="0"/>
					</span>
				<!-- Schedule K line 18a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="height:4.5mm;padding-top:0.5mm;"/>
					<div class="IRS8865_LineIndex" style="height:4.5mm;padding-top:0.5mm;padding-right:9px;">18a</div>
					<div class="IRS8865_LineDescLongSchK" style="height:4.5mm;padding-top:0.5mm;">Tax-exempt interest income

             <span class="IRS8865_DotSpacing">...............................</span>
					</div>
					<div class="IRS8865_LineIndexMid" style="height:4.5mm;padding-top:0.5mm;">18a</div>
					<div class="IRS8865_MoneyField" style="height:4.5mm;padding-top:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/TaxExemptInterestIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 18b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescLongSchK">Other tax-exempt income

             <span class="IRS8865_DotSpacing">.................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">18b</div>
					<div class="IRS8865_MoneyField" style="height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherTaxExemptIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 18c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">c</div>
					<div class="IRS8865_LineDescLongSchK">Nondeductible expenses

             <span class="IRS8865_DotSpacing">..................................</span>
					</div>
					<div class="IRS8865_LineIndexMid">18c</div>
					<div class="IRS8865_MoneyField" style="height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/NondeductibleExpensesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 19a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">19a</div>
					<div class="IRS8865_LineDescLongSchK">Distributions of cash and marketable securities
            <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributionsOfMoneyAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">.......................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">19a</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistributionsOfMoneyAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 19b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescLongSchK">Distributions of other property 
                      <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistriOfPropOthThanMonyAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">..............................</span>
						<span style="width:9px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">19b</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/DistriOfPropOthThanMonyAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 20a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">20a</div>
					<div class="IRS8865_LineDescLongSchK">Investment income
                  
            <span class="IRS8865_DotSpacing">....................................</span>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">20a</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/InvestmentIncomeInPrtflIncmAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 20b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescLongSchK">Investment expenses
              <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/InvstExpnsInPrtflIncmDedAmt"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">.................................</span>
						<span style="width:9px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid">20b</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/InvstExpnsInPrtflIncmDedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K line 20c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LabelSpaceWide" style="border-bottom-width:1px;"/>
					<div class="IRS8865_LineIndex" style="padding-right:9px;border-bottom-width:1px">c</div>
					<div class="IRS8865_LineDescLongSchK" style="border-bottom-width:1px;">Other items and amounts           
           <span style="font-style:italic;"> (attach statement)</span>
						<xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK"/>
						</xsl:call-template>
						<span class="IRS8865_DotSpacing">........................</span>
						<span style="width:6px;"/>
						<span style="width:3px;"/>
					</div>
					<div class="IRS8865_LineIndexMid" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField" style="background-color:lightgrey;">
						<!--xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/OtherItemsAndAmountsSchedule"/>
            </xsl:call-template-->
					</div>
				</div>
				<!-- Page Break and Footer-->
				<div class="pageEnd" style="width:187mm;padding-top:.5mm;">
					<div style="float:right;">
						<span style="width:80px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">8865</span> (2013)
    </div>
				</div>
				<!-- END Page Break and Footer-->
				<!--Begin Page 4 -->
				<!-- Page Header -->
				<div style="width:187mm;padding-top:.5mm;">
					<div style="float:left;">Form 8865 (2013)<span style="width:148mm;"/>
					</div>
					<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
					</div>
				</div>
				<!-- END Page Header -->
				<!-- Schedule L header-->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_PartIndex" style="border-bottom-width:1px; width: 21mm;">Schedule L</div>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;width:166.5mm;">
						<span style="font-weight:bold;">
              Balance Sheets per Books.
            </span>
              (Not required if Item G9, page 1, is answered "Yes.")
          </div>
				</div>
				<!-- overlay title text -->
				<div class="IRS8865_LineDescLongSchL" style="z-index:1;position:absolute;width:83mm;border-right-width:0px;height:7.5mm;text-align:center;font-size:9pt;font-weight:bold;padding-top:10px;">Assets</div>
				<!-- Schedule L line i -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex"/>
					<div class="IRS8865_LineDescLongSchL"/>
					<div class="IRS8865_MoneyFieldMid" style="width:51.75mm;text-align:center;font-size:6pt;font-family:verdana;">Beginning of tax year</div>
					<div class="IRS8865_MoneyField" style="width:51.75mm;text-align:center;font-size:6pt;font-family:verdana;">End of tax year</div>
				</div>
				<!-- Schedule L line ii -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex"/>
					<div class="IRS8865_LineDescLongSchL"/>
					<div class="IRS8865_MoneyFieldMid" style="text-align:center;font-weight:bold;">(a)</div>
					<div class="IRS8865_MoneyFieldMid" style="text-align:center;font-weight:bold;">(b)</div>
					<div class="IRS8865_MoneyFieldMid" style="text-align:center;font-weight:bold;">(c)</div>
					<div class="IRS8865_MoneyField" style="text-align:center;font-weight:bold;">(d)</div>
				</div>
				<!-- Schedule L line 1 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">1</div>
					<div class="IRS8865_LineDescLongSchL">Cash

             <span class="IRS8865_DotSpacing">.......................</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/CashBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/CashEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 2a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:9px;">2a</div>
					<div class="IRS8865_LineDescLongSchL">Trade notes and accounts receivable

             <span class="IRS8865_DotSpacing">.........</span>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/TradeNotesAccountsRcvblBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/TradeNotesAccountsRcvblEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldFiller" style="background-color:lightgrey;"/>
				</div>
				<!-- Schedule L line b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:9px;">b</div>
					<div class="IRS8865_LineDescLongSchL">Less allowance for bad debts

             <span class="IRS8865_DotSpacing">.............</span>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/BadDebtAllowanceBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/NetTradeNotesAcctRcvblBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/BadDebtAllowanceEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/NetTradeNotesAcctRcvblEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 3 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">3</div>
					<div class="IRS8865_LineDescLongSchL">Inventories

             <span class="IRS8865_DotSpacing">....................</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/InventoriesBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/InventoriesEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 4 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">4</div>
					<div class="IRS8865_LineDescLongSchL">U.S. government obligations

             <span class="IRS8865_DotSpacing">.............</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/USGovernmentObligationsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/USGovernmentObligationsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 5 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">5</div>
					<div class="IRS8865_LineDescLongSchL">Tax-exempt securities

             <span class="IRS8865_DotSpacing">................</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/TaxExemptSecuritiesBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/TaxExemptSecuritiesEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 6 -->
				<div class="IRS8865_LineContainer" style="vertical-align: top; clear: none; height: 1mm; z-index: 2;">
					<div class="IRS8865_LineIndex">6</div>
					<div class="IRS8865_LineDescLongSchL">Other current assets
           <span style="font-style:italic;">(attach statement)</span>
						<span class="IRS8865_DotSpacing">........</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherCurrentAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid" style="width:22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherCurrentAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherCurrentAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField" style="width:22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherCurrentAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 7a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">7a</div>
					<div class="IRS8865_LineDescLongSchL">Loans to partners (or persons related to partners)

             <span class="IRS8865_DotSpacing">...</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/PartnerLoanBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/PartnerLoanEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 7b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">7b</div>
					<div class="IRS8865_LineDescLongSchL">Mortgage and real estate loans

             <span class="IRS8865_DotSpacing">...........</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/MortgageRealEstateLoansBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/MortgageRealEstateLoansEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 8 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">8</div>
					<div class="IRS8865_LineDescLongSchL">Other investments
           <span style="font-style:italic;">(attach statement)</span>
						<span class="IRS8865_DotSpacing">.........</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherInvestmentsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid" style="width: 22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherInvestmentsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherInvestmentsEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField" style="width: 22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherInvestmentsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 9a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:10px;">9a</div>
					<div class="IRS8865_LineDescLongSchL">Buildings and other depreciable assets

             <span class="IRS8865_DotSpacing">........</span>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/BuildingOtherDeprecAstBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/BuildingOtherDeprecAstEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldFiller" style="background-color:lightgrey;"/>
				</div>
				<!-- Schedule L line 9b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:10px;">b</div>
					<div class="IRS8865_LineDescLongSchL">Less accumulated depreciation

             <span class="IRS8865_DotSpacing">...........</span>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/AccumulatedDepreciationBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/NetDepreciableAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/AccumulatedDepreciationEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/NetDepreciableAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 10a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:10px;">10a</div>
					<div class="IRS8865_LineDescLongSchL">Depletable assets

             <span class="IRS8865_DotSpacing">.................</span>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/DepletableAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/DepletableAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldFiller" style="background-color:lightgrey;"/>
				</div>
				<!-- Schedule L line 10b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:10px;">b</div>
					<div class="IRS8865_LineDescLongSchL">Less accumulated depletion

             <span class="IRS8865_DotSpacing">.............</span>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/AccumulatedDepletionBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/NetDepletableAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/AccumulatedDepletionEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/NetDepletableAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 11 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">11</div>
					<div class="IRS8865_LineDescLongSchL">Land (net of any amortization)

             <span class="IRS8865_DotSpacing">............</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/LandBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/LandEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 12a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:10px;">12a</div>
					<div class="IRS8865_LineDescLongSchL">Intangible assets (amortizable only)

             <span class="IRS8865_DotSpacing">.........</span>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/IntangibleAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/IntangibleAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldFiller" style="background-color:lightgrey;"/>
				</div>
				<!-- Schedule L line 12b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:10px;">b</div>
					<div class="IRS8865_LineDescLongSchL">Less accumulated amortization

             <span class="IRS8865_DotSpacing">...........</span>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/AccumulatedAmortizationBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/NetIntangibleAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/AccumulatedAmortizationEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/NetIntangibleAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 13 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">13</div>
					<div class="IRS8865_LineDescLongSchL">Other assets
           <span style="font-style:italic;">(attach statement)</span>
						<span class="IRS8865_DotSpacing">...........</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid" style="width: 22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField" style="width: 22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 14 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">14</div>
					<div class="IRS8865_LineDescLongSchL">
						<span style="font-weight:bold;">Total </span>assets

             <span class="IRS8865_DotSpacing">....................</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/TotalAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/TotalAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L section title line -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex"/>
					<div class="IRS8865_LineDescLongSchL" style="font-weight:bold;text-align:center;font-size:9pt;">Liabilities and Capital</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldFiller" style="background-color:lightgrey;"/>
				</div>
				<!-- Schedule L line 15 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">15</div>
					<div class="IRS8865_LineDescLongSchL">Accounts payable

             <span class="IRS8865_DotSpacing">.................</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/AccountsPayableBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/AccountsPayableEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 16 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">16</div>
					<div class="IRS8865_LineDescLongSchL">Mortgages, notes, bonds payable in less than 1 year

             <span class="IRS8865_DotSpacing">..</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/ShortTermPayableBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/ShortTermPayableEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 17 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">17</div>
					<div class="IRS8865_LineDescLongSchL">Other current liabilities
           <span style="font-style:italic;">(attach statement)</span>
						<span class="IRS8865_DotSpacing">.......</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid" style="width: 22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField" style="width: 22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 18 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">18</div>
					<div class="IRS8865_LineDescLongSchL">All nonrecourse loans

             <span class="IRS8865_DotSpacing">..............</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/AllNonrecourseLoansBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/AllNonrecourseLoansEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 19a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:10px;">19a</div>
					<div class="IRS8865_LineDescLongSchL">Loans from partners (or persons related to partners)
						<span class="IRS8865_DotSpacing">..</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/LoansFromPartnersBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/LoansFromPartnersEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 19b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">b</div>
					<div class="IRS8865_LineDescLongSchL">Mortgages, notes, bonds payable in 1 year or more

             <span class="IRS8865_DotSpacing">...</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/LongTermPayableBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/LongTermPayableEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 20 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">20</div>
					<div class="IRS8865_LineDescLongSchL">Other liabilities
           <span style="font-style:italic;">(attach statement)</span>
						<span class="IRS8865_DotSpacing">...........</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherLiabilitiesBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid" style="width: 22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherLiabilitiesBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherLiabilitiesEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField" style="width: 22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/OtherLiabilitiesEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 21 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">21</div>
					<div class="IRS8865_LineDescLongSchL">Partners' capital accounts

             <span class="IRS8865_DotSpacing">.............</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/PartnersCapitalAccountsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/PartnersCapitalAccountsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L line 22 -->
				<div class="IRS8865_LineContainer" style="border-bottom:1px solid black">
					<div class="IRS8865_LineIndex">22</div>
					<div class="IRS8865_LineDescLongSchL">
						<span style="font-weight:bold;">Total </span> liabilities and capital

             <span class="IRS8865_DotSpacing">.............</span>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldMidFiller" style="text-align:right;font-size:7pt;font-family:arial;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/TotalLiabilitiesCapitalBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldFiller" style="font-size:7pt;font-family:arial;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleL/TotalLiabilitiesCapitalEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Page Break and Footer-->
				<div class="pageEnd" style="width:187mm;padding-top:.5mm;">
					<div style="float:right;">
						<span style="width:80px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">8865</span> (2013)
    </div>
				</div>
				<!-- END Page Break and Footer-->
				<!--Begin Page 5 -->
				<!-- Page Header -->
				<div style="width:187mm;padding-top:.5mm;">
					<div style="float:left;">Form 8865 (2013)<span style="width:148mm;"/>
					</div>
					<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
					</div>
				</div>
				<!-- END Page Header -->
				<!-- Schedule M header-->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_PartIndex" style="border-bottom-width:1px; width: 22mm;">Schedule M</div>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;width:165mm;">
						<span style="font-weight:bold;">
              Balance Sheets for Interest Allocation
             </span>
					</div>
				</div>
				<!-- Schedule M line header info -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="height:10mm;"/>
					<div class="IRS8865_LineDescLongSchM" style="height:10mm;"/>
					<div class="IRS8865_MoneyFieldMid" style="height:10mm;text-align:center;font-size:6pt;font-family:verdana;">
						<span style="font-weight:bold;">(a)</span>
						<br/>Beginning of<br/>tax year

      </div>
					<div class="IRS8865_MoneyField" style="height:10mm;text-align:center;font-size:6pt;font-family:verdana;">
						<span style="font-weight:bold;">(b)</span>
						<br/>End of<br/>tax year

      </div>
				</div>
				<!-- Schedule M line 1 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">1</div>
					<div class="IRS8865_LineDescLongSchM">Total U.S. assets

             <span class="IRS8865_DotSpacing">...................................</span>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalUSAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalUSAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule M line 2 -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex">2</div>
					<div class="IRS8865_LineDescLongSchM">Total foreign assets:

      </div>
					<div class="IRS8865_MoneyFieldMidFiller" style="background-color:lightgrey;"/>
					<div class="IRS8865_MoneyFieldFiller" style="background-color:lightgrey;"/>
				</div>
				<!-- Schedule M line 2a -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:10px;">a</div>
					<div class="IRS8865_LineDescLongSchM">Passive category

         
						<span class="IRS8865_DotSpacing">...................................</span>
					</div>
					<div class="IRS8865_MoneyFieldMid">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalForeignAstsPssvCatBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalForeignAstsPssvCatEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule M line 2b -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:10px;">b</div>
					<div class="IRS8865_LineDescLongSchM">General category

         
						<span class="IRS8865_DotSpacing">...................................</span>
					</div>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalForeignAssetsGenCatBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyFieldMid" style="width:22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalForeignAssetsGenCatBOYAmt"/>
						</xsl:call-template>
					</div>
					<div style="float: left; border-bottom: 1px solid black; height: 4mm;width:3.5mm;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalForeignAssetsGenCatEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="IRS8865_MoneyField" style="width: 22.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalForeignAssetsGenCatEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule M line 2c -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineIndex" style="padding-right:10px;">c</div>
					<div class="styLNDesc" style="width:127.8mm;">Other (attach statement)

             <span class="IRS8865_DotSpacing">................................</span>
					</div>
					<div class="styLNAmountBoxSmallNBB" style="font-size:7pt;font-family:arial;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalForeignAssetsOtherBOYAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalForeignAssetsOtherBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxSmallNBB" style="font-size:7pt;font-family:arial;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalForeignAssetsOtherEOYAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM/TotalForeignAssetsOtherEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule M-1 header-->
				<div class="IRS8865_LineContainer" style="border-bottom:1px solid black">
					<div class="IRS8865_PartIndex" style="width:27mm;height:8mm;background-color:white;color:black;padding-left:0px;">
						<span style="background-color:black;color:white;padding-left:5px;padding-right:5px;">Schedule M-1</span>
					</div>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;width:160mm;">
						<span style="font-weight:bold;">
              Reconciliation of Income (Loss) per Books With Income (Loss) per Return
            </span>
            (Not required if Item G9, page 1, is answered "Yes.")
        </div>
				</div>
				<div style="width:188mm">
					<div style="float:left; width:93mm">
						<!-- Schedule M-1 line 1 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex" style="padding-top:2.5mm">1</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:6mm; padding-top:2.5mm">Net income (loss) per books
                <span class="IRS8865_DotSpacing">......</span>
							</div>
							<div class="IRS8865_MoneyFieldFull " style="height:6mm; padding-top:2.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/NetIncomeLossPerBooksAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-1 line 2: Schedule M-1 line 2 total -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">2</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:13mm">Income included on Schedule K,<br/>lines 1, 2, 3c, 5, 6a, 7, 8, 9a, 10,<br/> and 11 not recorded on books  <br/> this year

        
               (itemize):
                <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/TotalIncmNotRecordedOnBooksAmt"/>
								</xsl:call-template>
								<span style="width:2px;"/>
								<span style="border-bottom:1px solid black; width:21mm"/>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="padding-top:9mm; height:13mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/TotalIncmNotRecordedOnBooksAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-1 line 3 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">3</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:6.5mm">
                Guaranteed payments (other<br/>than health insurance)
                <span class="IRS8865_DotSpacing">........</span>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="padding-top:3mm; border-top:0 solid black; height:6.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/GuaranteedPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-1 line 4 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">4</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:13mm">
                Expenses recorded on books this year not included on Schedule K, lines 1 through 13d, and 16l (itemize):
                <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/TotalExpensesNotDeductedAmt"/>
								</xsl:call-template>
							</div>
							<!-- Schedule M-1 line 4 total -->
							<div class="IRS8865_MoneyFieldFull" style="padding-top:8mm; border-top:0 solid black; border-bottom:0; height:13mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/TotalExpensesNotDeductedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-1 line 4a -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex" style="padding-right:1.5mm">a</div>
							<div class="IRS8865_LineDescLongSchM1">
                Depreciation $
                <span style="border-bottom:1px solid black; width:31mm; text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/DepreciationExpensesAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="border-bottom:0"/>
						</div>
						<!-- Schedule M-1 line 4b -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex" style="padding-right:1.5mm">b</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:7mm">
                Travel and entertainment $
                <span style="border-bottom:1px solid black; width:14.5mm"/>
								<br/>
								<span style="border-bottom:1px solid black; width:51mm; text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/TravelEntertainmentAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="height:7mm; border-bottom:0;"/>
						</div>
						<!-- Schedule M-1 line 5 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">5</div>
							<div class="IRS8865_LineDescLongSchM1">Add lines 1 through 4
                <span class="IRS8865_DotSpacing">........</span>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="border-top:1px solid black; border-bottom:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/IncomeExpensesSubtotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div style="float:left; width:93mm">
						<!-- Schedule M-1 line 6 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">6</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:9.5mm">
                Income recorded on books<br/>this year not included on Schedule K,<br/>lines 1 through 11 (itemize):
               <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/TotIncmRecordedNotIncludedAmt"/>
								</xsl:call-template>
							</div>
							<!-- Schedule M-1 line 6 total -->
							<div class="IRS8865_MoneyFieldFull" style="height:9.5mm; padding-top:5.5mm; border-right:0; border-bottom:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/TotIncmRecordedNotIncludedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-1 line 6a -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex" style="padding-right:2mm">a</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:7mm">
                Tax-exempt interest $
                <span style="border-bottom:1px solid black; width:20.5mm"/>
								<br/>
								<span style="border-bottom:1px solid black; width:51mm; text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/TaxExemptInterestAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="height:7mm;border-bottom:0;border-right:0;"/>
						</div>
						<!-- Schedule M-1 line 7 -->
						<div style="float:left; width:93.5mm">
							<div class="IRS8865_M12LineContainer">
								<div class="IRS8865_LineIndex">7</div>
								<div class="IRS8865_LineDescLongSchM1" style="height:12.8mm">
                  Deductions included on Schedule K, lines 1 through 13d, and 16l not charged against book
income this year (itemize):
                 <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/TotalDeductionsNotChargedAmt"/>
									</xsl:call-template>
								</div>
								<!-- Schedule M-1 line 7 total -->
								<div class="IRS8865_MoneyFieldFull" style="border-top:1px solid black; padding-top:8mm;border-right:0;border-bottom:0;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/TotalDeductionsNotChargedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule M-1 line 7a -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex" style="padding-right:2mm">a</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:13.8mm">
                Depreciation $
               <span style="border-bottom:1px solid black; width:30.8mm"/>
								<br/>
								<span style="border-bottom:1px solid black; width:51mm; text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/DepreciationDeductionAmt"/>
									</xsl:call-template>
								</span>
								<br/>
								<span style="border-bottom:1px solid black; width:51mm"/>
								<span style="border-bottom:1px solid black; width:51mm"/>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="border-right:0;border-bottom:0;"/>
						</div>
						<!-- Schedule M-1 line 8 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">8</div>
							<div class="IRS8865_LineDescLongSchM1">Add lines 6 and 7
                <span class="IRS8865_DotSpacing">.....</span>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="border-top:1px solid black; border-bottom:1px solid black;border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/IncomeDeductionsSubtotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-1 line 9 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">9</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:6.5mm">Income (loss). Subtract line 8<br/>from line 5

          <span class="IRS8865_DotSpacing">.......</span>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="height:6.5mm; padding-top:3mm; border-right:0;border-bottom:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM1/IncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</div>
				<!-- Schedule M-2 header-->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_PartIndex" style="border-bottom-width:1px;">Schedule M-2</div>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;width:163mm;">
						<span style="font-weight:bold;">
							 Analysis of Partners' Capital Accounts
						 </span>
						(Not required if Item G9, page 1, is answered "Yes.")
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2"/>
							</xsl:call-template>
					</div>
				</div>
				<div style="width:188mm">
					<div style="float:left; width:93mm">
						<!-- Schedule M-2 line 1 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">1</div>
							<div class="IRS8865_LineDescLongSchM1">Balance at beginning of year
                <span class="IRS8865_DotSpacing">..</span>
							</div>
							<div class="IRS8865_MoneyFieldFull">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/BeginningYearBalanceAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-2 line 2 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">2</div>
							<div class="IRS8865_LineDescLongSchM1">Capital contributed:</div>
							<div class="IRS8865_MoneyFieldFull" style="border-bottom:0;"/>
						</div>
						<!-- Schedule M-2 line 2a -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineDescLongSchM1" style="margin-left:14mm; width:48mm"><span style="width:20mm;"/>
								<b>a</b> Cash
								<span class="IRS8865_DotSpacing">.....</span>
							</div>
							<div class="IRS8865_MoneyFieldFull">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/CapitalContributedDurYrCashAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-2 line 2b -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineDescLongSchM1" style="margin-left:14mm; width:48mm"><span style="width:20mm;"/>
								<b>b</b> Property<span style="width:2mm;"/>
								<span class="IRS8865_DotSpacing">...</span>
							</div>
							<div class="IRS8865_MoneyFieldFull">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/CapitalContributedDurYrPropAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-2 line 3 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">3</div>
							<div class="IRS8865_LineDescLongSchM1">Net income (loss) per books
                <span class="IRS8865_DotSpacing">....</span>
							</div>
							<div class="IRS8865_MoneyFieldFull">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/NetIncomeLossPerBooksAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-2 line 4 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex" style="height:7mm;">4</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:7mm;">Other increases (itemize):
              <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/TotalOtherIncreasesAmt"/>
								</xsl:call-template>
								<span style="width:2px;"/>
								<span style="border-bottom:1px solid black; width:10.4mm"/>
								<br/>
								<span style="border-bottom:1px solid black; width:50.4mm"/>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="height:7mm; padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/TotalOtherIncreasesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-2 line 5 -->
						<div class="IRS8865_M12LineContainer">
							<div class="styBB">
								<div class="IRS8865_LineIndex" style="height:9mm;padding-top:5.5mm;">5</div>
								<div class="IRS8865_LineDescLongSchM1" style="height:9mm;padding-top:5.5mm;">Add lines 1 through 4
                  <span class="IRS8865_DotSpacing">.........</span>
								</div>
								<div class="IRS8865_MoneyFieldFull" style="height:9mm;padding-top:5.5mm;border-bottom:0;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/BalBOYCapNetIncmOtherTotalAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<div style="float:left; width:93mm">
						<!-- Schedule M-2 line 6a -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">6</div>
							<div class="IRS8865_LineDescLongSchM1">Distributions: <b>a</b> Cash
                <span class="IRS8865_DotSpacing">........</span>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/DistributionsCashAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-2 line 6b -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineDescLongSchM1" style="width:62mm;">
								<span style="width:26.6mm;"/><b>b</b> Property<span style="width:2mm;"/>
								<span class="IRS8865_DotSpacing">......</span>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/DistributionsPropertyAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-2 line 7 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex" style="height:16.25mm;">7</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:16.25mm;">Other decreases (itemize):
							   <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/TotalOtherDecreasesAmt"/>
								</xsl:call-template>
								<span style="width:5mm"/>
								<span style="border-bottom:1px solid black; width:8mm"/>
						<!-- Schedule M-2 line 7 sub lines -->
						<xsl:variable name="pM2Ln7Count" select="count($FormData/IRS8865ScheduleM2/OtherDecreases)"/>
						<div class="IRS8865_TableContainer2" id="partM2Line7TPctn" style="">
							<xsl:call-template name="SetInitialState"/>
							<table class="IRS8865_SchMTbl" cellspacing="0" cellpadding="0">
								<xsl:call-template name="pM2Line7Template">
									<xsl:with-param name="max">
										<xsl:choose>
											<xsl:when test="$pM2Ln7Count &gt; 3">
												<xsl:value-of select="$pM2Ln7Count"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="3"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
								</xsl:call-template>
							</table>
						</div>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="height:16.25mm;border-right:0; border-bottom:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/TotalOtherDecreasesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-2 line 8 -->
						<div class="IRS8865_M12LineContainer">
							<div class="IRS8865_LineIndex">8</div>
							<div class="IRS8865_LineDescLongSchM1" style="height:4.5mm;">Add lines 6 and 7
                <span class="IRS8865_DotSpacing">..........</span>
							</div>
							<div class="IRS8865_MoneyFieldFull" style="height:4.5mm;border-top:1px solid black;border-right:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/TotDistriAndOthDecreasesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule M-2 line 9 -->
						<div class="IRS8865_M12LineContainer">
							<div class="styBB">
								<div class="IRS8865_LineIndex">9</div>
								<div class="IRS8865_LineDescLongSchM1" style="height:7.4mm">Balance at end of year. Subtract<br/>line 8 from line 5
                  <span class="IRS8865_DotSpacing">..........</span>
								</div>
								<div class="IRS8865_MoneyFieldFull" style="height:7.4mm;border-bottom:0px;border-right:0;">
									<!-- INSERT -->
									<span style="float: left;clear:both;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2"/>
										</xsl:call-template>
									</span>
									<br/>
									<span style="float:right;clear:both;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/EndYearBalanceAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Page Break and Footer-->
				<div class="pageEnd" style="width:187mm;padding-top:.5mm;">
					<div style="float:right;">
						<span style="width:80px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">8865</span> (2013)
    </div>
				</div>
				<!-- END Page Break and Footer-->
				<!--Begin Page 6 -->
				<!-- Page Header -->
				<div style="width:187mm;padding-top:.5mm;">
					<div style="float:left;">Form 8865 (2013)<span style="width:148mm;"/>
					</div>
					<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span>
					</div>
				</div>
				<!-- END Page Header -->
				<!-- Schedule N header-->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_PartIndex" style="border-bottom-width:1px; width: 21mm;">Schedule N</div>
					<div class="IRS8865_LineDescLong" style="font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;width:166mm;">
						<span style="font-weight:bold;">
         					Transactions Between Controlled Foreign Partnership and Partners or Other Related Entities
       					</span>
					</div>
				</div>
				<!-- schedule N header note -->
				<div class="IRS8865_LineContainer">
					<div class="IRS8865_LineDescLong" style="height:8mm;width:187mm;border-right-width:0px;border-bottom-width:1px;">
						<span style="font-weight:bold;">Important:</span>
					      Complete a separate Form 8865 and Schedule N for each controlled foreign partnership. Enter the totals for each type of 							transaction that occurred between the foreign partnership and the persons listed in columns (a) through (d).      
  					</div>
				</div>
				<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  -->
				<xsl:for-each select="$FormData/IRS8865ScheduleN/IRS8865SchN">
					<!-- Schedule N line header info -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex" style="height:20mm;border-bottom-width:1px;"/>
						<div class="IRS8865_LineDescSchN" style="height:20mm;text-align:center;padding-top:20px;border-bottom-width:1px;">
           			Transactions<br/> of<br/> foreign partnership
      				</div>
						<div class="IRS8865_MoneyFieldMid" style="height:20mm;padding-top:30px;text-align:center;font-size:6pt;font-family:verdana;">
							<span style="font-weight:bold;">(a)</span>
               			U.S. person filing this return
          			</div>
						<div class="IRS8865_MoneyFieldMid" style="height:20mm;padding-top:8px;text-align:center;font-size:6pt;font-family:verdana;">
							<span style="font-weight:bold;">(b)</span>
        					 Any domestic corporation or partnership controlling or controlled by the U.S. person filing this return
     				</div>
						<div class="IRS8865_MoneyFieldMid" style="height:20mm;padding-top:8px;text-align:center;font-size:6pt;font-family:verdana;">
							<span style="font-weight:bold;">(c)</span>
				         Any other foreign corporation or partnership controlling or controlled by the U.S. person filing this return
			         </div>
						<div class="IRS8865_MoneyField" style="height:20mm;text-align:center;font-size:6pt;font-family:verdana;">
							<span style="font-weight:bold;">(d)</span>
				         Any U.S. person with a 10% or more direct interest in the controlled foreign partnership (other than the U.S. person filing this return)
				     </div>
					</div>
					<!-- Schedule N line 1 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">1</div>
						<div class="IRS8865_LineDescSchN">
				       Sales of inventory
        					<span class="IRS8865_DotSpacing">.................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfInvntryPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfInvntryPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfInvntryPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfInvntryPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 2 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">2</div>
						<div class="IRS8865_LineDescSchN">

       Sales of property rights (patents, trademarks, etc.)

        <span class="IRS8865_DotSpacing">...</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfPropertyPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfPropertyPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfPropertyPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfPropertyPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 3 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">3</div>
						<div class="IRS8865_LineDescSchN">Compensation received for technical, managerial, </div>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN">

       engineering, construction, or like services

        <span class="IRS8865_DotSpacing">......</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompRcvdPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompRcvdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompRcvdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompRcvdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 4 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">4</div>
						<div class="IRS8865_LineDescSchN">

       Commissions received

        <span class="IRS8865_DotSpacing">...............</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsRcvdPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsRcvdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsRcvdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsRcvdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 5 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">5</div>
						<div class="IRS8865_LineDescSchN">

       Rents, royalties, and license fees received

        <span class="IRS8865_DotSpacing">......</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 6 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">6</div>
						<div class="IRS8865_LineDescSchN">

       Distributions received

        <span class="IRS8865_DotSpacing">...............</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistriReceivedPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistriReceivedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistriReceivedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistriReceivedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 7 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">7</div>
						<div class="IRS8865_LineDescSchN">

       Interest received

        <span class="IRS8865_DotSpacing">.................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IntReceivedPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IntReceivedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IntReceivedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IntReceivedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 8 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">8</div>
						<div class="IRS8865_LineDescSchN">

       Other

        <span class="IRS8865_DotSpacing">......................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherReceivedPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherReceivedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherReceivedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherReceivedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 9 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex" style="border-bottom-width:1px;">9</div>
						<div class="IRS8865_LineDescSchN" style="border-bottom-width:1px;">

       Add lines 1 through 8

        <span class="IRS8865_DotSpacing">...............</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllReceivedTotPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllReceivedTotPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllReceivedTotPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllReceivedTotPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 10 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">10</div>
						<div class="IRS8865_LineDescSchN">

       Purchases of inventory

        <span class="IRS8865_DotSpacing">...............</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsOfInvntryPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsOfInvntryPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsOfInvntryPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsOfInvntryPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 11 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">11</div>
						<div class="IRS8865_LineDescSchN">

       Purchases of tangible property other than inventory

        <span class="IRS8865_DotSpacing">..</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsTngblPropPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsTngblPropPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsTngblPropPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsTngblPropPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 12 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">12</div>
						<div class="IRS8865_LineDescSchN">

       Purchases of property rights (patents, trademarks, etc.)

        <span class="IRS8865_DotSpacing"/>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsPropRghtsPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsPropRghtsPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsPropRghtsPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsPropRghtsPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 13 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">13</div>
						<div class="IRS8865_LineDescSchN">Compensation paid for technical, managerial,

   </div>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN">

        engineering, construction, or like services

        <span class="IRS8865_DotSpacing">......</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompensationPdPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompensationPdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompensationPdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompensationPdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 14 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">14</div>
						<div class="IRS8865_LineDescSchN">

       Commissions paid

        <span class="IRS8865_DotSpacing">.................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsPaidPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsPaidPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsPaidPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsPaidPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 15 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">15</div>
						<div class="IRS8865_LineDescSchN">

       Rents, royalties, and license fees paid

        <span class="IRS8865_DotSpacing">........</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPdPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 16 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">16</div>
						<div class="IRS8865_LineDescSchN">

       Distributions paid

        <span class="IRS8865_DotSpacing">..................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistributionsPdPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistributionsPdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistributionsPdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistributionsPdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 17 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">17</div>
						<div class="IRS8865_LineDescSchN">

       Interest paid

        <span class="IRS8865_DotSpacing">....................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InterestPaidPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InterestPaidPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InterestPaidPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InterestPaidPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 18 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">18</div>
						<div class="IRS8865_LineDescSchN">

       Other

        <span class="IRS8865_DotSpacing">.......................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherPaidPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherPaidPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherPaidPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherPaidPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 19 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex" style="border-bottom-width:1px;">19</div>
						<div class="IRS8865_LineDescSchN" style="border-bottom-width:1px;">

       Add lines 10 through 18

        <span class="IRS8865_DotSpacing">..............</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllPaidTotalPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllPaidTotalPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllPaidTotalPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllPaidTotalPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 20 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">20</div>
						<div class="IRS8865_LineDescSchN">

   Amounts borrowed (enter the maximum loan balance

   </div>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN">

       during the year). see instructions

        <span class="IRS8865_DotSpacing">.........</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsBorrowedPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsBorrowedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsBorrowedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsBorrowedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 21 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">21</div>
						<div class="IRS8865_LineDescSchN">

   Amounts loaned (enter the maximum loan balance

   </div>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex" style="border-bottom-width:1px;"/>
						<div class="IRS8865_LineDescSchN" style="border-bottom-width:1px;">

       during the year). see instructions

        <span class="IRS8865_DotSpacing">.........</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsLoanedPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsLoanedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsLoanedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsLoanedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:for-each>
				<!--  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&   -->
				<xsl:if test="normalize-space($FormData/IRS8865ScheduleN/IRS8865SchN)=''">
					<!-- Schedule N line header info -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex" style="height:20mm;border-bottom-width:1px;"/>
						<div class="IRS8865_LineDescSchN" style="height:20mm;text-align:center;padding-top:20px;border-bottom-width:1px;">
           			Transactions<br/> of<br/> foreign partnership
      				</div>
						<div class="IRS8865_MoneyFieldMid" style="height:20mm;padding-top:30px;text-align:center;font-size:6pt;font-family:verdana;">
							<span style="font-weight:bold;">(a)</span>
               			U.S. person filing this return
          			</div>
						<div class="IRS8865_MoneyFieldMid" style="height:20mm;padding-top:8px;text-align:center;font-size:6pt;font-family:verdana;">
							<span style="font-weight:bold;">(b)</span>
        					 Any domestic corporation or partnership controlling or controlled by the U.S. person filing this return
     				</div>
						<div class="IRS8865_MoneyFieldMid" style="height:20mm;padding-top:8px;text-align:center;font-size:6pt;font-family:verdana;">
							<span style="font-weight:bold;">(c)</span>
				         Any other foreign corporation or partnership controlling or controlled by the U.S. person filing this return
			         </div>
						<div class="IRS8865_MoneyField" style="height:20mm;text-align:center;font-size:6pt;font-family:verdana;">
							<span style="font-weight:bold;">(d)</span>
				         Any U.S. person with a 10% or more direct interest in the controlled foreign partnership (other than the U.S. person filing this return)
				     </div>
					</div>
					<!-- Schedule N line 1 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">1</div>
						<div class="IRS8865_LineDescSchN">
				       Sales of inventory
        					<span class="IRS8865_DotSpacing">.................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfInvntryPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfInvntryPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfInvntryPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfInvntryPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 2 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">2</div>
						<div class="IRS8865_LineDescSchN">

       Sales of property rights (patents, trademarks, etc.)

        <span class="IRS8865_DotSpacing">...</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfPropertyPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfPropertyPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfPropertyPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SalesOfPropertyPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 3 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">3</div>
						<div class="IRS8865_LineDescSchN">Compensation received for technical, managerial, </div>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN">

       engineering, construction, or like services

        <span class="IRS8865_DotSpacing">......</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompRcvdPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompRcvdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompRcvdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompRcvdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 4 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">4</div>
						<div class="IRS8865_LineDescSchN">

       Commissions received

        <span class="IRS8865_DotSpacing">...............</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsRcvdPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsRcvdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsRcvdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsRcvdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 5 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">5</div>
						<div class="IRS8865_LineDescSchN">

       Rents, royalties, and license fees received

        <span class="IRS8865_DotSpacing">......</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 6 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">6</div>
						<div class="IRS8865_LineDescSchN">

       Distributions received

        <span class="IRS8865_DotSpacing">...............</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistriReceivedPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistriReceivedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistriReceivedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistriReceivedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 7 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">7</div>
						<div class="IRS8865_LineDescSchN">

       Interest received

        <span class="IRS8865_DotSpacing">.................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IntReceivedPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IntReceivedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IntReceivedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IntReceivedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 8 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">8</div>
						<div class="IRS8865_LineDescSchN">

       Other

        <span class="IRS8865_DotSpacing">......................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherReceivedPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherReceivedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherReceivedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherReceivedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 9 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex" style="border-bottom-width:1px;">9</div>
						<div class="IRS8865_LineDescSchN" style="border-bottom-width:1px;">

       Add lines 1 through 8

        <span class="IRS8865_DotSpacing">...............</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllReceivedTotPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllReceivedTotPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllReceivedTotPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllReceivedTotPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 10 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">10</div>
						<div class="IRS8865_LineDescSchN">

       Purchases of inventory

        <span class="IRS8865_DotSpacing">...............</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsOfInvntryPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsOfInvntryPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsOfInvntryPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsOfInvntryPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 11 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">11</div>
						<div class="IRS8865_LineDescSchN">

       Purchases of tangible property other than inventory

        <span class="IRS8865_DotSpacing">..</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsTngblPropPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsTngblPropPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsTngblPropPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsTngblPropPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 12 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">12</div>
						<div class="IRS8865_LineDescSchN">

       Purchases of property rights (patents, trademarks, etc.)

        <span class="IRS8865_DotSpacing"/>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsPropRghtsPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsPropRghtsPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsPropRghtsPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrchsPropRghtsPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 13 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">13</div>
						<div class="IRS8865_LineDescSchN">Compensation paid for technical, managerial,

   </div>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN">

        engineering, construction, or like services

        <span class="IRS8865_DotSpacing">......</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompensationPdPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompensationPdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompensationPdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CompensationPdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 14 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">14</div>
						<div class="IRS8865_LineDescSchN">

       Commissions paid

        <span class="IRS8865_DotSpacing">.................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsPaidPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsPaidPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsPaidPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CommissionsPaidPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 15 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">15</div>
						<div class="IRS8865_LineDescSchN">

       Rents, royalties, and license fees paid

        <span class="IRS8865_DotSpacing">........</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPdPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RentRyltsLcnsPdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 16 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">16</div>
						<div class="IRS8865_LineDescSchN">

       Distributions paid

        <span class="IRS8865_DotSpacing">..................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistributionsPdPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistributionsPdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistributionsPdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DistributionsPdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 17 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">17</div>
						<div class="IRS8865_LineDescSchN">

       Interest paid

        <span class="IRS8865_DotSpacing">....................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InterestPaidPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InterestPaidPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InterestPaidPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InterestPaidPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 18 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">18</div>
						<div class="IRS8865_LineDescSchN">

       Other

        <span class="IRS8865_DotSpacing">.......................</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherPaidPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherPaidPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherPaidPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherPaidPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 19 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex" style="border-bottom-width:1px;">19</div>
						<div class="IRS8865_LineDescSchN" style="border-bottom-width:1px;">

       Add lines 10 through 18

        <span class="IRS8865_DotSpacing">..............</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllPaidTotalPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllPaidTotalPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllPaidTotalPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AllPaidTotalPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 20 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">20</div>
						<div class="IRS8865_LineDescSchN">

   Amounts borrowed (enter the maximum loan balance

   </div>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex"/>
						<div class="IRS8865_LineDescSchN">

       during the year). see instructions

        <span class="IRS8865_DotSpacing">.........</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsBorrowedPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsBorrowedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsBorrowedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsBorrowedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule N line 21 -->
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex">21</div>
						<div class="IRS8865_LineDescSchN">

   Amounts loaned (enter the maximum loan balance

   </div>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyFieldMid" style="border-bottom-width:0px;"/>
						<div class="IRS8865_MoneyField" style="border-bottom-width:0px;"/>
					</div>
					<div class="IRS8865_LineContainer">
						<div class="IRS8865_LineIndex" style="border-bottom-width:1px;"/>
						<div class="IRS8865_LineDescSchN" style="border-bottom-width:1px;">

       during the year). see instructions

        <span class="IRS8865_DotSpacing">.........</span>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsLoanedPrtnrOthRltdEnt/USPersonAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsLoanedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyFieldMid">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsLoanedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
							</xsl:call-template>
						</div>
						<div class="IRS8865_MoneyField">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmountsLoanedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<!--  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&   -->
				<!-- Page Break and Footer-->
				<div class="pageEnd" style="width:187mm;padding-top:.5mm;">
					<div style="float:right;">
						<span style="width:80px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">8865</span> (2013)
    </div>
				</div>
				<!-- END Page Break and Footer-->
				<!-- Left over data -->
				<!-- BEGIN Left Over Table -->
				<div class="styLeftOverTitleLine" id="LeftoverData">
					<div class="styLeftOverTitle">

      Additional Data        

    </div>
					<div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
					</div>
				</div>
				<table class="styLeftOverTbl">
					<xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Form 8865, Top Left Margin - Change Annual Accounting Period</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/@changeAnnualAccountingPeriodCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</table>
				<!-- Additonal Data Table for separated data from Line E -->
				<xsl:if test="($Print = $Separated) and (count($FormData/OtherPartnersInformationGrp) &gt; 2)">
					<span class="styRepeatingDataTitle">
            Form 8865, Line E - Information about certain other partners
          </span>
					<table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th scope="col" rowspan="2" class="styDepTblCell" style="width:58mm">
									<span style="font-weight:bold;">(1) </span>Name
                </th>
								<th scope="col" rowspan="2" class="styDepTblCell" style="width:50mm">
									<span style="font-weight:bold;">(2) </span>Address
                </th>
								<th scope="col" rowspan="2" class="styDepTblCell" style="width:40mm">
									<span style="font-weight:bold;">(3) </span>Identifying number
                </th>
								<th scope="col" colspan="3" class="styDepTblCell" style="width:42mm">
									<span style="font-weight:bold;">(4)</span> Check applicable box(es)
                </th>
							</tr>
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:14mm">Category 1</th>
								<th class="styDepTblCell" scope="col" style="width:14mm">Category 2</th>
								<th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;">Constructive owner</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/OtherPartnersInformationGrp">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="text-align:left;width:58mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PartnerName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space(PartnerName/BusinessNameLine2)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnerName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styDepTblCell" style="text-align:left;width:50mm;">
										<xsl:choose>
											<xsl:when test="PartnerUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="PartnerUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="PartnerForeignAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td style="text-align:center;width:40mm; border:1px solid black;">
										<xsl:choose>
											<xsl:when test="PartnerSSN">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="PartnerSSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="PartnerMissingEINReasonCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartnerMissingEINReasonCd"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="PartnerEIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td style="text-align:center;width:14mm; border:1px solid black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Category1Ind"/>
										</xsl:call-template>
									</td>
									<td style="text-align:center;width:14mm; border:1px solid black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Category2Ind"/>
										</xsl:call-template>
									</td>
									<td style="text-align:center;width:20mm; border:1px solid black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConstructiveOwnerInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Line E separated data -->
				<!-- Additonal Data Table for separated data from Schedule A -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp) &gt;5)">
					<span class="styRepeatingDataTitle">
						<br/>Form 8865, Schedule A - Constructive Ownership of Partnership Interest 
          </span>
					<table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th scope="col" class="styDepTblCell" style="width:58mm">Name</th>
								<th scope="col" class="styDepTblCell" style="width:50mm">Address</th>
								<th scope="col" class="styDepTblCell" style="width:40mm">Identifying number (if any)</th>
								<th scope="col" class="styDepTblCell" style="width:20mm">Check if foreign person</th>
								<th scope="col" class="styDepTblCell" style="width:20mm">Check if direct partner</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/IRS8865ScheduleA/ConstructiveOwnershipInfoGrp">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="text-align:left;width:58mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConstructiveOwnerName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space(ConstructiveOwnerName/BusinessNameLine2)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ConstructiveOwnerName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styDepTblCell" style="text-align:left;width:50mm">
										<xsl:choose>
											<xsl:when test="ConstructiveOwnerUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="ConstructiveOwnerUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="ConstructiveOwnerFrgnAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td style="text-align:center;width:40mm;vertical-align:center; border:1px solid black">
										<xsl:choose>
											<xsl:when test="ConstructiveOwnerSSN">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="ConstructiveOwnerSSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="MissingEINReasonCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="ConstructiveOwnerEIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td style="text-align:center;width:20mm;vertical-align:center; border:1px solid black">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConstructiveOwnerIsFrgnPrsnInd"/>
										</xsl:call-template>
									</td>
									<td style="text-align:center;width:20mm;border:1px solid black; ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConstructiveOwnerIsDrtPrtnrInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Schedule A separated data -->
				<!-- Additonal Data Table for separated data from Schedule A1 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp) &gt;5)">
					<span class="styRepeatingDataTitle">
						<br/>Form 8865, Schedule A-1 - Certain Partners of Foreign Partnership
          </span>
					<table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th scope="col" class="styDepTblCell">Name</th>
								<th scope="col" class="styDepTblCell">Address</th>
								<th scope="col" class="styDepTblCell">Identifying number (if any)</th>
								<th scope="col" class="styDepTblCell">Check if foreign person</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/IRS8865ScheduleA1/CertainPartnersInformationGrp">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="text-align:left;font-size:7pt;">
										<xsl:choose>
										  <xsl:when test="normalize-space(CertainPartnerPersonNm)!=''">  
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="CertainPartnerPersonNm"/>
											</xsl:call-template>  
										  </xsl:when>
										  <xsl:otherwise>   
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="CertainPartnerName/BusinessNameLine1"/>
											</xsl:call-template>
											<xsl:if test="normalize-space(CertainPartnerName/BusinessNameLine2)!=''">
											  <br/>
											  <xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CertainPartnerName/BusinessNameLine2"/>
											  </xsl:call-template>
											</xsl:if>
										  </xsl:otherwise>
										</xsl:choose> 
									</td>
									<td class="styDepTblCell" style="text-align:left;font-size:7pt;">
										<xsl:choose>
											<xsl:when test="CertainPartnerUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="CertainPartnerUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="CertainPartnerForeignAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td style="text-align:center;width:40mm;border:1px solid black;">
										<xsl:choose>
											<xsl:when test="CertainPartnerSSN">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="CertainPartnerSSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="MissingEINReasonCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="CertainPartnerEIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td style="text-align:center;width:20mm;border:1px solid black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CertainPartnerIsForeignPrsnInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Schedule A1 separated data -->
				<!-- Additonal Data Table for separated data from Schedule A2 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS8865ScheduleA2/AffiliationScheduleGrp) &gt;5)">
					<span class="styRepeatingDataTitle">
						<br/>Form 8865, Schedule A-2 - Affiliation Schedule 
          </span>
					<table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th scope="col" class="styDepTblCell">Name</th>
								<th scope="col" class="styDepTblCell">Address</th>
								<th scope="col" class="styDepTblCell">EIN (if any)</th>
								<th scope="col" class="styDepTblCell">Total ordinary income or loss</th>
								<th scope="col" class="styDepTblCell">Check if foreign partnership</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/IRS8865ScheduleA2/AffiliationScheduleGrp">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="text-align:left;font-size:7pt;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space(PartnershipName/BusinessNameLine2)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styDepTblCell" style="text-align:left;font-size:7pt;">
										<xsl:choose>
											<xsl:when test="PartnershipUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="PartnershipUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="PartnershipForeignAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="IRS8865_SchA2TabIDCol" style="border:1px solid black;">
										<xsl:if test="PartnershipSSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="PartnershipSSN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="PartnershipEIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="PartnershipEIN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="MissingSSNEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td style="text-align:right;width:32mm;border:1px solid black;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalOrdinaryIncomeOrLossAmt"/>
										</xsl:call-template>
										<span style="width:1mm"/>
									</td>
									<td style="text-align:center;width:20mm;border:1px solid black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PartnershipIsForeignPersonInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Schedule A2 separated data -->
				<!-- Additonal Data Table for separated data from Schedule D Part I REMOVED-->
				
				<!-- Additonal Data Table for separated data from Schedule D Part II REMOVED-->
				
				<!-- Additonal Data Table for separated data from Schedule K, Line 13d -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS8865ScheduleK/Section59e2Expenditures) &gt;1) ">
					<span class="styRepeatingDataTitle">
						<br/>Form 8865, Schedule K, Line 13d - Section 59(e)(2) expenditures:
          </span>
					<table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th scope="col" class="styDepTblCell">Type</th>
								<th scope="col" class="styDepTblCell">Amount</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/IRS8865ScheduleK/Section59e2Expenditures">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="text-align:left;font-size:7pt;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Description"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:right;font-size:7pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Amount"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<tr class="styDepTblHdr">
								<td class="styDepTblCell" style="text-align:left; font-weight: bold">Total</td>
								<td class="styDepTblCell" style="text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="WhiteFont">true</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleK/TotalSection59e2Expenditures"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Schedule K, Line 13d separated data -->
				<!-- Tanuja : in reference to defect number 2393  -->
				<xsl:call-template name="ShowIOIS">
					<xsl:with-param name="ForBlock" select="$FormData/IRS8865ScheduleK/CreditsRelatedToRentalREActy"/>
					<xsl:with-param name="Desc">

      Credits related to Rental Real Estate Activities (Followed from Schedule K Line 12c)  

    </xsl:with-param>
					<xsl:with-param name="SpanWidth">

      103mm

    </xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="ShowIOIS">
					<xsl:with-param name="ForBlock" select="$FormData/IRS8865ScheduleK/CreditsRelatedToOthRentalActy"/>
					<xsl:with-param name="Desc">

      Itemized Credits Related to Other Rental Activities (Followed from Schedule K Line 12d)

    </xsl:with-param>
					<xsl:with-param name="SpanWidth">

      103mm

    </xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="ShowIOIS">
					<xsl:with-param name="ForBlock" select="$FormData/IRS8865ScheduleM1/IncomeNotRecordedItemized"/>
					<xsl:with-param name="Desc">

      Itemized Income Subject to Tax Not Recorded on Books This Year (Followed from Schedule M-1 Line 2)

    </xsl:with-param>
					<xsl:with-param name="SpanWidth">

      133mm

    </xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="ShowIOIS">
					<xsl:with-param name="ForBlock" select="$FormData/IRS8865ScheduleM1/ItemizedExpenseNotDeducted"/>
					<xsl:with-param name="Desc">

      Itemized Expense Recorded on Books This Year Not Deducted on This Return (Followed from Schedule M-1 Line 4)

    </xsl:with-param>
					<xsl:with-param name="SpanWidth">

      154mm

    </xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="ShowIOIS">
					<xsl:with-param name="ForBlock" select="$FormData/IRS8865ScheduleM1/ItemizedIncomeRecordedNotIncld"/>
					<xsl:with-param name="Desc">

      Itemized Other Income Recorded on Books And Not Included on Schedule K (Followed from Schedule M-1 Line 6)

    </xsl:with-param>
					<xsl:with-param name="SpanWidth">

      152mm

    </xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="ShowIOIS">
					<xsl:with-param name="ForBlock" select="$FormData/IRS8865ScheduleM1/ItemizedDeductionNotCharged"/>
					<xsl:with-param name="Desc">

      Itemized Deduction Not Charged Against Book Income This Year (Followed from Schedule M-1 Line 7)

    </xsl:with-param>
					<xsl:with-param name="SpanWidth">

      130mm

    </xsl:with-param>
				</xsl:call-template>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="ShowIOIS">
		<xsl:param name="ForBlock"/>
		<xsl:param name="Desc"/>
		<xsl:param name="SpanWidth"/>
		<xsl:if test="count($ForBlock) &gt; 0">
			<br/>
			<br/>
			<div class="styDepTitleLine" style="width:187mm">
				<span class="styDepTitle" style="font-size:10pt;">
					<span>
						<xsl:attribute name="style">

            width:<xsl:value-of select="$SpanWidth"/></xsl:attribute>
						<xsl:value-of select="$Desc"/>
					</span>
				</span>
			</div>
			<br/>
			<table id="IOISTbl" class="styDepTbl" style="width:187mm; font-size:8pt; font-family:arial">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">
						<th scope="col" style="font-weight:bold; font-size:8pt">Description</th>
						<th scope="col" style="font-weight:bold; font-size:8pt">Amount</th>
					</tr>
				</thead>
				<tfoot/>
				<tbody>
					<xsl:for-each select="$ForBlock">
						<tr>
							<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<td class="styDepTblCell" align="left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="Description"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" align="right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="pM2Line4Template">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<td class="IRS8865_MTDesc">
					<span class="IRS8865_MItemSpan" style="width:95%;line-height:100%;font-size:7pt;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/OtherIncreases[$index]/Description"/>
						</xsl:call-template>
						<span style="width:4px;"/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/OtherIncreases[$index]/Amount"/>
						</xsl:call-template>
					</span>
				</td>
				<td class="IRS8865_MTdAmount">
					<span style="width:4px;"/>
				</td>
				<td class="IRS8865_MTdCent" style="border-left:0;">
					<span style="width:4px;"/>
				</td>
			</tr>
			<xsl:call-template name="pM2Line4Template">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="pM2Line7Template">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<td class="IRS8865_MTDesc" style="width:53.8mm;">
					<span class="IRS8865_MItemSpan" style="width:52.5mm;line-height:100%;font-size:7pt;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/OtherDecreases[$index]/Description"/>
						</xsl:call-template>
						<span style="width:4px;"/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS8865ScheduleM2/OtherDecreases[$index]/Amount"/>
						</xsl:call-template>
					</span>
				</td>
				<td class="IRS8865_MTdAmount" style="width:25mm;">
					<span style="width:4px;"/>
				</td>
				<td class="IRS8865_MTdCent" style="border-left:0;">
					<span style="width:4px;"/>
				</td>
			</tr>
			<xsl:call-template name="pM2Line7Template">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>