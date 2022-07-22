<?xml version="1.0"?>
<!-- Updated 5/05/2015 per UWR 123023 for changes caused by IE11 upgrade by Robert L Jones -->
<!-- Updated 6/23/2015 per UWR 123023 for changes caused by IE11 upgrade by Robert L Jones replaced dot statements which caused 508 Jaws errors-->
<!-- Updated 7/15/2015 per Kisams IM02150548 Corrected and changed FutureFilingNotRequiredInd element name to FinalReturnInd by Robert L Jones -->
<!-- Updated 8/05/2015 per UWR 161465 Tax Year by Robert L Jones -->
<!-- Updated 10/7/2015 per IBM Defect 44781 shading at line 39a and various other nit picking issues regarding lines by Robert L Jones -->
<!-- Updated 10/7/2015 per IBM Defect 44773 a few IE11 issues - scroll bar where one not set up, yes/no with spaces where none are coded and other nitpicking issues regarding lines by Robert L Jones -->
<!-- Updated 10/21/2015 per PDF Review  by Robert L Jones -->
<!-- Updated 10/28/2015 per IBM DEFECT 44775  by Robert L Jones -->
<!-- Updated 10/28/2015 per IBM DEFECT 45411 Special condition page put after additional data page, move additional data button to right - by Robert L Jones -->
<!-- Updated 11/25/2015 per IBM DEFECT 44775  by Robert L Jones -->
<!-- Updated 12/01/2015 per IBM DEFECT 44775 Paid Preparer not displaying on inline. Removed toggle button but left scroll bars by Robert L Jones -->
<!-- Updated 12/01/2015 per IBM DEFECT 44775 Paid Preparer not displaying on inline. Removed toggle button but left scroll bars by Robert L Jones -->
<!-- Updated 3/15/2016 per Kisam IM02429318 Line 52 overlaping Removed scroll bars by Robert L Jones -->
<!-- Updated 4/22/2016 per UWR 177702 Tax Year by Robert L Jones -->
<!-- Updated 06/21/2016 per IBM DEFECT 46047 Overlapping at Header and Paid Preparer. Line 42a spacing but NPF by Robert L Jones -->
<!-- Updated 11/29/2016 per IBM DEFECT 46047 Overlapping at Header and Paid Preparer. Line 42a spacing but NPF by Robert L Jones -->
<!-- Updated 12/02/2016 per Kisam IM02792716 Part III Borders not displaying when printing in Header area. Added display inline or table commands by Robert L Jones -->
<!-- Updated 1/05/2017 per IBM DEFECT 46047  Line 42a spacing but NPF but added span after each if/test select - by Robert L Jones -->
<!-- Updated per UWR 195015 5/19/17 by Robert L Jones -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS990EZStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="IRS990EZData" select="$RtnDoc/IRS990EZ"/>
	<xsl:template name="AddRowsPartIII">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="PACount"/>
		<xsl:if test="$PACount &lt; $NumOfRows">
			<tr style="height:14mm;">
			<td class="styTableCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align:right; width: 149mm;vertical-align:top;">
					<span style="float: left; clear: none; text-align: left">
						<xsl:choose>
							<xsl:when test="$PACount=0">
								<b>28 </b>
							</xsl:when>
							<xsl:when test="$PACount=1">
								<b>29 </b>
							</xsl:when>
							<xsl:when test="$PACount=2">
								<b>30 </b>
							</xsl:when>
							<xsl:when test="$PACount=3">
								<b>31 </b>
							</xsl:when>
						</xsl:choose>
						<span style="border-style: dashed; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; font-size: 7pt">
							<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ProgramSrvcAccomplishmentGrp) &gt;3) and ($PACount = 0) ">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/ProgramSrvcAccomplishmentGrp/DescriptionProgramSrvcAccomTxt"/>
								</xsl:call-template>
							</xsl:if>
						</span>
						<br/>
						<span style="width:50mm;margin-top:6mm;">(Grants $ <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GrantsAndAllocationsAmt"/>
							</xsl:call-template>) </span>
						<span>If this amount includes foreign grants, check here <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">...</span>
							<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
							<span style="width:2mm;"/>
							<input type="checkbox" class="styCkbox" alt="AmountIncludesForeignGrantsChecked">
							<!--<input type="checkbox" class="styCkbox" name="Checkbox">-->
								<xsl:attribute name="id">
									<xsl:choose>
										<xsl:when test="$PACount=0">empty0</xsl:when>
										<xsl:when test="$PACount=1">empty1</xsl:when>
										<xsl:when test="$PACount=2">empty2</xsl:when>
										<xsl:when test="$PACount=3">empty3</xsl:when>
									</xsl:choose>
								</xsl:attribute>
							</input>							
							<label>
								<xsl:attribute name="for">
									<xsl:choose>
										<xsl:when test="$PACount=0">empty0</xsl:when>
										<xsl:when test="$PACount=1">empty1</xsl:when>
										<xsl:when test="$PACount=2">empty2</xsl:when>
										<xsl:when test="$PACount=3">empty3</xsl:when>
									</xsl:choose>
								</xsl:attribute>
							</label>
						</span>
					</span>
					<span class="styIRS990EZTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; font-weight: bold; width: 6mm;vertical-align:top;">
					<xsl:choose>
						<xsl:when test="$PACount=0">28a</xsl:when>
						<xsl:when test="$PACount=1">29a</xsl:when>
						<xsl:when test="$PACount=2">30a</xsl:when>
						<xsl:when test="$PACount=3">31a</xsl:when>
					</xsl:choose>
				</td>
				<td class="styTableCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 32mm">
					<span class="styIRS990EZTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsPartIII">
				<xsl:with-param name="PACount" select="$PACount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsPartIV">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="ODCount"/>
		<xsl:if test="$ODCount &lt; $NumOfRows">
			<tr style="height: 10mm">
				<td class="styIRS990EZTableCellA" style="border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/OfficerDirectorTrusteeEmplGrp) &gt;4) and ($ODCount = 0)">
						<xsl:choose>
							<xsl:when test="$IRS990EZData/OfficerDirectorTrusteeEmplGrp/PersonNm != ''">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeEmplGrp/PersonNm"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeEmplGrp/BusinessName"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS990EZTableCellB" style="border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<span class="styIRS990EZTableCellPad"/>
				</td>
				<td class="styIRS990EZTableCellC" style="border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<span class="styIRS990EZTableCellPad"/>
				</td>
				<td class="styIRS990EZTableCellD" style="border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<span class="styIRS990EZTableCellPad"/>
				</td>
				<td class="styIRS990EZTableCellE" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<span class="styIRS990EZTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsPartIV">
				<xsl:with-param name="ODCount" select="$ODCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsLine50">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="ODCount"/>
		<xsl:if test="$ODCount &lt; $NumOfRows">
			<tr style="height: 10mm">
				<td class="styIRS990EZTableCellA" style="border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/CompensationHighestPaidEmplGrp) &gt;4) and ($ODCount = 0)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/CompensationHighestPaidEmplGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="(count($IRS990EZData/CompensationHighestPaidEmplGrp) = 0) and ($ODCount = 0)">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/PartVIOfCompOfHghstPdEmplTxt"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS990EZTableCellB" style="border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<span class="styIRS990EZTableCellPad"/>
				</td>
				<td class="styIRS990EZTableCellC" style="border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<span class="styIRS990EZTableCellPad"/>
				</td>
				<td class="styIRS990EZTableCellD" style="border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<span class="styIRS990EZTableCellPad"/>
				</td>
				<td class="styIRS990EZTableCellE" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<span class="styIRS990EZTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsLine50">
				<xsl:with-param name="ODCount" select="$ODCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsLine51">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="ODCount"/>
		<xsl:if test="$ODCount &lt; $NumOfRows">
			<tr style="height: 10mm">
				<td class="styIRS990EZTableCellA" style="border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/CompensationOfHghstPdCntrctGrp) &gt;4) and ($ODCount = 0)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/CompensationOfHghstPdCntrctGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="(count($IRS990EZData/CompensationOfHghstPdCntrctGrp) = 0) and ($ODCount = 0)">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/PartVIHghstPdCntrctProfSrvcTxt"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS990EZTableCellB" style="border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<span class="styIRS990EZTableCellPad"/>
				</td>
				<td class="styIRS990EZTableCellC" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
					<span class="styIRS990EZTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsLine51">
				<xsl:with-param name="ODCount" select="$ODCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($IRS990EZData)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 990-EZ"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS990EZStyle"/>
						<xsl:call-template name="AddOnStyle"/>
			</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS990EZ">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeader"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:27mm;height:31mm;">
              <div style="padding-top:3mm;">
            Form<span class="styFormNumber" style="font-size:19pt;">990EZ</span>
								<br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS990EZData"/>
									<!--<xsl:with-param name="TabOrder" select="1"/>-->
								</xsl:call-template>
								 <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/SpecialConditionDesc"/>
                </xsl:call-template>
							</div>
							<div style="padding-top:7.5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:133mm;height:31mm;padding-top;7mm;">
							<div class="styMainTitle">Short Form<br/>Return of Organization Exempt From Income Tax</div>
							<div class="styFBT" style="font-size: 6.5pt; margin-top: 0px;text-align:left;padding-top:2mm;">Under section 501(c), 527, or 4947(a)(1) of the Internal Revenue Code (except private foundations)</div>
							
							<div class="styFBT" style="font-size:6.5pt; font-weight: bold; margin-top: 0px;padding-top:4mm;">
								<img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
								Do not enter social security numbers on this form as it may be made public. 
    </div><br/><br/>
    
							<div class="styFBT" style="font-size: 7pt; font-weight: bold; margin-top: 0px;padding-top:.5mm;text-align:left;padding-left:1mm;">
								<span style="width:0mm"/><img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
								<span style="width:1mm"/>
								 Go to <a href="http://www.irs.gov/form990ez" title="Link to IRS.gov">
                <i>www.irs.gov/Form990EZ</i></a> for the latest information.<!--www.irs.gov/form990-->
								 
							</div>
						</div>
						<div class="styTYBox" style="width:26.75mm;;height:31mm;">
							<div class="styOMB" style="height:5mm;">OMB No. 1545-1150</div>
							<div class="styTY" style="height:12mm;padding-top:1mm;">
      20<span class="styTYColor">17</span>
							</div>
							<div style="width:26.75mm; height:14mm; background-color: black; color: white; font-size: 9.5pt;padding-top: 1mm;font-weight: bold">Open to Public<br/>Inspection</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<div class="styComType" style="width:187mm;border-bottom-width: 0px; font-size: 7pt">
						<div class="styBoldText" style="height:auto;width:4mm;float:left;clear:none;">A</div>
						<div class="styBoldText" style="height:auto;width:182mm;float:left;clear:none;">For the 2017
 
    calendar year, or tax year beginning 
    <span style="width:30mm;">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
							</span>, and ending 
    <span style="width:30mm;">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
							</span>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;border-bottom:1px solid black;">
						<div style="width:31mm;height:26mm;float:left;clear:left;">
							<div class="styComType" style="width:31mm;border-bottom-width: 0px">
								<div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;font-size: 7pt">B</div>
								<div class="styNormalText" style="height:3mm;width:26mm;padding-top: .5mm;float:left;clear:none;">Check if applicable:</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px">
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox" alt="AddressChangeInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/AddressChangeInd"/>
											<xsl:with-param name="BackupName">IRS990EZAddressChange</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/AddressChangeInd"/>
											<xsl:with-param name="BackupName">IRS990EZAddressChange</xsl:with-param>
										</xsl:call-template>Address change</label>
								</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px">
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox" alt="NameChangeInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/NameChangeInd"/>
											<xsl:with-param name="BackupName">IRS990EZNameChange</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/NameChangeInd"/>
											<xsl:with-param name="BackupName">IRS990EZNameChange</xsl:with-param>
										</xsl:call-template>Name change</label>
								</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px;">
								<!-- padding-top:1.5mm-->
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox" alt="InitialReturnInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/InitialReturnInd"/>
											<xsl:with-param name="BackupName">IRS990EZInitialReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/InitialReturnInd"/>
											<xsl:with-param name="BackupName">IRS990EZInitialReturn</xsl:with-param>
										</xsl:call-template>Initial return</label>
								</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px;">
								<!-- padding-top:1.5mm -->
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox" alt="FinalReturnInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/FinalReturnInd"/>
											<xsl:with-param name="BackupName">IRS990EZTerminationReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/FinalReturnInd"/>
											<xsl:with-param name="BackupName">IRS990EZTerminationReturn</xsl:with-param>
										</xsl:call-template><span style="font-size: 5pt;">Final return/terminated</span></label>
								</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px;">
								<!--padding-top:1.5mm-->
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox" alt="AmendedReturnInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/AmendedReturnInd"/>
											<xsl:with-param name="BackupName">IRS990EZAmendedReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/AmendedReturnInd"/>
											<xsl:with-param name="BackupName">IRS990EZAmendedReturn</xsl:with-param>
										</xsl:call-template>Amended return</label>
								</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px;">
								<!--padding-top:1.5mm-->
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox" alt="ApplicationPendingInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/ApplicationPendingInd"/>
											<xsl:with-param name="BackupName">IRS990EZApplicationPending</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/ApplicationPendingInd"/>
											<xsl:with-param name="BackupName">IRS990EZApplicationPending</xsl:with-param>
										</xsl:call-template>Application pending</label>
								</div>
							</div>
						</div>
						<div class="styLblNameAddr" style="width:111mm;height:28mm;border-bottom-width: 3px;">
						<!--
							<div class="styUseLbl" style="width:12mm;height:28mm;border-right-width:0px;">Please use IRS label or print or type. See Specific Instruc- tions.</div>
-->
							<div class="styNameAddr" style="width:110mm;height:auto;border-left-width:1px;border-bottom-width:1px;">
								<b>C</b> Name of organization<br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="width:110mm;height:8mm;border-left-width:1px;">
								<span style="width: 82.5mm; height: 8mm">
									<span style="width: 82.5mm;padding-left: 2mm"> Number and street (or P. O. box, if mail is not delivered to street address)</span>
									<span class="stySmallText" style="width: 82.5m;padding-left:2mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</span>
								</span>
								<span style="border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; width: 14mm; height: 8mm">Room/suite</span>
							</div>
							<div class="styNameAddr" style="border-bottom-width:0px;width:98mm;height:10mm;border-left-width:1px;font-size:6pt;">
								<span style="width: 2mm"/> City or town, state or province, country, and ZIP or foreign postal code
              <span style="padding-left:2mm;font-size:6pt;" class="stySmallText">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<span style="width: 2mm"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										<xsl:with-param name="MainForm">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styEINDateAssets" style="width:43mm;height:auto;border-top-width: 1px;padding-top:.5mm;">
							<span class="styBoldText">D Employer identification number</span>
							<br/>
							<br/>
							<span style="width: 3mm"/>
							<span class="styEINFld" style="">
								<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EIN Changed parameter when calling PopulateReturnHeaderFiler.-->
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:43mm;height:10.25mm;padding-top:.5mm;">
							<span class="styBoldText">E  </span> Telephone number<br/>
							<br/>
							<span style="width: 3mm"/>
							<span style="text-align: center; width:33mm">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:43mm;height:7.5mm;border-bottom:0px;padding-top:.5mm;">
							<span class="styBoldText">F </span> Group Exemption <br/>
							<span style="width: 2mm"/>Number<span class="styIRS990EZNBSP"/><img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
							<span style="width: 4px"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/GroupExemptionNum"/>
							</xsl:call-template>
						</div>
						</div>
				
					
				<!-- New G per BSP-102106 -->
				
					<span style="width: 125mm;height:auto; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 0px;padding-bottom:0mm;float:left;padding-top:2mm;">
							<b>G</b> Accounting Method: <span style="width: 1mm"/>
							<input type="checkbox" class="styIRS990EZCkBox" alt="MethodOfAccountingCashInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">IRS990EZMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">IRS990EZMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>Cash</label>
							<span style="width: 2mm"/>
							<input type="checkbox" class="styIRS990EZCkBox" alt="MethodOfAccountingAccrualInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">IRS990EZMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">IRS990EZMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>Accrual</label>
						
							<span style="width: 3mm"/>Other (specify)
     <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
							<span style="font-size: 7pt"/>
							<span class="styIRS990EZUnderlinedBox" style="width:43mm; font-size: 8pt; font-family: arial">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/MethodOfAccountingOtherDesc"/>
								</xsl:call-template>
						</span>
						</span>
						
							
<!-- Section H -->
					<span style="width: 62mm; font-size: 7pt; padding-left:2mm;padding-top:1mm;border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; padding-bottom:0mm;float:left;">
						
								<b>H</b>
								<span style="width: 2mm;"/>
      Check <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
								<span style="width: 2mm;"/>
								<input type="checkbox" class="styIRS990EZCkBox" alt="ScheduleBNotRequiredInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ScheduleBNotRequiredInd"/>
										<xsl:with-param name="BackupName">IRS990EZScheduleBNotRequired</xsl:with-param>
									</xsl:call-template>
			<span class="styNormalText" style="font-size: 7pt;padding-left:1mm;">if the organization is <b>not</b></span>
									 </input>
							
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/ScheduleBNotRequiredInd"/>
									<xsl:with-param name="BackupName">IRS990EZScheduleBNotRequired</xsl:with-param>
								</xsl:call-template><br/>
								<span class="styNormalText" style="font-size: 7pt; padding-left:5mm;">required to attach Schedule B</span>
								<br/>
								
								<span class="styNormalText" style="font-size: 7pt; padding-left:5mm;">(Form 990, 990-EZ, or 990-PF).</span>
								</label>
						</span>
					
					<!-- Section I -->
						 <span style="height:auto;width: 125mm; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 0mm;padding-bottom:2mm;float:left;"><b>I Website:</b><span style="width: 1mm;"/><img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span class="styIRS990EZUnderlinedBox" alt="WebsiteAddressTxt" style="width:100mm; font-size: 6pt; font-family: arial;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/WebsiteAddressTxt"/>
									</xsl:call-template>
								</span>

								
							
							<!-- Section J -->
							 <span style="width: 125mm; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 0mm;padding-top:0mm;float:left;">
								<span class="stySmallText" style="height:auto;"><b>J Tax-exempt status </b>
								<span style="font-size:5pt;height:auto;">(check only one) - </span>
								<input type="checkbox" class="styIRS990EZCkBox" alt="Organization501c3Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501c3Ind"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization501c3</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501c3Ind"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization501c3</xsl:with-param>
									</xsl:call-template>501(c)(3)</label>
									
                            <xsl:call-template name="SetFormLinkInline">
                                  <xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501c3Ind"/>
                            </xsl:call-template>
								
								<input type="checkbox" class="styIRS990EZCkBox" alt="Organization501cInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501cInd"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization501c</xsl:with-param>
									</xsl:call-template>
								</input>
									<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501cInd"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization501c</xsl:with-param>
									</xsl:call-template> 501(c)</label>(
								<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501cInd/@organization501cTypeTxt"/>
								</xsl:call-template>)
      <img src="{$ImagePath}/990EZ_Bullet_Left.gif" alt="bullet"/>
								<span style="font-size:6pt; padding-left:1mm;"> (insert no.)</span>
							
										<input type="checkbox" class="styIRS990EZCkBox" alt="Organization4947a1NotPFInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization4947a1NotPFInd"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization4947a1</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization4947a1NotPFInd"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization4947a1</xsl:with-param>
									</xsl:call-template> 4947(a)(1)</label> or
        <input type="checkbox" class="styIRS990EZCkBox" alt="Organization527Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization527Ind"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization527</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization527Ind"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization527</xsl:with-param>
									</xsl:call-template> 527</label>
							</span>
						</span>
						</span>
						<div style="width: 187mm; font-size: 6.5pt;border-style: solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
								<b>K</b> Form of organization: <span style="width: 1mm"/>
							<input type="checkbox" class="styIRS990EZCkBox" alt="TypeOfOrganizationCorpInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TypeOfOrganizationCorpInd"/>
									<xsl:with-param name="BackupName">IRS990EZTypeOfOrganizationCorpInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TypeOfOrganizationCorpInd"/>
									<xsl:with-param name="BackupName">IRS990EZTypeOfOrganizationCorpInd</xsl:with-param>
								</xsl:call-template>Corporation</label>
							<span style="width: 2mm"/>
							
							<input type="checkbox" class="styIRS990EZCkBox" alt="TypeOfOrganizationTrustInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TypeOfOrganizationTrustInd"/>
									<xsl:with-param name="BackupName">IRS990EZTypeOfOrganizationTrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TypeOfOrganizationTrustInd"/>
									<xsl:with-param name="BackupName">IRS990EZTypeOfOrganizationTrustInd</xsl:with-param>
								</xsl:call-template>Trust</label>
						<span style="width: 2mm"/>
						<input type="checkbox" class="styIRS990EZCkBox" alt="TypeOfOrganizationAssocInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TypeOfOrganizationAssocInd"/>
									<xsl:with-param name="BackupName">IRS990EZTypeOfOrganizationAssocInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TypeOfOrganizationAssocInd"/>
									<xsl:with-param name="BackupName">IRS990EZTypeOfOrganizationAssocInd</xsl:with-param>
								</xsl:call-template>Association</label>
								<span style="width: 2mm"/>
						<input type="checkbox" class="styIRS990EZCkBox" alt="TypeOfOrganizationOtherInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TypeOfOrganizationOtherInd"/>
									<xsl:with-param name="BackupName">IRS990EZTypeOfOrganizationOtherInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TypeOfOrganizationOtherInd"/>
									<xsl:with-param name="BackupName">IRS990EZTypeOfOrganizationOtherInd</xsl:with-param>
								</xsl:call-template>Other</label>
								
							<span style="width: 1mm"/>
    <!-- <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>-->
							<span style="font-size: 6pt"/>
							<span class="styIRS990EZUnderlinedBox" style="width:80mm; font-size: 8pt; font-family: arial">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TypeOfOrganizationOtherDesc"/>
								</xsl:call-template>
						</span>
					
</div>
					<div style="float:none; clear: both; width: 187mm; border-style: solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;padding-top:.75mm;padding-bottom:.75mm;">
					
						<b>L</b>  
  Add lines 5b, 6c, and 7b to line 9 to determine gross receipts. If gross receipts are $200,000 or more, or if total assets (Part II, column (B)  
  
						 below) are $500,000 or more, file Form 990 instead of Form 990-EZ
					 <!-- Dotted Line -->
				  <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">...........................</span>
							<img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
							
							<span style="font-size:6pt"/> $
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/GrossReceiptsAmt"/>
								</xsl:call-template>
							
						
					</div>
			
					<!--   BEGIN PART I   -->
					<!--   BEGIN PART I HEADER   -->
					<div class="styBB" style="width:187mm;clear:both;border-top-width:1px;">
									<div class="styPartName">Part <span style="font-size:8.75pt">&#8544;</span></div>
									<div class="styPartDesc" style="height:auto;">
									<span style="float:left;">Revenue, Expenses, and Changes in Net Assets or Fund Balances 
            <span class="styNormalText" style="font-size: 7pt; width: 50mm"> (see the instructions for Part I) </span>
            
            <span class="styNormalText" style="font-size: 7pt; "> 
											<span style="float:left;height:auto;">Check if the organization used Schedule O to respond to any question in this Part I</span>
            </span>
              <!-- Dotted Line -->
				  <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">.....................</span>              
                <input type="checkbox" class="styIRS990EZCkBox" alt="InfoInScheduleOPartIInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIInd"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartI</xsl:with-param>
							</xsl:call-template>
						</input>
			<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIInd"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartI</xsl:with-param>
							</xsl:call-template>
                </label>
              </span>
                   </div>
					</div>
							
						 <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
           <tfoot/>
            <tbody valign="top">
		<!--**************************************************************************************************************************************************************************************-->					
							<tr>
							<td class="styIRS990EZImg" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="18" valign="middle">
									<img src="{$ImagePath}/990EZ_Revenue.gif" alt="VerticalRevenue"/>
								</td>
								
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:2mm;">1</td>
						<td class="styLNDesc" style="width:137mm;height:4.5;padding-left:4mm;">
					<!--	Reserved-->
        Contributions, gifts, grants, and similar amounts received   
         	 <!-- Dotted Line -->
				  <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">....................</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">1</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ContributionsGiftsGrantsEtcAmt"/>
									</xsl:call-template>
						</td>
				
				
						</tr>
							<!--   END LINE 1   -->
							<!--   BEGIN LINE 2   -->
					
						<tr>
							
							
						<td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-left:2mm;">2</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;">
					<!--	Reserved-->
        Program service revenue including government fees and contracts  
          	 <!-- Dotted Line -->
				  <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">...............</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:auto;border-right-width:1px;">2</td>
						<td class="styLNAmountBox" style="height:auto;border-right-width:0px;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ProgramServiceRevenueAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
								
							<!--   END LINE 2  -->
							<!--   BEGIN LINE 3   -->
							<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:2mm;">3</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;">
					<!--	Reserved-->
        Membership dues and assessments 
         	 <!-- Dotted Line -->
				  <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">...........................</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">3</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/MembershipDuesAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
							<!--   END LINE 3   -->
							<!--   BEGIN LINE 4   -->
							<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:2mm;">4</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;">
					<!--	Reserved-->
        Investment income
         	 <!-- Dotted Line -->
				  <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">...........................</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">4</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/InvestmentIncomeAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
							
					<!--   BEGIN LINE 5a   -->
					
					<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:2mm;">5a</td>
						<td class="styLNDesc" style="width:97mm;height:4.5mm;padding-left:4mm;"><!--Reserved-->
       Gross amount from sale of assets other than inventory
       	 <!-- Dotted Line -->
				  <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">.....</span>
        </td>
						<td class="styLNRightNumBox" style="height:4.5mm;">5a</td>
						<td class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/SaleOfAssetsGrossAmt"/>
									</xsl:call-template>
						</td>
						<td class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
						
					
					</tr>
					<tr>
					<!-- line 5b -->
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:4mm;">b</td>
						<td class="styLNDesc" style="width:97mm;height:4.5mm;padding-left:4mm;">
         Less: cost or other basis and sales expenses
          	 <!-- Dotted Line -->
				  <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">.......</span>
						</td>
						<td class="styLNRightNumBox" style="height:4.5mm;">5b</td>
						<td class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/CostOrOtherBasisExpenseSaleAmt"/>
									</xsl:call-template>
						</td>
						<td class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					
					</tr>
							<!--   BEGIN LINE 5c   -->
							<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:4mm;">c</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;">
					<!--	Reserved-->
        Gain or (loss) from sale of assets other than inventory (Subtract line 5b from line 5a)  
          <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">5c</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GainOrLossFromSaleOfAssetsAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
							
							<!--   BEGIN LINE 6   -->
							<tr>
							
								<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:2mm;">6</td>
									<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;">
								Gaming and fundraising events 
								</td>
                          
								<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey;border-bottom-width:0px;"></td>
						
					</tr>
				
						<!--   BEGIN LINE 6a   -->
						<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:4mm;">a</td>
						<td class="styLNDesc" style="width:97mm;height:4.5mm;padding-left:4mm;"><!--Reserved-->
       Gross income from gaming (attach Schedule G if greater than $15,000)
          <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GamingGrossIncomeAmt"/>
										</xsl:call-template>
        	 <!-- Dotted Line -->
				 
        </td>
						<td class="styLNRightNumBox" style="height:4.5mm;">6a</td>
						<td class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GamingGrossIncomeAmt"/>
									</xsl:call-template>	
						</td>
						<td class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
						</tr>
						
						<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-left:4mm;padding-top:1.5mm;">b</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;padding-top:1.5mm;"><!--Reserved-->
       Gross income from fundraising events (not including $
          <!--<span class="styUnderlinedText" style="text-align: right">-->
          <span class="styFixedUnderline" style="height:auto;width:25mm;float:none;padding-left:2mm;padding-top:0mm;padding-bottom:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/FundraisingGrossIncomeAmt/@fndrsngEventContriPrevRptAmt"/>
										</xsl:call-template>
							</span> of contributions from fundraising events reported on line 1) (attach Schedule G if the
							<td class="styLNRightNumBoxNBB" style="width:8.25mm;height:8.5mm;border-right-width:1px;background-color:lightgrey"/>
							
					<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:4mm;"></td>
						<td class="styLNDesc" style="width:102mm;height:4.5mm;padding-left:9mm;"><!--Reserved-->
       sum of such gross income and contributions exceeds $15,000)
           <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
        
        <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/FundraisingGrossIncomeAmt"/>
										<!--<xsl:with-param name="TabOrder" select="3"/> removed for 508 Compliance-->
									</xsl:call-template>
                    	<td class="styLNRightNumBox" style="height:4.5mm;">6b</td>
						<td class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/FundraisingGrossIncomeAmt"/>
									</xsl:call-template>	</td>
					</td>
						<td class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
				
						</td>
					</tr>
						<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:4mm;">c</td>
						<td class="styLNDesc" style="width:97mm;height:4.5mm;padding-left:4mm;"><!--Reserved-->
       Less: direct expenses from gaming and fundraising events
          <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
        </td>
						<td class="styLNRightNumBox" style="height:4.5mm;">6c</td>
						<td class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/SpecialEventsDirectExpensesAmt"/>
									</xsl:call-template>	
						</td>
						<td class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
						
					
					</tr>
						<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:4mm;">d</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;">
					<!--	Reserved-->
        Net income or (loss) from gaming and fundraising events (add lines 6a and 6b and subtract line 6c) 
          <span class="styDotLn" style="float:right;padding-right:1mm;"></span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">6d</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/SpecialEventsNetIncomeLossAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
						
						<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:2mm;">7a</td>
						<td class="styLNDesc" style="width:97mm;height:4.5mm;padding-left:4mm;"><!--Reserved-->
      Gross sales of inventory, less returns and allowances
           <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
        </td>
						<td class="styLNRightNumBox" style="height:4.5mm;">7a</td>
						<td class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GrossSalesOfInventoryAmt"/>
									</xsl:call-template>	
						</td>
						<td class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					
					
					</tr>
						
					<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:4mm;">b</td>
						<td class="styLNDesc" style="width:97mm;height:4.5mm;padding-left:4mm;"><!--Reserved-->
      Less: cost of goods sold
          <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
        </td>
						<td class="styLNRightNumBox" style="height:4.5mm;">7b</td>
						<td class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/CostOfGoodsSoldAmt"/>
									</xsl:call-template>	
						</td>
						<td class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					
					
					</tr>	
					<tr>
						
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:4mm;">c</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;">
					<!--	Reserved-->
       Gross profit or (loss) from sales of inventory (Subtract line 7b from line 7a)
          <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">7c</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GrossProfitLossSlsOfInvntryAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
					
					<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:2mm;">8</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;">
					<!--	Reserved-->
       Other revenue (describe in Schedule O) 
         <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">8</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherRevenueTotalAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
					
					<tr>
						
						<td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-left:2mm;border-style: solid; border-color: black; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 1px;">9</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm; border-style: solid; border-color: black; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 1px;">
					<!--	Reserved-->
      <b>Total revenue.</b> Add lines 1, 2, 3, 4, 5c, 6d, 7c, and 8
          <span class="styDotLn" style="float:right;padding-right:1mm;"></span>
          <span class="styDotLn" style="float:right;padding-right:1mm;">..............
									<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="Bullet"/></span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">9</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TotalRevenueAmt"/>
									</xsl:call-template>
						</td>
					
					
							
					</tr>
					</tbody>
					</table>
			<!--**********************************************************************************************************************************************************************************-->		
			 <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
           <tfoot/>
            <tbody valign="top">	
						
						<tr>
						
				<td class="styIRS990EZImg" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="11" valign="middle">
									<img src="{$ImagePath}/990EZ_Expenses.gif" alt="VerticalExpenses"/>
								</td>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">10</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;">
					Grants and similar amounts paid (list in Schedule O)
                                    <xsl:call-template name="SetFormLinkInline">          
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GrantsAndSimilarAmountsPaidAmt"/>
										<!--<xsl:with-param name="TabOrder" select="4"/> Removed for 508 Compliance JAWS-->
									</xsl:call-template>
									 <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">10</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GrantsAndSimilarAmountsPaidAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
					<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">11</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;">
					Benefits paid to or for members
									 <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">11</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/BenefitsPaidToOrForMembersAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
					<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">12</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm">
					Salaries, other compensation, and employee benefits
									 <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">12</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/SalariesOtherCompEmplBnftAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
					<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">13</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm">
					Professional fees and other payments to independent contractors
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">13</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/FeesAndOtherPymtToIndCntrctAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
					<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">14</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm">
					Occupancy, rent, utilities, and maintenance
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">14</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/OccupancyRentUtltsAndMaintAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
					<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">15</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm">
					Printing, publications, postage, and shipping
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">..............
									</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">15</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/PrintingPublicationsPostageAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
					<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">16</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm">
					Other expenses (describe in Schedule O) 
								<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherExpensesTotalAmt"/>
											<!--<xsl:with-param name="TabOrder" select="6"/>-->
										</xsl:call-template>
         
          <span class="styDotLn" style="float:right;padding-right:1mm;">..............
									</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">16</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherExpensesTotalAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
					<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-left:1mm;border-style: solid; border-color: black; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 1px;">17</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm;border-style: solid; border-color: black; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 1px;">
					<b>Total expenses. </b>Add lines 10 through 16 
          <span class="styDotLn" style="float:right;padding-right:1mm;"></span>
          <span class="styDotLn" style="float:right;padding-right:1mm;">..............
									<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="Bullet"/></span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">17</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TotalExpensesAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
					</tbody>
					</table>
	<!--*******************************************************************************************************************************************************************************************-->				
						<!--   BEGIN LINE 18   -->
						<table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
						<tbody>
							<tr>
					<td class="styIRS990EZImg" style="width: 4mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="7" valign="middle">
									<img src="{$ImagePath}/990EZ_NetAssets.gif" alt="VerticalNetAssets"/>
								</td>
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">18</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm">
					Excess or (deficit) for the year (Subtract line 17 from line 9)
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">18</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ExcessOrDeficitForYearAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>
								
								<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">19</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm">
					Net assets or fund balances at beginning of year (from line 27, column (A)) (must agree with
                                     </td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey;border-bottom-width:0px;"></td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;border-bottom-width:0px;">
										
						</td>
					
					</tr>
						<tr>
						
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;"></td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm">
					end-of-year figure reported on prior year’s return)
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">19</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/NetAssetsOrFundBalancesBOYAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>		
								<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">20</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm">
					Other changes in net assets or fund balances (explain in Schedule O)
                                     <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherChangesInNetAssetsAmt"/>
										<!--<xsl:with-param name="TabOrder" select="5"/>Removed for 508 Compliance-->
									</xsl:call-template>
									 <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">20</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherChangesInNetAssetsAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>		
								
								<tr>
							
						<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">21</td>
						<td class="styLNDesc" style="width:137mm;height:auto;padding-left:4mm">
					Net assets or fund balances at end of year. Combine lines 18 through 20
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</td>
						<td class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">21</td>
						<td class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/NetAssetsOrFundBalancesEOYAmt"/>
									</xsl:call-template>
						</td>
					
					</tr>		
					</tbody>
						</table>
					<!--   END PART I   -->
					<!-- BEGIN FOOTER -->
					<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the separate instructions.</span>
						</div>
						<div style="float:right">
    Cat. No. 10642I
    <span style="width:70px"/>
    Form <span class="styBoldText" style="font-size: 8pt;"> 990-EZ </span> (2017)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div style="width:187mm;padding-top:1mm;">
						<div style="float: left; clear: none">Form 990-EZ (2017)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN PART II   -->
					<!--   BEGIN PART II HEADER   -->
					<div class="styBB" style="float: none; clear:both; width: 187mm; border-top-width: 1px">
						<span class="styPartName">Part <span style="font-size:8.75pt">&#8545;</span></span>
						<span class="styPartDesc" style="height:auto;">Balance Sheets<!--&#151;-->
						<span class="styNormalText" style="font-size: 7pt; width: 50mm"> (see the instructions for Part II)</span>
						<span class="styNormalText" style="font-size: 7pt; width:169mm"> 
						<span style="float:left;padding-right:15px;">Check if the organization used Schedule O to respond to any question in this Part II</span>
            <!-- Dotted Line -->
                       <!--<span class="styDotLn" style="padding-right:1mm;">............</span>Changed this although no problem to test if affects JAWS-->
                <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">.................</span> 
                
                <input type="checkbox" class="styIRS990EZCkBox" alt="InfoInScheduleOPartIIInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIIInd"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartII</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIIInd"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartII</xsl:with-param>
							</xsl:call-template>
                </label>
              </span>
              
        </span>
						
					</div><br/>
					<!--   END PART II HEADER   -->
					<div style="width: 187mm;">
						<span class="styLNDesc" style="text-align: center; width: 112.75mm;border-top-width:1px"/>
						<span class="styLNAmountBox" style=" text-align: center; width: 34.75mm; border-left-width: 1px;border-top-width:1px">
							<b>(A)</b> Beginning of year</span>
						<span class="styLNAmountBox" style="text-align: center; width: 38mm;border-top-width:1px">
							<b>(B)</b> End of year</span>
					</div>
					<!--   BEGIN LINE 22   -->
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLeftNumBox">22</span>
								<span class="styLNDesc" style="padding-left: 2mm; width: 109.5mm">
								<span style="float:left;">Cash, savings, and investments</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">................</span> 
						</span>
						<div class="styLNAmountBox" style="width:34.75mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/CashSavingsAndInvestmentsGrp/BOYAmt"/>
							</xsl:call-template>
						</div>
						<span class="styLNRightNumBox" style="width:6mm">22</span>
						<div class="styLNAmountBox" style="border-left-width: 1px;width:31.75mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/CashSavingsAndInvestmentsGrp/EOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 22   -->
					<!--   BEGIN LINE 23   -->
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLeftNumBox">23</span>
						<span class="styLNDesc" style="padding-left: 2mm; width: 109.5mm">
							 <span style="float:left;">Land and buildings</span>
							 <span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</span>
						<div class="styLNAmountBox" style="width:34.75mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/LandAndBuildingsGrp/BOYAmt"/>
							</xsl:call-template>
						</div>
						<span class="styLNRightNumBox" style="width:6mm">23</span>
						<div class="styLNAmountBox" style="border-left-width: 1px;width:31.75mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/LandAndBuildingsGrp/EOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 23   -->
					<!--   BEGIN LINE 24   -->
					<!--<div class="styGenericDiv" id="OActn" style="overflow-y: auto; height: 100%;">-->
						<div class="styIRS990EZLineItem" style="height:4.5mm;">
							<span class="styIRS990EZLNLeftNumBox" style="height:4.5mm;">24</span>
							<span class="styLNDesc" style="padding-left: 2mm; width: 109.5mm;">
							<span style="float:left;">Other assets (describe in Schedule O) 							
                                <!--<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="Bullet"/>-->
								<!--<span class="styIRS990EZUnderlinedBox" style="width: 70mm; height: 100%">-->
									<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherAssetsTotalDetail"/>
										<!--<xsl:with-param name="TabOrder" select="6"/>-->
									</xsl:call-template>
							 </span>
							 <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
                             </span>
							<div class="styLNAmountBox" style="height:4.75mm;width:34.75mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherAssetsTotalDetail/BOYAmt"/>
								</xsl:call-template>
							</div>
							<span class="styLNRightNumBox" style="height:4.75mm;width:6mm">24</span>
							<div class="styLNAmountBox" style="border-left-width: 1px; height:4.75mm;width:31.75mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherAssetsTotalDetail/EOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					
					<!--   END LINE 24   -->
					<!--   BEGIN LINE 25   -->
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLeftNumBox">25</span>
							<span class="styLNDesc" style="padding-left: 2mm; width: 109.5mm; font-weight: bold;">
							<span style="float:left;">Total assets</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>    
                        </span>
						<div class="styLNAmountBox" style="width:34.75mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/Form990TotalAssetsGrp/BOYAmt"/>
							</xsl:call-template>
						</div>
						<span class="styLNRightNumBox" style="width:6mm">25</span>
						<div class="styLNAmountBox" style="border-left-width: 1px;width:31.75mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/Form990TotalAssetsGrp/EOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 25   -->
					<!--   BEGIN LINE 26   -->
					
						<div class="styIRS990EZLineItem">
							<span class="styIRS990EZLNLeftNumBox">26</span>
							<span class="styLNDesc" style="padding-left: 2mm; width: 109.5mm">
								<div style="valign:top;float:left">
									<span style="float:left;"><b>Total liabilities</b> (describe in Schedule O)
									</span>
                                 <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span> 
                                 <!--<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="Bullet"/>-->
								</div>
								<!--<span class="styIRS990EZUnderlinedBox" style="width: 67mm; height: 100%;">-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/SumOfTotalLiabilitiesGrp"/>
										<!--<xsl:with-param name="TabOrder" select="6"/>-->
									</xsl:call-template>
								<!--</span>)-->
                            </span>
							<div class="styLNAmountBox" style="width:34.75mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/SumOfTotalLiabilitiesGrp/BOYAmt"/>
								</xsl:call-template>
							</div>
							<span class="styLNRightNumBox" style="width:6mm">26</span>
							<div class="styLNAmountBox" style="width:31.75mm;border-left-width: 1px;height: 100%">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/SumOfTotalLiabilitiesGrp/EOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					
					<!--  END LINE 26  -->
					<!--  BEGIN LINE 27  -->
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLeftNumBox">27</span>
						<span class="styLNDesc" style="padding-left: 2mm; width: 109.5mm;">
							<span style="float:left;"><b>Net assets or fund balances</b> (line 27 of column (B) <b>must</b> agree with line 21)</span>
                            <span class="styDotLn" style="float:right;padding-right:1mm;"></span>
						</span>
						<div class="styLNAmountBox" style="border-left-width: 1px; border-bottom-width: 1px;width:34.75mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/NetAssetsOrFundBalancesGrp/BOYAmt"/>
							</xsl:call-template>
						</div>
						<span class="styLNRightNumBox" style="border-left-width: 1px; border-bottom-width: 1px;width:6mm;">27</span>
						<div class="styLNAmountBox" style="border-left-width: 1px; border-bottom-width: 1px;width:31.75mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/NetAssetsOrFundBalancesGrp/EOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 27  -->
					
					<!--   BEGIN PART III   -->
					<!--   BEGIN PART III HEADER   -->
					<!--<div class="styBB" style="float:none; clear:both; width:187mm;text-align:right;background-color:gray; border-bottom-width: 0px;border-top-width: 0px">-->
					
						<!--<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/ProgramSrvcAccomplishmentGrp"/>
							<xsl:with-param name="headerHeight" select="5"/>
							<xsl:with-param name="containerHeight" select="3"/>
							<xsl:with-param name="containerID" select="'SPctn'"/>
						</xsl:call-template>-->
				
					<!--</div>-->
					<div class="styTableContainer" style="height:52mm;width:187mm;display:table;border-color: black; border-bottom-width: 1px; border-top-width: 1px;" id="SPctn">
					<!--	<xsl:call-template name="SetInitialState"/>-->
						
						
						<table class="styTable" cellspacing="0" style="font-size:7pt;display:table;height:auto;">
							
							<tr>
								<td class="styTableCell" style="height: auto;text-align: left; width: 149mm; padding-top: 0; padding-bottom: 0;display:inline;display:table;border-right-width: 1px;">
									<span class="styPartName">Part <span style="font-size: 8.75pt">&#8546;</span></span>
									<span class="styPartDesc" style="width: 124mm;height:auto;">Statement of Program Service Accomplishments 
									<span class="styNormalText" style="font-size:6pt;"> (see the instructions for Part III)</span>
									<span class="styNormalText" style="font-size: 7pt; width:124mm;"> Check if the organization used Schedule O to respond to any question in this Part III
            <!-- Dotted Line -->
              <span class="styBoldText">
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                 <input type="checkbox" class="styIRS990EZCkBox" alt="InfoInScheduleOPartIIIInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIIIInd"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartIII</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIIIInd"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartIII</xsl:with-param>
							</xsl:call-template>
                </label>
              </span>
              
        </span>
									</span>
								</td>
								<td class="styTableCell" style="height:auto;text-align:left; padding-left: 2mm; border-color: black; border-top-width: 0px; border-left-width: 1px; border-right-width:0px;width:38mm; vertical-align:top;" rowspan="6" colspan="2">
									<span style="text-align: center;font-weight: bold;padding-left:10mm;font-size:7pt;">Expenses</span>
									<br/>
									<span style=" font-weight: normal; text-align: left; ">(Required for section 501(c)(3) and 501(c)(4) organizations; optional for others.)</span>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="height:auto;float: none; border-color: black; border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px; width:149mm; font-weight: normal; text-align: left;display:table; ">
                What is the organization's primary exempt purpose?
                <span class="styIRS990EZUnderlinedBox" style="width: 148mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/PrimaryExemptPurposeTxt"/>
										</xsl:call-template>
									</span>
								</td>
							</tr>
							<tr>
								<td class="styTableCellHeader" style="height:auto;border-color: black; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; width:149mm; font-weight: normal; text-align: left; display:table;">
               Describe the organization’s program service accomplishments for each of its three largest program services, as measured by expenses. In a clear and concise manner,  
                describe the services provided,   the number of persons benefited, and other relevant information for each program title.   
               </td>
							</tr>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/ProgramSrvcAccomplishmentGrp">
							<xsl:if test="($Print != $Separated) or (count($IRS990EZData/ProgramSrvcAccomplishmentGrp) &lt;=3)">
										<tr>
											<td class="styTableCell" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align:right; width: 149mm;vertical-align:bottom;display:table;">
												<span style="float: left; clear: both; text-align: left;height:auto;">
													<xsl:choose>
														<xsl:when test="position()=1">
															<b>28 </b>
														</xsl:when>
														<xsl:when test="position()=2">
															<b>29 </b>
														</xsl:when>
														<xsl:when test="position()=3">
															<b>30 </b>
														</xsl:when>
														<xsl:when test="position() &gt;3">
															<span style="width: 1px"/>
														</xsl:when>
													</xsl:choose>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DescriptionProgramSrvcAccomTxt"/>
													</xsl:call-template>
													<br/>
													<span style="width:50mm;">(Grants $ <xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrantsAndAllocationsAmt"/>
														</xsl:call-template>) </span>
													<span>If this amount includes foreign grants, check here <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">...</span>
														<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
														<span style="width:2mm;"/>
														<input type="checkbox" class="styCkbox" alt="ForeignGrantsInd" onclick="return false;">
														<!--<input type="checkbox" class="styCkbox">-->
														<!--<input type="checkbox" class="styCkbox" name="Checkbox">-->
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="ForeignGrantsInd"/>
																<xsl:with-param name="BackupName">IRS990EZForeignGrants<xsl:number value="position()"/></xsl:with-param>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="ForeignGrantsInd"/>
																<xsl:with-param name="BackupName">IRS990EZForeignGrants<xsl:number value="position()"/></xsl:with-param>
															</xsl:call-template>
														</label>
													</span>
													<span class="styIRS990EZTableCellPad"/>
												</span>
											</td>
											<td class="styTableCell" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; font-weight: bold; width: 6mm; vertical-align:top;">
												<xsl:choose>
													<xsl:when test="position()=1">28a</xsl:when>
													<xsl:when test="position()=2">29a</xsl:when>
													<xsl:when test="position()=3">30a</xsl:when>
													<xsl:when test="position() &gt;3">
														<span style="width: 1px"/>
													</xsl:when>
												</xsl:choose>
											</td>
							<!--**************Put in smaller font for amounts because it wraps with 7pt******************************-->
											<td class="styTableCell" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px;vertical-align:top;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProgramServiceExpensesAmt"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
										</tr>
								</xsl:if>
								</xsl:for-each>
								<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ProgramSrvcAccomplishmentGrp) &gt;3)">
									<xsl:call-template name="AddRowsPartIII">
										<xsl:with-param name="NumOfRows" select="3"/>
										<xsl:with-param name="PACount" select="0"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($IRS990EZData/ProgramSrvcAccomplishmentGrp) &lt;=3)">
									<xsl:call-template name="AddRowsPartIII">
										<xsl:with-param name="NumOfRows" select="3"/>
										<xsl:with-param name="PACount" select="count($IRS990EZData/ProgramSrvcAccomplishmentGrp)"/>
									</xsl:call-template>
								</xsl:if>
								<tr>
									<td class="styTableCell" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align:right; width: 149mm; ">
										<span style="float:left; clear: none;text-align:left;height:auto;">
										    <span style="float:left;">
											<b>31</b> Other program services (describe in Schedule O)
											</span>
                                            <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">................</span>
											<br/>
											<span style="width:50mm;">(Grants $ 
                <xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrantsAndAllocationsAmt"/>
												</xsl:call-template>) </span>
											<span>If this amount includes foreign grants, check here<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">...</span>
												<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
												<span style="width:2mm;"/>
												<input type="checkbox" class="styCkbox" alt="AmountIncludesForeignGrantsInd" id="empty4"/>
												<label for="empty4"/>
											</span>
										</span>
									</td>
									<td class="styTableCell" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; width:6mm; text-align: center; font-weight: bold;vertical-align:bottom;">31a</td>
									<td class="styTableCell" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 32mm">
										<span style="width: 1px"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="height:auto;border-color: black; border-bottom-width: 0px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align:left; width: 137mm;">
										<span style="float:left;"><b>32 Total program service expenses</b>  (add lines 28a through 31a)</span>
                                        <span class="styDotLn" style="float:right;padding-right:1mm;">..........
                                        <!--<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>-->
                                        <img alt="bullet" src="{$ImagePath}/990EZ_Bullet_Lg.gif"/>   
                                        </span>
									</td>
									<td class="styTableCell" style="height:auto;border-color: black; border-bottom-width: 0px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; width:6mm; text-align: center; font-weight: bold">32</td>
									<td class="styTableCell" style="height:auto;border-color: black; border-bottom-width: 0px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 50mm;font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TotalProgramServiceExpensesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS990EZData/ProgramSrvcAccomplishmentGrp"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="headerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'SPctn' "/>
					</xsl:call-template>-->
					<!--   BEGIN PART IV HEADER   -->
					<div class="styBB" style="height:auto;float:none; clear:both; width: 187mm;border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px;">
						<div class="styPartName" style="height:auto;">Part <span style="font-size: 8.75pt">&#8547;</span></div>
						<div class="styPartDesc" style="font-size: 7pt; width: 163mm;height:auto;">
						List of Officers, Directors, Trustees, and Key Employees <span class="styNormalText" style="font-size: 6pt">(list each one even if not compensated &#151; see the instructions for Part IV)</span>
						<span class="styNormalText" style="font-size: 7pt; width:163mm"> 
						<span style="float:left;">Check if the organization used Schedule O to respond to any question in this Part IV</span>
							<!-- Dotted Line -->
							
							 <span class="styDotLn" style="padding-right:1mm;">............</span>
								 <input type="checkbox" class="styIRS990EZCkBox" alt="InfoInScheduleOPartIVInd">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIVInd"/>
												<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartIV</xsl:with-param>
											</xsl:call-template>
										</input>
				<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIVInd"/>
												<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartIV</xsl:with-param>
											</xsl:call-template>
								</label>
						  </span>
					  </div>
              </div>
 
 			<span style="width:187mm; text-align:right;">
							<!--<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeEmplGrp"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'ODctn' "/>
							</xsl:call-template>-->
						</span>
					
					<!--   END PART IV HEADER   -->
					<!--  BEGIN PART IV TABLE  -->
					<div class="styTableNBB" style="height: 44mm;width: 187mm;display:table;" id="ODctn">
						<!--print logic-->
						<!--<xsl:call-template name="SetInitialState"/>-->
						<!--end-->
						<table class="styTable" cellspacing="0" style="display:table;height:auto;">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS990EZTableCellA" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center;vertical-align:top;" scope="col">
										<b>(a)</b> Name and title</th>
									<th class="styIRS990EZTableCellB" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center;vertical-align:top;" scope="col">
										<b>(b)</b> Average<br/>hours per week<br/>devoted to position</th>
									<th class="styIRS990EZTableCellC" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center;vertical-align:top;" scope="col">
										<b>(c)</b> Reportable compensation <br/>(Forms W-2/1099-MISC)
										<b>(if not paid, enter -0-)</b>
									</th>
									<th class="styIRS990EZTableCellD" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center;vertical-align:top;" scope="col">
										<b>(d)</b> Health benefits, contributions to employee benefit plans, and<br/> deferred compensation</th>
									<th class="styIRS990EZTableCellE" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; text-align: center;vertical-align:top;" scope="col">
										<b>(e)</b> Estimated amount <br/>of other compensation</th>
								</tr>
							</thead>
							<tfoot/>
							
							<tbody>
								<xsl:for-each select="$IRS990EZData/OfficerDirectorTrusteeEmplGrp">
									<xsl:if test="($Print != $Separated) or (count($IRS990EZData/OfficerDirectorTrusteeEmplGrp) &lt;=3)">
										<tr style="height: 10mm">
											<td class="styIRS990EZTableCellA" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;text-align:left;">
										<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
														<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
												
														<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br></br>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
												<br></br>
												
													<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TitleTxt"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
											<td class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
											
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AverageHrsPerWkDevotedToPosRt"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
											<td class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CompensationAmt"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
											<td class="styIRS990EZTableCellD" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EmployeeBenefitProgramAmt"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
											<td class="styIRS990EZTableCellE" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExpenseAccountOtherAllwncAmt"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="($Print = $Separated) and (count($IRS990EZData/OfficerDirectorTrusteeEmplGrp) &gt;4)">
									<xsl:call-template name="AddRowsPartIV">
										<xsl:with-param name="NumOfRows" select="4"/>
										<xsl:with-param name="ODCount" select="0"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($IRS990EZData/OfficerDirectorTrusteeEmplGrp) &lt;=4)">
									<xsl:call-template name="AddRowsPartIV">
										<xsl:with-param name="NumOfRows" select="4"/>
										<xsl:with-param name="ODCount" select="count($IRS990EZData/OfficerDirectorTrusteeEmplGrp)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!--<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeEmplGrp"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'ODctn' "/>
					</xsl:call-template>-->
					<!--   END PART IV TABLE   -->
					<!-- BEGIN FOOTER -->
					<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:70px"/>
    Form <span class="styBoldText" style="font-size: 8pt"> 990-EZ </span> (2017)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div style="width:187mm">
						<div style="float: left; clear: none">Form 990-EZ (2017)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN PART V HEADER   -->
					<div class="styBB" style="height:auto;float: none; clear:both; width: 187mm; border-top-width: 1px; border-bottom-width: 1px; font-size:8pt">
						<div class="styPartName" style="float:left;clear:none;height: 4.5mm;width:15mm; padding-top: .5mm">
							<b>Part <span style="font-size: 8.75pt">&#8548;</span></b>
						</div>
						<div class="styPartDesc" style="float:left;clear:none;height: auto;width:35mm;padding-top: .5mm">Other Information</div>
						<div class="styNormalText" style="float:left;clear:none;height: 4.5mm;width:126mm;padding-top: .5mm">(Note the Schedule A and personal benefit contract statement requirements in the </div>
						
						<span class="styNormalText" style="font-size: 7pt; width:186mm; padding-left: 18mm"> instructions for Part V.) Check if the organization used Schedule O to respond to any question in this Part V<span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">.......</span>
                          <input type="checkbox" class="styIRS990EZCkBox" alt="InfoInScheduleOPartVInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartVInd"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartV</xsl:with-param>
							</xsl:call-template>
						</input>
				<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartVInd"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartV</xsl:with-param>
							</xsl:call-template>
                </label>
              </span>
      		</div>
					<!--   END PART V HEADER   -->
					<!--   BEGIN LINE 33   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:150mm;height:5mm;">
							
						</div>
						<div class="styIRS990EZYesNoBox" style="width:8mm;height:4.5mm;margin-top:0.3mm;border-left-width:0px;border-bottom-width:1;padding-top:1mm;">
							<span style="width:1px;"/>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;margin-top:0.3mm;border-top-width:1px;border-bottom-width:1;padding-top:1mm;">
							<b>Yes</b>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;margin-top:0.3mm;border-top-width:1px;border-bottom-width:1;padding-top:1mm;">
							<b>No</b>
						</div>
					</div>
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">33</div>
						<div class="styLNDesc" style="width:150mm;height:8mm;">
						<span style="float:left;">Did the organization engage in any significant activity not previously reported to the IRS?  If "Yes," provide a </span>
						<span style="float:left;white-space:nowrap;">detailed description of each activity in Schedule O						
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ActivitiesNotPreviouslyRptInd"/>
								<!--<xsl:with-param name="TabOrder" select="6"/>-->
							</xsl:call-template>
						</span>
						<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>							
						</div>
						
						<div class="styLNRightNumBox" style="height:4.5mm;height:8mm;padding-top:4mm;">33</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ActivitiesNotPreviouslyRptInd"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ActivitiesNotPreviouslyRptInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 33   -->
					<!--   BEGIN LINE 34   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">34</div>
						<div class="styLNDesc" style="width:150mm;height:11mm;">
						<span style="float:left;">Were any significant changes made to the organizing or governing documents?  If "Yes," attach a conformed copy                 </span>
						<span style="float:left;">of the amended documents if they reflect a change to the organization’s name.  Otherwise, explain the change</span>
						 <span style="float:left;">on Schedule O (see instructions)
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ChgMadeToOrgnzngDocNotRptInd"/>
							</xsl:call-template></span>
					     <span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:6mm;">34</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:11mm;padding-top:6mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ChgMadeToOrgnzngDocNotRptInd"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:11mm;padding-top:6mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ChgMadeToOrgnzngDocNotRptInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 34   -->
					
					<!--   BEGIN LINE 35A   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">35a</div>
						<div class="styLNDesc" style="width:150mm;height:8mm;">
						<span style="float:left;">Did the organization have unrelated business gross income of $1,000 or more during the year from business </span>
						<span style="float:left;white-space:nowrap;">activities (such as those reported on lines 2, 6a, and 7a, among others)?
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationHadUBIInd"/>
							</xsl:call-template></span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;height:8mm;padding-top:4mm;">35a</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationHadUBIInd"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationHadUBIInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   BEGIN LINE 35B   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:150mm;">
						If "Yes," to line 35a, has the organization filed a Form 990-T for the year?  If "No," provide <span style="font-size:6pt;">an explanation in Schedule O</span>						
					   </div>
						<div class="styLNRightNumBox" style="height:4.5mm; ">35b</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationFiled990TInd"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationFiled990TInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   BEGIN LINE 35C   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:150mm;height:7.5mm;">
						<span style="float:left;white-space:nowrap;">Was the organization a section 501(c)(4), 501(c)(5), or 501(c)(6) organization subject to section 6033(e) </span>
						<span style="float:left;white-space:nowrap;">notice, reporting, and proxy tax requirements during the year?  If "Yes," complete Schedule C, Part III</span>
						<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/SubjectToProxyTaxInd"/>
							</xsl:call-template>
                            <!-- <span class="styDotLn" style="float:right;padding-right:1mm;"></span>-->   
                         
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">35c</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:7.5mm;padding-top:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/SubjectToProxyTaxInd"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:7.5mm;padding-top:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/SubjectToProxyTaxInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 35   -->
					<!--   BEGIN LINE 36   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">36</div>
						<div class="styLNDesc" style="width:150mm;height:8mm;">
						 <span style="float:left;">Did the organization undergo a liquidation, dissolution, termination, or significant disposition of net assets during</span>
						 <span style="float:left;"> the year? If “Yes," complete applicable parts of Schedule N
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationDissolvedEtcInd"/>
							</xsl:call-template></span>
						<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>    
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">36</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationDissolvedEtcInd"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationDissolvedEtcInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 36   -->
					<!--   BEGIN LINE 37A   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">37a</div>
						<div class="styLNDesc" style="width:110mm;font-size:6pt;">Enter amount of political expenditures, direct or indirect, as described in the instructions.
    <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">37a</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/DirectIndirectPltclExpendAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
					</div>
					<!--   END LINE 37A   -->
					<!--   BEGIN LINE 37B   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:150mm;">
						     <span style="float:left;">Did the organization file <b>Form 1120-POL</b> for this year?</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>   
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">37b</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/Form1120PolFiledInd"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/Form1120PolFiledInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 37B   -->
					<!--   BEGIN LINE 38A   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">38a</div>
						<div class="styLNDesc" style="width:150mm;">Did the organization borrow from, or make any loans to, any officer, director, trustee, or key employee <b>or</b> were</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
					</div>
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;"/>
						<div class="styLNDesc" style="width:150mm;">
						     <span style="float:left;">any such loans made in a prior year and still outstanding at the end of the tax year covered by this return?</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>   
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">38a</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/MadeLoansToFromOfficersInd"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/MadeLoansToFromOfficersInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 38A   -->
					<!--   BEGIN LINE 38B   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:110mm;height:4mm;">
						     <span style="float:left;">If “Yes," complete Schedule L, Part II and enter the total amount involved
    <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/LoansToFromOfficersAmt"/>
							</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>   
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">38b</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/LoansToFromOfficersAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
					</div>
					<!--   END LINE 38B   -->
					<!--   BEGIN LINE 39   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">39</div>
						<div class="styLNDesc" style="width:110mm;">
							<!--<i>-->Section 501(c)(7) organizations.<!--</i>--> Enter:</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0;background-color:none;"/>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
					</div>
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:110mm;">
						     <span style="float:left;">Initiation fees and capital contributions included on line 9</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>   
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">39a</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount" >
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InitiationFeesAndCapContriAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
					</div>
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:110mm;">
						     <span style="float:left;">Gross receipts, included on line 9, for public use of club facilities</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>   
						</div>
						<div class="styLNRightNumBox">39b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/GrossReceiptsForPublicUseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
					</div>
					<!--   END LINE 39   -->
					<!--   BEGIN LINE 40a   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">40a</div>
						<div class="styLNDesc" style="width:150mm;">
							<!--<i>-->Section 501(c)(3) organizations.<!--</i>--> Enter amount of tax imposed on the organization during the year under:</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
					</div>
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;"/>
						<div class="styLNDesc" style="width:150mm;font-size:6pt;">
    section 4911 <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span class="styIRS990EZUnderlinedBox" style="text-align: right; width: 29mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TaxImposedUnderIRC4911Amt"/>
								</xsl:call-template>
							</span>
    ; section 4912 <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span class="styIRS990EZUnderlinedBox" style="width: 29mm; text-align: right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TaxImposedUnderIRC4912Amt"/>
								</xsl:call-template>
							</span>
    ; section 4955 <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span class="styIRS990EZUnderlinedBox" style="width: 29mm; text-align: right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TaxImposedUnderIRC4955Amt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0;"/>
					</div>
					<!--   END LINE 40a   -->
					<!--   BEGIN LINE 40B   -->
					<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:150mm;height:11mm;">
							<span style="float:left;white-space:nowrap;">Section 501(c)(3), 501(c)(4), and 501(c)(29) organizations. Did the organization engage in any section 4958 </span>
			                <span style="float:left;white-space:nowrap;">excess benefit transaction during the year, or did it engage in an excess benefit transaction in a prior year that </span>
  		                     <span style="float:left;white-space:nowrap;">has not been reported on any of its prior Forms 990 or 990-EZ? If “Yes," complete Schedule L, Part I
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/EngagedInExcessBenefitTransInd"/>
								<!--<xsl:with-param name="TabOrder" select="9"/>-->
							</xsl:call-template></span>
							<span class="styDotLn" style="float:right;padding-right:1mm;"></span>   
						</div>

						<div class="styLNRightNumBox" style="padding-top:7mm;height:12mm;border-top-width:0px;">40b</div>
						<div class="styIRS990EZYesNoBox" style="height:12mm;border-top-width:0px;padding-top:6.5mm">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/EngagedInExcessBenefitTransInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:12mm;border-top-width:0px;padding-top:6.5mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/EngagedInExcessBenefitTransInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   BEGIN LINE 40C   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:150mm;font-size:7pt">
						     <span style="float:left;white-space:nowrap;">Section 501(c)(3), 501(c)(4), and 501(c)(29) organizations. Enter amount of tax imposed on organization 
						     </span> 					
						     <span style="float:left;white-space:nowrap;">managers or disqualified persons during the year under sections</span>
						      <span style="float:left;white-space:nowrap;"> 4912, 4955, and 4958</span>
						     <span style="float:right;">
                             <span class="styDotLn" style="padding-right:1mm;"></span>					
							<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet" style="padding-top: .75mm;"/>
							<span class="styIRS990EZUnderlinedBox" style="width: 30mm;text-align: right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TaxImposedOnOrganizationMgrAmt"/>
								</xsl:call-template>
							</span>
							</span>
							
						</div>
						<span class="styIRS990EZYesNoBox" style="width:8mm;height:8mm;border-left-width:1px;border-bottom-width:0;background:lightgrey;">
							<span style="width:1px;"/>
						</span>
						<span class="styIRS990EZYesNoBox" style="width:10mm;height:8mm;border-top-width:0px;border-bottom-width:0;background:lightgrey;"/>
						<span class="styIRS990EZYesNoBox" style="width:10mm;height:8mm;border-top-width:0px;border-bottom-width:0;background:lightgrey;"/>
					</div>
					<!--   END LINE 40C  -->
					<!--   BEGIN LINE 40D   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:150mm;font-size:7pt">
						     <span style="float:left;white-space:nowrap;">Section 501(c)(3), 501(c)(4), and 501(c)(29) organizations. Enter amount of tax on line 40c reimbursed</span>
						     <span style="float:left;white-space:nowrap;"> by the organization</span>
						    <span style="float:right;">
                             <span class="styDotLn" style="padding-right:1mm;"></span>	
							<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet" style="padding-top: .75mm;"/>
							<span class="styIRS990EZUnderlinedBox" style="height:auto;width: 30mm;text-align: right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TaxReimbursedByOrganizationAmt"/>
								</xsl:call-template>
							</span>
							</span>
						</div>
						<span class="styIRS990EZYesNoBox" style="width:8mm;height:8mm;border-left-width:1px;border-bottom-width:0;background:lightgrey;">
							<span style="width:1px;"/>
						</span>
						<span class="styIRS990EZYesNoBox" style="width:10mm;height:8mm;border-top-width:0px;border-bottom-width:0;background:lightgrey;"/>
						<span class="styIRS990EZYesNoBox" style="width:10mm;height:8mm;border-top-width:0px;border-bottom-width:0;background:lightgrey;"/>
					</div>
					<!--   END LINE 40D  -->
					<!--   BEGIN LINE 40E   -->
					<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
							<div class="styLNDesc" style="width:150mm;padding-bottom:.5mm;">
							<span style="float:left;white-space:nowrap;">All organizations. At any time during the tax year, was the organization a party to a prohibited tax shelter</span>
							<span style="float:left;white-space:nowrap;"> transaction? If "Yes," complete Form 8886-T	</span>    
							<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">................</span> 
						</div>
						
						<div class="styLNRightNumBox" style="padding-top:1mm;border-top-width:1px;height:5.5mm;">40e</div>
						<div class="styIRS990EZYesNoBox" style="padding-top:1mm;border-top-width:1px;height:5.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ProhibitedTaxShelterTransInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="padding-top:1mm;border-top-width:1px;height:5.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ProhibitedTaxShelterTransInd"/>
							</xsl:call-template>
						</div>
					</div>
				
					<!--   END LINE 40E   -->
					<!--   BEGIN LINE 41   -->
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLeftNumBox" style="width:5mm;padding-bottom:1mm;">41</span>
						<span class="styIRS990EZLNLongDesc" style="width: 62mm;padding-top:1mm;">List the states with which a copy of this return is filed. 
    <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
						</span>
						<span class="styIRS990EZUnderlinedBox" style="width: 115mm;padding-top:1mm; font-size: 6pt; ">
							<xsl:if test="($Print = $Separated) and (count($IRS990EZData/StatesWhereCopyOfReturnIsFldCd) &gt;25)">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/StatesWhereCopyOfReturnIsFldCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($IRS990EZData/StatesWhereCopyOfReturnIsFldCd) &lt;26))">
								<xsl:for-each select="$IRS990EZData/StatesWhereCopyOfReturnIsFldCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<xsl:if test="position()!=last()">
										<span style="width: 2px;">, </span>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
						</span>
					</div>
					<!--   END LINE 41   -->
					<!--   BEGIN LINE 42   -->
					<div class="styIRS990EZLineItem" style="width: 180mm;">
						<span class="styIRS990EZLNLeftNumBox" style="width:5mm;">42a</span>
						<span class="styIRS990EZLNLongDesc" style="width: 180mm;font-size:6.5pt;height:6mm;">The organization's books are in care of
    <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 3px;"/>
							<span class="styIRS990EZUnderlinedBox" style="border-style: solid; width: 87mm;font-size:5.85pt;height:auto;">
								<xsl:if test="$IRS990EZData/BooksInCareOfDetail/PersonNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/PersonNm"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$IRS990EZData/BooksInCareOfDetail/BusinessName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
								</xsl:if>
								<br></br>
								<xsl:if test="$IRS990EZData/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt">
									<xsl:if test="$IRS990EZData/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt != ''">
										
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<span style="width: 3px;"/>
							<span style="font-size:6.5pt"> Telephone no.</span> 
							<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 3px"/>
							<span class="styIRS990EZUnderlinedBox" style="border-style: solid; width: 23mm; font-size:6.5pt;">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/PhoneNum"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLeftNumBox" style="font-size:6pt"/>
						<span class="styIRS990EZLNLongDesc" style="margin-left: 5.5mm; width: 177mm;font-size:7pt">Located at
    <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 4px"/>
							<span class="styIRS990EZUnderlinedBox" style="border-style: solid; width: 116mm; font-size: 6pt">
								<xsl:if test="count($IRS990EZData/BooksInCareOfDetail/USAddress) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<span style="width: 3px"/>
									<xsl:if test="$IRS990EZData/BooksInCareOfDetail/USAddress/AddressLine2Txt != ''">
											<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/USAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<span style="width: 3px"/>
									<xsl:if test="$IRS990EZData/BooksInCareOfDetail/USAddress/CityNm != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/USAddress/CityNm"/>
										</xsl:call-template>
										</xsl:if>
									<span style="width: 3px"/>
				<xsl:if test="$IRS990EZData/BooksInCareOfDetail/USAddress/CityNm != '' and $IRS990EZData/BooksInCareOfDetail/USAddress/StateAbbreviationCd != ''">,</xsl:if>
									<xsl:if test="$IRS990EZData/BooksInCareOfDetail/USAddress/StateAbbreviationCd != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/USAddress/StateAbbreviationCd"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
								<span style="width: 3px"/>
								<xsl:if test="count($IRS990EZData/BooksInCareOfDetail/ForeignAddress) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<span style="width: 3px"/>
									<xsl:if test="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/AddressLine2Txt != ''">
										
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<span style="width: 3px"/>
									<xsl:if test="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/CityNm != ''">
										
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/CityNm"/>
										</xsl:call-template>
									</xsl:if>
									<span style="width: 3px"/>
									<xsl:if test="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/CityNm != '' and $IRS990EZData/BooksInCareOfDetail/ForeignAddress/ProvinceOrStateNm != ''">,</xsl:if>
									<xsl:if test="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/ProvinceOrStateNm != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/ProvinceOrStateNm"/>
										</xsl:call-template>
									</xsl:if>
									<span style="width: 3px"/>
									<xsl:if test="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/CountryCd != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
									<span style="width: 3px"/>
								</xsl:if>
							</span>
						<span style="padding-left:2mm">
     ZIP + 4</span>
     <span style="padding-right:1mm;padding-left:2mm">
    <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/></span>
							<span class="styIRS990EZUnderlinedBox" style="border-style: solid; width: 24mm; height:auto;">
								<xsl:if test="count($IRS990EZData/BooksInCareOfDetail/USAddress) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/USAddress/ZIPCd"/>
									</xsl:call-template>
								</xsl:if>
								<span style="width: 3px"/>
								<xsl:if test="count($IRS990EZData/BooksInCareOfDetail/ForeignAddress) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/BooksInCareOfDetail/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</span>
					</div>
						<div style="width: 187mm; height: auto;">
						<div class="styIRS990EZYesNoBox" style="width: 10mm; height: auto; padding-top: 1mm; margin-top: 3mm; margin-left: 166mm; border-top-width: 1px; border-bottom-width: 0px;">
							<b>Yes</b>
						</div>
						<div class="styIRS990EZYesNoBox" style="width: 10mm; height: auto; padding-top: 1mm; margin-top: 3mm; border-top-width: 1px; border-bottom-width: 0px;">
							<b>No</b>
						</div>
						
						<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="height: 7.5mm; padding-left: 4mm;">
							b
						</div><div class="styLNDesc" style="width: 150mm; height: auto;">
							At any time during the calendar year, did the organization have an interest in or a signature or other authority over a financial account in a foreign country (such as a bank account, securities account, or other financial account)? 
							<span class="styIRS990EZNBSP"></span>.            
							<span class="styIRS990EZNBSP"></span>.                  
						</div>
						<div class="styLNRightNumBox" style="height: 7.5mm; padding-top: 1.5mm; border-top-width: 1px;">
							42b
						</div>
						<div class="styIRS990EZYesNoBox" style="height: 7.5mm; border-top-width: 1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignFinancialAccountInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:7.5mm;border-top-width:1px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignFinancialAccountInd"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				
					<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">
          If “Yes," enter the name of the foreign country:      
        <img src="{$ImagePath}/990_Bullet_Md.gif" alt="bullet"/>
							<span class="styFixedUnderline" style="width:80mm;float:none;padding-left:2mm;padding-top:0;padding-bottom:0;">
								<xsl:if test="(count($IRS990EZData/ForeignFinancialAccountCntryCd) &lt;= 25) or ((count($IRS990EZData/ForeignFinancialAccountCntryCd) &gt; 25) and ($Print != $Separated))">
								<xsl:for-each select="$IRS990EZData/ForeignFinancialAccountCntryCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<xsl:if test="position()!=last()">
                               <span style="width: 2px;">, </span>
                              </xsl:if>
                             </xsl:for-each>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ForeignFinancialAccountCntryCd) &gt; 25) ">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignFinancialAccountCntryCd"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
						<div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
					</div>
				
					<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="height:6.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:150mm;height:6.5mm;">
						<!-- Removed period after "Accounts" per pdf review. PDF has it but DOW doesn't. -->
          See the instructions for exceptions and filing requirements for FinCEN Form 114, Report of Foreign Bank and Financial Accounts (FBAR)
						</div>
						<div class="styShadingCell" style="width:8mm;height:6.5mm;"/>
						<div class="styShadingCell" style="width:10mm;height:6.5mm;"/>
						<div class="styShadingCell" style="width:10mm;height:6.5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">
         At any time during the calendar year, did the organization maintain an office outside the U.S.?
         <span class="styIRS990EZNBSP"/>.
            <span class="styIRS990EZNBSP"/>.
            <span class="styIRS990EZNBSP"/>.
            
      </div>
						<div class="styLNRightNumBox" style="height:4.5mm;">42c</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignOfficeInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignOfficeInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;"/>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">
         If “Yes," enter the name of the foreign country:
        <img src="{$ImagePath}/990_Bullet_Md.gif" alt="bullet"/>
							<span class="styFixedUnderline" style="width:80mm;float:none;padding-left:2mm;">
						<xsl:if test="(count($IRS990EZData/ForeignOfficeCountryCd) &lt;= 25) or ((count($IRS990EZData/ForeignOfficeCountryCd) &gt; 25) and ($Print != $Separated))">
								<xsl:for-each select="$IRS990EZData/ForeignOfficeCountryCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<xsl:if test="position()!=last()">
                                    <span style="width: 2px;">, </span>
                                   </xsl:if>
                                   </xsl:for-each>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ForeignOfficeCountryCd) &gt; 25) ">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignOfficeCountryCd"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
					</div>
				
					<!--   END LINE 42   -->
					<!--   BEGIN LINE 43   -->
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLeftNumBox">43</span>
						<span class="styIRS990EZLNLongDesc" style="width: 179mm; font-size: 7pt;height:4.5mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/NECTFilingForm990Ind"/>
									<xsl:with-param name="BackupName">IRS990EZNECTFilingForm990</xsl:with-param>
								</xsl:call-template>
    Section 4947(a)(1) nonexempt charitable trusts filing Form 990-EZ in lieu of <b>Form 1041 - </b> Check here </label>
							<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">......</span>
							
							<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span style="padding-left:1mm">
							<input type="checkbox" class="styIRS990EZCkBox" alt="NECTFilingForm990Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/NECTFilingForm990Ind"/>
									<xsl:with-param name="BackupName">IRS990EZNECTFilingForm990</xsl:with-param>
								</xsl:call-template>
							</input></span>
						</span>
					</div>
					<div class="styIRS990EZLineItem" style="border-bottom-width: 0px">
						<span class="styIRS990EZLNLeftNumBox" style="font-size:6pt;width:4mm;"/>
						<span class="styIRS990EZLNLongDesc" style="width: 135mm; font-size:7pt;height:auto;">
						<span style="float:left;">and enter the amount of tax-exempt interest received or accrued during the tax year</span>
 <span class="styDotLn" style="float:right;padding-right:1mm;">....<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/></span>
						</span>
						<span class="styLNRightNumBox" style="border-bottom-width: 1px">43</span>
						<div class="styLNAmountBox" style="border-bottom-width: 1px; width: 36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/NECTFilingForm990Ind/@interestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 43   -->
					<!-- BEGIN LINE 44a  -->
                     <div style="width:187mm;margin-top:0.3mm;">
	                 <div class="styLNLeftNumBox" style="height:4.5mm;"/>
	                 <div class="styLNDesc" style="width:150mm;height:4.5mm;"/>
	                 <div class="styIRS990EZYesNoBox" style="width:8mm;height:4.5mm;border-left-width:0px;border-bottom-width:1;padding-top:1.2mm;">
							<span style="width:1px;"/>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;border-top-width:1px;border-bottom-width:1;padding-top:1mm;">
							<b>Yes</b>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;border-top-width:1px;border-bottom-width:1;padding-top:1mm;">
							<b>No</b>
						</div>
	                 </div>
					
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">44a</div>
						<div class="styLNDesc" style="width:150mm;">
        <span style="float:left;white-space:nowrap;">Did the organization maintain any donor advised funds during the year? If "Yes," Form 990 must be completed instead</span>
        <span style="float:left;white-space:nowrap;">of Form 990-EZ</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
</div>
						
						 <div class="styShadingCell" style="height:2.5mm;width:8mm;"/>
      <div class="styShadingCell" style="height:2.5mm;width:10mm;"/>
      <div class="styShadingCell" style="height:2.5mm;width:10mm;"/> 
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px">44a</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/DonorAdvisedFndsInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/DonorAdvisedFndsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 44a  -->
					<!--  BEGIN LINE 44b -->
									<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:150mm;">
        <span style="float:left;white-space:nowrap;">Did the organization operate one or more hospital facilities during the year? If "Yes," Form 990 must be completed</span>
        <span style="float:left;white-space:nowrap;">instead of Form 990-EZ</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
</div>
						
						 <div class="styShadingCell" style="height:2.5mm;width:8mm;"/>
      <div class="styShadingCell" style="height:2.5mm;width:10mm;"/>
      <div class="styShadingCell" style="height:2.5mm;width:10mm;"/> 
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px">44b</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OperateHospitalInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OperateHospitalInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End 44b -->
					<!--  BEGIN LINE 44c -->
						<div style="width:187mm;">
						<!--style="height:4.5mm;padding-left:4mm;">c</div>-->
						<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:150mm;">
                             <span style="float:left;">Did the organization receive any payments for indoor tanning services during the year?</span>
							 <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>    
                        </div>
		<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px;border-top-width:1px;">44c</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:1px;border-top-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/TanningServicesProvidedInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:1px;border-top-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/TanningServicesProvidedInd"/>
							</xsl:call-template>
						</div>
                        </div>
                     
					<!-- End 44c -->
					<!--  BEGIN LINE 44d -->
									<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:150mm;">
							<span style="float:left;">If "Yes," to line 44c, has the organization filed a Form 720 to report these payments?  <i> If "No," provide an</i></span><br/> 
							<span style="float:left;"><i>explanation in Schedule O </i></span><span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
							 
                        </div>
						 <div class="styShadingCell" style="height:2.5mm;width:8mm;"/>
                         <div class="styShadingCell" style="height:2.5mm;width:10mm;"/>
                         <div class="styShadingCell" style="height:2.5mm;width:10mm;"/> 
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px">44d</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/Form720FiledInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/Form720FiledInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End 44d -->
					<!--  BEGIN LINE 45a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">45a</div>
						<div class="styLNDesc" style="width:150mm;">
         <span style="float:left;">Did the organization have a controlled entity within 
          the meaning of section 512(b)(13)?</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>    
      			          </div>
						
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px;">45a</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrganizationCtrlEntInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrganizationCtrlEntInd"/>
							</xsl:call-template>
						</div>
				</div>
					
					<!--  END LINE 45a  -->
					<!--  BEGIN LINE 45b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">45b</div>
						<div class="styLNDesc" style="width:150mm;height:auto;">
         <span style="float:left;">Did the organization receive any payment from or engage in any transaction with a controlled entity within the 
meaning of section 512(b)(13)? If "Yes," Form 990 and Schedule R may need to be completed instead of</span>
         <span style="float:left;"> Form 990-EZ (see instructions)</span>
         
         <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........................</span>
			</div>
						
						 <div class="styShadingCell" style="height:5.5mm;width:8mm;padding-top:1mm;"/>
      <div class="styShadingCell" style="height:5.5mm;width:10mm;padding-top:1mm;"/>
      <div class="styShadingCell" style="height:5.5mm;width:10mm;padding-top:1mm;"/> 
						<div class="styLNRightNumBox" style="height:5.5mm;border-bottom-width:0px;padding-top:1mm;">45b</div>
						<div class="styIRS990EZYesNoBox" style="height:5.5mm;border-bottom-width:0px;text-align: bottom;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/TransactionWithControlEntInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:5.5mm;border-bottom-width:0px;text-align: bottom;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/TransactionWithControlEntInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 45b  -->
					<!-- BEGIN FOOTER -->
					<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:70px"/>
    Form <span class="styBoldText" style="font-size: 8pt"> 990-EZ </span> (2017)
  </div>
					</div>
					
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
					<div style="page-break-before:always;"></div>
		<!--BEGIN HEADER-->
					<div class="styBB" style="width:187mm; padding-bottom:.5mm;">
						<div style="float: left; clear: none">Form 990-EZ (2017)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!--END HEADER-->
					
			<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;"/>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;padding-top:2mm;">
      
    </div>
						<div class="styIRS990EZYesNoBox" style="width:8mm;height:6mm;border-left-width:0px;border-bottom-width:1;padding-top:1mm;">
							<span style="width:1px;"/>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:6mm;border-bottom-width:1;">
							<b>Yes</b>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:6mm;border-bottom-width:1;">
							<b>No</b>
						</div>	
</div>
					<!--  BEGIN LINE 46 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">46</div>
						<div class="styLNDesc" style="width:150mm;Height:auto;">
                             <span style="float:left;">Did the organization engage, directly or indirectly, in political campaign activities on behalf of or in opposition to</span>
                             <span style="float:left;">candidates for public office? If “Yes," complete Schedule C, Part I.
                                 <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/PoliticalCampaignActyInd"/>
								 </xsl:call-template></span>
                            <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...........</span>
</div>
						
						 <div class="styShadingCell" style="height:4.5mm;width:8mm;"/>
                         <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
                         <div class="styShadingCell" style="height:4.5mm;width:10mm;"/> 
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px">46</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/PoliticalCampaignActyInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/PoliticalCampaignActyInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 46  -->
					
					<!--   BEGIN PART VI HEADER   -->
					<div class="styBB" style="float: none; clear:both; width: 187mm; border-top-width: 1px; border-bottom-width: 1px; font-size:8pt">
						<div class="styPartName" style="float:left;clear:none;height: 4.5mm;width:14mm; padding-top: .5mm">
							Part <span style="font-size: 8.75pt">&#8549;</span>
						</div>
						<div class="styPartDesc" style="float:left;clear:none;height: auto;width:173mm;padding-top: .5mm">Section 501(c)(3) organizations only
						<span class="styNormalText" style="height: 4.5mm;padding-top: .5mm;">All section 501(c)(3) organizations must answer questions 47- 49b and 52, and complete the tables for lines 50 and 51.
						<span class="styNormalText" style="font-size: 7pt; width:165mm;">
						<span style="float:left;"> Check if the organization used Schedule O to respond to any question in this Part VI   </span>       
                       
					    <!--<span class="styDotLn" style="padding-right:2mm;">............</span> Removed to test JAWS--> 
					    <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">..................</span>  					
					         <input type="checkbox" class="styIRS990EZCkBox" alt="InfoInScheduleOPartVIInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartVIInd"/>
									<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartVI</xsl:with-param>
								</xsl:call-template>
							</input>
				<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartVIInd"/>
									<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartVI</xsl:with-param>
								</xsl:call-template>
					        </label>
                                     
                       </span>
					</span>
					</div></div>
					<!--   END PART VI HEADER   -->
					<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;"/>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;padding-top:2mm;">
      
    </div>
						<div class="styIRS990EZYesNoBox" style="width:8mm;height:6mm;border-left-width:0px;border-bottom-width:1;padding-top:1mm;">
							<span style="width:1px;"/>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:6mm;border-bottom-width:1;">
							<b>Yes</b>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:6mm;border-bottom-width:1;">
							<b>No</b>
						</div>
						
						
							<div class="styLNLeftNumBox" style="height:9.5mm;padding-top:2mm">47</div>
							<div class="styLNDesc" style="width:150mm;height:9.5mm;padding-top:2mm;">
                                 <span style="float:left;">Did the organization engage in lobbying activities or have a section 501(h) election   in effect during the tax year? </span>
                                 <span style="float:left;">If "Yes," complete Schedule C, Part II       
                                <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/LobbyingActivitiesInd"/>
								</xsl:call-template></span>
                                 <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>           
                            </div>
							<div class="styLNRightNumBox" style="height:9.5mm;border-top-width:0px;padding-top:5mm;">47</div>
							<div class="styIRS990EZYesNoBox" style="height:9.5mm;border-top-width:0px;padding-top:5mm;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/LobbyingActivitiesInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS990EZYesNoBox" style="height:9.5mm;border-top-width:0px;padding-top:5mm;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/LobbyingActivitiesInd"/>
								</xsl:call-template>
							</div>
						<div style="width:187mm;float:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;">48</div>
							<div class="styLNDesc" style="width:150mm;height:4.5mm;padding-top:2mm;">
							<span style="float:left;">
                                 Is the organization a school as described in section 170(b)(1)(A)(ii)? <span style="normal text">If "Yes,"  complete Schedule E </span>
                               
                               <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/SchoolOperatingInd"/>
								</xsl:call-template>
								</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>   
     			
							</div>
							<div class="styLNRightNumBox" style="height:6mm;border-top-width:0px;padding-top:1mm;">48</div>
							<div class="styIRS990EZYesNoBox" style="height:6mm;border-top-width:0px">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/SchoolOperatingInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS990EZYesNoBox" style="height:6mm;border-top-width:0px">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/SchoolOperatingInd"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;float:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;">49a</div>
							<div class="styLNDesc" style="width:150mm;height:4.5mm;padding-top:2mm;">
							     <span style="float:left;">Did the organization make any transfers to an exempt non-charitable related organization?</span>
                                 <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>   
     </div>
							<div class="styLNRightNumBox" style="height:6mm;border-top-width:0px;padding-top:1mm;">49a</div>
							<div class="styIRS990EZYesNoBox" style="height:6mm;border-top-width:0px">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TrnsfrExmptNonChrtblRltdOrgInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS990EZYesNoBox" style="height:6mm;border-top-width:0px">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TrnsfrExmptNonChrtblRltdOrgInd"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;float:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:150mm;height:4.5mm;padding-top:2mm;">
                                 <span style="float:left;">If "Yes," was the related organization a section 527 organization?</span>
                                 <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>   
                            </div>
							<div class="styLNRightNumBox" style="height:6mm;border-top-width:0px;padding-top:1mm;">49b</div>
							<div class="styIRS990EZYesNoBox" style="height:6mm;border-top-width:0px">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrgSect527OrgInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS990EZYesNoBox" style="height:6mm;border-top-width:0px">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrgSect527OrgInd"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- BEGIN LINE 50 -->
						<div style="width:187mm;float:none;">
							<div class="styLNLeftNumBox" style="height:auto;padding-top:2mm;">50</div>
							<div class="styLNDesc" style="width:177mm;height:auto;padding-top:2mm;">
      Complete this table for the organization's five highest compensated employees (other than officers, directors, trustees and key employees) who each received more than $100,000 of compensation from the organization. If there is none, enter "None."
     </div>
						</div>
						<div style="float:right">
							<!-- button display logic -->
					<!--	<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/CompensationHighestPaidEmplGrp"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="containerID" select="'HDctn'"/>
							</xsl:call-template>-->
							<!-- end button display logic -->
						</div>
						<div class="styTable" style="height: 44mm;width: 187mm;" id="HDctn">
							<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
							<!--end-->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS990EZTableCellA" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;vertical-align:top;">
											<b>(a)</b> Name and title of each employee</th>
										<th class="styIRS990EZTableCellB" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;vertical-align:top;">
											<b>(b)</b> Average<br/>hours per week<br/>devoted to position</th>
										<th class="styIRS990EZTableCellC" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;vertical-align:top;">
											<b>(c)</b> Reportable compensation<br/> (Forms W-2/1099-MISC)
										</th>
										<th class="styIRS990EZTableCellD" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;vertical-align:top;">
											<b>(d)</b> Health benefits, contributions to employee benefit plans, and deferred compensation</th>
										<th class="styIRS990EZTableCellE" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; text-align: center;vertical-align:top;">
											<b>(e)</b> Estimated amount of other compensation </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$IRS990EZData/CompensationHighestPaidEmplGrp">
										<xsl:if test="($Print != $Separated) or (count($IRS990EZData/CompensationHighestPaidEmplGrp) &lt;=3)">
											<tr style="height: 10mm">
												<td class="styIRS990EZTableCellA" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">												
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
															</xsl:call-template>												
															<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TitleTxt"/>
														</xsl:call-template>												
													</td>
												<td class="styIRS990EZTableCellB" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">												
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AverageHoursPerWeekRt"/>
													</xsl:call-template>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellC" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CompensationAmt"/>
													</xsl:call-template>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellD" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="EmployeeBenefitsAmt"/>
													</xsl:call-template>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellE" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ExpenseAccountAmt"/>
													</xsl:call-template>
													<span class="styIRS990EZTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="($Print = $Separated) and (count($IRS990EZData/CompensationHighestPaidEmplGrp) &gt;4)">
										<xsl:call-template name="AddRowsLine50">
											<xsl:with-param name="NumOfRows" select="4"/>
											<xsl:with-param name="ODCount" select="0"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="(count($IRS990EZData/CompensationHighestPaidEmplGrp) &lt;=4)">
										<xsl:call-template name="AddRowsLine50">
											<xsl:with-param name="NumOfRows" select="4"/>
											<xsl:with-param name="ODCount" select="count($IRS990EZData/CompensationHighestPaidEmplGrp)"/>
										</xsl:call-template>
									</xsl:if>
								</tbody>
								
							</table>
						</div>
					<!--	<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeEmplGrp"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="containerID" select=" 'HDctn' "/>
						</xsl:call-template>
						-->
						<div style="width:187mm;float:none;">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;width:10mm;padding-left:4mm;">f</div>
							
					<div class="styLNDesc" style="width:170mm;height:7.5mm;padding-top:2mm;">
                         <span style="float:left;">Total number of other employees paid over $100,000  </span>
                         <span style="float:right;">
                         <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span>
		                 <!--<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>  -->   
		                 <img alt="bullet" src="{$ImagePath}/990EZ_Bullet_Lg.gif"/>   						
									<span class="styIRS990EZUnderlinedBox" style="text-align: right;width:28mm ">									
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherEmployeePaidOver100kCnt"/>
										</xsl:call-template>
										</span>
						 </span>
						</div>
					</div><br/>
						<!-- END LINE 50 -->	
						<!--  BEGIN LINE 51 -->
						<div style="width:187mm;float:none;">
							<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:0mm;">51</div>
							<div class="styLNDesc" style="width:177mm;height:7.5mm;padding-top:0mm;">
      Complete this table for the organization's five highest compensated independent contractors who each received more than $100,000 of compensation from the organization. If there is none, enter "None."
     </div>
						</div>
						<div style="float:right">
							<!-- button display logic -->
							<!--<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/CompensationOfHghstPdCntrctGrp"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="containerID" select="'CDctn'"/>
							</xsl:call-template>-->
							<!-- end button display logic -->
						</div>
						<div class="styTable" style="height: 44mm;width: 187mm;" id="CDctn">
							<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
							<!--end-->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS990EZTableCellAA" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(a)</b> Name and business address of each independent contractor </th>
										<th class="styIRS990EZTableCellB" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(b)</b> Type of service</th>
										<th class="styIRS990EZTableCellC" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(c)</b> Compensation<br/>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$IRS990EZData/CompensationOfHghstPdCntrctGrp">
										<xsl:if test="($Print != $Separated) or (count($IRS990EZData/CompensationOfHghstPdCntrctGrp) &lt;=3)">
											<tr style="height: 10mm">
												<td class="styIRS990EZTableCellAA" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
													
													<xsl:if test="PersonNm != ''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
															<!--<xsl:with-param name="TabOrder" select="6"/>-->
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="BusinessName/BusinessNameLine1Txt != ''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="BusinessName!= ''">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="BusinessName"/>
															<!--<xsl:with-param name="TabOrder" select="6"/>-->
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="USAddress != ''">
														<br/>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="ForeignAddress != ''">
														<br/>
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellB" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ServiceTypeTxt"/>
													</xsl:call-template>
													<span style="width: 4px"/>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellC" style="height:auto;border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CompensationAmt"/>
													</xsl:call-template>
													<span class="styIRS990EZTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="($Print = $Separated) and (count($IRS990EZData/CompensationOfHghstPdCntrctGrp) &gt;4)">
										<xsl:call-template name="AddRowsLine51">
											<xsl:with-param name="NumOfRows" select="4"/>
											<xsl:with-param name="ODCount" select="0"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="(count($IRS990EZData/CompensationOfHghstPdCntrctGrp) &lt;=4)">
										<xsl:call-template name="AddRowsLine51">
											<xsl:with-param name="NumOfRows" select="4"/>
											<xsl:with-param name="ODCount" select="count($IRS990EZData/CompensationOfHghstPdCntrctGrp)"/>
										</xsl:call-template>
									</xsl:if>
								</tbody>
																	
							</table>
						</div>
					<!--	<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeEmplGrp"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="containerID" select=" 'CDctn' "/>
						</xsl:call-template>-->
					</div>
					
					
	<div style="width:187mm;float:none;">
		<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;width:10mm;padding-left:4mm;">d</div>
							
			<div class="styLNDesc" style="width:177mm;height:4.5mm;padding-top:2mm;">
			 <span style="float:left;">Total number of other independent contractors each receiving over $100,000</span>
			 <span class="styDotLn" style="padding-right:2mm;">..........</span>      
			  <!--<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>-->
			  <img alt="bullet" src="{$ImagePath}/990EZ_Bullet_Lg.gif"/>   
					<span style="padding-left:3mm">
					<span class="styIRS990EZUnderlinedBox" style="text-align: right; width: 28mm;">
								<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$IRS990EZData/CntrctRcvdGreaterThan100KCnt"/>
					</xsl:call-template>
			 </span></span>
		</div>
	</div>
	<br></br>
	<br></br>
	
					<!-- END LINE 51 -->					
            <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;">52</div>
            <div class="styLNDesc" style="width:178mm;height:auto;padding-left:3mm;padding-top:2mm;">
                 <span style="float:left;">Did the organization complete Schedule A? <b>NOTE.</b>  All section 501(c)(3) organizations must attach a 
                <br></br> completed Schedule A 
                 <!-- Dotted Line -->
             
              <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">........................................</span>
              <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>  </span>
              <span style="width:2mm;padding-left:8mm;"/><br></br>
              <input type="checkbox" class="styCkbox" alt="FiledScheduleAYesInd">
              <!--<input type="checkbox" class="styCkbox" name="Checkbox">-->
                 <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/FiledScheduleAInd"/>
                  <xsl:with-param name="BackupName">IRS990EZFiledScheduleAYes</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/FiledScheduleAInd"/>
                  <xsl:with-param name="BackupName">IRS990EZFiledScheduleAYes</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText">   Yes</span>
              </label>
              <span style="width:2mm;">
               <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/FiledScheduleAInd"/>
                </xsl:call-template>
              </span>
              <input type="checkbox" class="styCkbox" alt="FiledScheduleANoInd" onclick="return false;" id="dummyidnonexempt">
                 <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/FiledScheduleAInd"/>
                  <xsl:with-param name="BackupName">IRS990EZFiledScheduleANo</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
               <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/FiledScheduleAInd"/>
                  <xsl:with-param name="BackupName">IRS990EZFiledScheduleANo</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText">   No</span>
              </label>
             
           
            </div>
              </div>								
										<!-- BEGIN Signature Section -->
					<div class="styIRS990EZLineItem" style="width:187mm;border-bottom-width: 1px;display:inline;"/>
					<!-- Implementing the signature section in table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;height:100%;display:inline;">
						<tr>
							<td rowspan="5" style="width:15mm;font-size: 8pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">Sign Here</td>
							<div style="width:187mm;border-top:1px solid black;">
							<div class="styLNDesc" style="width:180mm;height:100%;font-size:7pt;padding-left:0mm;padding-top:2mm;vertical-align:center;border-color: black; border-top-width: 1px;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than officer) is based on all information of which preparer has any knowledge.
							</div>
							</div>

						</tr>
						<div class="styBB" style="width:187mm;"/>
						<tr>
							<td rowspan="2" style="padding-left:1mm;">
								<img style="width:2mm;height:8mm;" src="{$ImagePath}/990EZ_Bullet_Jumbo.gif" alt="JumboBullet"/>
							</td>
						<td style="height:auto;width:113mm;border-bottom:1px solid black;vertical-align:bottom;border-right:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width:53mm;border-bottom:1px solid black;vertical-align:bottom;padding-left:1mm;height:auto;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;">Signature of officer</td>
							<td style="vertical-align:top;padding-left:1mm;">Date</td>
						</tr>
						<tr>
							<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;padding-top:1mm;">
								<img style="width:2mm;height:8mm;" src="{$ImagePath}/990EZ_Bullet_Jumbo.gif" alt="JumboBullet"/>
							</td>
							<td style="border-bottom:1px solid black;vertical-align:bottom;" colspan="2">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
								<span style="width:4px"/>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Title</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;border-bottom:1px solid black;" colspan="2">Type or print name and title</td>
						</tr>
					</table>
					<!-- End Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the preparer section in table -->
					<div class="styBB" style="width:187mm;font-size:6pt;display:inline">
            <div style="width:22.75mm;padding-top:4mm;float:left;clear:none;display:inline">
              <span class="styMainTitle" style="font-size:11pt;">
                  Paid
                  Preparer
                  Use Only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:8mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                
                Print/Type preparer's name<br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
														<xsl:with-param name="TargetNode">Name</xsl:with-param>
													</xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:8mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
                <!--<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>-->
              </div>
                <div class="styLNDesc" style="height:8mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                   <!-- <xsl:with-param name="BackupName">PopulateReturnHeaderPreparer</xsl:with-param>-->
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:8mm;width:18mm;border-right:1px solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                    <input class="styCkbox" type="checkbox" alt="SelfEmployedCheckboxInd" style="width:4mm;">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:8mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
                             <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">SSN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
								</xsl:call-template>
                             <!--
                  <xsl:if test="PopulateReturnHeaderPreparer">
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
                      <xsl:with-param name="TargetNode">SSN</xsl:with-param>
                    <xsl:with-param name="BackupName">PopulateReturnHeaderPreparer</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="PopulateReturnHeaderPreparer">
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
                      <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
                      <xsl:with-param name="BackupName">PopulateReturnHeaderPreparer</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="PopulateReturnHeaderPreparer">
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
                      <xsl:with-param name="TargetNode">STIN</xsl:with-param>
                      <xsl:with-param name="BackupName">PopulateReturnHeaderPreparer</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>-->
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
                    
                  </div>
                </div>
                <div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
                  <span style="width:4px;"/>
                 <!-- <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerFirmIDNumber">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/MissingEINReason">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
                    </xsl:call-template>
</xsl:if>
-->
                    
                  
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="height:14mm;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                  <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
                    <!--<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerUSAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">State</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerForeignAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrStateNm</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>-->
                  </div>
                </div>
                <div class="styLNDesc" style="height:9mm;width:32mm;padding-left:1mm;"> Phone no. 
                <!--<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">Phone</xsl:with-param>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
                  </xsl:call-template>
                  <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
                  </xsl:call-template>-->
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- END paid preparer -->
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLongDesc2" style="width: 187mm; font-size: 7pt;padding-top:2mm;">
							<!-- <label><xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$RtnHdrData/Officer/AuthorizeThirdParty" /><xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param></xsl:call-template> -->
    May the IRS discuss this return with the preparer shown above? See instructions
	<!-- </label> -->
							<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">.........</span>
							<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span class="styIRS990EZNBSP"/>
							<input type="checkbox" class="styIRS990EZCkBox" alt="AuthorizeThirdPartyYesCheckbox">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
									<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
									<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
							<span class="styIRS990EZNBSP"/>
							<input type="checkbox" class="styIRS990EZCkBox" alt="AuthorizeThirdPartyNoCheckbox">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
									<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
									<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</span>
					</div>
					<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px"/>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<!--   BEGIN FORM FOOTER  -->
					<div style="width:187mm;">
						<span style="float: right">Form <span class="styBoldText">990-EZ</span> (2017)</span>
					</div>
					<!--   END FORM FOOTER   -->
					<br/>
					<div class="pageEnd"/>
					
					
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
							<xsl:with-param name="TargetNode" select="$IRS990EZData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
<!-- End Left Over Table -->
 
	<!--Special Condition Description -->
<br/>
 <span class="styRepeatingDataTitle">Form 990-EZ, Special Condition Description: </span>


<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">

<thead class="styTableThead">

<tr class="styDepTblHdr">

<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;">

Special Condition Description</th>

</tr>

</thead>

<tfoot/>

<tbody>

<xsl:for-each select="$IRS990EZData/SpecialConditionDesc">

<tr style="border-color:black;height:6mm;">

<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>

<td class="styTableCellText" style="width:179mm;">

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="."/>

</xsl:call-template>

<span class="styTableCellPad"/>

</td>

</tr>

</xsl:for-each>

</tbody>

</table>

<br/>
		
					<!--  repeating data for part III  -->
					<xsl:if test="(count($IRS990EZData/ProgramSrvcAccomplishmentGrp) &gt;3) and ($Print = $Separated)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 990EZ, Part III - Statement of Program Service Accomplishments</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="padding-top: 6mm; width:149mm; text-align: left">
                Describe the organization’s program service accomplishments for each of its three largest program services,
as measured by expenses.  In a clear and concise manner, describe the services provided,   the number of persons benefited, and other relevant information for each program title.            
              </th>
									<th class="styDepTblCell" scope="col" style="width:38mm" colspan="2">
                Expenses<br/> (Required for section 501(c)(3) and 501(c)(4) organizations; optional for others.)
              </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/ProgramSrvcAccomplishmentGrp">
									<xsl:if test="($Print = $Separated) or (count($IRS990EZData/ProgramSrvcAccomplishmentGrp) &gt;=3)">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 =1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styDepTblCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align:right; width: 149mm;vertical-align:top;">
												<span style="float: left; clear: none; text-align: left">
													<xsl:choose>
														<xsl:when test="position()=1">
															<b>28 </b>
														</xsl:when>
														<xsl:when test="position()=2">
															<b>29 </b>
														</xsl:when>
														<xsl:when test="position()=3">
															<b>30 </b>
														</xsl:when>
														<xsl:when test="position() &gt;3">
															<span style="width: 1px"/>
														</xsl:when>
													</xsl:choose>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DescriptionProgramSrvcAccomTxt"/>
													</xsl:call-template>
													<br/>
													<span style="width:50mm;">(Grants $ <xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrantsAndAllocationsAmt"/>
														</xsl:call-template>) </span>
													<span>If this amount includes foreign grants, check here <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">...</span>
														<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
														<span style="width:2mm;"/>
											<!--<input type="checkbox" class="styCkbox" name="Checkbox"> Changed to below to prevent being able to check all checkboxes-->
														<input type="checkbox" class="styCkbox" alt="AmountIncludesForeignGrantsInd" onclick="return false;">
														<!--<input type="checkbox" class="styCkbox" name="Checkbox">-->
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="ForeignGrantsInd"/>
																<xsl:with-param name="BackupName">IRS990EZForeignGrants</xsl:with-param>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="ForeignGrantsInd"/>
																<xsl:with-param name="BackupName">IRS990EZForeignGrants</xsl:with-param>
															</xsl:call-template>
														</label>
													</span>
												</span>
												<span class="styIRS990EZTableCellPad"/>
											</td>
											<td class="styDepTblCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; font-weight: bold; width: 6mm; vertical-align:top;">
												<xsl:choose>
													<xsl:when test="position()=1">28a</xsl:when>
													<xsl:when test="position()=2">29a</xsl:when>
													<xsl:when test="position()=3">30a</xsl:when>
													<xsl:when test="position() &gt;3">
														<span style="width: 1px"/>
													</xsl:when>
												</xsl:choose>
											</td>
											<td class="styDepTblCell" style="text-align: right; border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 32mm;text-align:top;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProgramServiceExpensesAmt"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!--  end repeating data for Part III  -->
					<!--  repeating data for part IV  -->
					<xsl:if test="(count($IRS990EZData/OfficerDirectorTrusteeEmplGrp) &gt;3) and ($Print = $Separated)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle" style="height:auto;">Form 990EZ, Part <span style="font-size: 8.75pt">&#8547;</span> &#8212; List of Officers, Directors, Trustees, and Key Employees<span class="styNormalText" style="font-size: 7pt"> (list each one even if not compensated &#151; see the instructions for Part IV)</span></span>
						<span class="styNormalText" style="font-size: 7pt; width:163mm"> 
						<span style="float:left;">Check if the organization used Schedule O to respond to any question in this Part IV</span>
							<!-- Dotted Line -->
							
							 <span class="styDotLn" style="padding-right:1mm;">............</span>
								 <input type="checkbox" class="styIRS990EZCkBox" alt="InfoInScheduleOPartIVInd">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIVInd"/>
												<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartIV</xsl:with-param>
											</xsl:call-template>
										</input>
				<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIVInd"/>
												<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartIV</xsl:with-param>
											</xsl:call-template>
								</label>
						  </span>
					 
            
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center;vertical-align:top;">
										<b>(a)</b> Name and title</th>
									<th class="styDepTblCell" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center;vertical-align:top;">
										<b>(b)</b> Average<br/>hours per week<br/>devoted to position</th>
									<th class="styDepTblCell" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center;vertical-align:top;">
										<b>(c)</b> Reportable compensation (Forms W-2/1099-MISC)<br/>
										<b>(If not paid,<br/>enter -0-)</b>
									</th>
									<th class="styDepTblCell" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center;vertical-align:top;">
										<b>(d)</b> Health benefits, contributions to<br/>employee benefit plans, and<!--&amp;--><br/> deferred compensation</th>
									<th class="styDepTblCell" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; text-align: center;vertical-align:top;">
										<b>(e)</b>Estimated amount of<br/> other compensation</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/OfficerDirectorTrusteeEmplGrp">
									<tr>
								<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 =1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										
										<td class="styDepTblCell" style="text-align: left; width: 58mm;vertical-align:top;">											
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>	
												
																							
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="BusinessName"/>
													</xsl:call-template>																					
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TitleTxt"/>
											</xsl:call-template>											
										</td>
										<td class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
												<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AverageHrsPerWkDevotedToPosRt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										
										<td class="styDepTblCell" style="text-align: right; width: 30mm;vertical-align:top;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CompensationAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										
										<td class="styDepTblCell" style="text-align: right; width: 34mm;vertical-align:top;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EmployeeBenefitProgramAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="text-align: right; width: 30mm;vertical-align:top;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenseAccountOtherAllwncAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/StatesWhereCopyOfReturnIsFldCd) &gt;25)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990EZ, Part V, Line 41</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead"/>
							<tbody>
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align: left; width:45mm">List the states with which a copy of this return is filed: </td>
									<td class="styDepTblCell" style="text-align: left; width: 139mm">
										<xsl:for-each select="$IRS990EZData/StatesWhereCopyOfReturnIsFldCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<xsl:if test="position() != last()">,</xsl:if>
											<span style="width:2mm;"/>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- Begin Part V Line 42b -->
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ForeignFinancialAccountCntryCd) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 990EZ, Part V, Line 42b -  If “Yes," enter the name of the foreign country:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col">Country</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/ForeignFinancialAccountCntryCd">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;padding-left:80mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- Begin Part V Line 42c -->
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ForeignOfficeCountryCd) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 990EZ, Part V, Line 42c -  If “Yes," enter the name of the foreign country:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col">Country</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/ForeignOfficeCountryCd">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;padding-left:80mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!--  repeating data for line 50  -->
					<xsl:if test="(count($IRS990EZData/CompensationHighestPaidEmplGrp) &gt;3) and ($Print = $Separated)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"> Form 990EZ, Part VI, Line 50 - Complete this table for the organization's five highest compensated employees (other than officers, directors, trustees, and key employees) who received more than $100,000 of compensation from the organization. If there are none, enter "None."
</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS990EZTableCellA" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;vertical-align:top;">
										<b>(a)</b> Name and title of each emplyee </th>
									<th class="styIRS990EZTableCellB" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;vertical-align:top;">
										<b>(b)</b> Average<br/>hours per week<br/>devoted to position</th>
									<th class="styIRS990EZTableCellC" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;vertical-align:top;">
										<b>(c)</b> Reportable compensation<br/> (Forms W-2/1099-MISC)
									</th>
									<th class="styIRS990EZTableCellD" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;vertical-align:top;">
										<b>(d)</b> Health benefits, contributions to employee benefit plans, and deferred compensation</th>
									<th class="styIRS990EZTableCellE" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; text-align: center;vertical-align:top;">
										<b>(e)</b> Estimated amount of other compensation </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/CompensationHighestPaidEmplGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 =1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align: left; width: 58mm;vertical-align:top;">											
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PersonNm"/>													
												</xsl:call-template>					
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TitleTxt"/>
														</xsl:call-template>
													</td>
											
										<span class="styIRS990EZTableCellPad"/>
										
										<td class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;width:35mm;vertical-align:top;">											
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AverageHoursPerWeekRt"/>
											</xsl:call-template>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;width:30mm;text-align:right;vertical-align:top;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CompensationAmt"/>
											</xsl:call-template>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellD" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;width:34mm;text-align:right;vertical-align:top;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EmployeeBenefitsAmt"/>
											</xsl:call-template>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellE" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px;width:30mm;text-align:right;vertical-align:top;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenseAccountAmt"/>
											</xsl:call-template>
											<span class="styIRS990EZTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								</tbody>
							
						</table>
						<br/>
					</xsl:if>
					<!--  end of repeating data line 50 -->
					<!--  repeating data for line 51  -->
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/CompensationOfHghstPdCntrctGrp) &gt;=3)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 990EZ, Part VI, Line 51 - Complete this table for the organization's five highest compensated independent contractors that received more than $100,000 of compensation from the organization. If there are none, enter "None."
     </span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS990EZTableCellAA" scope="col"  style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;">
										<b>(a)</b> Name and business address of each independent contractor </th>
									<th class="styIRS990EZTableCellB" scope="col"  style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;">
										<b>(b)</b> Type of service</th>
									<th class="styIRS990EZTableCellC" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center;">
										<b>(c)</b> Compensation<br/>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/CompensationOfHghstPdCntrctGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 =1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align: left; width: 58mm;vertical-align:top;">
											<xsl:if test="PersonNm != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
													<!--<xsl:with-param name="TabOrder" select="6"/>-->
												</xsl:call-template>
											</xsl:if>
										<xsl:if test="BusinessName/BusinessNameLine1Txt != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName != ''">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="BusinessName"/>
													<!--<xsl:with-param name="TabOrder" select="6"/>-->
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="USAddress != ''">
												<br/>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="USAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ForeignAddress != ''">
												<br/>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="ForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ServiceTypeTxt"/>
											</xsl:call-template>
											<span style="width: 4px"/>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align:right;vertical-align:top;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CompensationAmt"/>
											</xsl:call-template>
											<span class="styIRS990EZTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								</tbody>
							
						</table>
						<br/>
					</xsl:if>
					<!--  end of repeating data line 51 -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>