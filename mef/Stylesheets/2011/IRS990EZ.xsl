<!-- This stylesheet was modified on 7/08/2009 for TY2009/PY2010 changes by S. Cram-->
<!--This stylesheet was modified on 8/26/2009 for TY2009/PY2010 BSP-091865OTH changes by Sandy Cram-->
<!-- Last modified on 10/28/2009 by Sandy Cram  Updates made per BSP-092774OTH -->
<!-- Last modified on 01/19/2010 by Sandy Cram  for ITAMS#6646059 -->
<!-- Last modified on 08/09/2010 by Robert Jones UWR  BSP101944OTH-->
<!-- Last modified on 08/26/2010 by Robert Jones for UWR BSP-102106OTH --> 
<!-- Updated 7/21/2011 per UWR 40502 by Robert L Jones -->
<!-- Updated 2/03/2012 per for IE8 Compliance by Hilda Yang -->
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
							<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ProgramServiceAccomplishment) &gt;3) and ($PACount = 0) ">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/ProgramServiceAccomplishment/DescriptionProgramServiceAccom"/>
								</xsl:call-template>
							</xsl:if>
						</span>
						<br/>
						<span style="width:50mm;margin-top:6mm;">(Grants $ <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GrantsAndAllocations"/>
							</xsl:call-template>) </span>
						<span>If this amount includes foreign grants, check here <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">...</span>
							<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
							<span style="width:2mm;"/>
							<input type="checkbox" class="styCkbox" name="Checkbox">
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
				<td class="styTableCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; font-weight: bold; width: 6mm; text-align: center;vertical-align:bottom;">
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
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl) &gt;4) and ($ODCount = 0)">
						<xsl:choose>
							<xsl:when test="$IRS990EZData/OfficerDirectorTrusteeKeyEmpl/PersonName != ''">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeKeyEmpl/PersonName"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeKeyEmpl/BusinessName"/>
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
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/CompensationOfHighestPaidEmpl) &gt;4) and ($ODCount = 0)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/CompensationOfHighestPaidEmpl"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="(count($IRS990EZData/CompensationOfHighestPaidEmpl) = 0) and ($ODCount = 0)">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/PartVIOfCompOfHighestPaidEmpl"/>
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
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/CompOfHghstPaidCntrctProfSer) &gt;4) and ($ODCount = 0)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/CompOfHghstPaidCntrctProfSer"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="(count($IRS990EZData/CompOfHghstPaidCntrctProfSer) = 0) and ($ODCount = 0)">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/PartVIAHghstPaidCntrctProfSer"/>
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
		<html>
			<head>
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
					<div class="styBB" style="width:187mm; height:31mm;">
						<div class="styFNBox" style="width:33mm;height:31mm; border-right-width: 2px;">
							<div style="padding-top:4mm;">
      Form<span class="styFormNumber">990-EZ</span>
								<br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS990EZData"/>
									<xsl:with-param name="TabOrder" select="1"/>
								</xsl:call-template>
								 <!--General DependencySmall Push Pin --> 
     <!--<xsl:call-template name="SetFormLinkInline">
       <xsl:with-param name="TargetNode" select="$IRS990EZData"/>
     </xsl:call-template>-->

								
							</div>
							<div style="padding-top:7.5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:31mm;padding-top;3.5mm;">
							<div class="styMainTitle">Short Form<br/>Return of Organization Exempt From Income Tax</div>
							<div class="styFBT" style="font-size: 6.5pt; margin-top: 0px">Under section 501(c), 527, or 4947(a)(1) of the Internal Revenue Code <br/>(except black lung benefit trust or private foundation)</div>
							<div class="styFBT" style="font-size:6pt; font-weight: normal; margin-top: 0px">
								<img src="{$ImagePath}/990EZ_Bullet_Sm.gif" alt="bullet"/>
								Sponsoring organizations of donor advised funds, organizations that operate one or more hospital facilities, and certain controlling organizations as defined in section 512(b)(13) must file Form 990 (see instructions).<br/> All other organizations with gross receipts less than $200,000 and total assets less than $500,000 at the end of the year may use this form.
    </div>
   
							<div class="styFBT" style="font-size: 6pt; font-weight: normal; margin-top: 0px;padding-top:.5mm">
								<img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
								<span style="width:1mm"/>
								<i>The organization may have to use a copy of this return to satisfy state reporting requirements.</i>
							</div>
						</div>
						<div class="styTYBox" style="width:29mm;height:31mm;">
							<div class="styOMB" style="height:4mm;">OMB No. 1545-1150</div>
							<div class="styTY" style="height:12.8mm;padding-top:1mm;">
      20<span class="styTYColor">11</span>
							</div>
							<div style="height:14mm; background-color: black; color: white; font-size: 9.5pt;padding-top: 3mm;font-weight: bold">Open to Public<br/>Inspection</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<div class="styComType" style="width:187mm;border-bottom-width: 0px; font-size: 7pt">
						<div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;">A</div>
						<div class="styBoldText" style="height:3mm;width:182mm;float:left;clear:none;">For the 2011
 
    calendar year, or tax year beginning 
    <span style="width:30mm;">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
							</span>, and ending 
    <span style="width:30mm;">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
							</span>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;border-bottom:1 solid black;">
						<div style="width:31mm;height:26mm;float:left;clear:left;">
							<div class="styComType" style="width:31mm;border-bottom-width: 0px">
								<div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;font-size: 7pt">B</div>
								<div class="styNormalText" style="height:3mm;width:26mm;padding-top: .5mm;float:left;clear:none;">Check if applicable:</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px">
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/AddressChange"/>
											<xsl:with-param name="BackupName">IRS990EZAddressChange</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/AddressChange"/>
											<xsl:with-param name="BackupName">IRS990EZAddressChange</xsl:with-param>
										</xsl:call-template>Address change</label>
								</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px;">
								<!-- padding-top:1.5mm-->
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox" TabIndex="-1" id="NameChange" onclick="return false;"/>
									<label for="NameChange">Name change</label>
								</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px;">
								<!-- padding-top:1.5mm-->
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/InitialReturn"/>
											<xsl:with-param name="BackupName">IRS990EZInitialReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/InitialReturn"/>
											<xsl:with-param name="BackupName">IRS990EZInitialReturn</xsl:with-param>
										</xsl:call-template>Initial return</label>
								</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px;">
								<!-- padding-top:1.5mm -->
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TerminatedReturn"/>
											<xsl:with-param name="BackupName">IRS990EZTerminationReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TerminatedReturn"/>
											<xsl:with-param name="BackupName">IRS990EZTerminationReturn</xsl:with-param>
										</xsl:call-template>Terminated</label>
								</div>
							</div>
							<div class="styComType" style="width:31mm;border-bottom:0px;">
								<!--padding-top:1.5mm-->
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/AmendedReturn"/>
											<xsl:with-param name="BackupName">IRS990EZAmendedReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/AmendedReturn"/>
											<xsl:with-param name="BackupName">IRS990EZAmendedReturn</xsl:with-param>
										</xsl:call-template>Amended return</label>
								</div>
							</div>
							<div class="styComType" style="width:31mm; padding-bottom: 2mm;border-bottom:0px;">
								<!--padding-top:1.5mm-->
								<div style="width:26mm;">
									<input type="checkbox" class="styIRS990EZCkBox" TabIndex="-1" id="ApplicationPending" onclick="return false;"/>
									<label for="ApplicationPending">Application pending</label>
								</div>
							</div>
						</div>
						<div class="styLblNameAddr" style="width:111mm;height:28mm;border-bottom-width: 3px;">
						<!--
							<div class="styUseLbl" style="width:12mm;height:28mm;border-right-width:0px;">Please use IRS label or print or type. See Specific Instruc- tions.</div>
-->
							<div class="styNameAddr" style="width:111mm;height:8mm;border-left-width:1px;">
								<b>C</b> Name of organization<br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="width:111mm;height:10mm;border-left-width:1px;">
								<span style="width: 82.5mm; height: 10mm">
									<span style="width: 82.5mm;padding-left: 2mm"> Number and street (or P. O. box, if mail is not delivered to street address)</span>
									<span class="stySmallText" style="width: 82.5m;padding-left:2mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
										</xsl:call-template>
									</span>
								</span>
								<span style="border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; width: 14mm; height: 10mm">Room/suite</span>
							</div>
							<div class="styNameAddr" style="border-bottom-width:0px;width:98mm;height:9.5mm;border-left-width:1px">
								<span style="width: 2mm"/> City or town, state or country, and ZIP + 4
              <span style="padding-left:2mm;" class="stySmallText">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Country</xsl:with-param>
										<xsl:with-param name="MainForm">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styEINDateAssets" style="width:43mm;height:4.5mm;border-top-width: 1px;padding-top:.5mm;">
							<span class="styBoldText">D Employer identification number</span>
							<br/>
							<br/>
							<span style="width: 3mm"/>
							<span class="styEINFld" style="">
								<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:43mm;height:10.25mm;padding-top:.5mm;">
							<span class="styBoldText">E  </span>Telephone number<br/>
							<br/>
							<span style="width: 3mm"/>
							<span style="text-align: center; width:33mm">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:43mm;height:10.25mm;border-bottom:0px;padding-top:.5mm;">
							<span class="styBoldText">F </span>Group Exemption <br/>
							<span style="width: 2mm"/> Number.  <span class="styIRS990EZNBSP"/>. <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
							<span style="width: 4px"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/GroupExemptionNumber"/>
							</xsl:call-template>
						</div>
						</div>
				
					
				<!-- New G per BSP-102106 -->
				
						<span style="width: 125mm;height:20mm; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 0px;  padding-bottom:5mm;padding-top:10mm;">
							<b>G</b> Accounting method: <span style="width: 1mm"/>
							<input type="checkbox" class="styIRS990EZCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/MethodOfAccountingCash"/>
									<xsl:with-param name="BackupName">IRS990EZMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/MethodOfAccountingCash"/>
									<xsl:with-param name="BackupName">IRS990EZMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>Cash</label>
							<span style="width: 2mm"/>
							<input type="checkbox" class="styIRS990EZCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/MethodOfAccountingAccrual"/>
									<xsl:with-param name="BackupName">IRS990EZMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/MethodOfAccountingAccrual"/>
									<xsl:with-param name="BackupName">IRS990EZMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>Accrual</label>
						
							<span style="width: 3mm"/>Other (specify)
     <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
							<span style="font-size: 6pt"/>
							<span class="styIRS990EZUnderlinedBox" style="width:30.75mm; font-size: 8pt; font-family: arial">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/MethodOfAccountingOther"/>
								</xsl:call-template>
						</span>
						</span>
						
							
<!-- Section H -->
					<span style="width: 65mm; font-size: 7pt; padding-left:3mm;padding-top:5mm;border-style: solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; padding-bottom:0mm;">
						<span style="width: 60mm;">
								<b>H</b>
								<span style="width: 2mm;"/>
      Check <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
								<span style="width: 2mm;"/>
								<input type="checkbox" class="styIRS990EZCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ScheduleBNotRequired"/>
										<xsl:with-param name="BackupName">IRS990EZScheduleBNotRequired</xsl:with-param>
									</xsl:call-template>
									<span class="styNormalText" style="font-size: 7pt;padding-left:1mm;">if the organization is <b>not</b></span>
									 </input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/ScheduleBNotRequired"/>
									<xsl:with-param name="BackupName">IRS990EZScheduleBNotRequired</xsl:with-param>
								</xsl:call-template>
								<span class="styNormalText" style="font-size: 7pt; padding-left:5mm;">required to attach Schedule B</span><br/>
								<span class="styNormalText" style="font-size: 7pt; padding-left:5mm;">(Form 990, 990-EZ, or 990-PF).</span>
								</label>
						</span>
					
					
					<!-- Section I -->
						 <span style="width: 125mm; border-style: solid; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 0mm;padding-bottom:3mm;">
							<span style="width: 19mm; padding-top: 0mm;padding-bottom:0mm;">
								<b>I Website:</b>
								<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							</span>
							<span style="width: 100mm">

								<span class="styIRS990EZUnderlinedBox" style="width:100.75mm; font-size: 6pt; font-family: arial;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/WebSite"/>
									</xsl:call-template>
								</span>

								</span>
							
							<!-- Section J -->
								<span class="stySmallText"><b>J Tax-Exempt status</b>
								<span style="font-size: 6pt">(check only one)&#151;</span>
								<input type="checkbox" class="styIRS990EZCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501c3"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization501c3</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501c3"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization501c3</xsl:with-param>
									</xsl:call-template>501(c)(3)</label>
									
                            <xsl:call-template name="SetFormLinkInline">
                                  <xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501c3"/>
                            </xsl:call-template>
								
								<input type="checkbox" class="styIRS990EZCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501c"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization501c</xsl:with-param>
									</xsl:call-template>
								</input>
									<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501c"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization501c</xsl:with-param>
									</xsl:call-template> 501(c)</label>(
								<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization501c/@typeOf501cOrganization"/>
								</xsl:call-template>)
      <img src="{$ImagePath}/990EZ_Bullet_Left.gif" alt="bullet"/>
								<span style="font-size:6pt">(insert no.)</span>
							
										<input type="checkbox" class="styIRS990EZCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization4947a1"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization4947a1</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization4947a1"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization4947a1</xsl:with-param>
									</xsl:call-template> 4947(a)(1)</label> or
        <input type="checkbox" class="styIRS990EZCkBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization527"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization527</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/Organization527"/>
										<xsl:with-param name="BackupName">IRS990EZOrganization527</xsl:with-param>
									</xsl:call-template> 527</label>
							</span>
						</span>
					
						
					<span style="width: 65mm; font-size: 7pt;padding-left: 1mm; border-style: solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px;">
				</span>

					<div style="width: 187mm; font-size: 6.5pt;border-style: solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 1px">
						<b>K</b> Check 
  <img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/>
						<span style="font-size:6pt"/>
						<input type="checkbox" class="styIRS990EZCkBox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/GrossReceiptsLessThan25000"/>
								<xsl:with-param name="BackupName">IRS990EZGrossReceiptsLessThan25000</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/GrossReceiptsLessThan25000"/>
								<xsl:with-param name="BackupName">IRS990EZGrossReceiptsLessThan25000</xsl:with-param>
							</xsl:call-template>
   if the organization is not a section 509(a)(3) supporting organization or a section 527 organization <b>and</b>  its gross receipts are normally <b>not</b> more than <span class="styNormalText" style="font-size: 7pt; padding-left:2mm;"> $50,000.</span>
  </label>
  A Form 990-EZ or Form 990 return is not required though Form 990-N (e-postcard) may be required (see instructions). But if the <span class="styNormalText" style="font-size: 7pt; padding-left:2mm;">organization chooses to file a return, be sure to file a complete return.</span>
 </div>
					<div style="float:none; clear: both; width: 187mm; border-style: solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;padding-top:.75mm;padding-bottom:.75mm;">
					
						<b>L </b>  
  Add lines 5b, 6c, and 7b, to line 9 to determine gross receipts; If gross receipts are $200,000 or more, or if total assets (Part II, line 25, 
  <span class="styNormalText" style="float:left; padding-left:2mm;"> 
						column (B) below) are $500,000 or more,file Form 990 instead of Form 990-EZ.</span>
						<span style="float:right;">		
							<span  class="styDotLn" style="padding-right:1mm;">..........
							<img src="{$ImagePath}/990EZ_Bullet_Md.gif" alt="bullet"/></span>
							<span style="font-size:6pt"/> $
							<span style="text-align:right;width:25mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/GrossReceipts"/>
								</xsl:call-template>
							</span>
						</span>	
					
					</div>
			
					<!--   BEGIN PART I   -->
					<!--   BEGIN PART I HEADER   -->
					<table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
						<thead>
							<tr>
								<th class="styBB" colspan="7" style="padding-top:0;padding-bottom:0;">
									<span class="styPartName">Part I</span>
									<span class="styPartDesc">
									<span style="float:left;">Revenue, Expenses, and Changes in Net Assets or Fund Balances 
            <span class="styNormalText" style="font-size: 7pt; width: 50mm"> (see the instructions for Part I.)</span>
            </span>
            <span class="styNormalText" style="font-size: 7pt; "> 
											<span style="float:left;">Check if the organization used Schedule O to respond to any question in this Part I</span>
            
              <!-- Dotted Line -->
												  <span class="styDotLn" style="float:right;padding-right:1mm;">...........
                
                
                
                <input type="checkbox" class="styIRS990EZCkBox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartI"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartI</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartI"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartI</xsl:with-param>
							</xsl:call-template>
                </label>
              </span>
              
        </span>
            </span>
									
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<!--   BEGIN LINE 1   -->
							<tr>
								<td class="styIRS990EZImg" style="padding-top: 25mm; border-bottom-width: 1px" rowspan="18">
									<img src="{$ImagePath}/990EZ_Revenue.gif" alt="VerticalRevenue"/>
								</td>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 2mm;">1</span>
								</td>
								<td class="styLNDesc" colspan="3">
						
								<span style="float:left;">Contributions, gifts, grants, and similar amounts received</span>
                                <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
       
								</td>
								<td class="styLNRightNumBox">1</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ContributionsGiftsGrantsEtc"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 1   -->
							<!--   BEGIN LINE 2   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 2mm">2</span>
								</td>
								<td class="styLNDesc" colspan="3" >
								
								 <span style="float:left;">Program service revenue including government fees and contracts </span>
                                 <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
                            
								</td>
								<td class="styLNRightNumBox">2</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ProgramServiceRevenue"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 2  -->
							<!--   BEGIN LINE 3   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 2mm">3</span>
								</td>
								<td class="styLNDesc" colspan="3">
							
								  <span style="float:left;">Membership dues and assessments</span>
								  <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
							
								</td>
								<td class="styLNRightNumBox">3</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/MembershipDues"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 3   -->
							<!--   BEGIN LINE 4   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 2mm">4</span>
								</td>
								<td class="styLNDesc" colspan="3">
							
									<span style="float:left;">Investment income</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
                         
								</td>
								<td class="styLNRightNumBox">4</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/InvestmentIncome"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 4  -->
							<!--   BEGIN LINE 5a   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 2mm">5a</span>
								</td>
								<td class="styLNDesc">

									<span style="float:left;">Gross amount from sale of assets other than inventory</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>

								</td>
								<td class="styLNRightNumBox">5a</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GrossAmountFromSaleOfAssets"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
							</tr>
							<!--   END LINE 5a   -->
							<!--   BEGIN LINE 5b   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 3.5mm">b</span>
								</td>
								<td class="styLNDesc">
									<span style="float:left;">Less: cost or other basis and sales expenses</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</td>
								<td class="styLNRightNumBox">5b</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/CostOtherBasisAndSalesExpenses"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
							</tr>
							<!--  END LINE 5b   -->
							<!--   BEGIN LINE 5c   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 3.5mm">c</span>
								</td>
								<td class="styLNDesc" colspan="3">
							
									<span style="float:left;">Gain or (loss) from sale of assets other than inventory (Subtract line 5b from line 5a) </span><!--<span style="font-size:6pt">(attach schedule)</span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/GainOrLossFromSaleOfAssets"/>
											<xsl:with-param name="TabOrder" select="2"/>
										</xsl:call-template>-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>	
											
								</td>
								<td class="styLNRightNumBox">5c</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GainOrLossFromSaleOfAssets"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 5c   -->
							<!--   BEGIN LINE 6   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 2mm">6</span>
								</td>
								<td class="styLNDesc" colspan="3">
								<span style="float:left;">Gaming and fundraising events</span> 
            <!--
                   <label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/IsAnyRevenueFromGaming"/>
											<xsl:with-param name="BackupName">IRS990EZIsAnyRevenueFromGaming</xsl:with-param>
										</xsl:call-template>If any amount is from <b>gaming,</b> check here <span style="width: 4px"/>
									</label>
									<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
									<span style="width: 16px"/>
									<input type="checkbox" class="styIRS990EZCkBox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/IsAnyRevenueFromGaming"/>
											<xsl:with-param name="BackupName">IRS990EZIsAnyRevenueFromGaming</xsl:with-param>
										</xsl:call-template>
									</input>
                   -->
								</td>
                
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px;">
									<span style="width: 1mm"/>
								</td>
							</tr>
							<!--  END LINE 6   -->
							<!--   BEGIN LINE 6a   -->
						
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 3.5mm">a</span>
								</td>
								<td class="styLNDesc">
								<span style="float:left;white-space:nowrap;">Gross income from gaming (attach Schedule G if greater than $15,000)
								<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GamingGrossIncome"/>
										</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
								</td>
								<td class="styLNRightNumBox">6a</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GamingGrossIncome"/>
									</xsl:call-template>									
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px;padding-top:2mm;">
									<span style="width: 1mm"/>
								</td>
							</tr>
						<!--  END LINE6a   -->
							<!--   BEGIN LINE 6b   -->
							
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 3.5mm">b</span>
								</td>
								<td class="styLNDesc" colspan="3">Gross income from fundraising events (not including $
          <!--<span class="styUnderlinedText" style="text-align: right">-->
          <span class="styFixedUnderline" style="width:20mm;float:none;padding-left:2mm;padding-top:0;padding-bottom:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/FundraisingGrossIncome/@contributionsReportedOnLine1a"/>
										</xsl:call-template>
									</span> of contributions <br></br>from fundraising events reported on line 1) (attach Schedule G if the 
									
        <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/FundraisingGrossIncome"/>
										<xsl:with-param name="TabOrder" select="3"/>
									</xsl:call-template>
          </td>
          <!--<td class="styLNRightNumBox">6b</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GamingGrossIncome"/>
									</xsl:call-template>
									
								</td>-->
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1mm"/>
									
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
							
							</tr>
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 3.5mm"></span>
								</td>
								<td class="styLNDesc">sum of such gross income and contributions exceeds $15,000)
         
								</td>
					
								<td class="styLNRightNumBox">6b</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/FundraisingGrossIncome"/>
									</xsl:call-template>
								</td>
								
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px; ">
									<span style="width: 1mm"/>
								</td>
							</tr>
							
							
							<!-- Line 6c -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 3.5mm">c</span>
								</td>
								<td class="styLNDesc">
									<span style="float:left;">Less: direct expenses from gaming and fundraising events</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</td>
					
								<td class="styLNRightNumBox">6c</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/SpecialEventsDirectExpenses"/>
									</xsl:call-template>
								</td>
								
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px; ">
									<span style="width: 1mm"/>
								</td>
							</tr>
							<!--  END LINE 6c   -->
							<!--   BEGIN LINE 6d   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 3.5mm">d</span>
								</td>
								<td class="styLNDesc" colspan="3">Net income or (loss) from gaming and fundraising events (Add lines 6a and 6b and subtract line 6c)
          <b>
          <!-- Dotted Line -->
          <!--
										<span class="styIRS990EZNBSP"/>.
            <span class="styIRS990EZNBSP"/>.
            <span class="styIRS990EZNBSP"/>.
            -->
          </b>
								</td>
								<td class="styLNRightNumBox">6d</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/SpecialEventsNetIncomeLoss"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 6d   -->
							<!--   BEGIN LINE 7a   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 2mm">7a</span>
								</td>
								<td class="styLNDesc">
									<span style="float:left;">Gross sales of inventory, less returns and allowances</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
								</td>
								<td class="styLNRightNumBox">7a</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GrossSalesOfInventory"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
							</tr>
							<!--  END LINE 7a   -->
							<!--   BEGIN LINE 7b   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 3.5mm">b</span>
								</td>
								<td class="styLNDesc">
									<span style="float:left;">Less: cost of goods sold</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</td>
								<td class="styLNRightNumBox">7b</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/CostOfGoodsSold"/>
									</xsl:call-template>
								</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
							</tr>
							<!--  END LINE 7b   -->
							<!--   BEGIN LINE 7c   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 3.5mm">c</span>
								</td>
								<td class="styLNDesc" colspan="3">							
									<span style="float:left;">Gross profit or (loss) from sales of inventory (Subtract line 7b from line 7a)
		   </span>   
								   <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						
								</td>
								<td class="styLNRightNumBox">7c</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GroProfitLossSalesOfInventory"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 7c   -->
							<!--   BEGIN LINE 8   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox" style="padding-left: 2mm">8</span>
								</td>
								<td class="styLNDesc" colspan="3">
							
									 <span style="float:left;">Other revenue (describe in Schedule O) 
									<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherRevenueTotal"/>
												<xsl:with-param name="TabOrder" select="6"/>
											</xsl:call-template></span>
									<!--<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="Bullet"/>-->
									<!--	<span class="styIRS990EZUnderlinedBox" style="width: 98mm; height: 100%">-->
									 <span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>								
					
                                </td>
								<td class="styLNRightNumBox">8</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherRevenueTotal"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 8   -->
							<!--   BEGIN LINE 9   -->
							<tr>
								<td style="border-bottom: 1px solid black;">
									<span class="styLNLeftNumBox" style="padding-left: 2mm;">9</span>
								</td>
								<td class="styLNDesc" style="border-style: solid; border-color: black; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 1px;" colspan="3">
								
									 <span style="float:left;"><b>Total revenue.</b> Add lines 1, 2, 3, 4, 5c, 6d, 7c, and 8</span>
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							
									<!--<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="Bullet"/>-->
								</td>
								<td class="styLNRightNumBox" style="border-bottom-width: 1px;">9</td>
								<td class="styLNAmountBox" style="border-bottom-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TotalRevenue"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 9   -->
							<!--   BEGIN LINE 10   -->
							<tr>
								<td class="styIRS990EZImg" style="padding-top: 15mm; border-bottom-width: 1px" rowspan="8">
									<img src="{$ImagePath}/990EZ_Expenses.gif" alt="VerticalExpenses"/>
								</td>
								<td>
									<span class="styIRS990EZLNLeftNumBox">10</span>
								</td>
								<td class="styLNDesc" colspan="3">
								
								<span style="float:left;">Grants and similar amounts paid (list in Schedule O)
                                    <xsl:call-template name="SetFormLinkInline">          
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GrantsAndSimilarAmountsPaid"/>
										<xsl:with-param name="TabOrder" select="4"/>
									</xsl:call-template>
									</span>
									 <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>						
								</td>
								<td class="styLNRightNumBox">10</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/GrantsAndSimilarAmountsPaid"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 10 -->
							<!--   BEGIN LINE 11   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox">11</span>
								</td>
								<td class="styLNDesc" colspan="3">
								
									 <span style="float:left;">Benefits paid to or for members</span>
									 <span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						
								</td>
								<td class="styLNRightNumBox">11</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/BenefitsPaidToOrForMembers"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 11 -->
							<!--   BEGIN LINE 12   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox">12</span>
								</td>
								<td class="styLNDesc" colspan="3">								
									 <span style="float:left;">Salaries, other compensation, and employee benefits</span>
									 <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>                               
								</td>
								<td class="styLNRightNumBox">12</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/SalariesOtherCompEmplBenefits"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 12 -->
							<!--   BEGIN LINE 13   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox">13</span>
								</td>
								<td class="styLNDesc" colspan="3">							
							     	 <span style="float:left;">Professional fees and other payments to independent contractors</span>
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
                       			</td>
								<td class="styLNRightNumBox">13</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/FeesAndOthPymtToIndContractors"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 13 -->
							<!--   BEGIN LINE 14   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox">14</span>
								</td>
								<td class="styLNDesc" colspan="3">
							     	 <span style="float:left;">Occupancy, rent, utilities, and maintenance</span>
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
                           		</td>
								<td class="styLNRightNumBox">14</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/OccupancyRentUtilitiesAndMaint"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 14 -->
							<!--   BEGIN LINE 15   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox">15</span>
								</td>
								<td class="styLNDesc" colspan="3">
								     <span style="float:left;">Printing, publications, postage, and shipping</span>
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
          						</td>
								<td class="styLNRightNumBox">15</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/PrintingPublicationsPostage"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 15 -->
							<!--   BEGIN LINE 16   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox">16</span>
								</td>
								<td class="styLNDesc" colspan="3">
								<span style="float:left;">Other expenses (describe in Schedule O) 
								<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherExpensesTotal"/>
											<!--<xsl:with-param name="TabOrder" select="6"/>-->
										</xsl:call-template>
										</span>
            <!--<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="Bullet"/>-->
									<!--<span class="styIRS990EZUnderlinedBox" style="width: 96mm; height:100%">-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
          </td>
								<td class="styLNRightNumBox">16</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherExpensesTotal"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 16   -->
							<!--   BEGIN LINE 17   -->
							<tr>
								<td style="border-bottom: 1px solid black;">
									<span class="styLNLeftNumBox">17</span>
								</td>
								<td class="styLNDesc" style="border-style: solid; border-color: black; border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-bottom-width: 1px" colspan="3">
									 <span style="float:left;"><b>Total expenses. </b>Add lines 10 through 16 </span>   
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</td>
								<td class="styLNRightNumBox" style="border-bottom-width: 1px">17</td>
								<td class="styLNAmountBox" style="border-bottom-width: 1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TotalExpenses"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 17   -->
							<!--   BEGIN LINE 18   -->
							<tr>
								<td class="styIRS990EZImg" rowspan="8" style="padding-top: 2mm; border-bottom-width: 0px">
									<img src="{$ImagePath}/990EZ_NetAssets.gif" alt="VerticalNetAssets"/>
								</td>
								<td>
									<span class="styIRS990EZLNLeftNumBox">18</span>
								</td>
								<td class="styLNDesc" colspan="3">
	 						        <span style="float:left;">Excess or (deficit) for the year (Subtract line 17 from line 9)</span>
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
      
								</td>
								<td class="styLNRightNumBox">18</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ExcessOrDeficitForYear"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 18 -->
							<!--   BEGIN LINE 19   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox">19</span>
								</td>
								<td class="styLNDesc" colspan="3">Net assets or fund balances at beginning of year (from line 27, column (A)) (must agree with
          </td>
								<td class="styLNRightNumBox" style="background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px">
									<span style="width: 1mm"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox"/>
								</td>
								<td class="styLNDesc" colspan="3">
								     <span style="float:left;">end-of-year figure reported on prior year’s return)</span>
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
								</td>
								<td class="styLNRightNumBox">19</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/NetAssetsOrFundBalancesBOY"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 19 -->
							<!--   BEGIN LINE 20  -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox">20</span>
								</td>
								<td class="styLNDesc" colspan="3">
							 	    <span style="float:left;">Other changes in net assets or fund balances (explain in Schedule O)
                                     <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherChangesInNetAssets"/>
										<xsl:with-param name="TabOrder" select="5"/>
									</xsl:call-template>
									</span>
									 <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
								</td>
								<td class="styLNRightNumBox">20</td>
								<td class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherChangesInNetAssets"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 20 -->
							<!--   BEGIN LINE 21   -->
							<tr>
								<td>
									<span class="styIRS990EZLNLeftNumBox">21</span>
								</td>
								<td class="styLNDesc" colspan="3">
								     <span style="float:left;">Net assets or fund balances at end of year. Combine lines 18 through 20</span>
								     <span style="float:right;">
                                     <span class="styDotLn" style="padding-right:1mm;">.........</span>
									<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="Bullet"/>
									</span>
								</td>
								<td class="styLNRightNumBox" style="border-bottom-width: 0px">21</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/NetAssetsOrFundBalancesEOY"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 21-->
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
    Form<span class="styBoldText" style="font-size: 8pt;"> 990-EZ </span>(2011)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div style="width:187mm;padding-top:1mm;">
						<div style="float: left; clear: none">Form 990-EZ (2011)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN PART II   -->
					<!--   BEGIN PART II HEADER   -->
					<div class="styBB" style="float: none; clear:both; width: 187mm; border-top-width: 1px">
						<span class="styPartName">Part II</span>
						<span class="styPartDesc">Balance Sheets<!--&#151;-->
						<span class="styNormalText" style="font-size: 7pt; width: 50mm"> (see the instructions for Part II.)</span>
						<span class="styNormalText" style="font-size: 7pt; width:169mm"> 
						<span style="float:left;padding-right:15px;">Check if the organization used Schedule O to respond to any question in this Part II.</span>
            <!-- Dotted Line -->
                        <span class="styDotLn" style="padding-right:1mm;">............</span>
                
                
                <input type="checkbox" class="styIRS990EZCkBox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartII"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartII</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartII"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartII</xsl:with-param>
							</xsl:call-template>
                </label>
              </span>
              
        </span>
						
					</div><br />
					<!--   END PART II HEADER   -->
					<div style="width: 187mm;" >
						<span class="styLNDesc" style="text-align: center; width: 113.75mm;border-top-width:1px">(See the instructions for Part II.)</span>
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
								<xsl:with-param name="TargetNode" select="$IRS990EZData/CashSavingsAndInvestments/BOY"/>
							</xsl:call-template>
						</div>
						<span class="styLNRightNumBox" style="width:6mm">22</span>
						<div class="styLNAmountBox" style="border-left-width: 1px;width:31.75mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/CashSavingsAndInvestments/EOY"/>
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
								<xsl:with-param name="TargetNode" select="$IRS990EZData/LandAndBuildings/BOY"/>
							</xsl:call-template>
						</div>
						<span class="styLNRightNumBox" style="width:6mm">23</span>
						<div class="styLNAmountBox" style="border-left-width: 1px;width:31.75mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/LandAndBuildings/EOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 23   -->
					<!--   BEGIN LINE 24   -->
					<div class="styGenericDiv" id="OActn" style="overflow-y: auto; height: 100%;">
						<div class="styIRS990EZLineItem" style="height:4.5mm;">
							<span class="styIRS990EZLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">24</span>
							<span class="styLNDesc" style="padding-left: 2mm; width: 109.5mm">
							<span style="float:left;">Other assets (describe in Schedule O) 							
                                <!--<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="Bullet"/>-->
								<!--<span class="styIRS990EZUnderlinedBox" style="width: 70mm; height: 100%">-->
									<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherAssetsTotal"/>
										<xsl:with-param name="TabOrder" select="6"/>
									</xsl:call-template>
							 </span>
							 <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
                             </span>
							<div class="styLNAmountBox" style="height:4.75mm;width:34.75mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherAssetsTotal/BOY"/>
								</xsl:call-template>
							</div>
							<span class="styLNRightNumBox" style="height:4.75mm;width:6mm">24</span>
							<div class="styLNAmountBox" style="border-left-width: 1px; height:4.75mm;width:31.75mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OtherAssetsTotal/EOY"/>
								</xsl:call-template>
							</div>
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
								<xsl:with-param name="TargetNode" select="$IRS990EZData/TotalAssets/BOY"/>
							</xsl:call-template>
						</div>
						<span class="styLNRightNumBox" style="width:6mm">25</span>
						<div class="styLNAmountBox" style="border-left-width: 1px;width:31.75mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/TotalAssets/EOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 25   -->
					<!--   BEGIN LINE 26   -->
					<div class="styGenericDiv">
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
										<xsl:with-param name="TargetNode" select="$IRS990EZData/SumOfTotalLiabilities"/>
										<!--<xsl:with-param name="TabOrder" select="6"/>-->
									</xsl:call-template>
								<!--</span>)-->
                            </span>
							<div class="styLNAmountBox" style="width:34.75mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/SumOfTotalLiabilities/BOY"/>
								</xsl:call-template>
							</div>
							<span class="styLNRightNumBox" style="width:6mm">26</span>
							<div class="styLNAmountBox" style="width:31.75mm;border-left-width: 1px;height: 100%">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/SumOfTotalLiabilities/EOY"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  END LINE 26  -->
					<!--  BEGIN LINE 27  -->
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLeftNumBox">27</span>
						<span class="styLNDesc" style="padding-left: 2mm; width: 109.5mm; ">
							<span style="float:left;"><b>Net assets or fund balances</b> (line 27 of column (B) <b>must</b> agree with line 21)</span>
                            <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</span>
						<div class="styLNAmountBox" style="border-left-width: 1px; border-bottom-width: 0px;width:34.75mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/NetAssetsOrFundBalances/BOY"/>
							</xsl:call-template>
						</div>
						<span class="styLNRightNumBox" style="border-left-width: 1px; border-bottom-width: 0px;width:6mm;">27</span>
						<div class="styLNAmountBox" style="border-left-width: 1px; border-bottom-width: 0px;width:31.75mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/NetAssetsOrFundBalances/EOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 27  -->
					
					<!--   BEGIN PART III   -->
					<!--   BEGIN PART III HEADER   -->
					<!--<div class="styBB" style="float:none; clear:both; width:187mm;text-align:right;background-color:gray; border-bottom-width: 0px;border-top-width: 0px">-->
					<span style="width:187mm; text-align:right;">
						<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/ProgramServiceAccomplishment"/>
							<xsl:with-param name="containerHeight" select="3"/>
							<xsl:with-param name="headerHeight" select="5"/>
							<xsl:with-param name="containerID" select=" 'SPctn' "/>
						</xsl:call-template>
					</span>
					<!--</div>-->
					<div class="styTableContainer" style="height:52mm;width:187mm;" id="SPctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead"/>
							<tr style="height:6mm;">
								<td class="styTableCell" style="height: 4mm; border-color: black; border-bottom-width: 1px; border-top-width: 1px; border-left-width: 0px; border-right-width: 1px; text-align: left; width: 149mm; padding-top: 0; padding-bottom: 0;">
									<span class="styPartName">Part III</span>
									<span class="styPartDesc" style="width: 124mm">Statement of Program Service Accomplishments 
									<span class="styNormalText" style="font-size:6pt;"> (see the instructions for Part III.)</span>
									<span class="styNormalText" style="font-size: 7pt; width:124mm"> Check if the organization used Schedule O to respond to any question in this Part III
            <!-- Dotted Line -->
              <span class="styBoldText">
                <span style="width:16px"></span>.
                 <input type="checkbox" class="styIRS990EZCkBox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIII"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartIII</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIII"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartIII</xsl:with-param>
							</xsl:call-template>
                </label>
              </span>
              
        </span>
									</span>
								</td>
								<td class="styTableCell" style="text-align:left; padding-left: 2mm; border-color: black; border-top-width: 1px; border-right-width: 0px; width:38mm; vertical-align:top;" rowspan="6" colspan="2">
									<span style="text-align: center;font-weight: bold;padding-left:10mm;font-size:7pt">Expenses</span>
									<br/>
									<span style=" font-weight: normal; text-align: left; ">(Required for section 501(c)(3) and 501(c)(4) organizations and section 4947(a)(1) trusts; optional for others.)</span>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="float: none; border-color: black; border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px; width:149mm; font-weight: normal; text-align: left; ">
                What is the organization's primary exempt purpose?
                <span class="styIRS990EZUnderlinedBox" style="width: 148mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/PrimaryExemptPurpose"/>
										</xsl:call-template>
									</span>
								</td>
							</tr>
							<tr>
								<td class="styTableCellHeader" style="border-color: black; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; width:149mm; font-weight: normal; text-align: left; ">
               Describe the organization’s program service accomplishments for each of its three largest program services, as measured by expenses. In a clear and concise manner,  
                describe the services provided,   the number of persons benefited, and other relevant information for each program title.   
               </td>
							</tr>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/ProgramServiceAccomplishment">
									<xsl:if test="($Print != $Separated) or (count($IRS990EZData/ProgramServiceAccomplishment) &lt;=3)">
										<tr>
											<td class="styTableCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align:right; width: 149mm;vertical-align:top;">
												<span style="float: left; clear: both; text-align: left;">
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
														<xsl:with-param name="TargetNode" select="DescriptionProgramServiceAccom"/>
													</xsl:call-template>
													<br/>
													<span style="width:50mm;">(Grants $ <xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrantsAndAllocations"/>
														</xsl:call-template>) </span>
													<span>If this amount includes foreign grants, check here <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">...</span>
														<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
														<span style="width:2mm;"/>
														<input type="checkbox" class="styCkbox" name="Checkbox">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="IncludesForeignGrants"/>
																<xsl:with-param name="BackupName">IRS990ForeignGrants</xsl:with-param>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="IncludesForeignGrants"/>
																<xsl:with-param name="BackupName">IRS990ForeignGrants</xsl:with-param>
															</xsl:call-template>
														</label>
													</span>
													<span class="styIRS990EZTableCellPad"/>
												</span>
											</td>
											<td class="styTableCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; font-weight: bold; width: 6mm; text-align: center;vertical-align:bottom;">
												<xsl:choose>
													<xsl:when test="position()=1">28a</xsl:when>
													<xsl:when test="position()=2">29a</xsl:when>
													<xsl:when test="position()=3">30a</xsl:when>
													<xsl:when test="position() &gt;3">
														<span style="width: 1px"/>
													</xsl:when>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 32mm;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProgramServiceExpenses"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ProgramServiceAccomplishment) &gt;3)">
									<xsl:call-template name="AddRowsPartIII">
										<xsl:with-param name="NumOfRows" select="3"/>
										<xsl:with-param name="PACount" select="0"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($IRS990EZData/ProgramServiceAccomplishment) &lt;=3)">
									<xsl:call-template name="AddRowsPartIII">
										<xsl:with-param name="NumOfRows" select="3"/>
										<xsl:with-param name="PACount" select="count($IRS990EZData/ProgramServiceAccomplishment)"/>
									</xsl:call-template>
								</xsl:if>
								<tr>
									<td class="styTableCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align:right; width: 149mm; ">
										<span style="float:left; clear: none;text-align:left;">
										    <span style="float:left;">
											<b>31</b> Other program services (describe in Schedule O)
											</span>
                                            <span  class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
											<br/>
											<span style="width:50mm;">(Grants $ 
                <xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrantsAndAllocations"/>
												</xsl:call-template>) </span>
											<span>If this amount includes foreign grants, check here<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">...</span>
												<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
												<span style="width:2mm;"/>
												<input type="checkbox" class="styCkbox" name="Checkbox" id="empty4"/>
												<label for="empty4"/>
											</span>
										</span>
									</td>
									<td class="styTableCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; width:6mm; text-align: center; font-weight: bold;vertical-align:bottom;">31a</td>
									<td class="styTableCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 32mm">
										<span style="width: 1px"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="border-color: black; border-bottom-width: 0px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align:left; width: 149mm;">
										<span style="float:left;"><b>32 Total program service expenses</b>  (add lines 28a through 31a)</span>
                                        <span class="styDotLn" style="float:right;padding-right:1mm;">..............<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/></span>
									</td>
									<td class="styTableCell" style="border-color: black; border-bottom-width: 0px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; width:6mm; text-align: center; font-weight: bold">32</td>
									<td class="styTableCell" style="border-color: black; border-bottom-width: 0px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 32mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TotalProgramServiceExpenses"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS990EZData/ProgramServiceAccomplishment"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="headerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'SPctn' "/>
					</xsl:call-template>
					<!--   BEGIN PART IV HEADER   -->
					<div class="styBB" style="float:none; clear:both; width: 187mm;border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px;">
						<span class="styPartName" style="height:3.8mm;">Part IV</span>
						<span class="styPartDesc" style="font-size: 7pt; width: 163mm">
						List of Officers, Directors, Trustees, and Key Employees. <span class="styNormalText" style="font-size: 6pt">List each one even if not compensated.  (see the instructions for Part IV.)</span>
						<span class="styNormalText" style="font-size: 7pt; width:163mm"> 
						<span style="float:left;">Check if the organization used Schedule O to respond to any question in this Part IV</span>
							<!-- Dotted Line -->
							<span style="float:right;">
							 <span  class="styDotLn" style="padding-right:1mm;">..........</span>
								 <input type="checkbox" class="styIRS990EZCkBox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIV"/>
												<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartIV</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartIV"/>
												<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartIV</xsl:with-param>
											</xsl:call-template>
								</label>
						  </span>
					  </span>
              
 
						</span>
						<span style="width: 7mm; text-align:right; float:right;clear:none">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeKeyEmpl"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'ODctn' "/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END PART IV HEADER   -->
					<!--  BEGIN PART IV TABLE  -->
					<div class="styTableContainerNBB" style="height: 44mm;width: 187mm;" id="ODctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS990EZTableCellA" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center" scope="col">
										<b>(a)</b> Name and title</th>
									<th class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center" scope="col">
										<b>(b)</b> Average<br/>hours per week<br/>devoted to position</th>
									<th class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center" scope="col">
										<b>(c)</b>Reportable compensation <br/>(Forms W-2/1099-MISC)<br/>
										<b>(if not paid, enter -0-)</b>
									</th>
									<th class="styIRS990EZTableCellD" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center" scope="col">
										<b>(d)</b> Health benefits, contributions to employee benefit plans,<br/>and deferred compensation</th>
									<th class="styIRS990EZTableCellE" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; text-align: center" scope="col">
										<b>(e)</b> Estimated amount <br/>of other compensation</th>
								</tr>
							</thead>
							<tfoot/>
							<!-- Health benefits,
contributions to employee
benefit plans, and
deferred compensation-->
							<tbody>
								<xsl:for-each select="$IRS990EZData/OfficerDirectorTrusteeKeyEmpl">
									<xsl:if test="($Print != $Separated) or (count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl) &lt;=3)">
										<tr style="height: 10mm">
											<td class="styIRS990EZTableCellA" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
												<xsl:if test="PersonName != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonName"/>
													</xsl:call-template>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PersonName"/>
														<xsl:with-param name="TabOrder" select="6"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="BusinessName/BusinessNameLine1 != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="BusinessName/BusinessNameLine2 != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="BusinessName != ''">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="BusinessName"/>
														<xsl:with-param name="TabOrder" select="6"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressUS != ''">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="AddressUS"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="AddressForeign != ''">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="AddressForeign"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
												<span class="styIRS990EZTableCellPad"/>
											</td>
											<td class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Title"/>
												</xsl:call-template>
												<span style="width: 4px"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AvgHoursPerWkDevotedToPosition"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
											<td class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Compensation"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
											<td class="styIRS990EZTableCellD" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ContriToEmplBenefitPlansEtc"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
											<td class="styIRS990EZTableCellE" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExpenseAccountOtherAllowances"/>
												</xsl:call-template>
												<span class="styIRS990EZTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="($Print = $Separated) and (count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl) &gt;4)">
									<xsl:call-template name="AddRowsPartIV">
										<xsl:with-param name="NumOfRows" select="4"/>
										<xsl:with-param name="ODCount" select="0"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl) &lt;=4)">
									<xsl:call-template name="AddRowsPartIV">
										<xsl:with-param name="NumOfRows" select="4"/>
										<xsl:with-param name="ODCount" select="count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeKeyEmpl"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'ODctn' "/>
					</xsl:call-template>
					<!--   END PART IV TABLE   -->
					<!-- BEGIN FOOTER -->
					<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:70px"/>
    Form<span class="styBoldText" style="font-size: 8pt"> 990-EZ </span>(2011)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div style="width:187mm">
						<div style="float: left; clear: none">Form 990-EZ (2011)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN PART V HEADER   -->
					<div class="styBB" style="float: none; clear:both; width: 187mm; border-top-width: 1px; border-bottom-width: 1px; font-size:8pt">
						<span class="styPartName" style="float:left;clear:none;height: 4.5mm;width:15mm; padding-top: .5mm">
							<b>Part V</b>
						</span>
						<span class="styPartDesc" style="float:left;clear:none;height: 4.5mm;width:35mm;padding-top: .5mm">Other Information</span>
						<span class="styNormalText" style="float:left;clear:none;height: 4.5mm;width:126mm;padding-top: .5mm">(Note the Schedule A and personal benefit contract statement requirements in the </span>
						
						
						<span class="styNormalText" style="font-size: 7pt; width:185mm; padding-left: 18mm"> instructions for Part V.) Check if the organization used Schedule O to respond to any question in this Part V<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm"></span>    
              
                
                
                
                 <input type="checkbox" class="styIRS990EZCkBox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartV"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartV</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartV"/>
								<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartV</xsl:with-param>
							</xsl:call-template>
                </label>
              </span>
      
					</div>
					<!--   END PART V HEADER   -->
					<!--   BEGIN LINE 33   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox"></div>
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
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ActivitiesNotPreviouslyRpt"/>
								<xsl:with-param name="TabOrder" select="6"/>
							</xsl:call-template>
						</span>
						<span  class="styDotLn" style="float:right;padding-right:1mm;">...................</span>							
						</div>
						
						<div class="styLNRightNumBox" style="height:4.5mm;height:8mm;padding-top:4mm;">33</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ActivitiesNotPreviouslyRpt"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ActivitiesNotPreviouslyRpt"/>
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
						 <span style="float:left;">on Schedule O (see instructions).
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/MadeChangesToOrgnzngEtcDoc"/>
							</xsl:call-template></span>
					     <span   class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:6mm;">34</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:11mm;padding-top:6mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/MadeChangesToOrgnzngEtcDoc"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:11mm;padding-top:6mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/MadeChangesToOrgnzngEtcDoc"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 34   -->
					<!--   BEGIN LINE 35   
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">35</div>
						<div class="styLNDesc" style="width:150mm;height:12mm;">
						    <span style="float:left;white-space:nowrap;">If the organization had income from business activities, such as those reported on lines 2, 6a, and 7a (among </span>
						    <span style="float:left;white-space:nowrap;">others), but <b>not</b> reported on Form 990-T, explain in Schedule O why the organization did not report the income on </span>
						    <span style="float:left;white-space:nowrap;">Form 990-T. </span>
							
							<span  class="styDotLn" style="float:right;padding-right:1mm;">................................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;height:12mm;padding-top:4mm;background-color:lightgrey;border-bottom-width:0;">
							<span style="width:1px;"/>
						</div>
						
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:12mm;padding-top:4mm;background-color:lightgrey;border-bottom-width:0;"/>
						
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:12mm;padding-top:4mm; background-color:lightgrey;border-bottom-width:0;"/>
					</div>
					-->
					<!--   BEGIN LINE 35A   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">35a</div>
						<div class="styLNDesc" style="width:150mm;height:8mm;">
						<span style="float:left;">Did the organization have unrelated business gross income of $1,000 or more during the year from business </span>
						<span style="float:left;white-space:nowrap;">activities (such as those reported on lines 2, 6a, and 7a, among others)?
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationHadUBI"/>
							</xsl:call-template></span>
							<span  class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;height:8mm;padding-top:4mm;">35a</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationHadUBI"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationHadUBI"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   BEGIN LINE 35B   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:150mm;">
						If ‘Yes’ to line 35a, has the organization filed a <b>Form 990-T</b> for the year?  If ‘No,’ provide <span style="font-size:6pt;">an explanation in Schedule O.</span>						
					   </div>
						<div class="styLNRightNumBox" style="height:4.5mm; ">35b</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationFiled990T"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationFiled990T"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   BEGIN LINE 35C   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:150mm;height:11mm;">
						<span style="float:left;white-space:nowrap;">Was the organization a section 501(c)(4), 501(c)(5), or 501(c)(6) organization subject to section 6033(e) </span>
						<span style="float:left;white-space:nowrap;">notice, reporting, and proxy tax requirements during the year?  If "Yes," complete Schedule C, Part III.</span>
						<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/SubjectToProxyTax"/>
							</xsl:call-template>
                             <span class="styDotLn" style="float:right;padding-right:1mm;"></span>    
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">35c</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:11mm;padding-top:7mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/SubjectToProxyTax"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:11mm;padding-top:7mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/SubjectToProxyTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 35   -->
					<!--   BEGIN LINE 36   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox">36</div>
						<div class="styLNDesc" style="width:150mm;height:8mm;">
						 <span style="float:left;">Did the organization undergo a liquidation, dissolution, termination, or significant disposition of net assets during</span>
						 <span style="float:left;"> the year? If “Yes,” complete applicable parts of Schedule N
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationDissolvedEtc"/>
							</xsl:call-template></span>
						<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>    
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">36</div>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationDissolvedEtc"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/OrganizationDissolvedEtc"/>
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
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/DirectIndirectPoliticalExpend"/>
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
								<xsl:with-param name="TargetNode" select="$IRS990EZData/DidOrgFileForm1120POLThisYear"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/DidOrgFileForm1120POLThisYear"/>
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
								<xsl:with-param name="TargetNode" select="$IRS990EZData/MadeLoansToFromOfficers"/>
							</xsl:call-template>
						</div>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/MadeLoansToFromOfficers"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 38A   -->
					<!--   BEGIN LINE 38B   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:110mm;height:4mm;">
						     <span style="float:left;">If “Yes,” complete Schedule L, Part II and enter the total amount involved
    <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/LoansToFromOfficers"/>
							</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>   
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">38b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/LoansToFromOfficers"/>
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
							<i>Section 501(c)(7) organizations.</i> Enter:</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0;"/>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0;"/>
						<!--  Yes box  -->
						<div class="styIRS990EZYesNoBox" style="background-color:lightgrey;border-bottom-width:0;"/>
						<!--  No box  -->
						<div class="styIRS990EZYesNoBox" style="background-color:lightgrey;border-bottom-width:0;"/>
					</div>
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:110mm;">
						     <span style="float:left;">Initiation fees and capital contributions included on line 9</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>   
						</div>
						<div class="styLNRightNumBox">39a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/InitiationFeesAndCapitalContri"/>
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
								<xsl:with-param name="TargetNode" select="$IRS990EZData/GrossReceiptsForPublicUse"/>
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
							<i>Section 501(c)(3) organizations.</i> Enter amount of tax imposed on the organization during the year under:</div>
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
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TaxImposedUnderIRC4911"/>
								</xsl:call-template>
							</span>
    ; section 4912 <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span class="styIRS990EZUnderlinedBox" style="width: 29mm; text-align: right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TaxImposedUnderIRC4912"/>
								</xsl:call-template>
							</span>
    ; section 4955 <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span class="styIRS990EZUnderlinedBox" style="width: 29mm; text-align: right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TaxImposedUnderIRC4955"/>
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
							<span style="float:left;white-space:nowrap;"><i>Section 501(c)(3) and 501(c)(4) organizations.</i> Did the organization engage in any section 4958 excess benefit</span>
			                <span style="float:left;white-space:nowrap;">transaction during the year or did it engage in an excess benefit transaction in a prior year that has not been </span>
  		                     <span style="float:left;white-space:nowrap;">reported on any of its prior Forms 990 or 990-EZ? If “Yes,” complete Schedule L, Part I.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/EngagedInExcessBenefitTrans"/>
								<xsl:with-param name="TabOrder" select="9"/>
							</xsl:call-template></span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>   
						</div>
<!--					<div class="styIRS990EZYesNoBox" style="width:8mm;height:7.5mm;border-left-width:1px;border-bottom-width:0"/>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:7.5mm;border-top-width:0px;border-bottom-width:0"/>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:7.5mm;border-top-width:0px;border-bottom-width:0"/>-->
						<div class="styLNRightNumBox" style="padding-top:7mm;height:12mm;border-top-width:0px;">40b</div>
						<div class="styIRS990EZYesNoBox" style="height:12mm;border-top-width:0px;padding-top:3.5mm">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/EngagedInExcessBenefitTrans"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:12mm;border-top-width:0px;padding-top:3.5mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/EngagedInExcessBenefitTrans"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   BEGIN LINE 40C   -->
					<div class="styIRS990EZLineItem">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:150mm;">
						     <span style="float:left;white-space:nowrap;">Section 501(c)(3) and 501(c)(4) organizations. Enter amount of tax imposed on organization managers or
						     </span> 					
						     <span style="float:left;white-space:nowrap;">disqualified persons during the year under sections 4912, 4955, and 4958</span>
						     <span style="float:right;">
                             <span class="styDotLn" style="padding-right:1mm;">...</span>					
							<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet" style="padding-top: .75mm;"/>
							<span class="styIRS990EZUnderlinedBox" style="width: 33mm;text-align: right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/AmountOfTaxImposedOnOrgMgr"/>
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
					<div class="styIRS990EZLineItem" style="height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:150mm;font-size:7pt">
						     <span style="float:left;white-space:nowrap;">Section 501(c)(3) and 501(c)(4) organizations. Enter amount of tax on line 40c reimbursed by the organization</span>
						    <span style="float:right;">
                             <span class="styDotLn" style="padding-right:1mm;">....................</span>	
							<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet" style="padding-top: .75mm;"/>
							<span class="styIRS990EZUnderlinedBox" style="width: 34mm;text-align: right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/AmountOfTaxReimbursedByOrg"/>
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
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:4mm;">e</div>
							<div class="styLNDesc" style="width:150mm;height:5mm;padding-bottom:.5mm;">
							<span style="float:left;white-space:nowrap;"><i>All organizations.</i> At any time during the tax year, was the organization a party to a prohibited tax shelter</span>
							<span style="float:left;white-space:nowrap;"> transaction? If "Yes," complete Form 8886-T.	</span>    
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>   
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;border-top-width:1px;">40e</div>
						<div class="styIRS990EZYesNoBox" style="height:5mm;padding-top:1mm;border-top-width:1px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ProhibitedTaxShelterTrans"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:5mm;padding-top:1mm;border-top-width:1px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ProhibitedTaxShelterTrans"/>
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
							<xsl:if test="($Print = $Separated) and (count($IRS990EZData/StatesWhereCopyOfReturnIsFiled) &gt;25)">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/StatesWhereCopyOfReturnIsFiled"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($IRS990EZData/StatesWhereCopyOfReturnIsFiled) &lt;26))">
								<xsl:for-each select="$IRS990EZData/StatesWhereCopyOfReturnIsFiled">
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
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLeftNumBox" style="width:5mm;">42a</span>
						<span class="styIRS990EZLNLongDesc" style="width: 177mm;font-size:7pt">The organization's books are in care of
    <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 4px;"/>
							<span class="styIRS990EZUnderlinedBox" style="border-style: solid; width: 74mm;font-size:6pt;">
								<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/NamePerson">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/NamePerson"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/NameBusiness">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/NameBusiness/BusinessNameLine1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/NameBusiness/BusinessNameLine2">
									<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/NameBusiness/BusinessNameLine1 != ''">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/NameBusiness/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:if>
							</span>
    Telephone no.
    <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 4px"/>
							<span class="styIRS990EZUnderlinedBox" style=";border-style: solid; width: 24mm">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/TelephoneNumber"/>
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
								<xsl:if test="count($IRS990EZData/TheBooksAreInCareOf/AddressUS) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressUS/AddressLine1"/>
									</xsl:call-template>
									<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/AddressUS/AddressLine2 != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressUS/AddressLine2"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/AddressUS/City != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressUS/City"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/AddressUS/City != '' and $IRS990EZData/TheBooksAreInCareOf/AddressUS/State != ''">,</xsl:if>
									<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/AddressUS/State != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressUS/State"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
								<xsl:if test="count($IRS990EZData/TheBooksAreInCareOf/AddressForeign) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/AddressLine1"/>
									</xsl:call-template>
									<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/AddressLine2 != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/AddressLine2"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/City != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/City"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/City != '' and $IRS990EZData/TheBooksAreInCareOf/AddressForeign/ProvinceOrState != ''">,</xsl:if>
									<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/ProvinceOrState != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/ProvinceOrState"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/Country != ''">
										<span style="width: 6px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/Country"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
							</span>
						<span style="padding-left:2mm">
     ZIP + 4</span>
     <span style="padding-right:1mm;padding-left:2mm" >
    <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/></span>
							<span class="styIRS990EZUnderlinedBox" style="border-style: solid; width: 24mm;padding-left:2mm;">
								<xsl:if test="count($IRS990EZData/TheBooksAreInCareOf/AddressUS) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressUS/ZIPCode"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($IRS990EZData/TheBooksAreInCareOf/AddressForeign) &gt;0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/TheBooksAreInCareOf/AddressForeign/PostalCode"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</span>
					</div>
						<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;padding-top:2mm;">b</div>
						<div class="styLNDesc" style="width:150mm;height:9mm;padding-top:2mm;">
          At any time during the calendar year, did the organization have an interest in or a signature or other authority over a financial account in a foreign country (such as a bank account, securities account, or other financial account)?      
      </div>
						<div class="styIRS990EZYesNoBox" style="width:8mm;height:4.5mm;margin-top:2mm;border-left-width:0px;border-bottom-width:0;padding-top:1mm;">
							<span style="width:1px;"/>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;margin-top:2mm;border-top-width:1px;border-bottom-width:0;padding-top:1mm;">
							<b>Yes</b>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;margin-top:2mm;border-top-width:1px;border-bottom-width:0;padding-top:1mm;">
							<b>No</b>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-top-width:1px;">42b</div>
						<div class="styIRS990EZYesNoBox" style="height:5mm;border-top-width:1px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignFinancialAccount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:5mm;border-top-width:1px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignFinancialAccount"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">
          If “Yes,” enter the name of the foreign country:      
        <img src="{$ImagePath}/990_Bullet_Md.gif" alt="bullet"/>
							<span class="styFixedUnderline" style="width:80mm;float:none;padding-left:2mm;padding-top:0;padding-bottom:0;">
								<xsl:if test="(count($IRS990EZData/ForeignFinancialAccountCountry) &lt;= 1) or ((count($IRS990EZData/ForeignFinancialAccountCountry) &gt; 1) and ($Print != $Separated))">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignFinancialAccountCountry"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ForeignFinancialAccountCountry) &gt; 1) ">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignFinancialAccountCountry"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
						<div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
					</div>
					<xsl:if test="(count($IRS990EZData/ForeignFinancialAccountCountry) &gt; 1) and ($Print != $Separated)">
						<div style="width:187mm;float:none;">
							<xsl:for-each select="$IRS990EZData/ForeignFinancialAccountCountry">
								<xsl:if test="position() != 1">
									<div style="width:158mm;float:left;clear:none;">
								        <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
										<div style="width:62mm;float:left;clear:none;"/>	
									    <div class="styFixedUnderline" style="width:80mm;padding-left:2mm;padding-top:0;padding-bottom:0;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									     </div>									
									<div style="width:8mm;float:left;clear:none;"/>
									</div>
									<div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
									<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
									<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
								</xsl:if>
							</xsl:for-each>
						</div>
					</xsl:if>
					<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">
          See the instructions for exceptions and filing requirements for <b>Form TD F 90-22.1, Report of Foreign Bank and Financial Accounts.</b>
						</div>
						<div class="styShadingCell" style="width:8mm;height:8mm;"/>
						<div class="styShadingCell" style="width:10mm;height:8mm;"/>
						<div class="styShadingCell" style="width:10mm;height:8mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">
         At any time during the calendar year, did the organization maintain an office outside the U.S.?
      </div>
						<div class="styLNRightNumBox" style="height:4.5mm;">42c</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignOffice"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignOffice"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;"/>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">
         If “Yes,” enter the name of the foreign country:
        <img src="{$ImagePath}/990_Bullet_Md.gif" alt="bullet"/>
							<span class="styFixedUnderline" style="width:80mm;float:none;padding-left:2mm;">
								<xsl:if test="(count($IRS990EZData/ForeignOfficeCountry) &lt;= 1) or ((count($IRS990EZData/ForeignOfficeCountry) &gt; 1) and ($Print != $Separated))">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignOfficeCountry"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ForeignOfficeCountry) &gt; 1) ">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$IRS990EZData/ForeignOfficeCountry"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
					</div>
					<xsl:if test="(count($IRS990EZData/ForeignOfficeCountry) &gt; 1) and ($Print != $Separated)">
						<div style="width:187mm;">
							<xsl:for-each select="$IRS990EZData/ForeignOfficeCountry">
								<xsl:if test="position() != 1">
									<div class="styFixedUnderline" style="width:80mm;float:none;padding-left:2mm;margin-left:71mm;padding-top:0;padding-bottom:0;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
					</xsl:if>
					<!--   END LINE 42   -->
					<!--   BEGIN LINE 43   -->
					<div class="styIRS990EZLineItem">
						<span class="styIRS990EZLNLeftNumBox">43</span>
						<span class="styIRS990EZLNLongDesc" style="width: 179mm; font-size: 7pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/NECTFilingForm990"/>
									<xsl:with-param name="BackupName">IRS990EZNECTFilingForm990</xsl:with-param>
								</xsl:call-template>
    Section 4947(a)(1) nonexempt charitable trusts filing Form 990-EZ in lieu of <b>Form 1041&#151;</b>Check here </label>
							<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">.......</span>
							
							<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span style="padding-left:1mm">
							<input type="checkbox" class="styIRS990EZCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/NECTFilingForm990"/>
									<xsl:with-param name="BackupName">IRS990EZNECTFilingForm990</xsl:with-param>
								</xsl:call-template>
							</input></span>
						</span>
					</div>
					<div class="styIRS990EZLineItem" style="border-bottom-width: 0px">
						<span class="styIRS990EZLNLeftNumBox" style="font-size:6pt;width:4mm;"/>
						<span class="styIRS990EZLNLongDesc" style="width: 135mm; font-size:7pt">
						<span style="float:left;">and enter the amount of tax-exempt interest received or accrued during the tax year</span>
 <span  class="styDotLn" style="float:right;padding-right:1mm;">....<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/></span>
						</span>
						<span class="styLNRightNumBox" style="border-bottom-width: 1px">43</span>
						<div class="styLNAmountBox" style="border-bottom-width: 1px; width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/NECTFilingForm990/@amountOfInterest"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 43   -->
					<!-- BEGIN LINE 44a  -->
                     <div  style="width:187mm;margin-top:0.3mm;">
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
					<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox"  style="height:4.5mm;">44a</div>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;font-size: 6pt;">
      Did the organization maintain any donor advised funds during the year? <i>If "Yes," Form 990 must be completed instead of</i>
						</div>
						<!--<div class="styIRS990EZYesNoBox" style="width:8mm;height:4.5mm;margin-top:2mm;border-left-width:0px;border-bottom-width:1;padding-top:1.2mm;background-color:yellow;">
							<span style="width:1px;"/>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;margin-top:2mm;border-top-width:1px;border-bottom-width:1;padding-top:1mm;">
							<b>Yes</b>
						</div>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;margin-top:2mm;border-top-width:1px;border-bottom-width:1;padding-top:1mm;">
							<b>No</b>
						</div>-->
						<!--    <div class="styIRS990EZYesNoBox" style="width:8mm;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;border-bottom-width:0px;"/>-->
						  
	                      <div class="styShadingCell" style="height:4.5mm;width:8mm;"></div>
                          <div class="styShadingCell" style="height:4.5mm;width:10mm;"></div>
                          <div class="styShadingCell" style="height:4.5mm;width:10mm;"></div>   
					</div>
					<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="padding-left:3mm;"/>
						<div class="styLNDesc" style="width:150mm;font-size: 6pt;">
							<span style="float:left;"><i>Form 990-EZ.</i></span>
							<span  class="styDotLn" style="float:right;padding-right:1mm;">................................</span>
     </div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:0px;">44a</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-top-width:0px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/MaintainAnyDonorAdvisedFunds"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-top-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/MaintainAnyDonorAdvisedFunds"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 44a  -->
					<!--  BEGIN LINE 44b -->
									<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:150mm;">
        <span style="float:left;white-space:nowrap;">Did the organization operate one or more hospital facilities during the year?<i> If ‘Yes,’ Form 990 must be completed</i></span>
        <span style="float:left;white-space:nowrap;"><i>instead of Form990-EZ</i></span>
							<span  class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
</div>
						<!--     <div class="styIRS990EZYesNoBox" style="width:8mm;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;border-bottom-width:0px;"/> -->
						 <div class="styShadingCell" style="height:4.5mm;width:8mm;"></div>
      <div class="styShadingCell" style="height:4.5mm;width:10mm;"></div>
      <div class="styShadingCell" style="height:4.5mm;width:10mm;"></div> 
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px">44b</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/DoesOrgHaveHospital"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/DoesOrgHaveHospital"/>
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
							 <span  class="styDotLn" style="float:right;padding-right:1mm;">.........</span>    
                        </div>
		<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px;border-top-width:1px;">44c</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:1px;border-top-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/TanningServicesProvided"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:1px;border-top-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/TanningServicesProvided"/>
							</xsl:call-template>
						</div>
                        </div>
                     
					<!-- End 44c -->
					<!--  BEGIN LINE 44d -->
									<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:150mm;">
							<span style="float:left;">If 'Yes' to line 44c, has the organization filed a Form 720 to report these payments?  <i> If ‘No,’ provide an explanation</i> </span>
							<span style="float:left;"><i>in Schedule O</i></span>
							<span  class="styDotLn" style="float:right;padding-right:1mm;">................................</span>   
                        </div>
						 <div class="styShadingCell" style="height:4.5mm;width:8mm;"></div>
                         <div class="styShadingCell" style="height:4.5mm;width:10mm;"></div>
                         <div class="styShadingCell" style="height:4.5mm;width:10mm;"></div> 
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px">44d</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/Form720Filed"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/Form720Filed"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End 44d -->
					<!--  BEGIN LINE 45a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" >45a</div>
						<div class="styLNDesc" style="width:150mm;">
         <span style="float:left;">Did the organization have a controlled entity within 
          the meaning of </span><br></br><span style="float:left;">section 512(b)(13)?</span>
							<span  class="styDotLn" style="float:right;padding-right:1mm;">............................</span>    
      			          </div>
						
						<div class="styLNRightNumBox" style="height:7.5mm;border-bottom-width:1px;padding-top:3mm;">45a</div>
						<div class="styIRS990EZYesNoBox" style="height:7.5mm;border-bottom-width:1px;padding-top:3mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrgControlledEntity"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:7.5mm;border-bottom-width:1px;padding-top:3mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrgControlledEntity"/>
							</xsl:call-template>
						</div>
				</div>
					
					<!--  END LINE 45a  -->
					<!--  BEGIN LINE 45b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" >45b</div>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">
         <span style="float:left;">Did the organization receive any payment from or engage in any transaction with a controlled entity within the 
meaning of section 512(b)(13)? If "Yes," Form 990 and Schedule R may need to be completed instead </span>
         <span style="float:left;">of Form990-EZ (see instructions)</span>
         <span  class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							
     
     
</div>
						<!--     <div class="styIRS990EZYesNoBox" style="width:8mm;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;border-bottom-width:0px;"/> -->
						 <div class="styShadingCell" style="height:7.5mm;width:8mm;padding-top:3mm;"></div>
      <div class="styShadingCell" style="height:7.5mm;width:10mm;padding-top:3mm;"></div>
      <div class="styShadingCell" style="height:7.5mm;width:10mm;padding-top:3mm;"></div> 
						<div class="styLNRightNumBox" style="height:7.5mm;border-bottom-width:0px;padding-top:3mm;">45b</div>
						<div class="styIRS990EZYesNoBox" style="height:7.5mm;border-bottom-width:0px;padding-top:3mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrgControlledEntity"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:7.5mm;border-bottom-width:0px;padding-top:3mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrgControlledEntity"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 45a  -->
					<!-- BEGIN FOOTER -->
					<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:70px"/>
    Form<span class="styBoldText" style="font-size: 8pt"> 990-EZ </span>(2011)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
					
		<!--BEGIN HEADER-->
					<div class="styBB" style="width:187mm; padding-bottom:.5mm;">
						<div style="float: left; clear: none">Form 990-EZ (2011)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!--END HEADER-->
					
			<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;"></div>
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
						<div class="styLNLeftNumBox" >46</div>
						<div class="styLNDesc" style="width:150mm;">
                             <span style="float:left;">Did the organization engage, directly or indirectly, in political campaign activities on behalf of or in opposition to</span>
                             <span style="float:left;">candidates for public office? If “Yes,” complete Schedule C, Part I.
                                 <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/EngagePoliticalCmpgnActivities"/>
								 </xsl:call-template></span>
                             <span  class="styDotLn" style="float:right;padding-right:1mm;">..............</span>   
</div>
						<!--     <div class="styIRS990EZYesNoBox" style="width:8mm;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styIRS990EZYesNoBox" style="width:10mm;height:4.5mm;border-bottom-width:0px;"/> -->
						 <div class="styShadingCell" style="height:4.5mm;width:8mm;"></div>
                         <div class="styShadingCell" style="height:4.5mm;width:10mm;"></div>
                         <div class="styShadingCell" style="height:4.5mm;width:10mm;"></div> 
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px">46</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrgControlledEntity"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990EZYesNoBox" style="height:4.5mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrgControlledEntity"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 46  -->
					
					<!--   BEGIN PART VI HEADER   -->
					<div class="styBB" style="float: none; clear:both; width: 187mm; border-top-width: 1px; border-bottom-width: 1px; font-size:8pt">
						<div class="styPartName" style="float:left;clear:none;height: 4.5mm;width:15mm; padding-top: .5mm">
							Part VI
						</div>
						<div class="styPartDesc" style="float:left;clear:none;height: 4.5mm;width:172mm;padding-top: .5mm">Section 501(c)(3) organizations and section 4947(a)(1) nonexempt charitable trusts only.
						<span class="styNormalText" style="height: 4.5mm;padding-top: .5mm;">All section 501(c)(3) organizations and section 4947(a)(1) nonexempt charitable trusts must answer questions 47-49b and 52.
						<span class="styNormalText" style="font-size: 7pt; width:163mm;">
						<span style="float:left;"> Check if the organization used Schedule O to respond to any question in this Part VI   </span>       
                        <span style="float:right;">
					    <span class="styDotLn" style="padding-right:1mm;">...........</span>   					
					         <input type="checkbox" class="styIRS990EZCkBox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartVI"/>
									<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartVI</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/InfoInScheduleOPartVI"/>
									<xsl:with-param name="BackupName">IRS990EZInfoInScheduleOPartVI</xsl:with-param>
								</xsl:call-template>
					        </label>
                         </span>              
                       </span>
					</span>
					</div></div>
					<!--   END PART VI HEADER   -->
					<div style="width:187mm;float:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;"></div>
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
									<xsl:with-param name="TargetNode" select="$IRS990EZData/EngageInLobbyingActivities"/>
								</xsl:call-template></span>
                                 <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>           
                            </div>
							<div class="styLNRightNumBox" style="height:9.5mm;border-top-width:0px;padding-top:5mm;">47</div>
							<div class="styIRS990EZYesNoBox" style="height:9.5mm;border-top-width:0px;padding-top:5mm;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/EngageInLobbyingActivities"/>
								</xsl:call-template>
							</div>
							<div class="styIRS990EZYesNoBox" style="height:9.5mm;border-top-width:0px;padding-top:5mm;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/EngageInLobbyingActivities"/>
								</xsl:call-template>
							</div>
						<div style="width:187mm;float:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;">48</div>
							<div class="styLNDesc" style="width:150mm;height:4.5mm;padding-top:2mm;">
							<span style="float:left;">
                                 Is the organization a school described in section 170(b)(1)(A)(ii)? <span style="font:italic">If "Yes,"  complete Schedule E </span>
                               
                               <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OperatingSchool"/>
								</xsl:call-template>
								</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>   
     			
							</div>
							<div class="styLNRightNumBox" style="height:6mm;border-top-width:0px;padding-top:1mm;">48</div>
							<div class="styIRS990EZYesNoBox" style="height:6mm;border-top-width:0px">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OperatingSchool"/>
								</xsl:call-template>
							</div>
							<div class="styIRS990EZYesNoBox" style="height:6mm;border-top-width:0px">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/OperatingSchool"/>
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
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TrnsfrsExemptNonCharRelatedOrg"/>
								</xsl:call-template>
							</div>
							<div class="styIRS990EZYesNoBox" style="height:6mm;border-top-width:0px">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/TrnsfrsExemptNonCharRelatedOrg"/>
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
									<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrgSection527Org"/>
								</xsl:call-template>
							</div>
							<div class="styIRS990EZYesNoBox" style="height:6mm;border-top-width:0px">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$IRS990EZData/RelatedOrgSection527Org"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- BEGIN LINE 50 -->
						<div style="width:187mm;float:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;">50</div>
							<div class="styLNDesc" style="width:177mm;height:4.5mm;padding-top:2mm;">
      Complete this table for the organization's five highest compensated employees (other than officers, directors, trustees and key employees) who each received more than $100,000 of compensation from the organization. If there is none, enter "None."
     </div>
						</div>
						<div style="float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/CompensationOfHighestPaidEmpl"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="containerID" select="'HDctn'"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
						<div class="styTableContainerNBB" style="height: 44mm;width: 187mm;" id="HDctn">
							<!--print logic-->
							<xsl:call-template name="SetInitialState"/>
							<!--end-->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS990EZTableCellA" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(a)</b> Name and title of each employee paid more than $100,000</th>
										<th class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(b)</b> Average<br/>hours per week<br/>devoted to position</th>
										<th class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(c)</b> Reportable compensation<br/> (Forms W-2/1099-MISC)
										</th>
										<th class="styIRS990EZTableCellD" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(d)</b> Health benefits, contributions to employee benefit plans, and deferred compensation</th>
										<th class="styIRS990EZTableCellE" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(e)</b> Estimated amount of other compensation </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$IRS990EZData/CompensationOfHighestPaidEmpl">
										<xsl:if test="($Print != $Separated) or (count($IRS990EZData/CompensationOfHighestPaidEmpl) &lt;=3)">
											<tr style="height: 10mm">
												<td class="styIRS990EZTableCellA" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
													<xsl:if test="Name != ''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="Name"/>
														</xsl:call-template>
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="Name"/>
															<xsl:with-param name="TabOrder" select="6"/>
														</xsl:call-template>
													</xsl:if>
													
													<xsl:if test="AddressUS != ''">
														<br/>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="AddressUS"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="AddressForeign != ''">
														<br/>
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="AddressForeign"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Title"/>
													</xsl:call-template>
													<span style="width: 4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AverageHoursPerWeek"/>
													</xsl:call-template>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Compensation"/>
													</xsl:call-template>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellD" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="EmployeeBenefits"/>
													</xsl:call-template>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellE" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ExpenseAccount"/>
													</xsl:call-template>
													<span class="styIRS990EZTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="($Print = $Separated) and (count($IRS990EZData/CompensationOfHighestPaidEmpl) &gt;4)">
										<xsl:call-template name="AddRowsLine50">
											<xsl:with-param name="NumOfRows" select="4"/>
											<xsl:with-param name="ODCount" select="0"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="(count($IRS990EZData/CompensationOfHighestPaidEmpl) &lt;=4)">
										<xsl:call-template name="AddRowsLine50">
											<xsl:with-param name="NumOfRows" select="4"/>
											<xsl:with-param name="ODCount" select="count($IRS990EZData/CompensationOfHighestPaidEmpl)"/>
										</xsl:call-template>
									</xsl:if>
								</tbody>
								
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeKeyEmpl"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="containerID" select=" 'HDctn' "/>
						</xsl:call-template>
						
						<div style="width:187mm;float:none;">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;width:10mm;padding-left:4mm;">f</div>
							
					<div class="styLNDesc" style="width:177mm;height:4.5mm;padding-top:2mm;">
                         <span style="float:left;">Total number of other employees paid over $100,000  </span>
                         <span style="float:right;">
                         <span class="styDotLn" style="padding-right:1mm;">.................</span>    
		                 <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>     						
									<span class="styIRS990EZUnderlinedBox" style="text-align: right;width:28mm ">									
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS990EZData/TotNumberOfOthEmplPaidOver100k"/>
										</xsl:call-template>
										</span>
						 </span>
						</div>
					</div><br />
						<!-- END LINE 50 -->	
						<!--  BEGIN LINE 51 -->
						<div style="width:187mm;float:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;">51</div>
							<div class="styLNDesc" style="width:177mm;height:4.5mm;padding-top:2mm;">
      Complete this table for the organization's five highest compensated independent contractors who each received more than $100,000 of compensation from the organization. If there is none, enter "None."
     </div>
						</div>
						<div style="float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS990EZData/CompOfHghstPaidCntrctProfSer"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="containerID" select="'CDctn'"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
						<div class="styTableContainerNBB" style="height: 44mm;width: 187mm;" id="CDctn">
							<!--print logic-->
							<xsl:call-template name="SetInitialState"/>
							<!--end-->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS990EZTableCellAA" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(a)</b> Name and address of each independent contractor paid more than $100,000</th>
										<th class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(b)</b> Type of service</th>
										<th class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; text-align: center">
											<b>(c)</b> Compensation<br/>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$IRS990EZData/CompOfHghstPaidCntrctProfSer">
										<xsl:if test="($Print != $Separated) or (count($IRS990EZData/CompOfHghstPaidCntrctProfSer) &lt;=3)">
											<tr style="height: 10mm">
												<td class="styIRS990EZTableCellAA" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
													
													<xsl:if test="NamePerson != ''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NamePerson"/>
														</xsl:call-template>
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="NamePerson"/>
															<xsl:with-param name="TabOrder" select="6"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="NameBusiness/BusinessNameLine1 != ''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine1"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="NameBusiness/BusinessNameLine2 != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine2"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="NameBusiness!= ''">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="NameBusiness"/>
															<xsl:with-param name="TabOrder" select="6"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="AddressUS != ''">
														<br/>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="AddressUS"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="AddressForeign != ''">
														<br/>
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="AddressForeign"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TypeOfService"/>
													</xsl:call-template>
													<span style="width: 4px"/>
													<span class="styIRS990EZTableCellPad"/>
												</td>
												<td class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Compensation"/>
													</xsl:call-template>
													<span class="styIRS990EZTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="($Print = $Separated) and (count($IRS990EZData/CompOfHghstPaidCntrctProfSer) &gt;4)">
										<xsl:call-template name="AddRowsLine51">
											<xsl:with-param name="NumOfRows" select="4"/>
											<xsl:with-param name="ODCount" select="0"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="(count($IRS990EZData/CompOfHghstPaidCntrctProfSer) &lt;=4)">
										<xsl:call-template name="AddRowsLine51">
											<xsl:with-param name="NumOfRows" select="4"/>
											<xsl:with-param name="ODCount" select="count($IRS990EZData/CompOfHghstPaidCntrctProfSer)"/>
										</xsl:call-template>
									</xsl:if>
								</tbody>
																	
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$IRS990EZData/OfficerDirectorTrusteeKeyEmpl"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="containerID" select=" 'CDctn' "/>
						</xsl:call-template>
					</div>
					
					
	<div style="width:187mm;float:none;">
		<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;width:10mm;padding-left:4mm;">d</div>
							
			<div class="styLNDesc" style="width:177mm;height:4.5mm;padding-top:2mm;">
			 <span style="float:left;">Total number of other independent contractors each receiving over $100,000</span>
			 <span class="styDotLn" style="padding-right:2mm;">..........</span>      
			  <img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
					<span style="padding-left:3mm">
					<span class="styIRS990EZUnderlinedBox" style="text-align: right; width: 28mm;">
								<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$IRS990EZData/TotNumCntrctPdOver100KProfSer"/>
					</xsl:call-template>
			 </span></span>
		</div>
	</div>
					<!-- END LINE 51 -->
					
					
					
					
<!-- Part III 2 -->
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">52</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;padding-left:3mm">
                 <span style="float:left;">Did the organization complete Schedule A? <b>NOTE:</b>All Section 501(c)(3) organizations and 4947(a)(1) nonexempt charitable trusts </span>
                 <span style="float:left;">must attach a completed Schedule A </span>
                 <!-- Dotted Line -->
               <span style="float:right;">
              <span class="styDotLn" style="padding-right:1mm;">.....................</span>   
              <span style="width:2mm;padding-left:8mm;"/>
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/FiledScheduleA"/>
                  <xsl:with-param name="BackupName">IRS990EZFiledScheduleAYes</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/FiledScheduleA"/>
                  <xsl:with-param name="BackupName">IRS990EZFiledScheduleAYes</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText">   Yes</span>
              </label>
              <span style="width:2mm;">
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/FiledScheduleA"/>
                </xsl:call-template>
              </span>
              <input type="checkbox" class="styCkbox" name="Checkbox" onclick="return false;" id="dummyidnonexempt">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/FiledScheduleA"/>
                  <xsl:with-param name="BackupName">IRS990EZFiledScheduleANo</xsl:with-param>
                </xsl:call-template>
              </input>
              <label for="dummyidnonexempt">
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$IRS990EZData/FiledScheduleA"/>
                  <xsl:with-param name="BackupName">IRS990EZFiledScheduleANo</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText">   No</span>
              </label>
             
              </span>
            </div>
              </div>					
										<!-- BEGIN Signature Section -->
					<div class="styIRS990EZLineItem" style="width:187mm;border-bottom-width: 1px"/>
					<!-- Implementing the signature section in table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;clear:both;">
						<tr>
							<td rowspan="5" style="width:15mm;font-size: 8pt;font-weight:bold;border-right:1 solid black;border-bottom:1 solid black;">Sign Here</td>
							<div style="width:187mm;">
							<div class ="styPartDesc" style="width:187mm;font-size:6pt;padding-left:0mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than officer) is based on all information of which preparer has any knowledge.
							</div>
<div class="styBB" style="width:187mm;"/>
</div>
						</tr>
						<tr>
							<td rowspan="2" style="padding-left:1mm;">
								<img style="width:2mm;height:8mm;" src="{$ImagePath}/990EZ_Bullet_Jumbo.gif" alt="JumboBullet"/>
							</td>
						<td style="width:113mm;border-bottom:1 solid black;vertical-align:bottom;border-right:1 solid black;height:6mm">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width:53mm;border-bottom:1 solid black;vertical-align:bottom;padding-left:1mm;height:6mm">
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
							<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;padding-top:1mm;">
								<img style="width:2mm;height:8mm;" src="{$ImagePath}/990EZ_Bullet_Jumbo.gif" alt="JumboBullet"/>
							</td>
							<td style="border-bottom:1 solid black;vertical-align:bottom;" colspan="2">
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
							<td style="vertical-align:top;border-bottom:1 solid black;" colspan="2">Type or print name and title</td>
						</tr>
					</table>
					<!-- End Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the preparer section in table -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
            <div style="width:22.75mm;padding-top:4mm;float:left;clear:none;">
              <span class="styMainTitle" style="font-size:11pt;">
                  Paid
                  preparer
                  use only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:6mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
                
                Print/type preparer's name<br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="PopulateReturnHeaderPreparer"/>
               <xsl:with-param name="BackupName">PopulateReturnHeaderPreparerPersonName</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:6mm;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
                Preparer's signature<br/>
                <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
              </div>
                <div class="styLNDesc" style="height:6mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                   <!-- <xsl:with-param name="BackupName">PopulateReturnHeaderPreparer</xsl:with-param>-->
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:6mm;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                    <input class="styCkbox" type="checkbox" style="width:4mm;">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
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
                <div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
										</xsl:call-template>
                    
                  </div>
                </div>
                <div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
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
                <div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                  <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">Country</xsl:with-param>
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
                        <xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
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
                        <xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCode</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">Country</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>-->
                  </div>
                </div>
                <div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
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
						<span class="styIRS990EZLNLongDesc2" style="width: 187mm; font-size: 7pt;">
							<!-- <label><xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$RtnHdrData/Officer/AuthorizeThirdParty" /><xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param></xsl:call-template> -->
    May the IRS discuss this return with the preparer shown above? See instructions
	<!-- </label> -->
							<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">.........</span>
							<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>
							<span class="styIRS990EZNBSP"/>
							<input type="checkbox" class="styIRS990EZCkBox">
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
							<input type="checkbox" class="styIRS990EZCkBox">
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
						<span style="float: right">Form <span class="styBoldText">990-EZ</span> (2011)</span>
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
						<!--Special Condition Description -->
<br />
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

<xsl:for-each select="$IRS990EZData/SpecialConditionDescription">

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
<!-- End Left Over Table -->

		
					<!--  repeating data for part III  -->
					<xsl:if test="(count($IRS990EZData/ProgramServiceAccomplishment) &gt;3) and ($Print = $Separated)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 990EZ, Part III - Statement of Program Service Accomplishments</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="padding-top: 6mm; width:149mm; text-align: left">
                Describe what was achieved in carrying out the organization's exempt purposes.  In a clear and concise manner,  
                describe the services provided,   the number of persons benefited, and other relevant information for each program title.            
              </th>
									<th class="styDepTblCell" style="width:38mm" colspan="2">
                Expenses<br/> (Required for 501(c)(3) and 501(c)(4) organizations and 4947(a)(1) trusts; optional for others.)
              </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/ProgramServiceAccomplishment">
									<xsl:if test="($Print = $Separated) or (count($IRS990EZData/ProgramServiceAccomplishment) &gt;=3)">
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
														<xsl:with-param name="TargetNode" select="DescriptionProgramServiceAccom"/>
													</xsl:call-template>
													<br/>
													<span style="width:50mm;">(Grants $ <xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrantsAndAllocations"/>
														</xsl:call-template>) </span>
													<span>If this amount includes foreign grants, check here <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">...</span>
														<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
														<span style="width:2mm;"/>
														<input type="checkbox" class="styCkbox" name="Checkbox">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="IncludesForeignGrants"/>
																<xsl:with-param name="BackupName">IRS990ForeignGrants</xsl:with-param>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="IncludesForeignGrants"/>
																<xsl:with-param name="BackupName">IRS990ForeignGrants</xsl:with-param>
															</xsl:call-template>
														</label>
													</span>
												</span>
												<span class="styIRS990EZTableCellPad"/>
											</td>
											<td class="styDepTblCell" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; font-weight: bold; width: 6mm; text-align: center;vertical-align:bottom;">
												<xsl:choose>
													<xsl:when test="position()=1">28a</xsl:when>
													<xsl:when test="position()=2">29a</xsl:when>
													<xsl:when test="position()=3">30a</xsl:when>
													<xsl:when test="position() &gt;3">
														<span style="width: 1px"/>
													</xsl:when>
												</xsl:choose>
											</td>
											<td class="styDepTblCell" style="text-align: right; border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProgramServiceExpenses"/>
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
					<xsl:if test="(count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl) &gt;3) and ($Print = $Separated)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 990EZ, Part IV - List of Officers, Directors, Trustees, and Key Employees</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center">
										<b>(A)</b> Name and address</th>
									<th class="styDepTblCell" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center">
										<b>(B)</b> Title and average<br/>hours per week<br/>devoted to position</th>
									<th class="styDepTblCell" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center">
										<b>(C)</b> Compensation<br/>
										<b>(If not paid,<br/>enter -0-.)</b>
									</th>
									<th class="styDepTblCell" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align: center">
										<b>(D)</b> Contributions to<br/>employee benefit plans &amp;<br/>deferred compensation</th>
									<th class="styDepTblCell" scope="col" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; text-align: center">
										<b>(E)</b> Expense<br/>account and<br/>other allowances</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/OfficerDirectorTrusteeKeyEmpl">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 =1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align: left; width: 58mm">
											<xsl:if test="PersonName != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonName"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PersonName"/>
													<xsl:with-param name="TabOrder" select="6"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1 != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine2 != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName != ''">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="BusinessName"/>
													<xsl:with-param name="TabOrder" select="6"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="AddressUS != ''">
												<br/>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressUS"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="AddressForeign != ''">
												<br/>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressForeign"/>
												</xsl:call-template>
											</xsl:if>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="text-align: left; width: 35mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Title"/>
											</xsl:call-template>
											<span style="width: 4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AvgHoursPerWkDevotedToPosition"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="text-align: right; width: 30mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Compensation"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="text-align: right; width: 34mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ContriToEmplBenefitPlansEtc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="text-align: right; width: 30mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenseAccountOtherAllowances"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/StatesWhereCopyOfReturnIsFiled) &gt;25)">
						<br/>
						<span class="styRepeatingDataTitle">Form 990EZ, Part V, Line 41</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead"/>
							<tbody>
								<tr class="styDepTblRow1">
									<td class="styDepTblCell" style="text-align: left; width:45mm">List the states with which a copy of this return is filed: </td>
									<td class="styDepTblCell" style="text-align: left; width: 139mm">
										<xsl:for-each select="$IRS990EZData/StatesWhereCopyOfReturnIsFiled">
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
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ForeignFinancialAccountCountry) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 990EZ, Part V, Line 42b -  If “Yes,” enter the name of the foreign country:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col">Country</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/ForeignFinancialAccountCountry">
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
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/ForeignOfficeCountry) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 990EZ, Part V, Line 42c -  If “Yes,” enter the name of the foreign country:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col">Country</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/ForeignOfficeCountry">
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
					<xsl:if test="(count($IRS990EZData/CompensationOfHighestPaidEmpl) &gt;3) and ($Print = $Separated)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"> Form 990EZ, Part VI, Line 50 - Complete this table for the organization's five highest compensated employees (other than officers, directors, trustees, and key employees) who received more than $100,000 of compensation from the organization. If there are none, enter "None."
</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS990EZTableCellA" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
										<b>(a)</b> Name and address of each employee paid more than $100,000</th>
									<th class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
										<b>(b)</b> Title and average<br/>hours per week<br/>devoted to position</th>
									<th class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
										<b>(c)</b> Compensation<br/>
									</th>
									<th class="styIRS990EZTableCellD" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
										<b>(d)</b> Contributions to<br/>employee benefit plans &amp;<br/>deferred compensation</th>
									<th class="styIRS990EZTableCellE" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; text-align: center">
										<b>(e)</b> Expense<br/>account and<br/>other allowances</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/CompensationOfHighestPaidEmpl">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 =1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align: left; width: 58mm">
											<xsl:if test="Name != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Name"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="Name"/>
													<xsl:with-param name="TabOrder" select="6"/>
												</xsl:call-template>
											</xsl:if>
											<!--
    <xsl:if test="BusinessName/BusinessNameLine1 != ''">
        <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1" />
        </xsl:call-template>
    </xsl:if>
    <xsl:if test="BusinessName/BusinessNameLine2 != ''"><br/>
        <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2" />
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="BusinessName != ''">
      <xsl:call-template name="SetFormLinkInline">
      <xsl:with-param name="TargetNode" select="BusinessName"/>
      <xsl:with-param name="TabOrder" select="6"/>
    </xsl:call-template>
    </xsl:if>    
	-->
											<xsl:if test="AddressUS != ''">
												<br/>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressUS"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="AddressForeign != ''">
												<br/>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressForeign"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;width:35mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Title"/>
											</xsl:call-template>
											<span style="width: 4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AverageHoursPerWeek"/>
											</xsl:call-template>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;width:30mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Compensation"/>
											</xsl:call-template>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellD" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px;width:34mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EmployeeBenefits"/>
											</xsl:call-template>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellE" style="border-color: black; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px;width:30mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenseAccount"/>
											</xsl:call-template>
											<span class="styIRS990EZTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<!--      <xsl:if test="($Print = $Separated) and (count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl) &gt;4)">
            <xsl:call-template name="AddRowsPartIV">
              <xsl:with-param name="NumOfRows" select="4"></xsl:with-param>
              <xsl:with-param name="ODCount" select="0"></xsl:with-param>
            </xsl:call-template>
            </xsl:if>
            <xsl:if test="(count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl) &lt;=4)">
            <xsl:call-template name="AddRowsPartIV">
                <xsl:with-param name="NumOfRows" select="4"></xsl:with-param>
                <xsl:with-param name="ODCount" select="count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl)"></xsl:with-param>
              </xsl:call-template>
            </xsl:if>  -->
							</tbody>
							
						</table>
						<br/>
					</xsl:if>
					<!--  end of repeating data line 50 -->
					<!--  repeating data for line 51  -->
					<xsl:if test="($Print = $Separated) and (count($IRS990EZData/CompOfHghstPaidCntrctProfSer) &gt;=3)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 990EZ, Part VI, Line 51 - Complete this table for the organization's five highest compensated independent contractors that received more than $100,000 of compensation from the organization. If there are none, enter "None."
     </span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS990EZTableCellAA" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
										<b>(a)</b> Name and address of each independent contractor paid more than $100,000</th>
									<th class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
										<b>(b)</b> Type of service</th>
									<th class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 1px; text-align: center">
										<b>(c)</b> Compensation<br/>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS990EZData/CompOfHghstPaidCntrctProfSer">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 =1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align: left; width: 58mm">
											<xsl:if test="NamePerson != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NamePerson"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="NamePerson"/>
													<xsl:with-param name="TabOrder" select="6"/>
												</xsl:call-template>
											</xsl:if>
											<!--
      <xsl:if test="NameBusiness != ''">
        <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="NameBusiness" />
        </xsl:call-template>
      <xsl:call-template name="SetFormLinkInline">
      <xsl:with-param name="TargetNode" select="NameBusiness"/>
      <xsl:with-param name="TabOrder" select="6"/>
    </xsl:call-template>
    </xsl:if> 
	-->
											<xsl:if test="NameBusiness/BusinessNameLine1 != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine1"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="NameBusiness/BusinessNameLine2 != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="NameBusiness != ''">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="NameBusiness"/>
													<xsl:with-param name="TabOrder" select="6"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="AddressUS != ''">
												<br/>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressUS"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="AddressForeign != ''">
												<br/>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressForeign"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellB" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TypeOfService"/>
											</xsl:call-template>
											<span style="width: 4px"/>
											<span class="styIRS990EZTableCellPad"/>
										</td>
										<td class="styIRS990EZTableCellC" style="border-color: black; border-bottom-width: 1px; border-right-width: 1px; border-left-width: 0px; border-top-width: 0px; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Compensation"/>
											</xsl:call-template>
											<span class="styIRS990EZTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<!--      <xsl:if test="($Print = $Separated) and (count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl) &gt;4)">
            <xsl:call-template name="AddRowsPartIV">
              <xsl:with-param name="NumOfRows" select="4"></xsl:with-param>
              <xsl:with-param name="ODCount" select="0"></xsl:with-param>
            </xsl:call-template>
            </xsl:if>
            <xsl:if test="(count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl) &lt;=4)">
            <xsl:call-template name="AddRowsPartIV">
                <xsl:with-param name="NumOfRows" select="4"></xsl:with-param>
                <xsl:with-param name="ODCount" select="count($IRS990EZData/OfficerDirectorTrusteeKeyEmpl)"></xsl:with-param>
              </xsl:call-template>
       </xsl:if>  -->
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
