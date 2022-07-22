<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="FormData" select="$RtnDoc/W2CM"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$FormData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="ShowLine12Items">
		<table id="Line12Tbl" class="styDepTbl" style="font-size:7pt;width:187mm;table-layout:fixed;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:10mm;">Line Number</th>
					<th class="styDepTblCell" scope="col" style="width:80mm;">Employers Use Code</th>
					<th class="styDepTblCell" scope="col" style="width:90mm;">Employers Use Amount</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$FormData/NonUSEmployersUseGrp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:center;width:10mm;">
							12<xsl:number format="a" value="position()"/>
						</td>
						<td class="styDepTblCell" style="text-align:center;width:80mm;padding:0px 0px 0px 0px;">
							<div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:80mm;height:auto;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="EmployersUseCd"/>
								</xsl:call-template>
							</div>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:90mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="ShowLine14Items">
		<table id="Line14Tbl" class="styDepTbl" style="font-size:7pt;width:187mm;table-layout:fixed;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:10mm;">Line Number</th>
					<th class="styDepTblCell" scope="col" style="width:130mm;">Description</th>
					<th class="styDepTblCell" scope="col" style="width:40mm;">Amount</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$FormData/OtherDeductsBenefits">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:center;width:10mm;">
							14<xsl:number format="a" value="position()"/>
						</td>
						<td class="styDepTblCell" style="text-align:left;width:130mm;padding:0px 0px 0px 0px;">
							<div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:130mm;height:auto;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="Description"/>
								</xsl:call-template>
							</div>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:40mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amount"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="$depDocTitle"/>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<div class="styDepTitle" style="width:92mm">
						<xsl:value-of select="$depDocTitle"/>
					</div>
				</div>
				<span style="width:187mm;padding-left:28mm">
					<xsl:call-template name="PopulateDepCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
					</xsl:call-template>
				</span>
					<!-- Void Indicator -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>Void Indicator Checkbox: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/VoidInd"/>
									<xsl:with-param name="BackupName">FormDataVoidInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/VoidInd"/>
									<xsl:with-param name="BackupName">FormDataVoidInd</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
				<xsl:if test="$FormData/EmployeeSSN">
					<!-- (a) SSN of Employee -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>(a) - SSN of Employee: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$FormData/EmployeeSSN"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<!-- (b) Employer EIN -->
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="width:94mm;float:left">
						<b>(b) - Employer EIN: </b>
					</div>
					<div class="styExplanationLine" style="width:90mm;float:left;">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$FormData/EmployerEIN"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- (c) Employer Name Control -->
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="width:94mm;float:left">
						<b>(c) - Employer Name Control: </b>
					</div>
					<div class="styExplanationLine" style="width:90mm;float:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/EmployerNameControl"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- (c) Employer Name -->
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="width:94mm;float:left">
						<b>(c) - Employer Name: </b>
					</div>
					<div class="styExplanationLine" style="width:90mm;float:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/EmployerName/BusinessNameLine1"/>
						</xsl:call-template>
						<br/>
						<xsl:if test="$FormData/EmployerName/BusinessNameLine2">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/EmployerName/BusinessNameLine2"/>
						</xsl:call-template>
						</xsl:if>
					</div>
				</div>
				<xsl:choose>
					<xsl:when test="$FormData/EmployerUSAddress">
						<!-- (c) Employer US Address -->
						<div class="styTopSectionLine">
							<div class="styTopSectionLineLbl" style="width:94mm;float:left">
								<b>(c) - Employer US Address: </b>
							</div>
							<div class="styExplanationLine" style="width:90mm;float:left;">
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$FormData/EmployerUSAddress"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:when test="$FormData/EmployerOtherForeignAddress">
						<!-- (c) Employer Other Foreign Address -->
						<div class="styTopSectionLine">
							<div class="styTopSectionLineLbl" style="width:94mm;float:left">
								<b>(c) - Employer Other Foreign Address: </b>
							</div>
							<div class="styExplanationLine" style="width:90mm;float:left;word-wrap:break-word;">
								<xsl:call-template name="PopulateForeignAddressTemplate">
									<xsl:with-param name="TargetNode" select="$FormData/EmployerOtherForeignAddress"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
				</xsl:choose>
				<xsl:if test="$FormData/ControlNumber">
					<!-- (d) Control Number -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>(d) - Control Number: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ControlNumber"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<!-- (e) Employee Name -->
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="width:94mm;float:left">
						<b>(e) - Employee Name: </b>
					</div>
					<div class="styExplanationLine" style="width:90mm;float:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/EmployeeName"/>
						</xsl:call-template>
					</div>
				</div>
				<xsl:choose>
					<xsl:when test="$FormData/EmployerUSAddress">
						<!-- (f) Employee US address -->
						<div class="styTopSectionLine">
							<div class="styTopSectionLineLbl" style="width:94mm;float:left">
								<b>(f) - Employee US address: </b>
							</div>
							<div class="styExplanationLine" style="width:90mm;float:left;">
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$FormData/EmployeeUSAddress"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:when test="$FormData/EmployerOtherForeignAddress">
						<!-- (f) Employee Foreign Address -->
						<div class="styTopSectionLine">
							<div class="styTopSectionLineLbl" style="width:94mm;float:left">
								<b>(f) - Employee Foreign Address: </b>
							</div>
							<div class="styExplanationLine" style="width:90mm;float:left;word-wrap:break-word;">
								<xsl:call-template name="PopulateForeignAddressTemplate">
									<xsl:with-param name="TargetNode" select="$FormData/EmployeeOtherForeignAddress"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
				</xsl:choose>
				<xsl:if test="$FormData/WagesAmt">
					<!-- 1 - Wages Amount -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>1 - Wages Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/CNMIWithholdingAmt">
					<!-- 2 - CNMI Withholding Amount -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>2 - CNMI Withholding Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CNMIWithholdingAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/SocialSecurityWagesAmt">
					<!-- 3 - Social Security Wages Amount -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>3 - Social Security Wages Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/SocialSecurityTaxAmt">
					<!-- 4 - Social Security Tax Amount -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>4 - Social Security Tax Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/MedicareWagesAndTipsAmt">
					<!-- 5 - Medicare Wages And Tips Amount -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>5 - Medicare Wages And Tips Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MedicareWagesAndTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/MedicareTaxWithheldAmt">
					<!-- 6 - Medicare Tax Withheld Amount -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>6 - Medicare Tax Withheld Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MedicareTaxWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/SocialSecurityTipsAmt">
					<!-- 7 - Social Security Tips Amount -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>7 - Social Security Tips Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/AllocatedTipsAmt">
					<!-- 8 - Allocated Tips Amount -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>8 - Allocated Tips Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllocatedTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/AdvanceEICPaymentAmt">
					<!-- 9 - Advance EIC Payment Amount-->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>9 - Advance EIC Payment Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdvanceEICPaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/DependentCareBenefitsAmt">
					<!-- 10 - Dependent Care Benefits Amount-->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>10 - Dependent Care Benefits Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DependentCareBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/NonqualifiedPlansAmt">
					<!-- 11 - Nonqualified Plans Amount-->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>11 - Nonqualified Plans Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NonqualifiedPlansAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/NonUSEmployersUseGrp">
					<br/>
					<xsl:call-template name="ShowLine12Items"/>
				</xsl:if>
				<xsl:if test="$FormData/StatutoryEmployeeInd">
					<!-- 13 - Statutory Employee Indicator Checkbox -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>13 - Statutory Employee Indicator Checkbox: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/StatutoryEmployeeInd"/>
									<xsl:with-param name="BackupName">FormDataStatutoryEmployeeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/StatutoryEmployeeInd"/>
									<xsl:with-param name="BackupName">FormDataStatutoryEmployeeInd</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/RetirementPlanInd">
					<!-- 13 - Retirement Plan Indicator Checkbox -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>13 - Retirement Plan Indicator Checkbox: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/RetirementPlanInd"/>
									<xsl:with-param name="BackupName">FormDataRetirementPlanInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/RetirementPlanInd"/>
									<xsl:with-param name="BackupName">FormDataRetirementPlanInd</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/ThirdPartySickPayInd">
					<!-- 13 - Third Party Sick Pay Indicator Checkbox -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>13 - Third Party Sick Pay Indicator Checkbox: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartySickPayInd"/>
									<xsl:with-param name="BackupName">FormDataThirdPartySickPayInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartySickPayInd"/>
									<xsl:with-param name="BackupName">FormDataThirdPartySickPayInd</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/OtherDeductsBenefits">
					<br/>
					<xsl:call-template name="ShowLine14Items"/>
				</xsl:if>
				<xsl:if test="$FormData/CNMIOtherDeductsBenefitCd">
					<!-- 14(b) - CNMI Other Deductions Benefit Code -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>14(b) - CNMI Other Deductions Benefit Code: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CNMIOtherDeductsBenefitCd"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/CNMITaxIdNumber">
					<!-- 15 - CNMI Tax Id Number -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>15 - CNMI Tax Id Number: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CNMITaxIdNumber"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/CNMIWagesSalaryAmt">
					<!-- 16 - CNMI Wages Salary Amount -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>16 - CNMI Wages Salary Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CNMIWagesSalaryAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/WagesAndSalaryTaxWthldAmt">
					<!-- 17 - Wages and Salary Tax Withheld Amount -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>17 - Wages and Salary Tax Withheld Amount: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/WagesAndSalaryTaxWthldAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/LocationCd">
					<!-- A - Location Code -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>A - Location Code: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LocationCd"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/DaysOutOfCNMICnt">
					<!-- B - Days out of CNMI Count -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>B - Days out of CNMI Count: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DaysOutOfCNMICnt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/CitizenCd">
					<!-- C - Citizen Code -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>C - Citizen Code: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CitizenCd"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/PrincipleBusinessActivityCd">
					<!-- D - Principle Business Activity Code -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>D - Principle Business Activity Code: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PrincipleBusinessActivityCd"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/StandardOccupationalCodeNum">
					<!-- E - Standard Occupational Code Number -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>E - Standard Occupational Code Number: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/StandardOccupationalCodeNum"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$FormData/EntryPermitNumber">
					<!-- F - Entry Permit Number -->
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="width:94mm;float:left">
							<b>F - Entry Permit Number: </b>
						</div>
						<div class="styExplanationLine" style="width:90mm;float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/EntryPermitNumber"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
