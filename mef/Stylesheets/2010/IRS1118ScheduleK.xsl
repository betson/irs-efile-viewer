<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1118ScheduleKStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1118ScheduleKData" select="$RtnDoc/IRS1118ScheduleK"/>
	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="Content-Type" content="text/html"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1118ScheduleKData)"/>
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
				<meta name="Description" content="IRS Form 1118ScheduleK"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1118ScheduleKStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1118ScheduleK">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<div class="styTBB" style="width:256mm;height:22mm;">
						<div class="styFNBox" style="width:31mm;height:22mm;">
							<div style="height:10mm;">
								<span style="font-weight:bold;height:3mm;padding-top:2.5mm;">SCHEDULE K</span>
								
								<span style="font-weight:bold;height:5mm;">(Form 1118)</span>
								            
            (December 2009)
          </div>
								<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData"/>
							</xsl:call-template>   
							<br/>
							<div style="height:8mm;">
								<span class="styAgency">Department of the Treasury</span>
								<span class="styAgency" style="width:30mm;">Internal Revenue Service</span>
							</div>    
						</div>
						<div class="styFTBox" style="width:178mm;height:25mm;">
							<div class="styMainTitle" style="height:3mm;padding-top:3mm;">Foreign Tax Carryover Reconciliation Schedule
							            <!--xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form1118ScheduleKData" />
            </xsl:call-template-->
							</div>
							<div style="text-align:center;margin-top:2mm">For calendar year 
            <span style="width: 10mm">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
								</span>,
            or other tax year beginning 
            <span style="width: 20mm">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>, 
            and ending 
            <span style="width: 20mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
							</div>
							<div class="styFBT">
								<img src="{$ImagePath}/1118SchedK_Bullet_Sm.gif" alt="bulletpoint"/>See separate instructions.</div>
							<div class="styFBT" style="height:4mm; margin-top:0px">
								<img src="{$ImagePath}/1118SchedK_Bullet_Sm.gif" alt="bulletpoint"/> Attach to Form 1118</div>
						</div>
						<div class="styTYBox" style="width:35mm;height:25mm;">
							<div style="text-align:center;padding-top:10mm;">OMB No. 1545-0122</div>
						</div>
					</div>
					<div class="styBB" style="width:256mm;">
						<div class="styNameBox" style="width:189mm;height:8mm;font-size:7pt;">
          Name of corporation
          <div>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/CorporationName/BusinessNameLine1"/>
							</xsl:call-template>
							<div>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/CorporationName/BusinessNameLine2"/>
							</xsl:call-template>
							</div>
							</div>
						</div>
						<div class="styEINBox" style="width:65mm;height:8mm;font-size:7pt;font-weight:bold;padding-left:2mm;">
          Employer identification number<br/>
							
							<span class="styNormalText">
								<xsl:choose>
									<xsl:when test="$Form1118ScheduleKData/EmployerIdentificationNumber != ''">
									<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/EmployerIdentificationNumber"/>
										</xsl:call-template>    
									</xsl:when>
									<xsl:when test="$Form1118ScheduleKData/MissingEINReason">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/MissingEINReason"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--BEGIN CATEGORY OF INCOME SECTION -->
					<div style="width:256mm;">
						<div style="width:180mm;height:3mm">
        Use a separate Schedule K (Form 1118) for each category of income listed below. Check only one box on each 
        schedule.
        </div>
						<div style="height:16mm;width:47mm;float:left;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/PassiveCategoryIncome"/>
									<xsl:with-param name="BackupName">IRS1118ScheduleKDataPassiveCategoryIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/PassiveCategoryIncome"/>
									<xsl:with-param name="BackupName">IRS1118ScheduleKDataPassiveCategoryIncome</xsl:with-param>
								</xsl:call-template>
								<span style="1mm;">Passive Category Income</span>
							</label>
							<br/>
							<br/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/GeneralCategoryIncome"/>
									<xsl:with-param name="BackupName">IRS1118ScheduleKDataGeneralLimitationIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/GeneralCategoryIncome"/>
									<xsl:with-param name="BackupName">IRS1118ScheduleKDataGeneralLimitationIncome</xsl:with-param>
								</xsl:call-template>General Category Income
          </label>
						</div>
						<div style="height:16mm;width:108mm;float:left;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Section901jIncome"/>
									<xsl:with-param name="BackupName">IRS1118ScheduleKDataSection901jIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Section901jIncome"/>
									<xsl:with-param name="BackupName">IRS1118ScheduleKDataSection901jIncome</xsl:with-param>
								</xsl:call-template>Section 901(j) Income: Name of Sanctioned Country
          </label>
							<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
							<span style="border-color:black; border-style:solid; border-right-width: 0px; border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 25mm">
							<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Section901jIncome/@nameOfSanctionedCountry"/>
								</xsl:call-template>
							</span>
							<br/>
							<br/>
							<input type="checkbox" alt="alt" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/nameOfSanctionedCountry"/>
									<xsl:with-param name="BackupName">IRS1118ScheduleKDatanameOfSanctionedCountry</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/TreatyResourcedIncome"/>
									<xsl:with-param name="BackupName">IRS1118ScheduleKDataTreatyResourcedIncome</xsl:with-param>
								</xsl:call-template>Income Re-sourced by Treaty
          </label>: Name of Country <img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
							<span style="border-color:black; border-style:solid; border-right-width: 0px; border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 30mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/TreatyResourcedIncome/@nameOfCountry"/>
								</xsl:call-template>
							</span>
							<br/>
						</div>
					</div>
					<!--		<div class="pageEnd"/>    treat this -->
					<!--END CATEGORY OF INCOME SECTION -->
					<!-- BEGIN SCHEDULE A TITLE -->
					
					
					<!-- Table one -->
					<div class="styBB" style="width:256mm;">
						<div class="styGenericDiv" style="width:3.2mm;text-align:right;">
							<!-- button display logic
							<xsl:call-template name="SetTableToggleButton">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/IncomeOrLossBeforeAdjustments"/>   
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'IBActn1' "/>
								<xsl:with-param name="imageID" select=" 'IBAimg1' "/>
								<xsl:with-param name="buttonID" select=" 'IBAbtn1' "/>
							</xsl:call-template>
							 end button display logic -->
						</div>
					</div>
					<!-- END SCHEDULE A TITLE -->
					<!-- BEGIN INCOMEORLOSS TABLE -->
					<div class="styTableContainerLandscape" id="IBActn" style="height:154mm;">
						<!-- print logic -->
						<!--	<xsl:call-template name="SetInitialState"/>    -->
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">

								<tr style="border-bottom-width:1px;border-style: solid; border-color: black;">

									<th class="styIRS1118TableCellLtr" style="width:45mm;height:15mm;font-size:3.5mm;" colspan="3" rowspan="1"> Foreign Tax Carryover Reconciliation 
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(i) </div>
										<div style="width:10mm;text-align:center;font-weight:normal">10th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(ii) </div>
										<div style="width:10mm;text-align:center;font-weight:normal">9th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(iii) </div>
										<div style="width:10mm;text-align:center;font-weight:normal">8th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(iv) </div>
										<div style="width:10mm;text-align:center;font-weight:normal">7th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(v) </div>
										<div style="width:10mm;text-align:center;font-weight:normal">6th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(vi) </div>
										<div style="width:10mm;text-align:center;font-weight:normal">5th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;border-right-width:0px;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(vii) </div>
										<div style="width:30mm;text-align:center;font-weight:normal">Subtotal (add columns (i)
										through (vi))</div>
									</th>
								</tr>
								
							</thead>
							<tfoot/>
							<tbody>
							
							
							<!-- Begin Line 1 -->
							<tr style="border-bottom-width:1px;border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:5.5mm;">1</span>
											<span style="width:43mm;font-weight:normal;">Foreign tax carryover from the
											           prior tax year (enter the amount from line 6 of the worksheet in the instructions)   
											         </span>
										</span>
									</td>
									<td class="styTableCellSmall">
													<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/TenthPrecedingTaxYear/ForeignTaxCarryover10thYr"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/NinthPrecedingTaxYear/ForeignTaxCarryover9thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/EighthPrecedingTaxYear/ForeignTaxCarryover8thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/ForeignTaxCarryover7thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SixthPrecedingTaxYear/ForeignTaxCarryover6thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:29mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FifthPrecedingTaxYear/ForeignTaxCarryover5thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Subtotal/ForeignTaxCarryoverSubtotal"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->
								
								
								<!-- Begin Line 2 -->
								<tr style="border-bottom-width:1px;border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3" style="border-bottom-width:0px;">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:3mm;">2</span>
											<span style="width:43mm;font-weight:normal;">Adjustments to line 1 (enter
description—see instructions):											         </span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:1px;">
						<!--						<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherAdjustments10thYr"/>
										</xsl:call-template>       -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:1px;">
									<!--	<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/TenthPrecedingTaxYear/OtherAdjustments10thYr"/>
										</xsl:call-template>   -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:0px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 2  -->

								<tr style="height:6mm; border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span class="styLNLeftNumBox" style="width:4mm;font-weight:bold;padding-left:2mm;padding-bottom:0mm;">a</span>
											<span style="width:43mm;font-weight:normal;padding-top:.5mm;">Carryback adjustment (see instructions)   
											         </span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:0px;">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- ****** end of line 2a -->
								<!-- Filler rows for line   -->
								
								<!-- Begin Line 2b -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span class="styLNLeftNumBox" style="width:4mm;font-weight:bold;
											padding-left:2mm;padding-bottom:0mm;">b</span>
											<span style="width:43mm;font-weight:normal;padding-top:.5mm;">Adjustments for section 905(c) redeterminations (see instructions)   
											         </span>
										</span>
									</td>

									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/TenthPrecedingTaxYear/Sect905cRedeterminationAdj"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
                                    <td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/NinthPrecedingTaxYear/Sect905cRedeterminationAdj"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
	                                   	<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/EighthPrecedingTaxYear/Sect905cRedeterminationAdj"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
                                   	<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/Sect905cRedeterminationAdj"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
                                   	<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SixthPrecedingTaxYear/Sect905cRedeterminationAdj"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
	                                  	<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FifthPrecedingTaxYear/Sect905cRedeterminationAdj"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
                                  	<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Subtotal/Sect905cRedeterminationAdjSub"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								
								<!-- End line 2b -->
								<!-- Filler rows for line 1  -->


                                    <!-- BEGIN Line 2C -->

							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
							<td class="styIRS1118TableCellLtr" colspan="3">
							
								<span style="width:53mm;">
									<span style="width:4mm;font-weight:bold;padding-bottom:0mm; padding-left:2mm;">c</span>
								<!--	    <xsl:attribute name="class">
                                                   									    
									    </xsl:attribute>-->
									    <xsl:for-each select="$Form1118ScheduleKData/OtherAdjustmentsDescription">
									    <div style="width:35mm;padding-left:5mm;">
									  	<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherAdjustments"/>
										</xsl:call-template>   
									       </div>
									       </xsl:for-each> 
											<span style="width:43mm;font-weight:normal;"/>
										</span>
										
									</td>
									

			
									<td class="styTableCellSmall">
										<xsl:for-each select="$Form1118ScheduleKData/TenthPrecedingTaxYear/ OtherAdjustments10thYr">
												<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>    
								
									<td class="styTableCellSmall">
									    <xsl:for-each select="$Form1118ScheduleKData/NinthPrecedingTaxYear/OtherAdjustments9thYr">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
									
									<td class="styTableCellSmall">
									 <xsl:for-each select="$Form1118ScheduleKData/EighthPrecedingTaxYear/OtherAdjustments8thYr">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
									<td class="styTableCellSmall">
									<xsl:for-each select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/OtherAdjustments7thYr">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
									<td class="styTableCellSmall">
									<xsl:for-each select="$Form1118ScheduleKData/SixthPrecedingTaxYear/OtherAdjustments6thYr">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
									<td class="styTableCellSmall" >
									<xsl:for-each select="$Form1118ScheduleKData/FifthPrecedingTaxYear/OtherAdjustments5thYr">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
									<xsl:for-each select="$Form1118ScheduleKData/Subtotal/OtherAdjustmentsSubtotal">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
									
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->

								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm; padding-left:2mm;">d</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
									<!--	<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
							<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>   -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
							<!--		<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>     -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
						<!--				<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>     -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:29mm;">
										<!-- Form to form link -->
										<div style="float:left; clear:none; width: 4mm">
						
										</div>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherIncomeOrLoss"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm; padding-left:2mm;">e</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:29mm;">
										<!-- Form to form link -->
								<div style="float:left; clear:none; width: 4mm">
										</div>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherIncomeOrLoss"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm; padding-left:2mm;">f</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:29mm;">
										<!-- Form to form link -->
										<div style="float:left; clear:none; width: 4mm">

										</div>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherIncomeOrLoss"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->

								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm; padding-left:2mm;">g</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:29mm;">
										<!-- Form to form link -->
										<div style="float:left; clear:none; width: 4mm">

										</div>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherIncomeOrLoss"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->
								
								<!-- Begin Line 3 -->

								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:2mm;">3</span>
											<span style="width:43mm;font-weight:normal;">Adjusted foreign tax carryover from prior tax year 
						(combine lines 1 and 2). </span>
										</span>
									</td>
									
									<!--Start here I -->
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/TenthPrecedingTaxYear/AdjForeignTaxCarryover10thYr"/>
										</xsl:call-template>    
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/NinthPrecedingTaxYear/AdjForeignTaxCarryover9thYr"/>
									<!--		<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/NinethPrecedingTaxYear/AdjForeignTaxCarryover9thYr"/>  -->
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/EighthPrecedingTaxYear/AdjForeignTaxCarryover8thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/AdjForeignTaxCarryover7thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SixthPrecedingTaxYear/AdjForeignTaxCarryover6thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FifthPrecedingTaxYear/AdjForeignTaxCarryover5thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Subtotal/AdjForeignTaxCarryoverSubtl"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 3  -->
								
								<!-- Begin Line 4 -->

								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:2mm;">4</span>
											<span style="width:43mm;font-weight:normal;">Foreign tax carryover used in current
                                                  tax year (enter as a negative number)</span>
										</span>
									</td>

									<td class="styTableCellSmall"> 
												<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/TenthPrecedingTaxYear/ForeignTaxCarryoverUsed10thYr"/>
										</xsl:call-template>   
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/NinthPrecedingTaxYear/ForeignTaxCarryoverUsed9thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/EighthPrecedingTaxYear/ForeignTaxCarryoverUsed8thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/ForeignTaxCarryoverUsed7thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SixthPrecedingTaxYear/ForeignTaxCarryoverUsed6thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:29mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FifthPrecedingTaxYear/ForeignTaxCarryoverUsed5thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Subtotal/ForeignTaxCarryoverUsedSubtl"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 4  -->
								
								<!-- Begin Line 5 -->

								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:5.5mm;">5</span>
											<span style="width:43mm;font-weight:normal;">Foreign tax carryover expired unused in current tax
							 year (enter as a negative number)</span>
										</span>
									</td>

									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/TenthPrecedingTaxYear/ForeignTaxCarryoverExpr"/>
										</xsl:call-template>    
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
	                                               border-color: black; border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
	                                               border-color: black; border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
	                                               border-color: black; border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
	                                               border-color: black; border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
	                                               border-color: black; border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Subtotal/ForeignTaxCarryoverExprSubtl"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 5  -->

								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:2mm;">6</span>
											<span style="width:43mm;font-weight:normal;">Foreign tax carryover generated in current tax year   
											         </span>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
	                                               border-color: black; border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:0px;">
										<span style="width:1px;"/>
									
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->

								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:5.5mm;">7</span>
											<span style="width:43mm;font-weight:normal;">Actual or estimated amount of line 6 to be carried back to 
								prior tax year (enter as a negative number)</span>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
	                                               border-color: black; border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:0px;">
										<span style="width:1px;"/>
									
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->
								
								
								
								<!-- Begin Line 8 -->
<!--((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:3mm;">8</span>
											<span style="width:43mm;font-weight:normal;">Foreign tax carryover to the following tax year. 
								Combine lines 3 through 7.</span>
										</span>
									</td>

									<td class="styTableCellSmall" style="text-align:center;padding-top:6mm;">
										<b>-0-</b>
									</td>
									<td class="styTableCellSmall"  style="padding-top:4mm;" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/NinthPrecedingTaxYear/FrgnTaxCyovFollowing9thYr"/>
										</xsl:call-template>   
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/EighthPrecedingTaxYear/FrgnTaxCyovFollowing8thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall"  style="padding-top:4mm;" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/FrgnTaxCyovFollowing7thYr"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall"  style="padding-top:4mm;" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SixthPrecedingTaxYear/FrgnTaxCyovFollowing6thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;"  >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FifthPrecedingTaxYear/FrgnTaxCyovFollowing5thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Subtotal/FrgnTaxCyovFollowingSubtl"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->
							</tbody>
						</table>
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
						</div>
						<div style="float:right">
          Cat. No. 51904R 
          <span style="width:140px"/>
							<b>  Schedule K (Form 1118) (12-2009) </b>
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Schedule K (Form 1118) (12-2009)</div>
						<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->
					
					<!-- BEGIN SCHEDULE A TITLE -->
					<div class="styBB" style="width:256mm;">
					<!--	<div class="styGenericDiv" style="width:3.2mm;text-align:right;">
							 button display logic -->
						<!--	<xsl:call-template name="SetTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments"/>  
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'IBActn' "/>
								<xsl:with-param name="imageID" select=" 'IBAimg' "/>
								<xsl:with-param name="buttonID" select=" 'IBAbtn' "/>
							</xsl:call-template>  -->
							<!-- end button display logic 
						</div>-->
					</div>
					<!-- END SCHEDULE A TITLE -->
					<!-- BEGIN INCOMEORLOSS TABLE --><!--check here   -->
					<div class="styTableContainerLandscape" id="IBActn" style="height:155mm;">
						<!-- print logic -->
						<!--	<xsl:call-template name="SetInitialState"/>    -->
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">

								<tr style="border-bottom-width:1px;border-style: solid; border-color: black;">
									<th class="styIRS1118TableCellLtr" style="width:50mm;height:15mm;font-size:2.9mm;" colspan="3" rowspan="1"> Foreign Tax Carryover Reconciliation (continued)
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="padding-left:5mm;width:10mm;font-weight:bold;">(viii)</div>
										<div style="width:30mm;text-align:center;font-weight:normal">Subtotal from page 1
                                                      (enter the amounts from column (vii) on page 1)</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(ix) </div>
										<div style="width:10mm;text-align:center;font-weight:normal">4th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(x) </div>
										<div style="width:10mm;text-align:center;font-weight:normal">3th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(xi) </div>
										<div style="width:10mm;text-align:center;font-weight:normal">2th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(xii) </div>
										<div style="width:10mm;text-align:center;font-weight:normal">1st Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(xiii)</div>
										<div style="width:10mm;text-align:center;font-weight:normal;height:4mm;
										padding-top:3mm;">Current Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;border-right-width:0px;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(xiv) </div>
										<div style="width:20mm;text-align:center;font-weight:normal">Totals (add columns (viii)
                                                     through (xiii)</div>
									</th>
								</tr>
								<tr>
								</tr>
							</thead>
							<tfoot/>
							<tbody>

                                                                <!-- *********START HERE 2********** -->
								<tr style="height:6mm;border-bottom-width:1px;border-style: solid; border-color: black">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:5.5mm;">1</span>
											<span style="width:43mm;font-weight:normal;">Foreign tax carryover from the
											           prior tax year (enter the amount from line 6 ofthe worksheet in the instructions)   
											         </span>
										</span>
									</td>
									<td class="styTableCellSmall">  
												<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SubtotalFromPage1/ForeignTaxCarryoverSubtotal"/>
										</xsl:call-template>    
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FourthPrecedingTaxYear/ForeignTaxCarryover4thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/ThirdPrecedingTaxYear/ForeignTaxCarryover3rdYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SecondPrecedingTaxYear/ForeignTaxCarryover2ndYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FirstPrecedingTaxYear/ForeignTaxCarryover1stYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall"  style="border-left-width:0px;border-bottom-width:1px;border-right-width:1px;">
									    <span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Totals/ForeignTaxCarryoverTotals"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!--End of row 1  -->
								<!-- Begin row  2 -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
								<tr style="height:6mm;border-style: solid; border-color: black; ">
									<td class="styIRS1118TableCellLtr" colspan="3" style="border-bottom-width:0px;border-right-width:1px;">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:3mm;">2</span>
											<span style="width:43mm;font-weight:normal;">Adjustments to line 1 (enter
description—see instructions):											         </span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:1px;">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:1px;">
		<!--								<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>  -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:1px;">
								<!--		<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>   -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:0px;border-right-width:1px;">
								<!--		<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall"  style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-right-width:1px;border-left-width:0px;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
									<!--	<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>   -->
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- End of  line 2  -->
								<!-- Begin Line 2a -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
					<tr style="height:6mm; border-bottom-width:1px; border-style: solid; border-color: black;">
						<td class="styIRS1118TableCellLtr" colspan="3">
							<span style="width:53mm;">
			                    <span class="styLNLeftNumBox" style="width:4mm;font-weight:bold;padding-left:2mm;padding-bottom:0mm;">a</span>
											<span style="width:43mm;font-weight:normal;padding-top:.5mm;">Carryback adjustment (see instructions)   
											         </span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
	                                               border-color: black; border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
							       </td>
                                          <td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
	                                               border-color: black; border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
							       </td>
                                          <td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
	                                               border-color: black; border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>
							       </td>
                                          <td class="styTableCellSmall"  style="border-bottom-width:1px;">
                                                 <xsl:call-template name="PopulateAmount">
                                                 <xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FirstPrecedingTaxYear/CarrybackAdjustment"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Totals/CarrybackAdjustmentTotal"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- end of line 2a -->
								<!-- Begin Line 2b   -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span class="styLNLeftNumBox" style="width:4mm;font-weight:bold;
											padding-left:2mm;padding-bottom:0mm;">b</span>
											<span style="width:43mm;font-weight:normal;padding-top:.5mm;">Adjustments for 
											section 905(c) redeterminations (see instructions)   
											         </span>
										</span>
									</td>
								<td class="styTableCellSmall"  style="border-bottom-width:1px;">
			                               <xsl:call-template name="PopulateAmount">
                                                 <xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SubtotalFromPage1/Sect905cRedeterminationAdjSub"/>
										</xsl:call-template>					
                                            <span style="width:1px;"/>
							       </td>
								<td class="styTableCellSmall"  style="border-bottom-width:1px;">
									             <xsl:call-template name="PopulateAmount">
                                                 <xsl:with-param name="TargetNode" 
                                                 select="$Form1118ScheduleKData/FourthPrecedingTaxYear/Sect905cRedeterminationAdj"/>
										</xsl:call-template>
                                            <span style="width:1px;"/>
							       </td>
								<td class="styTableCellSmall"  style="border-bottom-width:1px;">
             <xsl:call-template name="PopulateAmount">
                                                 <xsl:with-param name="TargetNode" 
                                                 select="$Form1118ScheduleKData/ThirdPrecedingTaxYear/Sect905cRedeterminationAdj"/>
										</xsl:call-template>								
                                            <span style="width:1px;"/>
							       </td>
                                          <td class="styTableCellSmall"  style="border-bottom-width:1px;">
                                                 <xsl:call-template name="PopulateAmount">
                                                 <xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SecondPrecedingTaxYear/Sect905cRedeterminationAdj"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
                                          <td class="styTableCellSmall"  style="border-bottom-width:1px;">
                                                 <xsl:call-template name="PopulateAmount">
                                                 <xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FirstPrecedingTaxYear/Sect905cRedeterminationAdj"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Totals/Sect905cRedeterminationAdjTot"/>
										</xsl:call-template> 
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- End row 2b  -->
								<!-- Begin row 2c -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
                                <tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">		
							          <td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm; padding-left:2mm;">c</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall">
									<xsl:for-each select=" $Form1118ScheduleKData/SubtotalFromPage1/OtherAdjustmentsSubtotal">
												<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>    
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
									<td class="styTableCellSmall">
									<xsl:for-each select="$Form1118ScheduleKData/FourthPrecedingTaxYear/OtherAdjustments4thYr">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
									<td class="styTableCellSmall">
									<xsl:for-each select=" $Form1118ScheduleKData/ThirdPrecedingTaxYear/OtherAdjustments3rdYr">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
									<td class="styTableCellSmall">
									<xsl:for-each select="$Form1118ScheduleKData/SecondPrecedingTaxYear/OtherAdjustments2ndYr">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
									<td class="styTableCellSmall">
									<xsl:for-each select="$Form1118ScheduleKData/FirstPrecedingTaxYear/OtherAdjustments1stYr">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
                                    <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="width:25mm;  border-right-width:0px">
									<xsl:for-each select="$Form1118ScheduleKData/Totals/OtherAdjustmentsTotal">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									<span style="width:25mm;"/>
										</xsl:for-each>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!--End row 2c -->
								
								<!-- Begin row 2d -->

								
				<!--	<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>     -->

								
																<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm; padding-left:2mm;">d</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="width:25mm;  border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
							       <!--End row 2d  -->
							       <!-- Begin row 2e -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
					<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
						<td class="styIRS1118TableCellLtr" colspan="3">
						<span style="width:53mm;">
									<span style="width:4mm;font-weight:bold;padding-bottom:0mm; padding-left:2mm;">e</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="width:25mm;  border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- End row 2e -->
								<!-- Begin row 2f -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm; padding-left:2mm;">f</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="width:25mm;  border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- End row 2f  -->
								<!-- Begin row 2g -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm; padding-left:2mm;">g</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall">
										<!--			<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
										</xsl:call-template>    -->
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="width:25mm;  border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!--End row 2g  -->
								
								<!--Begin row 3 -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
					<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
						<td class="styIRS1118TableCellLtr" colspan="3">
							<span style="width:53mm;">
                                         <span style="width:4mm;font-weight:bold;padding-bottom:10mm;">3</span>
                                         <span style="width:43mm;font-weight:normal;">Adjusted foreign tax carryover from prior
                                          tax year (combine lines 1 and 2).  Enter the column (xiv) total on the
                                           current year Form 1118, Schedule B, Part II, line 5.</span>
										</span>
									</td>

									<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SubtotalFromPage1/AdjForeignTaxCarryoverSubtl"/>
										</xsl:call-template>   
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FourthPrecedingTaxYear/AdjForeignTaxCarryover4thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/ThirdPrecedingTaxYear/AdjForeignTaxCarryover3rdYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SecondPrecedingTaxYear/AdjForeignTaxCarryover2ndYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FirstPrecedingTaxYear/AdjForeignTaxCarryover1stYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
                                    <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="width:25mm;  border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Totals/AdjForeignTaxCarryoverTotal"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- End row 3  -->
								<!-- Begin row 4 -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:2mm;">4</span>
											<span style="width:43mm;font-weight:normal;">Foreign tax carryover used in current
                                                  tax year (enter as a negative number)</span>
										</span>
									</td>
									<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SubtotalFromPage1/ForeignTaxCarryoverUsedSubtl"/>
										</xsl:call-template>    
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FourthPrecedingTaxYear/ForeignTaxCarryoverUsed4thYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/ThirdPrecedingTaxYear/ForeignTaxCarryoverUsed3rdYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SecondPrecedingTaxYear/ForeignTaxCarryoverUsed2ndYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FirstPrecedingTaxYear/ForeignTaxCarryoverUsed1stYr"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="width:25mm;  border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Totals/ForeignTaxCarryoverUsedTotal"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 4  -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:5.5mm;">5</span>
											<span style="width:43mm;font-weight:normal;">Foreign tax carryover expired unused in current tax
							 year (enter as a negative number)</span>
										</span>
									</td>
									<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SubtotalFromPage1/ForeignTaxCarryoverExprSubtl"/>
										</xsl:call-template>   
										<span style="width:1px;"/>
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Totals/ForeignTaxCarryoverExprTotal"/>
										</xsl:call-template> 
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 5  -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:2mm;">6</span>
											<span style="width:43mm;font-weight:normal;">Foreign tax carryover generated in current tax year   
											         </span>
										</span>
									</td>

                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/CurrentTaxYear/ForeignTaxCarryoverGen"/>
										</xsl:call-template>   
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Totals/ForeignTaxCarryoverGenTotal"/>
										</xsl:call-template>   
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->
								<!--								<xsl:if test="(count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">   -->
								<!--									<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">   -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:5.5mm;">7</span>
											<span style="width:43mm;font-weight:normal;">Actual or estimated amount of line 6 to be carried back to 
								prior tax year (enter as a negative number)</span>
										</span>
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
                                             <td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
                                                   border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px;"/>  
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/CurrentTaxYear/TentAmtToBeCarriedBack"/>
										</xsl:call-template>   
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Totals/TentAmtToBeCarriedBackTotal"/>
										</xsl:call-template>    
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:3mm;">8</span>
											<span style="width:43mm;font-weight:normal;">Foreign tax carryover to the following tax  
											year. Combine lines 3 through 7.</span>
										</span>
									</td>
									<td class="styTableCellSmall" >
				<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SubtotalFromPage1/FrgnTaxCyovFollowingSubtotal"/>
										</xsl:call-template>   
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FourthPrecedingTaxYear/FrgnTaxCyovFollowing4thYr"/>
										</xsl:call-template>   
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/ThirdPrecedingTaxYear/FrgnTaxCyovFollowing3rdYr"/>
										</xsl:call-template>    
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SecondPrecedingTaxYear/FrgnTaxCyovFollowing2ndYr"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/FirstPrecedingTaxYear/FrgnTaxCyovFollowing1stYr"/>
										</xsl:call-template>  
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/CurrentTaxYear/FrgnTaxCyovFollowingCurrentYr"/>
										</xsl:call-template>    
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/Totals/FrgnTaxCyovFollowingTotal"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--	</xsl:for-each>   -->
								<!--		</xsl:if>    -->
								<!-- Filler rows for line 1  -->
							</tbody>
						</table>
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
						</div>
						<div style="float:right">
          Cat. No. 51904R 
          <span style="width:140px"/>
							<b>  Schedule K (Form 1118) (12-2009) </b>
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2009)</div>
						<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->					
					
					
					
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="pageEnd"/>
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
	<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>

				</form>
			</body>
		</html>
	</xsl:template>
	
	
	
</xsl:stylesheet>
