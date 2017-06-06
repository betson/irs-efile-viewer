<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2008 rel. 2 (http://www.altova.com) by Mary Crawford (IRS) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="IRS8888Template.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8888Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8888Data" select="$RtnDoc/IRS8888"/>
	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="Content-Type" content="text/html"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8888Data)"/>
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
				<meta name="Description" content="IRS Form 8888"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8888Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8888">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;padding-bottom:0mm;">
						<div class="styFNBox" style="width:31mm;height:23mm;padding-bottom:0mm;">
							<div style="padding-top:3mm;padding-bottom:3mm;font-size:8pt;">
            Form<span class="styFormNumber">  8888</span>
							</div>
							<!-- <div style="padding-top:1.3mm;padding-bottom:0mm;font-size:12pt;">-->
							<div class="styAgency" style="font-size:7.5pt;padding-bottom:0mm;">Department of  the Treasury<br>
            Internal Revenue Service</br>
							</div>
						</div>
						<div class="styFTBox" style="width:120mm;height:4mm;padding-bottom:0mm;">
							<div class="styMainTitle" style="font-size: 12pt;height:4mm;padding-top:3mm;padding-bottom:1.5mm;">Allocation of Refund (Including Savings Bond Purchases)</div>
							<div class="styFBT" style="height:1mm;margin-top:1mm;padding-bottom:1.5mm;font-size:7.5pt;">
								<img src="{$ImagePath}/8888_Bullet_Md.gif" alt="Bullet"/> See instructions.</div>
							<img src="{$ImagePath}/8888_Bullet_Md.gif" alt="Bullet"/>
							<b> Attach to Form 1040, Form 1040A, Form 1040EZ,  Form 1040NR, <br/>
              Form 1040NR-EZ,  Form 1040-SS, or Form 1040-PR.</b>
						</div>
						<div class="styTYBox" style="width:32mm;height:23mm;text-align:left;">
							<div class="styOMB" style="width:35.5mm;height:2mm;font-size:7pt;padding-left:2mm;padding-top:3mm;padding-bottom:0mm;">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="width:32mm;height:1mm;margin-left:3mm;
          padding-left:3mm;padding-bottom:0mm;">20<span class="styTYColor">10</span>
							</div>
							<div style="width:32mm;height:1mm;margin-left:3mm; text-align:left;font-size:7pt;padding-bottom:0mm;border:">
          Attachment<br/> Sequence No.  <b>  56</b>
							</div>
						</div>
					</div>
					<!-- BEGIN Occupation TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:135mm;font-size:7.5pt;font-weight:normal;padding-top:0mm;padding-bottom:0mm;height:8mm;">
          Name(s) shown on return<br/>
							<div style="padding-top:2mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styIRS8888SSNBox" style="width:45mm;font-size:7pt;font-weight:normal;padding-top:0mm;padding-bottom:0mm;height:8mm;">
							<b>Your social security number</b>
							<br/>
							<div style="padding-top:2mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part 1-->
					<div style="width:187mm;font-family:Arial;font-size:9.5pt;" class="styBB">
						<div class="styPartName" style="height:4mm;font-size:9.5pt;">Part I</div>
						<div class="styPartDesc" style="font-weight:normal;font-size:9.5pt;">
							<b>Direct  Deposit</b>
							<br/>
							<span style="font-size:8.5pt;">
							Complete this part if you want us to directly deposit a portion of your tax refund to one or more accounts.
							</span>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;">
						<!--<xsl:if test="($Print != $Separated) or (count($Form8888Data/DirectDepositInfoGroup) &lt;= 3)">
							<xsl:for-each select="$Form8888Data/DirectDepositInfoGroup">-->
								<xsl:variable name="pos" select="position()"/>
								<xsl:if test="(position() mod 3)=1">
									<div class="styIRS8888TableContainer" id="Spcctn">
										<xsl:call-template name="SetInitialState"/>
										<!-- Beginning of 1a -->
										<div style="width:187mm;font-size:8.5pt;font-family:Arial;height:3mm;">
											<div class="styLNLeftNumBox" style="width:8mm;padding-left:1.7mm;height:3mm">
												<xsl:number value="($pos)" format="1"/>a</div>
											<div class="styLNDesc" style="width:140.3mm;height:3mm">Amount to be deposited in first account
          <!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:0mm;padding-right:.5mm;">.....................</span>
												<!--
												<span class="styBoldText">
													<span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
             <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
         </span>
-->
											</div>
											<div class="styLNLeftNumBox" style="height:2mm;width:7mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;padding-bottom:.5mm;padding-top:.5mm;">
												<xsl:number value="($pos)" format="1"/>a</div>
											<div class="styLNAmountBox" style="font-size:7.5pt;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;width:31mm;clear:right;height:2mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/DirectDepositRefundAmt"/>
												</xsl:call-template>
											</div>
											<!-- blank line space -->
											<div style=" width:148.2mm;float:left; clear:none;"/>
											<div class="styShadingCellRB" style="width:7mm; border-style:solid; border-right-width:1px; border-left-width:1px; border-top-width:0px; border-bottom-width:0px; border-color:black; background-color:#B8B8B8; float:left; clear:none;height:1mm;"/>
											<div class="styLNAmountBox" style="height:1mm;font-size:7pt;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;width:31mm;float:left;clear:right;padding-top:0mm;padding-left:0mm;padding-bottom:0mm;"/>
										</div>
										<!-- End of Step 1a -->
										<!-- Beginning of b -->
										<div style="width:187mm;font-size:8.5pt;height:8mm;font-family:Arial;">
											<div class="styLNLeftNumBox" style="padding-right:3mm;text-align:right;padding-top:.5mm;height:8mm;">b</div>
											<div class="styLNDesc" style="width:140.2mm;padding-top:0mm;padding-bottom:0mm;height:8mm;">
												<div class="styLNDesc" style="width:28mm;">Routing number</div>
												<!-- call routing number -->
												<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/RoutingTransitNumber"/>
														<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber1</xsl:with-param>
													</xsl:call-template>
												</span>
												<span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left;clear:none;"/>
												<span style="height:6mm;padding-bottom:1mm;float:left;clear:none;">
													<img src="{$ImagePath}/8888_Bullet_Lg.gif" alt="Bullet"/>
												</span>
												<span style="width:.3mm;"/>
												<span class="styBoldText" style="font-size:8pt;padding-bottom:3mm;">c</span>
												<span style="width:3.5mm;"/>
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup"/>
												</xsl:call-template>
												<input type="checkbox" class="styCkbox" style="width:4mm;">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
														<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1mm;"/>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
													</xsl:call-template>
													<span style="font-size:8pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial">Checking</span>
												</label>
												<span style="width:4mm;"/>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup"/>
													</xsl:call-template>
												</span>
												<input type="checkbox" class="styCkbox" style="width:4mm;">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
														<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1mm;"/>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
													</xsl:call-template>
													<span style="font-size:8pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial">Savings</span>
												</label>
											</div>
											<!--<span style="width:3mm;" />-->
											<div class="styShadingCellRB" style="width:7mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:#B8B8B8;float:left;clear:right;"/>
											<!--<span style="width:5mm;float:left;"/>-->
											<div class="styLNAmountBox" style="width:31mm;padding-top:0mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;padding-top:1mm;border-bottom-width:0px;height:8mm;"/>
										</div>
										<!-- End of 1b -->
										<!-- Line 1d -->
										<div style="width:187mm;font-size:8.5pt;height:8mm;font-family:Arial;">
											<div class="styLNLeftNumBox" style="padding-right:3mm;font-size:8.5pt;text-align:right;padding-top:1mm;font-family:Arial;height:8mm;">d</div>
											<div class="styLNDesc" style="height:8mm;width:28mm;padding-top:1mm;">Account number</div>
											<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/DepositorAccountNumber"/>
													<xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
												</xsl:call-template>
											</span>
											<span style="width:28.3mm;float:left;"/>
											<div class="styShadingCellRB" style="width:7mm;height:8mm;text-align:center;background-color:#B8B8B8;"/>
											<!--<div class="styLNAmountBox"  style="height:8mm;border-right-width:0px;border-left-width:0px;border-bottom-width:0px;"/>-->
											<!---->
											<!--
-->
										</div>
										<!-- END of 1d -->
										<!-- Beginning of 2a -->
										<div class="BB" style="width:187mm;font-size:8.5pt;height:4mm;font-family:Arial;">
											<div class="styLNLeftNumBox" style="width:6mm;padding-top:2mm;padding-right:3mm;padding-left:1.7mm;height:4mm;padding-bottom:0mm;">
												<xsl:number value="($pos + 1)" format="1"/>a</div>
											<div class="styLNDesc" style="width:140.4mm;padding-top:2mm;height:4mm;padding-bottom:0mm;">Amount to be deposited in second account
          <!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:0mm;padding-right:.5mm;clear:none;">....................</span>
												<!--
												<span class="styBoldText">
													<span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
             <span style="width:8px"/>.
            <span style="width:8px"/>.
         </span>
-->
											</div>
											<div class="styLNLeftNumBox" style="height:4mm;width:7mm;padding-top:1.5mm;text-align:center;border-style:solid; border-right-width:1px; border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">
												<xsl:number value="($pos + 1)" format="1"/>a</div>
											<div class="styLNAmountBox" style="height:4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;padding-top:1.5mm;padding-bottom:.5mm;width:31mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/DirectDepositRefundAmt"/>
												</xsl:call-template>
											</div>
											<!-- blank line space -->
											<div class="styLNDesc" style="height:2mm; width:148.2mm;float:left; clear:none;font-size:7pt;"/>
											<div class="styShadingCellRB" style="height:5mm; width:7mm; border-style:solid; border-right-width:1px; border-left-width:1px; border-top-width:0px; border-bottom-width:0px; border-color:black; background-color:#B8B8B8; float:left; clear:none;"/>
											<div class="styLNAmountBox" style="height:2mm;font-size:7pt;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;width:31mm;float:left;"/>
										</div>
										<!-- End of Step 2a -->
										<!-- Beginning of b -->
										<div style="width:187mm;font-size:8.5pt;height:8mm;font-family:Arial;">
											<div class="styLNLeftNumBox" style="padding-top:1mm;padding-right:3mm;text-align:right;">b</div>
											<div class="styLNDesc" style="width:139.5mm;padding-top:0mm;padding-bottom:0mm;">
												<div class="styLNDesc" style="width:28mm;padding-top:1mm;">Routing number</div>
												<!-- call routing number -->
												<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/RoutingTransitNumber"/>
														<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber1</xsl:with-param>
													</xsl:call-template>
												</span>
												<span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left; clear: none;"/>
												<span style="height:.5mm;padding-bottom:1mm;float:left;clear:none;">
													<img src="{$ImagePath}/8888_Bullet_Lg.gif" alt="Bullet"/>
												</span>
												<span style="width:.3mm;"/>
												<span class="styBoldText" style="font-size:8pt;padding-bottom:3mm;">c</span>
												<span style="width:3.5mm;"/>
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup"/>
												</xsl:call-template>
												<input type="checkbox" class="styCkbox" style="width:4mm;">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
														<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1mm;"/>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
													</xsl:call-template>
													<span style="font-size:8.5pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial;">Checking</span>
												</label>
												<span style="width:4mm;"/>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup"/>
													</xsl:call-template>
												</span>
												<input type="checkbox" class="styCkbox" style="width:4mm;">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd1</xsl:with-param>
														<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1mm;"/>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd1</xsl:with-param>
													</xsl:call-template>
													<span style="font-size:8.5pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial">Savings</span>
												</label>
											</div>
											<span style="width:7mm;height:8mm;padding-top:4mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;
    		border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:B8B8B8;"/>
											<span style="width:31mm;height:8mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;
 		border-bottom-width:0px;border-color:black;"/>
										</div>
										<!--end of Line 2b -->
										<!-- Line 2d -->
										<div style="width:187mm;font-size:8.5pt;height:8mm;font-family:Arial;">
											<div class="styLNLeftNumBox" style="height:6mm;padding-top:1mm;;padding-right:3mm;font-size:8.5pt;text-align:right;">d</div>
											<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;font-family:Arial">Account number</div>
											<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/DepositorAccountNumber"/>
													<xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
												</xsl:call-template>
											</span>
											<span style="width:27.5mm;"/>
											<span style="width:7mm;height:10mm;padding-top:4mm;text-align:center;border-style:solid;
border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:B8B8B8"/>
											<span style="width:31mm;height:10mm;padding-top:4mm;border-style:solid; border-right-width:0px; border-left-width:0px;border-top-width:0px;border-bottom-width:0px;border-color:black;"/>
										</div>
										<!-- End of 2d -->
										<!-- Beginning of 3a -->
										<div class="BB" style="width:187mm;font-size:8.5pt;height:4mm;font-family:Arial;padding-bottom:0mm;">
											<div class="styLNLeftNumBox" style="width:6mm;height:4mm;padding-right:3mm; padding-left:1.7mm;padding-top:0mm;padding-bottom:0mm;font-size:8.5pt;">
												<xsl:number value="($pos + 2)" format="1"/>a</div>
											<div class="styLNDesc" style="width:140.4mm;height:4mm;padding-bottom:0mm;padding-top:0mm;">Amount to be deposited in third account
          <!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:0mm;padding-right:.5mm;height:4mm;">.....................</span>
												<!--
												<span class="styBoldText">
													<span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
             <span style="width:8px"/>.
            <span style="width:8px"/>.
             <span style="width:8px"/>.
         </span>
-->
											</div>
											<div class="styLNLeftNumBox" style="height:4mm;width:7mm;text-align:center;font-size:8.5pt;border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;padding-top:0mm;padding-bottom:0mm;">
												<xsl:number value="($pos + 2)" format="1"/>a</div>
											<div class="styLNAmountBox" style="height:4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;width:31mm;padding-top:0mm;padding-bottom:0mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/DirectDepositRefundAmt"/>
												</xsl:call-template>
											</div>
											<!-- blank line space -->
											<div class="styLNDesc" style="height:2mm; width:148.2mm;float:left;clear:none;padding-top:0mm;padding-bottom:0mm;"/>
											<div class="styShadingCellRB" style="height:4.5mm; width:7mm; border-style:solid; border-right-width:1px; border-left-width:1px; border-top-width:0px; border-bottom-width:0px; border-color:black; background-color:#B8B8B8; float:left;clear:none;padding-top:0mm;padding-bottom:0mm;"/>
											<div class="styLNAmountBox" style="height:2mm;font-size:7pt;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;width:31mm;float:left;padding-top:0mm;padding-bottom:0mm;;clear:right;"/>
										</div>
										<!-- End of Step 3a -->
										<!-- Beginning of b -->
										<div style="width:187mm;font-size:8.5pt;height:8mm;font-family:Arial;">
											<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;padding-right:3mm;text-align:right;">b</div>
											<div class="styLNDesc" style="width:139.5mm;padding-top:0mm;padding-bottom:0mm;">
												<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;">Routing number</div>
												<!-- call routing number -->
												<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/RoutingTransitNumber"/>
														<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber1</xsl:with-param>
													</xsl:call-template>
												</span>
												<span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left; clear: none;"/>
												<span style="height:.5mm;padding-bottom:1mm;float:left;clear:none;">
													<img src="{$ImagePath}/8888_Bullet_Lg.gif" alt="Bullet"/>
												</span>
												<span style="width:.3mm;"/>
												<span class="styBoldText" style="font-size:8pt;padding-bottom:3mm;">c</span>
												<span style="width:3.5mm;"/>
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup"/>
												</xsl:call-template>
												<input type="checkbox" class="styCkbox" style="width:4mm;">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd2</xsl:with-param>
														<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1mm;"/>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd2</xsl:with-param>
													</xsl:call-template>
													<span style="font-size:8.5pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial">Checking</span>
												</label>
												<span style="width:4mm;"/>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup"/>
													</xsl:call-template>
												</span>
												<input type="checkbox" class="styCkbox" style="width:4mm;">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
														<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1mm;"/>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/AccountTypeCd"/>
														<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
													</xsl:call-template>
													<span style="font-size:8.5pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial">Savings</span>
												</label>
											</div>
											<span style="width:7mm;height:8mm;padding-top:4mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;
    		border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:B8B8B8;"/>
											<span style="width:31mm;height:8mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;
 		border-bottom-width:0px;border-color:black;"/>
										</div>
										<!-- Line 3d -->
										<div style="width:187mm;font-size:8.5pt;height:8mm;font-family:Arial" class="styBB">
											<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;padding-right:3mm;font-size:8.5pt;text-align:right;">d</div>
											<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;">Account number</div>
											<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/DepositorAccountNumber"/>
													<xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
												</xsl:call-template>
											</span>
											<span style="width:27.5mm;"/>
											<span style="width:7mm;height:4mm;padding-top:4mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:B8B8B8"/>
											<span style="width:32mm;height:4mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;
 		border-bottom-width:0px;border-color:black;"/>
										</div>
										<!-- End of 3d -->
									</div>
								</xsl:if>
							<!--</xsl:for-each>
						</xsl:if>-->
					</div>
					<!--Part II-->
					<div style="width:187mm;font-size:9.5pt;" class="styBB">
						<div class="styBB">
							<div class="styPartName" style="height:4mm;font-family:Arial;font-size:9.5pt;">Part II</div>
							<div class="styPartDesc" style="font-weight:normal;border-bottom-width:1px;padding-bottom:.5mm;font-size:9.5pt;">
								<b>U.S. Series I Savings Bond Purchases</b>
								<br/>
								<span style="font-size:8pt;font-family:Arial;">Complete this part if you want to buy paper bonds with a portion of your refund.</span>
							</div>
						</div>
						<!-- Caution image -->
						<div style="height:8mm;float:left;padding-left:0mm;">
							<img src="{$ImagePath}/8880_Caution.gif" alt="Caution" style="float:left;padding-top:.5mm;"/>
							<div class="styLNDesc" style="width:170mm;float:left;font-weight:normal; font-size: 7.5pt;font-style:italic;border-top-width:1px;padding-left:1mm;">
							If a name is entered on lines 5c or 6c below, co-ownership will be assumed unless the beneficiary box is checked.<br/>
						See instructions for more details.	
							</div>
						</div>
					</div>
					<!--Line 4 -->
					<div style="width:187mm;font-size:8.5pt;height:8mm;padding-top:0mm;font-family:Arial;">
						<div class="styLNLeftNumBox" style="width:6mm;padding-left:1mm">4</div>
						<div class="styLNDesc" style="width:140.9mm;padding-left:.7mm;">Amount to be used for bond purchases for yourself (and your spouse, if filing jointly)
          <!--Dotted Line-->
							<span class="styDotLn" style="float:none;padding-left:2.5mm;padding-right:.5mm;">......</span>
							<!--
							<span class="styBoldText">
								<span style="width:8px"/>.
            <span style="width:8px"/>.
			<span style="width:8px"/>.
			<span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
             <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
         </span>
-->
						</div>
						<div class="styLNLeftNumBox" style="height:2mm;width:7mm;padding-top:0mm;padding-left:1mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">
		4</div>
						<div class="styLNAmountBox" style="height:4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;clear:right;width:31mm;font-family:Arial;padding-top:.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8888Data/RefundUsedForBondPurchasesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 4-->
					<!-- Line 5a- 5c -->
					<div style="width:187mm;font-size:8.5pt;height:3mm;padding-top:0mm;font-family:Arial;">
						<!--<xsl:if test="($Print != $Separated) or (count($Form8888Data/SavingsBondPurchaseInfoGrp) &lt;= 2)">
							<xsl:for-each select="$Form8888Data/ SavingsBondPurchaseInfoGrp">-->
								<xsl:variable name="bondpos" select="position()"/>
								<xsl:if test="(position() mod 2)=1">
									<!--								<div class="styIRS8888TableContainer" id="Spcctn">
										<xsl:call-template name="SetInitialState"/>    
     -->
									<!--Line 5a -->
									<div style="width:187mm;font-size:8.5pt;height:4mm;font-family:Arial;">
										<div class="styLNLeftNumBox" style="width:6mm;padding-right:3mm;padding-bottom:0mm;height:4mm;">5a</div>
										<div class="styLNDesc" style="width:140.2mm;padding-bottom:0mm;height:4mm;">Amount to be used to buy bonds for yourself, your spouse, <b>or</b> someone else
          <!--Dotted Line-->
											<span class="styDotLn" style="float:none;padding-left:.5mm;padding-right:.5mm;">.........</span>
											<!--
										<span class="styBoldText">
											<span style="width:8px"/>.
            
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
             <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
         
         </span>
-->
										</div>
										<!--<span style="width:7mm;height:2mm;padding-top:4mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:B8B8B8"></span>-->
										<!--  ************************************* -->
										<!--								<div class="styLNLeftNumBox" style="height:2mm;width:7mm;padding-top:1mm;padding-left:.25mm;text-align:center;border-style:solid;
		border-right-width:0px;border-left-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black;font-size:7pt;"/>

						<div class="styLNAmountBox" style="height:2mm;font-size:7.5pt;border-left:0px;border-right-width:0px;padding-bottom:1mm;padding-top:1mm;clear:right"/>
-->
										<div class="styLNLeftNumBox" style="width:7mm;border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:1px;height:4mm;padding-top:0mm;border-bottom-width:1px;border-color:black;background-color:white;text-align:center;">5a
<!--										<span style="width:6mm;text-align:center;font-size:7pt;padding-top:0mm;padding-bottom:0mm;background-color: white">5a</span>
-->
										</div>
										<div class="styLNAmountBox" style="width:31mm;font-size:7.5pt;border-left-width:0px;border-bottom-width:1px;border-right-width:0px;height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8888Data/SavingsBondPurchaseInfoGrp[$bondpos]/BondPurchaseAmt"/>
											</xsl:call-template>
										</div>
										<!--<div class="styIRS8888ColBox" style="height:4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;padding-bottom:.5mm;padding-top:2.5mm;"> -->
										<!--<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode"  select="$Form8888Data/DirectDepositInfoGroup[$pos]/DirectDepositRefundAmt" /></xsl:call-template>-->
										<!--</div>-->
									</div>
									<!-- End of line 5a -->
									<!-- Beginning of 5b -->
									<div style="width:187mm;font-size8.5pt;height:12mm;padding-top:0mm;font-family:Arial;">
										<div class="styLNLeftNumBox" style="width:7.2mm;padding-right:2.8mm;text-align:right;padding-top:0mm;">b</div>
										<div class="styLNDesc" style="width:139.5mm;padding-bottom:0mm;padding-top:0mm;">Enter the owner's name (First Last) for the bond registration

	<!--	<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;">Routing number</div>-->
											<span class="styNameForBondBox" style="text-align:left;padding-left:2mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8888Data/SavingsBondPurchaseInfoGrp[$bondpos]/BondOwnerNm"/>
													<xsl:with-param name="BackupName">IRS1040BondOwnerName1</xsl:with-param>
												</xsl:call-template>
											</span>
											<span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left; clear: none;"/>
											<span style="height:.5mm;padding-bottom:1mm;float:left;clear:none;"/>
										</div>
									</div>
									<!-- end line 5b -->
									<!-- line 5c -->
									<div style="width:187mm;font-size:8.5pt;height:3mm;padding-top:0mm;padding-bottom:0mm;font-family:Arial;">
										<div class="styLNLeftNumBox" style="width:7.2mm;padding-right:2.8mm;text-align:right;">c		  </div>
										<div class="styLNDesc" style="width:160mm;">
											If you would like to add a co-owner or beneficiary, enter the name here (First Last). If beneficiary, also check here
         <img src="{$ImagePath}/8888_Bullet_Sm.gif" alt="Bullet"/>
											<!--<span class="styBoldText" style="font-size:8.5pt;padding-bottom:3mm;"/>-->
											<!-- <span style="width:4.5mm;" />-->
											<span style="width:.5mm;"/>
											<input type="checkbox" alt="alt" class="styCkbox" style="width:4mm;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8888Data/SavingsBondPurchaseInfoGrp[$bondpos]/BeneficiaryInd"/>
													<xsl:with-param name="BackupName">IRS8888BeneficiaryIndicator</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
									</div>
									<div style="width:187mm;font-size:8.5pt;height:4.5mm;padding-top:0mm;font-family:Arial;">
										<div class="styLNLeftNumBox" style="width:7.5mm;padding-right:3mm;font-size:8pt;text-align:right;"/>
										<!--	<div class="styLNDesc" style="width:28mm;height:2mm;font-size:7pt;padding-top:1mm;">Account number</div>-->
										<span class="styNameForBondBox" style="float:left;text-align:left;padding-left:2mm;clear:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8888Data/SavingsBondPurchaseInfoGrp[$bondpos]/BondCoOwnerOrBeneficiaryNm"/>
												<xsl:with-param name="BackupName">IRS1040BondCoOwnerOrBeneficiaryName</xsl:with-param>
											</xsl:call-template>
										</span>
										<span style="width:27.5mm;"/>
										<!--<span style="width:7mm;height:4mm;padding-top:4mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:B8B8B8"></span>
				 
 		<span style="width:32mm;height:4mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;
 		border-bottom-width:0px;border-color:black;"></span>-->
									</div>
									<!-- End of line 5a- 5c -->
									<!-- Line 6a - 6c -->
									<!-- Line 6a -->
									<div style="width:187mm;font-size:8.5pt;height:3mm;font-family:Arial;">
										<div class="styLNLeftNumBox" style="width:6mm;padding-right:3mm">6a</div>
										<div class="styLNDesc" style="width:140.2mm;">Amount to be used to buy bonds for yourself, your spouse, <b>or</b> someone else
          <!--Dotted Line-->
											<span class="styDotLn" style="float:none;padding-left:.5mm;padding-right:.5mm;">.........</span>
											<!--
											<span class="styBoldText">
												<span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
             <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            
           
         </span>
-->
										</div>
										<!--<span style="width:7mm;height:2mm;padding-top:4mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:B8B8B8"></span>-->
										<!--  ************************************* -->
										<div class="styLNLeftNumBox" style="width:6mm;height:2mm;width:7mm;padding-top:0mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;font-size:8.5pt;">
	
		6a</div>
										<div class="styLNAmountBox" style="height:4.4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;clear:right;width:31mm;padding-top:0mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8888Data/SavingsBondPurchaseInfoGrp[$bondpos + 1]/BondPurchaseAmt"/>
											</xsl:call-template>
											<!--</div>-->
										</div>
									</div>
									<!-- Line 6b -->
									<div style="width:187mm;font-size9pt;font-family:Arial">
										<div class="styLNLeftNumBox" style="width:7.5mm;height:4mm;padding-top:0mm;padding-right:2.8mm;text-align:right;">b</div>
										<div class="styLNDesc" style="width:139.5mm;padding-top:0mm;padding-bottom:0mm;">Enter the owner's name (First Last) for the bond registration

	<!--	<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;">Routing number</div>-->
											<span class="styNameForBondBox" style="text-align:left;padding-left:2mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8888Data/SavingsBondPurchaseInfoGrp[$bondpos + 1]/BondOwnerNm"/>
													<xsl:with-param name="BackupName">IRS1040BondOwnerName2</xsl:with-param>
												</xsl:call-template>
											</span>
											<span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left; clear: none;"/>
											<span style="height:.5mm;padding-bottom:1mm;float:left;clear:none;"/>
										</div>
									</div>
									<!-- end line 6b -->
									<!-- line 6c -->
									<div style="width:187mm;font-size:8.5pt;height:3mm;font-family:Arial">
										<div class="styLNLeftNumBox" style="width:7.5mm;padding-right:2.8mm;text-align:right;">c		  </div>
										<div class="styLNDesc" style="width:160mm;">
											If you would like to add a co-owner or beneficiary, enter the name here (First Last). If beneficiary, also check here
         <img src="{$ImagePath}/8888_Bullet_Sm.gif" alt="Bullet"/>
											<span style="width:.5mm;"/>
											<input type="checkbox" alt="alt" class="styCkbox" style="width:4mm;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8888Data/SavingsBondPurchaseInfoGrp[$bondpos + 1]/BeneficiaryInd"/>
													<xsl:with-param name="BackupName">IRS8888BeneficiaryIndicator2</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
									</div>
									<div style="width:187mm;font-size:8.5pt;height:8mm;padding-top:0mm;" class="styBB">
										<div class="styLNLeftNumBox" style="width:7.5mm;padding-right:3mm;font-size:8pt;text-align:right;"/>
										<!--	<div class="styLNDesc" style="width:28mm;height:2mm;font-size:7pt;padding-top:1mm;">Account number</div>-->
										<span class="styNameForBondBox" style="text-align:left;padding-left:2mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8888Data/SavingsBondPurchaseInfoGrp[$bondpos + 1]/BondCoOwnerOrBeneficiaryNm"/>
												<xsl:with-param name="BackupName">IRS1040BondCoOwnerOrBeneficiaryName2</xsl:with-param>
											</xsl:call-template>
										</span>
										<!-- <span style="width:20.5mm;"/> -->
									</div>
								</xsl:if>
							<!--</xsl:for-each>
						</xsl:if>-->
					</div>
					<!-- End of 6c -->
					<!-- End of line 6a - 6c -->
					<!--End of Part II -->
					<!-- Part III -->
					<div style="width:187mm;font-size:9.5pt;padding-bottom:.5mm;font-family:Arial;" class="styBB">
						<div class="styPartName" style="height:4mm;font-family:Arial;font-size:9.5pt;">Part III</div>
						<div class="styPartDesc" style="font-weight:normal;font-size:9.5pt;">
							<b>Paper Check</b>
							<br/>
							<span style="font-size:8pt;">Complete this part if you want a portion of your refund to be sent to you as a check.</span>
						</div>
					</div>
					<!-- Line 7 -->
					<div style="width:187mm;font-size:8.5pt;height:4.5mm;padding-top:0mm;font-family:Arial;" class="styBB">
						<div class="styLNLeftNumBox" style="width:7.5mm;padding-right:3mm">7</div>
						<div class="styLNDesc" style="width:140.2mm;">Amount to be refunded by check
          <!--Dotted Line-->
							<span class="styDotLn" style="float:none;padding-left:2.5mm;padding-right:.5mm;">.......................</span>
							<!--						<span class="styBoldText">
								<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
						<span style="width:8px"/>.
			
         </span>
-->
						</div>
						<div class="styLNLeftNumBox" style="height:4.5mm;width:7mm;padding-top:.5mm;border-style:solid;text-align:center;	border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;font-size:8.5pt;">
		7</div>
						<div class="styIRS8888ColBox" style="height:4.5mm;font-size:7.5pt;border-left:0px;border-right-width:0px;padding-top:.5mm;border-bottom:0mm;width:30mm;padding-left:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8888Data/RefundByCheckAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end of line 7 -->
					<!-- End of Part III -->
					<!-- Part IV -->
					<div style="width:187mm;font-family:Arial;" class="styBB">
						<div class="styPartName" style="height:4mm;font-family:Arial;font-size:9.5pt;">Part IV</div>
						<div class="styPartDesc" style="font-weight:normal;font-size:9.5pt;font-family:Arial;">
							<b>Total Allocation of Refund</b>
							<br/>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styBB" style="width:187mm;font-family:Arial;font-size:8.5pt;height:12mm;">
						<div class="styLNLeftNumBox" style="width:7.5mm;height:3.5mm;padding-top:1mm;">8</div>
						<div class="styLNDesc" style="width:140.2mm;height:3.5mm;padding-top:1mm;padding-bottom:0mm;">
		 Add lines 1a, 2a, 3a, 4, 5a, 6a, and 7. 
		The total must equal the amount shown on Form 1040, line <br/>74a; Form 1040A,  line 46a; Form 1040EZ, line 12a; Form 1040NR, line 70a; Form 1040NR-EZ, line<br/> 23a; Form 1040-SS, line 12a; or Form 1040-PR, line 12a
		
		<span class="styDotLn" style="float:none;padding-right:.5mm;padding-left:1.5mm;padding-bottom:0mm;">...............</span>
							<!-- <span class="styBoldText">
			<span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
             <span style="width:8px"/>.
         </span>  
 -->
						</div>
						<div class="styIRS8888ColBoxGrey" style="height:9mm;width:7mm;padding-top:8.5mm;border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;
  		border-bottom-width:0px;border-color:black;">
							<span style="width:6mm;height:2.3mm;text-align:center;padding-top:0mm;background-color: white">8</span>
						</div>
						<div class="styIRS8888ColBox" style="width:30mm;height:8mm;font-size:7.5pt;padding-top:8mm;padding-left:4mm;border-left-width:0px;border-bottom-width:0px;border-right-width:0px;padding-bottom:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8888Data/TotalAllocationOfRefundAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End line 8 -->
					<!-- End part IV-->
					<!-- End signature part -->
					<div style="width:187mm;font-size:6.5pt;padding-top:1mm;padding-bottom:4mm;">
						<div style="width:114mm;font-weight:bold;float:left;clear:none;font-size:7.5pt;">For Paperwork Reduction Act Notice, see your tax return instructions.</div>
						<div style="width:30mm;float:left;clear:none;">Cat. No. 21858A</div>
						<div style="width:30mm;text-align:right;font-size:6pt;float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">8888  </span> (2010)</div>
					</div>
					<div class="pageEnd" style="width:187mm;"/>
					<!-- END of Page 1 -->
					<!-- BEGIN Left Over Table -->
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
							<xsl:with-param name="TargetNode" select="$Form8888Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
